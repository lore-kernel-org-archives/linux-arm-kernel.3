Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51144C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fihApEIuWNDTZ5SUlcQlAQ9Qq6nixx8s0KB4soooB8M=; b=i1P7QJyBAmulJyuCW4pHGpj5k0
	aHqK8coETanyXnlqI2ffZM886p02Xa9rYT0MhXI/pEpU/0Q7GY2BUtvHILdBxb7eg5EyY3aLcXsC7
	W5mheTiogTpBjtMnnR9yd3MuMa7ESQWhNP/J3oHQlxgtIgd4Ftv0glj0FFqQLx31rE/zvkWoJcksY
	de7aKZ9mF3y26BakviFwSMvqopWcZVMhovqof66zlIY9VWhYO/oBwrQQtXH5ccXwFWmwthGwxFitZ
	BnKi1rESpRwSUprAr7/FSopDHTG8r8Ot0fZOILcAuq0igbq8ETS8bEAwTgkaNKQV6UQss7BejkQ9a
	TdsAmXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ids-00000006KaQ-1tlV;
	Tue, 15 Apr 2025 15:56:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iLe-00000006Glf-1VoB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAC1B6115F;
	Tue, 15 Apr 2025 15:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21F3EC4CEEB;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=ymN+LyNWSLpbDsTvqi1RfS1hGNC4G0Ay2QtUtBcebSE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qxgcx+y8f/T0QqwUy4z4BMkQEGP5nKd1tpaCCc1jg1KFKOJGkzMKzu5Hvs6zUjBtO
	 papZAgHQ9egtnGMZCNNILgO67XO7nKVDpnB5DvbV0knXpFGLv/x6ui2RoIS2U42H1H
	 t/PilexvtBsfXdrjGfUHI+BdmkSRO8np4kHOjlMjylBhFd5noOwIRZ87XzPuBCTrfO
	 ptrL7N18ofihn7iZdUW3zSZOsSOAeSHVxuDoY+frBagPdYWrEjGNL7akfYIRsOqN1d
	 1P3kb3Bm9hKvDo/dcMvsOBeQudYo+gWBiB9btuxHyDeyoeBr7/jHjYT3dRYLacu1L4
	 r3bs1VLwQ8/Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DDDC369AB;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
Date: Tue, 15 Apr 2025 15:36:54 +0000
Message-Id: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZ9/mcC/1WMQQ6CMBREr0L+2pq2gERX3sOwKHSUvxCaftJoS
 O9uJXHh8s3kvY0EkSF0qTaKSCy8zAXsoaJxcvMDin1hstq22lqtghM8Wd35BVFncxqHrmt0Mzg
 qSojYj2Lc+sITy7rE915P5rv+QvY/lIzSyndwde1bPba4SsIcsCIePRL1OecPBfj1sawAAAA=
X-Change-ID: 20250220-pasemi-fixes-916cb77404ba
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=ymN+LyNWSLpbDsTvqi1RfS1hGNC4G0Ay2QtUtBcebSE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WqW39UeZ2Vs4Hu471P1vrbLFhq3/9kvNXFKdzyq+j
 7MlkbWwo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRm0IM/0y7N11kSl4vsPBN
 e11CRPJmjTvNtzVf/ehWW7f33Wexj76MDEc5bobPYdU5tcPjyDnljo4tLnwHrzcd9mDs/BEcN79
 4Ej8A
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series adds a few fixes/improvements to the error recovery for
Apple/PASemi i2c controllers.
The patches have been in our downstream tree and were originally used
to debug a rare glitch caused by clock strechting but are useful in
general. We haven't seen the controller misbehave since adding these.

Best,

Sven

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
Changes in v2:
- Added commit to use the correct include (bits.h instead of bitfield.h)
- Added commit to sort includes
- Moved timeout explanations to code instead of just the commit log
- Made timeout recovery also work correctly in the interrupt case when
  waiting for the condition failed
- Used readx_poll_timeout instead of open-coded alternative
- Link to v1: https://lore.kernel.org/r/20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev

---
Hector Martin (3):
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Log bus reset causes

Sven Peter (3):
      i2c: pasemi: Use correct bits.h include
      i2c: pasemi: Sort includes alphabetically
      i2c: pasemi: Improve timeout handling

 drivers/i2c/busses/i2c-pasemi-core.c | 114 ++++++++++++++++++++++++++++-------
 drivers/i2c/busses/i2c-pasemi-pci.c  |  10 +--
 2 files changed, 96 insertions(+), 28 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>




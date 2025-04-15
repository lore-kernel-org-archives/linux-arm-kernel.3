Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17344C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPoh999NAR7Z1rztq7zMYun/kBXA9QLmEkjkFBC0iSM=; b=tTBlIbw+mMrYoVFqd17RHT0nuZ
	R8LqXDDCWcAL3NfWvLsMGa1BTmN22QG3EuVXXqF/UG4PkXwF1qf7cg8appEnyxvvNyL0teMCS6bM/
	vQUZqxA2WG1pUyFCrtdAWHvThyDC4pQizAaz9In20UcFp0XpW1DIDH+E2P27tLPvl4cH6sbjxzLVq
	Kk35Uj6PFVcKxCPaO0Axa7y19uXCYgHA6OghDyxf82VmKDxe9NWeDr9GkZ7mDoOnBumsmLM9isKU3
	5XFf/COSBFZwwtoF/KNPBzVBboY7ur3obWaM/Y4RobrYBOlo7eNS21mWVQ340jNOSSdld9qU23oX3
	y0do1Trw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ijF-00000006LQu-3bAb;
	Tue, 15 Apr 2025 16:01:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iLg-00000006Glj-3Xk7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92DB75C58AD;
	Tue, 15 Apr 2025 15:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D168C4CEED;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=J3Oie2pptyHEtwvKtZF+eWmaLMCyaUrJVSGBPvvdSlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s9zJymXNPTZOXH7mjUl0DjJiQnxJOqCGFa5iNXmtPndbrqBuDGv267Xb0yWif0CsV
	 uNeQpT+5Fd+8w2sEbBrBewBoMqFZdi09FLbrt3/iwQ5ssPPu4QY7l0DVurdWZqD791
	 mfb8cecYFexXhWQClD9icW4ujlNKK1uR3RUjMNFqaI/wdAI+69g61bLH1OR/gd+23y
	 47RkxtJqu+AidqXZIvQS4MFYAcp5jAdmhmadXI+D0d2QwZz8q2YLXxq7ZVhp4MIxU7
	 fIsNl/sNMWeVPC7mSomGKYPfIGZreYnC6K9aQsq1TZK6L0/WKcyK8Kn2mUxaF8ZzVq
	 PWBg3HcQNdXMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9E8C369BD;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:55 +0000
Subject: [PATCH v2 1/6] i2c: pasemi: Use correct bits.h include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-1-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=T4ctk5KZpkF4MCpfLgWPh46S+YQwBJlk0+PfdZqRe6g=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WpVo9+5foQ6z5vcxp3SHJe/Yv2n3g66G6UzbKwXuL
 tgouymoo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRbQ4M/70DXfKzoxxXTxOc
 uo9dNH/jlYrXT2ck/Xx1InsiY6tQ80ZGho+/F3tc3uDmaXHgnMfKKX0nLK4sFYvyXBK8OMPl/06
 9o5wA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_083720_968233_2A04EFF5 
X-CRM114-Status: GOOD (  10.56  )
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

From: Sven Peter <sven@svenpeter.dev>

When changing the #defines to use BIT and GENMASK the bitfield.h include
was added instead of the correct bits.h include.

Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Closes: https://lore.kernel.org/asahi/Z965tVhC5jxy1kqZ@surfacebook.localdomain/
Fixes: 8b4da3ef9206 ("i2c: pasemi: Add registers bits and switch to BIT()")
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2ebb64929f2f6a3525835a880c3114d..71cc8cfc7c5cbf3924269f6217712d42008c03ff 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -5,7 +5,7 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
-#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>

-- 
2.34.1




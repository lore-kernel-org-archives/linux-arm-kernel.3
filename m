Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51509C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7PFKMe67PvPYmrR+r+ojMS1fD6WI9xBQZ9gGObbQP7s=; b=OeXyNKEtLfnUpwUgXrDAxfWJ20
	3+9YcydlLZrFfH9/DJe3Tx8Y+HDFAFfCTdDQuvvlKCT2PB0lbmIV2a7sVMLNg/76yf9ZTiEmOVmNv
	FZzcvMv3eFg/L6KVBSoXwuA8nExh3IlgzrUXAjQW3b60ZVM6eJ6x6XaMIbvodu/ySVvBdbwfDZqwD
	dyoOLkJ6lp0QOGAIR9e7kynwnTUB7akFo0Vv2CV1keUzAjqS4TyDu2NjWnrDqRnxXXM5QwhP/CZxe
	QVjLXdJVM5NQtdv983TMo/2GXVHBkGOjMhWMRAiOjlnwyCkn/1Tch1ovgnMoNbZeI18exfigqLJxq
	SC3rQGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlst4-00000008Pt0-3cqc;
	Sat, 22 Feb 2025 17:01:58 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsoi-00000008PFe-2h4F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 16:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12EF06111F;
	Sat, 22 Feb 2025 16:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 611F8C4CED1;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740243447;
	bh=Y+9vtj0/GJijf+70Pc6ic4DpWvcYid81kYksrctrbME=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D6AyIFJk+/XdJcNCqGWHKcIc8Jq3H9WXy/57bP/dJZybtFjBo2jXv7iDD1ujTXYf6
	 2hHtnhgG03E2YsQFy6mSe/DOw6NmSvwjN9xt2jbyeWDcc+9aiu9opcUlGYMYR2To0e
	 /vxJ3s2fJ6mHlnYc77u3j3mvU4+BxG0MW429atEqlWkd0Uyf401o9HU1BRAgtEdOr+
	 XzB/+M3cgJ84aZ39w+B0QDvAONrAxb+mISTQE2lk4xM2PVocxODpACzEhqATU6/bGA
	 /91TAoBb8TGPEO+gKHMO9QNZGACA2djY7hh313afhfy0tWL8HwBUTHC5IiZTk7ewQJ
	 CZUoap/SGdVyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BCEC021B2;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH 0/4] Miscellaneous Apple RTKit fixes
Date: Sat, 22 Feb 2025 16:56:45 +0000
Message-Id: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM0BumcC/x3MQQqAIBBA0avErBvQISG6SrQInWqgVByIILx70
 vIt/n9BuQgrTN0LhW9RSbHB9h34Y407o4RmIEPOEBlccz4ZNXm8RD06x97SYMdhC9CiXHiT5x/
 OS60f+7ccWmAAAAA=
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Y+9vtj0/GJijf+70Pc6ic4DpWvcYid81kYksrctrbME=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/ouxpcfyrJiu7Wnyave+7iM7/iEZ3IVNsnmrcdmbraIm
 Kh3t2p5RykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiWxYw/Hf+VXIqZPJS+9te
 Dvc8YoX2Vf2/ksZcw2yqn/OtJSpRTIyR4Z5v25H5Ul1H13ZYzfKcnHMpW/7otnOtcaJTlGos0+4
 mcgEA
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

This series contains four unrelated minor fixes to our RTKit driver.
These are mainly required for drivers which aren't upstream yet but
have been part of our downstream tree for quite a while now.

Best,

Sven

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
Hector Martin (1):
      soc: apple: rtkit: Implement OSLog buffers properly

Janne Grunau (3):
      soc: apple: rtkit: Add APPLE_RTKIT_PWR_STATE_INIT
      soc: apple: rtkit: Use high prio work queue
      soc: apple: rtkit: Cut syslog messages after the first '\0'

 drivers/soc/apple/rtkit-internal.h |  1 +
 drivers/soc/apple/rtkit.c          | 62 +++++++++++++++++++++++---------------
 2 files changed, 38 insertions(+), 25 deletions(-)
---
base-commit: 00834971f0d9e38beae37e92055b1432782827d0
change-id: 20250220-apple-soc-misc-55ec124184fd

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>




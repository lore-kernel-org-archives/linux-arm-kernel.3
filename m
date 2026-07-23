Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419A0C531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xCKlRX6ORRoVix7ByXUqLCVbvyvKxhLphoyjODmIQiU=; b=YyuG0AwDnTTCmZiK840EgchPz/
	VJBzLQppNOaiWUiGPTB2n6BRbO/I87//rcUjLGEz/bu7U/KAt55uSiTmJO+9pt2gn+L+SsMMXttUL
	iJBZ/cj3zcTNIbsK4h2wXnKq5tE1PAlYkf4y/b3gQzgmrhsEh5WxCdmmY6I1FGtszGGXatyFwDXcx
	FbNQ9J8s/0nxEW6+b0tyG7xC6ZWBZyHtxho8PI/v2qIqJt05eIvFxiBnGU9W89no9bbYnE7TZfAlK
	Caqmul2Nz5jsU3o7TIV0CPqiFjJ2XszhmTco8oEzGsNcm16baKonDL8FoXj3JWcJBJgWkfOJjuw2e
	2hyeMYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt4X-0000000EJeL-3CFi;
	Thu, 23 Jul 2026 13:02:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt4W-0000000EJe8-398Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:02:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16B7543E87;
	Thu, 23 Jul 2026 13:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1691F00A3D;
	Thu, 23 Jul 2026 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784811764;
	bh=xCKlRX6ORRoVix7ByXUqLCVbvyvKxhLphoyjODmIQiU=;
	h=From:To:Cc:Subject:Date;
	b=UZ8Vukg/MBZ6kt/J5Yx13FbsmegpR/mAA40A4IUfYBurncxWNKlzxS+eN7qc82XWS
	 HDTuzU0katnmH5a0wnZuPN+mlM2LS0PwL2CSNETfqG4mbgB6YcQPCVDv5w05aliqg/
	 OhNXoJhyhSQGf2fHZxa6xD1ax4oWoZN/mgttKWAHVMGvGaHI5aSMLmVn0qhqeYcyvt
	 qC6YHHVpxOTlScajlwU/Ke62i4qxgWuWq0YglljnvTcspBrTcP+qtuGRYlBBTMwvbt
	 u7rZykv1VrTg4qjOR1U00diHGKs1SDkskPTVWlvhmWs2GRskUq1WH8ioHeb1ZSZbCv
	 lALWOJLNReQKQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <willdeacon@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: cpucaps: Remove stale comment about keeping capabilities sorted
Date: Thu, 23 Jul 2026 14:02:32 +0100
Message-ID: <20260723130233.3123-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Will Deacon <willdeacon@google.com>

There is no functional requirement to keep the entries in arm64's
tools/cpucaps file sorted alphabetically and, in fact, they have fallen
out of order over time. Given that only the arm64 tree touches this file,
just remove the stale comment and accept that we're collectively not
very good at the alphabet.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---

Follow-up from the discussion at:

https://lore.kernel.org/r/20260519092243.7278-1-will@kernel.org

 arch/arm64/tools/cpucaps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd4..3fcac789b0a4 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-# Internal CPU capabilities constants, keep this list sorted
+# Internal CPU capabilities constants
 
 ALWAYS_BOOT
 ALWAYS_SYSTEM
-- 
2.55.0.229.g6434b31f56-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42CEC531CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ9QwE4Zf9vv/ANmHDDnOJ4n9oatrsPFNC12+gGoLjc=; b=QPhAf+HE1Is0qg4JnaS08I34bV
	AaMu9VZ2ZH/YXVoyBXyK8BRM3/GTqzXNO7N0TL4RcSFs4iCaxfy6217t82SKItaBIqWaKCBOG1aZg
	Q2FBjKHck3v5SvwPY5jE2f/4FCjwXpSIQTrPLsFTonaioAAWfgBq65M98WsELnA5eaiSCtbFk3ilO
	qhjfoc0uSCVuaXWbZjKwUvXglMzsLreL5HEiEFXIthFONKU2so5f94zlz4cLFoiQ7LzZIwLVVqc4D
	pVpvjRO4P1J5Xry0GnPnFshC4xDQQ22Rw12go6W0IkKe2+77UpBoRUWUSbrC+xYjGDcBOeTol9KUV
	DzaTr4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7w-0000000BtH0-2eIa;
	Thu, 19 Feb 2026 19:55:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7q-0000000BtEB-42Pb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19CB260054;
	Thu, 19 Feb 2026 19:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FD0C4CEF7;
	Thu, 19 Feb 2026 19:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530949;
	bh=9dkLJcyYrJI/hl+KbQtaNiNmaXXwcbzNYCd1MB4z2eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZjzh6Ie4bAHZt3jyVKU8xhg1VINBCP9HXA6KbKl3rzGGSYI2978sNuWOUKITbpsh
	 mcDIQouok6cKsfCS/VmMep3/TnYnyGwc74dqQy4dpGbtJEwNUGD+q4IEhY2hv2ooeA
	 SKBJeXC5jTurKzNQUeOZW6XHyDCZagNGwaitTiwNHTCE1+izBY5KJXDgvs87ptlA8a
	 zXOQDewH6N4IU800GtK7uxdpN/9avZDiUz68m3NZt0k+T8NRm9T6zepT3gVJgYINvQ
	 3qxEJCKuewgDxXpqvZuTGxzuIOe8HDPt0a6KCx0IG2Q8m4yVWxrlYc14m4ibDfK3Zp
	 FMsRgdRwtKiTA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vtA7n-0000000CGHL-1eOd;
	Thu, 19 Feb 2026 19:55:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 9/9] arm64: Remove FTR_VISIBLE_IF_IS_ENABLED()
Date: Thu, 19 Feb 2026 19:55:32 +0000
Message-ID: <20260219195533.2455736-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219195533.2455736-1-maz@kernel.org>
References: <20260219195533.2455736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Now that FTR_VISIBLE_IF_IS_ENABLED() is completely unused, remove it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 2731ea13c2c86..adaae3060851c 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -62,8 +62,6 @@ enum ftr_visibility {
 #define FTR_CONFIG(c, e, d)				\
 	(IS_ENABLED(c) ? FTR_ ## e : FTR_ ## d)
 
-#define FTR_VISIBLE_IF_IS_ENABLED(c)	FTR_CONFIG(c, VISIBLE, HIDDEN)
-
 struct arm64_ftr_bits {
 	bool		sign;	/* Value is signed ? */
 	enum ftr_visibility visibility;
-- 
2.47.3



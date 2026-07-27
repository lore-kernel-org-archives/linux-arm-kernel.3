Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF14EC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLWTz9uyitcYJatgxr316CzySA18FKneiaO9IYr74LE=; b=v4MGoNlsrNOsoqQsDUNC8LuIfg
	uVbVjrQvTKpkbRa7wHFO4ROM1tUV/WIl4pXml9fSBdotleKdoWhlf2F0KukUd6fNsK53VER6DWfeO
	xKcmN0LF7Z99Tdb7qkLu/jk9ziWHkKheQ5Izdvbx12xv54b/kWerUcdawOBoONucigd+uAWtPRFLT
	prW3w90X5CmjNOObJ9lNRFo1L4XjuowfWjyOP1lUkSJEiz7jX5zizHHWiELzxm+KF/teVPwBi//A4
	Rjw4cbMkptdsXb3bJU6ZJEc87TT239Zik7gnZA1+Yru7cPIl9A1ZMHiO4SLPolJ3YTW+ZjddT5cpy
	uCvTjlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKn-00000003OIL-2kWw;
	Mon, 27 Jul 2026 16:37:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIv-00000003MjV-04JB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B34F71682;
	Mon, 27 Jul 2026 09:35:43 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D499C3F86F;
	Mon, 27 Jul 2026 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170147; bh=aDm5RKedF4fJPYy/6WZoywe4widLsTuX/nEngu+wyFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lnwc5oF2O4D1fkLDIZt68kN7W/xr4D0Xap8IsRyWCBwkm8v7LEt1sUXGBJzgTdUdl
	 ubIROeQm5Paw+uSM/gQR5sXQtLtsZPxloy16silcVYiJWhjvg7Vfst/H2gyVE5UenB
	 SQFtgkBVR+5ENqVhV294BryhxTvocAdhy7XbxlFM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 22/45] arm64: cpufeature: Remove system_has_prio_mask_debugging()
Date: Mon, 27 Jul 2026 17:34:30 +0100
Message-Id: <20260727163453.7969-23-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093549_883435_EA73D2EE 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

Users of system_has_prio_mask_debugging() have gone, so remove it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpufeature.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db..95cd8d4acd26 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -821,12 +821,6 @@ static inline bool system_supports_mte(void)
 	return alternative_has_cap_unlikely(ARM64_MTE);
 }
 
-static inline bool system_has_prio_mask_debugging(void)
-{
-	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
-	       system_uses_irq_prio_masking();
-}
-
 static inline bool system_supports_bti(void)
 {
 	return cpus_have_final_cap(ARM64_BTI);
-- 
2.34.1



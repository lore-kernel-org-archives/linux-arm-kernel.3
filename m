Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D8FC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 06:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eDa29l8MMaO9ypybeVRSRc5/JD7r0AQ1OrapMHcmZ2g=; b=xuqogXAtjfCz3gPhEija47JEHv
	mSloNbwgBEwyW9edgav+NIDJNmzJ/5XAsMvP4sz3+SmLFew8EWH15qXK9oiJMMs15CnkNOr+SrnfO
	MENnqUIvaBiyiOssGlWXQNuRkS7xGHxHYhW7dLG6n+POFghEoLwpU6V/6v7S5lX0I7zR6GWNJLrpL
	cubSHFcJ2bgmJgybBxurNWX7hy4r/PFffNuFu9AOjZ4JhZKb2Hm19jqtglexMdfl1P+R9iIGs0kmZ
	RcML2wF4owpqqT0tyFEqquv7UhD5PuoddAofX1vRbJ8x9zidF+4YXIU5TWnADwxao6viC9o6WTn59
	84GB5P0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Bs3-0000000AtRk-2ifg;
	Wed, 09 Sep 2026 06:33:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Bs1-0000000AtQp-0B9E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 06:33:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48441fa5c37so3987320f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 23:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788935599; x=1789540399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDa29l8MMaO9ypybeVRSRc5/JD7r0AQ1OrapMHcmZ2g=;
        b=KOiIwUkiKdWTG+yOG9gbP/9aeIrcd7Mxfs28o2nqDn1HAgtSFCX9EZUv19/rxtGqS2
         wEu7shwPHrn+gV/SD1yMURyZeu8oc6S2NEY/P85NHbn/pOtCRLRPGn99ZCE9hQWqyNas
         b3KiuR3RCoMV4GwJzNSUjPOX4Jnmz/9ag0Req1wvqS+aN82i4RYIEJGz0N8N8GCnRHbo
         Hh2MgH6MOo4jQq4RW0s6s4xbX2uFpZzUKYPirxfSbQlvyuHYVKDiZGhdoWvUVyjNIYTF
         Vd2XImSpWmB+Iapk7g4AMkzKp8gLsFi6HayrArihSFDlpw8jn4SMvXbNGGAoKuCrNsIP
         M7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935599; x=1789540399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDa29l8MMaO9ypybeVRSRc5/JD7r0AQ1OrapMHcmZ2g=;
        b=aetzlLJwXWZuEEtlvDW9S4NxLldNXPcTRzXf5KN2EiRV+8kZxlf3xcM4P73RAM3yk1
         s2QUJPWSWcjaRyAXLKoYeRukr8jm2PfoCREbk+MMTpJRK/CapzNsm5pB8vAUPXlE0DXi
         e/2GysL4epJByMjFugFw82WpcezAahAhOHijwE4fBsgMdSiL3OUrNmxJRnfBMwwfZ6nJ
         UfG8hPAtfHECyJcBAEB0IVRI43yjFWepGZZGCm/Sdcgr9Pxej5+Lh16+mxo82fpAsgFv
         xKYW/r1ylFxGqlMwRN5clVSLCXNZs1ivx4ZXvUTAWQWRodU9gbMf8BVDzXa85C2TbydQ
         GvCg==
X-Forwarded-Encrypted: i=1; AKwUvByY5AMrm20IdR/kMDH7QmAJeRawfL3zaiM9YY7uOlL4J/GslV9XaewIjw8aVkAxEb20S7CPsr4Lvz1j7R0i7zNN@lists.infradead.org
X-Gm-Message-State: AFuF++leajorpdJoV2S6U1TOTHkhR5r/6OI9hCDV+BnGwQy/tjRmDWCy
	BPZpF772KBpdEPg1sb20G90OASBfKn88RJR4l1OE+0eND7AEt/jJ00oh
X-Gm-Gg: AYBFou0jsSI53cCvjqu0cnmC1W0fv8A+t/1px2gqdWRpOkPDNT9MjwmHHew4raBhhLe
	LZDUkPSoaCwtEnHQj6RHXYugniZJWpC8KSptwXgG5ukiEj60HQ193Fbqa2wJ56JCsofB//8fymz
	yfeCBG4pSA1f0DrurkX3+NyOiKTjcjZ997TQ7r1WM//LFaGEw8/UcCHyL0xnzkFrnsNQUPPtg0l
	qUFN8QT2GKcC26/pxdTYu/FpXQ+br3cABGdAWx/hLEQKoc2Cuu+PotaMaMeNSbe22i3Eyk+28gW
	L+JlG6zRySIPaaVTD7OWTERIXMW9OxPGSuf5wBa+xQNRAEBdhkcr820fgqgQTk3mf1p0N6nYqPC
	eO39lZMkIsaWk3uDTFPWsOibYO+YQpX7nZFHYr+opAsY3W0gt5Ycf2c4Qu1IqOrW5xOHWoJTOa5
	kXBtuOthRVMhXX/kWwPrRLnKYEz9MWoNu0L9jDWK7M5HCLU9ZGcvCkNHhK+wVITVvr7dXoFxg8D
	1NUp2Q12Mf0x0MeifaZz79IoWGs3RmZzOykcYFEcoiJqO5eJ8QHIE7xD+R6Q4d/aRqcf08qjfWL
	cioPMSjUav8JPJ3EJkqPf+d8ASdsbJE2HkCagoiLFs/8SRT5yVFY
X-Received: by 2002:a05:6000:2885:b0:485:ac55:dca1 with SMTP id ffacd0b85a97d-485ac55dddamr2682301f8f.50.1788935598707;
        Tue, 08 Sep 2026 23:33:18 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm39734495f8f.22.2026.09.08.23.33.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:33:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
Date: Wed,  9 Sep 2026 08:31:56 +0200
Message-Id: <20260909063156.89636-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_233321_102428_17A686BF 
X-CRM114-Status: GOOD (  12.03  )
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

kvm_get_vtcr() takes a parameter named phys_shift, but its kernel-doc
describes phys_shfit. This leaves the real parameter undescribed and
adds an excess parameter description to the generated documentation.

Correct the spelling.

Fixes: bcb25a2b86b4 ("KVM: arm64: Refactor kvm_arm_setup_stage2()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..c078cfedce19 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -532,7 +532,7 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * kvm_get_vtcr() - Helper to construct VTCR_EL2
  * @mmfr0:	Sanitized value of SYS_ID_AA64MMFR0_EL1 register.
  * @mmfr1:	Sanitized value of SYS_ID_AA64MMFR1_EL1 register.
- * @phys_shfit:	Value to set in VTCR_EL2.T0SZ.
+ * @phys_shift:	Value to set in VTCR_EL2.T0SZ.
  *
  * The VTCR value is common across all the physical CPUs on the system.
  * We use system wide sanitised values to fill in different fields,

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0


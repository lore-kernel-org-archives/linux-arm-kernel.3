Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72677CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1dGp94WLO2gdDysa7HIE4Qlt4fCj3et0VUDMOFJDyak=; b=NsLu4H300hEuiQplsOI57qrn9l
	qMhdrAi0TDP3g8pBFApH+Tz9irqKikVNE13ylXWAuZ5k/rZVJUdMK6vCqAHutJwniT659Xz5muLDc
	R751uc92OJBE5rTij2THuMf26jncZMmnI79in7xEv29JaxSU6vmDij8U6G98/JDqgfX1vpdr60xcP
	hdyRKHyPZMd59yy04MWjS5hr/HDNFOjhBTdivXlf0s951xAFv1oUVbdwroGfqf6MVMMlEav+MeJF6
	sQX3b8HRgWeQOE/YeyBlvlHAHjb75EWOEvRV36qFUrO0/eezdKwJ7ANXByDtcAUnIe91xkaKMZshT
	SGweVheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfvs-00000004fXf-40lW;
	Tue, 29 Sep 2026 22:04:16 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfvq-00000004fX9-3ZFr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 22:04:15 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4b26d8d2498so7475775b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 15:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790719453; x=1791324253; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dGp94WLO2gdDysa7HIE4Qlt4fCj3et0VUDMOFJDyak=;
        b=Piy9ZIXBQMQZioxoOvhWZup4E8OdUa1Y5xSJ355cUzvy8epYW1InEgpMjaDymVIHsc
         sHgQjaDE4eE+fsV9EC1A1G5IWmK5Diz1BRTz1BQ+doq1eWeAcItXfHQF5AwKoMafnxsn
         CHbrsqYs9jK2hk5y/OSvMqj0bEjUfbS6wu3gbHPRFjfgKmQyNcpwZRqW6qjmZfxB7VDk
         SUgbnyEDVXL2rWEiM9s0h4Y/h95c7uNJ+Q/t223n4Vop80mCSpkDyIZQRfHx5n3bnXZr
         6wStu5k6Jm3f1/vQsEveyzTTZFWCF12jy/dfDI1yEx6K8oM+hfsBQ0+Baq17XbtSsy00
         MZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790719453; x=1791324253;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dGp94WLO2gdDysa7HIE4Qlt4fCj3et0VUDMOFJDyak=;
        b=Ic0hqT5I1euf9mu/+tY1lq7XyPRoLP89qBBjfwCMXPJIGXJ0TUKPag1lPPESs4DeyO
         8qMG55uhq9VGJtfbQ5QP8f+CdWVdv3hJ4PU5C1KFvrjm1+RP2WxSL6jtUUW0E0IVZavb
         47cK+vLSYEPj4a5rh3KB+Q6zPXH0HIdOhiyXTYDAL+mtJEdxt9HN1bAcXs1I9rrtNrcd
         XpDoqqrDrA4lNZDyBmT4XWd29W1232BrF1QaOa9GB3Y7X2w88dfznfA1rhbDovQJD+Xo
         9cGbZ4oURFaLyRJMTGxn8KsOWwOqua2JEyRqUHUZky+eoIA9eq76En4+xfUJdiJpH7kn
         nngA==
X-Forwarded-Encrypted: i=1; AKwUvBwNcV6rBfkzD5//ZvnqmCbj5sIbDNQ5S5QX3RsGoWcu7qcYYiADTSktEeUXvB2thJJG3sR7/554+FNZkVi/kYV+@lists.infradead.org
X-Gm-Message-State: AFuF++l4ftmWX4bcY29b2eXwXXwP6TKqomNz9KB8OyumC3PPPXygY+kB
	F/yYpNuM6ie72XzFrk6uCIj8aRJR56sRRplr8KqTSLgvwABtUA8QeVMHwreGFGWww6y8v1/Yhus
	IYVOGZPRi7Gjcn/G7DKSVUfb8yw==
X-Received: from jabgg6.prod.google.com ([2002:a05:6638:6906:b0:5f6:798e:166d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1927:b0:4ec:f57c:f81a with SMTP id 5614622812f47-4f074dcd517mr1045481b6e.12.1790719452327;
 Tue, 29 Sep 2026 15:04:12 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:04:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929220411.3756519-1-coltonlewis@google.com>
Subject: [PATCH] KVM: arm64: Check ID_AA64DFR0_EL1.PMUVer in reset_pmevtyper()
From: Colton Lewis <coltonlewis@google.com>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_150414_894304_D8ED8F93 
X-CRM114-Status: GOOD (  13.38  )
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

When userspace initializes a vCPU with KVM_ARM_VCPU_PMU_V3 but sets
ID_AA64DFR0_EL1.PMUVer to NI (0) or IMP_DEF (0xf, which is sanitized to
NI), resetting the vCPU invokes reset_pmevtyper(). Because
reset_pmevtyper() only checks kvm_vcpu_has_pmu(), it proceeds to call
kvm_pmu_evtyper_mask(), which reads PMUVer == 0 from ID_AA64DFR0_EL1 and
triggers a WARN_ONCE("Unknown PMU version 0") in __kvm_pmu_event_mask().

Check ID_AA64DFR0_EL1.PMUVer directly in reset_pmevtyper() via
kvm_has_feat() instead of kvm_vcpu_has_pmu() so that PMEVTYPER<n>_EL0
resets to 0 without querying the event mask when PMUv3 is not exposed to
the guest.

Fixes: bc512d6a9b92 ("KVM: arm64: Make PMEVTYPER<n>_EL0.NSH RES0 if EL2 isn't advertised")
Suggested-by: Oliver Upton <oupton@kernel.org>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a2f4e769a4282..0bb3c2f10a22c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1060,7 +1060,7 @@ static u64 reset_pmevcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 static u64 reset_pmevtyper(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 {
 	/* This thing will UNDEF, who cares about the reset value? */
-	if (!kvm_vcpu_has_pmu(vcpu))
+	if (!kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
 		return 0;
 
 	reset_unknown(vcpu, r);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CFFCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0IYenQhIa9PZj00vW7IIruD0UnAnXJ3V9tGf3ph9/f0=; b=h2p3cSagb/ABsxZlVvNW5ipw99
	YHxocCl+5YZZhoO1PIatK91nYkpzfiqV4BuwGCl9VkXHRbpNKUBPDdKvIhmkwcralNizn5goBgKQt
	y67KwoPqT//xIOcVXLeTb8CgDGiR76HLlKeuERODxxtHaF5+YKliSz9py99U7TFkoFFkORh0VZncK
	O4NhTglFRqJjYXS8RxwjcsBeCBAhWxTndsPU4GOW/+3Pm55BnNMrkuGeVrCQ4CMYueNLhTyZy5wyq
	qf1T6td9dJq3tprwcSeMo6DsPaI1VvROwOUztQ74Z9wKE/j6U3qB4iZC+pO3zFEf5BXlUE1MkPu6l
	hxF+kttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLY6-0000000DmOs-2BxG;
	Mon, 27 Oct 2025 11:38:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLY4-0000000DmNt-1jY7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761565081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0IYenQhIa9PZj00vW7IIruD0UnAnXJ3V9tGf3ph9/f0=;
	b=VhAz8E/sdaPw9KMgIRjJP6vdCVTlIN/0mvoJsO5O6qslxq9Mt64FJv6/yihgspIGaghUBO
	EG4Skess3+he7XR5TDwclKKyLyb6WpyPosUF0bhIJVlpBx9oWdNp8xaRJgRjQ59XJTJSL0
	y/QsmUp8DUbLiuD59qcMCUqLjE8QhUs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-1EPx5-RuN2ydAFDTV1SSwQ-1; Mon, 27 Oct 2025 07:37:58 -0400
X-MC-Unique: 1EPx5-RuN2ydAFDTV1SSwQ-1
X-Mimecast-MFC-AGG-ID: 1EPx5-RuN2ydAFDTV1SSwQ_1761565077
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42700099ff5so4246109f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 04:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565077; x=1762169877;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IYenQhIa9PZj00vW7IIruD0UnAnXJ3V9tGf3ph9/f0=;
        b=IR8a1R/OyxxACiYaskaZkcDd7bVk2/ZgHXky8k/4JSO66SiJDdo/Q4ywCdYFhr5XYR
         wtLCmrctBd+N2qcNSsnfKQvy9dIzAzQOdgBGeeYtXRxdLY/nsl+Yh5nT6K3qgERVsZX5
         uj+ZCE2XuzDzVpY1V+srh5Kg6UsSRPsNjhqjq7E+KUk6KVU1Pk8M9VHPMNtsaoxYgjVs
         0Y908+XoXbk5BPnyKtPuwY33g6FBC9JScRGkq2AIp3rqPBO3Y7Aa69EjvsaHxw93OzqP
         kRxEq9duLGrkMGxel2tcNQLKEHKN9JldQ4J8Jo3zcbRJyYsJhM948tGsIb9aeiHn8ZWe
         HhuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlkYdu2CHGFGebGwCqiR5h6OCE2luZ3kauycLP2h6+GRuFJdGNcFZGPRvCCYMM1/LQqlw9Pe1tr43JEgggY3+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxmqKg89r7xSmvAT9oMROqxhNEIlNfHKoJnJ5hW/gkUDg89dJ9F
	/uvCcXIcUH+dpKGq8BZiu4W7586+FEPTL5Ymd/8Y0Y0EPQBXM+OIUIZItHi/9m59nDdi0KeyRT6
	Ra8nKyjYKNoWaBJsqT66mVil8lF8PF+SN6+Le7p+zlynPFnUCAAbqqDO5A33la/iKngx4yPnRqN
	ygMZ9T65Qi
X-Gm-Gg: ASbGncvF80DiSkvZRqO6qrbZlD8oz6SZklc0sEzzSWF2mDYrnPdB/sKIUF7hgCJkKWf
	/udYHTBc0enYVUusduYqBlkX/DWJ8SH8N8nF8LWwbhu3WxbvcuHPG6miI91fdyIFW8ia0AqWj0x
	egfW79PrPCUiEPqb2BWj/maU44MqhYiSViaD4EhrA0Vklb0fyptM/3I94/qdPwhrR2GBO6O15gM
	s2mJBu8G9q0Upt+w6bmS+58jNQBqLyfz7Vn4oi7liyLelqXNCS0KDTpkpxAD29vY3gCjPPJsiqi
	vDQv8NeUBGK0GPNKzWEt+pM0vqVTPDhoASxaqTrsiYiDTL/Yi/CKl8c4Dxt/UYwgIBy4EoeEOr/
	jdgJslr4njSe15vNxdYa5ECOZs6JnF08XePXnXQXSr0ZcbaBw
X-Received: by 2002:a5d:5c89:0:b0:425:7406:d298 with SMTP id ffacd0b85a97d-42704d7e9ebmr30407491f8f.5.1761565076782;
        Mon, 27 Oct 2025 04:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGx4uKgsYoM0fU52HYyWEvQMrYgypwVSrAUmI9lNjcwUX5i2uMZCdkDcF1SDu586SVN9WApQ==
X-Received: by 2002:a5d:5c89:0:b0:425:7406:d298 with SMTP id ffacd0b85a97d-42704d7e9ebmr30407464f8f.5.1761565076305;
        Mon, 27 Oct 2025 04:37:56 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de. [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb7e8sm14108931f8f.19.2025.10.27.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:37:55 -0700 (PDT)
Date: Mon, 27 Oct 2025 12:37:54 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Sascha Bischoff <Sascha.Bischoff@arm.com>
cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
    Joey Gouly <joey.gouly@arm.com>, Will Deacon <will@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Failing no-vgic-v3 test
Message-ID: <f9c7fffa-53ba-a506-b48b-07e3df2d1d5a@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xul7jHcfNT-Xh9i7ESdeSgCjPNjP3i8KiQ2nBzRYlf0_1761565077
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043804_521916_3A61C303 
X-CRM114-Status: UNSURE (   9.93  )
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

Hey,

on an ampere altra I've got a sad selftest:

[root@virtlab-arm11 kvm]# ./arm64/no-vgic-v3
Random seed: 0x6b8b4567
==== Test Assertion Failure ====
   arm64/no-vgic-v3.c:66: handled
   pid=3793 tid=3793 errno=4 - Interrupted system call
      1  0x0000000000402feb: test_run_vcpu at no-vgic-v3.c:128
      2  0x000000000040214f: test_guest_no_gicv3 at no-vgic-v3.c:155 (discriminator 17)
      3   (inlined by) main at no-vgic-v3.c:174 (discriminator 17)
      4  0x0000ffff873eb587: ?? ??:0
      5  0x0000ffff873eb65f: ?? ??:0
      6  0x00000000004022af: _start at ??:?
   ICC_PMR_EL1 no read trap

This is a guest without VGICv3 on GICv3 HW. The test expects UNDEF on reg
access - which is not happening since:

3193287ddffb KVM: arm64: gic-v3: Only set ICH_HCR traps for v2-on-v3 or v3 guests

As a local fix I've done:
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 6fbb4b099855..1fe53a021926 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -297,11 +297,15 @@ void vcpu_set_ich_hcr(struct kvm_vcpu *vcpu)
  {
  	struct vgic_v3_cpu_if *vgic_v3 = &vcpu->arch.vgic_cpu.vgic_v3;

  	if (!vgic_is_v3(vcpu->kvm))
  		return;

  	/* Hide GICv3 sysreg if necessary */
-	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V2) {
+	if (!kvm_has_gicv3(vcpu->kvm) ||
+	    vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V2) {
  		vgic_v3->vgic_hcr |= (ICH_HCR_EL2_TALL0 | ICH_HCR_EL2_TALL1 |
  				      ICH_HCR_EL2_TC);
  		return;


but following the intention of the patch above maybe we should do smth
like:
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 6fbb4b099855..1fe53a021926 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -297,11 +297,15 @@ void vcpu_set_ich_hcr(struct kvm_vcpu *vcpu)
  {
  	struct vgic_v3_cpu_if *vgic_v3 = &vcpu->arch.vgic_cpu.vgic_v3;

  	if (!vgic_is_v3(vcpu->kvm))
  		return;

  	/* Hide GICv3 sysreg if necessary */
-	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V2) {
+	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR0_EL1, GIC, NI) ||
+	    vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V2) {
  		vgic_v3->vgic_hcr |= (ICH_HCR_EL2_TALL0 | ICH_HCR_EL2_TALL1 |
  				      ICH_HCR_EL2_TC);
  		return;

Thoughts?
Sebastian



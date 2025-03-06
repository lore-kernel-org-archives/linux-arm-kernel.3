Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A375FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Lmst4VUAQQ3LJJdXWEWRCBJzpFOzVT70uwpvEP3i+I=; b=qwA7RKDsl30D/wQpzY/fT2D4UZ
	WRrv+v9d4hcbiqtRgn9oFHq5xvfGIp88iSi4lbdFlPdxNOQEXV/9Eg8tW2GWSwLT4AeDEdA7krc6r
	K5m8xbnx8BxV10k4+WjNnFMHYHzVpalEZA5cn7cLmf0PesHq0RPjAvCKzEW1QRJG3MLanwfwWZv1b
	qpkNjD5t+Uv8E9Zar+Cygdv9dITnepJZbFXgCZgWb+vnYXOt8uYffLjWGtNYGSbwKmAD+4kjgnGwd
	z0/d3fTbwOHYP/ZpC0sNkPETZbX9+4Auxa7F8YPLSkWrLvQkv8M/AYjF3lw3TjJ1Ccb1qKiY1YIHX
	vCzVDtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGAY-0000000BtQa-2Q6D;
	Thu, 06 Mar 2025 18:42:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqG8v-0000000BtGg-2rdJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741286423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Lmst4VUAQQ3LJJdXWEWRCBJzpFOzVT70uwpvEP3i+I=;
	b=ZQ/tkLth6+0lcfcfHmtq/3d5+fyc06QV7XIU9ltk2P2zeLMXmHtZyjJAR8KsnlKQGXXaOc
	9nTTx2tNEdSREwfT3WkL0JEo9Pkv0FAc6a9PZU5jcaz7XvhmncL3ULkhJ9ZTRsJKukEtSa
	1wCEE9zPP/aFlOhRj9Yp42NDREc9ezs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-pYFkjU7_OAy5xEyQiWtYvw-1; Thu, 06 Mar 2025 13:40:16 -0500
X-MC-Unique: pYFkjU7_OAy5xEyQiWtYvw-1
X-Mimecast-MFC-AGG-ID: pYFkjU7_OAy5xEyQiWtYvw_1741286415
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3910b93cb1eso538272f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 10:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741286415; x=1741891215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Lmst4VUAQQ3LJJdXWEWRCBJzpFOzVT70uwpvEP3i+I=;
        b=lFM+zucaYfzKDJEQfqjVWSlIS/cY12n4vAlvf54KKuGpHZL5tyKstVW3qqp0mTXubB
         AcrLePqf6zOmCiymhLGlIUyTuQzBTWDYYTDVhw/ig1tz3EyWhto+Xjp0M2cH0ImGxvQX
         3fo5g4q35PN53XXMUs1GcXOxfIiyr3tWEegga9P11WAOWKXWNRU2ULjaRFlE8H/yx4JN
         p5BgHhtaG7qvY6DaSLC+4qIEFC2xrl+2Kb14bUfW7Cid7hOHkbmM531/s01fP0oZDMMs
         IFMotlvpYedo4k+/ymzmh9vraYyOWfYiGumKDVq57IZBZG1msHgWwxWxAi8D+1S6we2z
         szGg==
X-Gm-Message-State: AOJu0Yy51qeD0LhZGxcvZ6tPikwtRl7F3EqcODT6gCbsk2RrdAo/FPpE
	wekiN/LYqlmwMGfGLLb8QXr5BqiTCMPjEae6iN/7uQEOyIs/FDHEQwDSsmz9X1ELEzdG/zsGVGc
	+Edh3EdgClTlveOUpceXzQ6daO7Qbi5jGbVC4aPcwcJ/PJo3cTqoarIlLTskT9CDJwMByMrL7
X-Gm-Gg: ASbGncvygHEovO71SFG6kag3ux97QfAzcX3luSUyXqclaHfn3kyKtCeuzaZ8TzWJseN
	4IbrgE/zUV1MKlx/UmWCJq1oVDghGoyS6sBepMWFIJ7Ihlm2Wk98BlmSqJ5/X90OwVhZyMgLhTD
	y3XdO4vX8pN9HiLWFW4y7qCB3gW4Ap4PKZnsgCP70Yyi0doytJ5fG884z9Zb5tvPw3/RukB5Pao
	Jm5S7erXSMLERnrFnDjQItDP58ArUmlCaVDWoxkvYUeMrz/JAAPrJwWwBsEGh6EP+r+c3k0AUpV
	p+PMC2yvgvDFyu0Kuxq9aWXdc2Wp5BwS+pXRceIcUpMwhV9tSDcyCYVeZdZdiAUHQP+L3OvZ6Qt
	B2g==
X-Received: by 2002:a5d:47a2:0:b0:391:3150:96fb with SMTP id ffacd0b85a97d-39132d6325bmr200929f8f.23.1741286415178;
        Thu, 06 Mar 2025 10:40:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+PIlhHHUzNDRAUatrj6r8bLMc9x2BjUmkvzjVG8Z/wDAKyIEVDRSOx3ZM1Q7ROAl8MR6S/Q==
X-Received: by 2002:a5d:47a2:0:b0:391:3150:96fb with SMTP id ffacd0b85a97d-39132d6325bmr200910f8f.23.1741286414795;
        Thu, 06 Mar 2025 10:40:14 -0800 (PST)
Received: from rh.fritz.box (p200300f6af284000f9ca1328aeaacdd4.dip0.t-ipconnect.de. [2003:f6:af28:4000:f9ca:1328:aeaa:cdd4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfcdasm2767640f8f.23.2025.03.06.10.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:40:14 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Writable TGRAN*_2
Date: Thu,  6 Mar 2025 19:40:13 +0100
Message-ID: <20250306184013.30008-1-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N7nL62vbkqMFMHv2xoOT3BLPXesdhtHDlcUBtUs_mtA_1741286415
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_104025_794653_D615F81F 
X-CRM114-Status: GOOD (  13.28  )
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

Allow userspace to write the safe (NI) value for ID_AA64MMFR0_EL1.TGRAN*_2.
Disallow to change these fields for NV since kvm provides a sanitized view
for them based on the PAGE_SIZE.
Also add these bits to the set_id_regs selftest.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/kvm/sys_regs.c                     | 21 +++++++++++++++----
 .../testing/selftests/kvm/arm64/set_id_regs.c |  3 +++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 14faf213d483..0730ed8314d0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1948,6 +1948,21 @@ static int set_id_aa64pfr1_el1(struct kvm_vcpu *vcpu,
 	return set_id_reg(vcpu, rd, user_val);
 }
 
+static int set_id_aa64mmfr0_el1(struct kvm_vcpu *vcpu,
+				const struct sys_reg_desc *rd, u64 user_val)
+{
+	u64 sanitized_val = kvm_read_sanitised_id_reg(vcpu, rd);
+	u64 tgran2_mask = ID_AA64MMFR0_EL1_TGRAN4_2_MASK |
+			  ID_AA64MMFR0_EL1_TGRAN16_2_MASK |
+			  ID_AA64MMFR0_EL1_TGRAN64_2_MASK;
+
+	if (vcpu_has_nv(vcpu) &&
+	    ((sanitized_val & tgran2_mask) != (user_val & tgran2_mask)))
+		return -EINVAL;
+
+	return set_id_reg(vcpu, rd, user_val);
+}
+
 static int set_id_aa64mmfr2_el1(struct kvm_vcpu *vcpu,
 				const struct sys_reg_desc *rd, u64 user_val)
 {
@@ -2787,10 +2802,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_UNALLOCATED(6,7),
 
 	/* CRm=7 */
-	ID_WRITABLE(ID_AA64MMFR0_EL1, ~(ID_AA64MMFR0_EL1_RES0 |
-					ID_AA64MMFR0_EL1_TGRAN4_2 |
-					ID_AA64MMFR0_EL1_TGRAN64_2 |
-					ID_AA64MMFR0_EL1_TGRAN16_2 |
+	ID_FILTERED(ID_AA64MMFR0_EL1, id_aa64mmfr0_el1,
+				      ~(ID_AA64MMFR0_EL1_RES0 |
 					ID_AA64MMFR0_EL1_ASIDBITS)),
 	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
 					ID_AA64MMFR1_EL1_HCX |
diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 1d65f4a09e6f..322b9d3b0125 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -146,6 +146,9 @@ static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
 static const struct reg_ftr_bits ftr_id_aa64mmfr0_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, ECV, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, EXS, 0),
+	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN4_2, 1),
+	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN64_2, 1),
+	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN16_2, 1),
 	S_REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN4, 0),
 	S_REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN64, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN16, 0),
-- 
2.42.0



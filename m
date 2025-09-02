Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88498CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=edYlP8Z5hwCifcr6FufgXJe0x3O4W0S+n8Or6v62MHE=; b=maAUNivcgVES8RQ5QknDWRItXD
	eRRoqKdYNN7HeN8QRPAcOBg5kxNESAiV1eFoehZAX5CfoD5AUwdtZgx2tGPD3fOZVumLYyJVbgPvn
	e7yn6/R4h4UynFuh6/zPiQSW4tE7jyw6AA/ORMub1eHnVbEVI3VziKHfwK215QRV2zFY+cCfF2xNe
	nX92DKBta15FZBVBkiD0IQqx4z4G2hobAE6hc086M0WV0FtLxY5ooM3ZZxMno8S2rb1phyJf2WtB6
	os8gO8mDMxyOVO0J1ARTDdzlbLAaSeGFJOK/9nPTP3oLK+ThLksnUuy2h+FxwA3tjg0141adWh7+x
	0ER3bhFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ8M-0000000HG8C-3byJ;
	Tue, 02 Sep 2025 12:29:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNJp-0000000GNSH-2pE7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:28:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so22331955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756805328; x=1757410128; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edYlP8Z5hwCifcr6FufgXJe0x3O4W0S+n8Or6v62MHE=;
        b=q9RxqcE/nXguXTedlKM2OpLqlMa5yynEEaueSGYCZ/hTH7FTpPqKBTlUNfeSLVfc+N
         Yb6lcMZl6GQa2EIzzCihFZFK/ygVmPEUJMCPD3bGamjHX34VzwhLU0IKKGQL43tGDVzu
         3yim/yQUIOz6PkhLlWcgbDW5QAAf9iXbhbJq34ZjgoM+bqgRvg8RThAurXDGIRC1p5pc
         gGSgtBHYzglk5pWwm3vtyhfqT0y2GA8XVsaXVfuYLKRlK1dCMEI9QgCW6gLbsZAaxU0K
         6312xVTGe6OVjg8w6DUGe0y++RGdMNQ0gRgGaXHGz0G2Cef30g1kOUP5rEYRWA3vvMTL
         Tsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805328; x=1757410128;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edYlP8Z5hwCifcr6FufgXJe0x3O4W0S+n8Or6v62MHE=;
        b=EN2D3HOsSIijZLM7zFuagpDvZ+DBc0Ccw/i++RGA2u7tDfDaSmfNkpa9HYEjrMENZe
         Wv5GYDkhX5mG+bmJd3u8ghvYH1b+ZsUnCC8G6SwQtcoQYRvwYiYmbHBID10k8laKVj3c
         +4fSZenMEJOiohAtA4uvriFHkaED8onyLJwVhsfRheU6Un0XFpoYq28scsENavCHIp0N
         Co93XxY5n7OsiqGxjE5TFrDHOMDIJRN8FaFEWBRrSWxQzKGtZcg/ggmfh7pACd3n55zn
         6p0thLN2QfbIm6Bv5xtKlwHnLzhq6YaoripurHJKOCOwnbZJj14PWgly7Gl2O8UPl1tH
         b0Cg==
X-Gm-Message-State: AOJu0Yw85bPvIBWUK5tDWWaueNL49Zr7ZWFfHfNbXVmv1Z4B75+nQMeO
	PvplTr2j7NWweFb4pq+l3x8PrbM/K/EcnjuDlbN85+4egbw98ae1zDXGDvr797mQ5S50Uyd/isJ
	pg+wZIEk=
X-Gm-Gg: ASbGncuW6NC60PhPul7dJuH5RRKxXsKRlM+x7x1EUh/JT9Rtu6OtfEkBj8gOX/QLlzU
	8CElTP0bTsw5rYRvReouFy7AMh0eWmQDBtwWZ/puYoG7YkZgnPXcaOKPmqkffpSCL6OCHsFH3qI
	0TBo9uVG9lBPqS6RLh62t0k6EgDCcZxzA2Y8zra48ViyC4l8ckFojdXaEqlmtRi9NHdfTCTgCAS
	7mt46B4+rfeNoJ9GSb2GsAeJ0DFEdkLCJwRpXZWEhwwTgbVEeOTgaXm6Z1TVHSrhEbOZwzFGLaT
	z/kZIYM0rC2uFfi3RnAPDRdC8uNAD9fZrDLPb3lTb5M28SIXFaCGS/KqcYgFJltRrsWHEDY1ZJ5
	EKd4pWTWm1HoYxYSnmOQiTM6YpqYqyuTuLSoNs0VImAk=
X-Google-Smtp-Source: AGHT+IEY/YSFrI6UrJniUuogyMXmb035NLrPVWZyM/wPk//oA7hmbyBZ5lCICvvZzOw9e+9BtJ6+4Q==
X-Received: by 2002:a05:600c:1386:b0:45b:81ad:336 with SMTP id 5b1f17b1804b1-45b855340e4mr100469205e9.16.1756805328090;
        Tue, 02 Sep 2025 02:28:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6b99sm271502805e9.4.2025.09.02.02.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:28:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:28:45 +0200
Subject: [PATCH] arm64: Add command-line override for
 ID_AA64ISAR0_EL1.ATOMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-arm64-pi-aa64isar0-atomic-v1-1-125f9538a230@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMy4tmgC/x2NSwqFMAwAryJZG6il9XcVcRFsfC8LbUlFBPHuF
 pfDwMwNmVU4w1jdoHxKlrgXaOoKlj/tP0YJhcEa681gLB4xyYKkW+swCRK1TjKpQTriVky/huA
 673tmhlJJyqtc32Gan+cFqwYyf3EAAAA=
X-Change-ID: 20250902-topic-arm64-pi-aa64isar0-atomic-8fdd47558eee
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4097;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zIiaEMcLOGEflrFqgwtyUbqqcZexOFcO+SM0N5ku4Tc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrjPlqmBSDdqD8zMfFv0XXzw9wN/I6nNGhVgkTIT
 4qSzP1mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLa4zwAKCRB33NvayMhJ0Q6xD/
 9NrU+WTr64/PlGUBAU4zpCqh4GbhRID9UPxztpzTuunIxA36J6wiqy4+BmSohWo1aDkaUoKtvYAIJG
 eL0Uq+L5f/6W4Y5g28ndrd2tka+uFAm1eOdQfFx2+MkdbLKOi2JzExOVkPcgjI9JOpH/q0SL/Jkpuz
 wAMU2j3NlI58hI95QQITls69ZvIsjtUItY965hdk58nfYuJhd+qWTNZXY5Kr/JHmMtM7stI038ztGC
 v/NU/d1eoE5OauYWiNFblLfvxstouQbwoRHuNTDjSwd64ipSltyk2eDP192sg9OXUuepkRUNts1Ugb
 MgY2Mm02Z5cg4tB+KnK41wfEENiwuviRiDVFk0hIym6rexpb3hK7BpaE4es/fGzlRGHF3BaP4F6zms
 k/C0GseF+bam4LlECstlVD/8jTI40B9UrOXm3Adegl/5PvwDLgaBpbYqCKxsTb1ddpT3d/6Hkfb0YN
 SaSaB3Q0/6o65ljjMICXCOfD1O1UsbgGePEJH4nqZU3hjWqcHQ6+Bk5nx0XNI0HGLv/ni/reAzeckW
 7ZIwE/29l3OVoogFMt72ZHymEMLDFVqS3y1BqZe0f3p5GNowkd7grzFX/hE7f0lHYJt84v2ufkYByT
 tCFeeDRTMoy6LHxlTCiUruqz+kfUOmK4uQSCJusUW1Ch6G5bZaiLz/xSzXsg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022849_719967_554BD248 
X-CRM114-Status: GOOD (  14.85  )
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

Implement overriding AA64ISAR0_EL1 to set the ATOMIC feature bits,
allowing booting with LSE Atomic disabled in case the feature
is badly advertised as implemented or incorrectly masked by
the hypervisor.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/include/asm/cpufeature.h   | 1 +
 arch/arm64/kernel/cpufeature.c        | 4 +++-
 arch/arm64/kernel/image-vars.h        | 1 +
 arch/arm64/kernel/pi/idreg-override.c | 9 +++++++++
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index bf13d676aae2cc9903c83e9a3c4be0ad4bc86204..74fa9efd6938905a6397c78aeddb03a134d4d8c9 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -963,6 +963,7 @@ extern struct arm64_ftr_override id_aa64pfr0_override;
 extern struct arm64_ftr_override id_aa64pfr1_override;
 extern struct arm64_ftr_override id_aa64zfr0_override;
 extern struct arm64_ftr_override id_aa64smfr0_override;
+extern struct arm64_ftr_override id_aa64isar0_override;
 extern struct arm64_ftr_override id_aa64isar1_override;
 extern struct arm64_ftr_override id_aa64isar2_override;
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index ef269a5a37e12c53e8e825e947b910f6d3efd296..1084475c479b0101e151ff7dfc12c7b79506cbed 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -778,6 +778,7 @@ struct arm64_ftr_override __read_mostly id_aa64pfr0_override;
 struct arm64_ftr_override __read_mostly id_aa64pfr1_override;
 struct arm64_ftr_override __read_mostly id_aa64zfr0_override;
 struct arm64_ftr_override __read_mostly id_aa64smfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64isar0_override;
 struct arm64_ftr_override __read_mostly id_aa64isar1_override;
 struct arm64_ftr_override __read_mostly id_aa64isar2_override;
 
@@ -832,7 +833,8 @@ static const struct __ftr_reg_entry {
 	ARM64_FTR_REG(SYS_ID_AA64DFR1_EL1, ftr_raz),
 
 	/* Op1 = 0, CRn = 0, CRm = 6 */
-	ARM64_FTR_REG(SYS_ID_AA64ISAR0_EL1, ftr_id_aa64isar0),
+	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64ISAR0_EL1, ftr_id_aa64isar0,
+			       &id_aa64isar0_override),
 	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64ISAR1_EL1, ftr_id_aa64isar1,
 			       &id_aa64isar1_override),
 	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64ISAR2_EL1, ftr_id_aa64isar2,
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 714b0b5ec5ac4a64037834545b0246eb04fb2bce..10deaa63ce7f801fb96d69fc97ae033bcea73fb1 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -46,6 +46,7 @@ PROVIDE(__pi___memcpy			= __pi_memcpy);
 PROVIDE(__pi___memmove			= __pi_memmove);
 PROVIDE(__pi___memset			= __pi_memset);
 
+PI_EXPORT_SYM(id_aa64isar0_override);
 PI_EXPORT_SYM(id_aa64isar1_override);
 PI_EXPORT_SYM(id_aa64isar2_override);
 PI_EXPORT_SYM(id_aa64mmfr0_override);
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7bab51a9de90d23fe36e1640e4b6b..326fa7d69b6df044d840164be3b504af6d8e8482 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -160,6 +160,14 @@ static const struct ftr_set_desc pfr1 __prel64_initconst = {
 	},
 };
 
+static const struct ftr_set_desc isar0 __prel64_initconst = {
+	.name		= "id_aa64isar0",
+	.override	= &id_aa64isar0_override,
+	.fields		= {
+		FIELD("atomic", ID_AA64ISAR0_EL1_ATOMIC_SHIFT, NULL),
+		{}
+	},
+};
 static const struct ftr_set_desc isar1 __prel64_initconst = {
 	.name		= "id_aa64isar1",
 	.override	= &id_aa64isar1_override,
@@ -222,6 +230,7 @@ PREL64(const struct ftr_set_desc, reg) regs[] __prel64_initconst = {
 	{ &mmfr2	},
 	{ &pfr0 	},
 	{ &pfr1 	},
+	{ &isar0	},
 	{ &isar1	},
 	{ &isar2	},
 	{ &smfr0	},

---
base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
change-id: 20250902-topic-arm64-pi-aa64isar0-atomic-8fdd47558eee

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



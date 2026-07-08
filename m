Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CDBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzHvY4Nn6plbaCF35zKiwiQUdpmfX8uqx6rHpqc+ZhY=; b=v20/xGXPRGg9SNe0gLx26NqazE
	wihqXYyMEEvqSPWbuS/SUGLxU6kr8gezKE5BuszM68kGUyqkK1vpJC0dyThUhOdKbxhdubDhopWA+
	JOeqgL85uMUnF2HmN8FIiBUvlj6VTd5i+ZHf8tg84tIsRkMfGodGMRozDig8bE1ogs+2QDRYFGsxz
	JgPlqopCao0us7GKOan5mf9M07uD4z8I1hq1JHak5seKAPVVP2vSo2f0S4/Gct9rVmlOgXq23lqSR
	+Jv/1ZKTVajkSiI3qb6GF7i8J344pB/PX9Yyc1n4tDiXAjQxplUHnQX68aCDL/Io2mlKwcJW7vzd2
	i2RREFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7n-00000000Ye3-2LYH;
	Wed, 08 Jul 2026 22:52:15 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7i-00000000YbK-1r00
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:52:11 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-49001defc4dso431934b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783551129; x=1784155929; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzHvY4Nn6plbaCF35zKiwiQUdpmfX8uqx6rHpqc+ZhY=;
        b=GcBkBlx2fQ+VDD/75lANDuHSFrT3AxYks0bi9AoBv8iSR7l+c2wPwIR51+oc3p1TuL
         jW4gNDns4H/trosy+Jn7b7AuZk+my9Sb7Fxu2ZykB5M5bjt16q4hmFFsdK95/ga93gCh
         cioOrvice8NpAO+Bn15Ra4ENCgbhSwATODfErtZTZ5NadEP5aWuZWsDoG+FqWdWOh97v
         ORzOcEHV5dvpo57m6Us+niUbr005hSkUUsITU/MTiZ8O9kjjmx6WgAv8DH21iKuC8pt4
         iYfoPiClmAGGkx4r21bskd/7F+61aiKuyTU8aCE12mqqV3YJFa7Nwc2xF944OdJnThpQ
         +jpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551129; x=1784155929;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzHvY4Nn6plbaCF35zKiwiQUdpmfX8uqx6rHpqc+ZhY=;
        b=BgIbn9cKOhp4FcS9QmTnhb7G5yJJ7b4IDvW/MRuXc+tFKyYq2HuTt+qU/ATDihgU2G
         mvsg03dm/ickWmk6yCYaUuota3e3iGRA/YGG56GYnpVogegyk5SveQjBPutb0BTD+bcp
         7M90QyRIoJwcbPANJ970OKVPB3Tvs5P715zice2ZXkRAp3kulgReRQkZ+8vGSgxkxQkm
         KRTlZa4y/CvkmFCAIS5yKVzXRAvEPQ/bv21L1tvRcHqS+1MH8clC32plUtUHWN5J6+Uf
         MjxVXtwLDFacrBEvYzG85DXMqmWeHV12fGdoLbqFYl+wBCReB2fREvq2Uu/ytlXgRvUz
         AaPg==
X-Forwarded-Encrypted: i=1; AFNElJ8jfRjk7nISXD+8bsmvaQMpcwI5RvJnkKWYqiS2mXba9ZDF8CO8BX+YU/ns2+dIRSw4T3gaYVe71bQ6Y35tbM0j@lists.infradead.org
X-Gm-Message-State: AOJu0YypNYb5Oh984jOoayOQmkjyHtOwgnZ34qO6t8cVdmwuw/QUKV22
	mvO3iAZrqxcRcywz0mkcHVjFxZ49XK/o7l/o2uiPvUu0yFeiMtb9Q2Ym3bekws+O7n++XBAVFNZ
	cA+SCJ7ixjmFBdCWoyYPIPBqCxw==
X-Received: from ilqn12.prod.google.com ([2002:a92:d9cc:0:b0:503:92be:9a74])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2222:b0:6a1:805b:5281 with SMTP id 006d021491bc7-6a36da5e3a0mr3401844eaf.37.1783551128581;
 Wed, 08 Jul 2026 15:52:08 -0700 (PDT)
Date: Wed,  8 Jul 2026 22:51:19 +0000
In-Reply-To: <20260708225124.4130846-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260708225124.4130846-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708225124.4130846-2-coltonlewis@google.com>
Subject: [PATCH 6.6 v2 1/6] arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, dbrazdil@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_155210_482888_7CAE8358 
X-CRM114-Status: GOOD (  10.87  )
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit cfc680bb04c54e61faa51a34d8383a0aa25b583f ]

ARMv9.5 has infroduced ID_AA64MMFR4_EL1 with a bunch of new features.
Add the corresponding layout.

This is extracted from the public ARM SysReg_xml_A_profile-2023-09
delivery, timestamped d55f5af8e09052abe92a02adf820deea2eaed717.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Miguel Luis <miguel.luis@oracle.com>
Link: https://lore.kernel.org/r/20240122181344.258974-5-maz@kernel.org
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/tools/sysreg | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 76ce150e7347e..f7180d391f829 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1669,6 +1669,43 @@ UnsignedEnum	3:0	TCRX
 EndEnum
 EndSysreg
 
+Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
+Res0	63:40
+UnsignedEnum	39:36	E3DSE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	35:28
+SignedEnum	27:24	E2H0
+	0b0000	IMP
+	0b1110	NI_NV1
+	0b1111	NI
+EndEnum
+UnsignedEnum	23:20	NV_frac
+	0b0000	NV_NV2
+	0b0001	NV2_ONLY
+EndEnum
+UnsignedEnum	19:16	FGWTE3
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	15:12	HACDBS
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	11:8	ASID2
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+SignedEnum	7:4	EIESB
+	0b0000	NI
+	0b0001	ToEL3
+	0b0010	ToELx
+	0b1111	ANY
+EndEnum
+Res0	3:0
+EndSysreg
+
 Sysreg	SCTLR_EL1	3	0	1	0	0
 Field	63	TIDCP
 Field	62	SPINTMASK
-- 
2.55.0.795.g602f6c329a-goog



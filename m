Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=; b=NRoyLyxkNGrI3sYl3ABT1kfopH
	I4P05zTJRQnHDZzDZJff2zmifwQnRF0IEbrDMt7/dKV7/N1ZIGEtNP3EqB1Xj3d8NBnnpuutHX0FS
	NGLK2AslZZnP3kh1eNm/90yzeoeCDlv0qn3LF2gGFvUfLAP9T3Tjeg5b63PHiWKexfB/JEMFak4Sz
	mafmPbznSf7CSVDBp+X2hl0P6Fv1lKM6C7bGrO17phzy3HrbVukn5MW4phWjGQTq1j+HRnWz+pEvo
	ULKOuxwx+DJdopN5GrErOzB091Dvvl9vo9I4JQGg8fX/CmKK9DsyXcKfEGYx7VhoUnFoC53BexTs6
	vYzYBjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqk6-00000007JdX-2UVD;
	Sun, 12 Jul 2026 09:44:58 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqk3-00000007Ja0-1JIF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:57 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso2520710a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849494; x=1784454294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=fre+z79f5aFoVRMSE8R/eB5cigs73+ONYEz590jhfW8YTdpvTD4S6L2VAy2DdfpY8k
         fBs/DEGbHf/Fsx07ZJDaGym3SNkySPKC7yI/oi3+EBnhVYXv0SZLiP1Kk9EqRMqo2zu0
         9pFVRZE/i1LeJkpS1F95NDtkn1HvLfb7ZOURaJQxPWI7Xpp/HMVFDj/eS6piD35QHrZr
         bUJhXMayyLh/WrAZUPkDO2/kJI3rs0/JXcriIN4MfMnSUSFBVbp8dShy3A5Jp9vQxSyL
         6npiz8ivSpUfR6JW1q/UbnGrS3umuxud6ms76EZ1J3jovQHUTWZ3zkoXWTtN82G9zRfO
         O9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849494; x=1784454294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=ghOVj/dJMwq05TpIlGWXw1IeOlqw6m35TF5XkJci1GF4o2J8WNJDVWzawwQXTziPr7
         SBeuJEl3zvFtSAmL8JJtxxA8C5uhSaglJ6kTt3VmKlKqzeGaQTe7MT+s8wcI/3KKEIfO
         1kyZOwAPb16Q4+lxMPKa7gdKuvB+yo5weqiqrnof+oZAbjHZebpkuLq+aPu34LvPDZP9
         IuvLxSTp0iEDyuAqe+Aj4G6AdgaxQTFwiQotSjzWKxYewJ1bdf9LuJL38v1G1YqjQpwR
         vHIrTO5dPSsIfD3+AeRTqltQN6zb67X+wr/++eaWMmzQ7+OfwHSU8S7vqDyas04nlNfS
         CKqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAwqYvOoSAyEdqWP0T0WrOlqnJG3Vm7qXyujBZk/6X3mOgu+2tN/d1X++hM964z6rxuT14wxoU8h6p8n08w1Ea@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9p1IkQgpDgMGxZN8sm/llGfeTHb4rz/ahotQjSL62pVXXcj6h
	hUSECBchKVqxJ4Pj14XZ9ZwJLvLTr8JoX0CpfLTyr77tFyivi0LUZ/cT
X-Gm-Gg: AfdE7cnXFyMym9UrCu73iGtYqcNNRL3LJJJR+Z67jOTztQWIUOYQYweVB8ty5LM44jc
	ag66RoYhBphQUL+EEiWd+buWcBoGGiXIfJ7uqMgAQ/T2e4NwlF6y8WCBMMJFFM8pbhj2ENtstSh
	qtES13mDdsVTOlsN/KDS/b1FYmrsQeWpgi3G4wBAHNMG23tTeiaKEMM0NYyjswLCsB5CPoCYlTA
	ivWxdH59JJ4Raue4WhyiaRmoKnNXTM2sUD/ZBDwqjCgzgu18OHAlEPvEuXU3//gsZ4j4hh8AZPY
	J5ZexZIV+Lacxue1EimmJb4xcSsD2W6euaaOTEzAvEQoG0SVO+VWjx0dn8NqXtOvFI2W218TsCG
	cU/fgplLt+7+ELtfvSJfwAehe1/EfbCLTPJoUL56agTG6ygh7ocapApFXvdau4D97g9o0DnTXoE
	JtMnekL3D7Z647ZPpoRD54E/UDf4YNIrzt4+YtJ6lS5G1iVNhN8QkUa2Z5/K0/QMrK+ucY3ov+Z
	2w3rYdEh2b5im9xmb0zEhhrC1ikqKsGdsczvku/+VtH7SvDZwcgPZ8lpzirY+m9hGSCA2VxA50=
X-Received: by 2002:a17:90b:5243:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38dc7747c1amr5458934a91.15.1783849494649;
        Sun, 12 Jul 2026 02:44:54 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:29 +1000
Subject: [PATCH 10/12] arm64: dts: apple: t8103: jxxx: Add device-specific
 SMC hwmon sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-10-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8/vnYgv/XYpka/uGiQL2oD+pLTdDywIPDenEMn+m6Q8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/VAvW6a1lWsh88sVBzTlO6dHl+kAjTBpeT61u1W
 GcYeLF0TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MAptpNj+GfwlRJ5+aEf68VP+0R4DrOrpvlee9UWpToiiAm1uVSwQt4GRk+Keb0iMq
 eFHWW1WhfU1I512Oz86GJEwpflGWH/uPSfsIPAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024455_401966_C89ABC3A 
X-CRM114-Status: GOOD (  10.34  )
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

Add the device-specific hwmon sensors for select T8103-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 52965258200d..1212852251e0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -74,3 +74,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 52f63ae7a58d..1d074b9e6018 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -132,3 +132,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 9eb2825d25dc..f8b2b1637b9d 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -54,3 +54,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Left-front";
 };
+
+#include "hwmon-laptop.dtsi"

-- 
2.55.0



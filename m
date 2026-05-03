Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC3FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=; b=dek4Lr3K9GyxTuvcvo745+dk1O
	E8nGN0IB2OwstH+4aiW8i+T0YVU/CF1yUDxdUEubLWV23BpRfWbldlsyqRDQ6lj3gXtya7DCYH1PV
	aGWJQFiRve7+fCPKZAYUNTZq0QNhNWM3OmRHdcXH9QOG8B69lRgP68WkXV2K4dhLCe/8His3j82rC
	Sp4EMBMBEHWPh3fQAvMtFOdBUgnK2igs336M/WbNXCL9kfjnR0dfkP9DGKoDetOWRKvXY6fdB7I2X
	RLoRAjSc6uteB15Vc/U7qyM15ZVWFnYwUH+qCXTpwiWEoN8XVlJYOW9mJIWlV3YheIdxSY3PKEV9v
	bTxrrTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSIg-0000000Adpo-3dmN;
	Sun, 03 May 2026 08:35:42 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJSIf-0000000AdpI-0oH6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 08:35:42 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso2368581b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777797340; x=1778402140; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=WpxuEsM3hnXZKEXPiPfbwRR+Br02j4BSnzDl2gvPWaU0mWMpGH9b+OQ1+QEyLssqpH
         Ft8XqarWrYHwRKvqd414iwJZ9lIHz8tGTltZ03m4RjV8/vsjYCnzl5Np7BwX3gtYxzrQ
         HZ9AMWQGTclWWO8oRnrMLAVOV/VadxBnQTLbir1cNtQUJXpmhfMlIQv3NFimY+GbUJ4F
         qkhGy584soFH44FMQfxiclGezy/pA7546eTFKn1dph60lVZ6ChNPhfG+aGgWREJ2suAU
         Waybytd1hvNvfSacsPiPfirIJ+GkIRuKm75hVE3mECsAv0ey3ysLbOctIe4RqPxqPqKq
         +k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777797340; x=1778402140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=m8o1t6vg7QWzzwME3NGQG4euXF/2KjwfflZVczbwKHl4JbEM9+CH28Biuwsn2O8MTL
         Q7Nlgbr/ODNCYMLXvz906O/gKMIM54IqTEdMRsaesiQrGvVPsGe8uoVcqefW9B3bF4Ku
         Vo7T+DmBw1kz+v8sMk776op3yVYGieCb/8sBAyMKAp/axHfr6COzgU2rSt+97U+uZBLn
         UrXVW2cA20rFA05weZUGyRP4OVR4TFfL1dfhsRxXdg/0hO0cz7CNC38KOC+ttxKCodEV
         N0ZrBhTr3CNHI+kXvDJT46dy+ZtHLqoN11D+RV1hycIfNiwNAQIwhqDZ/IgllXdp+xKH
         7ljA==
X-Forwarded-Encrypted: i=1; AFNElJ8KrY+qTq/P6+kfBPsAXMkSYkm6a0K/rWxvSSwmpnLqGqbs3S7DXUAiZYv2ab7QYLhxKr0scnwa24ywJjf1THX6@lists.infradead.org
X-Gm-Message-State: AOJu0YziEDjPR+E4bULbrX8Aq1LmJDREB4AK2WXVgmSOFj0wFLV/pw1B
	kb2M5Mr1PLB6su8UTi7RtV7per5G2I/kObNDxFBYmmf3Csm64fhj6usC
X-Gm-Gg: AeBDievQqAvVqwUkZ7d69+5Y2IG0+LhhhqcBYIh0ylXlha7dSlrPUB+pYlk8oorWbdh
	AH0bRNoXppjCSR2XOUj35rR7yvj/PXONppZzWnkd87FiqbPk3IUYctlXGfThrZM3TeTZ0odLH2r
	7McpfkypYrUno+jA/Alk85P/uyTjejAhsgHQnJBwd2r4kVj8mbI3qwma1P8IzKqdgKkeIGIsn+1
	MZbe5FmlSEoRZv8t6r4z3meozAWEUNY+jDF+KytktpGe18U76U4eS8akMFED1+HJ8a8csncje1q
	4nfUMC60BVrx1Ze8TBtiHGK3QDBUBES7Xi7JldLfNLy9BwWh1jRfgi8ta1+idLgDaJeuOfn/C3t
	3p3Bqgm9WpHMqllPZ+UMpLvHRv/K8QnIPW92jH70lR0jN1X7Z4svOjL2EK5ZTJXyYVEnbGFsE9i
	ckF8fdcD71XoJqyfne7fwm2SkvCIMMCF1BvterdiAyoKqX1VTp5ndAFog=
X-Received: by 2002:a05:6a00:14ca:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-8352d1bf331mr5683330b3a.18.1777797340207;
        Sun, 03 May 2026 01:35:40 -0700 (PDT)
Received: from Black-Pearl.localdomain ([60.243.224.75])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-835446b1b0asm1578142b3a.8.2026.05.03.01.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 01:35:39 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 03 May 2026 08:35:29 +0000
Subject: [PATCH v2 1/2] arm: dts: st: align node patterns with established
 convention
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-st-mmc-v2-1-11ae3216d2ce@gmail.com>
References: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
In-Reply-To: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_013541_238217_7808B7CB 
X-CRM114-Status: GOOD (  11.83  )
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

Update ST MMC DTS node patterns to match established convention.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3e6a0542e3ae..08acba209c56 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -596,7 +596,7 @@ spi@9542000 {
 			status = "disabled";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -611,7 +611,7 @@ mmc0: sdhci@9060000 {
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;

-- 
2.54.0



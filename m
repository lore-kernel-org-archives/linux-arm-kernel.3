Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD937C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frAoU9FSbapFrq+HpklqCcJQ3Ks77Q8uuZdWNADgS9o=; b=u0ODgW/SAnEm9AFP9h/4iRnQ8V
	mHuN4k58IJXz8aHa4SnY/cpRhPtwS1uJyncWnR+7ZGA4kvmy16rXSGdDGVkDgJIP8iJXhm+rZD5hb
	rxnks8Rbi+MiAmr2yk0a+m1d2FzNvhGYwsDaNEzLxo0MEDRtIe6i6gDfFpukHmHKidf04c6R1v43a
	WJGsVRIEdL5crz9XXtX/+1VBMk37dc0bvW21o6xBV0xYd2TR1hpRWDyeuVGximGTRNmXQYAEseEyf
	8Xpqpy4UHZA3G92fLzegqrIqG1umeaOsDQG/j6GOH+aXAWiEXRLmxYAeaYgEodkOGtoTkEvwzMMr6
	lmlcXGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTMr-0000000HTUO-3Num;
	Mon, 10 Feb 2025 12:58:29 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTGg-0000000HSId-0dZM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:52:07 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so641363466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191924; x=1739796724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frAoU9FSbapFrq+HpklqCcJQ3Ks77Q8uuZdWNADgS9o=;
        b=eNXGe0Tp2chAm1GwLYOeuS6wFeJqamxyCxkYL65Qx0kNn1iV2THsoqigny1D1Rv+JM
         g2w8X57bo0TSTYr1XdIYCfYaOMG18rcMZifVuBnmStyzh8VIBdW0kfR2/FW5DLg8R0VK
         k5ocE6EEVHxTOgrrnNmCp44k9lwmcwdYCQa137KjRlqhQoo8if+EJs+IFIikAqMv3Adb
         v/n/LNZVMgM8ouxErAlUk1Q+c6c/BNhHoxP5+pWbULzU6Ja8kkq2FSZ7oNU0i7njkvL9
         591AZfWxtpCYr3+KcubOmvmLQYZ6gGNvD0Seezi/PIl+71Ehd3gdwdiGuAt6FfkGs3hZ
         L9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191924; x=1739796724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frAoU9FSbapFrq+HpklqCcJQ3Ks77Q8uuZdWNADgS9o=;
        b=BdeUIg+DkGs8evl9s5Dn8oNXlduuV5b7xZdfSK220XihpiHzynP7gltMEdE+2xBoLJ
         1UlvX8NBSiYnbA6QSzpwdkZdwNekY+9TGy5oHMfP+OlsYHsMF1iDhftvXpGgOYgO0yOy
         njSYaYVrnrOR73QL5+K6syQrddMSfDWFgWasB3eeqTMIxTM/dklNy9OTRR3Dvsjzlc0T
         +7NTa+Ds3HpCXHKyREBGskxAV6mbNL4OA6f/0B5Ue5jg9/OW8+Bm3cA4NtYhY/ZO3/vx
         EY6P34pdycAxO5/V333lDgYeSbeW0NwohAZaIlpy5j5niE3XuqW9I0qdMjOu/fnVOVt5
         VnEw==
X-Forwarded-Encrypted: i=1; AJvYcCUuICh/SQ+Z9cYgaYnG+Dl+IM8RxEqp0G10MX/epvR6LHp52ejRmBs6gc6n511uuwEVANUDLA3Zak0UG7dCnoHM@lists.infradead.org
X-Gm-Message-State: AOJu0YwPpUv8g6eY6n76JytovfMOStsQUAz6MsjLy0zAD3PS8F0cnSlN
	yQTaflIMpSBl6XX++NCL0N8FHflg/c1cX3mjSP7fXtff0ghxHP5jDRvSpVEcUMM=
X-Gm-Gg: ASbGncscOkqhlGLtJ/sM7fhiN2WHAKoRj+v6sBHD1t0pA0+BkdTucy/VHuBl4sBOE7c
	UAa0ACg8rpoj54fFHfRoQ8Yir7ayER31tx0xq5O0OOHO1/mLOgjGpyrlpdlqMh5Z9QR443pEnMq
	wViULmWHo8XhltV26CyMb1SdHQqiPt/Tnnvl6pVAtcTXz9UA7oqftIARdOOlEj49XFaLIzifrb1
	hlVkappz84yoM+DTX+oZ/EjT2+LzH/Zo25fZadD6kpEC6/V1Q7L0rN4EcSdVMTfnE9EjQ7dZj/R
	QKsgXwoAJJrgzUzffGGmZ0WU/rD7gGx9F6vts00kVXc5jBg4xRuYz/Rq66fVtMeeGwMKTG80gnE
	=
X-Google-Smtp-Source: AGHT+IHlPw1KLXMN75TVclRX8S/qE4XVwnFHG0ZCFXVtVKAbnSQdsY2Nvm1erECM0CzNh8K85VHXjg==
X-Received: by 2002:a17:906:4fd6:b0:aab:d7ef:d44 with SMTP id a640c23a62f3a-ab789aecd06mr1234271566b.24.1739191924470;
        Mon, 10 Feb 2025 04:52:04 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:04 +0000
Subject: [PATCH v2 3/3] arm64: dts: exynos: gs101: add reboot-mode support
 (SYSIP_DAT0)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-3-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045206_196840_99C8FCF6 
X-CRM114-Status: GOOD (  16.88  )
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

syscon-reboot-mode can be used to indicate the reboot mode for the
bootloader.

While not sufficient for all boot modes, the boot loader does use
SYSIP_DAT0 (PMU + 0x0810) to determine some of the actions it should
take. This change helps it deciding what to do in those cases.

For complete support, we'll also have to write the boot mode to an
NVMEM storage location, but we have no upstream driver for that yet.
Nevertheless, this patch is a step towards full support for the boot
mode.

Note1: Android also uses 'shutdown,thermal' and
shutdown,thermal,battery', but that can not be described in DT as ','
is used to denote vendor prefixes. I've left them out from here for
that reason.

Note2: downstream / bootloader recognizes one more mode: 'dm-verity
device corrupted' with value 0x50, but we can not describe that in DT
using a property name due to the space, so it's been left out from here
as well. This string appears to come from drivers/md/dm-verity-target.c
and should probably be changed there in a follow-up patch, so that it
can be used in reboot-mode nodes like this one here.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86741994bb7c..d60e6a8e8723 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1411,6 +1411,19 @@ reboot: syscon-reboot {
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */
 			};
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
+				mode-bootloader = <0xfc>;
+				mode-charge = <0x0a>;
+				mode-fastboot = <0xfa>;
+				mode-reboot-ab-update = <0x52>;
+				mode-recovery = <0xff>;
+				mode-rescue = <0xf9>;
+				mode-shutdown-thermal = <0x51>;
+				mode-shutdown-thermal-battery = <0x51>;
+			};
 		};
 
 		pinctrl_gpio_alive: pinctrl@174d0000 {

-- 
2.48.1.502.g6dc24dfdaf-goog



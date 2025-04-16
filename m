Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0D4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN3T808R3XeniltkqTvP/grwdD/ekkru3ZTmvy+YPmo=; b=OEa8zY++Ka1eBpD/VLAVF8wN08
	nWG6kH2QlzlYs/S98uYymVCQcP8J3/vnZQUNOfX37XeNwrL0caYpTkWr8qYsmCuPXZUc21oF2PC5i
	GfRk+qwnWA6Mb3ZyboYIkSv3ZbCfB7x8okRFRfxBMmR2lU3WspYXknAe06FzkIMCafEFOpW8LgJiY
	2+Lb3ZJD8KH0X+luinxSdzfCUOvtG+dA7R2/nNewv6pdbYtHRvHE2y+AMZ1JLl7UHFBpO3M9maOGd
	45/OVOqk5B1L+Efxbcolh65+xhERzCeRQx8UfCeEqbGCZrz7Pd1ud2/n3Z7n0ub6SIb+ZDiBrX1A9
	nAy+GgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502U-0000000989P-3fb9;
	Wed, 16 Apr 2025 10:30:42 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2a-00000008nip-2NWZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54954fa61c9so7875104e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791759; x=1745396559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN3T808R3XeniltkqTvP/grwdD/ekkru3ZTmvy+YPmo=;
        b=BuoM0B7+8Rzp0vgQcJgeUf6brZdEKuDhkDr4iDxuWLdog6mNN0II/9WwBbpx6JjNtO
         8f8K05aFFJAuAfWk0xLNMnJ1cSPqXuTX1+aOUICK5JqgTKiNbMVQ/5X3bTi9lJM12gy+
         y09nrwYOZvyTojMzIfQxTH2o9wROO/N5cbjsUHY+cin7XoJTS1wmWA3W0srbWNRxS679
         egLNettRCcqQLO7odoO+1EpaaXk+dzLh6yjZIbvxbXK8B921uGX5xD4hnihS4BBYZaOQ
         JmaDUu45T97Zs7aeUugcDpzjrAxV/Gm1QiZWkwlKCifrXp2cAuJqeS1OfUKuhwSM9vbq
         /cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791759; x=1745396559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN3T808R3XeniltkqTvP/grwdD/ekkru3ZTmvy+YPmo=;
        b=hiS3i6sJdOca0eV70BNE2fCDHKcCewyFZx/V5zfLf9dh6/iEUgEr/OecZSqK89G90v
         f/sbXmHq94liCudzHhnA4s6yRrWVeuFR2/vcVGjNT1i4moCyrEbt89pKjIVomWvqKj8o
         IPVOqi0LfsccmNBq8bdUfst54gjbL7MnDKKYFoANg+noH9ULAx2hOB0weAtATlYjqGXo
         t+n0gao9OHWEVjjtW3MiF0G/XjpjJdEBCDSaDhoWbcESUhFzLBsDiz70aU9hNVwtqHjZ
         vJBTjUI2wrp6OZp+zV6+vFt/XgwrhihyDqESFkM2gIvE7JN8t+8BDsslgl0Il3+jqFs9
         3bUQ==
X-Gm-Message-State: AOJu0YzRmK+oZ77Hrc7vGj6olxp0bGF9B1tKXMJfjGQVkMZCafVD44Kj
	Lrb0AuyFFG65Nz9S5EecQaEzUj9NvV6v3+i/g4Q0IiWuubrNRs9S
X-Gm-Gg: ASbGncvHyl/PX992g280EyeYqX/oMUCgiNOfjL0l82iQbBar6WBuafgzr84HEpqk+RB
	SPuPd5dyC+N/kTYlK2oUXXtyrQanv2h4q9GBAupXwU/2fi4Jvf+mgciOT6WGFEpswPvYoWJWUfr
	j1R/rZvf4ZH7rHdoTmwodi93gTxbc3Lzj3cFLpCsXc5ksjd/M0YlGf8WSwu4yqc97K4JLvd0W0P
	qg/O9cvOC8uCIYQsNeXwiTp3EpEF0UqlrJZ9dfERiwNhrHKkGcSfx3ck+/aTjbFRdLcgHmm3WBo
	iOpUx7CUH0vnAKNfm6F9SzRxB2+pHaLfNtK28LjAEJWMzzGwPU6H
X-Google-Smtp-Source: AGHT+IHLnzhAfUmS07LQuEAg0BM6zGBKpHgV7Xn52yUhaC1Tl7AKbKAALF0drT2m1wxPOraEhGXkVw==
X-Received: by 2002:a05:651c:512:b0:308:e54d:61b1 with SMTP id 38308e7fff4ca-3107f73b104mr2702101fa.34.1744791758498;
        Wed, 16 Apr 2025 01:22:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:38 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:36 +0400
Subject: [PATCH 11/13] ARM: dts: vt8500: Use generic node name for the
 SD/MMC controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-11-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2298;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=FAOknd5/teloNUV93bWzTFvFaFt+Ny9oXh5ASvg22yU=;
 b=yNnCqyrdqnzkXsOrIil79eRxohcRBpFCYcHpQzQIW4YbtsecxwKAhq9mOXcV1BEY67kfFvzDN
 Pp47FfqQTBjDEozLzPnn/iGSaCJh/OvNh0JrDJ/7ki0H9gNvnKNYTiY
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012241_151582_F17A247A 
X-CRM114-Status: GOOD (  12.08  )
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

Current guidelines recommend mmc@ node names, so use that instead.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 1b9a18f498613d649d4f8bf87ade32d1f7edd9e4..f39632d3f96130dde1696509ddcff4dd8ac177b5 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -279,7 +279,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x400>;
 			interrupts = <20>, <21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 34378a49ec2017fe2771a38033788fd753dee875..3990a6b3de96f5fa1f63aeac306fdb252b1509ea 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -187,7 +187,7 @@ usb@d8007b00 {
 			interrupts = <43>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x400>;
 			interrupts = <20>, <21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 1b7a02834ac14fcd51389a6a809b5f0960d63312..081bc5bb5a697c849fc6bccde2ce5fb91c110a32 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -319,7 +319,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x1000>;
 			interrupts = <20 21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 76337244a8e051732e9ce3432eee36ccca9ed463..55de8d439688c5710d1e9a37890bbd274895be42 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -289,7 +289,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x1000>;
 			interrupts = <20 21>;

-- 
2.49.0



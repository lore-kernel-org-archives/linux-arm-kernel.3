Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9DAC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2St31bPcYlMznkhjWLvtUzdzjZa/jmylV06mo55Op4g=; b=uymmNC1ca4z8DYop8RPDyBmNiG
	Ni1nIt8VkputugHlQEKBSWBfEiH4UlkoLFqp+cIQf+D8Jroo2wKNWNo+2qawD3F6d8V1rfzHCc9G3
	uZenodkLd5MXPjWvFUEM6DTYOEdw3b7DmPI2O0g6t7YkEYo8KbY4emizcUoZ04PP4jMWd+M4qTTCH
	nyQ9lqLXWm3ySKjwf/5O8B3HPuO7c7gKYbsn2pX0f2hIc6nj7mb2wP+yz9asvJ9gjTj+5Ad3HgrSg
	161ycA8rVm0YGvAEo/tgCp6BdXgxTx2ZJJBpRF3hKwUKNYUuo7+LwUcycJMWWIcaWgLb+MhqfwJF2
	CFHnHzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502T-0000000987o-4A1R;
	Wed, 16 Apr 2025 10:30:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2W-00000008ngw-18ZU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:41 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso50234e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791754; x=1745396554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2St31bPcYlMznkhjWLvtUzdzjZa/jmylV06mo55Op4g=;
        b=kYvyDEFJLIsVVvyPVpegKd2Co2fzjCFVGlsqA5c34qlhMtQyHPPJGQLlrD8WTYRgqn
         AujUUsC/S2vkxeZrzO0XCEUBXDtFKF2BGdRTEnyI3k5NaQK8/4M30GhOk0XKXNicbL2U
         +12edavu5wKYB0InM/1n9NHonmrfSnRo5ZT/Pn6UQIN9SSVUdZlIfBJL/6ooELl52WO0
         ihY6/YeoJIChkboV7Oi/xHjQxCAknMwor5Uf/dhT8wq6WMPoML8N7AeaGtUtMyqV8Agb
         jjI7XKtdzrN9jS/zpACpBc1/MYSbOKrYOzVBOWsqtJfecJDlOWz/OkcKeC5FOqj06QbM
         q32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791754; x=1745396554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2St31bPcYlMznkhjWLvtUzdzjZa/jmylV06mo55Op4g=;
        b=EVlfz3aTftMKIFGA4HS493ZQnCIBpOdgMG/L4MbsNtBIQt6CWyDfmJJkcXrlpBeVsP
         2lMvutp5GEm1ZvE3GjdupmBfxhGhwZBql9NySWHoXdMxRnDDDF4zysXfYS0WYmlpq2Yp
         5Ol6S2kxMMqQ+j79Mi/PtU1oMEgEjDxOToEa46Q0rBXJnBa6ezm1PxWfYwsWM1PM+Lw8
         orVdSrrKt9vi7oAVWEm0bjEu66soS0HcsPU2/GHpW/rrW+TD6Zifr+u/zVOJy2cWZnxh
         jj2yJKOnospKeK+n7wPd+XQRgc32FpeXi8qWfa7s/hBb7ADfbq/x5Eze9Qi1Et8Bljnk
         +uwA==
X-Gm-Message-State: AOJu0YyAEMRTb67tNR4KazvW0xFlgznjKPODMMH7F2Zatxko3aZzImQk
	6MRGU967SW0fAcnDMxv452i7ff3zHLLLbFRGk8M0KcQMgHp9wbj7
X-Gm-Gg: ASbGncuJtf/9VVFI1lBBoIaIOnjFXUx9DVw/HEdeiYReTMMpAEaqnIyx3FNETGJEOoU
	0rYiNo7Wt30cKMqAOl6XVjRNV3dIgxNTDwmaGjpf395Ek9k5MK9mp9hglM1O07wBBPaek4zQsyj
	Eedfh1OMOzH8wkHOFC5peNGtSD5/RQxITahEz7Rn7RWo9ye/LLtdJHUS9pAu0lZkAGiONf7Z+oc
	l5g6rEszgc6By2qlzmofBzD/qcA2EjLv+fPpKpcU0GIeQ8zXSK0mwzAEEINDHnTVu6EXsaCjGNH
	a7GalvqiuDQJq/y4iVlpRnFICgib4EfJLi3lab4oA0n4T2wppDuQK49pSAJpqLQ=
X-Google-Smtp-Source: AGHT+IFb5qX0XvmZ5ZsVgPWiDomLFb6aepfbcplxh8QI9Sk/uDZL++otj+xKzMeCKeaOxLywh0T8Vw==
X-Received: by 2002:a05:6512:118a:b0:54c:348d:19b7 with SMTP id 2adb3069b0e04-54d64af007dmr288077e87.46.1744791754143;
        Wed, 16 Apr 2025 01:22:34 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:33 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:35 +0400
Subject: [PATCH 10/13] ARM: dts: vt8500: Use generic compatibles for EHCI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-10-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3187;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=sXBBymomR0aMqR41BnxGJR23ORnc03EabD898mjy8I0=;
 b=phH1l+ArqkItHllKUYxgujxVUZbixuP6/yDZMbVo9thwv4ACvTy/s4XPnDaRM2uzyQ2ho1VOr
 OXL6RgN4A0pCh6kidlqxTrKQumUKlP/GZBHpsmQSZaHYW1WUQC+iEBE
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012236_312994_7619B603 
X-CRM114-Status: GOOD (  13.69  )
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

VIA/WonderMedia SoCs don't have anything special about their EHCI
controllers: in fact, vendor provided kernels just use the
generic PCI driver by emulating a virtual PCI bus with fixed MMIO
mappings just to bind the existing driver as-is. So switch to the
generic compatible to save further additions to bindings.

Note that these devices have only ever supported appended-DTB boot,
so changing the compatible should not affect any existing users.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 143daf983d1d926c2c837c43002d1a86cff3866a..b848fc33aa13796c098a511c26b4c2280ff453db 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -106,7 +106,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 69d2351a81dbc816efd19ffe3ba5ef80eaa4e9dc..1b9a18f498613d649d4f8bf87ade32d1f7edd9e4 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -204,7 +204,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007100 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007100 0x200>;
 			interrupts = <1>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index deebe9b933876bc1eb188f82ce8c1c17098d04a2..34378a49ec2017fe2771a38033788fd753dee875 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -176,7 +176,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index bde825b59074eb74af4ab296895a3968e992aefe..1b7a02834ac14fcd51389a6a809b5f0960d63312 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -248,7 +248,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index e8385c03e04bf5644c86a85aeb41e1cc1eedb202..76337244a8e051732e9ce3432eee36ccca9ed463 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -234,7 +234,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
 		};

-- 
2.49.0



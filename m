Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49863C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=; b=Oj6z4Q4EZqX/dtBToPcNSYma4U
	MiB2V/QGLaQZ/e97VwR/AfmI+IUbcfZ/i4BFT3Cd+bklBCm9nBHcx4L0mFnPBqh1u2RWM+VpTe8mw
	NaYB4GaROsDDwzX9QfrZxSBiQriCelULaCsYOY8JGkR3mj7Ip9bJtRzskfv/iIzgwpTn/epPopxhz
	/65vY0kiKtYJWtdIuusbmfFgbxdvKs91sas+V7MtiLLkKdsAef9cgTiWYc8JEu5YxxlIbHZaiG+KO
	GVNckD8xo1XJ+q0Zmg74+sdQZondgzBDjSL9N/3LV5ax6jaH/iuvAV2DHmR/3FnNZ44GY0QwDH3y+
	NueRnu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCxi-00000002K9Q-39RB;
	Mon, 03 Mar 2025 21:04:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCoT-00000002Hv0-3Ryv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:54:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abf3cf3d142so396830066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035296; x=1741640096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=OSV7x+912dWH3eUmyKl5jN41mLkj0EsVOCBIupplTJL/1AGeAdNxpQZ8hh7ais/YHz
         Oav1I0EI6EVveXkBfHQszMrKz1M80tZfsViPrjph8wLIkQjSNy6GIWxeWHFAeiDdEgPz
         dA/vvbHiifeqJA/G6wUm3JcW6nfs8nly5JwrtaUv4LllFEAPTRGNNPPY46wYpqdzcu8s
         8bdX4EEgTNWDLwlkm70DaVkToFx3fSFMSr41pYqNzIOQfYOUs1Ti/LcSsJwv3YMAFgoa
         pyS/WCrHdvYfjnwnkXXr2tVkiqvzWYFPTSmoIKBc+eMWapUU3O6/Ptp3XfMH9YVgypYd
         1EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035296; x=1741640096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=syH2boKPOM38JFj65hf4C2l49YEHHRtoAaq+jhaxWAcaE4RY6VZ6deavA7jf51RdMd
         gra7S9SuR+hL5aYz0G0oDvUO88XTKBR5dMHszPgVzKsWe+3aNATMJEKu9nMyZKSPk4gn
         Il6TKKa7O820SArWaDFxDOO3wYbaW4iC/zKsBlkLJOGX82lxl4u6IWcln8pBwAfIFmgQ
         IDCr80TU3QzB8jdxeocgCFy/5zGaE7Pw7oS7g8y3cJBxhq6Vmp6D6GuR6Uq5OQehzQ2v
         YNhghL0RedW2JpZ5xrkZY1K6ffowry4erDxtd1zw9i8foKdPpEf5FE0Qr2H4/Ln8emfs
         GtuA==
X-Forwarded-Encrypted: i=1; AJvYcCUmZxqvz/K1eWCDJqZG4oVCkHXH1VkCdPqQo0k+eVcY+GOKHRTwkHyA2dEC/z2D9nRGgJ4L2mVEa/u+oqtev5sl@lists.infradead.org
X-Gm-Message-State: AOJu0YxqiA90eX8MlVBnqs7bzHYEbjEl5hZFVFS9WGnq/a6Y+24gypNH
	Ggc+TOFLG65FDIsUsT4SFNbXRFcWd9MOWmOyxj74rDg4YvDODAst
X-Gm-Gg: ASbGncueJJUkjMj4BMlXtLb4OnAj6tCk0b2aIrb9mxOsq21hV6vnvYySLrpjmqEPNx6
	J7eICaZ424KhNm9WLgAH8Wbg0DSyAH01xeNcixfneCNgasRUrjKUya+9wdWYWG8RKbue40q6WJv
	hn3k9d4Lvo+F+f9lzqy5/qChQbKsb9+hRdo+bNAbpumTkdU+sVkLqTHBfpMCl+Yh0JHN4RmKPMx
	WGsJEiJxhLsMKp3XjCkODdWPD9kO31vVQOj7EAY7+lHVbGhtUfPMsIoOJJM/lwWggX0eQdxBG/j
	iZUetJTlEfJCJHNDMPk5F1D/zzth/RwYsnMGHvZz2VBV29pOf9/sZhH4TxHGnaKupMIFRKYhKm2
	I0FULTEGiuaEY1Fs=
X-Google-Smtp-Source: AGHT+IGDI7pPv3lVt+rtcFBB5IROIltZWrNOe4w/ZJaBmmY15fTDvPfbBtSNP4sxXGInWKldhjFdgA==
X-Received: by 2002:a05:6402:274b:b0:5e4:d2c9:456c with SMTP id 4fb4d7f45d1cf-5e4d6b4c7c3mr40715061a12.22.1741035296337;
        Mon, 03 Mar 2025 12:54:56 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:56 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:50 +0100
Subject: [PATCH v3 5/6] ARM: dts: bcm2166x-common: Add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-5-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=896;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
 b=HQJVvUGSXwOhIIYSvhAUlGH8JPKIWUXzeLz6tFP8Ll3GDEsJg1ztwXI+2rQDG0fau3eHN+lGR
 y4cb5BGlq2aCLM7KnhcV1N0l0k390A3EFWxFn8zbCCboIhienRugbS/
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_125457_875133_B6626B55 
X-CRM114-Status: GOOD (  12.56  )
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

Now that the pinctrl driver supports the BCM21664, add a node for
pinctrl in the DTS to allow for controlling pinmux pins.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index 87180b7fd695e65b52c52743e6315cbcca385fba..d4b412ac8b0343bd3773f50c59a20fa00a3923f8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -46,6 +46,11 @@ gpio: gpio@1003000 {
 			interrupt-controller;
 		};
 
+		pinctrl: pinctrl@1004800 {
+			compatible = "brcm,bcm21664-pinctrl";
+			reg = <0x01004800 0x7f4>;
+		};
+
 		timer@1006000 {
 			compatible = "brcm,kona-timer";
 			reg = <0x01006000 0x1c>;

-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E20C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXZQ3iTLaTcFIc0MIbkuKG0+bnWN6S1esvXMq4e4+0s=; b=cg5vB9aajlKFn115iPvIxJg6Nf
	xKlBLBmXz1rvR+tlfnD/VLZF7l0/tgcKAvYoPj4N22PHjoop73wUNvXFJqQDVk5Z1ogQYDkKaxL8n
	IogLiC27E7RGDbeRcn90bQgTeHUXmydC9CBotKDk8CCgChOL+/QZ54xbrdQdoK890XW5pcdvcNwig
	q94Xz8FvCrr1wWwmEOSqZvO8xCjufA6OYI1YpLMxjTHT+09rfgpyvz9k6eP1xeCnlDGHbsXmMLgPE
	MkI/cN0Riq+HbV6neFSgglZc1b8u0wEyPAroh7yJ3JVBCBoQwd7qg6doaB7DLWLD+8pV/2rNWCFw4
	J1lJWQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taY2d-00000009x0l-0XIc;
	Wed, 22 Jan 2025 10:32:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXv7-00000009vTX-1zcr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:25:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361815b96cso46701875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737541512; x=1738146312; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXZQ3iTLaTcFIc0MIbkuKG0+bnWN6S1esvXMq4e4+0s=;
        b=C2l2LzK7dhQ+9LoSPvbijl3jTEAEaURfdU7tYlRTSj4BC4Z+q4B3Y5igYMGHSmBHzm
         5ZLcSE5k8cI/Qx9wQxU20Zx9asj9taLoDi1XNqsD4wStn90Don48JoFVeZAD5FQSRJXD
         f6g/4rcynkC4Fbn5QYQX2fFRgyP0Qw0CnumUyBS6Tz6ySqgI2DzgEGIMZz/T6AheubJa
         us+WVVwUF5HwY9cTLTs5O3uWe8/exd7f2DVHMyvwEvc71QFDEiFKYVjF9qP7Q6+yTNas
         dBHmPMnHnjYtbAZYvEC6sCH7EL5/fGlD3odBFDISL/y1H5o8Uy21dCOPU1c6ZJCHpEnX
         bBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541512; x=1738146312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXZQ3iTLaTcFIc0MIbkuKG0+bnWN6S1esvXMq4e4+0s=;
        b=WNjTBiXcDjBAn+Ynk9u56ryYALBtWVr0McsuKkvMxpATqyANWH5HTN466NM5dAIz3e
         ghMdXQlfAT315kEkzpplWtkAlC8oS8IklkkeSEIyV0sNZ2EQmH3cUk6lumw8bDq3Yr0x
         yzl1pADbIgUJ12nb+iPpuKuM7S8h/VJGwPrIyAjpuAXRngN1o95FOtWjsbD6PvWpY3H1
         PYLQZ/tgpS4w2SLCd8EssYj3NyUL044gmD/oQZ68hapRCh67W+NzII8EoN1tzCj0PCCC
         7A+5a3G7d3uY6E1S7F5O8ZA3ZSRzFGd0VgEDuqEC1B0iZfLeET/1srTo05ZE1+9awPTp
         Q7pw==
X-Forwarded-Encrypted: i=1; AJvYcCUBZUvw/qGzNQoQjmvYphMYtk91ATHX2mLkFMvSigV28XnkBqdJfr4ZMJRmAK3o1yzPf5m+2rGxcG07iaR1FgfP@lists.infradead.org
X-Gm-Message-State: AOJu0YxMKCIgdYRH2TSITeK6/BgeU8tEPC+kw/fhgvjExROTbrCFqjts
	YVTygLFyexgP3AYEC/LOpwRIX1j9Eq/KRbwDPd+xiy87/8yBt3caUoNNiYrpFyc=
X-Gm-Gg: ASbGnctNt0iipu0rd6r2SJ5w/vMbUX/haIEtBjKKlL8e46/EiCr8cEouDTmFIj26hxD
	FvPTKVggdRZYhSaNOTMekV53aKe5/UoNdZtNPyjA3gTEOybOcqN7sb0hywSY7E4j7/r0/4brNsg
	u3IrC6t5xctVQiVVN/11sgC1cdTa6zr+JL9E/jbYsyx6puAAExZnfVoreJIH+9uSE610zd9zHz6
	iYH8xuT6/6CVUxN+02SEJs2xWXFZPihmFb3NwWNkNGfhZjdi5Bgubgy8arU5+iukvs=
X-Google-Smtp-Source: AGHT+IFcdjMkbBVSBvPBcUMc6AIbuC7ugMJHA3X8FNx9ozrzI4NtnIr1pvfbPlrQNAdMI3bs+KTBkQ==
X-Received: by 2002:a05:600c:3495:b0:434:a315:19c with SMTP id 5b1f17b1804b1-438913bdb0emr187626515e9.3.1737541511808;
        Wed, 22 Jan 2025 02:25:11 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31a1e69sm19459595e9.11.2025.01.22.02.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:25:11 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 11:24:36 +0100
Subject: [PATCH 5/5] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add
 ddr-pmctrl, canuart-wake
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-am62-dt-syscon-v6-13-v1-5-515d56edc35e@baylibre.com>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=msp@baylibre.com;
 h=from:subject:message-id; bh=mKVbeLCZ5Zhwj38zZ5+OKDCOtAlsP8KiPIVX5xjl0ek=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHK+adOnjcd2UZTr56pOKd2zOl3dUPlBr4q99Wetyy
 7w/a9a+6ihlYRDjYJAVU2S5+2Hhuzq56wsi1j1yhJnDygQyhIGLUwAmUsfPyLDw+WttJy1+tr99
 dzSrZwsxH9jckPb5WdzmBE6LUF7mtqmMDNvC9OKt/t86fkpoR0yisVH3jj7BxZaTJ4ipL3B4PJl
 nIT8A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_022513_514998_45AB53F9 
X-CRM114-Status: UNSURE (   9.68  )
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

Within the wkup-conf register range there are ddr-pmctrl and
canuart-wake control registers. Add dedicated subnodes for these.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
index 6f32135f00a551cfea4cc896fc03147271eab9b7..3daade3f4ffcfa669f109200e86c3e11da34e70c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
@@ -39,6 +39,16 @@ usb1_phy_ctrl: syscon@4018 {
 			compatible = "ti,am62-usb-phy-ctrl", "syscon";
 			reg = <0x4018 0x4>;
 		};
+
+		ddr_pmctrl: syscon@80d0 {
+			compatible = "ti,am62-ddr-pmctrl", "syscon";
+			reg = <0x80d0 0x4>;
+		};
+
+		canuart_wake: syscon@18300 {
+			compatible = "ti,am62-canuart-wake", "syscon";
+			reg = <0x18300 0x44>;
+		};
 	};
 
 	wkup_uart0: serial@2b300000 {

-- 
2.47.1



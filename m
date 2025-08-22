Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114E0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1o1gWzgpFccxrhmkeG5ac9lKe0S/WiH+skWHOM6Dqg=; b=mpdnhv4LJ2ZN3EeyhqevxFsC9M
	5XPJeAtCidpVgHazKuenTWSV3/QYDWiagSxfNCAUftMsWbIM/JlHZJUFkpotIYeJPA1IrDbirdva0
	hvuMzu2fFtmLMmbGVR6tV6A+x1P/C66eZkNYU9Ii/cCTJubuA0wZ1pgLvceg9zLKpAYJgU51g6QfS
	FoeXVHLXz0hJJAIWLI4RWrXVn/ecslu8i87rbQQDnHNQDSydIXQbD0u6HWYmXgyqLQEpg+cFOPp8J
	PyGAcTtSkBDrGmqqsn6jVd1r6pwjNQZl+F1XdDMP2MRJIZbRMnkj00mlcst55sU4IAcMOzhKvzf16
	Jb1kkyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqC-00000004547-2iob;
	Sat, 23 Aug 2025 06:35:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrh-00000002dMk-2414
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afcb78d5e13so27243166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869492; x=1756474292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1o1gWzgpFccxrhmkeG5ac9lKe0S/WiH+skWHOM6Dqg=;
        b=tvc9vHorZmlFs6xIoAjYAztn+0Zv1SMSWDFJxgUalq1YqyROJx53yVve5VKich1zAX
         AXb3gGNlxytGNTcsASVtmf3VzCC6c2lFgWS3PgLFBrHDCAE7mwGKdRjGHB2QfbUc5rBb
         Wm/e/MZURNExysJO1xRdWg5VkRtoTHbqsQENtQ0N7GYYqkuhY8yKfs30taIU2tAi/8kR
         MC8k46RzuZGcU0h6YKENpAo+EYtHA8qXCftE5Psdy5yH23/6jvkYKP2B4hOt+urccFyn
         2fZofE5bSIKXYWub0BnTgc/35c5Mz070xeUfmt8bM2lZ5W+wsmcxtJW0knHzPZBTmV+K
         bhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869492; x=1756474292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1o1gWzgpFccxrhmkeG5ac9lKe0S/WiH+skWHOM6Dqg=;
        b=iQ8D4z6UlYGUX1DOoEsu3r1MngUMvs1UUbC+S5TzgDr9wDga4H4FOTwiTysp76y5df
         hjR+vi3MZopGanBjRYqH19mmRxtonfP2UjLzVAS4bW666Z4YhqPNjRiMSYJeQPbloOMm
         sMAS3GGTB/j7Vgg1gVnF2my4ZnpWqkzZS3mLp3/A2TRxTi8yOwbK7aJvjay8IP4EBpQA
         W22YiitJHkmrSrpA5uZUbonBj+iyV7cwpMjwKdSr3JNcwJW0O7dKHeSBkP7Jt6ta+o4W
         yVcfxW9WzcHD7BrguH3a0mTRA2jNnnnFwHxHmhJdWmP45/H43jMOAx0f1XLNcmHC9gaK
         +1fg==
X-Gm-Message-State: AOJu0YyPrQRcYbvYhREuRUPSiRxR7CNfinLdQkFT3Bwav79lemO1gatk
	zXaz44CYMkRtHVkfQMXz2Q32TwBlxmHB6X4glMXvzI1FBuK8DtOcSQBaw/g4hMzHHFM=
X-Gm-Gg: ASbGncuaRiMnixp/dYzdiyHJVajyAirRwk9s9WBYUNZXxwpTQ6vDeODWgU0F0vm2nkf
	kJmaI+Zc3ANbN005/Ox59XwMooEJy925WqpWoNhzwDi9/uk7optJCynnXZZag43U0LsiTBLvIx1
	mOYNEWsydj15x4tcS8OLnAk+UGFyWQcBRRHoAMqmGdEvAHDK0JZI2mgT5urOZnOOvIa/wGGZH3F
	iyVZKhbKxvSH8cdx08BNDDNBtYC6IO6F6O7RyfaHKYAXuRwB3dfEyGwRZJoNU0FHmIGx6LEOmH5
	4dO2rMpKjGVbOH08fhxdZ9kXbOK56S/YfZ42m0X+KMCJHBVWRS7gmVYq4DkOWnrRvTvadDfyDRL
	kxZhCwj0UazTUoBpamPVfMIFZJqecDWqLu2wpF1o=
X-Google-Smtp-Source: AGHT+IFQDi6KXypv+0LPQO42vWOV7xw1nKHZrLfkgFq/T58RsdgMUjJC05gydduujZ5LPC5aBBjyTw==
X-Received: by 2002:a17:906:c116:b0:af9:6580:c34f with SMTP id a640c23a62f3a-afe2943e3a9mr137574666b.9.1755869491830;
        Fri, 22 Aug 2025 06:31:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:15 +0200
Subject: [PATCH 06/10] arm64: dts: imx8mp: Add default GIC address cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-6-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=elmEkjEc3LhUsJVHzugGONRfNFfB43R0NAtUn3QNm8k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEkKUeNJvQhFQ3yNA50Weze2UHdPyTmI3Wrg
 nOmyMfiiY6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxJAAKCRDBN2bmhouD
 1xa6D/9GTGfVp4YwoMdF/SQAx0S+8iWxY7ZVKjJjJmC5qWmRakNLaNJPs74VNEOVK5CGPZacGWT
 j52QcZ1SrrltbvVz5f7RqjtZe1WXL00S2Zjw5+wjeX2dnqH1Gyp3G+3hjs5nlN2RWjmdtoeXjGL
 KzKYllLyTgeRsDL813J5Rvk/jj0Tr0zYRTwlBdiENzhtUJRtipjgeJOX72t7p+Fbbqy4kCPvcZq
 +hAgZK/E2s0vIq2poTDF/u4tMHx7JmMR0a1slHEWk3A6Znpg85Tq6XITScENMXF/+5rL8Pf0n3q
 MvLjgtut9cF0RmWhKAjkRGLV/bNFY9WLUuzMBtXwTefhYXKOVb0ClgqLwlT8d6ufT8lT8Ezx25g
 ObeFMloyh/O86EAoPcfHyspQMqOE73X7XNtWW0B2FE7MEXVZpuX7kzzHKkEOgmzOhG+3hmw+mpb
 pDKSHP9MJFvC0xN00tmalT7L4s8suu9YYPMMd4iLfo+D8GoeVTTy0DRe9BLVLjy6TcYdT9/d7Jx
 s4jTBQBFVWEoV3axk2bmoEWZ/4DV/DaBD8672gEDM84ul+93LcdefWl3frbxsOyv+DsPDcPk9QW
 Gg8hbfz2d4Rom1xuFhbySzJ/p7hnNME/Kdmg6UjuQNU214+mR8Abz39Ak+5Wfr24hvoAIeQ6pxK
 h90Dnyx4rCyzckg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063133_532716_C4CA07BB 
X-CRM114-Status: GOOD (  11.32  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338ea00dd50c5f7e409d72ecb7d790b9..b57817949d80ae7d891b2168c17d4e1a6311fbbf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2317,6 +2317,7 @@ gic: interrupt-controller@38800000 {
 			compatible = "arm,gic-v3";
 			reg = <0x38800000 0x10000>,
 			      <0x38880000 0xc0000>;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1



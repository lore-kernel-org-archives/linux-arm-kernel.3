Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FDCC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vGvNSF5iLep88s+rKNWsz2f582ttwkEVFBO/bttrKpA=; b=QHsnkqd7JeHBYQ
	tAkw2FU0IYv9GYxX2y6L9fzcHhMKoxSnvcfUBDpiM+ggrzVyKoHafT1iDW2lS39oAlY/GiiTsmEx1
	KjnUnXkUdEKC+MkazVxWwMzCteP4G45WpQ3ZOSGnWv0HYoJhNSltyUamUY/UPBejSPMdVVJx+3elz
	1EYb6N1KlD6rR+vD6+6aHvkTzVjYlmwVaxx9hMuUOXtFceG/eqShgTcgDtA79AtvVmJmC2Hq6qp+X
	WKqGqb9shyqJQlvMEdonCzatU646MRHQyul0PJvp70RwD4+Yio4zgF2bIa6Rtcma+qdYEeWa5uGOo
	YbNUNe2DzlPj+iNYGXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P9o-00000000jiv-3FU7;
	Fri, 25 Apr 2025 19:56:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P2N-00000000i8d-2i0b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf861f936so4814815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610518; x=1746215318; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGvNSF5iLep88s+rKNWsz2f582ttwkEVFBO/bttrKpA=;
        b=KTqEYixFjIIUGRMewga/++L76SwYQFAfYqguMpbg6bcew+/SIurSzx2DCpauo5NOUx
         y1Zb8ZwxMPx6Py95DUovd+ap8rSF30JFfCDvl1+mb8o3DlYaHvfoZawVGsALaWLuXLuN
         M5ayGB3zCGE366b8fXGQb0u4WdEfAEDOByJ1rYwAblA9kVQ9TB1od697FSR8Y7fkY5h2
         a3Jk5xKq2fQDUp0ILO+PBhT97jMQ/K4fHRVr/weSxSkhu7MbygK4ZSUqE0gtvqgVfqtY
         SHiO7mhBjafTlZwB0KkryR1nhd/xojf3YbHTyNg6yBr6lAOBcjgBRNYmMs+eH0uRjxo2
         rnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610518; x=1746215318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGvNSF5iLep88s+rKNWsz2f582ttwkEVFBO/bttrKpA=;
        b=Mab/tb5ZeRJwYI/jHzNup1uOujjBYbavn1uoZjEAJBlduecmD/WUDhbCpVjJFMCOmB
         DRtc804YMPkjR+OeV59327dR6DHEUtdwNXjedQzw/sUEm+IQGRj7CQqh8PwEojUzbe6C
         w8XTtBfYuPD6/UFFz8eD2r33wKedvR/+cY67pK6HKGHp9cexWZ8PtWeOj9avSc/sLWm5
         aXU1oKXFO3Km7b/+flzWoF44nJ6ic5pwxIbY6JkPGoVtEHRiOSIeIezISbvGWlrjmvQt
         hNIrTnN41iZZ78SNhQKmYkn1cBEW3Tm6k9L2r2to1z+CImHkxloyjRCt4GZHm6lhRt+v
         Vd6w==
X-Forwarded-Encrypted: i=1; AJvYcCUoPNqNSJ6WwHyNw0tokPhFE2LflUe1B/ybfT+p0wX4o9vzBve8FCConJN1hwS0dXNH8xIrrA4yi2lfkY/I5W21@lists.infradead.org
X-Gm-Message-State: AOJu0YwT/ZYQG+EstoLuztZhwvPmoSOSqS6Nz6jMfbJ12fHi0lVJcAJ2
	uXZ2EEzN+5zlrDlyDeb/E6fuvm585nNX6jnLnyH4Lr89Z5NY0vvmsGIY7QKD9hQ=
X-Gm-Gg: ASbGncshcx7+wToCwPrCrt5JsEeywLVMQ/NPEUcDzVC7NXzDt/q3iAdksp0TzCAZlz7
	pGK3cVoI/QN4mJNvJ2egRuhXV/+1ITignYdVoEm4/JZ/dRS51QBSR6nV9H04mMS+9oKUX8Ndw5e
	uNw9UzG588QiwkZoE/BP9598PmVVeVcRdNS+HhvEMfDsY9PW0hUiOF9EtSi2Yt1xd8XcDr108ik
	YurQfoibpBNwsLrXuyNw1thbA9k+jZzIbkjDoiazR7DCoZM1BL43NzOY0wwTy2QO1o5PZcmFL/y
	OEllUlySBlKA00o6gxL6WAk8nxWL36a8VYGdNJh9anWHyDYXnONX6Ob8aZzQSNEsRoavTw==
X-Google-Smtp-Source: AGHT+IFz/FugmRlMTdXDEAYrfKpO4xB6/lRqUH7jCG9QA+VkTuUez77zGRsmsohXN6EyLkakJK2+AQ==
X-Received: by 2002:a05:600c:4685:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-440a65bb7d5mr12401055e9.1.1745610517631;
        Fri, 25 Apr 2025 12:48:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC DTSI
Date: Fri, 25 Apr 2025 21:48:23 +0200
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfnC2gC/x3MQQqEMBAF0atIr23QaFDnKjKLYL7aoHFIh0EQ7
 25w+RZVFymiQOlTXBTxF5UjZNRlQdPqwgIWn02mMrZqjWWflGU/2W3iFMpIK2JA4qbzvbVmaAY
 PyvkvYpbzXY/f+34AlANA3GoAAAA=
X-Change-ID: 20250425-dts-imx-aliases-ethernet-37d8552939de
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5098;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oQRBqh4XgiwJuZPQCthdVtPPxyK1X4suJcz9pRIGrPE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cLg5dGjGKD3lhq6H/EQ9K/8FKQj99PWWgxG
 kqm/J7//lmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnCwAKCRDBN2bmhouD
 17OvD/9keyWhKZR6aiTEog/YJHtK9qQVveiuOztYoqQZ1SpUl8vjD8wo/q3C6XjoKL9eUN1mUDs
 GPXi+Q19J6Ah8pObTpMMH3LGud0ZbI71H2CYqFKzRHeD5Xt5eZlSXHviNzVMsm3GELSBE35j1ZL
 r7Qfn1xxmHLWVJj7y/FEwQCqT+cmEmglYiULDLN8Ie6phTp1nNwrlhN9ZOrYlYgc6E8J8bcBozB
 ivlEiNhXu5HHHZGOu3D27HdW5oN0vlJvRc4naxcJic0Tl7V2DyaWtL9ROjgWrRVwOjFQbzOgB7D
 4kjqGFGdN4uzWzaG36f+O29L/KPHcfgBXLvhcvbTzwZ8GenenGvF793UwmRGe9hC5BeLtMrjYVT
 ps7bdB8LhfouOxXB5252/lPDciZHrQkem0Scu8FLKc4JzJly/YQHZbeJQ/gfsRA54VQSmzJ/wDR
 Lt/qsdO3Fz6OTAPbLu4iAj+9ekC6LDUzB5K+6slUSNqYlgyTWABESbA64HWOcUYsLBivetYnyxA
 XfWIb2rNPrVja+Ac6n69kqYPb44ylGIVTU7SU7cTNI+ebw5oszB208L/8wMVOIMFZVAZWYg+aut
 dsLk5WnqI1Al4mWrVhioE3rhztKfi9tnD8RJ0+1VGGtLggEu8wTazf0oMtbJjfKTuK+zToJNiL8
 oRHY/LcY6vApqxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124839_695917_43B96347 
X-CRM114-Status: UNSURE (   8.86  )
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

Not tested on hardware.

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Some boards (e.g. Gateworks) follow this convention but many do not.

This is continuation of my comments from:
https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      arm64: dts: imx8qxp: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8dxl: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8mm: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8mn: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8mq: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8qm: Add Ethernet aliases

 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi           | 2 ++
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi     | 1 +
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi     | 1 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts                 | 1 +
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi                    | 2 --
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi          | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts   | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi               | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts      | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                 | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts  | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts     | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts           | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts                  | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi         | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi             | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi       | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi        | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi                     | 1 -
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi          | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi   | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi                 | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi                     | 1 -
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                  | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts   | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts              | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi              | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts               | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi           | 1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi                     | 1 -
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts                  | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts               | 1 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts                 | 4 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi                    | 2 --
 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi        | 6 ++++++
 arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi      | 1 +
 arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi         | 1 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                     | 4 ++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi                     | 2 ++
 56 files changed, 143 insertions(+), 7 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-dts-imx-aliases-ethernet-37d8552939de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



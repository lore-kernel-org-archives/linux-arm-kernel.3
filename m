Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B5BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ba3ecdPg+nXAggAkyJWYjwGlyNmLO+sGERFOk7ut8Ms=; b=FDZAHJbIjadgZJ
	itWEsEgcYTH+GTVfMITd9w5n8la2Sp9YjMVr/WZ55CgkXbagPkLzmCHegifISHPAtRz3+lLEcFM6k
	f/XF8hqsSmJB0s2SHN75jxGLqBNsN8ISrMOicy59cEncPg8adyQSKn/n/0Y/7D7MyhjLwQjMPszOF
	+SeoH/VOEEqT2hvH8v2CO9scye4y3cy67Jc8ta6Mv3Zvl46Wie1rn2JVADx1esXF7Mz3vXEp5mUnB
	VUyTKnZAsxxE6EMkrdBBCXT+zFp6S34TJa1c5X8E0QK7/hkRz1TJXjckEvQKtzDljNy+9+paT9M7s
	Vlw4evgPgWaWcE5eiAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZQ-00000005hbD-2kHw;
	Tue, 22 Sep 2026 14:34:08 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZO-00000005hZs-3EtT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:34:07 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso488903666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087644; x=1790692444; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ba3ecdPg+nXAggAkyJWYjwGlyNmLO+sGERFOk7ut8Ms=;
        b=YTHckNhKhKxXmA8KM5+CTz1B2dFheeTNLigYcDb7NrRrPFG7bwPJfWGtthQk/UHmW5
         jBcsKm/Ehth8eWmhgvkmPE7SggSGej+6Ad/fjT7SHeQaP7i4YzNWIaTgWH/GUqWY2HPN
         x/8Vb1D+xSN+iZ35PQRy1sRcYyD9KkpOxsfxmpbq+1XwEpq0qktT7ATBZ5um3xzteltp
         /sI/ulWhZzDTPnmRF/DKVSB1504jU6q2Z4n3SZ/+IB9x1UBH072gMK5Qv9tm8ZkunRha
         KYYiF1LpGsUcg2To6F/RU6Ypg94L5YXyIrne3uJkC/lCtQ3X99xb1YNaxbSYA4HlX1zH
         tQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087644; x=1790692444;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ba3ecdPg+nXAggAkyJWYjwGlyNmLO+sGERFOk7ut8Ms=;
        b=QKgT+6w08rWdV+ZuT8kawQZOrP13HuClp6yoeQ9u0zMnBX/QlF62P60rteMHxg9qFO
         MtOHlnfBxlfAhotM+9OhV/1ZeF9fuZI9t9eJJT9e2NsHL4xA/wj1QDwi0FklXHFl8vhK
         ZpgC08nraDjEmYf5YY1BiyLb8HtNVf1Hx00J53IisuDdvRapfq4e6E4boCfdiogm3RGT
         mNbaTEah8Homam+60ECWyRQUzMB+QVO0sfm0yD7YyS3H39TqdmMEFw7IsGEMlH13g4Wb
         mM+Inzi+JY6UJ/tGvHB2C7/emyt3BQsjdP6e+ZRLYgMEO3J1OcfKsIuGNDqf10EoCM5v
         O7yQ==
X-Forwarded-Encrypted: i=1; AKwUvByGHva8gIgFc6T03gTOLffi4C/DhJbZHSZBRCzvj28yjADPchwbn9vntPdLJuIVD1B/To4ChR2QMcyKK18t1H34@lists.infradead.org
X-Gm-Message-State: AFuF++koSJ0rsnQpjDnSmfg/YyraxdE0kJnfk6JN71lxW3fCDHG+xx+c
	iHCNPZKwUDmVCC53DM8iC02UGfot4O4a9BmRxYmwfNmVPZzyou5ffy42
X-Gm-Gg: AYBFou2CnLWXDs49EXWD1/1NgYtwwkatVmIjcZ+OG1d6THUCqE5H2NEHH0Nrr9jsf2I
	pF5aMRK9vtVH3pXBG7OjQ+YAdzDoRHUBe72KIukg9GWv5+HuFL89Kbt3lk4oELL0yF6e/boWXP5
	H7xIguihJEzpBNaXTWuNXdj+I/KLxOCGQ7dPlZ21iL4P4+uW/dUrW/g+zhyuymqFNpGWh9NChk1
	+VdghhmL+hPwNLaYM6TALMGgFBpNwvFZUblaO1Go5H47baBsjcSVoM38IK5h14Dql5qxG2woNpA
	VdQw1lwISxh8q7QPGWa5aMcHicN6Ph9SUGamUvBEmEzQueFbAOmArLVBg33cY/hMXQdiwNxoGHZ
	o1cLBb/8mZA7+E2mYIF/lwOUHMP2cch38LVoEF7s2CtkUJ9PByN/jVdYVUzI/P4PWzAtoBBdE7G
	UQDtqE0zJDW600w7CeXjyfXDBUyDZF3FfzAgmra+atXiV5VDNinXgRFKxksu0eJFDarkE2aHMNB
	ZOAR07y8E2wq/lEvCa0LD1Gfr8INVsi/Kyv7kbYBeKJz5Xhi1ei2cDHNKaW7cU/Lm4GS2oXJHcI
	mni1+LD0
X-Received: by 2002:a17:907:3cc1:b0:c27:d84e:ebd6 with SMTP id a640c23a62f3a-c2a157fcf13mr1269533666b.25.1790087643972;
        Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Date: Tue, 22 Sep 2026 16:33:45 +0200
Message-Id: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMmRsmoC/x3MTQqAIBBA4avErBtIw2i6SrSwmmqgPxTEkO6et
 PwW7yXw7IQ9dEUCx0G8XGeGKguYNnuujDJng650U5HWGBTKEcngFdjt9vHY0lhbUq0ZqYbc3Y4
 Xif+zH973A8LiKiNjAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_073406_831575_51CD4D8F 
X-CRM114-Status: UNSURE (   9.39  )
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

This series adds device tree overlays for the Toradex Verdin, Aquila,
and SMARC iMX95 SoMs.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
- SER0 reservation for Cortex-M7 firmware on SMARC

The UART overlays mark the port as reserved so Linux does not claim it.
Firmware remains responsible for configuring the UART and its pads.

The Makefile entries build standalone DTBOs and ready-to-use composed
DTBs for the corresponding Development Boards.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (4):
      arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay

 arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso | 14 ++++++++++++++
 .../boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso  | 14 ++++++++++++++
 .../boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 5 files changed, 71 insertions(+)
---
base-commit: 478f68c644732750f8386e4de7c909c5ffb26ab2
change-id: 20260922-v1-imx95-overlays-89b3a9185b93

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>



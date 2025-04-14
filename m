Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281AAC369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=inhlHpE/bBAKBKJKN86FXX+kIdOLvF82cEnSWLQQO4w=; b=iu0ObCqvGS9RljjU+PNQoPVWIg
	OHNq4weKOoF7n1km+0oz0XWyyLT+h/asPMz8cOeMlGwk1dism/hvIs+syAfQ2Sf5HTuAoaZ+Pnggn
	iO6uxyuKe6vkBtjuRRyYArewy6GHhkE5CzkRthgbbTmhJaxdrcqeFZdf/nc5qdMZem0qrI2103bJH
	xpuIFVloUPZDMBSMyqdpvtJC0VCEb4Nv6AQMgQnwOPYbRZMNF1uQxFKsfVKRWVeJas+roFpmjof7H
	rAl5kmZ7MPhzNlTJr8oGMwzcwxdkWpXXFr/hxnA7iadh3PXoVkmddwudh6W9nz3YV4RD08twbCUHB
	WSqGX3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J7U-00000001zIT-0y7R;
	Mon, 14 Apr 2025 12:41:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J5a-00000001yna-3jDo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:39:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43690d4605dso33160245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744634341; x=1745239141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inhlHpE/bBAKBKJKN86FXX+kIdOLvF82cEnSWLQQO4w=;
        b=VqFZQzKJ7gIAXmTHmARGGGg/DfHogPuiXO9og5WnnMbwUvxZ1VBXcfQu2TjKJfTcqw
         1BEd8WIGRY8SAxVn18xU9DLAHp95yr2p6JarWnLU4PSyNyGRoekD2ntDYCnGd6uoWAvK
         MkTWzyerYNKkiw5hellsg/9lWkPT2BcXs+RzyRyp+ybhSM/OmFrG3agQbFZ30Eop+TIH
         A9yCMO7OYbtQbOgnAd0p0S08M3rQVxn9Rf7l+fv39d7Lm+Sf4erpVgjTwSeFOa3q/0QE
         Vg8knFVCBwD/sBVW0dCwwNtphTFyJBEk990IYAcH0jZc3nKX2N9OKYMe//HQH+NDoV0S
         cMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634341; x=1745239141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inhlHpE/bBAKBKJKN86FXX+kIdOLvF82cEnSWLQQO4w=;
        b=s7DDL3p18FjJRuQEPVVScGWdIQsrmxJ9LVZdSy9yp7eJGAfMXnNN96pwXxHYcLzkxX
         4N7vJTSwtru68SHs8BsMOqJrSxAWb4VHNPwB8wH9MslvndtU/fwNQOxi2uZNiFU/2bkA
         L4jcRD1JEOW7sWg2EG6NoP0qpKjWC3kX15jkbZbXtLYyuZD5mDG2wPpzEvws+8lMWYde
         HB9KGPcbci+2AZHWWjhigTXDn5Y4KlFWSeEagcRl/8QeD8WT8LpKCDENEJ6dVtw/YrWK
         /RlIjNBoyVZNflOB3Q5JoPAZulGCSGEwBPNed5Zi91jZF39/LMziB88ShSWXAv2Xb0p0
         Xgfw==
X-Forwarded-Encrypted: i=1; AJvYcCW0//Dc7oOEQVS52CIMlwNTJeNVjuW2pNyEySpUkqfET1uvJAhQqtpiQvhNQLI4ijPvQoev95u7noBLQmlPIXfc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7z02PwQ4E5qajrtSSXNH2E+sP3C3eiquh7VrYeYPXfxl7KvZU
	+nvo5CE42jlD/CyFW2XjCnBWKq8Y/d8DiPHKSNKiMEjTlQO4aTzK
X-Gm-Gg: ASbGncuq2dflVAUAHHiFgsVLyF7LULlnsjabZwS1ouk2Ww2qhsaK60opOzKiN98sV6b
	Bee0axUAs+krQt5ZiCqvEx1yoBJC+pA+giCPZm96mNyZfzdCBzZVKLab0Kzsehpnf35A+v9Bq6w
	zvHEM0bvW5Una6FXzHycFoqRFOOufmEW/cpd47tud8zigmEvkfKjxKZtSzOqzmHL4E93ukeNDDP
	/NLs4vxFZXrwPG3dxMyNxa0kT23fLWCFlKiSSMzRCvEd32n+vftNUIlpYrV7qmGMeTGDBcvbXQL
	lD94AAYrm6FXPPbF7ZwpFvDxHte0Lwb0Yfw2
X-Google-Smtp-Source: AGHT+IGxy9csrrrck37dUxkD2h6nTaQdmDSXqt3VTHDGwVn+NyfGt2ybLDJfHlnEm9onkikV9dtWOQ==
X-Received: by 2002:a5d:648a:0:b0:39c:1efc:b02 with SMTP id ffacd0b85a97d-39ea52149d7mr9849917f8f.28.1744634340629;
        Mon, 14 Apr 2025 05:39:00 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e602:d900:68a4:1b76:fda:f9fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm10703259f8f.25.2025.04.14.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:39:00 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ivitro@gmail.com
Subject: [PATCH v2 0/2] Add support for Toradex SMARC i.MX8MP
Date: Mon, 14 Apr 2025 13:38:25 +0100
Message-Id: <20250414123827.428339-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053902_926379_40C64FD2 
X-CRM114-Status: GOOD (  12.82  )
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

From: Vitor Soares <vitor.soares@toradex.com>

This series adds support for the new Toradex SMARC i.MX8MP
System-on-Module (SoM) and its Development carrier board.

More information on the SoM and carrier board can be found here:
https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx-8m-plus
https://www.toradex.com/products/carrier-board/smarc-development-board-kit

Changes in v2:
 - Move the Makefile rule to the proper place. (Daniel Baluta)
 - Remove the dsp_reserved node, it is already disabled in imx8mp.dtsi
 - Add Acked-by from Conor Dooley

Vitor Soares (2):
  dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
  arm64: dts: freescale: add Toradex SMARC iMX8MP

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../freescale/imx8mp-toradex-smarc-dev.dts    |  297 ++++
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 1284 +++++++++++++++++
 4 files changed, 1588 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3ACF01804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UvHj03h/I8V3RUfnYlEIf/a5TXOtj70U30QVaTzHzeU=; b=sh67xzgG6MOEVgaONRlyWXHRal
	Vikacxg9jF9nDfDdC8PR99PyTj/6wTVJkbcP+lo4b4BzTNC1rYp+3yqZp/L5ZgieBrIBLdjqsSkDU
	4GP3tLUJxRvmB1Z6ZeQEVToCLvVKzWTqAYCtpv+cDNr/S2cyGFoU4GjQsMRo9Es1+au8fjoKZUsxw
	YRQ2CjoJ6Otti4R5yb7wT6v7TmPd7KdocYvkEQoDWBRXl+e5dyZZNexrpJuiqG5lPHvUbflBH1FfA
	c9rE7TbcCi2SX7QhJn2bxdbnpKcwT9y6n74eroyUuCmb64i836DlDIxJ9AJKLzMfkFCptYeVHCXJb
	WVsJXLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1x-00000003Bfk-0Yix;
	Fri, 06 Mar 2026 07:55:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1s-00000003Bag-26EG;
	Fri, 06 Mar 2026 07:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UvHj03h/I8V3RUfnYlEIf/a5TXOtj70U30QVaTzHzeU=; b=QQ/O13hzCiAFBVrTgN2iAWM1lc
	DeLs9foY8e5/DBmW4dltjr1wU+zs9u4deabeSMRZ6pqcsxp6jwxCCaOV0HigG7TUlvJZW/iXFYAu5
	5PbhUpm3nnzrjLclYgzyuGM2SJQNvVW3MjSDy78VNf9kIjfQUD0Iq+cGKXkanzVm6+YFZ3s1A1G9S
	if4pv1hgmiyhlqmevaiAhckKImB26BHZv+F0RgfvmHSMFnk7fiW0jjoYaT6znSacpDPAXolA9/aLU
	gvHVuFl1Q7xFteefHZhliUM8IFvjH4y2ERzDLeVGR5SAWA4kHtFR/z/azVXSzR/PFgMQFLld998j4
	+eAM2EeQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008ELN-2q1j;
	Fri, 06 Mar 2026 07:55:22 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qjPgB2977146, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783565; bh=UvHj03h/I8V3RUfnYlEIf/a5TXOtj70U30QVaTzHzeU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=wh24hjK662OtagrS9+2N4beB0XgB1RyFamThbEqSxYgOu2OqJ8NoxH5RgfEcWy5kR
	 A75lGQfbyHovj4lwSLh7e2ohjw3APkiK1F+Jg5YxjgWxZc9nMj51BAPneKaXnyRj8E
	 OwFPYxNg1tFvIFw0Y2v/wGH06CQe7+2msM8DHko5o56X++nMKCzeYu+5RD2Tb2ZNdu
	 HSFfBr6yO/jb2TFVgYhvkeWqsdIMq6UtNrecwq+eBL3WRZfQU2pNovKj6hlwZRwtgm
	 AnxNipMGe4bhQR+KdSv1EBXDlX9sQYg/maNaYCBMV7Q/uXB2UYRnRPSsNz9H+AWqt5
	 4EwHNY+I1IgPA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qjPgB2977146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:44 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:44 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 00/14] pinctrl: realtek: Core improvements and RTD1625 support
Date: Fri, 6 Mar 2026 15:52:30 +0800
Message-ID: <20260306075244.1170399-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_504439_CBC1872D 
X-CRM114-Status: GOOD (  14.31  )
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

This series introduces pinctrl support for the Realtek RTD1625 SoC and adds device
nodes for the platform.

In addition to the new SoC support, this series improves the common Realtek pinctrl
library by:

1. Cleaning up license strings and correcting grammar error in error messages.
2. Simplifying error handling in probe() and switching to devm functions.
3. Adding support for slew rate, input voltage parameters, and system
suspend/resume.
4. Fixing return values for unsupported configurations to ensure proper interaction
with gpiolib.
5. Introducing the generic 'input-voltage-microvolt' property to pincfg and
pinconf-generic.
6. Refactoring existing properties (renaming 'realtek,duty-cycle') to improve
clarity.

Best regards,
Yu-Chun Lin
---
Changes in v2:
- Add relevant mailing lists to CC.
- Add a grammar fix in error messages.
- Move the "support system suspend and resume" patch after the fix patches.
- Introduce the generic 'input-voltage-microvolt' property.
- Add patches for renaming property 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'.
- Improve realtek,rtd1625-pinctrl.yaml description and properties.
- Add RTD1625 pinctrl device nodes to the DTS.

Yu-Chun Lin (14):
  pinctrl: realtek: cleanup license string
  pinctrl: realtek: Fix return value and silence log for unsupported
    configs
  pinctrl: realtek: Switch to use devm functions
  pinctrl: realtek: Simplify error handling with dev_err_probe()
  pinctrl: realtek: Fix grammar in error messages
  pinctrl: realtek: support system suspend and resume
  dt-bindings: pincfg-node: Add input-voltage-microvolt property
  pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
  dt-bindings: pinctrl: realtek: Rename 'realtek,duty-cycle' to
    'realtek,pulse-width-adjust'
  pinctrl: realtek: Rename 'realtek,duty-cycle' to
    'realtek,pulse-width-adjust'
  dt-bindings: pinctrl: realtek: add RTD1625 pinctrl binding
  pinctrl: realtek: add support for slew rate, input voltage and high
    VIL
  pinctrl: realtek: add rtd1625 pinctrl driver
  arm64: dts: realtek: Add pinctrl support for RTD1625

 .../bindings/pinctrl/pincfg-node.yaml         |    4 +
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     |    9 +-
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     |    9 +-
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     |    9 +-
 .../pinctrl/realtek,rtd1625-pinctrl.yaml      |  260 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |   39 +
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/realtek/Kconfig               |   14 +
 drivers/pinctrl/realtek/Makefile              |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         |  205 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   50 +
 drivers/pinctrl/realtek/pinctrl-rtd1625.c     | 3148 +++++++++++++++++
 include/linux/pinctrl/pinconf-generic.h       |    3 +
 13 files changed, 3709 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1625.c

-- 
2.34.1



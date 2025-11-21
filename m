Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC06D59F5F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WwL08DBtUA04m9uzunJbXUc8Llp3YbCg4yfS44lD4Ls=; b=fT36rW7PvBnmSSxD/fPO49dpmb
	o1ykaNZ1xN36Lm3SDKgtEo4zGmUy2v6KIioC3ua46wr32Rvt152d6IgN4+VAYjitxASJxxJeWRaUS
	3BwXoTrWAAFi1B/5pupbLaXKz9kWb7KH5XFpoQHBNOj30B8AiqnvAozu1qa0QXqq3ML0XAF9KkXte
	MzAXzRWlwQyR9DIBzacz5FFLKIBU3rEIS9y3hja91Ma/JN2GKT5tRyKuaSgwRUnLNh6luyuXA7AK4
	WXtNo1XR9yoCwcxzxRIVwM/mGGWvgykkMGYfi89RDwVhNOZs4PKgmm9e2Q+kdncYD8Dxa2FNRyMTM
	A575wM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpf-00000001Kkh-1xLD;
	Sat, 13 Dec 2025 02:58:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpK-00000001KO0-1ZRR;
	Sat, 13 Dec 2025 02:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WwL08DBtUA04m9uzunJbXUc8Llp3YbCg4yfS44lD4Ls=; b=dcIy+HMKTFcVjJRh1hfUO5m+70
	MKIWwHO43uytwPB9zY6D0q7hNyJEPcqgk21N4scwXQCSHxQcSn8WaHXWXCtJFx38HmvbC+a1olp8D
	KZj7KEDFXjSButbGYnQHlm+kbfM3rTP1CZBoJEPqPhGKsgCueqprSJS1+Ln+2PobqmnkcT2xpOBzq
	AlwK+GQkfe+yxds21beqZw22Auux3Nqvp7FG+kDXFIBe4sfLT2ZSLktuJN0CUjvPOHgCBoZrUdZRU
	fgCr1UtcFDIRbqo+RxihAJtVDwgNUDIwF3JdzR23SrE6+xaXcaIYiic15TzgVaECyubR6iJytKkEj
	5mdN8fsg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLwB-0000000GL9h-26B6;
	Fri, 21 Nov 2025 07:52:14 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AL8j5clD3255888, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763714705; bh=WwL08DBtUA04m9uzunJbXUc8Llp3YbCg4yfS44lD4Ls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=h0H8DsNVAEj7YDMbNIUZV0orPzMXvQojSN4YCp2kU14mewetgprOM6Jh0pS0NRO9M
	 1Uw/5qF6ka7dmGzgzJ+BkJyFIAxM2stngr9uyV84HIZ94XQ1nka9iQ58xxNwEh92ih
	 6fyWTgRejMzXCVoATaTB/8FjNYg9ge39Z3c0vff3bPICpqI872MBeKjtGcjtrRoZEw
	 iXiCZJhYtoMiGVFCo557LoRsty0pQyZCBPfjFY7RS9JWxV6vOH0eIM/17gyxfK1+d2
	 C6ba3ILN/F+MrwWId1wsPPsXiM8S8EVkp5xyLJglGbivYTTVFQ8U/CJvkSBsnhwCAc
	 qhyecSol506dQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AL8j5clD3255888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 16:45:05 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:45:05 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:45:05 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1544.27 via Frontend
 Transport; Fri, 21 Nov 2025 16:45:05 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <afaerber@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <lee@kernel.org>, <james.tai@realtek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>
Subject: [PATCH v3 0/2] arm64: dts: Add support for Kent SoC family
Date: Fri, 21 Nov 2025 16:45:03 +0800
Message-ID: <20251121084505.3200-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_075212_174032_F66A7CEF 
X-CRM114-Status: GOOD (  11.75  )
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

Hello,

This patch series adds initial Device Tree support for Realtek's Kent SoC
family, including the RTD1501S, RTD1861B, and RTD1920S variants with their
respective evaluation boards.

The series includes:

1. Adds compatible strings for the Kent family.
2. Add Device Tree files for the Kent SoC, TD1501S Phantom EVB (8GB),
RTD1861B Krypton EVB (8GB), and RTD1920S Smallville EVB (4GB).

The patches have been validated with 'make dtbs_check' and
'dt_binding_check' to ensure compliance with DT schema and successful
compilation.

Cheers,
Yu-Chun

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:

- Drop the dt-bindings patch (realtek,misc.yaml)
- Drop 'iso: syscon@7000' node and and re-parent the UART directly to rbus
- Change all dts/dtsi to license: GPL-2.0
- Drop all custom bootargs

V2: https://lore.kernel.org/lkml/20251113123009.26568-1-eleanor.lin@realtek.com/

Changes in v2:

[PATCH v2 1/3]
- Fix YAML syntax: remove duplicate blank lines
- Validated with 'make dt_binding_check'

[PATCH v2 2/3]
- Rename: realtek,iso-system.yaml -> realtek,misc.yaml
- Improve description and example: show child node (UART)

[PATCH v2 3/3]
- Reorder Makefile targets to alphabetical order.
- Rename node: use generic names ('arch_timer' -> 'timer', 'reg-bus' -> 'bus')
- Fix node naming and hex format (remove leading zeros)
- Inline overlay nodes directly into .dtsi
- Reorder properties: ranges after reg
- Remove unnecessary status and custom bootargs

V1: https://lore.kernel.org/lkml/20251105104452.6336-1-eleanor.lin@realtek.com/

Yu-Chun Lin (2):
  dt-bindings: arm: realtek: Add Kent Soc family compatibles
  arm64: dts: realtek: Add Kent SoC and EVB device trees

 .../devicetree/bindings/arm/realtek.yaml      |  42 +++--
 arch/arm64/boot/dts/realtek/Makefile          |   7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi         | 166 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 118 +++++++++++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  72 ++++++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  12 ++
 .../dts/realtek/rtd1920s-smallville-4gb.dts   |  23 +++
 .../boot/dts/realtek/rtd1920s-smallville.dtsi | 128 ++++++++++++++
 12 files changed, 626 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi

-- 
2.34.1



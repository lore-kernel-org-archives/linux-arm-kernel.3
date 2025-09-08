Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70582CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j2ng9DUqdr4CLxKOm/kc3SrqkIr3wZE5PfGAce4rCjQ=; b=nKiBYtGNa8X/hZIU0+RuGhktGk
	905ZW/oVbxp69QoTdqo1QWB+xB/0Kw+HCe1jROJIfKZwjr1INToLoMtFJtaSXCLi4EHuX5NCHIMHw
	eRBGnTy7i8iFgceBh7GjvpSByX7lHFWOYY5ztcjwOpB/TckqcgAOoP2C9byNxACmRvAWCzN7KgN4W
	ZMB4ekHYyTph/IGEc39es+3Mbbxpq0cGspfvIuSXvPKKodo7u2+GUdNmMPqMS9l8gqt2F8IvyAaIq
	esjl8fvk1ftJEBQLVLEG2lyrt4Oc/kna/QSItVodjOo1cbWiMvEUF9/dCDm8hS/BUrDwIIAGb0dLw
	zsbY4Ikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsEY-00000004sqh-2iM1;
	Tue, 09 Sep 2025 06:53:42 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvled-000000033Ac-3Fmk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:52:13 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Nq8B3206302;
	Mon, 8 Sep 2025 18:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757375528;
	bh=j2ng9DUqdr4CLxKOm/kc3SrqkIr3wZE5PfGAce4rCjQ=;
	h=From:To:CC:Subject:Date;
	b=IwGXjTOVsjtR0ANWp9TJLUPRJPuiCfchBT1yeyGn+7xgUasqouH3pHaj94npTsUH0
	 Hv7dwJ9kMbcalgbT2/ecBRZsA7z3NL351aZx2MJycFNCw+FTTA44Qow3IkIctIbp3b
	 f4OCasxR+lVh4sy4OHFAtfqSKDkgDMakEU0Ln/6o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Nq8Sk4122895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 18:52:08 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 18:52:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 18:52:07 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Nq7WV1677746;
	Mon, 8 Sep 2025 18:52:07 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Remove HS400 support from common
Date: Mon, 8 Sep 2025 18:52:05 -0500
Message-ID: <20250908235207.473628-1-jm@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_165211_865603_4FAA1125 
X-CRM114-Status: UNSURE (   8.40  )
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

Since eMMC HS400 has been descoped for j722s due to errata i2478 [0]
and is supported by default for AM62Px device, remove sdhci0 node from
common-main.dtsi and include instead only for AM62Px in am62p-main.dtsi.

Also, update the STRB value for am62p eMMC sdhci0 node.

Tested on am62p SK board.

[0] https://www.ti.com/lit/pdf/sprz575

Link to v2:
https://lore.kernel.org/linux-devicetree/20250908173831.269039-1-jm@ti.com
Link to v1:
https://lore.kernel.org/linux-arm-kernel/20250904004723.2856005-1-jm@ti.com/

Changes since v2:
- Switch sdhci0: mmc@fa10000 in cbass_main to &sdhci0 at the
  base level

Judith Mendez (2):
  arm64: dts: ti: k3-am62p/j722s: Remove HS400 support from common
  arm64: dts: ti: k3-am62p: Update eMMC HS400 STRB value

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 ---
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi              | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.51.0



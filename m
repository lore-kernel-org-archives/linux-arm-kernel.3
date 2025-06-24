Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07EEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tTEfa5CiUFMxvJTh/oXI/dpTy+Tx2rapb6r8r3On4qM=; b=LsMbLmy1kSFr9xzsEiM3artQH2
	H5fnbkkf/aX1xjivsRz1494v5S09XeA/8iMTZK1J9n4a2FNxa4pPM3rlatbs+2kXJ1zMWrekG7f96
	kQCVpYqLmRWOEqBXgdWTDlnyDbGvb+lzFiqTRpMR/mKF1FUsXJwOTY7rZDAAbrg+rEqzmUdJJzyxe
	8kjhkOv4HtanlZkk94VlS3F7rYnA2pPl1EjGD6GGBZB4USXcgxoErv1S8QCOaQmBY+EyeMJVskfeK
	Zw5n6P6QBUEQ+Ttx88kuF4cQWROfxZlNQaxEKl12uE5AdC+rb5yCveAoKhToQowW2jFg2IWEBRLcd
	FeSzWZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzBv-000000053Uu-3URJ;
	Tue, 24 Jun 2025 08:39:43 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyz9-000000050mA-3ELE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 08:26:33 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O8QLRQ1822851;
	Tue, 24 Jun 2025 03:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750753581;
	bh=tTEfa5CiUFMxvJTh/oXI/dpTy+Tx2rapb6r8r3On4qM=;
	h=From:To:CC:Subject:Date;
	b=Vv7MpFFN5uEQ4kwl0UlDxyRPm1j88RNbNNoJfOYPO0hP/1tfqnfvx12pmnctBgTPF
	 NcRrbcT5D2JtKZuqRupnZVE3PzInM6KaRccVxfe2HHBAqT/D7/G6RsBihIBFi6ywvp
	 jO+GRsdbMLzQgUkW2vR76uAnrTXfZ4Tvze48SxRs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O8QL7J1551231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:26:21 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:26:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:26:20 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O8QKGA1183522;
	Tue, 24 Jun 2025 03:26:20 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 0/7] Add DSI display support for TI's Jacinto platforms
Date: Tue, 24 Jun 2025 13:56:12 +0530
Message-ID: <20250624082619.324851-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_012631_904241_B86D2F83 
X-CRM114-Status: UNSURE (   8.36  )
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

Hello All,

This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
- J784S4-EVM
- J721S2-EVM
- AM68-SK

Relevant driver fixes, CDNS-DSI fixes[0] and SN65DSI86 detect fix[1]
are Reviewed and Tested.

[0]: https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/
[1]: https://lore.kernel.org/all/20250624044835.165708-1-j-choudhary@ti.com/

I have locally tested using kmstest utility on all 3 platforms.

Changelog v1->v2:
- [4/7]: Add gpio-line-names
- [6/7]: Remove unnecessary clocks from TIDSS

v1 patch link:
https://lore.kernel.org/all/02f1912f-0a05-4446-923a-7935ed305cb3@ti.com/

Jayesh Choudhary (5):
  arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
  arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
  arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0

Rahul T R (2):
  arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
  arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP

 .../boot/dts/ti/k3-am68-sk-base-board.dts     |  96 ++++++++++++++
 .../dts/ti/k3-j721s2-common-proc-board.dts    | 113 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  37 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  52 ++++++++
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  37 ++++++
 6 files changed, 451 insertions(+), 1 deletion(-)

-- 
2.34.1



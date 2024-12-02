Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB9D10DB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7hNJpGuTc3/rYKS53bsFYQIckkwK3MXNB6qlUliODKU=; b=SRqArWJ1ob6nUmxnqxryqhmK7C
	rMrNs1C9iQWxLLLO9B1KzptlI1jXjXEsiNngcjUK7Pr7fJnQFdgOjxethtaalkvyNc/Kj2NiByoFx
	2kneHEedgu2inOuxU2Hn+fQGuNa58X9lBdVk2kkQpOKFPb+GitMTMqqR2Am+lOZJ90piDX4uiWw3j
	WGD9gjT/Q9xhfdFOudpCCGOJvTfWcf4OSxyg9WYo/1Pm6IKdIDFrPEhlRGIIrtCoJOi9/9xXaEujN
	I8K5fG45Zy7SqO5TayWgLg9eA+umeTgQyhdoBirJiLTf1Rx7BEgP1GzPt2aLiwzKlFfrq+RT9VMQC
	zDz4z7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0m8-00000005H0N-2zu0;
	Mon, 02 Dec 2024 07:23:20 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0k9-00000005GON-2FG3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7hNJpGuTc3/rYKS53bsFYQIckkwK3MXNB6qlUliODKU=; b=kQMJhEtZbjvgyNfewkNxNaK2lZ
	5FDzotMG7mBgaWA1+RgGRTse8Tc5zLGbcbaaHF3JJxgHt9CFJBBlENhEDgBbojd9GvOMkxewatDGa
	3+BFnBNPXB7Irvg+lgz/WRKgNR4gvhuoKrhL58hHP1CTB4c4kU7bsbJe2CnIt6Z+wSfGc9+d31WlK
	WXYIVxUNFnBLscnrXStpeAvsOtI1+j8JKILF/cUuhHVsI2U7rgP7vdi1yRdkwhcbEbntakTWhW5ju
	lP0LbsxiQyP/pjRehNW+9c0vXkRJd8pdfjFSc4sS8SdxIub5bKCFZ8HDJ+lv8c4S83aYmRxniKc+O
	jHdTeyXA==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0k4-007Bva-2L;
	Mon, 02 Dec 2024 08:21:12 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 00/15] Update PHYTEC's i.MX8MM DTSs
Date: Mon,  2 Dec 2024 08:20:37 +0100
Message-Id: <20241202072052.2195283-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_232118_034814_65BA6938 
X-CRM114-Status: UNSURE (   8.50  )
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

Hi all,

these patches aim to get PHYTEC downstream kernel device-tree changes
into the mainline for the phyCORE-i.MX8MM SoM and boards (phyBOARD-Polis
and phyGATE-Tauri-L).

Changes mainly fix suspending/resuming with different wakeup-sources and
add missing regulators. Last 4 patches add additional overlays. Some are
meant to be used with PHYTEC's "option tree" to add/disable optional SoM
components (idea behind it is outlined in [1]).

[1] https://lore.kernel.org/all/4e7dd467-20be-43ce-936d-200ede6d511b@phytec.de/

v1 at: https://lore.kernel.org/all/20241125081814.397352-1-andrej.picej@norik.com/
v2 changes in corresponding patches.

Best regards,
Andrej

Andrej Picej (3):
  arm64: dts: imx8mm-phycore-som: Fix bluetooth wakeup source
  arm64: dts: imx8mm-phyboard-polis: Set RTC as wakeup-source
  arm64: dts: imx8mm-phygate-tauri-l: Set RTC as wakeup-source

Dominik Haller (1):
  arm64: dts: imx8mm-phycore-som: Add overlay for rproc

Janine Hagemann (1):
  arm64: dts: imx8mm-phyboard-polis: Add overlay for PEB-EVAL-01

Teresa Remmet (5):
  arm64: dts: imx8mm-phycore-som: Keep LDO3 on in suspend
  arm64: dts: imx8mm-phycore-som: Remove magic-packet property
  arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10
  arm64: dts: imx8mm-phycore-som: Add no-eth phy overlay
  arm64: dts: imx8mm-phycore-som: Add overlay to disable SPI NOR flash

Yannic Moog (3):
  arm64: dts: imx8mm-phycore-som: add descriptions to nodes
  arm64: dts: imx8mm-phyboard-polis: add RTC description
  arm64: dts: imx8mm: move bulk of rtc properties to carrierboards

Yashwanth Varakala (2):
  arm64: dts: imx8mm-phycore-som: Assign regulator for dsi to lvds
    bridge
  arm64: dts: imx8mm-phyboard-polis: Assign missing regulator for
    bluetooth

 arch/arm64/boot/dts/freescale/Makefile        |  13 +
 .../imx8mm-phyboard-polis-peb-av-10.dtso      | 237 ++++++++++++++++++
 .../imx8mm-phyboard-polis-peb-eval-01.dtso    |  72 ++++++
 .../freescale/imx8mm-phyboard-polis-rdk.dts   |  17 +-
 .../dts/freescale/imx8mm-phycore-no-eth.dtso  |  12 +
 .../freescale/imx8mm-phycore-no-spiflash.dtso |  16 ++
 .../dts/freescale/imx8mm-phycore-rpmsg.dtso   |  55 ++++
 .../dts/freescale/imx8mm-phycore-som.dtsi     |  22 +-
 .../dts/freescale/imx8mm-phygate-tauri-l.dts  |  11 +
 9 files changed, 439 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso

-- 
2.34.1



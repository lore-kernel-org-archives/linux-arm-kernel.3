Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F410C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NcJGNvpYM/m232+NdkLo68s3KFMPsC8oEvT7xb+EEOU=; b=Ikah+W3pg2hJRMscQlHeovnhfS
	o4VZPluzyGzm5T6skEgK9tWCdweUZWnYT78ciQ6Tfgtkct21H33XY+tQ4q/jPRWsu3D415jMrwm0u
	Dh7f6mLL4bLBd72KM/eyuuAxX+AVmKYfAxboP/nJ6xuriBH6riOZcFIJ6HTubRaMZhuGNpyqrw56N
	2dvbgaC5qqjudSisgsbWZmccdber6UHLDFebfzI9KnajngumoIMIH/4JJoVkcmPrPVP765IY0nBu4
	lqzZLV3xjaqorniaXpuLu0KLw2Qc6IqU9RTE52i3mkJzzKnTBUDdJsjdUt88KP+7zSmKzVuCnKo/B
	/iUN7aCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C7z-000000070lu-3Fic;
	Tue, 22 Apr 2025 11:49:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJM-00000006qmX-3MEk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NcJGNvpYM/m232+NdkLo68s3KFMPsC8oEvT7xb+EEOU=; b=jNcPF9i/Y6eRir7adiGtUjJayU
	rkQ7tZ0JhLYEL72n5hsDDlmrecIcy8NZ2kcwRURxLwoPf7q5eAED34gI/r60F8MP2xQBzUp47noLv
	zYv13n1fryJwyb0sOqJJRLK5CXJJd8kAaTLHakf5C6KFRs7WnLyBkoiBfJ9OgTjP6QCYVd7c7pHAP
	tdP816n+FfT3q+EMIImafW/tRalHLMx0AxSeD0SZJLZhAKjCzD+xVeYHCgb3/0V9CSVh5wpPVFsnB
	dUCefcilSVqGnicMln8A/3cqfo1JycyDTQd+ZLzJImMHjVgKPnDC96q4CpSDCslsFDyaUlQ50zonQ
	J/FBA4wA==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJH-0000000BBMi-0Jh1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NcJGNvpYM/m232+NdkLo68s3KFMPsC8oEvT7xb+EEOU=; b=aavujSDvxMjZJu66LpLkd3ZZTc
	1dUYrdjUPI0GOSgTqa2H47/ulT/23zfzJbxHEoeTt8b3ubYhAaePvzjFMi4yVyJ3cYJ1Q7hw20NLg
	4wlYDmg0TFs84Ikox3/18Y1QuQdgdjpzWpgrqBPXeQtuJR530dnbNyPr5kzLT3QE+JOHMEzAtbB2e
	Zvh5X/2Ka01+Mg+Bs9+P0N6DW+6kgF6V5p2+1zI45xTxKOnPxpq07BD3RM5pPe5qrp21J0y5+Oedf
	XmWVai68a6LrjBMS9y5k+SN/x5dGghoLmLoRfxV2/zn6Ldzl+wiuhBSoEJVfP1QBpOZvW4th/rvBJ
	aju25naQ==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BIz-008kyr-1o;
	Tue, 22 Apr 2025 12:56:45 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v4 00/15] Update PHYTEC i.MX93 DTS
Date: Tue, 22 Apr 2025 12:56:29 +0200
Message-Id: <20250422105644.2725168-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115703_611556_B8F82FAA 
X-CRM114-Status: UNSURE (   4.83  )
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

Update i.MX93 device-tree sources in mainline for phyCORE-i.MX93 SoM and
phyBOARD-Segin-i.MX93 board with changes from the downstream kernel.

New SoM features:
 - PMIC support
 - EEPROM support
 - enhanced eMMC support
 - fix eMMC for ERR052021

New board features:
 - RTC support
 - CAN support
 - USB support
 - I2S audio support
 - 2nd Ethernet (EQOS interface)
 - enhanced SD-card support
 - fix SD-card for ERR052021

Link to v3: https://lore.kernel.org/all/20250418063104.2202085-1-primoz.fiser@norik.com/

Changes in v4:

Patch #1:
- no changes

Patch #2:
- no changes

Patch #3:
- fix commit message (s/pull-down/pull-up)

Patch #4:
- no changes

Patch #5:
- no changes

Patch #6:
- no changes

Patch #7:
- no changes

Patch #8:
- no changes

Patch #9:
- no changes

Patch #10:
- no changes

Patch #11:
- no changes

Patch #12:
- no changes

Patch #13:
- no changes

Patch #14:
- no changes

Patch #15:
- no changes


Primoz Fiser (15):
  arm64: dts: freescale: imx93-phycore-som: Add PMIC support
  arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
  arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
  arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
  arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
  arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
  arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card
    write-protect
  arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
  arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to
    fix ERR052021
  arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
  arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
  arm64: dts: freescale: imx93-phyboard-segin: Add USB support
  arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
  arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
  arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically

 .../dts/freescale/imx93-phyboard-segin.dts    | 243 ++++++++++++++++--
 .../boot/dts/freescale/imx93-phycore-som.dtsi | 165 +++++++++++-
 2 files changed, 369 insertions(+), 39 deletions(-)

-- 
2.34.1



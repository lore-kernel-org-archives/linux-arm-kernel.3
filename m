Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A0D0BB60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dfJ8c6chkv90K3yOhy0wiD/mADpHOHoC7n+9fhR4gQE=; b=TFJOp9/9LHogLK
	8Y3/HdEJzeVDTJT4r5zV5FxmtEJ+KjCMiuNNs1EVRHaVVc8HMX8AAPX+/psx2WQE8Fu7Ck2rsjIuN
	ebVfALxz0iNVc42oNbiOvreAnLCdgG6Gk4fZiVm4jGFkweYuaEqcYvSCcwixL6a7DuqXEVN2Dhy20
	js9fFD+EjzYniBAlCK6UNrFznba8JS827hZLiFiQXRfn9MgzyMhojxpgMmzEUoDyX4PYN6obwER66
	IWIK7oA447m0phjE2KGfS1iJaENj1I2OaB08Gjjsequ9214TpY/9TTjk4a6DjwImMHjnkYDe+ZDv3
	FkJaEaMJKkypidcgPB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qJB-0000000GnLr-0wW0;
	Thu, 24 Oct 2024 05:22:53 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qHa-0000000Gmz5-49Tq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 05:21:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L9Cq109673;
	Thu, 24 Oct 2024 00:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729747270;
	bh=dfJ8c6chkv90K3yOhy0wiD/mADpHOHoC7n+9fhR4gQE=;
	h=From:Subject:Date:To:CC;
	b=LfotmGBrKMEWOUpaXnmQLExRyewHyX3trMxA54TyIYrAc552mSFsvhgj0fD3klKUi
	 bQtxLtIz2U8k2l31ObPOaUUBjTOPef4BkGEX5ADYQwP0wA/c5l/+m+VtOH/mVwJ89p
	 KW8l/xc0qti8l2cQYfsoSyJVakcpO2s0t0lRKRKU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L9XT024906;
	Thu, 24 Oct 2024 00:21:09 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 00:21:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 00:21:09 -0500
Received: from [127.0.1.1] (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L4l8090467;
	Thu, 24 Oct 2024 00:21:05 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [PATCH v6 00/12] Add bootph-all property for J7 boards
Date: Thu, 24 Oct 2024 10:50:57 +0530
Message-ID: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnZGWcC/3XPS2rDMBCA4asErasyGj2dVe8RutCzFiSxsVyTE
 nz3yikk9ULLf2C+Ye6kxCnHQo6HO5nikkserjXU24H43l6/Is2hNkFAAYIDdYJ+j2Weor1QNwz
 z2FN7PlMThHYanYcUSF0ep5jy7QGfPmv3uczD9PO4s7Bt+kdK0C1yYRSoV0GiksxIlT7m/O6HC
 9m8BV+GBtk0sBodgFaGxaCD2Rn8n9F+beGb4TxG753qJO4M8TIME01DVCOhEwoBIKHcGfJpMED
 eNGQ1bKdFAMU1WPc01nX9BQbgZnPJAQAA
X-Change-ID: 20240430-b4-upstream-bootph-all-8d47b72bc0fd
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Aniket Limaye <a-limaye@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis
	<afd@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729747264; l=2759;
 i=m-chawdhry@ti.com; s=20231127; h=from:subject:message-id;
 bh=P0qB3XuVcTLwJH//aBf5M6QnOTxe7FOuOqqRoy+TWpM=;
 b=TH2isT7Kn89O1yfs5WE14YyDH2IghqDsuUFvPVdEo91SFT3mysxSXBPTy3A2tQglt2i5EWNoz
 Zeb2X8AU0YXCuMzlcJpZ/gG6ak5LGUmay18dMw8s2ewsEhePeKfeuUr
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519;
 pk=fsr6Tm39TvsTgfyfFQLk+nnqIz2sBA1PthfqqfiiYSs=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_222115_225814_DA8B0745 
X-CRM114-Status: UNSURE (   9.53  )
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

The idea of this series is to add bootph-all and bootph-pre-ram property
in all the leaf nodes wherever required and cleanup any other places where
bootph-all/bootph-pre-ram exist in the parent nodes as well since now
the bootloaders can handle it.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
Changes in v6:
- Fix the commit message and remove ospi1 ( Aniket )
- Link to v5: https://lore.kernel.org/all/20241023-b4-upstream-bootph-all-v5-0-a974d06370ab@ti.com

---
Manorit Chawdhry (12):
      arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup: Move bootph from mcu_timer1 to mcu_timer0
      arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup: Remove parent nodes bootph-*
      arm64: dts: ti: k3-j784s4: Add bootph-* properties
      arm64: dts: ti: k3-j721s2: Add bootph-* properties
      arm64: dts: ti: k3-j721e: Add bootph-* properties
      arm64: dts: ti: k3-j7200: Add bootph-* properties
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Remove parent nodes bootph-*
      arm64: dts: ti: k3-j721s2-evm*: Add bootph-* properties
      arm64: dts: ti: k3-am68-sk*: Add bootph-* properties
      arm64: dts: ti: k3-j721e-evm*: Add bootph-* properties
      arm64: dts: ti: k3-j721e-sk*: Add bootph-* properties
      arm64: dts: ti: k3-j7200-evm*: Add bootph-* properties

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       |  8 ++++++++
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi             |  5 +++--
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi              |  2 ++
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi        | 11 +++++++++++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi            |  6 ++++++
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts  | 16 ++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi              |  2 ++
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi        | 10 ++++++++++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                 | 18 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi            |  5 +++++
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi             |  1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi           |  3 +++
 .../arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi |  9 ---------
 .../dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi     | 10 ++++++----
 17 files changed, 131 insertions(+), 15 deletions(-)
---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20240430-b4-upstream-bootph-all-8d47b72bc0fd

Best regards,
-- 
Manorit Chawdhry <m-chawdhry@ti.com>



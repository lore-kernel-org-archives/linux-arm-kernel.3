Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C982C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dO0psC/NIw3wHa+zq1XlVVL/kT7HGD38RRa4TmOgHQ0=; b=1cg9brpbnA4Rl0uTbiPXZC71gM
	wX74EJaxk2JgSsphCF9OB8B+BL1HIry3CVb+fwbJCQ+eEo49q4i/sBVo2kE7fJJtVbFyBmn//seQi
	D91LcXqS8xgeu76X8Sb5vmdCNz5HizlzA8BK5VhdJPI9OD/5h4VV3aB18qs85avR3F5Y6CNmZezUV
	UFsGkrG/ZThQcI1gI2BLMM0Hesl+Uk/xxRm/Q+PB+o91jhKOgojCBIFtBvLnLfzklKtzelyCrF0MP
	nBnnaBXL3jnwx/IGb4pvJv8qBJOewp7P+72LhYEJl9GKLu5QExuFhEJ8FWKUutqnpnxbWcJ4AiAV8
	dPa843og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0W3-000000009ln-0bDo;
	Thu, 22 May 2025 07:38:59 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0Rx-0000000095t-0ZPn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 07:34:46 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54M7YWLn578074;
	Thu, 22 May 2025 02:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747899272;
	bh=dO0psC/NIw3wHa+zq1XlVVL/kT7HGD38RRa4TmOgHQ0=;
	h=From:To:CC:Subject:Date;
	b=yd9smL89Av3gxXabukerU0VWyJGlXDWwHpXjEII7RKJ8O+76UXdE2m8Mz16Q2E8D3
	 tDL77hi2mchsqjOQ/dg8ePWWN4UqcGhiZi8dz9vuU+2J0JUp3+QYs8t4SY8JJa3SNi
	 LHeI6Whmb1epDlZZn4Whid14wpcozPOoEY6PHu8I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54M7YWcU3319907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 02:34:32 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 02:34:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 02:34:31 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54M7YQ4m475080;
	Thu, 22 May 2025 02:34:27 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/2] TI: K3: Switch MCU R5F cluster into Split mode
Date: Thu, 22 May 2025 13:04:24 +0530
Message-ID: <20250522073426.329344-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_003445_268259_8444A6A2 
X-CRM114-Status: UNSURE (   9.31  )
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

Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
R5F cluster in the MCU domain which is configured for LockStep mode at
the moment. Switch this R5F cluster to Split mode by default in all
corresponding board level DTs to maximize the number of R5F cores.

Corresponding support to shutdown MCU R5F core 1 on SoC power on have
been posted in U-Boot:
https://lore.kernel.org/all/20250522071828.285462-1-b-padhi@ti.com/

While at it, correct the firmware-name property for MCU R5F cores of
J742S2 SoC in [PATCH 1/2].

Testing Done:
1. Tested that each patch does not generate any new warnings/errors.
2. Build test on all existing TI K3 platforms.
3. Tested U-Boot and Linux load of MCU R5F core in split mode on all
applicable boards (AM68-SK, AM69-SK, J7200-EVM, J721E-EVM, J721S2-EVM,
J784S4-evm, J742S2-EVM)

Test logs:
https://gist.github.com/3V3RYONE/ee8e3cb9aa5f4c5c00b059b9c14bfa98

Thanks,
Beleswar

Beleswar Padhi (2):
  arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU
    R5F cores
  arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode

 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi      |  4 ++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts           |  4 ++++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi     |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts          |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi     |  4 ++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi    |  4 ++++
 .../arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j742s2.dtsi           |  1 +
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi     |  4 ++++
 9 files changed, 46 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DaQrOZTOL9FdmJ5vPTmkctWgmHNoW6HaR+AB6GJWlb8=; b=SdRpoFQ7aP6nhZSJJZf9d8W/+O
	K6F8zJSP/Azzhcs3l0acxjA2Px4TriIs/aJylqwB0P+mc4n1EYD9bUImTjqKgSLmtMsNTr6PkUkiG
	OEeTbdS20dQPoCnxmr6KlmIon9Y17FcDRnv2RaeEgFqep+7pcNaYgvTIWgGSYMQOTgfx50290LJ2P
	t+zCoBMZL6Dq1YAFWqJJZjWfKbHLPoAX5ojxUtVFy9xF1ve89pJWeCisAxxJF2UcRrhdFM1W+gFax
	gR3+p+7M9ARRt3Adb+5b3qVem4615/uSp7ygJKsODfydOG+IFENlFR1zXY6pn96/xr9RYntJIm0Vq
	wGbNfnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3in-00000008B09-10iq;
	Mon, 18 Aug 2025 17:32:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo25i-00000007x6e-0qiF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 15:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DaQrOZTOL9FdmJ5vPTmkctWgmHNoW6HaR+AB6GJWlb8=; b=X5v0oelt3lBGVxOyAo3QRw1Vhw
	w4TAKNYeu0F8jD5TuA0rXv0k5faVeTwRwZ+cNIDgyedAjV+MRDlyqIBOVWn82V6SV+qU3QrxqxWs1
	u0jYqXK/UdADZPFRsTLjFuU15LiGZNE+PwEOVtHCQWklPnz1wA7dSg8y8PdOcnkvGsX1D1rc7TKlX
	EH0AS9XtoETTwjFKae6bjk/ixV03Bdpqe5iRiecRZYFF8Tezj2QmUl8AYwvaMWw1pfA3jGqrCSlcM
	gq7RRd3u7m1H94xpbgM/dpoqzsK1Hm8xJUVgQKIntQQTw6aPH4bveBHas5Hf9Sy3vdHLYkYSLYDqI
	/oqiV4ww==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo25e-0000000HRQl-408H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:48:09 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IFlsPq3197021;
	Mon, 18 Aug 2025 10:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755532074;
	bh=DaQrOZTOL9FdmJ5vPTmkctWgmHNoW6HaR+AB6GJWlb8=;
	h=From:To:CC:Subject:Date;
	b=sg5TT64yi56saP0naK1Y4qTEDGcRqsko/6In2O1QrFYcBzi4/hXfWj73jFptruJRa
	 kPD0f0ptFz4tuDpP/HHfpLxIoR8N7MD2GRC3vIY6OoJmHyAtLR5b9dSNGVl8nO0P+k
	 /hEnt3SbJxeNU4ZCgwlTvT2VBzoNvSV3PmhzpdV0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IFlrwY619508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 10:47:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 10:47:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 10:47:52 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IFlk8l1551018;
	Mon, 18 Aug 2025 10:47:47 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [RFC PATCH 0/3] Add DSI and Raspberry Pi panel support
Date: Mon, 18 Aug 2025 21:17:43 +0530
Message-ID: <20250818154746.1373656-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_164807_254366_6223DC7C 
X-CRM114-Status: UNSURE (   9.49  )
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

This series adds support for enabling DSI output and attaching a Raspberry
Pi 7-inch panel on the BeagleBone AI-64 (J721e).
The patches include:
1. Bindings- Extend panel-simple bindings to allow the
Raspberry Pi panel to bedescribed.
2. SoC integration- Add DSI and DPHY TX nodes for J721e main domain.
3. Board integration -Hook up the Raspberry Pi 7-inch panel to the 
BeagleBone AI-64 using the DSI interface.

Harikrishna Shenoy (2):
  devicetree: bindings: dsiplay: panel: panel-simple.yaml: Add Raspberry
    pi dsi panel compatible
  arm64: dts: ti: k3-j721e-beagleboneai64: Add DSI RPi Panel

Rahul T R (1):
  arm64: dts: ti: k3-j721e-main: Add DSI and DPHY-TX

 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...1e-beagleboneai64-dsi-rpi-7inch-panel.dtso | 141 ++++++++++++++++++
 .../boot/dts/ti/k3-j721e-beagleboneai64.dts   |   7 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  31 ++++
 5 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtso

-- 
2.34.1



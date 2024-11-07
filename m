Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C58AD35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aPOy4YYWnfQMbqegU7JnAcEyre8VGwoWzauffPbwmtg=; b=HNaPCWj1dDlz9L+etfn/B/HwGM
	ZqEf95vqrgxrLvOKNBYOM7ji1OQ8Oe5ETnnP72MYx3de49uqhQ0PYkl8NjtHg5IfWLz+47HpTHeiX
	O6VLVxHH5E+nanIaY5Y3UJbTxUgd9pzRZ+3GpP7FV2/qgLO9O2TaUdB/t/fdiC5We7vHVSk16GQd/
	esAVXp9AkeLRA1W5jSkqgLAWWjln+d1LUkoVB+cyoEPkT7q/MWMsvZDOtIp8NyJYDCmzJA9wpOPUT
	zDjfiQ3D0D/cCZfUKkEh8IZ4nfu3j/AbRJ/bAqyeek+0qghr4G+3CKnJ7FxWnZQSX9VwRgsQKT3Rv
	qX5Ar1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9072-00000006YwB-2Z9v;
	Thu, 07 Nov 2024 10:51:40 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t901j-00000006Xz2-0TbR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:46:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A7Ak1Kf039805;
	Thu, 7 Nov 2024 04:46:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730976361;
	bh=aPOy4YYWnfQMbqegU7JnAcEyre8VGwoWzauffPbwmtg=;
	h=From:To:CC:Subject:Date;
	b=ro/B/o9Z1KBnNaQ4hKzM1m5gbjSpRvJuRv+56byEyBrjZm0qYya1bRZ0UPNcBtD9f
	 zOPpD1Xv52rPlzES+xc7DPRffx+9q3oYxPiU1/g9VeT79BfK6qsdLeA5/DSp16muIT
	 /1LVTqAJFCC2lAplit3KwqBMY4LIuNHsNerbV8MU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A7Ak1wL048767
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Nov 2024 04:46:01 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 04:46:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 04:46:01 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7Ak1KR055338;
	Thu, 7 Nov 2024 04:46:01 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A7Ak0u1019852;
	Thu, 7 Nov 2024 04:46:01 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 0/2] [PATCH 0/2] Add Clocks to ICSSG
Date: Thu, 7 Nov 2024 16:15:55 +0530
Message-ID: <20241107104557.1442800-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_024611_216635_C59CAA64 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds clocks for ICSSG for AM64x.

PATCH 1/2 Adds the dt binding necessary to add clocks to the device tree.
It adds the `clocks`, `assigned-clocks` and `assigned-clock-parents` in
the dt binding of ICSSG node.

PATCH 2/2 Adds the required clock to the ICSSG nodes. It also changes the
clock used from clock 20 (ICSSG_ICLK) to clock 0 (ICSSG_CORE). This patch
adds the clock-names, assigned-clocks and assigned-clock-parents to icssg nodes.

There is no additonal driver changes needed for this binding change.

MD Danish Anwar (2):
  dt-bindings: soc: ti: pruss: Add clocks for ICSSG
  arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock

 .../devicetree/bindings/soc/ti/ti,pruss.yaml         | 11 +++++++++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi             | 12 ++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)


base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
-- 
2.34.1



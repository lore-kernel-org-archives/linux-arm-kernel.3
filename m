Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47EED41C38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gj6T3+0yCPgphcaSMUSbs+1SKIXkJ3ZDcoZDqgW4U/Y=; b=bhSRy9pcEKdw0YuXO/D657X7Pc
	sOfHjDCKp6qfItyj9m/m8GlRBpVdCIG2gDr4uAqjfnzm/jIQfneX/8ZOQB6YFddXHt2v6XCdJoo58
	TfEXcC+0jGyrdRtnz35VWWAT9bDDYYrQWVyb+nVZrVGSSamaC/lrsv6v/bG2cJsZIEiEgRRHkPSw3
	wS3wipw/Q3U+et4ORYUhRK4YelFdIrb5AAHO95hYL73KRb4U8SQslxmnzG/P0zPlxpdy1l0tD9Rcb
	U+uq+zSbr6rlr+G2Ipt8y6dru689PwdPDsvzexmvMty590Py+/1bkJXqHFknDNeTN1UpFlQJrK0Rk
	0sNQFG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLY-00000006Ytq-48uo;
	Wed, 13 Nov 2024 11:15:40 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBGD-00000006XyT-3WA4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 11:10:11 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ADB9xps2473553
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 13 Nov 2024 05:09:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731496199;
	bh=gj6T3+0yCPgphcaSMUSbs+1SKIXkJ3ZDcoZDqgW4U/Y=;
	h=From:To:CC:Subject:Date;
	b=kAb+8xexK/LWFgyWs6DM0PPbc5UzVzvJOgwFz2/q5tIvPqss8AQc5mbeG2AwXN9Ta
	 elhLa3mvanzGwPDPwaOXIQR+xwkYzwXNWXlACCaADHgFY03AQuxvx9fgywae7cCIoM
	 S2ajFsw7TnqAaBMFygmiE7ZNCmcFUk924v77Rh3Y=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADB9xxN006449;
	Wed, 13 Nov 2024 05:09:59 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 05:09:59 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 05:09:59 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADB9xqV096947;
	Wed, 13 Nov 2024 05:09:59 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4ADB9wec021255;
	Wed, 13 Nov 2024 05:09:58 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 0/2] Add Clocks for ICSSG
Date: Wed, 13 Nov 2024 16:39:53 +0530
Message-ID: <20241113110955.3876045-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031009_988709_AAD818D5 
X-CRM114-Status: GOOD (  12.90  )
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
It adds the `clocks` in the dt binding of ICSSG node. Each ICSSG instance
has 7 clocks available to them as per AM64x TRM [1] Section 6.4.3 Table 
6-398. They are not added in the dt bindings yet. This patch adds all
available clocks to ICSSG bindings. 

PATCH 2/2 Adds the required clock to the ICSSG nodes. It also changes the
clock used from clock 20 (ICSSG_ICLK) to clock 0 (ICSSG_CORE). This patch
adds the clock-names, assigned-clocks and assigned-clock-parents to icssg
nodes.

More details on clocks can be found at [2]
There is no additional driver changes needed for this binding change.

Changes from v2 to v3:
*) Modified commit message of PATCH 1/2 to state why clocks are being added
to the binding.
*) Added all available clocks to ICSSG bindings. Earlier only two clocks
were added.
*) Added all available clocks to AM64x DTS. Earlier only two clocks were
added.

Changes from v1 to v2:
*) Dropped assigned-clocks and assigned-clock-parents from DT binding as
suggested by Krzysztof Kozlowski

[1] https://www.ti.com/lit/pdf/spruim2
[2] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/am64x/clocks.html#clocks-for-pru-icssg0-device
v1 https://lore.kernel.org/all/20241107104557.1442800-1-danishanwar@ti.com/
v2 https://lore.kernel.org/all/20241108142946.2286098-1-danishanwar@ti.com/

MD Danish Anwar (2):
  dt-bindings: soc: ti: pruss: Add clocks for ICSSG
  arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock

 .../devicetree/bindings/soc/ti/ti,pruss.yaml  | 10 +++++++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      | 22 +++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)


base-commit: bd05b9a700c10473c2f52bf12c5c5938c30e80b0
-- 
2.34.1



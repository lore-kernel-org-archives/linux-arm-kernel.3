Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0ADD5C0ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DHwDBRm/kTZNcUg7348BUceEPUJFJgU9zgd2MT5a0zs=; b=K/P9AAp9K08B0Ncln2CRIQDtIS
	AcQFAmLXMH11uiSeNASwKcTTjUc4tNkQAz8qufF+GtTBLtbjt3/yC0Whd+DYyWlu0mOKMks2UB8Wu
	kEPeRw4c0G5T0oHDTGzorUyNQBkbOvkejuJ2C1MNs0cdVSnQqHKgrUA/jCBMa1jk4GV5POYjBAK/L
	jSA6iawFWbw16zWzbZO02lr3fXJ+inP2MDIfcmwe3JdJMd9rVYk2E2ZicFFJl7GDqF6MQLGUhHvyQ
	/mdUgEeZHNiZGqnfn4wpG7XwIbXWmBnHQkqYghtmSZlLtCeMtJMKedY48l4niXJOrhNKX22O7TTF3
	agTkno1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qte-0000000B1Ku-1vLx;
	Fri, 08 Nov 2024 15:27:38 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pzr-0000000Ar3q-1DUv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:30:00 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8ETnAr046784;
	Fri, 8 Nov 2024 08:29:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731076189;
	bh=DHwDBRm/kTZNcUg7348BUceEPUJFJgU9zgd2MT5a0zs=;
	h=From:To:CC:Subject:Date;
	b=bEFdS4w9eb0fOhJIZbzbqvOmvhga7+YeGMOCs6fONFTy1tXQ+10sqFXBlmNowM4Hg
	 bmFQzm/UbeF+KFRICcunrXZR8ZauDN541PMXd+8T/Gz2AxI0Yzc9FU8fwAaURfAAZ9
	 r26HzuRv96bS+Rgvx1jq/eJszLqo/xczOcgfqeSo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8ETnA3104235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 08:29:49 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 08:29:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 08:29:49 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8ETnhm011246;
	Fri, 8 Nov 2024 08:29:49 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A8ETmve032063;
	Fri, 8 Nov 2024 08:29:48 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>
Subject: [PATCH v2 0/2] This series adds clocks for ICSSG for AM64x.
Date: Fri, 8 Nov 2024 19:59:44 +0530
Message-ID: <20241108142946.2286098-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_062959_392895_4BC4853F 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, vigneshr@ti.com, kristo@kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

PATCH 1/2 Adds the dt binding necessary to add clocks to the device tree.
It adds the `clocks` in the dt binding of ICSSG node.

PATCH 2/2 Adds the required clock to the ICSSG nodes. It also changes the
clock used from clock 20 (ICSSG_ICLK) to clock 0 (ICSSG_CORE). This patch
adds the clock-names, assigned-clocks and assigned-clock-parents to icssg
nodes.

There is no additonal driver changes needed for this binding change.

Changes from v1 to v2:
*) Droppped assigned-clocks and assigned-clock-parents from DT binding as
suggested by Krzysztof Kozlowski

v1 https://lore.kernel.org/all/20241107104557.1442800-1-danishanwar@ti.com/

MD Danish Anwar (2):
  dt-bindings: soc: ti: pruss: Add clocks for ICSSG
  arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock

 .../devicetree/bindings/soc/ti/ti,pruss.yaml         |  5 +++++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi             | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)


base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
-- 
2.34.1



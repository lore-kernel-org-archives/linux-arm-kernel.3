Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14695C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8XIxO7QqZCfXEMacDLpemlFTOjp51ap9NkRRGgC2z+0=; b=uXQo7H9VnoG3ivzdXp2E+Q/6Y6
	LIfH4iSS5eZfCIvmI+1C4HyV9iNHCKMM72XLhN0Z0uOcrYhWyZXMeRhv7rb2fvYXehzLn4+tZn0nW
	L/I84QhWhDgg4EGvd887lCvmFMBglZHP+avsZkzsLgfu9EYnSiAags5ls8GptjctuuoGyO5u0kyEV
	4jdKOvHBMDIUluCjQsk4A63QGLrPOVgA0paUBTJaViFAYkb7Und2yecqp/nFlV7ZjW6eIgiVCI+qa
	nptiAW4SgMIydWUSnV+zusYItvHrWtSZJ7p0xbc0gU9rKKgZ4FYCx3sNniaOAFJ/RkC5RADst6FF5
	jqLrnmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zDm-00000005H8f-02zN;
	Mon, 21 Apr 2025 22:02:34 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yyF-00000005DRS-2Y0F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:46:33 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMxC1749650
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745271982;
	bh=8XIxO7QqZCfXEMacDLpemlFTOjp51ap9NkRRGgC2z+0=;
	h=From:To:CC:Subject:Date;
	b=c+4Hg52AMs7/eJ//ndrQq0M5JdYHCshUhQsT3Fo649frsLnc5R56wZ7YzBI4PiW7l
	 WX7u+grHeaVGufROD6xGQq+CKH0lM1m8Vm1uUALw/8bS16ETXVbtqLsWmdDGFgEMnq
	 b70T8PeLvI97mJ2ff77OpGQjp6/I7IofHT34Xt58=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkMsP020838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:46:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:46:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:46:21 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLkLqK038764;
	Mon, 21 Apr 2025 16:46:21 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 0/3] Fix remaining TI K3 CHECK_DTBS warnings
Date: Mon, 21 Apr 2025 16:46:17 -0500
Message-ID: <20250421214620.3770172-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_144631_690915_168C32EA 
X-CRM114-Status: GOOD (  10.34  )
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

Hello all,

Until we resolve this thread[0] we do not have a set direction for
modeling our device's controller devices. For now as the AM654 MAIN
domain controller region is already one of the messy combination
syscon + child device containing nodes, no harm in silencing this last
DT check warning in the meantime.

Depending on the outcome of [0], this series can be safely unwound in
a couple ways without any backwards nor forwards compatibility breaks.
So no need to wait on the outcome there to take this series.

The last patch should take care of the last CHECK_DTBS warning for K3.

Thanks,
Andrew

[0] https://lore.kernel.org/lkml/6241ff00-27e6-45ab-808e-f04e39854753@ti.com/

Andrew Davis (2):
  dt-bindings: mfd: ti,j721e-system-controller: Add compatible string
    for AM654
  arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101
    panel

Jan Kiszka (1):
  arm64: dts: ti: k3-am65-main: add system controller compatible

 .../bindings/soc/ti/ti,j721e-system-controller.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi            |  2 +-
 .../k3-am654-base-board-rocktech-rk101-panel.dtso   | 12 ++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.39.2



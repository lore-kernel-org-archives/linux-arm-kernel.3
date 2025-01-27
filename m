Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC33DC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LApssjvadB1SvJDtwWfHz33SW6GBmJjSjuF/LQufrn8=; b=MqylC5ZG9PbF/VbOFhnVHXmVmS
	501umvoKPLxFntEDMfPagNUrjZi4IyC1CjcuficWD1JwcjTX4jdXsTFY7xfTRvdiRtwRmCUZ8SIG2
	24qJ2n2aaUMMBebOLufGCPYU/W/KHGygzRK8RGk9A4l/WznHqLCZdhlzivV8NzgkxzPg5D0yoj8tO
	4WKdFMwVTqkAx8Entw8qROP43hfN+eQSyJsnoRTYCiXwnwEkLDAVYL0+UTtUXsNm2z5OtOIDCRJwL
	HVS7k5Va06HtcOcOL6b7/0vugBEOW5eQuu197BV9E3T7EORduvCJRgAiJEpjcXQJ46kLuMXkPleS0
	QO0koadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXRy-00000003NW4-1axR;
	Mon, 27 Jan 2025 22:19:22 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXPJ-00000003N8n-16AF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:16:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50RMGVwL1052869
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 16:16:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738016192;
	bh=LApssjvadB1SvJDtwWfHz33SW6GBmJjSjuF/LQufrn8=;
	h=From:To:CC:Subject:Date;
	b=PyQkC/hiZXC13NTNvM29HiZ14Yr5kvc/rcaI5JWA5USau1yKHaGwNVE4IAhbZIM8v
	 joaamr3CLi2zjAJ4LH4hA+FZlDnWgdv0j1rZFIYXEbsY0Vs3cRWuym3q4z6lDWzmVn
	 qDRbdYvTav2gWJeRXmAjZGD8MGy3VH4AzF4/uNt4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50RMGV07070989
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2025 16:16:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 16:16:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 16:16:31 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50RMGVEG098068;
	Mon, 27 Jan 2025 16:16:31 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Devarsh Thakkar
	<devarsht@ti.com>,
        Hari Nagalla <hnagalla@ti.com>
Subject: [PATCH 0/4] Add R5F and C7xv device nodes
Date: Mon, 27 Jan 2025 16:16:27 -0600
Message-ID: <20250127221631.3974583-1-jm@ti.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_141637_414241_2E026992 
X-CRM114-Status: UNSURE (   8.15  )
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

For am62x and am62ax devices, this patch series adds device
nodes for the R5 cores and C7xv DSP subsystem found in their
respective voltage domain, based on the device TRMs [0][1].

Boot tested on am62x SK and am62ax SK boards.

[0] https://www.ti.com/lit/pdf/spruj16
[1] https://www.ti.com/lit/pdf/spruiv7

Devarsh Thakkar (1):
  arm64: dts: ti: k3-am62a-wakeup: Add R5F device node

Hari Nagalla (2):
  arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f node
  arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node

Jai Luthra (1):
  arm64: dts: ti: k3-am62a-main: Add C7xv device node

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi  | 24 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 11 +++++++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi    | 36 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 23 +++++++++++++
 4 files changed, 94 insertions(+)

-- 
2.48.0



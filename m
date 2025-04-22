Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC090C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Qm4Y02Y6jma5aQSjcKIxPmnEE1BWVaqEOZGF7JM4c4=; b=TC0m3Q1uAqJY5a1Hxs3B3o9HPB
	eIpj8dl29RYzwCy41JTYsstB/Rr6eqp0h7ihzZW/wrKG+2LNT5j25MBn0qhS+B+DtjFv38i+4Td8Y
	BpE48VlHlVNYAeMPTP8s+EcI7izxwYVK8GBGpYAbG5hziTTK/DZZaz+7iuBRRiLxBj4/nU5MqtOp6
	FSPz416+tj7rl4gse7zTUwXeANYjZBsnojY7macQIBEjzip8RC44+rrXw5f3mZkVmkVL5wLLMedyx
	2JLnxl5firAVpGQgTS+1PHBnVSaL2AXD5+90CPguSgq2qoqRQL40+oTNFGb/sqJacUQB4JFUBvTRp
	KW/rPhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DNX-00000007F5b-0FZD;
	Tue, 22 Apr 2025 13:09:35 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CJ1-000000072Je-3rrm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:00:53 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC0lVf1206356
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745323247;
	bh=2Qm4Y02Y6jma5aQSjcKIxPmnEE1BWVaqEOZGF7JM4c4=;
	h=From:To:CC:Subject:Date;
	b=LYsVvu2nE815Ymd7jzTW+NNXvOrMIBDGTa/gtYPo4OJd72JdgsFJvDL5r9pza4bb+
	 QDOUD4NbAgapZ1Ve3hv6yT0R0j482Kf0ep45isttg7Rz74pQxPVv5c0/2YelrLv9Fd
	 Q5UM/wjA1M3TXQwWzcttv5XNB+PI3uIJVt9lTXy4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC0lsd128010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:00:47 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:00:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:00:47 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MC0hVv094623;
	Tue, 22 Apr 2025 07:00:43 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 0/7] AM64 and J7X DT: Enable PCIe 64-bit Address Space
Date: Tue, 22 Apr 2025 17:30:35 +0530
Message-ID: <20250422120042.3746004-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_050052_091162_D772B052 
X-CRM114-Status: GOOD (  12.40  )
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

Hello,

The Cadence PCIe Controllers in TI's K3 SoCs namely:
AM64, J7200, J721E, J721S2 (AM68), J722S, J742S2 and J784S4 (AM69)
support two address regions:
1. 128 MB address region in the 32-bit address space
2. 4 GB address region in the 64-bit address space

Currently, the 128 MB region in the 32-bit address space is enabled in
the device-tree. This might be suitable for most of the use-cases, but
for those use-cases requiring larger address regions than 128 MB it is
necessary to switch to the 64-bit address space with the 4 GB address
region. This series implements the corresponding device-tree changes to
support the 4 GB address region as the default configuration. Existing
use-cases should continue to work without any regression.

Series is based on linux-next tagged next-20250417.

Link to v1 series:
https://lore.kernel.org/r/20250417120407.2646929-1-s-vadapalli@ti.com/

Changes since v1 series:
- Fixed the 'ranges' in k3-j721e.dtsi which is the third patch of the
  series to set the size as 4 GB instead of the incorrect value of 128 MB.
- Based on Udit's feedback and offline discussion as described at:
  https://lore.kernel.org/r/7f6ea98c-df6d-4c94-8f42-76cc8306b6c4@ti.com/
  the address region of 4 GB is split as:
  0. 4 KB ECAM
  1. 1 MB IO
  2. (4 GB - 1 MB - 4 KB) 32-bit Non-Prefetchable MEM
  instead of the previous split of:
  0. 4 KB ECAM
  1. 1 MB IO
  2. 128 MB 32-bit Non-Prefetchable MEM
  3. (4 GB - 129 MB - 4 KB) 64-bit Prefetchable MEM

Series has been tested on AM642-EVM, J7200-EVM, J721E-EVM, J721S2-EVM,
J722S-EVM and J784S4-EVM using an NVMe SSD connected to the PCIe
Connector on the EVMs.

Test Logs:
1. AM642-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/5d1814ee2e0857dac0ac08a6cf8759da
2. J7200-EVM PCIe1
https://gist.github.com/Siddharth-Vadapalli-at-TI/9927faab7615b9c1c101854a213f30f5
3. J721E-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/e6545e31f45077fe59c896f8875bf1b9
4. J721E-EVM PCIe1
https://gist.github.com/Siddharth-Vadapalli-at-TI/5c0b64f339f89139797d8346c40b1ee9
5. J721S2-EVM PCIe1
https://gist.github.com/Siddharth-Vadapalli-at-TI/67b03c441d53ef0d27837e615371efbd
6. J722S-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/7625f47b57d45aada4c125ac4f60ebd6
7. J784S4-EVM PCIe0
https://gist.github.com/Siddharth-Vadapalli-at-TI/edf2af424fc7d5905832d536a1171a1a

Regards,
Siddharth.

Siddharth Vadapalli (7):
  arm64: dts: ti: k3-am64-main: switch to 64-bit address space for PCIe0
  arm64: dts: ti: k3-j7200-main: switch to 64-bit address space for
    PCIe1
  arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
  arm64: dts: ti: k3-j721e-main: switch to 64-bit address space for
    PCIe0 and PCIe1
  arm64: dts: ti: k3-j721s2-main: switch to 64-bit address space for
    PCIe1
  arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for
    PCIe0
  arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address
    space for PCIe0 and PCIe1

 arch/arm64/boot/dts/ti/k3-am64-main.dtsi             |  6 +++---
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi            |  6 +++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi            | 12 ++++++------
 arch/arm64/boot/dts/ti/k3-j721e.dtsi                 |  2 ++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi           |  6 +++---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi            |  6 +++---
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi    | 12 ++++++------
 7 files changed, 26 insertions(+), 24 deletions(-)

-- 
2.34.1



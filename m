Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F6E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aemKenByK1Wm9gLtV2/eR1Ty/NyvthyNtF1WcfPekrI=; b=2gVL81GIKAue4j+1fOhJm1Xc1I
	HfWBytJxBmqFhM3qTYUPgCal9kENTSpp6YTcSSWa6smnU0VsjXDlYXa61J05VMvOGm3/cuCNUQq6V
	u7xNL3NktBD8YXs45KL4OVHPtUxS/lzWK7qg7wKAcY/5Iz8hYcC2Z+lJWxVfoyAE15TS1X6GJW3Bd
	CA2c/djITuc5+elwXbsH6Ly0dBu7NpyncliGyGFhhrBcrBBOJBJLvJ5+HsAUR+59Gm4EjYV7Q8N7j
	HE0BbSD6gLMbwQY/l2Wj0XNKG7gQ9cvDpGGfQtIQDzOt5AU+sYCBYkTiYAP0T+XIMnqEAQ+07tgU9
	mhJKy+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Si-0000000Fd41-2s9c;
	Thu, 05 Dec 2024 10:52:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ri-0000000FcvP-1fjJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aemKenByK1Wm9gLtV2/eR1Ty/NyvthyNtF1WcfPekrI=; b=MXnRM4ZOICyB9p6OZ9NYH8BCdG
	5/PDZDC2+sbTt/8NPpYtqfiyL4DcFX6jZCnc/m0al/GqxsXIVTE6DiAbzDTCa8eJ+58up1uiYLU2w
	PMzybS1OzAOJu+9k1oh4HUBK7x5SXbpWSB8iroRiOllgbN1gk5YdsLg0+bqku9uBmLOmacO91DzzM
	pSOue/yYZv+4vzyVNiKhCMuFj6Rsv4NOwBfScD907E4RPivthEhM/HEWz3uowXammIpYqGzIVk8tj
	/Iddxo54QUuGPA0Ykgl5KnvUT/O/dgSHpRIOeGcLZous5jRWDuSBvOPEhWJNgUozgFR1UzJz9XwzE
	X4cOXlng==;
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rf-00000002pl8-0FkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:50:57 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B5AokcL109449;
	Thu, 5 Dec 2024 04:50:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733395846;
	bh=aemKenByK1Wm9gLtV2/eR1Ty/NyvthyNtF1WcfPekrI=;
	h=From:To:CC:Subject:Date;
	b=m+1Dov+NKonZEedrdEWUuOAueDFn6/ex1AUwv1y0ihwgUM/4fs9j8qRqvb2m9HXnF
	 cqjKanmkgWmAUj+LTxeofLCHA29ccNHt74DhI0gvGzNIDnYzYmoAIKvOyuy4vVsLCH
	 ebHn7e9iREOIqf38bWtG8GajvYSelM7KvCA9oTTg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5Aokfg070540
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2024 04:50:46 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 04:50:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 04:50:45 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5AofJq110686;
	Thu, 5 Dec 2024 04:50:42 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 0/4] Add PCIe Overlays for J721E, AM68 and AM69
Date: Thu, 5 Dec 2024 16:20:32 +0530
Message-ID: <20241205105041.749576-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_105055_490855_D232E457 
X-CRM114-Status: GOOD (  11.78  )
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

This series adds device-tree overlays for enabling Endpoint mode of
operation of the PCIe Controllers on TI's J721E, AM68 and AM69 SoCs.

Only the second patch of this series has a v3 while the rest of the
patches have been newly introduced in this series. The reason for
grouping patches is the dependency on the Makefile w.r.t. the changes
made in the patches when enabling overlays.

v3:
https://lore.kernel.org/r/20241010100933.2492806-1-s-vadapalli@ti.com/
Changes since v3:
- Rebased on next-20241204.

v2:
https://lore.kernel.org/r/20240222065733.1213434-1-s-vadapalli@ti.com/
Changes since v2:
- Rebased patch on next-20241010.
- Moved vendor specific property "ti,syscon-pcie-ctrl" to the end of the
  node.

v1:
https://lore.kernel.org/r/20240220105006.1056824-1-s-vadapalli@ti.com/
Changes since v1:
- Created a new overlay for PCIE1 based on Andrew's suggestion at:
  https://lore.kernel.org/r/415ee6d4-fe26-4582-80f3-9b503d308fdf@ti.com/
- Updated Makefile to allow applying overlay on
  "k3-j721e-evm-pcie0-ep.dtb"

Series is based on linux-next tagged next-20241204.

Logs validating series:
1. J721E Overlay test logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/682d2469884d74ad73c3e6ab4b829067
2. AM68 Overlay test logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/b302475ee8ff257dab358a7ccfaaa734
3. AM69 Overlay test logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/c50e5a09b5af962cba722619974add2b

Regards,
Siddharth.

Siddharth Vadapalli (4):
  arm64: dts: ti: Makefile: Fix typo "k3-j7200-evm-pcie1-ep.dtbo"
  arm64: dts: ti: k3-j721e-evm: Add overlay for PCIE1 Endpoint Mode
  arm64: dts: ti: k3-am68-sk-base-board: Add overlay for PCIE1 Endpoint
    Mode
  arm64: dts: ti: k3-am69-sk: Add overlay for PCIE0 Endpoint Mode

 arch/arm64/boot/dts/ti/Makefile               | 15 +++++-
 .../ti/k3-am68-sk-base-board-pcie1-ep.dtso    | 53 +++++++++++++++++++
 .../boot/dts/ti/k3-am69-sk-pcie0-ep.dtso      | 53 +++++++++++++++++++
 .../boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso    | 53 +++++++++++++++++++
 4 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso

-- 
2.43.0



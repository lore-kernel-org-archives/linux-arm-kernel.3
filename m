Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A19CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 03:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fm7EbK8iCdBY8MyFpYjSk6v/Dd93EhSIFsL/bG1/W7c=; b=dst0xpjA7wh4ug/4TTFsf3U2jZ
	NRhuB9gL2zBDcR4eibFky3loWpimXLOh5AuKlPX52s1GbN6j4xPTMGtRjIpODsSv3HPW8IyFrAAaL
	hmq0jHr+v6UOGNIaW/ne3afGPGbgwy+oYcETPuN6Ow4Mz5UGFGYGuvKitXL8UuWBO2Qvc6T6ebBvj
	vAq8nTBB2uc+mmniBKbsSLkS4fffs6Io57xBRSrwyhtEJRzYYQUDBRhdoSYNuCLFGblKe55tN/Bdj
	LsHLZpcaMAiNgNa/verDfgDfuZzf920RD6cXWY9j3KdF5hravnl+DfaHwQ0wSRa8Sdud+i8aqlw02
	IqMuTbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRnx-00000001jf5-3XTb;
	Fri, 19 Sep 2025 03:29:01 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRnv-00000001jeB-1Vtl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 03:29:00 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58J3SrCD151725;
	Thu, 18 Sep 2025 22:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758252533;
	bh=fm7EbK8iCdBY8MyFpYjSk6v/Dd93EhSIFsL/bG1/W7c=;
	h=From:To:CC:Subject:Date;
	b=KfIWXTgHSZworZl4+c0lPgT4HMiC8jPBo5NgzMnEH5R8HpSioCtIT6OXcwT0pTqdz
	 U8G1ZgOnN8bjosp4bSY2e3g1bR0T2Pn843BHBLZcVOJAt81nKHl6v3vVRtnZRkevrU
	 msCMS6K1zbYqBiPS4n8Y+foMtsRuMLz6JUwYYTc0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58J3Sr2n2842067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 22:28:53 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 22:28:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 22:28:52 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58J3Sptd1901011;
	Thu, 18 Sep 2025 22:28:52 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-ramamoorthy@ti.com>
Subject: [PATCH 0/2] Add PMIC support for AM62D
Date: Fri, 19 Sep 2025 08:58:04 +0530
Message-ID: <20250919032806.707926-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_202859_521272_6BEACF03 
X-CRM114-Status: GOOD (  10.98  )
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

This series adds PMIC support for the AM62D2-EVM.

The first patch corrects the PMIC pad configuration by wiring the 
PMIC’s INT pin to the SoC’s EXTINTn input.
The second patch enables the TPS65224 PMIC on the wakeup I2C0 bus.

Tag used
next-20250918

Boot logs
https://gist.github.com/paresh-bhagat12/11dee1b07be3019d5f92f893fa11229d

Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
Schematics - https://www.ti.com/lit/zip/sprcal5

TPS65224 Datasheet - https://www.ti.com/lit/ds/symlink/tps65222-q1.pdf

This also depends on this patch
https://lore.kernel.org/all/20250916090736.2299127-1-p-bhagat@ti.com/

Paresh Bhagat (2):
  arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
  arm64: dts: ti: k3-am62d2-evm: Enable PMIC

 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 93 +++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A98DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tQ7y/oRhmpaCvS57YBMEWO6n0J/gF6oJwiPo/K5Qvl0=; b=eyZLWOMBgkKCsXvOLeH+tPsw52
	KeL5rkmKflmORR0GSt7hH6bzkHtQdmXS2hksDnIwvF/MvOnfV/ZZku7HdMDZhw6r1pm1bbHQoT8r9
	45ncfr0n4t0Z7N+b/3cHlVcro0PqyE8zPYcM1mvaPOSyE5qsusYXn9IVtNNn3/YjQY9zBLzRnUg+Y
	NABjLP6Z73Hakg/SsPN5ScwAO1Cmh3uwXpa3dIiPFHS2w02pMjc22QO7EWwiLUkZQjEBEYRh+aRZh
	iItInb2YhX0Dv/1F8ztnk/qiZCc2p4umF03mEWNxIDx4fhSgIDeGOHRrBHik7m5WyK3JOcKhD4WOC
	5bnlC2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBF-0000000AhEr-0vPA;
	Tue, 03 Jun 2025 10:47:41 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMONT-0000000Acxu-2yEh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:56:17 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uBju489441;
	Tue, 3 Jun 2025 04:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944571;
	bh=tQ7y/oRhmpaCvS57YBMEWO6n0J/gF6oJwiPo/K5Qvl0=;
	h=From:To:CC:Subject:Date;
	b=n2CvllgCw3RVYtfEaG6CSFTkyCE8qVJeiQhA59nCLgTY0BllvNL6BzHoQY4EJCBay
	 KQpW3oV1s9v78mJoxRlA6sf3WiBTNxCz/aLX7oPfJUthXCJZ0Ekow/JY3fxCgvFnfn
	 tpFht+d2vyIf7icHkm+lvJ7Z6XvoFmwOst0i0bfI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uBXM3661737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:11 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:10 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539u9TS166451;
	Tue, 3 Jun 2025 04:56:10 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 0/4] "scm_conf" node cleanup for TI's Jacinto SoC family
Date: Tue, 3 Jun 2025 15:26:05 +0530
Message-ID: <20250603095609.33569-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_025615_794625_CA296271 
X-CRM114-Status: UNSURE (   8.46  )
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

Hello All,

Now that we have PCIE ctrl node in scm_conf[0], we can go ahead and
convert "scm_conf" from "syscon" to "simple-bus".

For J7200, J721E and J721S2, "scm_conf" node is converted from a "syscon"
to a "simple-bus".
For J784S4, it removes the unnecessary "reg" property from "scm_conf" node
which already has a "simple-bus" compatible.

[0]: https://lore.kernel.org/all/174500270525.95799.12263001003103973109.b4-ty@ti.com/

Jayesh Choudhary (4):
  arm64: dts: ti: k3-j721e-main: Make the "scm_conf" node a "simple-bus"
  arm64: dts: ti: k3-j7200-main: Make the "scm_conf" node a "simple-bus"
  arm64: dts: ti: k3-j721s2-main: Make the "scm_conf" node a
    "simple-bus"
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Remove "reg" from
    "scm_conf"

 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi                | 5 ++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                | 5 ++---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi               | 5 ++---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 1 -
 4 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.34.1



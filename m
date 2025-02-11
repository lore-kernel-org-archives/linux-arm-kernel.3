Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65569C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xgT68oBSvMvFIgoMW0HNCWc1N34sOE6MI7TSV3ERtwA=; b=PmZ5/VjLx84rbk9j8HrcNRpECW
	eSyhemHur2UL7tzS5W/iRoqGhmhr704cN/rO4BoxZWmSEbZF1uoo0VhE8lHx4a5jgHUxggWlahdPR
	VTzaS+nz99XY4uCX7f4q373tHVN97GrWIaNU5rpPC9JuuoYnFbVfKF+mRDlTvEawyqT/QOdrIzJak
	a08hzuCcEdFLN5Xq+1bXwdvet7bM2tNm28IAtoyY/LTIaWccoKrS6Ng4BIj4TdM243KoLnZ+Eypf9
	HL9yDkzyNDlckjqlFFEUcV3xem+T+FZBH8TDslb2xeFiRgxN/ilbRfp7n50htvxaGI39Dkg0brKcQ
	gKcEKVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thv0f-00000004qX5-3kXb;
	Tue, 11 Feb 2025 18:29:25 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thutD-00000004pOQ-0ddZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:21:44 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILbIl3651464
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 12:21:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739298097;
	bh=xgT68oBSvMvFIgoMW0HNCWc1N34sOE6MI7TSV3ERtwA=;
	h=From:To:CC:Subject:Date;
	b=inkb7GJ6Ed4GDxTP8Ag4QfYwbkweZ+f4Ct5u/P5PBh2k2BhgcCR01NUGKA1G1WRNF
	 arsKer/mjI/M4Rcu9HVsZPj6gZwhTfu1Vk6HW442gRYgPqI+yC9tLg4z+ujtM1IZGU
	 lizoLTNS0RL1ltHnZIIO3NpnZSL6Q8PGR2xOtdag=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILbr5065006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 12:21:37 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 12:21:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 12:21:36 -0600
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BILaZr022669;
	Tue, 11 Feb 2025 12:21:36 -0600
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <c-vankar@ti.com>
Subject: [PATCH v4 0/2] Add support for CPSW3G port 2 on AM62A7-SK
Date: Tue, 11 Feb 2025 23:51:32 +0530
Message-ID: <20250211182134.1500867-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_102143_234181_EC26DC77 
X-CRM114-Status: GOOD (  12.79  )
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

This series adds support for CPSW3G MAC port 2 with the SK-Ethernet-DC01
Add-On daughtercard. Also, the missing alias for CPSW3G MAC Port 1 is
added to the am62a7-sk board file in order to allow kernel to fetch MAC
address populated by U-Boot for CPSW3G MAC Port 1.

This series is based on linux-next tagged next-20250210.

Link to v3:
https://lore.kernel.org/r/20240429101739.2770090-1-c-vankar@ti.com/

Changes from v3 to v4:
- No changes, rebased the series on top of latest linux-next branch.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-am62a7-sk: Add alias for CPSW3G MAC port 1
  arm64: dts: ti: k3-am62a7: Add overlay for second CPSW3G Port

 arch/arm64/boot/dts/ti/Makefile               |  3 +
 .../dts/ti/k3-am62a7-sk-ethernet-dc01.dtso    | 62 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso

-- 
2.34.1



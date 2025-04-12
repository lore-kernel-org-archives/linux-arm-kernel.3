Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E01C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 05:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJ0vpXL7ornkZ5EcL9sGil4pVsPC0g6AKDydn7iBonk=; b=H3IWMuaRCOxIPUNXYeM0LXKavZ
	7OoWy6Egp9SrW6Hs5DJgIMiCb3p5Tn59ogoA30Tw7cqGQEhJFv1z5xhx6HW3FR1/n9iXacml3XXgN
	OopvoVP/HF/02vfF4hFnHzDdPfdgmHCtxe3p1CKKe9W7O1sIQ7KC8Fgh+qL/xrEUIXkmY1KvvFJMn
	2k3+Z7kSIxCNd/mCgKC+SPZJd0+2dXsCupeWzP6NUqwT5j42xfsaM8+IH66HYbfiGa60BeXFQPakv
	mSIEw5O1II/zG9WJpSDwFfvvS/rUXnqpEJAUKYavfdEBAeejiKkRjUZRNjqRsdVQsmULIhblYXMyE
	PMm4fQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TST-0000000FTmv-0qKh;
	Sat, 12 Apr 2025 05:31:13 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TOp-0000000FTBH-23tQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 05:27:29 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RGQv1725198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 00:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744435637;
	bh=jJ0vpXL7ornkZ5EcL9sGil4pVsPC0g6AKDydn7iBonk=;
	h=From:To:CC:Subject:Date;
	b=LFAtl8bJnN75kyK/Csle/+KfqR56+5bsXKVaKH6mHzChivIVgVYWYkZZS9mW0g/Zy
	 JNIs4FWN6Vvhh4F3Tcq7g6tVuwngFMdbIsvCC1LU2+yRh3woZeoFjZDRzUoG7NupP2
	 LgLoE6edl+6oOANgzrkPjt0ZkusQlEWfM9uaGaBI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RGr3107948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 00:27:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 00:27:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 00:27:16 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53C5RCVR121011;
	Sat, 12 Apr 2025 00:27:13 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Date: Sat, 12 Apr 2025 10:57:10 +0530
Message-ID: <20250412052712.927626-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_222727_573436_619B7927 
X-CRM114-Status: GOOD (  10.25  )
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

This series is based on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
Based on the discussion in the above series which disabled 'serdes_wiz0'
and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
'serdes1' in the SoC file anymore, since that is not a working
configuration - serdes_wizX enabled and serdesX disabled doesn't work.

Hence, this series aims to cleanup the serdesX nodes after the changes
made by the above series.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
  arm64: dts: ti: k3-j722s-evm: drop redundant status within
    serdes0/serdes1

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
 2 files changed, 6 deletions(-)

-- 
2.34.1



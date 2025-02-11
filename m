Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD026C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11ujGAdknT5EZ9kcrIEqNxDuA+j09BZBOevt1FTfUtM=; b=S0SNXmgsvS0y806s12fKUT/9FK
	govoFN/e7chnHsFZe8twv+AH2SMVJS9kJZn9UulCx0QiD2zx+OxVbU4B/GhVXfS8zMUjFEPBabDNj
	7KJYiQjUXvIJ6OZUVTX/jbduaIfzZs1uw+u3Njt3TPsA/5yMx8Rv/XQCLNdpk2eeVudtfdEznaQSA
	FdzHtzf0Nku3I4L+YJOFaSUxqyq01UHOuC00/0TUzkj0ygMX1leeegN6WcVKtti2/C0xi8Xuopf+G
	w1DgJXMEAi2/4bhYCfn2MGaes4OpC89s2hho/BxKRcG49ig+4yAkEqFloNPVRN8IoSANoM1Ka0ZSL
	zjvt2uHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thw7w-0000000541B-1goY;
	Tue, 11 Feb 2025 19:41:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thutL-00000004pQ9-1epR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 18:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=11ujGAdknT5EZ9kcrIEqNxDuA+j09BZBOevt1FTfUtM=; b=ACyZsPf869glhGR7Kh0jcfDtjw
	4De/PsVNG8J7inY7wdCpk1H8cOabCjZEXDa19RRwYAjlD80XCmcXefLJhLVsBokk2Vp1RcFw/5VJb
	x86flEq3amltdXW9m5nazgdt4O4BtWAgygkeANZuJuRL1zum4z1ASxFnffm4SXRQbT0nAVKfzG33d
	2G6EuivXhxeURk/AtPTaQz53thLmylRYmCuXDrKLnNv7+LbWDhhoqdyW2Iz0tvMsCl/qklM2I0WCh
	407cSdELfo9v8rrxM8sNc1JGDwawOihQMs1Z4VTR8I8ARaUlRH0Mo7cE98BjtmKPqyQrcCQSm7aLZ
	P4V7h8yA==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thutI-00000000ft4-1QKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:21:50 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILcDH3745175
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 12:21:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739298098;
	bh=11ujGAdknT5EZ9kcrIEqNxDuA+j09BZBOevt1FTfUtM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WpWGcaaWCOsPDw9vP7gVdKWIXvKCPHGqsa+YTSe2TD/c9wMGhfBAAZWLn2S/bDT6j
	 3LBlK314DspfA420CskVNffnwrKmRJt3t88/o+FD/yG8XFNHjj6lEqBwMR2kGLYUZN
	 Xp6ncDlzIdFpfnrrLxhcKCAApPoHJKZAnULouLAg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILcPB065022
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 12:21:38 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 12:21:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 12:21:38 -0600
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BILb0X122960;
	Tue, 11 Feb 2025 12:21:37 -0600
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
        <srk@ti.com>, <c-vankar@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>
Subject: [PATCH v4 1/2] arm64: dts: ti: k3-am62a7-sk: Add alias for CPSW3G MAC port 1
Date: Tue, 11 Feb 2025 23:51:33 +0530
Message-ID: <20250211182134.1500867-2-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211182134.1500867-1-c-vankar@ti.com>
References: <20250211182134.1500867-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_182148_586451_4E1E1922 
X-CRM114-Status: UNSURE (   9.32  )
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

From: Siddharth Vadapalli <s-vadapalli@ti.com>

Add alias for CPSW3G MAC port 1 to enable kernel to fetch MAC Address
directly from U-Boot.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
Reviewed-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Link to v3:
https://lore.kernel.org/r/20240429101739.2770090-2-c-vankar@ti.com/

Changes from v3 to v4:
- No changes.

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8..9ef727f2c444 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -22,6 +22,7 @@ aliases {
 		serial3 = &main_uart1;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;
+		ethernet0 = &cpsw_port1;
 	};
 
 	chosen {
-- 
2.34.1



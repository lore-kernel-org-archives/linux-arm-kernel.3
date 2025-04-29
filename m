Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2E9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/oAT1IFU3YAYM+Sfb6c7hDr8u++kl5pA5rhqc1pFFIE=; b=VqDsjExetN6W3kAtOvKRs9JV4t
	ARxXTuoqEjlcGOJaoCC4svzITu82ooN5Ni3IxS/UVJywqhnH1LjpjY30tdAkE08IJOGsmNCC8VZyh
	mE31nIUPUj3dKC9C0AAO0MyqAa+x2WhBpJso9WJqE2q3Jjd/AtTPdR36Ee4svnwZ3f8nl3lcwCNWB
	54549XV2ikUhJn8fHIMV5cfNO1qUDYhGFy1raGUklvkk3jCrav+hSkdzDTKrUqcMtsgkjd32b1OVp
	7FVU/xAaRcTA3yjFyTAgj0RQ2X2rohDn6XDmId57Coh4u/0FJT7D627inSbP4Rp8MGSQebLrI4fpr
	4S+Xt1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mWH-0000000A3Wk-3dGy;
	Tue, 29 Apr 2025 15:05:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9m5e-00000009yv3-22lA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 14:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/oAT1IFU3YAYM+Sfb6c7hDr8u++kl5pA5rhqc1pFFIE=; b=gVCWN1Dtk+LWVbdpOTwGgXOYeQ
	YYSXJiXHv0NbOnysNaHKcKs8HhVwoPBGY8mFontlv+IDTakDMcmoMN8aj7KvjcvtxhmSwgyKqoB1J
	c2Csk5dAaU7lyjls3l+8DZsnw6931IiD/JdadywUIXw849i6pTaz5uqhcuS5rssR3WZ/YJB8upIpY
	dlSnc/cPwYR31sOxI9O7mb3T1zz5+tP4jN1Mgu7xIWqiIytdzsxEV6cVPUTfvbXgquwqU4yOcapbm
	Ygz9/w83uwNXwDkbMRS6/+lO4wxOJfn9kmX9JneJ5NNnf0GHjgQvVXzfKa93rLRpLwA0UZ0ctAGLd
	daqnQQdw==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9m5b-0000000DOe3-0ben
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:37:41 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEbU4Z3868279
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 09:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745937451;
	bh=/oAT1IFU3YAYM+Sfb6c7hDr8u++kl5pA5rhqc1pFFIE=;
	h=From:To:CC:Subject:Date;
	b=W3zu+TTUccmtuWgLZfr2vm3p3jODNuVjr3aJTC1jHLDLljFR0rNdXYgl1wUyb13Uj
	 OGY5hIX4Zb2xcEnmgvnEqGY46FG3V58aklsKasrMl1ZwqP1G/m4RsazvMgNVkMXYMw
	 iZU8fPaZ1md89Bl0zDV06Mbv7+AY8xWPOb9fe9kE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TEbUo7010200
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 09:37:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:37:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:37:30 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TEbU2T106904;
	Tue, 29 Apr 2025 09:37:30 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
Date: Tue, 29 Apr 2025 09:37:30 -0500
Message-ID: <20250429143730.4145747-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_153739_407318_C01C04B9 
X-CRM114-Status: UNSURE (   9.88  )
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

For am65x, add missing ITAPDLYSEL values for Default Speed and High
Speed SDR modes to sdhci0 node according to the device datasheet [0].

Fixes: eac99d38f861 ("arm64: dts: ti: k3-am654-main: Update otap-del-sel values")
[0] https://www.ti.com/lit/gpn/am6548
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
This patch was split from "Misc MMC udates" patch series [1] to help
with backporting.
[1] https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 6d3c467d7038..b085e7361116 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -449,6 +449,8 @@ sdhci0: mmc@4f80000 {
 		ti,otap-del-sel-mmc-hs = <0x0>;
 		ti,otap-del-sel-ddr52 = <0x5>;
 		ti,otap-del-sel-hs200 = <0x5>;
+		ti,itap-del-sel-legacy = <0xa>;
+		ti,itap-del-sel-mmc-hs = <0x1>;
 		ti,itap-del-sel-ddr52 = <0x0>;
 		dma-coherent;
 		status = "disabled";

base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F35C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7MtmT+Gezjz1wxCtW6De99Byqza5f1VY1qmH2ZVItQ=; b=AfQQnJxMGxLI29eYHyU2wZ3uyC
	Yk7oaSSkzKtfIkeBSHmOt/7oETBUs7D1+Wd9Lluno/MkAy8Iw4dd13j/Op6WgiTYheL0jdpQQNwZw
	bLHbJNzr/5Gx2UXpnRmcPRDbLSjJylqKoRBWIrQU6xVHmZiWN0auqbmCacQstwzkL+HM1anQ+5FYt
	Y6fftIXkIU2M7b3xBUXcPgsjkY6k67Dq9/HYCt+sUN8GBmwjyQcUIfwDpm54D3oenhoWJXdGF+tqw
	i6FZ/unUrUnSC/bdy3mO37pD44yCzK2Li8iUl3Hb+Xcos1cEQM20RtW8/EVknoqJxDFxZ2HRMU/O8
	G9YTTvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Jat-000000004is-3YsF;
	Sun, 20 Sep 2026 15:36:43 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Jam-000000004eT-3bZT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 15:36:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6HDf6pj87s+ThyFStsLnb5yRQPPGl1agGcMVcmeDBDEFWVISwxI5xXFtybLI3bkbjoETUtPf1ca+nIntEiCUGxviPRfGeddPQZ8tnbGCVitNh9GgWAuaqPiOjy+I8e9MZGS51uDz0Ah+XVBwXHcrMDbgCUcuX2OwbpESw6lrTrNg2+gI+KZbpgL7zwnEmK0dL5wAdSMvkPqnOwhlLHnpsk3Gt9BNCZJaGNrJEPwRR5EHChwtOj/Mb4b81talWqH28Fp+vNtMpGCISUoO2WrjmlinksQ0L06ZGGjOmQGfxhkpWuZLJtDczIZuPSfX0YALnOFqxB+YFHiSmLsVTLVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7MtmT+Gezjz1wxCtW6De99Byqza5f1VY1qmH2ZVItQ=;
 b=xq7G7fWfPBDqfte4ZkaWiLtV0ti+2vIdzbO1RfURsm/HVN0QfYkIaqRxbWnJUfdI/+ycYClZ2YGv9lkveiwaEjpqSmhsXIsuIOShPMSmSOJe7DIU+dGn8j88zwhPTkFH8UozWVeYOtXudeGkdjR5hkI06rLSjwUug3b/58VJKm/0ELeecZibE+BHFHRvJo2rXsEbVseiHVoAIfh0xL+8nZgwWEpDgBQIl9tcZtZvs6FinzVBwTa4Jny19QAf79FIDRGAJIdUObIZwPn5Gf/YDlloXplruY2RUtaCxUvmEKfVVDMcDCcWOW//rVHrNDLb8LcuLgq+kX/OOO8/s3/Q/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7MtmT+Gezjz1wxCtW6De99Byqza5f1VY1qmH2ZVItQ=;
 b=KMG/7eOPLnlJuY1xRizWheuI5z0XZTG7aPzCoX2g7jxM+tP4cDl1Zq1abc4KTmrw4D5fgpILKzZbi72xoyCdWWUMQp91hx/pjgYYzwLew7lbIKomNjiwi7Wu7LtlJvrvCz4URWe+WiE/UUU6LF45Gz0gBHbmqogAZqJBkjO8Pao=
Received: from OS7PR01CA0226.jpnprd01.prod.outlook.com (2603:1096:604:25d::12)
 by TY3PR01MB12054.jpnprd01.prod.outlook.com (2603:1096:400:3da::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Sun, 20 Sep
 2026 15:36:19 +0000
Received: from OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25d:cafe::e) by OS7PR01CA0226.outlook.office365.com
 (2603:1096:604:25d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Sun,
 20 Sep 2026 15:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D210.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Sun, 20 Sep 2026 15:36:17 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.22])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 913A030000BB;
	Mon, 21 Sep 2026 00:36:11 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v5 4/5] net: stmmac: Do not advertise S-VLAN stripping when it is disabled
Date: Sun, 20 Sep 2026 15:35:15 +0000
Message-ID: <20260920153516.103461-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
References: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D210:EE_|TY3PR01MB12054:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 88119cb5-ad4f-46c6-fac2-08df172ce967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|7416014|376014|10067099003|11063799006|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info: 4tOcVXT5GNfIoicoRWMknya1yeknQL8ZxwiN79dYfoW8pbwky7qhFvrZ/okes8ti+PsvAjHa75S2/dKbiXiFSCyAbjA9r9jz2ArCHqsEbg0buUDYRo/r9jlX7p86a1i2kDr79OnezorqzOxynKQTAw84GaX64jOkFJWQwwWs9txCVrMBCW5gSojUFGZrrMDiGe0skwUR58Nsj8vx7lI51wtUgPfCkqGVV5cqFBTj1qkaeDw3nfVE5HZ96WZ8rgiL6PuH0GtbChVfQljIhrU/s0AryIzTlYjvUE7GL/DeEl+O39/AMH+8tTmoVINB6Yhr0nG5tVtMfzyaq7k6Gyfe5DpY1EkRAhifruH+5rEFdbOzYNr0fgAUDBKbuL63ctNygoJ6yJEszBrfLlTwn2iJNlS4A59mubuIu6WMcaHq8VT3nnLgQJwGqFrMXPy02/vfvhsrNQhHEfwT0Giu752KJ53fQEqGbrFx+9mGy1ZSawFkicDuSxI/KDacKUSwMaUe+vSwGj+OHdEimWMER6TZKE38TfSc++pMoFcp8uB5sY+tfhP7+H0/ZMwzo8sGpu/Ksw0elEziPxfPId+A6deQkBAH9bT25n1AY3YnHRz+r/0Vokm28XZzjegpECjFDY6/LSeMcW3kNgvj7ByPDV6b72hEGx8D5t8oyYsbgqx9rxxz5WoVOi162QgaN0EdrRXXPYjDU6Cp4UP/RXw7L3dJp4eqcYAImS2zcTUFelaFST3x4aXuBfQtqgVGNYEgU0Ob
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7MHGb3i2KSQBG8R4H/EmK1+opZ9n4jhhahQViHDIhtn+AmuUyiz0F38H8eD/xNtqA9NZ2RyKV2McKheX9Qi6d1znSoZ5Nx1Mh5lwhHc0FGYbY48wcGQrwUHee2S/lOjVgFTyr/d42rwe/eV8a4ye+KfoKQNe8DZ9K8OPcqUfHjVRDraVuVCxKGNMRdONrkPxivdXhh1mkxtRhMMs447j5XRGaydpa8VRml43HFjlW8Y/JJTIQU9UV18m9MuX+AlZXqfaTiif0vljc2N5iTC8h3JZSi6+3Jfncc/tm0yKzUBrWGidRaayAvvv6HKfjB4Y6JaALh/DhPiWyUr0xWd7zyWzBi+IGLwA16sNHs0sdvtTzRVjKGBz2T4+t7M4cowaPUJrIoMLAPCip4K0aXev6OYxGSka1UDRVb80ywSoLgvLTQix7Ly25fJNXvZKGTD8
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 15:36:17.1169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88119cb5-ad4f-46c6-fac2-08df172ce967
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_083636_904997_0911BA96 
X-CRM114-Status: GOOD (  10.06  )
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

C-VLAN and S-VLAN tag stripping are both controlled by the EVLS bit,
so disabling rx-vlan-offload also disables S-VLAN tag stripping.
However, rx-vlan-stag-hw-parse keeps being advertised as enabled:

root@rzv2h-evk:~# ethtool -K end1 rx-vlan-offload off
root@rzv2h-evk:~# ethtool -k end1 | grep -i vlan
rx-vlan-offload: off
tx-vlan-offload: off [fixed]
rx-vlan-filter: on [fixed]
vlan-challenged: off [fixed]
tx-vlan-stag-hw-insert: off [fixed]
rx-vlan-stag-hw-parse: on [fixed]
rx-vlan-stag-filter: on [fixed]

Fix this inconsistency by making NETIF_F_HW_VLAN_STAG_RX follow
NETIF_F_HW_VLAN_CTAG_RX.

Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v5 changes:
- Rebased on top of the rename patch: used dwmac_is_xmac() instead of
  the dropped hw_svlan_en flag.

v4 changes:
- New patch.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 77a8bcf5bf14..c06eed76e3d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6208,6 +6208,13 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
 		features &= ~NETIF_F_CSUM_MASK;
 
+	if (dwmac_is_xmac(priv->plat->core_type)) {
+		if (features & NETIF_F_HW_VLAN_CTAG_RX)
+			features |= NETIF_F_HW_VLAN_STAG_RX;
+		else
+			features &= ~NETIF_F_HW_VLAN_STAG_RX;
+	}
+
 	return features;
 }
 
-- 
2.34.1



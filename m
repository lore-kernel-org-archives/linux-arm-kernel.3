Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52194CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 02:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z424UI6T+8WdxFLTGOWbS0UMehSg4rWkssCnQRTYZOY=; b=U/z7BEa6tGWLz/Q7cqwiYFM8dy
	x4kSVy7LgblIyq5zVPMfN+7++aIYVxZwdZp1uh6fYEPNKZ7ZggKvzVdi8AuW59UE/vY1q1I4QKNx/
	4Nv7cDghwYDLd4qWE4R0o2xl4bteXAfq5SPSkVm9Z+A2d0d1nhl2olpLpU+ThJnyDHkB2vUlaswE+
	8ulhykI4AqwoLX03gm5JSM7VmtOTGXNVqC3qgYEyXXDkwndgNRHA7dPngKqrvKgrL977IzSrhWF6H
	5aHesd/0lb45QGi+fXbyLIBZ4H+P/apdw8RGpWzVtS42Y0at3eKpK7Wy3Fg0hEF1LuYS+xt0CZSoj
	g5O1o7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUuJ-00000008Ypf-3Edf;
	Thu, 11 Jun 2026 02:12:35 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUuH-00000008Yn6-04Vl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 02:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYoOUFgVBWOd6ceq+w0HryUujNcqce28XQ0lLM0eX4d6HE6EiCEQQxuI3iDYxjFRg/7KavYiRdQUOaeGP23pKTana3NtXzm7yUtL/z870Lfv4IuyU/hndkDetsV5v7mH0qqdQU98BjrTlWFaClbuO+j15EXeFGvZ65ORx5GhpaiUfObskfDTODT6SoHTIfVdf17k1Xv96tEJ7+puLYueC1GL3oge6WWfNFC3Bl3ziThDcQAd9CGs4J3dvAMU5TplPNENclJks/3KcOhp+2Uwd+uhNbnD2nUR18ktVEwOTik0FMFp9XjU/izT6lYM78GqOfDjkUFp08FZ9kHPhaAqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z424UI6T+8WdxFLTGOWbS0UMehSg4rWkssCnQRTYZOY=;
 b=ZtbtHMbcAyz3LUQ5zF19tRL5sBLW43x5CaWzTulb3dILhY6l4r9FF2T22+e2cS7oBtHb6Y6iLPZADsX+jRgo/f8/PbZT0ddcXHVbWhswvtHkorjSvc2duQeN92MuZEESncLi5zY2SeFc3JqJsMU2woauztYnRTKk6ZRuovGOyXWn6i0h62BJ+UtCUF38vqkwZPMJyRCIJTVpHUo1DYusAEKRu7kFuaT8M+mLHXl6U4oZlJwwNWsI1CIdmXgaVSE0WnueO/9qPb/M1WiarC96+nJeGR9+ETdCu4kQ/jOgFc0+vLERJpGgdQfLrS0Ud2wncJymqGhFkHg9o0QmMfbN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z424UI6T+8WdxFLTGOWbS0UMehSg4rWkssCnQRTYZOY=;
 b=nLIlB5j09EACjHXrteTkve0lRB+UhA8B26J/LW6wLJAZErZdS/S44AWz6FsQlkSH6u8dcuOCih8Qmo3qjJ1PAp1YPMhh8ibE/G0WuT/RF2xGxYBc49AqAhC3ql3Kjxq0C0u1C1sv+O64hkSFJetvn0v909HYzhUU9L0SDhhsES5nwrf020OLnPK9HgEDhf0PhpYmwJF5l3jJrPmcO78HbNV3hE/NEY13OfTDYCXTZL8Gdl8kpIJqzl6JbeInfm5xrW74P55OV8a4aDOUWwvL1owRMyWmYWqISJ4sNPmyZmwchHmdhWUyWhWzMcNIrVVkkPXUyannVlXr6I0fgTe/bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by GV1PR04MB10824.eurprd04.prod.outlook.com (2603:10a6:150:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 02:12:28 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 02:12:28 +0000
From: wei.fang@oss.nxp.com
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	chleroy@kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	linux@armlinux.org.uk
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 6/9] net: enetc: add helpers to set/clear table bitmap
Date: Thu, 11 Jun 2026 10:14:55 +0800
Message-Id: <20260611021458.2629145-7-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611021458.2629145-1-wei.fang@oss.nxp.com>
References: <20260611021458.2629145-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|GV1PR04MB10824:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ffcbed-2a24-4a50-e396-08dec75ee343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|19092799006|6133799003|22082099003|18002099003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 2lqEVK33WPsU9xfoL3Y1DtzTIP1IQo2CYEIKPCk/9gADJcw92oKAJbJc++CBhP9XDOLaW2WyQes6k3VXCMZZiMXtFb7ClUXTH8jTnQ2AQVg8F1QxslQW3/Jt2PWacVNP1pTsgKp4//4ShZSqAiBTFuLBdJ0mPEDfVuWN5Kb6TqvPCXeneQhcyd4IbmL287zIbByUg0cgVXhY70UsoJt6fRfldbPUaNOPJB9G/NVFI/BjfwYABta4edGrGRPxRGIzbkBDHYm4Fx8u9wM7VD9mR6SRpMZJwEykk0zJF5OV+iCu1Hpj4qVKJpk2VrEzb149dXFON1yMKaD5B+cRUMaL/QopwUxdxP7+IL/Xk4v8mXL7B9P/02Fcy2UQMNW67pmJ8AM7zlC5q+5kdOQxkIkse1OlTcjhdJV3WRRdVzp1jfE3MGotcyXlre1eufghVcD/zbakgUpR+cPT50iFa7enXTLw3rCX1Fmxx7poKEXZqJNhFFS0lGC0BHyjoSxhNJeAugdsV9nJTRQCYHp11CeLyB59cwRk3CZ1zIz9gkpmHQQxIYy/XCH8wwZmZwMtt0lZuO7Lg7BsJd6o12AGsEIt6yuBoAYYnjhHogkDmr5/Q0SdJl73z8CP8bt/Kk8KCJhw1dJYAZADgZAKrVvI0ZU5viW7fUvfYCYsewgjZzSCmSf1li6YRiN2k1ixKozxHIgUljy09h/A94IzkIqMOxQYBGdst66RssooQDEikKtY2ZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(19092799006)(6133799003)(22082099003)(18002099003)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P2hhRCdkFyioCASON0L/SGVBaqXoAucwStM+/AfzRPYuVDUYx4S9vw1mY71y?=
 =?us-ascii?Q?F+uSIOyJ2YRdsZFi72w5H3xaemY6kVewdyZeKeRjPnr95JhnrG+KAKhLY+mB?=
 =?us-ascii?Q?Tbneqs7kO/1xOesN/56Bssgh68AcJhrpAYNo2JCD3fHuwROc6w8ZBzVZYY6f?=
 =?us-ascii?Q?P/OVo7IS4Kk3lvGF/N8ylz7Dr25axNDbsTUZCy5lX1ueCcFdXhjOjVOTHYkF?=
 =?us-ascii?Q?QHhyXHKHWIuiTrwtV4WLz3nTNPz1V54RydDPg2PrVfnIWeFpSd0q03uMwJ6R?=
 =?us-ascii?Q?YeumqmAIXznL+jTOmZ4SWTneqgbBdYetcr2BPQ46b8WtAh+Cs5C4Edvo/NFx?=
 =?us-ascii?Q?Zq3kdEACmnAtLYMp+WGoaZFNpxXzT4ugJLF8PEMoRZqM+Uc/469TU/VH/LiK?=
 =?us-ascii?Q?o4VHM33Kl3F5jXMtWDQQD3qOAbvK72l/mbbReDqlOe5uevnmqM2vId+2IcRS?=
 =?us-ascii?Q?5lP1eMv1Z/Zz18luQhPVEYen3+lgXoJnpzU9mZClohB1m3lNJXWSJqfoS5Ne?=
 =?us-ascii?Q?9CEpz7S0EH6nQgcXN2CwjLkikAONAQ2tfJi4/DwtcnDvKGcCfGvcTzMm/QQM?=
 =?us-ascii?Q?M+lkWVq9g20CsJizTVKRRee10hfg0FfUBVNzhYDM12CBcy8FTpWxI7To2S3w?=
 =?us-ascii?Q?DtSWt3gbgwTLpPJjMlwZc2nBIhOld1EwdVQeM2FrW3dKqijECzC5OpPtwY60?=
 =?us-ascii?Q?F9sl+AdoL1TQl1aRc1CmOQpjEPk0y7+GFFa3OtZVEMN/qtyoIjuZ2JJDBLUn?=
 =?us-ascii?Q?fj28LOjEOd9IUnwenT/SIfLNQc/N4ljmt4Ti3KqxaoY5tgsFyOpMCvusmMRn?=
 =?us-ascii?Q?uCzTlviW/wYBFZOVfu3M2EAh4sIMWxyrnZ0VueXynfu+iVFrBYWXhyXhSsre?=
 =?us-ascii?Q?exKGTZE/RJKVssDruWkkL13ooK9V9bRj3JzZfpi1b6Zl9+uzxhfPZruKSJpC?=
 =?us-ascii?Q?6YR/PyuxtO2Mzr8FoNT91Ka88BZcvAbl193Wunpy8bIMMfVwMz6n0LXnRaWU?=
 =?us-ascii?Q?CmR1jRjf89YTZtrPW/HW+66MmplnMpwfoQgvddx+Q74pPCZgL1JV5CnhKspW?=
 =?us-ascii?Q?pUEiXxfg6FiMEU3NW6sWXUyCPURiIfgo5njDwMzE0Odws4sZN1ObJe+GD48X?=
 =?us-ascii?Q?USINZDllofp8NmCgWQHsas4fk9nmYyyclmy/Imu31Dndu8znzSI+iedo3eye?=
 =?us-ascii?Q?zbkK7JHdTfxdPcz5HvG0dYX28IWV/6t1oj8Pt5iqfWmQJ4fCuSniMMrSRzWB?=
 =?us-ascii?Q?cJY77U+pWIhKeE1biub5ZnwO4ONynTxCJUFLGx5Rukf/c34Sj2FkBwWnaB9D?=
 =?us-ascii?Q?hmdRrCV3VIEXC8cmoJKcIx9vgLbtAoUtVJl4CTIwClgdNudj4TSI+LnWXzfR?=
 =?us-ascii?Q?YdwLZWgNZ4Lml3fqcgULVVVb44oEFGQqBHTnGZvMxpqM7M0IGJPkHf8sSlUH?=
 =?us-ascii?Q?xrdc8bL4r12Isudq6LX7HUcuVcTjFLt5VVJ1GjL/FNxETJ3ij5o/hgpgX3Im?=
 =?us-ascii?Q?ZNuynoNsnX6PE5qXYAXZae4JT0aP4Asi/YyaSN92b/JhdV+hwj7A0WbsMhYa?=
 =?us-ascii?Q?GnMjJecwusl83O2TRDmTZcxo1sylaAQpmMMdoQQ6kyMaaEqjV/1oDR2ozr74?=
 =?us-ascii?Q?IDVcc9Fj6vp5v1fdV1eCSvqcGi18zoWPAJ0RgzcqserJp3xiv1ParmToULdI?=
 =?us-ascii?Q?n3xWScxla0v10xuBlmiUkzIw9BCKREqayigFCvedUKLMm+/4qfKiSG8hD05h?=
 =?us-ascii?Q?dC1+TCoeFQxQ+jYxiwAiwYMcIscRFjyYxZoTi+CKPtX+Za7L2iuS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ffcbed-2a24-4a50-e396-08dec75ee343
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 02:12:28.8058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjNAZVC412fZkRGP7fBacgS3EpgABzBV+IpETelYUPq2Ng6Olf9fWktb8jpmpY1tzaR5PEIGELIs3uSXf21sEKrlg/rcSevnaCE2iG97MLAMDT8e/tRSilR7birRILBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_191233_063091_6DE9E692 
X-CRM114-Status: GOOD (  13.68  )
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

From: Wei Fang <wei.fang@nxp.com>

NTMP index tables require software to allocate and manage entry IDs.
Add two bitmap helper functions to facilitate this management:

ntmp_lookup_free_eid(): finds the first zero bit in the given bitmap,
sets it to mark the entry as in-use, and returns the corresponding entry
ID. Returns NTMP_NULL_ENTRY_ID if no free entry is available.

ntmp_clear_eid_bitmap(): clears the bit associated with the given entry
ID in the bitmap to mark the entry as free. It is a no-op if the entry
ID is NTMP_NULL_ENTRY_ID.

Both functions are exported for use by other modules, such as the NETC
switch driver which needs to manage group index bitmaps for the Egress
Treatment Table (ETT) and Egress Count Table (ECT).

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/ntmp.c | 24 +++++++++++++++++++++
 include/linux/fsl/ntmp.h                    |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
index 601435966ed1..0d83f0c9dc6e 100644
--- a/drivers/net/ethernet/freescale/enetc/ntmp.c
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -47,6 +47,30 @@
 #define RSST_STSE_DATA_SIZE(n)		((n) * 8)
 #define RSST_CFGE_DATA_SIZE(n)		(n)
 
+u32 ntmp_lookup_free_eid(unsigned long *bitmap, u32 size)
+{
+	u32 entry_id;
+
+	entry_id = find_first_zero_bit(bitmap, size);
+	if (entry_id == size)
+		return NTMP_NULL_ENTRY_ID;
+
+	/* Set the bit once we found it */
+	__set_bit(entry_id, bitmap);
+
+	return entry_id;
+}
+EXPORT_SYMBOL_GPL(ntmp_lookup_free_eid);
+
+void ntmp_clear_eid_bitmap(unsigned long *bitmap, u32 entry_id)
+{
+	if (entry_id == NTMP_NULL_ENTRY_ID)
+		return;
+
+	__clear_bit(entry_id, bitmap);
+}
+EXPORT_SYMBOL_GPL(ntmp_clear_eid_bitmap);
+
 int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
 		   const struct netc_cbdr_regs *regs)
 {
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
index e8b1bd802f19..4d329488763d 100644
--- a/include/linux/fsl/ntmp.h
+++ b/include/linux/fsl/ntmp.h
@@ -266,6 +266,8 @@ struct bpt_cfge_data {
 int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
 		   const struct netc_cbdr_regs *regs);
 void ntmp_free_cbdr(struct netc_cbdr *cbdr);
+u32 ntmp_lookup_free_eid(unsigned long *bitmap, u32 size);
+void ntmp_clear_eid_bitmap(unsigned long *bitmap, u32 entry_id);
 
 /* NTMP APIs */
 int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
-- 
2.34.1



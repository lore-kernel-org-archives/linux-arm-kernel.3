Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F24C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndy1M80JaANBjlnQ9ECPJqHBVUfyaCj18ASrNq9KPrU=; b=iCahsQ0J2VfOKZUPcNRYoRFo6Z
	d5qJeYSph5Eg/jt4KgtDI91R8fbrWS/ZP7Tir+MPzWjySfGCUgsN3cnSiLKYMSMoZxyfxvxCdH+5D
	eLVWkeqUJMMJ2zrYsjGGyujCcg25v4Lh0NKJU1XuYTKTVagEH/jDGPTDt0S1xNLC5nN0fc/PSSKkV
	zgmdo8oW783C3fWSlpYIapWc96Za5T9iUIh50g7Uwmqv0e3kjX6UVGWa+ZqNtJAwNxchKNkeqfVug
	zd/fYdmNPSokHBqUA7u1b/ogn8b1RHwAtXxGR5JHXEKClDYsFaNASvd3XP04lPOSk+SjK0GL4N9Cx
	JFmnkt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mvi-000000061PS-3ddv;
	Mon, 28 Apr 2025 11:45:46 +0000
Received: from mail-vi1eur05on20616.outbound.protection.outlook.com ([2a01:111:f403:2613::616] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MTk-00000005upU-41UW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:16:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVnbjOpkkyDUDKD3oXBLR7M0L4LaYNch8CZjPKQ1eez/kgEIDPIzGpECJZfWUQAjuad7NV03ykXWmUDRc0vawJWOiPUj4zGNAqzi6U4otXm7+DCpmgr0jnYFHgXc862bZFY2+mNDocNZ8Bv042fL88SUuZMXjQ5hhl2yNHV6WsZPdsm9zVxJwH86FqqkVEtjmcz/ydB0TrI3UFbBXoFGq2cTnMwj6yvgY1YwzUUC67a1OpXToeWNhmxCtS8shn6e9grv9vTBFw7z6cwlxqKjv8yMKBsQx+FUVQVqrEG+4fwqY3bZVgBgiwTp5meqA0Uj53NoHbJ0E1ggwhPo3x6lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndy1M80JaANBjlnQ9ECPJqHBVUfyaCj18ASrNq9KPrU=;
 b=mdEnNiw7tdXIedkGyByQ+raLoGyI95dsRIG72Xdzd9Wc3tYuTiAPv0FEB8ZyUmtpKEm5NZNtcfbWBx1ZCHOXPkApyUSKCl1A3hejchKdiSMYIFIQazXMmSkqL6C0gZKwiBJTXzwS5UkhNK5yznfA7uHZ5bKbWqq8VLHa296vvQPTVLaSfrIs224b44EwIVDv71qlY2a2arqF+K07EQOJDCUtL7oWctQospV6UM/2YTTXngzsd7pyC10jM0T5CT3cDN6ER/WiAWTpNYGgTBOpOAjKdPSmgtq3ODv+Y2dV48/8ByVwmkkVIqFbu7luYr2JCsleQM6uvL92Ai140W4WYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndy1M80JaANBjlnQ9ECPJqHBVUfyaCj18ASrNq9KPrU=;
 b=E+3FmgKLOzOQ5cW/gPeL5/QIdhYr2okLQUUFDhr7t885+wzAIof4KEAOVX8mmYgDMgqGrk6Jx4acDXV/+qyBvejQ1MnFwdvGZpUaZgW7csfeN/MFv96AiWBW7n/Dhnh0r6Cx4ZsLHfu/KnbNbinCG0wu6gabjGzinWhlm+TsVcKyIuP+sxhpB1G1swk6btsx6+PV8VJ3TWrp1otvCkcjcoJzCUCq5cPybHUklqXIvu3Pa4EEjOJ+wAAEODAJwpstayApoRIGeUoFAp4D20vBMTbMLUFFHDM10nqbXE46NNpStdgMMoVCbyy9ono9t3kEN7Xz2WO+41Bb6QwA/fILcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:48 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:48 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 11/14] net: enetc: extract enetc_refresh_vlan_ht_filter()
Date: Mon, 28 Apr 2025 18:56:54 +0800
Message-Id: <20250428105657.3283130-12-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9315cf-164c-4418-76e8-08dd86462ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dXucG55ur6DEa/actM1oITBXn/NiGyzaZJQoVNbMHamHx1FFIqK8j/XGXklW?=
 =?us-ascii?Q?ko84VZ69E7qL30De0zmkFwZ1YhwuJJR1Mr1mGY2TPC+PnS+6XvkSZM9VapoK?=
 =?us-ascii?Q?ABJ47seG+R9f9tZvzzNmRBYiRL3u/IkVgCZcc57xL1Vvgu52K2MlrOXCk6II?=
 =?us-ascii?Q?FRgNQjmbEWrOhYslVp7eqTbyHsUSMOD+1q3Gwtjvpiye7uq+jVWgVijRmN4g?=
 =?us-ascii?Q?d1skjel6xKm8oqLcY2TC9O0kOnyI2Osftdn99kLijmittLU1WGOITPzaD8WE?=
 =?us-ascii?Q?X9vIxS8OoH3CC8Za49Uyjqu7yWDIwul00Y8KNIpA1kI7cjWMgs5pkB4aBZ+v?=
 =?us-ascii?Q?+pWjv8jIgLxtMWLBV5zHhk2RbFFOuVfohKYE7hU4rGyogvbgbUeBp6Rbctl8?=
 =?us-ascii?Q?EVZh3Ke0D8h0ot+972GyWB7ZYj5HGjP01nbLT8OL2TdvClKeHeMwThVZzJug?=
 =?us-ascii?Q?msJIRd2m8Pki7dfpv77EuDcCx16xsHk85CB098w5O1Cn1iJMsV1LxqaRSzd1?=
 =?us-ascii?Q?LGIH+btHn2d6hvU/tewAt024jaKKIzzQDPxYnMwxrsiN2EpsZoZpMjGnJ7+r?=
 =?us-ascii?Q?JhoPa5jJbiXGIFoUcDF+rvZyF7EnJPVADSfHJgc126lMjwcDAZ8VrWxdwdlW?=
 =?us-ascii?Q?gKl6n7q3WLZZWnUHcc+gz9MWTlK/RNCY0sym4BJTdWhZz3+5IqGcBPgIjgWG?=
 =?us-ascii?Q?W5rTrpWJ3dB0VB1t8xY0M7t+VvyTTaMPTQkVAIGuO9QrH4b1D63Rw/FAM5c0?=
 =?us-ascii?Q?MnhEAQfI92o2Yuv5T1paEBsUJXHmOTVoAneFIZEczz4Acl6x16w0VlDvuADK?=
 =?us-ascii?Q?8TPCv9b1Qsu2h3Hm4nzO4+GNmOEcGnQ8Hf2b73gjIV4NyfPQq2FIgTvmRuqa?=
 =?us-ascii?Q?bCUFV8a3rERkDW2uWdwcqKSkvGXD+7gzcc6Wk5Jo5mXRd30F/8mjn9NweMGr?=
 =?us-ascii?Q?rh81s7yUsai4HiwVEpqwcAI4ga/nYFGoswtcTfJh2yj8sUJ3zOqDmY8HU0B2?=
 =?us-ascii?Q?lbOTlVVIds89zLdHyWupJImVJ8HgSGDtUXrufc+HQwZGC7sYbFMSifLTQ+xx?=
 =?us-ascii?Q?bkSjNiaTulRJGmXMrwjXW9oK6zZGplJ5rkYORFBkLlntw1Xe1XvbyJ0tTHUR?=
 =?us-ascii?Q?W6gmd7WATG210lX0Mb9p6ECReDWbUkwgqC4oN7Vkyb1oL+nrTqL30ukgB30L?=
 =?us-ascii?Q?Ony+6Ei0xDJsDyJ1iyN6jet7yR9zHabmjy2ygUgeC03I9pmQ7a0qxWU9ZKeI?=
 =?us-ascii?Q?jnYPTcN+/CS3/hQGV/v2NFZs9421ZcYP8Brskx7NGsJ7kCSd7V1sta83KoCx?=
 =?us-ascii?Q?fspZINR4n15niUJZVfaQ7SzfMC5zF9mDjdbxKBDdswKG/9Asi7/ZKl7ybBmp?=
 =?us-ascii?Q?50P1fiSRjSMOBSVgR6HM0IDVgIGneIhdx/f//S2b7uVCaaWz00vzB0WxNLoR?=
 =?us-ascii?Q?YpkQMOl5tZceRWBISHBTkem2C4RERSMTLETi8TSKYcwr19lXUSkc4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y26A4awWmY0a1bPMZBuOrWZ0XAjf48qbbnXjIcWy4Dh92MkVL8ibThvxBGqz?=
 =?us-ascii?Q?FYDCiJhZOesuwDt0eOl/w/LFm9Z+8oR6P29ajRqb9nYggi/s4pB2ThOMQht0?=
 =?us-ascii?Q?EBKHFBjtC7e04VOmCNHwv1dHaBzTy+x/rariocPmA8f3WcFubkbPnzrfnwAJ?=
 =?us-ascii?Q?nFleA9MCwNXWSuFYTLpQ0KVV/0wIA+3AeQqF1BxFR1t9P+Nkq2T9mYhpPyfw?=
 =?us-ascii?Q?Hq6EdIO9aAjAoikly0kqv1K1H3uqFaeII8o5eAsi9bhaTq7SqfhtVynLwhsg?=
 =?us-ascii?Q?tN5W0WhQcen9azj5euICRVA5Acc2DcjP2NuL86G9LH8df8/yqJtX1Ufc2GdI?=
 =?us-ascii?Q?Eak4n3tSGgSJeLNJbS5hEDP/f8Bq2pkewPSXI5aAFjfJq/m/lwSHHiZQzo4G?=
 =?us-ascii?Q?1AUUZZgnggTfiFTypp/GJhh6z4g5fLg5GZbr20mrb/+bp3P39CDj3IPlI2AD?=
 =?us-ascii?Q?A70vrZh0vzbZkgB0NOH/KOBniPgv32nGoaM/2vfNmu01RyM06ONHGheYfIz6?=
 =?us-ascii?Q?qe2wlTR5XAkunCZvNzguCFKTVdo2po/NhKV6/mcQgpko6sf0n9a6XPWC+PkU?=
 =?us-ascii?Q?/gebVHzteLnGnGRX2+cOamF2Ps6EWORXciWWVVwzcZBrZk+g08zr9w5sp9kQ?=
 =?us-ascii?Q?zbG+gkVAVshLy4miBV7yxl7RyYd/OhCQwsewUJjqsipnAOFGAZ/CCZMf5gKQ?=
 =?us-ascii?Q?1Pb3i0m22Zv2V0pHByJaPFdTr+pO3MTp6sfZ6f/al8KI2TDtzcMWEcy0c9bC?=
 =?us-ascii?Q?NjEwIafuvvdYpup0AoWKSVoZ3gS7/lVyBT3V18+1Mz9yJs6seSYR4e5B3cJ7?=
 =?us-ascii?Q?x7m3qEG2PsctBDTmY5F6Vcs2mj50UxfRgE4yJno4AMBCXWvrWuU9zM0xFf2t?=
 =?us-ascii?Q?PGdoDpil2bCH36tFwEu/Iy5DhOL9AteGI3VDkh0S2gvYTNEkT63nUwV2fE/D?=
 =?us-ascii?Q?o897H6H1LrycH6FxPYgUKDeY4Pa63dA29iD3FgQfbFh/nizC3nx+JCvS5Xyc?=
 =?us-ascii?Q?UJ7tcA3Ry4XoAyO4zkcw/DlHYrG+HM/D03H+m24BJRmcLQvqnS7qnR9gTpWf?=
 =?us-ascii?Q?u6ZWmXP+EJEhM3GR40F4L1r6tnQX3cqbfXR+5WQuTPF8bLcfzY3FCXj7DueC?=
 =?us-ascii?Q?pbvguqUEmYorhzUA5/Fs+gL6N8KMnkmEiKK3JVOvPf5xhfysAgIdHCypXrQn?=
 =?us-ascii?Q?Dh3RzHLct84fIVa3Ea1c0WC4xF0u2G42L3Ug1+lSOnCP5bAdSG8N4ap3qLTO?=
 =?us-ascii?Q?mJRS94vKYMR3OH8fM9rVNwY9bQ+0nHNLD1zRF+N/AnFudhFg6STc2rJ1eFzq?=
 =?us-ascii?Q?1oJQCMx9QydZVBX87OU/uIZ21gGcBfzk0rpyoqZYesV2zm9kh8jgm6H+s/Qd?=
 =?us-ascii?Q?lDsttH/JKP7I0p004aNRCqNexyMbFYrzP2rvhaJrfkbmBCEDr6uc9L07ldP/?=
 =?us-ascii?Q?Vt6FNuQnCoWISbaYO6Ls3Ql0zFFOfruEvfaJ8MFjJH2HiTX0ZpjK5NLzgtcA?=
 =?us-ascii?Q?PI86UWXyrsF9f32m3lXrhNl7vjcjSXNJLRq0WhlQ7dcOfjqV/fFr3NRXo9Ms?=
 =?us-ascii?Q?cgqdQ8tna8LGrTrEbPLQvd4Cpa3XyJmc1Mcx2xzT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9315cf-164c-4418-76e8-08dd86462ada
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:48.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vwny4PEinKIKWPjmpLct+kBHqRSvMC3msHQ0ajiRyqEg3WWH2tdf4xsH7vrMNysefPe4bEm56Pf5yqsKonY8Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_041652_999084_EA78880F 
X-CRM114-Status: GOOD (  11.83  )
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

Extract the common function enetc_refresh_vlan_ht_filter() from
enetc_sync_vlan_ht_filter() so that it can be reused by the ENETC
v4 PF and VF drivers in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5: New patch
v6: no changes
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 8f2616fd83d2..ae2dbd159ab4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -234,21 +234,16 @@ static int enetc_vid_hash_idx(unsigned int vid)
 	return res;
 }
 
-static void enetc_sync_vlan_ht_filter(struct enetc_pf *pf, bool rehash)
+static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
 {
 	int i;
 
-	if (rehash) {
-		bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
+		int hidx = enetc_vid_hash_idx(i);
 
-		for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
-			int hidx = enetc_vid_hash_idx(i);
-
-			__set_bit(hidx, pf->vlan_ht_filter);
-		}
+		__set_bit(hidx, pf->vlan_ht_filter);
 	}
-
-	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 }
 
 static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
@@ -261,7 +256,7 @@ static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 
 	idx = enetc_vid_hash_idx(vid);
 	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_sync_vlan_ht_filter(pf, false);
+		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
@@ -272,7 +267,8 @@ static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
 	struct enetc_pf *pf = enetc_si_priv(priv->si);
 
 	__clear_bit(vid, pf->active_vlans);
-	enetc_sync_vlan_ht_filter(pf, true);
+	enetc_refresh_vlan_ht_filter(pf);
+	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
-- 
2.34.1



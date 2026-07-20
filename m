Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F97C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laEqqxQLZLzYQtBU0n5VfXeJP8j3yGHfiXlzBZT6bmQ=; b=RTFZf7ljdTCzNk8Jd+KoP48JQs
	Jilp5IVEyAQD5oTTAgH8gVGeEue7eeRJP3Tqxusw/je6Rp5LZNlY+8W+f3AM5HK0F+99SwkE2ErUu
	KDgvOsOMFmxTHuRo3xTNr22aOiHJ3meSGuYK5e4mXs9IeeOHmC7Fpr51tNoIP3iD6IVcMkPa9ZBTd
	H0eoVqBq64iGL0ibuFKtF3QGjwJJOUTO19OkJwdTTBXsxEYeCploHyU1DJwWQZFdYGpEu8buAQc4H
	iC2BEQ7b2Do+YJy3tAIYRUouW4BGJ7pBNE4KlcP2EFOiZavzCgEJ5TzPf1XtqISbKhJWaxAVPG1/w
	uekw+kDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wldUW-00000005eJG-2HLO;
	Mon, 20 Jul 2026 02:12:24 +0000
Received: from mail-northeuropeazon11010004.outbound.protection.outlook.com ([52.101.84.4] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wldUT-00000005eGw-2cK4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 02:12:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5vSP8czwzskJfUO8fzuywKKrgPVQdWiumHqO0z9aVEPWx1Vnm2GDjnztAhVgbeQqpLoZLctytf7Lq7aS9KJ6NMJGgpR+K/p9inq5v/e6mhYRctLAwihe+GekyZKAziq7kieQJAfnu1s+nFgYYPXNfHZA4Hm1q80JrS3dgJ2l51PvzhKVSAKvSuq/E0/JVwssV56kfE2cJUdq7CB8Gcwdx/H8i1b3SW+TmO8XCcjNugwOOIOxbd6Bv1NkgVveZNIrfqWhNHG4dekD5oVCLxtSnighvUXT62EFkaPzt6q82oyNUUdBOeAgAcGj7EThAsGWmJ4ZEe0oAgkliTghcPNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laEqqxQLZLzYQtBU0n5VfXeJP8j3yGHfiXlzBZT6bmQ=;
 b=dTaPLWGC4jBB4xbz9Tzr5dVt2X+lZaZBUgBwvyj8abCgemSjJS1TYIXOx3MOLB844U/gzSfLp37avcyTO5XHy6Opmaru1u/Bh4UUzq3mrRnK8MZ9GFt2CS0NWVgcsPwzKWLfdP6CB53QHWOUotJZapvwyVd0lHXgY2rOU6otj04PI1mBkxHz1ITdlSyfR4I01c69CySPFntjiAqKW43OnCE5kRmqJhuH3t1smx84OqaDFyi1+lsqNJHGbGgu8vEWU3n4ZERxz8KF43RxxH+ESYE8wpfZN/WMXUcbwE8fgb8NYlqbl1Mt5ns9GDz4gvYHaMEk/GJF44L6/GjnqzICZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laEqqxQLZLzYQtBU0n5VfXeJP8j3yGHfiXlzBZT6bmQ=;
 b=d/6zbaCY7qQrALl/LOURERZFDcFwejwj6fsrP02kzHdGHpLu1lq24w7XO+j8CoA3RyFHgjs6PKeATdJBCyMdrUzdT9j1YGoY4bmEp32YNB6+tsTnA6aSkNxmlJEc6xgbUTtMUKXPSmfDjOEQ3P834JOmFIBe1WeoQrzxzY81qGK6DDdqcsIzqmEkMK3pDknR+9GQHpoI8B6jP5oQK5KK4032juv+3Eu971qMPEbdjPBrf8WVlPhBMZJAiuciKfAd3dSP6C1s3vcgCMxUI8iV0IJBm8mwDBYOXH0BHG3j2bjI0Zr09u7fL0LiET+b0zRnkhI6r/qTA5hx1dspuhs3MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by DB9PR04MB11580.eurprd04.prod.outlook.com (2603:10a6:10:608::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 02:12:17 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 02:12:17 +0000
From: wei.fang@oss.nxp.com
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	wei.fang@nxp.com,
	chleroy@kernel.org,
	maxime.chevallier@bootlin.com
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND v4 net-next 04/14] net: enetc: improve MAFT entry management with bitmap tracking
Date: Mon, 20 Jul 2026 09:43:06 +0800
Message-Id: <20260720014317.1059359-5-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::14) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|DB9PR04MB11580:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bb1dc3-4c22-457b-8102-08dee60452a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|6133799003|10067099003|11063799006|56012099006|921020|20052099010|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TjzKhtk9BQVlFcVXvmxTxL9//EdmXCK5io0jPCDYNjEzPm+3zUHs0C33eBiGq+1TET7ToGKsuA8GZVQXWxLS+BKS8rEI+QJeQV1s9GUV3cyGTSaQXnISLqSdcOHTgs2NMVMUeQGnnPK1uUpwk73hMsJXO3scDi71NcmJH1S/KAXgC2Zj0EQgu+9+uDl/rbQvRcKgpHd8hzcVMvId+bB2YszAt/TN6jpzeSouFRU/dOWKYt18y3TFg1k7SyWRJ3ouYdtLSL0hC/UpGGMxiXy6X2GzkA9QdJw0ofpf3HNs618wrRb4lngAq6Vuaq4Kdl2sGDVJay2CPiXJOW9RPM/xRnxnS/TZPTaNn8uNdDDlppBAtBgKPUq5KmaLe0x5IA4ePhO0qiIQcQDS00OPxwteyO61HCRARO21FQO9q6Mw1P5fgojmcfsG9O4t1HpPwKN1gtq3w9WxxAMKijL7YRCPBqmf5qfdBO+ZQ3R6RRcGmzp+Q8STrNTRTFUrocmoXAz5AdBnctCp9JVQbfQVp8FrFBONig6T+Zbad6dNC2HHb4K+Rm7r9yUoPgOEFKKp7i9VTGawTjIWWrPq0u0fZUCrP1KZGI5yLUVgLzr1NRqEVtukw3pdYrnPmT31mASWKt1T8iNz6xKsbhfVrA5yL+6dweqbEdLDK5jsZj6wuuBxAUPwY4A+8fs7zRvavNcu3UJNOxO/U853o/gi0yfBFna8ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(6133799003)(10067099003)(11063799006)(56012099006)(921020)(20052099010)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ok+Yusai5DCRcGNKeTxj2ksrPzSU9fpnPQHVDUYHgEejnlvLEi8Bq8PfTMLP?=
 =?us-ascii?Q?kahLCu4upKFPaBTF2E5IeCIl/uSE4Dn2MKENhGEc+5d40OoeF2l4hU6A5xuj?=
 =?us-ascii?Q?hp6PTNm36TYMBsTxp0E3c7H50nuEGi4hjq36zilZ/F8U8eDhuvux7n4NyLTx?=
 =?us-ascii?Q?nt95SxZ/LqLguuWA+u8X52ngyTXKgN56OXWjWuX744I0gPor9gLVoI5Q/Cuk?=
 =?us-ascii?Q?nLvDeacL4+dPvDSqkNU466NeA7UwwxuT9rg0+7eMh5l7dqIcOw6QJNFPPml8?=
 =?us-ascii?Q?bwJi3AP/EjNhm4PBh5Jl3rtxnBX3ECFm2FNo/M2rdx+w6hWl64SGpQzOb87a?=
 =?us-ascii?Q?7ZJdEIQE4CuFIStBc6yyETLATDQaOev4EgVDQZrPpNgLYKzbEvqR7UcuDbAz?=
 =?us-ascii?Q?NILG126mWWwnxQbaeGVu0EBpizDYs1qEmQOb8bB8wCmji5rxWtIXmCMQSxmp?=
 =?us-ascii?Q?nTpHrLvFptMcZbEGY61EVylFmiPF/GPs8XdvQbP1xhF4yYDyd1lnTfEG4SIQ?=
 =?us-ascii?Q?RcTDkivTWUoHh4h7Naq8pfZWmAHjFTaep3JCpaol19bcYbufwA5JyztPJMnf?=
 =?us-ascii?Q?WjaDacAy4ufDPgAQlMDJkfhsPIQwT5MjnLHR4m0Q37X7TBLRKt2qRig1rGgi?=
 =?us-ascii?Q?AnLRR5lrn66kWgXzc/l6i8rsGIqvd6d/xTTZtrQgyqHrCub1Epgk90FIuAXJ?=
 =?us-ascii?Q?CSjVT1PyfuTAH0mwLFhP4Vgq8iXiZxHCEJc90xcWTGhYoKSCfEJFj3tygC7l?=
 =?us-ascii?Q?NXyVe7SwgEzlP4F4nlmnQHZGLpcpJU/fTbD8CUUS0IZXt6jdclTJg752wrJy?=
 =?us-ascii?Q?v176Gjr1b5mLyUO5PWwn3lwwSBaTfusRZ07pPVolp1GWLWJYd0MbCHfOBHtl?=
 =?us-ascii?Q?XEOUA6rcF1NrBOoFyuBlHbIu3/ylW8tKBrw+E34Q+6xpbZjLwIR2Yyjq1bmW?=
 =?us-ascii?Q?m91AZ6Yo5eAsTP7AEUCp+VsRDU0Y3UsgWRqhHlxxj3MOe4aJpVE33yt9M9wd?=
 =?us-ascii?Q?N3EQ434Qtss6UmM8Y222OUQHNwJy+xyLPiBApzoJmLv9U3tAl2mRHvanjXzP?=
 =?us-ascii?Q?dueR2CavUBoVRu58/0RwcyF2uncEYxGnQmt/yp2Cy1ZqpL/ZEbcMJ8WNdw2O?=
 =?us-ascii?Q?7SuDVMK7YSn4ePVV56HD7Cj6icBH8yPyBdxOOZIivwWqnOYe26eax0xnVdbL?=
 =?us-ascii?Q?KilCCNORL30QiZAiCB55BV5QZGuthn4XioAhJvSftbfF9yHto/pOFokG9s79?=
 =?us-ascii?Q?XQcZb1Gg3pZkaL46LAs9hs1sOIslxl/sX8yE7ah7PywyT8WCoKvpRVlCvTrb?=
 =?us-ascii?Q?u/9suUI12VHC8ikgtzMsfCW786OyUL7c8905iJAv8KCGV+TPR8h5tAJqTdEa?=
 =?us-ascii?Q?g4kBrUowz1mpgqyespOnB/dqlZYlMr60zUrPrgLsDKOUpDRi4v0Q6jqLP+cM?=
 =?us-ascii?Q?TPUw1u/5gvHLvpnjBDL9dGkn55rTh9BCLsQj/bi6QZ5oDP3nUxfFeaXSf3H4?=
 =?us-ascii?Q?BPnScQfavDWYqszLnHAj8rWEPGdXcT5XBw6B41SxfmQZlwq3/qeQNbHk+9Hf?=
 =?us-ascii?Q?8HVHcvRv8CMsGFSMLJe9o0PaT5Y0oAA2K7BdY5lksHDMLjwmrRCArdZ4dMUD?=
 =?us-ascii?Q?mkfJFBUIxBCiR/iwP4fwxu1VvpxVhmQ6Q788oWDQJmOF6rwoW3+XyFc4Ehui?=
 =?us-ascii?Q?sBTZWZvfl2LKNLcxT44DMPfR/q0Zmk1g+PvbCWukbtlvchR4CoOBhjnCguEX?=
 =?us-ascii?Q?Sr8vjk8llPSn+bpgR4cWojLQQ6v8WIvSLy7wvBAikT/AhQVTUE1c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bb1dc3-4c22-457b-8102-08dee60452a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 02:12:17.5732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12B4O0rAhZbRGGDjfLFZMoaVaTmb6jYKh3OW0nqBtIzWA1MDD+ZSkgM1bAGKcOYldIXmq0egPIfrqZV9NxUUOOCbpWpsKvucLGNnefa4cIETRC+6iWngYzY8+IDN0bSr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_191221_815751_92A9C0F6 
X-CRM114-Status: GOOD (  19.11  )
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

Replace the counter-based MAFT entry tracking (num_mfe/mac_filter_num)
with a bitmap (maft_eid_bitmap) stored in struct ntmp_user, which is a
more appropriate place for NTMP resource management.

The bitmap approach brings two improvements. First, the entry deletion
in enetc4_pf_clear_maft_entries() now checks the return value of
ntmp_maft_delete_entry() and only clears the corresponding bit on
success, keeping hardware and software state in sync. Previously, the
counter was reset unconditionally regardless of whether the hardware
deletion actually succeeded.

Second, entry allocation in enetc4_pf_add_maft_entries() uses
ntmp_lookup_free_eid() to find available IDs dynamically, with an
upfront capacity check via bitmap_weight() to avoid partial failures.

The MAFT entry count is moved into ntmp_user.maft_num_entries and
initialized once during enetc4_init_ntmp_user(). Helper functions
enetc4_ntmp_bitmap_init() and enetc4_ntmp_bitmap_free() manage the
bitmap lifetime. The debugfs show function is updated accordingly to
iterate over set bits under rtnl_lock().

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../ethernet/freescale/enetc/enetc4_debugfs.c | 30 ++++--
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 97 ++++++++++++++-----
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  3 -
 include/linux/fsl/ntmp.h                      |  2 +
 4 files changed, 96 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
index 1b1591dce73d..4a769d9e5679 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
@@ -31,9 +31,11 @@ static int enetc_mac_filter_show(struct seq_file *s, void *data)
 	struct enetc_si *si = s->private;
 	struct enetc_hw *hw = &si->hw;
 	struct maft_entry_data maft;
+	struct ntmp_user *user;
 	struct enetc_pf *pf;
-	int i, err, num_si;
-	u32 val;
+	u32 val, entry_id;
+	int i, num_si;
+	int err = 0;
 
 	pf = enetc_si_priv(si);
 	num_si = pf->caps.num_vsi + 1;
@@ -50,22 +52,30 @@ static int enetc_mac_filter_show(struct seq_file *s, void *data)
 	for (i = 0; i < num_si; i++)
 		enetc_show_si_mac_hash_filter(s, i);
 
-	if (!pf->num_mfe)
-		return 0;
+	user = &si->ntmp_user;
+	rtnl_lock();
+
+	if (bitmap_empty(user->maft_eid_bitmap, user->maft_num_entries))
+		goto unlock_rtnl;
 
 	/* MAC address filter table */
 	seq_puts(s, "MAC address filter table\n");
-	for (i = 0; i < pf->num_mfe; i++) {
+	for_each_set_bit(entry_id, user->maft_eid_bitmap,
+			 user->maft_num_entries) {
 		memset(&maft, 0, sizeof(maft));
-		err = ntmp_maft_query_entry(&si->ntmp_user, i, &maft);
+		err = ntmp_maft_query_entry(user, entry_id, &maft);
 		if (err)
-			return err;
+			goto unlock_rtnl;
 
-		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n", i,
-			   maft.keye.mac_addr, le16_to_cpu(maft.cfge.si_bitmap));
+		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n",
+			   entry_id, maft.keye.mac_addr,
+			   le16_to_cpu(maft.cfge.si_bitmap));
 	}
 
-	return 0;
+unlock_rtnl:
+	rtnl_unlock();
+
+	return err;
 }
 DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index a02b01753ff2..b966637572a7 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -32,9 +32,6 @@ static void enetc4_get_port_caps(struct enetc_pf *pf)
 
 	val = enetc_port_rd(hw, ENETC4_PMCAPR);
 	pf->caps.half_duplex = (val & PMCAPR_HD) ? 1 : 0;
-
-	val = enetc_port_rd(hw, ENETC4_PSIMAFCAPR);
-	pf->caps.mac_filter_num = val & PSIMAFCAPR_NUM_MAC_AFTE;
 }
 
 static void enetc4_get_psi_hw_features(struct enetc_si *si)
@@ -92,31 +89,45 @@ static void enetc4_pf_set_loopback(struct net_device *ndev, bool en)
 
 static void enetc4_pf_clear_maft_entries(struct enetc_pf *pf)
 {
-	int i;
+	struct ntmp_user *user = &pf->si->ntmp_user;
+	u32 entry_id;
 
-	for (i = 0; i < pf->num_mfe; i++)
-		ntmp_maft_delete_entry(&pf->si->ntmp_user, i);
-
-	pf->num_mfe = 0;
+	for_each_set_bit(entry_id, user->maft_eid_bitmap,
+			 user->maft_num_entries) {
+		if (!ntmp_maft_delete_entry(user, entry_id))
+			ntmp_clear_eid_bitmap(user->maft_eid_bitmap, entry_id);
+	}
 }
 
 static int enetc4_pf_add_maft_entries(struct enetc_pf *pf,
 				      struct netdev_hw_addr_list *uc)
 {
+	struct ntmp_user *user = &pf->si->ntmp_user;
+	int mac_cnt = netdev_hw_addr_list_count(uc);
 	struct maft_entry_data maft = {};
 	struct netdev_hw_addr *ha;
+	u32 available_entries;
 	u16 si_bit = BIT(0);
+	u32 entry_id;
 	int err;
 
+	available_entries = user->maft_num_entries -
+			    bitmap_weight(user->maft_eid_bitmap,
+					  user->maft_num_entries);
+
+	if (mac_cnt > available_entries)
+		return -ENOSPC;
+
 	maft.cfge.si_bitmap = cpu_to_le16(si_bit);
 	netdev_hw_addr_list_for_each(ha, uc) {
+		entry_id = ntmp_lookup_free_eid(user->maft_eid_bitmap,
+						user->maft_num_entries);
 		ether_addr_copy(maft.keye.mac_addr, ha->addr);
-		err = ntmp_maft_add_entry(&pf->si->ntmp_user, pf->num_mfe,
-					  &maft);
-		if (unlikely(err))
+		err = ntmp_maft_add_entry(user, entry_id, &maft);
+		if (unlikely(err)) {
+			ntmp_clear_eid_bitmap(user->maft_eid_bitmap, entry_id);
 			goto clear_maft_entries;
-
-		pf->num_mfe++;
+		}
 	}
 
 	return 0;
@@ -146,10 +157,10 @@ static void enetc4_pf_set_uc_hash_filter(struct enetc_pf *pf,
 static int enetc4_pf_set_uc_exact_filter(struct enetc_pf *pf,
 					 struct netdev_hw_addr_list *uc)
 {
-	int mac_cnt = netdev_hw_addr_list_count(uc);
 	struct enetc_si *si = pf->si;
+	int err;
 
-	if (!mac_cnt) {
+	if (netdev_hw_addr_list_empty(uc)) {
 		/* clear both MAC hash and exact filters */
 		enetc_set_si_uc_hash_filter(si, 0, 0);
 		enetc4_pf_clear_maft_entries(pf);
@@ -157,21 +168,19 @@ static int enetc4_pf_set_uc_exact_filter(struct enetc_pf *pf,
 		return 0;
 	}
 
-	if (mac_cnt > pf->caps.mac_filter_num)
-		return -ENOSPC;
-
-	/* Set temporary unicast hash filters in case of Rx loss when
+	/* Set temporary unicast hash filter in case of Rx loss when
 	 * updating MAC address filter table
 	 */
 	enetc4_pf_set_uc_hash_filter(pf, uc);
 	enetc4_pf_clear_maft_entries(pf);
 
-	if (!enetc4_pf_add_maft_entries(pf, uc)) {
+	err = enetc4_pf_add_maft_entries(pf, uc);
+	if (!err) {
 		enetc_reset_mac_addr_filter(&pf->mac_filter[UC]);
 		enetc_set_si_uc_hash_filter(si, 0, 0);
 	}
 
-	return 0;
+	return err;
 }
 
 static void enetc4_pf_set_mc_hash_filter(struct enetc_pf *pf,
@@ -393,18 +402,60 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc_set_default_rss_key(pf);
 }
 
+static void enetc4_get_ntmp_caps(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+	struct enetc_hw *hw = &si->hw;
+	u32 val;
+
+	val = enetc_port_rd(hw, ENETC4_PSIMAFCAPR);
+	user->maft_num_entries = FIELD_GET(PSIMAFCAPR_NUM_MAC_AFTE, val);
+}
+
+static int enetc4_ntmp_bitmap_init(struct ntmp_user *user)
+{
+	user->maft_eid_bitmap = bitmap_zalloc(user->maft_num_entries,
+					      GFP_KERNEL);
+	if (!user->maft_eid_bitmap)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void enetc4_ntmp_bitmap_free(struct ntmp_user *user)
+{
+	bitmap_free(user->maft_eid_bitmap);
+	user->maft_eid_bitmap = NULL;
+}
+
 static int enetc4_init_ntmp_user(struct enetc_si *si)
 {
 	struct ntmp_user *user = &si->ntmp_user;
+	int err;
 
 	/* For ENETC 4.1, all table versions are 0 */
 	memset(&user->tbl, 0, sizeof(user->tbl));
 
-	return enetc4_setup_cbdr(si);
+	err = enetc4_setup_cbdr(si);
+	if (err)
+		return err;
+
+	enetc4_get_ntmp_caps(si);
+	err = enetc4_ntmp_bitmap_init(user);
+	if (err)
+		goto teardown_cbdr;
+
+	return 0;
+
+teardown_cbdr:
+	enetc4_teardown_cbdr(si);
+
+	return err;
 }
 
 static void enetc4_free_ntmp_user(struct enetc_si *si)
 {
+	enetc4_ntmp_bitmap_free(&si->ntmp_user);
 	enetc4_teardown_cbdr(si);
 }
 
@@ -422,7 +473,7 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 
 	err = enetc4_init_ntmp_user(pf->si);
 	if (err) {
-		dev_err(dev, "Failed to init CBDR\n");
+		dev_err(dev, "Failed to init NTMP user\n");
 		return err;
 	}
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 285b7e5c48fd..6f15f9ea1664 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -22,7 +22,6 @@ struct enetc_port_caps {
 	int num_msix;
 	int num_rx_bdr;
 	int num_tx_bdr;
-	int mac_filter_num;
 };
 
 struct enetc_pf;
@@ -60,8 +59,6 @@ struct enetc_pf {
 
 	struct enetc_port_caps caps;
 	const struct enetc_pf_ops *ops;
-
-	int num_mfe;	/* number of mac address filter table entries */
 };
 
 #define phylink_to_enetc_pf(config) \
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
index d3b6c476b91a..764ef2892608 100644
--- a/include/linux/fsl/ntmp.h
+++ b/include/linux/fsl/ntmp.h
@@ -75,8 +75,10 @@ struct ntmp_user {
 	/* NTMP table bitmaps for resource management */
 	u32 ett_bitmap_size;
 	u32 ect_bitmap_size;
+	u16 maft_num_entries;
 	unsigned long *ett_gid_bitmap; /* only valid for switch */
 	unsigned long *ect_gid_bitmap; /* only valid for switch */
+	unsigned long *maft_eid_bitmap; /* only valid for ENETC */
 };
 
 struct maft_entry_data {
-- 
2.34.1



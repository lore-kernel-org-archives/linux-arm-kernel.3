Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F9ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 07:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4mhN9GlfinAr+0F4OvO7A1xCdiDzN5qz+PXyLlUHxY=; b=BehSK08C6cZewaYxpU27TsX66I
	azzZcpIV09/TkY3pt1tIDsLAKsaGdf0GjZwHPs+i/5c7NfysFMYgBEEJ0XOd+Mq+JVow2/Bl/3QnL
	/muyYAYrkJEIt0l90pWr3i8hlNgdrkkzVD00qPV4B6rm/O6A/fAoQVa2J6I8hEasKeUm33PSfwAQX
	c0BcMG9EeynXlqvatekoI3IsMOV/+bE+1q3Yx1umDRQd66vwVEMTWhnZYWucfgJvP1i0ZobzIX8pI
	rQOuc5pnHFP3/EmjutClFPjDTQTSVGI+4GidwwriX2gNCRgvuQJjubg0xq+7uTk9GBF+a3HTWKU4c
	UOAmIkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJQN-0000000CSc5-1ucX;
	Tue, 02 Jun 2026 07:20:31 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJQL-0000000CSaS-1Zx8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 07:20:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfi5AANxRgguoogMWByMGXTaWk9Yih9C9mvjtdAaxbqiBw7zopwfh7zrR9b+EB/7aeK2of2QqyziZwQZS13Unj2Xko7IlArfhAenWO9Mvz81V/1Xs+gmT1ZxJs3kHaw/yedAVrNt1Lb4f1ngdvk2OAn+EkLJoGtxoyyIYRZBV6GTUrioRdYJ848rAfX3oB73wcZnB2zykKTRknCFUzZogRpLCwi9G8X4bqtP2nLF2Ibm4hovwvpzNejCe8pw4haN1EJBhV5Y60PA67INzXss46XQUgmzS8cjzM7lN1+Ip/gs3G0g8rVKiVisyLSexcZAZYqdps1avMRTJXzcYHBh6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4mhN9GlfinAr+0F4OvO7A1xCdiDzN5qz+PXyLlUHxY=;
 b=ibx7o4yL5MtQ4FXB4oKt6NmUTni2tFRjBNBa1mYIv4BJ/kQOoGd+1e4Mot87eGtc919jDawtsQrEAKWNoggtztTc7CUPjwjAgK/kmcs9dQjBnHAWlVXgbmNP3FjRqri3EvgSePnRlLm1LLALtjISooJtLzsV5DOnwKZ7YkpIlc0ly+1TvDaPei+YLycLVw6JHno1GUd/ZesAeiN+kK8H8RXxt0j4JAxs9V3QYxx0UAhomFuzwyW8xKyD1gMG31dPblWkF0jBizGdYx3H4N+kmiw6W6TqfAhRYHI59PbWsE5z79nDYD18qLzLPFvu+44yBZT2cjQt6xY/JyDBxWEspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4mhN9GlfinAr+0F4OvO7A1xCdiDzN5qz+PXyLlUHxY=;
 b=thAKs5i8Or1/hGFAY8NfOpOZeUCedsVKhpG8WnDDAmtiWNLKZ/aoBwFB9gNSHe+6LC5hGrE45xnDaFWsK2l7aqPI/jDtNSivw6D5tEBGWcHi1JqQk4k+ZT+kejoTlz90K0cgeX+pjySitNZk0vH4jZ90D3DdTESBRDWN1UcNehgYp0BzJx40VDrQUHM84n7iyh1TOIPcT/ENM1BCGenpxa76Z2vclIGnUKnjeHWXliAS5GZbwU/VNmdTC8hXVBN2DW9gi0S+1ubdifLb2Q2o+RzsFShCT9Mjh4ua9TlttukvwBRSqP1Sy9Fka/+oLeYDJR7VYVcXLnPabD0/lqnMEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AM9PR04MB7684.eurprd04.prod.outlook.com (2603:10a6:20b:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 07:20:25 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 07:20:25 +0000
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
Subject: [PATCH v2 net-next 2/9] net: enetc: add "Update" and "Delete" operations to VLAN filter table
Date: Tue,  2 Jun 2026 15:23:06 +0800
Message-Id: <20260602072313.3162120-3-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602072313.3162120-1-wei.fang@oss.nxp.com>
References: <20260602072313.3162120-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AM9PR04MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: c33d8feb-1319-4aac-7721-08dec0776a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|19092799006|376014|921020|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r1/bNxPz92Y1UholDzxurRgnYTTXhK/YYOMo55oW0xMaDzDMjJIIC2xQ3xOCZtfPpZW2AsHUd+YPVDpQua1HzO7oWJs5JJpXn1EiIipjotwIaiJPkwql/7wlj9HFe+CNPnf/H/6eTJARuAyXCdXKWV0IQ1P65r/zw0tRYhn1oMgoYDbsdC7ZE7MzsvNpyyGhN8wlBz6AJZt6bGGq7U2BYRpZcHQXlsDyrdIoMGj1sUunhorm6MBrN+o/9B+v6iJZx4VoYuuDcdGKGlO4E3Hgtm6wSAkWLQv9pJFAFeZhkR4xYgSZ68zv/BMyoU7OzNc3XsFpwFJcEAjnK8CUMM4+VxpA556UsIiTiHWgsvQJunqgnLobiYGcPS6RdMV2dvlQg0qN164UKuakZgyHRBE+mTD3QDTWMfeVdUCNqsB08kNdCZGnOhmkrFt20Ix6Se9JNgNdwNMCF1frWxX9U8Dw08GXwvHlbdEtvVsPaQtY9yvbhRN3ATTRnhtkMHGRDDqBHsm9XbcQN6EEUmCW/pcdbEd9FZOfH6GPgQt/0MlyWnfA3T06/sc06f1Nai4hUjSHDpNRrC/FacGF2IbOrEOAilOaWQbapGIHQKHTfjdDrFuV8kNZOjcZKGCcVcuncE5+BO6inUIrY3fko5pREirT1Y+nv0CiYMaefis7wbn9vMpYE4hFBhXha4JLara5XY0N0aGLngdrRN6H8pI2pfWFPqmHBBbsAmqd8m6+OHHFbuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(19092799006)(376014)(921020)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wc84TqER8j0B/Cuzw+8EfwMHTcRK3T1y/jm7aFKxarGCPDSzMmNhRWMXk/sW?=
 =?us-ascii?Q?zF2HqnjjjCsAcuUX9tueCn+9JHDhEAvmPIT8zp/Gveoyfx3Mbjmt8ADhz9vt?=
 =?us-ascii?Q?WCMbg/XpPVbdAHH002h8Q0XMdpnmxleRkZ4hNpreUMns78XPFn81eWL1JYbc?=
 =?us-ascii?Q?nXuBSY15HkDk1oTPe1uZzG527HaUYyyjVLkFyovUcJxS6itWBpj6OAbcvrLu?=
 =?us-ascii?Q?0/SW6KGiiNwdnXEDrnaEwlFQ5qIBSImM/5EjftjYUNDT2sMEPF+T7Gwh5X5I?=
 =?us-ascii?Q?17wbxHxqdUrEbwwcFYBLtxGsuNTZYRvtlnxxEc3AdFyJdo8t+/hT6vjbtpJ+?=
 =?us-ascii?Q?yF2fmSeRjlAcV1GUBWviHtwADYqsaPryBmN5MPvdqxxlhQySTcRFl/wZDT65?=
 =?us-ascii?Q?npSRSirVoRiKLJrWMYb1w8dU+tqMVDPRB/otXhz6UK/ZDqc5yXMQUC59DA1i?=
 =?us-ascii?Q?Mo8nCJ0AxJ1ZPe7kkDvkqtUIBAhkxNVzt2Gzv451sXkky/If5xz89gDHIRhJ?=
 =?us-ascii?Q?oSj5mKuETjcC72m62ei6nss9Jr+XsvhALlbmoYV34LUEBrp4ytl9DssTXlb3?=
 =?us-ascii?Q?fl0gJdiVB+Ho4eMUB80Zk61qX2PbZ4eVknkg6BOzhEEs62JD7vwxVasIo0qb?=
 =?us-ascii?Q?gj/XAJUozjvrGMwZKhK96kPELqlmLlofLioyCAs37RUPOYfPQ0Xn8zJrPX04?=
 =?us-ascii?Q?JE0wFVQddU/6Tfp68dDNdj+4Gur+AYLNm0GsdumLNeqpDyeVnM0k6T2xWGr1?=
 =?us-ascii?Q?Q0cSUQIEqoESJtbEoVeO13AAeFlaOlCNm9NZzQHUe0ll4iHnO6Kcs1bPT0ke?=
 =?us-ascii?Q?pSZP7di2cPfBvS+Lz9IWk0rkpDXfbUJtU7heaSPxqvm4XL2Ev2ovQKaux73E?=
 =?us-ascii?Q?B/Ta28TnvpVdJQJvsHlepGVLqNOKI+3AqdMxfnY4Kj0Y9oRh/S0wFUlXzqcJ?=
 =?us-ascii?Q?rSp0zrCHbE/h1O/km1htktaLhPe5fYOwIeCE5PWrFqSjxb0nelmdrwppZrXr?=
 =?us-ascii?Q?nB7LsuZgodbdIswNrGPfTpf2BXViMCj8D6PAG4878tMRCg2NVWf5HUQd5nEI?=
 =?us-ascii?Q?yTziXpWOx+JpqkjnXgHAtuARihmejqDUnySav5lM4cwOJqEYK0nqEthRSdYu?=
 =?us-ascii?Q?yHu+XZlqM1TkKrq0KqDMyvKXcD3VZpvAyA7lnI7HI0JRj9rxcs9379chVdkv?=
 =?us-ascii?Q?Wl7efwTlVkn/aNmkWqhM52qGssf6wA+mX5h/WMRUqC8RIynBHp13jmvHMaVm?=
 =?us-ascii?Q?twqZQYzd2SB2RqxF2kw9q2gehvW7w7gHwFbHJPjOB3LUZ3ZQnxd6PFUstMnS?=
 =?us-ascii?Q?0y4olEA29IjF+to85y0nPXp1VNCYB30971+xqTOPsccpmpsAh8aT8Zx7FRPa?=
 =?us-ascii?Q?U/F6nY9dr/B4n7z4EcQPAoItmgX8Ar+xsPxl9iMwMVzFt6U8ki2eZFnG2Le5?=
 =?us-ascii?Q?/vVArbHBf7W7oNMfyXomLh/3egu2rn1hX3q/OQKjJO2tPuzZXvTC/UsKIh5P?=
 =?us-ascii?Q?amoPiTVX0B9RfSHI96Z4mb4qtZgguSkUsvF09GYpJjk/CzwhmbZhY6VfkpS9?=
 =?us-ascii?Q?bYpT2Pmf6kh3DEbpFAzlij7jIgzaKvZ1qq8rAr+Y6UPXy3FhAnCGjEDXEIm7?=
 =?us-ascii?Q?ximwsW/WGbViqmer6Xd9KA/52ivYEuQtx3MmGWzMLVb04nPT24/wVkxljssf?=
 =?us-ascii?Q?w+z6Pa9D0AMD+aDfX/PXNIma1xBgaJkZUq4Pwlsik0j1K5EYmmpmmeT2xG5J?=
 =?us-ascii?Q?AkclvncdLl8A90m6BdEvT3/rHNTQzVVjEJHUP7wVpKSbz7XPaqZ4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33d8feb-1319-4aac-7721-08dec0776a7d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:20:25.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukRwXuq52eLq3swhrbpVBzq2+UIfi/D7hVa1W+gi1g0q/lJJT4DAqrysLLZX8tVg7e96HLybTvmrzoJZA08vsNLYPxgnv0ycspQksrFyO7Idu0FNU2JxtmajcrSeSJao
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_002029_580483_8D62F70C 
X-CRM114-Status: GOOD (  17.22  )
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

Add two interfaces to manage entries in the VLAN filter table:

ntmp_vft_update_entry(): Update the configuration element data of the
specified VLAN filter entry based on the given VLAN ID. It uses the
exact key access method to locate the entry.

ntmp_vft_delete_entry(): Delete the VLAN filter entry corresponding to
the specified VLAN ID. It also uses the exact key access method to
identify the target entry.

In addition, introduce struct vft_req_qd to describe the request data
buffer format for Query and Delete actions of the VLAN filter table,
which contains a common request data header and a VLAN access key.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 103 ++++++++++++++++--
 .../ethernet/freescale/enetc/ntmp_private.h   |   6 +
 include/linux/fsl/ntmp.h                      |   3 +
 3 files changed, 105 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
index cb494ad02e3e..bcbbb012aec6 100644
--- a/drivers/net/ethernet/freescale/enetc/ntmp.c
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -956,15 +956,17 @@ int ntmp_fdbt_delete_port_dynamic_entries(struct ntmp_user *user, int port)
 EXPORT_SYMBOL_GPL(ntmp_fdbt_delete_port_dynamic_entries);
 
 /**
- * ntmp_vft_add_entry - add an entry into the VLAN filter table
+ * ntmp_vft_set_entry - add an entry into the VLAN filter table or update
+ * the configuration element data of the specified VLAN filter entry
  * @user: target ntmp_user struct
  * @vid: VLAN ID
+ * @cmd: command type, NTMP_CMD_ADD or NTMP_CMD_UPDATE
  * @cfge: configuration element data
  *
  * Return: 0 on success, otherwise a negative error code
  */
-int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
-		       const struct vft_cfge_data *cfge)
+static int ntmp_vft_set_entry(struct ntmp_user *user, u16 vid, int cmd,
+			      const struct vft_cfge_data *cfge)
 {
 	struct netc_swcbd swcbd;
 	struct vft_req_ua *req;
@@ -973,34 +975,121 @@ int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
 	u32 len;
 	int err;
 
+	if (cmd != NTMP_CMD_ADD && cmd != NTMP_CMD_UPDATE)
+		return -EINVAL;
+
 	swcbd.size = sizeof(*req);
 	err = ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
 	if (err)
 		return err;
 
 	/* Request data */
-	ntmp_fill_crd(&req->crd, user->tbl.vft_ver, 0,
-		      NTMP_GEN_UA_CFGEU);
+	ntmp_fill_crd(&req->crd, user->tbl.vft_ver, 0, NTMP_GEN_UA_CFGEU);
 	req->ak.exact.vid = cpu_to_le16(vid);
 	req->cfge = *cfge;
 
 	/* Request header */
 	len = NTMP_LEN(swcbd.size, NTMP_STATUS_RESP_LEN);
 	ntmp_fill_request_hdr(&cbd, swcbd.dma, len, NTMP_VFT_ID,
-			      NTMP_CMD_ADD, NTMP_AM_EXACT_KEY);
+			      cmd, NTMP_AM_EXACT_KEY);
 
 	ntmp_select_and_lock_cbdr(user, &cbdr);
 	err = netc_xmit_ntmp_cmd(cbdr, &cbd, &swcbd);
+	ntmp_unlock_cbdr(cbdr);
+
+	return err;
+}
+
+/**
+ * ntmp_vft_add_entry - add an entry into the VLAN filter table
+ * @user: target ntmp_user struct
+ * @vid: VLAN ID
+ * @cfge: configuration element data
+ *
+ * Return: 0 on success, otherwise a negative error code
+ */
+int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
+		       const struct vft_cfge_data *cfge)
+{
+	int err;
+
+	err = ntmp_vft_set_entry(user, vid, NTMP_CMD_ADD, cfge);
 	if (err)
 		dev_err(user->dev,
 			"Failed to add %s entry, vid: %u, err: %pe\n",
 			ntmp_table_name(NTMP_VFT_ID), vid, ERR_PTR(err));
 
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_vft_add_entry);
+
+/**
+ * ntmp_vft_update_entry - update the configuration element data of the
+ * specified VLAN filter entry
+ * @user: target ntmp_user struct
+ * @vid: VLAN ID
+ * @cfge: configuration element data
+ *
+ * Return: 0 on success, otherwise a negative error code
+ */
+int ntmp_vft_update_entry(struct ntmp_user *user, u16 vid,
+			  const struct vft_cfge_data *cfge)
+{
+	int err;
+
+	err = ntmp_vft_set_entry(user, vid, NTMP_CMD_UPDATE, cfge);
+	if (err)
+		dev_err(user->dev,
+			"Failed to update %s entry, vid: %u, err: %pe\n",
+			ntmp_table_name(NTMP_VFT_ID), vid, ERR_PTR(err));
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_vft_update_entry);
+
+/**
+ * ntmp_vft_delete_entry - delete the VLAN filter entry based on the
+ * specified VLAN ID
+ * @user: target ntmp_user struct
+ * @vid: VLAN ID
+ *
+ * Return: 0 on success, otherwise a negative error code
+ */
+int ntmp_vft_delete_entry(struct ntmp_user *user, u16 vid)
+{
+	struct netc_swcbd swcbd;
+	struct vft_req_qd *req;
+	struct netc_cbdr *cbdr;
+	union netc_cbd cbd;
+	u32 len;
+	int err;
+
+	swcbd.size = sizeof(*req);
+	err = ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
+	if (err)
+		return err;
+
+	/* Request data */
+	ntmp_fill_crd(&req->crd, user->tbl.vft_ver, 0, 0);
+	req->ak.exact.vid = cpu_to_le16(vid);
+
+	/* Request header */
+	len = NTMP_LEN(swcbd.size, NTMP_STATUS_RESP_LEN);
+	ntmp_fill_request_hdr(&cbd, swcbd.dma, len, NTMP_VFT_ID,
+			      NTMP_CMD_DELETE, NTMP_AM_EXACT_KEY);
+
+	ntmp_select_and_lock_cbdr(user, &cbdr);
+	err = netc_xmit_ntmp_cmd(cbdr, &cbd, &swcbd);
+	if (err)
+		dev_err(user->dev,
+			"Failed to delete %s entry, vid: %u, err: %pe\n",
+			ntmp_table_name(NTMP_VFT_ID), vid, ERR_PTR(err));
+
 	ntmp_unlock_cbdr(cbdr);
 
 	return err;
 }
-EXPORT_SYMBOL_GPL(ntmp_vft_add_entry);
+EXPORT_SYMBOL_GPL(ntmp_vft_delete_entry);
 
 int ntmp_bpt_update_entry(struct ntmp_user *user, u32 entry_id,
 			  const struct bpt_cfge_data *cfge)
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
index ad532b059ba8..9d30f128849a 100644
--- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
@@ -211,6 +211,12 @@ struct vft_req_ua {
 	struct vft_cfge_data cfge;
 };
 
+/* VLAN Filter Table Request Data Buffer Format of Query and Delete actions */
+struct vft_req_qd {
+	struct ntmp_cmn_req_data crd;
+	union vft_access_key ak;
+};
+
 /* Buffer Pool Table Request Data Buffer Format of Update action */
 struct bpt_req_update {
 	struct ntmp_req_by_eid rbe;
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
index 5db078e1caa0..36a9089526ad 100644
--- a/include/linux/fsl/ntmp.h
+++ b/include/linux/fsl/ntmp.h
@@ -268,6 +268,9 @@ int ntmp_fdbt_delete_ageing_entries(struct ntmp_user *user, u8 act_cnt);
 int ntmp_fdbt_delete_port_dynamic_entries(struct ntmp_user *user, int port);
 int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
 		       const struct vft_cfge_data *cfge);
+int ntmp_vft_update_entry(struct ntmp_user *user, u16 vid,
+			  const struct vft_cfge_data *cfge);
+int ntmp_vft_delete_entry(struct ntmp_user *user, u16 vid);
 int ntmp_bpt_update_entry(struct ntmp_user *user, u32 entry_id,
 			  const struct bpt_cfge_data *cfge);
 #else
-- 
2.34.1



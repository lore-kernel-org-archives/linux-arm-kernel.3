Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA4EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nXQWtdJywMXVkbh2aB87dhBcERoK1mqXu+msc6+kiMs=; b=RdgVkjntYfgqh6bDAQ8imZrvwk
	qm7cBDili9Im23sp032U+VzupvQW1a3diOJ/MZLOFeGc1j9iGyzfVoXjZ1kkTbS2e2l4hGxA7r99I
	4KEzc+ZvSS3EF/iugUSw2hOy6RI9q3y6pmna0XlrUe6Cqw2cGNhgF08Bp4A8iEFzwrwXLc5qLgnzx
	rpaWI+I+/lV5szxpnNNPac4xYMekeZ4H8C3VpF1DdkGPj7VtF8tpxnouYunCNsFY0P57Ne32g54IX
	3zXUnPLndnN7Yj3NzGYa/EB79LDOgNPhNod/ZysB6Gt4C6gOXXI1b5z8j3jqFarxJU89frm2SLl+T
	T1+8q+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty3YB-0000000ClPq-2it8;
	Fri, 28 Mar 2025 06:50:43 +0000
Received: from mail-vi1eur03on2061d.outbound.protection.outlook.com ([2a01:111:f403:260c::61d] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty3WS-0000000ClFo-11ST
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 06:48:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUDAiwXDeCop6SL2PdYmT2JzFdDIEDpYpBxhUgbnXcWEXltfAVihGzLJHmO1Lhy/I086uj7JGFR20EjGQf0aPDns/SxtKXKhiPv7FA51bsMt2hkQ71UthUO1/4KsfokEHiv0aNBvadmTri9zQZHFTK8TaabcJ7xM2X3AFAtk4hZqKMAsGUMFNAXIvLUKjeKP3Mk8+0tJOPXiSHA6kSjeFzqp0znGW+TLA8ZKS4I43lBqZ+7kNwFdpjFD1cj0XMlFqmLG1CVvKEhZ5GlE0vHP/aopsOTO8oO7k27byEbIByokfURpAK1k8O/Ku810NMy60zgOPBX0GOE7aE6v4n0vSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXQWtdJywMXVkbh2aB87dhBcERoK1mqXu+msc6+kiMs=;
 b=K3SzZOzbN2xEyjyRlcs+kzMcgmOdBh8CEjTB5ybqoT8VfyAa70NLRAM+6ZeORKxai5F3FCryZlOtWy+Pcs+B7h2xOPvBRGQiOsYxoJNh54KPTftpg70f8yAsZECphCJu81HnQbPwpg9HvdEStR4VeE+hFfglQhcYgwkBatj9drKx2f/tlqWFLowKmoryfKfnhFYGl+yhejLVlO23XMxs6T2CYqnuGAgV3bx4oGeuyELsEgKAUiLiYDpOge3C8JS/PuL1ZOne5rvEmobUU9raL6kxBXq4i+W+IzcafMnEZ+CfNwF4pSSHnoncZnyTr5cYcTWBSA4YFjmAqy51EszVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXQWtdJywMXVkbh2aB87dhBcERoK1mqXu+msc6+kiMs=;
 b=fYRQHx5j+8c4QukL1mIWjUq7zg383F0hoMlDEmZnzUmmZ8KDXsLjm2OwYOHSzkiXw1ffIn//faFQDPCaJl9GOIXbZHARxrhTIfk9tUgIWvPXjqfbjby3pEyyGYZMtonFCfnOkjyVROtglemYBKQWyoNM/+OecXXQNJs9t8zOzlKd6LQpoQS5X2puCcRMMOc9XfarVNhGQwawruUkbs7lkwExqBpLIfdsNhkifl7J1Tnuec2nVt32dnayh/cI8NbAV6ppi7viy47htlW2rRq3kdMbd11GLcWGzT+884fSsZjmoPZSJhQ1oBix3UaI7EuoNQV2nHyqstDa6UddtFi4mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 06:48:51 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:48:51 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] media: amphion: Reduce decoding latency for HEVC decoder
Date: Fri, 28 Mar 2025 14:48:16 +0800
Message-ID: <20250328064819.784-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d15761-7be5-4708-cde6-08dd6dc49934
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m7SeL93d7POj9/+pQo6LCKgIgTAI5LzNQqZu18Q6zU4H7+fAZ2Nejq9/ai6v?=
 =?us-ascii?Q?DKJbvnMB5C8ihY1JhPDsyJoxsg1HmDLUVKKXRNgOpdOpwhu+Y/GKNoUvETtT?=
 =?us-ascii?Q?v5lP2N8+n6Tnt6+aYrH0lw+UksQxFpTalxkXCs0flfkt/N2lXV3hwluOZ14f?=
 =?us-ascii?Q?fY7GJSlYIbmQHOgIs/kHxtUSUJCR81sBNtKW0pj1qFouSeIGLIp06/c0fzpq?=
 =?us-ascii?Q?VTBaDCTaNzqgBFzwyO9denwa1iApVOKr6fIeCej2MV7hJMl26Z+8q6EIAJVQ?=
 =?us-ascii?Q?12asbLbZ8Dt25Ol1/uI9fBrRUQt3FlG7v65Oa1sTRRkSfDAgC/TcWd1gp3v1?=
 =?us-ascii?Q?yKodr6iKsuceUY3x4sPg4bn/yd4ToqYbXwF8W4YyS8IdJKOBl+J9JPjaRTeM?=
 =?us-ascii?Q?Q2kGRxUMpwSfMRfquxMJgiZ6QgKEf4W1itQfsCtL6/LVGCNufw9uUmqIjRkd?=
 =?us-ascii?Q?X0dSAgg3mNLpzy9jiBBXKA7eUqHwcWZ5ngBCzH0qlfEMU4eDa+g4DNAqpi9p?=
 =?us-ascii?Q?kIyh2GGoaf7C8W0Mwbpt9raKtPg+KNJ5HjQqwOshynidHLkL8f72zXRJGr3Y?=
 =?us-ascii?Q?Ie4mWzWCyNVWrH95gQ0j7QLBrkaixiaDiwcm4sHZYAknmzeAkAuVrFadlEyO?=
 =?us-ascii?Q?27zeMjsXkUbiz5eA7cf37UJ2obVZfWR8R+ZKTb/VTvDfO/3qfmy1+xABz5th?=
 =?us-ascii?Q?Gw0UDrq2xfIojNFodTgISfwOrVfZK6QFcwVekx8k6JRS+5RBUd8kcfoZMmWx?=
 =?us-ascii?Q?n6p855IR3F2J+dtXtKrFoUM/WuRZyCGnM1+xpiu3WCUxtalvvWspeSM2higi?=
 =?us-ascii?Q?0M8zG8dJXAWdlbtuEepkZDb9AN4/A03zgUxiBZKDQAFbzG9ckbCswhHsP3H0?=
 =?us-ascii?Q?y5vVzGkwbGx0HZpVH2RrktoCYH+TVhggBcgQXL/DF7Ly/53zsY8E+XOskrkN?=
 =?us-ascii?Q?plP9MhsaEzerlEGkLzwbfcS7WXqE7OAoFiYi1SVOC0anp7jx/FOOmfur/XU9?=
 =?us-ascii?Q?x2rP6eDSFF44yDH0BgYf+OfFjS4VFGGr9aMerafLBBI7hytEfhDx+IWsf/d+?=
 =?us-ascii?Q?l1GjQBkNVOr0DyXeqHhymscUJ79z51imH2uz7kqrMHPWgVEwo+GQMZtlD55M?=
 =?us-ascii?Q?90kZzuchUobiBqBspyuAXZKxRRlWQFZlKv4tfb2iIjDWdFNNAyIxW+xdzotZ?=
 =?us-ascii?Q?0AJ/4hNBij3ABNpUvFLP14OvcXJ6X3mUOZOfXS4OtKWv3yPnvPM+5AsiTShH?=
 =?us-ascii?Q?2hZShcDMI0D4YnIh1w50Ad4jxKiFcGjA1pWwaghViYnQtBPnUkOChngr4Npb?=
 =?us-ascii?Q?7V5VJibiNPO3UVDj3QMEi63QZNBDL0+D+qhsVO35LZCXYy7dQ925TYjtVtbR?=
 =?us-ascii?Q?KRE18eXddG1u9VebI7zcicjGqmBJn/wA9kb6JX0NV8FS9Uxyz5A31XH9wIxj?=
 =?us-ascii?Q?cnjCWqYPx10St6V6pP8McLiV0nV54+8Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mJ2k0YfqMNaHsFuB7fLFFK0aL3r8KJ6LMl66VbksQdNBINxVQu6v2XIB3vAl?=
 =?us-ascii?Q?GXQnBy8jHBLq7arzXNRVwhanPSraARexN1OX5YMkPfz1lD3dpOd9M4b7OQkX?=
 =?us-ascii?Q?DoZ/NuSxD/9y1k8WLSzr45joWqSUDoTFzoNFdDJVj/+cKR95wEZgvwG06QC0?=
 =?us-ascii?Q?QvzIXMkMhMnzietRu/aadGoX+jc610ysGklK2bjfPF9OUy4WZcdtz/ZgYbbU?=
 =?us-ascii?Q?4012IiBceIx0n/uzq1Z3ixrp/5CPGLTExqsmqE3M0xYtJP5QYraDFVBvG09t?=
 =?us-ascii?Q?TzJeMoKT5nt+tX+IM5UDeUBjqiSxg+xLogZ2ioajaV/61bhdk1Uwxilnr2fw?=
 =?us-ascii?Q?k6knBV9Qm8hB7RVVzUwpdJYphgD8AndB25/g2topYb+IozPb9fN5gcsi1eFU?=
 =?us-ascii?Q?y6KrCVg2lsdm2BMYG5OQb0V5+lx5LPmHnR82jNq4ne3cTplg4WO/gyY0lMWX?=
 =?us-ascii?Q?W2ciJUfFOhxKzdN68yYPu114DVnbUm7oWFV8tTn/MS9GBLeNwg2yVx6CVWag?=
 =?us-ascii?Q?KVIgAyPORNhTHbPSjzW2G4J1MnP3aabwpwi/VjnabpK+pmgNifgH2/+nLauu?=
 =?us-ascii?Q?AZNqjpjA9kE/J7keSUJpIcjNvTC2MCmJcI1iAHNTDLjw2oS3Del0hDSSm+ON?=
 =?us-ascii?Q?EDE2SKcIFgRRYS8JuTI25SwN/X1nc4k/EJN8arKvBQT1g+Y+DteU0MMiVyXJ?=
 =?us-ascii?Q?Z/SV+OtNnbn8DvY0qyad9aTYLyoIQlSv/THNGvnOPHpGyvJVt/sxnn61EOPj?=
 =?us-ascii?Q?xe4DkiEewsgIA7hisrnlcscyob94qS4tFAFqDQyjRbkCgVeUxaeOFq/yjgLZ?=
 =?us-ascii?Q?3xLrd0Q4SFtqdyqp/gVd4twj5F1+pP0vURgrRgFpeo4vHmnAvZisWcZoxkxu?=
 =?us-ascii?Q?2IZzOP5gzqwgbQRowFUmo9V96tXzOLOipPlC1uZjx3xal1GlGa3Utd/cKkY7?=
 =?us-ascii?Q?2Y/HkHefPB/pDiFPTWuGGpH251b+3qWqtOpIuGX6k3ohApaMt4OL1X+dCjhk?=
 =?us-ascii?Q?4vVA9P3JyzwMhgkzVCkEXF1clOEC6YxqD4PglcDxNWlh6q6QdUOK35l6Q68R?=
 =?us-ascii?Q?+zmSCqrhuD9ucbpKY6SZvyw0gmnwCGqgq1I5Tjb0tnWkR/36Hoc8jhC0czvg?=
 =?us-ascii?Q?LI7L+DbttH7Pr7ghL8fTZ3zIKpM++Fqz0vSGeF5DYwqTdfIt7pJh6voWnobS?=
 =?us-ascii?Q?Vks/TjTqMDXUh1jT+1kEf+Foi5EMHSefdbgMMEukwy+GB6RGBpwRDrAdYbBM?=
 =?us-ascii?Q?QLJjD1nzHrd8ybBBbzSPMSNTx28jvb54hkamwLlU9pWnwPV9VoEa1yjeNzV8?=
 =?us-ascii?Q?3Q4muvwuVLXmqqEll5EYK7LNIY1Cyo/HmJNV13iwSejaOa7g9Sgu00ZHtBk0?=
 =?us-ascii?Q?uRe46f3k/zBnMy/pVIjyX+AYrgwsn079S2ULe6QQPmpc2gDZ1CrPf1WE/sIV?=
 =?us-ascii?Q?ICHhKKqjyfGXlJyYo0NEmseQg6nBbKkd7fPkwQ9CVYuaL/wg15mF0samF0w8?=
 =?us-ascii?Q?Akn1zorg00ePa30CISyq0BvSMoesqERkzwOGveZYnDGfJcBhFGP7bNFbRn65?=
 =?us-ascii?Q?cVoIe2JkW2wA71Sv8cLP9UAn/dGqV4fqKQSED595?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d15761-7be5-4708-cde6-08dd6dc49934
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:48:51.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNfu+dSxAnZTJ4QypkYFwrVZw7EofnF+jze6ca0a9PlfK1cuBTBPZQ7s6EqygHxlHTsp+Crm1t860yVOjmsD3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_234856_286071_17CEEFF3 
X-CRM114-Status: GOOD (  16.48  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

The amphion decoder firmware supports a low latency flush mode for the
HEVC format since v1.9.0. This feature, which is enabled when the
display delay is set to 0, can help to reduce the decoding latency by
appending some padding data to every frame.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v4
- Add CHECK_VERSION macro
v3
- Improve commit message as recommended
v2
- Improve commit message
- Add firmware version check

 drivers/media/platform/amphion/vpu_malone.c | 24 ++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 5c6b2a841b6f..88f8c16a451e 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -68,6 +68,12 @@
 
 #define MALONE_DEC_FMT_RV_MASK			BIT(21)
 
+#define MALONE_VERSION_MASK			0xFFFFF
+#define MALONE_VERSION(maj, min, inc)		\
+		((((maj) << 16) | ((min) << 16) | (inc)) & MALONE_VERSION_MASK)
+#define CHECK_VERSION(iface, maj, min)		\
+		(((iface)->fw_version & MALONE_VERSION_MASK) >= MALONE_VERSION(maj, min, 0))
+
 enum vpu_malone_stream_input_mode {
 	INVALID_MODE = 0,
 	FRAME_LVL,
@@ -332,6 +338,8 @@ struct vpu_dec_ctrl {
 	u32 buf_addr[VID_API_NUM_STREAMS];
 };
 
+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
+
 u32 vpu_malone_get_data_size(void)
 {
 	return sizeof(struct vpu_dec_ctrl);
@@ -654,9 +662,15 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
 		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
 	}
 
-	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
-	if (malone_format != MALONE_FMT_AVC)
+	if (params->display_delay_enable &&
+	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
+		hc->codec_param[instance].disp_imm = 1;
+	else
 		hc->codec_param[instance].disp_imm = 0;
+
+	if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
+		hc->codec_param[instance].disp_imm = 0;
+
 	hc->codec_param[instance].dbglog_enable = 0;
 	iface->dbglog_desc.level = 0;
 
@@ -1024,6 +1038,7 @@ static const struct malone_padding_scode padding_scodes[] = {
 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
 };
 
 static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
@@ -1058,8 +1073,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
 	int ret;
 
 	ps = get_padding_scode(scode_type, pixelformat);
-	if (!ps)
+	if (!ps) {
+		if (scode_type == SCODE_PADDING_BUFFLUSH)
+			return 0;
 		return -EINVAL;
+	}
 
 	wptr = readl(&str_buf->wptr);
 	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
-- 
2.43.0-rc1



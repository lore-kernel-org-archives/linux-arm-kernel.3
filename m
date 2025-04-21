Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C8CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEg1G7b04epQnnqZgLQO/IhUJ5tl9A3nCQ1JX8Ebio4=; b=ZvPF/9yF/Y8g3I5QdUi0BtMEXW
	9TygaHGTO7Id6QMDM+k2AL+8DhDvtw82Urib1eohuIz+dSSvtWhrn375CVndOR3I4MNxedjr+U3XU
	NxI+NgXIFzyG9o1vs1IPpKq4oG+q9JcPmPUma8GZUH4kyEkYYxO2D10zX4YhQEABF3WkZFkTtyjlm
	m8nXHDk5HdWCIhQqicqVo/hx9yQTeJZxiMCdnrlFlsPLEASZyx4NjAb23IgPSE8vocdWZWzD8Y/C+
	ORmfNHdOpo/yvHT9Uy13hdSxHvIJmN/Yh2XUB+j2s5KV5FOqrCO0Oql9eFMfMWLAkZLA3/FewXs2C
	URGyHmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mLR-00000003sjc-2OjM;
	Mon, 21 Apr 2025 08:17:37 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mHn-00000003rqW-2Jc1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+UjvNRuecijmvh4QufSv10wFkFjnt/ZsyNI3APHkBg9DVADoalaiG80pnctpIfQhvv/8nyIc8jUQ4XbWWU9jfOzv33I5J/ySTdAKqF801/m2iQtmqgKAaRlb2/g0FPH/Khpr+Tj2jnwc+qpw9qiPr+Citr32djlsCzgFvE5hNHUpCoK1Fro2CYx2jusOTfmPfZZOv3hR2VIxQCvBI0rj6kfrYmDmwtcAjpitlEYeJkWN6gN0IIZuor4hIT7hSfVMq9UrBldF1+56Y4yzuhY/JqbEMNy++bSLBaRID7tuNbHMZ+ETTzsZwCtMq7kPhxqmvp7wFCKLslfwKh/MCK5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEg1G7b04epQnnqZgLQO/IhUJ5tl9A3nCQ1JX8Ebio4=;
 b=OHpegCLIylajCOV2OlcqnCj1+IeByaGq8fo1hpXLfw5iQW6D3TQIliSJvPxkFAewIETZqyRc6TTHkWVMXEZG+aFmmYYuksFcGPNlaQSuA6Oh8KYnPH60y7VFRLr46MPu+iOdFD3dpfWhMWqLVwiHF5j0xVZcABuY+Rho1Q1urWf6Fc5Zf/5oUs2qP2ZLSXETU45JEo+SYyS1T/AlhF3N+awwI0MaeMPg/4pVqVzN2STQq1zZ7lCQoKPfVKQ8OYWsziYn+BVyz8HTW14Bb68uMmTFmT44VpzZL0/kUpvs/VO0Hxi1ip0mMiq6YUD/UU2B9aSp0JVtu/rzUgbrfE6qlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEg1G7b04epQnnqZgLQO/IhUJ5tl9A3nCQ1JX8Ebio4=;
 b=q8IGolT3P6X7s042MxDQnFsE/PU7yqB95IyqjrxKrmaveFFAaH0GKRWyyHLoH8lyCD1CutQzrOd5T1QKDXOCP+vI9WWVMeNlJPq02EagJwN3FSKGoUWY3lEpOcxBqLOOC8aHy0rR8A08fIVTiV7TSy8TNxQ+MAI1ChuKGr7YyMVAMZ1VTtOsNcf421LKrVqFbr0+y/OBMalmgCw7SbqbiRiqxnRtQf8IXB4ieZMWbZzPLHXNLryiUwQFeTRFuJvSMLBnyfdlIv21tzAQCx+FlPtUAKyjS57avLFCG5OpdLAh8pQemE39Qt763ofX+hf5DroCZrKdyv3pTq4WueKcpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10104.eurprd04.prod.outlook.com (2603:10a6:800:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:13:49 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:13:49 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 2/5] media: imx-jpeg: Reset slot data pointers when freed
Date: Mon, 21 Apr 2025 16:12:53 +0800
Message-ID: <20250421081301.1304-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250421081301.1304-1-ming.qian@oss.nxp.com>
References: <20250421081301.1304-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: 5440e873-1331-4a3a-5e15-08dd80ac71b3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cSxbJxSRUMnubytMLJvyP8WScC6ryzm58FCT8mX8rfyjFTfKFtK9xzJrdDXg?=
 =?us-ascii?Q?5rJWuseFQ06zjsTCMnkJBpy4j2Pa68RhgY5Xzkb1wRNVAkgZXQBai4tBuX/Z?=
 =?us-ascii?Q?tf2OUjXikz3eIpcryM+ZO2k530ienjE9OP0drBIv/H+C9nJ26pJyQS9Cyfta?=
 =?us-ascii?Q?scbuJZzXRnfc9hqnvhypfD5QdRUpSjMe+oG/Cud82cXPEpONmATOs89e/Oob?=
 =?us-ascii?Q?lNgWYbhD0B7s14lDIvkyG0f35PLZnxnGB3AAblVsZaqXMpCJ8YPFtOWLbl0M?=
 =?us-ascii?Q?PayECZDqVN9HCXBVfdhR3dPVmRQpJwMF8VNuyRNJgFuzZURgbx3ZWH+R7XUT?=
 =?us-ascii?Q?khekw35PmHcKoFgF/8G7YM/PKT1t66J29WEKB47g2hwDbl64OWjWDAaZH8P8?=
 =?us-ascii?Q?m7mZu6A68BEAL9ZcSMmhYviNnCAb0d0ajA/XHpJ6CDVDqR/5n6MyxqSVRvcx?=
 =?us-ascii?Q?CCHod3mQeStIHZBSvAgS28uoNpEAgtbKMgAgsQlfl//OgSvqDYAqFueW6cYb?=
 =?us-ascii?Q?1Ol9ZyrtQBjctIlgkIeq2GxqoJmdwblnk7rADvYct+cUgnYqEnwuoAuaNoj8?=
 =?us-ascii?Q?3g/aUFAOjzmXAaDUe4a9loSydXPgMA2TQkMSZ/WNuCXxXXqjXd6MAxWI8tip?=
 =?us-ascii?Q?LGkx+qbpsURndHdfHR4GEW6KKlM6zr1MWLacyTLpWORItlHtpx4lOE4L6SWb?=
 =?us-ascii?Q?qUGzJ54/qmpi3dgqBobm3XZcYxRcejCNgdljFSbVicG9HdiyDuaxFlaLVj5n?=
 =?us-ascii?Q?Pyqel8xIOpqSWnR1wBEF3C9ggBFxQ3lhothiXMNGpT5t4dIEGMHmXNCnYD0d?=
 =?us-ascii?Q?wr1VLBmqe4YQw+tj/l9/3I8DfhNQic7YbShlk95tv8R2f3pgHbgdsjB95H6Y?=
 =?us-ascii?Q?01cHWJTBM04AAMF5l0ekopRlxSF5E1Y9z4VhmrQjOPsPj+kxpcnofIG/n4MG?=
 =?us-ascii?Q?NqNXK+vu2CN59AVRT0zxBnHuWFkvDK5IRvKi42C/aOFSFu9fGxxK85+6yU3a?=
 =?us-ascii?Q?F032OgiDUsNIc3CRKlpYew5cTcGS7XuTtmmM8oezVgH6EDLPMIy4ApAiNctK?=
 =?us-ascii?Q?EtYjuEtqPboaIicCBDR4Wt2lyASSCuD918OPH/uAvZ7ldVinYSnK+ughxm0P?=
 =?us-ascii?Q?WMQ0YntxtJlLiITs4XPp5/9kKBiSO1BobIhhQIz/csB7bU40SrAPSuPYhGYN?=
 =?us-ascii?Q?9iJfU5OSc8ZiwQ5HGR+fnKrvH0aHA6p7C+HSEugJz2wMwiY2lc9wYdSDYLsE?=
 =?us-ascii?Q?gAsffykVsPsFcZ7tWzwNgIX6A81tDIGeQJ2mfJ43Xx0VT86F9qUvZqY62uaK?=
 =?us-ascii?Q?JGxFNImk9+d2Jj75rsQqJZ21XvSrD+gFsIFGOcM1BCa+q22M0DufqRsunz9+?=
 =?us-ascii?Q?9qK1ozZFDEhTrcc3pPDSOg8th+TcPs/6GaGaqH6rb2cZD2K55S2DPATTuKlU?=
 =?us-ascii?Q?WVYYzGqJyiLvxbKB4nf2QwtT/5opguJa5H0YlyuXz1BmRxSNn6rXuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFL2Vk54zVPOmcvy7xqLgeox64H4tjQaQMrR1HmKgYWVHtWWfVTFs1IMJbtH?=
 =?us-ascii?Q?SnGnhxtG3ccdtAqOaSgOIawBo+6H69Sr2TjtEVrJkJJAQb0Qk+X12aZSOPzM?=
 =?us-ascii?Q?c4xOiCBdqIcE2X3BHsFGVINGy5w9TV6hH5lrRKUpNj/vMLeimDRiGb9njzif?=
 =?us-ascii?Q?KKpJbiEBDVt71BC1m+YnVa7n/1/melhfZ9bOB9toUpoyyU2+WsAnfq6hGbnq?=
 =?us-ascii?Q?Vx7eNwIQlGJTFbC6hglfZKPxAle2Pe4/Dut8lYKUBq7PbsDJ1m4kXWhvcC96?=
 =?us-ascii?Q?rDdNj0x/0s+QMduv1Dgxx1YQtVHX04tbmvehoVkhyQUU4XVVSiIyHGFE/NWN?=
 =?us-ascii?Q?vIODTvRZufyyys53AHMRM5/K/DgPUVRwRfe6H+pHmSkHhSkBBPFw4LP04F92?=
 =?us-ascii?Q?FOGM+E0XIXlC3Y9ARpLVE+pW8VI+OsU+zrACOPh7uEXo1msvmKva/uD+U+iL?=
 =?us-ascii?Q?qfUUlS9VhBu/2JQhj+ULGHHGmz494NP+K9uc320l70Zn60QsFg/pGnVXcZGk?=
 =?us-ascii?Q?jZ3l5Bq8R4G39oFci8H85Qh4fqD5O8jZ5hbK8MqJHvNDWqVQ5xXbweOjQzzD?=
 =?us-ascii?Q?krWWFyvNnvqrG5wYBgguz3h5NWShJk0+70+tAnJm3P1NrL9za+cn1O5K4RFD?=
 =?us-ascii?Q?cxJSLIVYG2rovhfTHUDOoz9m7zSc0W0nOmQK065rAzwLkn+NlbFxdVDLZ176?=
 =?us-ascii?Q?Yd0oKJn1jaYw9eOHu1iV1BdOEX7XbRhx8Dw8FUaaOy0Z13IxZpy/agb+aIJ7?=
 =?us-ascii?Q?lRL2VYjIheWoiEWTjj1MQxDYxA+cXIL2X5nialkGe8KFZXnt5jexXR+Ywz+1?=
 =?us-ascii?Q?XL4S5RgXC/6xLEGY2boXvsejq8kCQrinDa9mG6/AHwo/toqyaEPGLmCrFoRn?=
 =?us-ascii?Q?5aPKWlsUAc4ASJW1p6oflcHOf5ZywdDiFoKWiGZmeKpNw4KWm+9z+oVlsUZ3?=
 =?us-ascii?Q?z2b6kJxDqE0XeHLZjhXCUpRxldqVv//yO8DVQcjzOZI6sWcVj9R0PhyQEch8?=
 =?us-ascii?Q?v49/ihf+MqV7CG5Qqdp1ptjisJP735qQkjhQcaUZUWEXc4Nd5YELJKLRpWnj?=
 =?us-ascii?Q?mTguNLl6RVAStVGO7IjYQbGjp7zsYkFcjZoAYC9byygDkeqjo3j2BIvNgDeO?=
 =?us-ascii?Q?UFOChALC3rH91sLVqH2PVD9sUkpDsf6AIy4yqS4gOzYMyEtrwZRHj12j2wRB?=
 =?us-ascii?Q?zl3gIszgd7oqc5USal6rSB/aqJ3jse7rwp+gzKuwlc9OFCLKOCcmNtRkdY03?=
 =?us-ascii?Q?yQtk3hx3Z+JYyXaFUNOS2FYMIfmqvuY/iVWnv3FX8LbnniY71Bl91UakB7MK?=
 =?us-ascii?Q?Dneln1xVZmKdGXugN387mWTSEJW+zSw6Hdk120Tf1C2I701dRjXsDEnJaXsp?=
 =?us-ascii?Q?vZe9je5SynCePgjYhXz3bbgOWHEylkjeBPgg2Q0OKLlcv4FrO8H6fNH4PadP?=
 =?us-ascii?Q?rNXGBj7MXiYWLURV0vzb+X4ULr0GN19FGIupEZr0v/b7M9rWwbfqsHcYIxuM?=
 =?us-ascii?Q?nbhqiy6Ts4dCRxuhkG4mBDtcbccfPflWSYc/v1uoLlPVQ557aSVE9ex+aMSD?=
 =?us-ascii?Q?qnb4pGbQOMhXeZ5s7RvpY2PW+b5w57F+S8okKd06?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5440e873-1331-4a3a-5e15-08dd80ac71b3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:13:48.9497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHfW9mEY+OIW0jPbG9KS9RNGh8wEoiOo6TB5cXBjndhLvDe/pE3L8kammuunU6r6AYbFuYH5lN95QrnVbpRTSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011351_597115_56696B8B 
X-CRM114-Status: GOOD (  10.17  )
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

Ensure that the slot data pointers are reset to NULL and handles are
set to 0 after freeing the coherent memory. This makes he function
mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
called multiple times.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v6
- Improve commit message

v5
- Split the resetting pointer when freed to a separate patch
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index ad2284e87985..29d3d4b08dd1 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.desc,
 			  jpeg->slot_data.desc_handle);
+	jpeg->slot_data.desc = NULL;
+	jpeg->slot_data.desc_handle = 0;
 
 	/* free descriptor for encoder configuration phase / decoder DHT */
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.cfg_desc,
 			  jpeg->slot_data.cfg_desc_handle);
+	jpeg->slot_data.cfg_desc_handle = 0;
+	jpeg->slot_data.cfg_desc = NULL;
 
 	/* free configuration stream */
 	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
 			  jpeg->slot_data.cfg_stream_vaddr,
 			  jpeg->slot_data.cfg_stream_handle);
+	jpeg->slot_data.cfg_stream_vaddr = NULL;
+	jpeg->slot_data.cfg_stream_handle = 0;
 
 	jpeg->slot_data.used = false;
 }
-- 
2.43.0-rc1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED36C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 02:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzMiGI16kwI6VjcuO1Pa1hlTIkV1kjTtZcrEcaLf2VM=; b=NA7q13BlofJth43ThrWnbFoF4b
	zk+gNhdz6F73yQhhTJhY0kmpLzmU8ZaChYilvLDYUNaXw7MxpxyGwmqggEgwNpIrqtiGEDdTeryUo
	y2+zVnIBoV/r7xIIx4zPj/ha4jYFKXpSJvt7KCCwCWpwuXG3dAYgbaMenbYBMhsnT55ojVJ3aXejR
	iBu/n/GhmS7JnNhBbcNLi7fE8XM2SzNjxjr/ZdtLzK+mgXFQcCPbpTjRG9QmlpenX/d1hoSp4W1Ub
	radQKVHW51anYLRBwk7doAsRWQe7Dlt66yhSr24QaoGAx0B5AxQAAs6V8IE7ER3R+FHJnGbO2f2sN
	OYeVoZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKTMK-0000000ElVF-2w4T;
	Thu, 29 May 2025 02:51:08 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKTKB-0000000ElM6-2Hky;
	Thu, 29 May 2025 02:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKQJHLlIBiohH22g8lpmv/mKZp53uPoSSWlRSRhFs+cVzq+BsTfLtzyZOVIOlV/tO5QfjOf38kGC32YsxwPRo2SRR3SX+WYDzduCqFkZf7SDBZLzWZjcCJtugIs+dqhuxYzJlusTAM3CdJh3wjedxpkUC+ypzNArlZi5vxh8Tm4jD0CAxDALJ+jkn41+rIUIlIqefcAf5k9se5gh0O2PDTqK1RGJ7S9M3UtwKgT/chVPupqnXmfOI4GK4pbm9wGsKFi7lCMuyRw1SCPf1qCUNhwgGyIphLaujyKE2ZohnsZbMpSDsaoSWXArg6TYMjbZMtuttpigfxwP2skoYb4zLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzMiGI16kwI6VjcuO1Pa1hlTIkV1kjTtZcrEcaLf2VM=;
 b=uEe3J8J+OGy27RzP85yLd+8HwCaXj8Tc4EvSbXKgtIYN1DxsDSWrBnDSICy7Wp+r215OCIqbvvgnyhAtpfAjOmkLKFSvcNpzpgYnXOYGPpWucp1/gaVNZWtiqKfXULR3sD1T9XUJEDYZzu0d7U/zz4yDojU2hz/XOoXfdoL0qBaEiI2zYhdG3VP9/VTGeYRNb0BtrNlgBV6iDP+0hd/HsnywojnXDsFYRl9x0eVbiKmc/5x1TIr661cndQow2RqqpdseFJQCNV1nm3aZ/IiynTg25lrsbEJmZM4PmHRmlnW8WAfC41MZz4NFgDYyOVgpEPRu+5wE2EihASQF3jKhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzMiGI16kwI6VjcuO1Pa1hlTIkV1kjTtZcrEcaLf2VM=;
 b=RbGyeX06wFjQFceLZY6GiV/ZyVZae91z7sAeBND6jKxo2qlb1iknDdlbdmZuekfFPEp1s/mSfHyr5AmZ0CJYLvhKbOCkrYO+XKO78DAnK5DZKYr2+a5FXkc8i4sjaDzqs4EPgt60c1bVzV3I98sL9UTbVAF4INsPBbEQqfZGdT2DVQFF+byeOuvbpuslDvF14ctGNQfKuK5QF1tWWz6VRy9mOdYdMuhUPc348yoMqu0eLvTeKaODvYPbGe3P535yEAHjJznQfHdlenJ8MvLoyXw/ekOIxh/sC0tuKKzi/PhyzYtZcsjDtrqYQq16O0AQs3wQGmh2aBfCAvxokTshMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6505.apcprd06.prod.outlook.com (2603:1096:101:16c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 29 May
 2025 02:48:31 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%5]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 02:48:30 +0000
From: Yangtao Li <frank.li@vivo.com>
To: tanghuan@vivo.com
Cc: James.Bottomley@HansenPartnership.com,
	alim.akhtar@samsung.com,
	angelogioacchino.delregno@collabora.com,
	avri.altman@wdc.com,
	beanhuo@micron.com,
	bvanassche@acm.org,
	gwendal@chromium.org,
	huobean@gmail.com,
	keosung.park@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	martin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	opensource.kernel@vivo.com,
	peter.wang@mediatek.com,
	quic_nguyenb@quicinc.com,
	quic_ziqichen@quicinc.com,
	viro@zeniv.linux.org.uk,
	wenxing.cheng@vivo.com,
	Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v6] ufs: core: Add HID support
Date: Wed, 28 May 2025 21:08:45 -0600
Message-Id: <20250529030846.2189709-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523064604.800-1-tanghuan@vivo.com>
References: <20250523064604.800-1-tanghuan@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0189.apcprd04.prod.outlook.com
 (2603:1096:4:14::27) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: a6050808-36d8-41e1-f1b0-08dd9e5b4b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?794SxCCbvj5xVFhRFkWZgrLHbtnu1FOXiekqK6E5en/LxsdKWdjr7miC9OjJ?=
 =?us-ascii?Q?7l2PfMQVFXmUeW2tLvrrPfW2y+RRDlf7LkhyuyRRRXT7X1mDl9AJ7duxzisc?=
 =?us-ascii?Q?OuaVbLDh23B+hwpPK4M9lyI6kW7I8AHfwmBZrIWw75uKXAQV5lWBmiX/MjQW?=
 =?us-ascii?Q?5Xx4EQ6x7TCl9uOeHxixPsInjv1OVuEGqv/x9KaNHWrBDLn9AAaofe/LC7ch?=
 =?us-ascii?Q?yCsEt+rNWg/IZq8QpWUlNKm9K5k/fHOa1iNaovBFGrooqRtXcQCM1U5oxPzB?=
 =?us-ascii?Q?T8zys44sK0zsVYPf1FsCsJyiVcnOKlW1IPuYKCnh/r7+LLPKXMi5x423B9UO?=
 =?us-ascii?Q?QPout02YIYsHd3/2mVOKIwpNGZnF6wB9M+knh+q4qVlcSwlJ9rJmc5qIn61+?=
 =?us-ascii?Q?ono+FzpuivkqxAvV1VoapvwJmvbDGdTsXLG6SW6sfbX6RIzVUgU1yxkm/2gW?=
 =?us-ascii?Q?Trw6u1lG7uCagZm9Ngetpunn9mb+T6nKfPVZMDC/HRlauhKKdaLzwVTPNvPC?=
 =?us-ascii?Q?dXEMUXcnkASstrenF+gSZ7zf/2EzHD2zbCzqVwT/LqhQyIWqLMwJqXD2ufIo?=
 =?us-ascii?Q?ya1BZDrXWyCrCVTOueVTIrw4EMehEgTzSwGAUPsdO3qXg/pspQivCcyI2+FD?=
 =?us-ascii?Q?us+vcXx3PzweCwmffkIAZmJoZs47P3QI3yJChnT5m5keefEGge79XvNxa/jJ?=
 =?us-ascii?Q?1hVnzAA5OpElM35V5nU+TJtpS9AJ0ZmGg/wbEUBLs+iY5rvqD4KqZeiZ/Q+2?=
 =?us-ascii?Q?y7G+VVnnEvFGjqX+R0dTk9yEqeZvDOeZFi6Lii2lbbLpr9qK4W7qJnSz5Vkc?=
 =?us-ascii?Q?clZz3EX8kqqqxkwrSGLWRMS3Kjdcb3mEBf3Tf76buJ8JM67+N/GtQMBON1XM?=
 =?us-ascii?Q?C7CJxtBsfnW/H+zVbwUwIPQHDPOL/ocqICGyyZDwFwF9LiSOs9bxkcQlzFj5?=
 =?us-ascii?Q?mip4faPLth1K48nmwjr93YUqdV+PCc6ogwGxEp6N5NH1OJVllDq7zN83Rg1y?=
 =?us-ascii?Q?BMMlT2jFjIhKqwOnPEr8w/SScTH9god1EHKqmmngSZ4UWXVqjtyEvpY8OnYo?=
 =?us-ascii?Q?77/iskGNdf2XYJschgw861MIJJglOhsi0WGC+fiTZ5zCcDr88middmOuHDI6?=
 =?us-ascii?Q?M6tupVzz34p5mWuPzzPYeAb98QChTbVNg//fo6K935m8cvIcuDkH7q4AbGEH?=
 =?us-ascii?Q?AO1rebysjjnU1eyzdEk02pTfMyad2FKeIAAwp4d55xsuetvUXU1A/WMKtgUR?=
 =?us-ascii?Q?iOD/joXVr+0rtoZH4jA2OgFp92molkMUUyrR/7Dbug0qoHLUiGFXgyG8A1ZD?=
 =?us-ascii?Q?/gyiz3l3ol96iYqa6M9hH+YEHa0BNWfWE25Cju2BwKw5BQqFCadqWjx7b3/C?=
 =?us-ascii?Q?72ddTfTkIUmgwDfuDAuREFt67dfVwYj9c47Rw323WKJ0ISfGy/m/bxJPiKrb?=
 =?us-ascii?Q?alz6SBRQKps3gh9CciwXA1TdPcM+IS04SzJbC60aRen+xrO7nyYTmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k59ABYnJe8sSYpKC3UX1WtgOL4jnmWAv4UuZ53MUdTYIlTQzmWoEu6Ytxcwu?=
 =?us-ascii?Q?F4IdUkPTqsEQMDw6Sk5NJApV78cDPC9SmliEYa4fyzwtYmenYiMF7XwJT8DI?=
 =?us-ascii?Q?mkup2ncD4GHMSzDktM1rAIibAhfx9hPUJAO5t84+yIFhwd2HnphNkKYjsool?=
 =?us-ascii?Q?AumPd86i+1/qOKsq8rmFmmcrOXdZ3D37p+sQ8sH/Tp7sGradjgP2mtQuKLtf?=
 =?us-ascii?Q?UaOwULOmS7f/ttc7gzOE/oCa81Jt/QqOMOzFjbdYeOpf7sNBVVQwcv2rXjte?=
 =?us-ascii?Q?egtxCgLeYf64QMODmLNMkEJnzf/xAcmRU8rXa5uOvmo7FuCFWtG5ApanAH8z?=
 =?us-ascii?Q?4jutn4WDpmEnDcS1l2cuh4PjDej0D1u3k4Tvl7H339VhMQjjti4uztQSgN7o?=
 =?us-ascii?Q?oYi9O+6Cb9LDJarURZ2RrFxrAYaeedcY/4YnqVPphMmPUwPM8tspOZs2rrbv?=
 =?us-ascii?Q?dbnSRbgbxklGsrtZh6jM/zXYQf7LWzTMX41dhYAFlT6xjjjA0uWKHJkh2qeu?=
 =?us-ascii?Q?gUMQv1jlXH4JPxTEqQc46snQcdHLg9fYYJUpdXA+IFM/x84RB82md8g6qe0M?=
 =?us-ascii?Q?jzPeQ3q9+ZR7fjA+Gj6KBMoz8kJAlXbCwO7uZ24XnI1k40b6A1VXE632XZPf?=
 =?us-ascii?Q?L/OjdLmCXfP2o14q+/GyCsconW5aGtnib98ZoZe7n4166s5phcTfxRHWhje6?=
 =?us-ascii?Q?S3I36x6zt2OSNg/RAvVmWJs3l2dQhvwI5LENlB3PKK5Q8hgmJO5MJpqL0z86?=
 =?us-ascii?Q?9puhw95qN3auQwkfXl0CPX1YBL6BsizVqHIBJqbQ6zLYRIRIc7mpW+rKX19D?=
 =?us-ascii?Q?YBxlqAdK8jTNeRUP4WIjqLbNXs6Z9gH5Bs5xeKrsRbbTBKoDnogBDeKP6tlz?=
 =?us-ascii?Q?mWQPOYjrvOSl6jo20v2pYcA0qvPR/eOW8Zj32TrYMjxnv0mAwnfwywMWetjG?=
 =?us-ascii?Q?gLsWI+BxjN9xPngBXwSOP2Xm/r4mO0Wg+3xrDozLPMS/0ibKz/VrlbE8F0qK?=
 =?us-ascii?Q?IFCATcmIJkqmGGF0qg7CxfNl6WNw+zedHrCRb1Oi1zro5Wbs2p/WSJTrNx5w?=
 =?us-ascii?Q?+4Tbgbm2frCBQtlt3gp0R54UWCWaj5KN3dyIWA6tUmUmdInitQlXu+n97Kg9?=
 =?us-ascii?Q?YOdUFC4r8S3h56Y8Nxkk83gz/VjXJVQXXIYGpmT3eHbV7cuMzcKKieln51M3?=
 =?us-ascii?Q?35KIK4ThNwSthlsLLv6FZYId9W+W2QY9FkY84hCZQqybSZpwZz9URCWYp3PX?=
 =?us-ascii?Q?8u719gL/yOIz40dNemcbTtXTwZBuKLG5fLczl+iRQWp2XRP5WvvgoE8giyn4?=
 =?us-ascii?Q?2A5KLVjIZIkYQJofgxiqX5ePkqDWixlU82gOd8vG0E2bnAffQq3uUp/DLfR8?=
 =?us-ascii?Q?ZClqCa9gr80tP0gGbrMkyXSGZimmVA/c4btK/JNMfsTpk6abvaDJEel2715/?=
 =?us-ascii?Q?+AgK4Hi4TXiqVBfjVAb1BafoaIekdef7XSadNtEF7NgPvCq8C+8IKZzGTMmV?=
 =?us-ascii?Q?taVJolohfhyQpHSM56QkCR+KDS0CqmJWBDQ6+zn97t8GKdQpSdpCLV+KnGAx?=
 =?us-ascii?Q?s5rg6hQAbD4Kv40hbdegGOIUKPSGNjlGODNQW6SI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6050808-36d8-41e1-f1b0-08dd9e5b4b61
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 02:48:30.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MauryWMGZFsuctlVpiwWm9UrWl1KRHDirud/3Rk4XjSt1ltu6ivIOYeCWAEFYY39wZYRGMbPNs3EPx9H+ecWdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_194855_581070_D3CF1932 
X-CRM114-Status: UNSURE (   4.16  )
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

Hi Huan,

LGTM!

Reviewed-by: Yangtao Li <frank.li@vivo.com>

Thx,
Yangtao


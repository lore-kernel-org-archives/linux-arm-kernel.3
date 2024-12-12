Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A46FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y+MnWSgjSfpvwHUQjEZNpGQxHbJGdEA1D9adqOthXoc=; b=RWzBCeidqoLtKCC1tEFIVhQF56
	hukKz3hDrfqMTbP2wOLrW46BoOFaa2zuMkAlSzzdA2hU808SoeVE/c6QezP3LZpIA++S2bNjuu6UG
	2+vCROQCWXcCDFY5uuYgtxug62bC6vphAsZ7Trk4ND3RNHpqqhnXfccV3YZiaoN1b32h0TF4Kg/Ma
	lekGSZAtpekzE7/2uw/ioEzeG10NIV7RbEY3tdtv6kh/3PnNFKzGKGi/yWf1ZY1Q5kHtUeRrUBm6U
	h7fA4d3ScUZJLvQDSjdmIZBNShciZhA0Q7IKWMyoq5eJlqo8+jq8MFL+pOC1dMyvBzJ8WwqMvpXgC
	Hsv+dZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLd9I-0000000H5a4-1wAs;
	Thu, 12 Dec 2024 06:58:12 +0000
Received: from mail-vi1eur03on20606.outbound.protection.outlook.com ([2a01:111:f403:260c::606] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLd8E-0000000H5PJ-2BiB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 06:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVNkMPwfMNYo9onVCH5NvPPj5wJVQhJCHWQ165DblWkXO30Xo+aYCZJvUdZXf67WDI9LbihIv9pz5lXeXxn1mlT3EsTNEBQ4QbzsMgLLmiWSXVQVTv/yLs7BpEuIEhrEC7QRX99s94UrB8ccIdXQ5ZuidYwAE/Plu7w15mEUCOwJLNnfNpMPZuqW41pMKunxQIIisDsjuC5/3FmYtyTIcqK8qfRkrmZp+/y1QhQvbG4I2UJuMlw7VSnyLRuhp6/ceD/6N7dIaFVVu19fBMwQeUBhIsHpMOhrxImZJl09s0gmrGxFebfiYWT4aqb10A3mmK0iRa/07EwoVbCI4k1OJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+MnWSgjSfpvwHUQjEZNpGQxHbJGdEA1D9adqOthXoc=;
 b=EUwHBBXUsoQlFNfz+35jmeRa9ZLLqZqEN0sXtT315A2rQb+D64o1SojEVKBJ5DN/KVyHIs00PTnAil5lz6lPlaANMWXawHZ68T1nPbj+9SBrsa08dBSMvYUcnXvBw7ybVddh7b42v78AcHfQCXeS2fqFmyjOkZwFxncavQIrGhIC79/qKpaXS+Boa+fWxkKyTAymbqZSNSL3meRzD3JaG1lY6U069OPNz+oW1ZS9DbUIGwBucLFvAmwcPhjwOkiO17hvllTAtG4IcMRtnbufSmwRmNPw0i8jaRDBEG+bBl22t2FM1QxqI6Uv9kE/FV5VLQgM9VXJysFy/9/s0MPE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+MnWSgjSfpvwHUQjEZNpGQxHbJGdEA1D9adqOthXoc=;
 b=hfhcgZnXrZt1vYqtfXVySbCdcRfWol/ywMpv9bfS+NN9+I9fAav0R/VzaJLCxPdH2vezgBNJtZyr0L2rSdCB085LekzP+hzQowLraLHAtJPlof9lsWqCmm3tQExef4tryJ6Q6XVx0giXHY+mrDdfxM7mUVxZUGpwYMSaVh0aZxi+tmzFkH/TpISNB9k1P9MAwZbI/8/i/8o3pYJkn8BSKzKDin5u8X+bmd5wRkijsdoujhzs7aoFNCvUDBM1v3mVr2S1uBP5ouzWXv7L1m+9cxxQ+PkIftHuR722dZx8Lm/enXcBHiPzZlreYlwRM02NEb/nHW7JuSy3Bza+CQBNgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10761.eurprd04.prod.outlook.com (2603:10a6:800:27e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 06:56:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 06:56:59 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank.li@nxp.com,
	will@kernel.org,
	mark.rutland@arm.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH RESEND v3] perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension
Date: Thu, 12 Dec 2024 14:57:08 +0800
Message-Id: <20241212065708.1353513-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10761:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d0b48a-f7a1-463d-8e3d-08dd1a7a2c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZTGq0U25MwkUKJmBFLh2+L/KajDdc1BCkGNX1wBHappoeyQ/b9IIKc21snVa?=
 =?us-ascii?Q?1/dsRfWyVdKkqh8n9RheyjQJ4uSYTSy1MW52kFMafHGFZ67kUEtIJx6oyP99?=
 =?us-ascii?Q?2vD8rOobi5ThaT8FcFhIq4RCKfjFN5nfuTU/6Kl3Gy5MDTel+a9Pz4yqqV0w?=
 =?us-ascii?Q?B+rPLV8hA5P+aGxXoVLzN0ggdtr9Mi/5iBwYGyVjugruhc7IgKMfa4QZXDsP?=
 =?us-ascii?Q?t6AMvAYpR+9ADf6oTrt3fkcjHL4f+yz+ERYV6OGKxEyAojxLP0NmkvvfRrmd?=
 =?us-ascii?Q?NqyEeGzLbxqPWrtv96VzryGXd5j11nZiPF4lZ5N5UgprKfDczxWvXXHpK9iF?=
 =?us-ascii?Q?zCkyykuLcfbG2ABia7OdAhWbPwPR3XG2czXCgPIL4eO0Ja26KxrloZ4Hmspd?=
 =?us-ascii?Q?rxMEEZYQGLPf7KAhwrmn39v9YmG9aBWgx0Vy4Q+VpuwSBeDu4WAVA7lOedhg?=
 =?us-ascii?Q?wkNgfpgQC2/whi0nvAtiPYsNLde6+EB/a7hgcvBD/d4aKvKqM4Zu4sv6x5//?=
 =?us-ascii?Q?rYKLdhg2vmmCBjG2tjAzBfrGBkm5fIo/gTP3tLFgY7rSHm2iVisD1j8nHsjo?=
 =?us-ascii?Q?0VKxd/0SoxEn6Wk+WgoSdhS3qTatwy+3nQlGDgMtzVdsWHoXNZjKt4i0jO4V?=
 =?us-ascii?Q?tirieT5VA0spXzMYf5VfoC3TmSs9aK2efTDGgSEJTbp9WTYuB4hgIq1roVXZ?=
 =?us-ascii?Q?tdARJJbzRi9qrutl9hsJpcGv+H4RD+v9d37ixV3EziKKsRQhiswVA8ycZtez?=
 =?us-ascii?Q?SoaogSr6k+1xR/z/3hzCgPZazPrjNL56YfnznBEw1o54UXrLEB02pNAnAfcr?=
 =?us-ascii?Q?HqAaAZmW5shUS12Iew+1wqhSGfPRg7yO6XV2aSDi+WqBUmAQ//TygGgQ28yQ?=
 =?us-ascii?Q?9+p0fAC8CItpFzjiZnLL4wklwzB0S+VnrprH55JFqxIGKOur0xgV6Z8rd1O9?=
 =?us-ascii?Q?qMgj/TMLYU9dwq+UeURL1w+AOCNs5MMY3C6Ey/trArUUV0OvW61vCaAXkyTT?=
 =?us-ascii?Q?J1ulpWVKFqI1wphErQyLhbAwO7Yt7ZhgFEv9r8SJXWQBXZnKao4cfeAEF3H+?=
 =?us-ascii?Q?pF8TYSiRJVNLTK4AkY55yn97GODTRfctJ1QzH3ha4Kvm6NUDrczaRFURQV7S?=
 =?us-ascii?Q?eVp8FRLUVBiJQ8wE5NXp8Ssh/XYkYp/I2061i0DmIqzSwKC56nUVxDCjdhK7?=
 =?us-ascii?Q?cq2gjXxQLvNuvfaikvgRoaK7U+44vFUOZjnj9UkZJip4dLflh4drhzYrjThL?=
 =?us-ascii?Q?f0b+7/WCwqALkOlt4Grxehimc5nfBLLjdCZ8S9tAk7drPwuswkNBsJkOBVWT?=
 =?us-ascii?Q?IUvAsvhq8eX6eKB9azpTkXU5Bp7z0biD35znCqQFqfmyN6MlSUXqqT63tjgK?=
 =?us-ascii?Q?1tqOd5Rhjca5qiNU3uIVQp6n3WhiYasFEzhfxHMAAr4ofolpvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RUT15/hk0gXLkgR8KXHMndG89vqtH/eVNsEfaztA4jlcllX7ssBHF7BklD7a?=
 =?us-ascii?Q?kUJOk07+Vvn5rEidvVPXloIKwuVKDNoK4Pgur44EcGZCpktyXI4qO1Dv85fx?=
 =?us-ascii?Q?Ys4BsdWNa4D3tXHgZ7mRDVIN+AAPp1qkRDEMDSJ99PK75MhGiMKyqEKSWyGE?=
 =?us-ascii?Q?leDDfbQnXXlhxbVmmpPHUwf6nemUapYlfXiwkGlQWNiWw2JVQMsa+Srozbj5?=
 =?us-ascii?Q?L5bZ1lBTPpZmDN43Bu/N3+zCh8Uce5xKD4XZ/qYAsXsEsNrK1oUVy/tDqr8a?=
 =?us-ascii?Q?vRkuH7nSNJ7xGLja8n2rPBt5DI/mSdCgb8ssXyUmA7KiKXhs6jCMrLRG2lha?=
 =?us-ascii?Q?xFloC6pdLByPoDkj1IuTqdmzK8Dss8iKpTzCTxkzliy2XympjRkvgCaPsJvx?=
 =?us-ascii?Q?YEQdhRg4O2Z3mCCHCrS39aw21a3SdUaX0AG7kM/Brhs7xDMYlhAAG0fVjoKA?=
 =?us-ascii?Q?0JLbJ4dKLQUiHFvnLmEwBVqYBMYejgJtR+MA3CfXoavqLoioBMb0Ssj0LCU8?=
 =?us-ascii?Q?vlZL6eLBihT+NOxGSsNahaCk8BO89eK9DsgOftL/EUGRnAULDGFKBE2KYpK2?=
 =?us-ascii?Q?Y4HCNsTfjxV4lxvEsR/Ojtn+BSYdiL5z3yecNYagOHuP8Gs+OcYah40vuu3H?=
 =?us-ascii?Q?FvbDGVpLOmf4v3s68pg4w5sTAgaKkue6outH/DB1hmekAGaOybDOd9L5hhOt?=
 =?us-ascii?Q?LxdMy4/WeOa/cEapcF+nunG2VCMtUc3el1+9bkjHVnuEBoOnkorGNp+PUFl4?=
 =?us-ascii?Q?AIc0pqwyviRTYao6lbFOA5U1ivlROf4PuAoPWwn3xwgsZbE5Y1lto1UB9ekm?=
 =?us-ascii?Q?ANR6wlSEm5OGNg5gWfWG6DKti3HpR4+BgTSbqUj23Gql6wBsJ6W8oXif9H5y?=
 =?us-ascii?Q?53x1sjNM+KJw/l81PVe3tsdaww3MTL1djQ7ACxbCH66hSNcjzK4undF/uHx+?=
 =?us-ascii?Q?fbxOP4UTtw3CFQEOnE/OFxd81cA15tq6iaSEJLTkAr6ildFsa8rbnlEkcJ9I?=
 =?us-ascii?Q?xZNLYNuAmJOp8k+xZyasIVXbJ4PxRf4hisZ7o05KwcRktO9X+By+Y75MopdI?=
 =?us-ascii?Q?DTUR/g1ISgrvlesfdiTtauHnNuB+FzYTW9f3QICROryoXDlVzT9LXaAyKump?=
 =?us-ascii?Q?e0Ur141T6uFrO/Z1aL1EZifwmsEErardZ07R3lssuFeSKDST+7L3p8UEdqxk?=
 =?us-ascii?Q?/Ag6tguyMFMrWynu+0i830VC/tbKeCKt1KbYy5CG6zuNS+ojihyC6eUcraPO?=
 =?us-ascii?Q?58v5FsCS25FW0XlO8SXVb+N5CnJVNhPbeaqz3PcndbM/erATaAYr/3rTcKAo?=
 =?us-ascii?Q?e2HXecsDKmlBHk3KG+6V3a3ZnuLOsJ7ZgrEdn7whdiQlp7Wlg+T0SdrIICLn?=
 =?us-ascii?Q?5DoulU6QguEvL86e4ucIK5PGoWwLR7xa5ixAVgJaOV6Q1KcnQToAPHKhJ2H4?=
 =?us-ascii?Q?MtYvN5kA4JVrYip8KAa/OdbEvN8j4fC9uKjrj199MWv9sdDsZ3OBsIdyuSPv?=
 =?us-ascii?Q?dvSJfVyNsHw4gCPpMes8PWv9sAkSPRVCAuFCpOWvdIFFVq9hT5jmvMVzWQNc?=
 =?us-ascii?Q?tNnNTnuZPXKJoYW8aO2qqNko1CYEFL8bze4qqoel?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d0b48a-f7a1-463d-8e3d-08dd1a7a2c86
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 06:56:59.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlPNKKnjZCT6yT2BzqnU9ZVTeB9QCnC0Kmc2IuznP6FsDUGZ6p0f6YTaCv/PSHnmLy9OI0gFtXeGuUUtii2CUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_225706_564306_94FB1B60 
X-CRM114-Status: GOOD (  18.96  )
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

The imx93 is the first supported DDR PMU that supports read transaction,
write transaction and read beats events which corresponding respecitively
to counter 2, 3 and 4.

However, transaction-based AXI match has low accuracy when get total bits
compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
So axi filter is not used widely on imx93. This could be regards as AXI
filter version 1.

To improve the AXI filter capability, imx95 supports 1 read beats and 3
write beats event which corresponding respecitively to counter 2-5. imx95
also detailed AXI_ID allocation so that most of the master could be count
individually. This could be regards as AXI filter version 2.

This will introduce AXI filter version to refactor the driver and support
better extension, such as coming imx943. This is also a potential fix on
imx91 when configure axi filter.

Fixes: 44798fe136dc ("perf: imx_perf: add support for i.MX91 platform")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - fix checkpatch warning
 - add fix tag
 - add Rb tag [RESEND]
Changes in v2:
 - modify subject
 - add comments for AXI_FILTER version
 - type -> filter_ver
---
 drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 3c856d9a4e97..843f163e6c33 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -63,8 +63,21 @@
 
 static DEFINE_IDA(ddr_ida);
 
+/*
+ * V1 support 1 read transaction, 1 write transaction and 1 read beats
+ * event which corresponding respecitively to counter 2, 3 and 4.
+ */
+#define DDR_PERF_AXI_FILTER_V1		0x1
+
+/*
+ * V2 support 1 read beats and 3 write beats events which corresponding
+ * respecitively to counter 2-5.
+ */
+#define DDR_PERF_AXI_FILTER_V2		0x2
+
 struct imx_ddr_devtype_data {
 	const char *identifier;		/* system PMU identifier for userspace */
+	unsigned int filter_ver;	/* AXI filter version */
 };
 
 struct ddr_pmu {
@@ -83,24 +96,27 @@ struct ddr_pmu {
 
 static const struct imx_ddr_devtype_data imx91_devtype_data = {
 	.identifier = "imx91",
+	.filter_ver = DDR_PERF_AXI_FILTER_V1
 };
 
 static const struct imx_ddr_devtype_data imx93_devtype_data = {
 	.identifier = "imx93",
+	.filter_ver = DDR_PERF_AXI_FILTER_V1
 };
 
 static const struct imx_ddr_devtype_data imx95_devtype_data = {
 	.identifier = "imx95",
+	.filter_ver = DDR_PERF_AXI_FILTER_V2
 };
 
-static inline bool is_imx93(struct ddr_pmu *pmu)
+static inline bool axi_filter_v1(struct ddr_pmu *pmu)
 {
-	return pmu->devtype_data == &imx93_devtype_data;
+	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V1;
 }
 
-static inline bool is_imx95(struct ddr_pmu *pmu)
+static inline bool axi_filter_v2(struct ddr_pmu *pmu)
 {
-	return pmu->devtype_data == &imx95_devtype_data;
+	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V2;
 }
 
 static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
@@ -155,7 +171,7 @@ static const struct attribute_group ddr_perf_cpumask_attr_group = {
 struct imx9_pmu_events_attr {
 	struct device_attribute attr;
 	u64 id;
-	const void *devtype_data;
+	const struct imx_ddr_devtype_data *devtype_data;
 };
 
 static ssize_t ddr_pmu_event_show(struct device *dev,
@@ -307,7 +323,8 @@ ddr_perf_events_attrs_is_visible(struct kobject *kobj,
 	if (!eattr->devtype_data)
 		return attr->mode;
 
-	if (eattr->devtype_data != ddr_pmu->devtype_data)
+	if (eattr->devtype_data != ddr_pmu->devtype_data &&
+	    eattr->devtype_data->filter_ver != ddr_pmu->devtype_data->filter_ver)
 		return 0;
 
 	return attr->mode;
@@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
 	hwc->idx = counter;
 	hwc->state |= PERF_HES_STOPPED;
 
-	if (is_imx93(pmu))
+	if (axi_filter_v1(pmu))
 		/* read trans, write trans, read beat */
 		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
 
-	if (is_imx95(pmu))
+	if (axi_filter_v2(pmu))
 		/* write beat, read beat2, read beat1, read beat */
 		imx95_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
 
-- 
2.34.1



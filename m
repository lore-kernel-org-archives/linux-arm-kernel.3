Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59783C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mE6AHp0bsK33+9c9esUv15xh8BtQQmMap6KhkXJnkUo=; b=w+QALk6bwfytyEEGLqRRKrSh5J
	5w2J8TPmiU2PZw6/swzFr6BOiA8GusrB7kyHgN/bnaISeE5kGqZh3fsVLOD6RitX81xs+BgNAveT3
	W1SaDwkim4bgwKDZMGn2KDvpA0lPtU5AMVZ9xPyxrfh6puDPx/gY4D3FALDjM0bYtUNvRlv5vVSeM
	/JKvgm4GqspFGW0vdKuAACc70g3r/UDAXqdMSz9LYDQEjXGhLHAWFQInvId7W8qwtkQkBPbFCMBIM
	BTt7/dUK9FytkzBTy4KE3tu8xhJtJ7tz3y8jD1e9aDx2r/viDU10gPawaY/MQuKc35bMoVYq+WrA9
	wCTYfrZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we87Z-0000000E8KZ-3QB8;
	Mon, 29 Jun 2026 09:17:41 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we87T-0000000E8IX-1qFM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:17:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfRmmt5AMpd52oVn5i8hHdiHmhU6ZeB45IYbhr3to+0KO4ht6ClHZjetFV0UFWUpezMAlkbIKYK7uFntmogppM5cjF0FU8Su+wv1BwBy9qM/emEqjmveQHLsG3YM2pGdt2GMnTxBUhL4YaeVE7yGAoy3u4cY6+GCYywc4Eo9/nhmsYRJTQutgZMSUIubjCqasCQmteM2x4rswa9QSzpI8SrFoWhlD9RCQyMI5qOOt6DF/XfAqXu19HlbTxPSIyNq4vQlyz4VsSJ9L0+Bj+WlgFX1hemnrEv63V3G5qbLjgWYBRTPm91Tx2jMWEijFfg/GiVUiY7kkKI4RVXO7p+PtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mE6AHp0bsK33+9c9esUv15xh8BtQQmMap6KhkXJnkUo=;
 b=dsmr8JbHtd8btBOihNrJMBHDETaLWBt1ZX/WMOtPMIDubgHcJwBrtVblcGwyKfFy+/kt+0jty/Wv1RT2DWXKr81OkWydAanhoJmTz3RXHyavCzbtpDpFPiMaFGGu2iHQ0OFHW11rnAb717vHtTrJqmaIJZY5feYHMSZSd2gLhzk2ZI/wEogv7C+YYX0WA58k//EzNRSf3uGSo1tzG56dgjOpx7XU+rnvWfLC9tj8dFutiX2MhjMUENKmNzVlUnOGFrgZzio0KBTimf//ndEdBKspwgxy50Fv9MKhU3ieoKB3VDrsCgEeGLInA8So30hIy9YmfL2e5K5T9MFuhIaFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE6AHp0bsK33+9c9esUv15xh8BtQQmMap6KhkXJnkUo=;
 b=YQc4RLJYINgIUaKDtTA6EQ/HF522TmeFnqKFLiisJImz0g628T6IO4fdIcqVz1XAinUG/F8j7bZjIbuzfXruLCDMDwiTcnn1QFlYF6cct2JUq2gfi5hv+iNEXivmOqtGGK/O4X/6lH76FdaWsLAQezsEC8i1S1DArfyK3QfX6s39i1eA+icVxs7iGoibpWRlqLkaoMYycCFAvWfvXLfp8/J+WShud8L1ZgT7jPMr2c2yn7cb8RNywylcjkeilSYH+BJeyO+g/1F5BhwBP/YCfZNI8AbWSKL1uYQQeRE6NsU8U1Nb6P0RXiByqnxpkUajMpvXhUffbaVmh8rZhq/ahA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by VI0PR04MB12663.eurprd04.prod.outlook.com (2603:10a6:800:342::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:17:31 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:17:31 +0000
From: ziniu.wang_1@oss.nxp.com
To: adrian.hunter@intel.com,
	ulfh@kernel.org,
	haibo.chen@nxp.com,
	Frank.Li@nxp.com
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check for tuning save/restore
Date: Mon, 29 Jun 2026 17:19:48 +0800
Message-Id: <20260629091954.3227151-2-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|VI0PR04MB12663:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6288fb-63f1-4484-ce16-08ded5bf3f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NkKOFtr+IwTw4lbq2x9olr3ry39D+iqwhlmLi2TPUoboiCNuJqae33F9uHRShcS6J8DhAXozbomx8B14sYNfZ5++SWQ6fakzoKMW5CwuzI4KzQzUkgY9hoBjnUvOAHpwzikX3JWbA2aTlZPyOOvSMnUHimnNAgZh3LMd2R9uojEEA8iYXxHsnOTPAshoVGz30hEgXgsmenGJvYqvc0eNrV3wn1KU81hsC/wycrYj1oG+uZL2aimpEtqqIBKLfzn4vbChYLMXzoHHkWV+jKZwJztqIdVE2oZuV9NxN9yNlxJi6E9dsNoaJ0e7exEmAN+oiS9r4CH52M3MAY2NQNiqk5qtCEhjcLSDw9lq/4cNpIMK6sojEITgZUhb6pv/5pIugCYX1HBeGAdqRFpNyDWLINcVM/hjxEJg8WTCQrszSYS3CSDLg/d1Rc6CMAk4btIf9A+nsBnuZLOEMIRc13rr8JqbqYpwtvV+SfMF1Pxofq7SuSpIo9oZ34Yohb5cWS7TGAteK0lUB1r1Zw1UJ6pctaIf6j+OMYlrb36mSsBTvZbxe4PmJ6LzjUVjomS2v2gqXA002/wcCoJkQL7xEgLaOjPvfbcOxXxbW7iayZBrVScYrEtWjRwdZleh9DaoXVY2Wa0Jc83R7COQhR0wFiqYEDsx2qT8fr7X17HZ2SjHosI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XcAbnmX7bNOtaSC6h3dFlBEd+wxVoq3c8HT7bdvCSOox7NeB2rDTSik56a9J?=
 =?us-ascii?Q?DMyFDJ0wiT6zIxOHa92Il0NjTWxDrC/lppV/ZYGVtvdbVrJSQZEr9Qod4Sjm?=
 =?us-ascii?Q?jfJhGEv+fcF1XeUcxM4CW4tJcycmu79FarodOQxwkssn38SJ33elTiddRKJR?=
 =?us-ascii?Q?/blJtEEl1msrlTjLt1qag7bUO0kPe7hhq/gWwqwst3k62UU8SZ/6MJ1GmOFO?=
 =?us-ascii?Q?dzKT4lPCh7zBzBxL3a4aj7qfh4S+tOi8MKd+UeH5BcBIA/B0IfWakb8VGUfW?=
 =?us-ascii?Q?1nxzf8pHNRzRuTaADpZJSimiiOhGfSoxyG+EMs4F+EaqR0Z77DJMKLM2Z9Qt?=
 =?us-ascii?Q?Z9ZVBFb+0tAx52gGeHrSOKeitsWiPsO78ss3Z6Ck4GYQ3V32o9SyGSYV74By?=
 =?us-ascii?Q?rN9x0FcppqQ0x3NybJ/4UVxfALuxwSAyMTMVPtgUXq2agto1RSHHa1j7Uula?=
 =?us-ascii?Q?HoTdPTifRFJvtTjWMi95MII91GRfigtXmCe9D6dU7U7DVMw6L7+Qlt10/wD9?=
 =?us-ascii?Q?OcSkKaD+s+GhUEsWMgPpurww4l6RAAWuSllbOUdQzpvmd74LX20fFCf1x9Y8?=
 =?us-ascii?Q?ZDbMpq5LX7ohNXfG1Izm91SXQeNa04dozyk5EStZQp1PIq006aXw+OaCSXl4?=
 =?us-ascii?Q?aWfaPGDHTBZDeDJSXqH0cH8q2SNSHodgwdYGqTFAaTHmeICOo5SzATJrbTo9?=
 =?us-ascii?Q?HtIsaG4Oeqe89JqhMHKoLEslqTxmfs9sXjPie8OVCU/ne/vu2FxMAFCaaQhR?=
 =?us-ascii?Q?AfX4uhRGbmFyj7PpAjp5bTYBnl1nxkaggUL4TmouDMFFIxF6mXlhoETfpdkg?=
 =?us-ascii?Q?iTYfyYfZFXJizCIXu5HSzaD70Oi+sufdduULQelKwv8XoU/yo6JhO6OVESrm?=
 =?us-ascii?Q?cPOHjm8qwGD6pm0BJGvRDXMhNKmcO5FhcghDL26lqDMC4rMWJjLpyG093dOY?=
 =?us-ascii?Q?E5ndh/F5zyMgU6CbSrD1CxREKgAW3LBSGbOHQxy1ESSXyvwHz22Vcemb0VKF?=
 =?us-ascii?Q?mUIn3s9F/sMsxcCSISCqZX6jYlwu6H2Z7NDQjrmL3l3WW7nTeqT+wERyh9Tp?=
 =?us-ascii?Q?gmEqMriFUx0bme6yc9Iu6yw1A+C2wsYo52PdyhA0lP+soty69OGyt3JRGk92?=
 =?us-ascii?Q?IgU5DUP/8qQXeVWmHWHmZgJXXJaGBdzzFyqfV16G/sYC11CNSftmwFbxrxTi?=
 =?us-ascii?Q?EEAP+Q/yVczOhh7v4hn0UfX/iTnjwQ63MXsvhi7aLRwOc07cVPx3bawlCo3s?=
 =?us-ascii?Q?48yj9a0jqdje+WgFFz9Xb1tKZwhgn59em23qGynUwi/5J9f5s5YzMjTHVFBJ?=
 =?us-ascii?Q?3DFuOGPgbHIF/f7lsrOC2SY0gOon7ZxC/FQ3ED8Mu/n2/t7haxPF6KUCdm0R?=
 =?us-ascii?Q?ZiYGjKWAObd302/Fdu3uNHnmw+au3gkLZrHug8WekFXjZkDClUjql+AZ5NPK?=
 =?us-ascii?Q?srEFcdUz67HqLvaZgNew+l+ry5tIAk2ZsEDXYsmd3LL7unzCvEskPW2ERIOx?=
 =?us-ascii?Q?T/1taE6qECjrW9tV5U/COkZNxILqbQP0ftAbDQs2fdwOKJ3ya4fSuBkdxSvu?=
 =?us-ascii?Q?Z32wfepooBTo8srbbEYkCQy53l1B/gA4J3AdLST4CGuWhcSRLCu41tyht9L0?=
 =?us-ascii?Q?yk4A5OKeG3iCd17IaYORzgZEJMboPibwbdKIh2OzBLksYAqqQH1pJVKBLYzD?=
 =?us-ascii?Q?bQ0uxkONhuY6jeYN7onWSFLdbzXXMBWBHXnH2wfSRTYiLhBwi2/spCzd6JB5?=
 =?us-ascii?Q?0pdk6vDhS4uZMccCudY1nferuL/86kvTFxkFD7py5rhd57XLhJ52?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6288fb-63f1-4484-ce16-08ded5bf3f66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:17:31.3502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZoBHMhNvuA8XYIf1HILqPEujdX4h7M9lFQdfjJtIbAU/YdyfNRtDBcSDYpAfvnkeQObisRWF09N4SXHP45vp/ogp52Yxu/HsgkriWryuH1VAZwsD+Cq1V9Ap6JoiFac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_021735_481693_E33F14BD 
X-CRM114-Status: GOOD (  14.34  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

The tuning save/restore during system PM is conditioned on
mmc_card_wake_sdio_irq(), but this check is unrelated to whether
tuning values need to be preserved. The actual requirement is that
the card keeps power during suspend and the controller is a uSDHC.

SDIO devices using out-of-band GPIO wakeup maintain power during
suspend but do not set the SDIO IRQ wake flag. In this case the
tuning delay values are not saved/restored.

Remove the unnecessary mmc_card_wake_sdio_irq() condition from both
the suspend save and resume restore paths.

Fixes: c63d25cdc59a ("mmc: sdhci-esdhc-imx: Save tuning value when card stays powered in suspend")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 18ecddd6df6f..6526d65538de 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2064,8 +2064,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	 * to save the tuning delay value just in case the usdhc
 	 * lost power during system PM.
 	 */
-	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
-	    esdhc_is_usdhc(imx_data))
+	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_save(host);
 
 	if (device_may_wakeup(dev)) {
@@ -2124,8 +2123,7 @@ static int sdhci_esdhc_resume(struct device *dev)
 	 * restore the saved tuning delay value for the device which keep
 	 * power during system PM.
 	 */
-	if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
-	    esdhc_is_usdhc(imx_data))
+	if (mmc_card_keep_power(host->mmc) && esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_restore(host);
 
 	pm_runtime_put_autosuspend(dev);
-- 
2.34.1



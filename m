Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC44FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q622zyMNs2j8cnG0tQQFXtFdGXXXf2Lnlq8urn13IfA=; b=zzSe97kKG6pbSSYTTu/sbQTs+q
	enhFK6e8cLgNSum0aOqeBkwMHy/NUID3JBYeH+pE236cUFKyexXN6s5AcM52zKJf2HiF+9J/wQPe9
	VWX0j5wSJKZJHXBw4kPjEv0ZbDKA860mrZabqilE5XdMEr66txctXsOuzrSDiiFchAf9ReNNsTehX
	++uC/9cXue3mmTeKUCZ6VRMo2G8Bx+602CAw1ngFv+0Gi9ndx7D8I/ebHiGt/oUcmrrd1FtliU1Ec
	37zCiO7HfZa7zAFqmneKfgR7ndyxxPXRmxG6+lY3vlw+ueLItWMZvbTLZ7A6onL3+sR5tG9NfEgLK
	2WKAKfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbJq-00000006gJj-1c1l;
	Fri, 03 Jul 2026 10:40:26 +0000
Received: from mail-francesouthazon11011020.outbound.protection.outlook.com ([40.107.130.20] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbJn-00000006gGK-0LYl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:40:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOabVZW4BmPnuW7OlYgx1ZSUTGx/NYA+r4aeCuqGKF9s6hyZzbkq3s0s5B0NvM2Mfb8CGHueD8kP3hamQWmiX7oUf70CyapbtRKuEZpwidx9fGFleWQrlmivqPxFX2LMAV80+mSTQ5jvwSeQTUzF9X8rRawFjeqMfw6ohXgLzHCly0/dmsUK0b4PMANPKqhKUy4gR2DJFCZtAtHKIY9Rl8M5cEmoXNjhF9RcLta5yCRlVCM1w82/MToUIROACccAGVDjGbSu1m/vvAIk8mCgdV13r1rJP3Pu43ZoTmxgcUsKGFqGdRGTfpomR/1z3nkAeNoUnCxdY3nMhNvZSvW7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q622zyMNs2j8cnG0tQQFXtFdGXXXf2Lnlq8urn13IfA=;
 b=dmKPgSgs9j7UCVWRq2BZa6v6REK+T/5t1XZLpI4A+78vYW85No5BCaG1zmw7EVsHQbT5Wb/lvYgCghWNo7A3EImsy7OOIp3QAIKA29D9tiGww+oYyw21MIz3FRpdVkG8xGQr42Y3cuGjEyVpzj/gDOlLeyaLLcGSjvZ50/3kXU50GETgNqsMd5gtErEysNElqCRMR0JgEBxzdOJia3ZofXe1r9WYhNp3L3qktJVv2fPnxU1ggF4BzPeNrNcPxSN7geP1mv+98iSQsCZdov/v7pxQp5gH41vCSR/9ni8jgEBqW3H43HgUg0Adv2QT3zeCjpxbElf2bJiigb4Y4GqDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q622zyMNs2j8cnG0tQQFXtFdGXXXf2Lnlq8urn13IfA=;
 b=YC7RFMLY8x43k68P8Qp6VvUVQLRjBdyQzlOKvDTt2EJVaALLlvjTvW6C3TtcWbJe+uEcBCdRMV5rLLcYkYULyXOowhXJrDOno9tKtFWKqB3Mn6QdkY8/0MorCJcjWKkmCbiuIrifDTK2TljQbqrzbumpd1ehq5nyTV4jwwLACs43J2pBvvq8spR4iZIrmjYSwofqndMhlNlGN4UoGKTr7lAjSy2mSZtUcbcF9vCReRdyyuP1jJjV0Vp/XJcTHN3JfdYADDvSVEsZFEIUn2ZphGMVQtBIKmch1GaSS1EmqZ103TtXIJZujp7ncuKKfo8D/JDHufPhBF8mHYUlXV/YMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 10:40:19 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 10:40:19 +0000
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
Subject: [PATCH v4 6/7] mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
Date: Fri,  3 Jul 2026 18:42:07 +0800
Message-Id: <20260703104208.3426374-7-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703104208.3426374-1-ziniu.wang_1@oss.nxp.com>
References: <20260703104208.3426374-1-ziniu.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaf90b4-3ff2-44f7-cef8-08ded8ef7a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|18002099003|22082099003|56012099006|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 5zWYHl6Ekw3FaBI9HdrrW9PDCOOJl2QyTjXFqt9t/GQgMvNVyHAHxd+wbLkLie8oxxOFBIpz1U1ME5WW14fHy/Z2Uc31t7/zbotlLGrQg+BKQuOg2VD9Xq3TVk8wSOHb8gzXXszAYOy8EUo8n8DF7Kahm1xlUaikbQPS/+ZKX/9q0xSF9t8pF9SazfhPWH1abFTkgosbQOc5GjORETBC7JuCw9M6dsPypbYB2dM7K4sUkxrB4G2uJI/Z1sIu4CEx678LgJtOBHh9Pch9lYlvPXOxpeyyo6NvheAa+pXt3jqE4QhtKmbTrHT30hf3eb76evRhzSTOkL27YCvlTKRuMeZubTf/EZOB7R0JCEjQ4eZ3glFGM3Oxl4Hb49cHpGgaJcoHB44ezGCRz2Mw4vvcW3ZOmiQijyKNT6U2mh32Nr9Cw6NmmBvpk7Q+Aqxl1UHKknhEn4949xWVqG+kXHhqtU8mXUYmbgRFIdDQbLxNf9xGtygg273AJpPQnb/8rOfHLu8l4ilMuADZZI/1cZaeeGzt0K5qtVM3z7rr6MtRovtJJFfYbY41+9NTeLPX4xh4hyIbN3lrubJwS6xm0zHv7SkmJ49LyqcaubzzPgsKL8JDEjYa8hqtCJQrkUZfp9Vfo4S3Iw/3lm7AEDrT+gcN8XU5onXPZOEdHUMQuXpskIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AiUcrOrQ3ILVl6p9OMsnK8r0Y0jGafq+56C19REymvVoCVKtXjamjF+5lu24?=
 =?us-ascii?Q?XFIPdmdYQQt0yJNEy+zeEVMxg/g/gEPrcsc02XNC39pOpb6pnuZTQgfjG5AL?=
 =?us-ascii?Q?34EFcxgaAag//Vlsf3Aig0W2vG9UnuIsr1/ck3Ki3KVfa1wZkPcdKWeo7Coy?=
 =?us-ascii?Q?UA+bSRm47oG0VLFrzJJqkXU74IyBesQNJKnGoOhgk83N8bYQMNEYjLTRSHjt?=
 =?us-ascii?Q?VE/hgzi9iLVTF/JyNHS2XS29s1SluXbKSrKD5lGZicttFzpMq7zpRtVQjp+l?=
 =?us-ascii?Q?WJRTuD0BCvc/VKB2i2tMm7x5J2cBBd+Cw4qR/6EC//NwF2aI8R3w9tckYGR0?=
 =?us-ascii?Q?YTzde5zFAq1cYFV7DaeEl9ArYSC/n6SwNxvOjA1LVGp4oyy5dxuXCzduxZBv?=
 =?us-ascii?Q?dKhUIgtkM0dp4dnJB0EFFE4Q9+EHV4lZUMvQ1zCIrEhVBHTWoN1NgpGcFFJx?=
 =?us-ascii?Q?sD1PSWRosOjMOxyeV2wWfbBpYrtna8NvzbP8i83vm58YjasbEwcAzJr1b+1r?=
 =?us-ascii?Q?tyX0OY+AJmgxZgeeK5dbLk/DpS6gB6+nPAJAHOlBNWtXSOHb3URuLTeXvdJD?=
 =?us-ascii?Q?gYNRqpsjdt9LF7tsxWpQOJOyGyyBGBXAJQ12IoSWJpwrso3o1QhOT0bNWTr+?=
 =?us-ascii?Q?xwHImy+VmEGR+rMjeyorLtafCcCqzeCQd926UyALh2kJkmNrAxuWeVfMFRF3?=
 =?us-ascii?Q?NoXz/9v6QY/AYWv37nWFWUMIFHXcX0LzlAGGqBKTNRtggNHnvHeML4s7vOKc?=
 =?us-ascii?Q?VIwp5RKGMp9H695JSZqlF1EOyXB2r0SxFHeFYLrNfgrVRS2aAoJdRdz9Cfcy?=
 =?us-ascii?Q?zaaplyAZICCV7S9cV530YHyuJIHVkAQXrr/RHYDPQlE3eBFhx4RFi/JfxAq6?=
 =?us-ascii?Q?adepQWEk22q2SSk/o8Z+0pqVfY1/Ym5hYxpP/NACqlzttD6K86ihSAMudcvY?=
 =?us-ascii?Q?nPF6GZ6Q4pT3PSvd4/3VFRf0GNSY9xQ40Pake7cQpFEx3WfDsgOit6MQkwUq?=
 =?us-ascii?Q?ZGJtMmIgxXTgtWdfo07AujPTpMfTumAqNuq1k0rj2NleihkxwUarcNkxHXwS?=
 =?us-ascii?Q?F45HQs5ZG55UCMc3/p1KNQRda4tcM6V0chljSug8vKkDefQvD8pbBqOQ+eex?=
 =?us-ascii?Q?5MbWQQql10vRTwrxklG0VYp3RW8g2Vj5ZZcHYrpfzoCJ/AWZfwnv0RDd7EE1?=
 =?us-ascii?Q?6MijS/FsKRmo30XngzMDyAxr3UlUjTH77697vUurwlf0LAjGT8Qf/8K+9FFB?=
 =?us-ascii?Q?m+9hsbAOF2hf66PT07lpSTGJ/OrrVisFnWgQJMat6laptQt3ciOCNMgUqW48?=
 =?us-ascii?Q?iKkF3kIQsCFYj+Is80IxF0rkIj4ncuyzTYYjMI6WgzHI9cK1quKqu3izrUwC?=
 =?us-ascii?Q?qKy/mX2sl3Y118y9MPA8Lbaj3cIPEWGoyiHUiqxgEa+0u9Q2m1/647BT9S14?=
 =?us-ascii?Q?yajvxw3TK5fwDFtXTvrKmFNB8nolS3mGmBLZg4Zu1vvTb5qPm3EK+pWh21vV?=
 =?us-ascii?Q?JlDNQPrslcGYF1Nr9jrsSyNUkpLPAOWx8aoPpAddRiTKfn1abzijdfeCgPUI?=
 =?us-ascii?Q?yBgQDFT+1iJFxUnavceZFWTiHnCtIJ9iogLFTIpMEhOoa0nYmZ194L2pIvbq?=
 =?us-ascii?Q?ECFDgDJogO1750xnQyD/eoOhC+O46xj6OrBOdObynAXKIcDWHPKXnSsETo/J?=
 =?us-ascii?Q?71hmt1xbdxU/ttoXQHGI5FjXN5LMEionLwxxAad919jstidmMm/NfBW33/kV?=
 =?us-ascii?Q?Ubs5ZN3d5zVichc+ZIyz4mlV3uUrk9y/PRnS7bmI6uXwgHQv9npZitq7oVRb?=
X-MS-Exchange-AntiSpam-MessageData-1: O7sA/GpwlUpT6Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaf90b4-3ff2-44f7-cef8-08ded8ef7a19
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:40:19.1555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tJHcDwuhkl673npKh6TLETFlTVcGuBzs0yc3sBfhMt6r29ZGJEsOwM4rhbIeOe8nca5MrTqDRj7yIVmD/7YtBfo0EcWhxhkhcZLmk9nykAwUETKPIGkbgFxAHkjupek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_034023_127013_A97E3B4B 
X-CRM114-Status: GOOD (  10.58  )
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

Make pinctrl_pm_select_sleep_state() and mmc_gpio_set_cd_wake() failures
non-fatal in the suspend path. These failures only mean slightly higher
power consumption or missing CD wakeup capability, but should not block
system suspend.

Also change the function to always return 0 on the success path instead
of propagating non-fatal warning return values.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 30aef7bc1fc6..6920f0425508 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2095,10 +2095,12 @@ static int sdhci_esdhc_suspend(struct device *dev)
 		 */
 		ret = pinctrl_pm_select_sleep_state(dev);
 		if (ret)
-			return ret;
+			dev_warn(dev, "Failed to select sleep pinctrl state\n");
 	}
 
 	ret = mmc_gpio_set_cd_wake(host->mmc, true);
+	if (ret)
+		dev_warn(dev, "Failed to enable cd wake\n");
 
 	/*
 	 * Make sure invoke runtime_suspend to gate off clock.
@@ -2106,7 +2108,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	 */
 	pm_runtime_force_suspend(dev);
 
-	return ret;
+	return 0;
 }
 
 static int sdhci_esdhc_resume(struct device *dev)
-- 
2.34.1



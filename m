Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EBECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytNhmwKoq2hoUcrJyT9B+jeayMs1ISQPC5QX7UeAkc8=; b=xdJvFX6Wcj5jgVSswshoLIdRZO
	sGfoefL9/cZVILzcrzhsdLxbRv3AE/2q1UHljMB5O0/B1RhUz5FWgWgHQ494HF05dzNjXwQF1iENI
	vV8R+d7rCUVzqetYaI+lF87HU0SLySJFIRCUzVr15R9hVrvJKYTDWgTpSyXqQGT/no6aLmtLo6SiP
	PuRoOiq28veJ/IX8qGGokg3KPKs1nG1cyOMuiHPjc8vyhTOyqsvIWRyFJ6x7VugWapYOv2XuFseCX
	82TdM8ouzdpbUsVF6nkUFUiKE+tlaeYW3bl2PoAj7AFcmGANON1DCigfxT3rb4YZqw504ZeAmcbZD
	lwmcr0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uys55-0000000Bdjf-068o;
	Wed, 17 Sep 2025 13:20:19 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uys51-0000000BdTC-2Y5a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:20:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHXRQF1UOnoF08iUwDTyz82e0h/DtCSSt+OAxOjibXzsAxLYtnNDiV+ECxdBWf4Uw+mNkJ8SZtD0Z7DJet731OaNIYUmO9n7K4V+sW7aFPs4OXan6OprQw5cXPhpTlieOGmc1D6Bgf+xqUcVwDHD5QVjDPGgHqA5E/iOs2ZF5xA/SHo8oaGFqa7qga76vyckpSLzl+658bbPLwXKZbffDfmAcW0f5UhBzOezQg7Oki2Kmj2yNQ0FrWOWfU3INA/BB2YJAuYcRhoTDYvQG9F28JYK75aOxaa3W0krF6DBhpAb8n8xMJUGHz4sjH7xcR233dgPXbsUhD9Jq4X/Zvtw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytNhmwKoq2hoUcrJyT9B+jeayMs1ISQPC5QX7UeAkc8=;
 b=BRlR8dSCSuG/7ojjF3I8WpD6OtJt+qkiFILbTBx+P2eAfedcN5U+FcnUp3WQ/AH6YnedJncw0Ekuhs28j8MgO4c81bbTXp70oQfpL1L0NoPQwUOnsOTQYpGzquZ4/dpKhep3jWdyDDaQC6vP8NCii7Jz1oaoW6Qquplp6f3BsT3vkvcBL5ws1K35CHS00cCkmaisBijXPRbheNd9snrYTnwCvz3dvEjRghBaAWfnC6rI/o24/sNl5Ac+tjXNy9H9b6uG7eYh6PwOyVKX6Dg0l8HxDoNAPtoKsKgI+Fn4Aex/0+ei/BCdy6ksiVc0cC0Vylcc0B4uKRPgRrCYkCA41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytNhmwKoq2hoUcrJyT9B+jeayMs1ISQPC5QX7UeAkc8=;
 b=nUMyK/v6FbbRRYpr58UGNnAdQEzON9aWJGsz/AedpVnRokmEoNj5fGgM6eow99fcmtRTrdvHbMPxjCU6QpbsMvRDBT7NSwypFcDdVDBsVU6WrlSznZk37CWYjB3UVNJcGQ03COHxUu7Wja4QXTbsmIr6iPK6qgFlVG/GQUTCVmE1jbNhJ6bBqZvRwK58rHwekN95RIXAEGD4Yhkucu5XGiiT/ubrtM/2vQFI3qdRktSaW78nQ/R/WZCXheFxUI0Gpy+75w0GJuZToqECeSua597rdbi2fSlGOYI5gCMptI4osXyWdWzArcBtdUyNQb92fnxX7XZ03BGeHUCzd96dow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9751.eurprd04.prod.outlook.com (2603:10a6:10:4ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Wed, 17 Sep
 2025 13:20:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 13:20:05 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 17 Sep 2025 21:19:18 +0800
Subject: [PATCH 6/6] remoteproc: imx_rproc: Use devm_rproc_add() helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-imx_rproc_c2-v1-6-00ce23dc9c6e@nxp.com>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758115170; l=1592;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Uv5HmboUetc4ez8TfIwkqJtZysoxuBak7oX6CJuhJPQ=;
 b=0GRlqZycCm3A43/FuD2r8GcNKCrBED4QMiz+Bp8cA7aEBh6FOaYn1xROj/38IaUUbP2IjO99p
 bemMyBzJ9/ZAP0dVVEJ70j6UFyjiu0Ic02bdpbOXIkfnR5/1L8PqbWA
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a87671b-7754-43f7-5467-08ddf5ecea71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2JPOHppQURVOHdHeWtNSjMxRncybHZsbWJITHNQVitXRGVFbHNoTnRva0FN?=
 =?utf-8?B?MXIrNTEyNG1YSkthWk8zK2VML2xSRmtoN0pab3RDTDBHWmlpWm4zUTNXTk5D?=
 =?utf-8?B?Z2h2ZmlFaE5aNVlialJFRWhDb0lCZDdBa0I4dUNyV0Q2Nks1dVI2SnFpeEgy?=
 =?utf-8?B?WmhvdlBUN1RDVGlqMjNxdnZIeTFGNTYvb2NFa3NsS0lZTkY3d1hPOFNlcW1S?=
 =?utf-8?B?Q29PVG1TYjdHRC9Fcmp3ckpGYnRZM25jVHlvcFowOXRtaU1JaVJ6d3U5MTls?=
 =?utf-8?B?YVlad2JEcW1JMzhLYTBvSkNuTG5aenQxcWZybWlLOVhoWlhoQzUxeGIzSUgv?=
 =?utf-8?B?N1VDVTJyY24wd1hBZ3dlTG5ZVEpXeEltU2FtVDA0Y3RhL2h3eFI1dFpKSURl?=
 =?utf-8?B?L2plS29rM09XUjJEUmZqSmNJYjRnSW1tY0liNlJ4ZVErcjVpQlc3bjJmZWM0?=
 =?utf-8?B?RFpYTEg2RDR4S3JxbDd1S0JmaSttT0h1eGtxSE9VTG4vTm1FU2N0a1E2WHYx?=
 =?utf-8?B?d01KbkltMnp5QUxGTEE2M1RsQmQwNmJlbWFrUU5YaEpmdlpJdHVvQVlmd0xr?=
 =?utf-8?B?QkhnRmhGQ3lVNmU3NUJpQy8vMU5oNlcvZHZyQldiK2pxZFYvRUZZL2w2Q3k3?=
 =?utf-8?B?K2o1OHhTblJoLyt1V1NQYWVDMDM5T2FjV2JYSGFJUGJmaWgyVWRKMS9nN2Nw?=
 =?utf-8?B?MG04UUl5WUhkdWpUNG5aZlQrSWU5RWJCbUd5TUNqYnNsZHlkL2U0TmtnMkR5?=
 =?utf-8?B?aTc5WXRnWFBYNjRNUUs0bWFlTCtqOEZvRVo0L3JSVXhuZ2RkOFBVdGRRT3pU?=
 =?utf-8?B?NHlFa0l6N3VZbS9rNGZtemZkVG9aUGMzYnhUNS9zSkgwcFJEaDNXUGI2cENp?=
 =?utf-8?B?cHVWQ2kzeXZ3c2Q2UHNJdHJtQXVoSXJrQ0w3MEVwM2xIeEZISXh1cGdVOU93?=
 =?utf-8?B?T1A2UXlaY1NEVDdSNWthSG9SNzR1bVpCbGkxU0YwQlhKbGhGQWlTL1Z1Wkcy?=
 =?utf-8?B?OXltakpKUUJ6cWFWSHN0RHE4V2FjTXk5RzFnMU9GakhFeVJnS2krQ00rRDVs?=
 =?utf-8?B?ZEhqUGYxY3Y1czJpK29ibVNuZlBRcjJ3R0FXVVVRTFg4V0NJanRsdCtoY3JS?=
 =?utf-8?B?S1EvTUU2clNseW1sUEJUU1gyb3c0U0ZGeTludnFCelpGMGQ5Vm5KQ0EzUnhN?=
 =?utf-8?B?Mk1lOHdRZmNrK3diWHFWVWdBbzAxaVkwYUIxZXpsTitqNTE3RXBJQzZaeTN0?=
 =?utf-8?B?eG9XdVdTb0NRUFNXdHpuVXZCVVI1SytkV1E4YUFFOUJQR0dKWURoNHhuT1ZS?=
 =?utf-8?B?OUM5dTQwQWlQbytPL2FZdmFWWlVabEo3ZEpyT3VjcDZTVGVNNGVYcmxzUWx0?=
 =?utf-8?B?S3lPT0VyblVKZmVqL2pWV0REYUh6ZWp4M1pndFlLbFlOSHRYS3VxV3ZNNEZQ?=
 =?utf-8?B?c2xjWlUvbjhOTVZ5eTFlS3UvVy90TzZFVFNEc20yQjBZYUhmUG9uNDVORWZ3?=
 =?utf-8?B?bTNPdFp2c1o3Q21IOWkwTVZFVmRYVWFzSHZJcUQ2ZlJRQVJWTk5WVGFuaTJj?=
 =?utf-8?B?NnZ5TklOcnVYY1pQWDRmNDNUVFZsemptZjVtUFhBa1BaaWRVQlVIZ2hKYkNV?=
 =?utf-8?B?NXNPU3RQVUlCMlowVUdWQzc1V05vb1IvR2s2T2ZrYmxSWHlKUnRER2ZMUERv?=
 =?utf-8?B?cDRNTnNESXlrVEdiRWozaDBrY2pvTEJxMkhFaDBUdTZEQXhlekJUb2FMblNs?=
 =?utf-8?B?SHc1dDZ1ZG5ZdW15cFZoaGxpYnVoaFBOeSsxRjNUQVJrNFZneFdkdVdsMGYr?=
 =?utf-8?B?K29LWS9NeWEwR1RCQllUWDNWUkFuQUV2TU5MdmFFZ3llR1VkS1ZFVThNaFNv?=
 =?utf-8?B?T0JwRFhITmcyZGZRTjNtc1oxYk9RN0MzMWI2UFlmanBsRnUxeGxZY2RsaTlm?=
 =?utf-8?B?bW5KVWJzOUhLdVlVMkZidkQ2bUNwUWxKd0tLdFFtaTNhWnpzcTMzVW03b2JH?=
 =?utf-8?B?L1ZFU0l4MGdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRMMjhRbzhSRzg2T3R2UE11S3FiSklIRVZwVUFONzdsaGt1a3FtRENnQW84?=
 =?utf-8?B?elhxaUhwNjBMTEJFakc0c0RHV1Z0ZHBWV0psRXl3R01RcERxbjlMTG1VbDhi?=
 =?utf-8?B?c0hSMHA4RTliWVNPUW8razBHNGV5MWdSNVRDWFJ3NjArdk1udzdlb2VpbHZj?=
 =?utf-8?B?NFJJUy9xQ1lIRFpPRmtZK2swcHVhM0JjMzFadERHaXk2T0xhYXhISzNGVjJV?=
 =?utf-8?B?RE04bENURjVOVGl5UVN1N1FUK3cxMWlKMDNkaEkzQ0Ntdi9aV3RhdG43bElm?=
 =?utf-8?B?WkU1SWN1a2ZHV1ZGc1dhd3ZRUE54WWJSSUd5T1kySldNZFJDYzgzT0pYekRj?=
 =?utf-8?B?Mk1XSVZSa0M4RFJYdC9oekl6Q2YxLzRpOVRuei91WlhKMmhIOW9LZWZ4eEg5?=
 =?utf-8?B?UWtLeEFlciszRXZtUytDSUphQkpUM0I1cS9DTWJTQytTOWs0VVVMeXczb25t?=
 =?utf-8?B?Si8vOEc5T29GbTFHb2owUlVzVE4yckFvd1pGYmNreW5xTGZnd3dvNzJKTXE4?=
 =?utf-8?B?REg0TnZPU1hLTmdMYnkwUnlub3VWaUhxUVRiZzcvelR6MnlibmZQUmQwNEdo?=
 =?utf-8?B?TnIzdVRIOVo0RFZJSWhtU3J2MlA5SWhYTWtQRTQyWHRTVGdCdXdqSmdhNDFr?=
 =?utf-8?B?UnZxcTVzYXZwVXNTKzNjTFpQRnQyZHorODNQVGhIL1cvenFOM0tJSWt6c3Iw?=
 =?utf-8?B?N2N2ejlyTks2ZFpoOUNzNzZoc3doaFFKajM1WVNCcW9XS05Ob2lwWFg1VHJa?=
 =?utf-8?B?YnlMS09SdklkTlg2Z3c5aDd5MlhWM1VOa3VMamdSYzZoSWhOa3k4akR4cDZL?=
 =?utf-8?B?ekpLdXdZUzc3ZzdlZzdmYzFyem95R2FCeGtzT3p6M3JkUEpmWHVja3liaHh6?=
 =?utf-8?B?N1RMYmU2Vjl4blVSTDJaNTVpVU5hVnpTQkxGS0dHTklKM2pPQnNVcEdBNXMv?=
 =?utf-8?B?Ukk3SitZdXBPTjdwWXNOSzNrdmU2VkFQRVBWUzhjczY2M05qNjZqUkwxYUYz?=
 =?utf-8?B?NVIyMVFMb0FybEJ4ZVVrVjRTWTZRUGRJZHdWcklxR0lnMlhFb1BXR0JDQXo2?=
 =?utf-8?B?L0xiT0xidWlyaTdUZGR3VmJBMnp0M2t6QURadFVNdytIK1RJNWFNb3J5bWNX?=
 =?utf-8?B?c2tLT014VmRobGxjaUtoa0VUWWJRQ1NNSkFuYUgyZVcxNW1FeENpcytjZU5S?=
 =?utf-8?B?cTg1bUpkamZVWEllM2dKbEJpRHRtQXdXT3BqVHg1V2FIVU5PeGFvdjlQcW9v?=
 =?utf-8?B?RlA5YTRmRHVlN2N0empIRS9Jb2MwMFp5cGc3LzIrVVN2eEVkY1c5Y0FxRlVu?=
 =?utf-8?B?NVJ5bFZ6R0kyT0ZzdWlLMmJEZmVPZWo1cXBZWjc3YjhSM05DUlh5UG9XU0xS?=
 =?utf-8?B?Nk5TMnBiUUdueDlVK2d3cEJxZm5EOWQ2Nkw0anF1M3lEVWowTmppRUdmTCtK?=
 =?utf-8?B?N3dKcUZnSnVENUVwVmlKZkIwMDJFZmhhRDZFV3BVaXV4QUxMbzRmem5HUDZt?=
 =?utf-8?B?VzlOTS80R0lyNjFad2thcWhua0VVMlRXT1RLY0RCQjBPanZhazFyYmFsYlg4?=
 =?utf-8?B?QnZ3R094amFtQzJoTnJuckkrTHdRM1UyREhCdy9DbitFakpuK0V0eXJrMG1F?=
 =?utf-8?B?MVlZYnBZYmdhZmNpeHlmcGE4NTYwd3g2MU55enNDOEllbEVFa1ZkRVR6MTc5?=
 =?utf-8?B?UDJkR3QvVnR2bm9tOWZyQlB3L2FQTmRENU14N2xSNjl5MzBDWWNseGtZSXFU?=
 =?utf-8?B?Z05UQmRrV04zZHdxMTUwOU5UbUFoMTdxUGVDZTBnN3diUzFtaG9zVklHQnAw?=
 =?utf-8?B?WEw0OVdDb3pPZU03WGZpQlNuRG1SeExPNjczNngySDcyNUtmWGpJQ2xZaGIy?=
 =?utf-8?B?M21uOHBDMCt3UkduTThoT3VRQVlycWFLMTVCRnhwOHduTFZwUDArYThCdFpQ?=
 =?utf-8?B?d2NReGk4OW5pR0cycnREeTI2VENMVmZma25NUEFnUkFVQjhzUHl5UTFhOEZr?=
 =?utf-8?B?UEphR29iYkU4c0trc2NmQ0ZyYUR3VHRoc3AwemlhVE5LNTl4b2c4YlJmWExr?=
 =?utf-8?B?NzEvWWhkYTI3b0w4M3VUaFRVN0ZuZ1JudXN3NVdoQ3ViUlg5Ty9SWmJPT2tq?=
 =?utf-8?Q?PQ6EgteCGNEXmsRok2HDfZfpO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a87671b-7754-43f7-5467-08ddf5ecea71
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:20:05.2577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4kPr5r5KqFn+x3FTYaJbzDP/ymCSLBPFjY7hYUhsfv4x/t/sG0r5Z7sDGePB4VFyp3PRTmRAQVCr4E4fQbL/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_062015_730314_557EC116 
X-CRM114-Status: GOOD (  13.26  )
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

Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
ties the remoteproc lifecycle to the device's lifecycle. This simplifies
error handling and ensures proper cleanup.

With no need to invoke rproc_del(), the remove() ops could be removed.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a53ff186d218f54123e1ce740b0277a6fe95a902..694fbbb2f34061de22a3a815f8a6114159585f9e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1149,20 +1149,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
 	}
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	return 0;
 }
 
-static void imx_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-
-	rproc_del(rproc);
-}
-
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
 	.start		= imx_rproc_arm_smc_start,
 	.stop		= imx_rproc_arm_smc_stop,
@@ -1288,7 +1281,6 @@ MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
 
 static struct platform_driver imx_rproc_driver = {
 	.probe = imx_rproc_probe,
-	.remove = imx_rproc_remove,
 	.driver = {
 		.name = "imx-rproc",
 		.of_match_table = imx_rproc_of_match,

-- 
2.37.1



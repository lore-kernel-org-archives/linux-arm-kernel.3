Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16E5D74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 07:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TwUUrV4VCzATI2kxgWcJUXT/POlqE4BLts6ceF0FiTQ=; b=qKN5w/yVRRh5xo2TSiwty9icez
	tByiSk9mzYroAh6AyyVFNLne2RNhsJhTxAgVpUuPGuMWZIzbO4cUmbJUEf2GTDXywzhwz4bDrlR+l
	Bad4h480tuomt9fMPaAph8vXhfKugzzoWRxwpdhe69R6BhGSD5VFKxUTr7tFn3yG2f+EfomCGobyQ
	y7Q2Iyw3gGKO9qEYgObjW4dIl/73UhIqf0nCvpIH7uBuILlrMfbB0Bbcafd3ddqYH9oBvRql1VTrh
	BjCDULswDzhzwZ7sYzsaDqe/D1mep5jqiI7jVoaS3C6A9n5gt3NYeAcgjkc9zWLUk1cMXJO0ickc0
	8F9WGw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVJA-00000009mq8-1XLr;
	Fri, 19 Dec 2025 07:53:52 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVJ8-00000009mpQ-0AVI;
	Fri, 19 Dec 2025 07:53:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMZJwd04HwXr/2zq75xyHp91FaGwau4og5BXGNRN4Z1w63LfD7W6dBJEMXvvH2RQXLndr+WM9qRpHC1NX/h84y7LfGCjf1/HQIc/CSoni5QjAj65usOo76IF9RAv+2Cc6Ty7oGmRUCPO6UXwYTkXtt27NuJUT5Dig+XiiwQS8SlDNgltgmWTCOwc7d1WJK0twTsuw4nmYu8IbgkVMRzETUozCxXKe2e62P4LdM6dp5xJ90hVGt1ImUfkVnEVaHkcz4+pta5Jk1T9Tv4YrFrx+MpbiJyXJyaGMzGuox/iACZsQ6jARwakkcIhB9lMCBOvsdHexWTb5Ts5vA8XhJFwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwUUrV4VCzATI2kxgWcJUXT/POlqE4BLts6ceF0FiTQ=;
 b=VUSrkEC1kUwfaJovNCkb2rJ7S2zbcgan0+j5fKA8tuzj+fFmMSlL7rsVfUE3MqMQKFpA0JY1QV+102TAheL/LLHlBJ1HInkQijvvJW4cw3WZn3WLB3qFPKTFJIarrRxKOFR/yJ+fTdqBkh4IV1IByljO62PUDuGA4NmM/jPHQcfyOkyibnIcm3uEhKznIB56NL0usYuvm4b/5rnLuUlZgGW5O6SYNeTxSmTqhrxJQJuZt8r5tRxaX5jRmHvfUGcCOm5QCeH16GyAhzxdVdjxWt/mdftTACwQZBTN5IWVqx6jr1QcyBomlecD7CZx4EBRpY0Rxk/Xbe1BDHNGk8uDGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwUUrV4VCzATI2kxgWcJUXT/POlqE4BLts6ceF0FiTQ=;
 b=T/Df9rUGN/wmwsP/HqCuaTjNkGVMEgTMCXBKlqzbWS4jBn93AcSloc4TUKZqNK44oZFiUJKmzMIyR1qWdbuOedsoTQvtFR6o1tpWe9lW4TkRlT2QDSvoqscwDtIaeCK6lBlg+KABKWMoHVcyRCiZ8993Gve1CiBwc/+JHb9Kate3EvTdFo+TZCBCWFYykRbR6Wa+b+FB37zVeLlcspVAoZ52JuNnQegVYPe+iQtrp9njYldO84NjESJ1qgPv4Y/V5yil27wygngiUiassYQVy3JQhMy0rLHgPsYH3QMmeX9YJecIACFk/K42WEmyVbBW9lqvRummpj4ys7IduWA7qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10784.eurprd04.prod.outlook.com (2603:10a6:800:266::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 07:53:45 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 07:53:45 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fsl-imx8mq-usb: add debugfs to access control register
Date: Fri, 19 Dec 2025 15:54:47 +0800
Message-Id: <20251219075447.3672833-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10784:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b2cde8-ff6e-4505-19e2-08de3ed3babd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkRzK0RzMDNaRVZoYllvTTJGYVc4cUtmWmZnYmg3b1laa3NrRU9zRVFoU3Qr?=
 =?utf-8?B?Snk5R0ZBeDFhUG4vVmk5b1RSdFRUYlZBUW92S1FjUDhMZUVOZWNyR253WTZX?=
 =?utf-8?B?OEJLVlZyZkFsWTc3MnFTY1RKUWZvTHVKNC9kZG1jNkEwREZxNXJONkJINHVw?=
 =?utf-8?B?RWpoMy9lR29uWHkwbDJNck1uNUtXbko0VGtiQSt0M3ROS1FrbTRBcUptbGp0?=
 =?utf-8?B?KzEvQm13d2E3QU5Td3RlRE5ySExXbkJsRjBBV0RUUnZFQVM2UkJ4Q0cvbkJl?=
 =?utf-8?B?VCt4cHpSeTYzU1Fpb3dVL0oxV09oaHZrbnRRbE53TmxESDdHdkhiKy9oMzdE?=
 =?utf-8?B?Y2Nza2RMejdqUzlKb0QwTnNkQUd5NEJqWkc5WUxnSTkyV3phdFdMTnB2TVZ3?=
 =?utf-8?B?bFpybzRhRDErMDU5T1JFWS9reGo2T0lncTI1RUxwSXd5aEtRZEo0SlNqQld4?=
 =?utf-8?B?OGpFcS9NNVE2dTBtc3A0b3hPM2JLd0VodHBySkVPbDJ3Sk9BTWFScnVROEpx?=
 =?utf-8?B?ZTZrcjFya0lIZG1vRHFXaDVYRlY5anFlcTBkV29zTFp3Y29wY2hDclRTa1lF?=
 =?utf-8?B?S1BpWVBXeU4yTWFsRzZITkFJQ1cvTmQ0Q0EvOTRmNDVINzk4SVp5dzJOV1Ur?=
 =?utf-8?B?T0ZvR09sNS9KUG9ydHRBT3orRkNXdEloTkRyRWdmZHp0UWNSYWxnU0dleFQ0?=
 =?utf-8?B?clZBRnNHVXJ5S2Z5MlMySkZ3b0dOMzNZRnpHTllwOEVBdEZsUHViOGszS1Zv?=
 =?utf-8?B?S2pzOUR0Q1JjcFlBVVRlN2kyMG84dFB6bk5RYmlISGlGdGtKbXJKUTVhMTV6?=
 =?utf-8?B?dEw0RHo5YVdTSXpNV3IvZ1Z4SzVPTURDV3RFUHUvVCtBdlA4Y2pPMmorWnUw?=
 =?utf-8?B?TlcwM09TU2ZsZ20reGpNUGlaZWJpenoyc3ZmbmxrMFduNVZncTBwNnlZc3Ra?=
 =?utf-8?B?NWVMUkdzL2N6RndGRXd1NVd4VWdaN3RUVTNCR0w2OEthclFJYlJFMEdacWtx?=
 =?utf-8?B?V2xFeTZPQVpyRVhZZHp0Wk93ZUw0SWc3WWowQVo1VVJBZlNVNzhCV3FiS0Js?=
 =?utf-8?B?VmZDVmxucGVld1RpV05Dc3kxSE5RNDhlVW0rTkNuVEwvUXhoM0k4YTZBNWtn?=
 =?utf-8?B?ejBaOEdGL2FvbGVpZ0dVR1Rid2l3Nm1JeU92OEN0Q3FlY1V5eFJnNnp5M01E?=
 =?utf-8?B?eXpKblBkbDNiVzE1TUc4TEEyenVKSVVtVEhLZTVXU2llM3NOa0Fua1g3ZWdH?=
 =?utf-8?B?R3lRNmpCbG1YbEVpSW1PUWMzcHIrRzBaL1FIc0UzV1pqVk5BZzdCeFg0Wi92?=
 =?utf-8?B?bFlUZkVNUUtSaHBMa0RLeEVjZVVyYWY2c0xvWGRvaG1SNW9DSDV6eU1WT3Fo?=
 =?utf-8?B?QjRLNDcxWEhHOGcyNTQ4Mk14bUI5Y3gxZDJlZ0JScUNhQi9jc3JSRFBzNmV0?=
 =?utf-8?B?MFYzYXo2SVRLMmRzWmlJYVo1TkFRZzR1SHNPYnByYVRSWVF6Tld3YTFmQW9w?=
 =?utf-8?B?MjNtOGlSSFk2Vk1nU0hZWmRYUVRBb1RaKzRjeUUwRi9oQ1UvYlNSOE1iVFdM?=
 =?utf-8?B?T2hEakhNdWlEdnVxQmVWNmp1bnZtWW9nbEZYSXovMllpNmxReEl4SUlYRE5i?=
 =?utf-8?B?V0NJVk9yV0RjT0tEZ1J0dXMxQkh3eGNtYW12dDAxMjFQNmZLZHJvWHp5WEdX?=
 =?utf-8?B?QUpOOWNCbEtWSnlxV2ZwaHc5a1RNYWo5ZTFYbkJwOU5lZzZjWjY5d1BJMmRO?=
 =?utf-8?B?b0VXMmdIdHZheGI3SGNUcU8ySTlHMnpCelNlaWkwRmMyMWR3bmFzSlVyeUtR?=
 =?utf-8?B?UTQ2R2ZBVDVkbEwzOWwvQTdQTXhsMmQ4dXU3UkRXZW1LbEZPZU9pU1MrVkVX?=
 =?utf-8?B?MENQbVlWRERtS0dlTTFXbnYzSWFRZmRvRjJxMWp1U1lXMWhjMGh3aU5rMVVv?=
 =?utf-8?B?WWdBYXJrWTVld3JlK0RtMGJ5Q25TbklqTnIrRHRjZzZoaSttMGJYVFd6M3BR?=
 =?utf-8?B?blB3YzZjK2M3L1VZVHJxdTRud1BJQy9HdHRSMXNDNWw3RXJIVUwwNGQwbnRZ?=
 =?utf-8?Q?B7uXLi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG9OOUpOZHVtY2dHZjFhN0wwMGFnd1hoL2pHMHh6V1ZvUG8zUzZsdW9WZU5L?=
 =?utf-8?B?emdpcHJRMC9tWHE5TmdnT3ZtclVhVHlLdXFnZ1lrdnQzTkFia1dxNDJnN3R2?=
 =?utf-8?B?djNzd2NCd2VtVGtxY0Z4c3hGeWtKcUc0Tmo2K0Q0QVZwYWwwdjRLRjFuRTRp?=
 =?utf-8?B?SmEzKzFYUVZ0c0lFZWdVR1dWYllOam5peW9Idm1SVElpOEJScTVJYldIeWJl?=
 =?utf-8?B?WlFXQUFEaXZuNHlpQUJaaGVLN205S1puZEN1YmdqMzZkSCtYb2VHSG0rOHF0?=
 =?utf-8?B?N3l1aVpTTDZ0VkpUUWszY2V4R0ZwTE9oVzFobDFBQjB5WTVBNnBHT1ZXSXdv?=
 =?utf-8?B?SUg3TEozVzUvK2FudFpQVDFQdU1EYmkrd09FaERHVmZxcTIwaFk0TTdlT08w?=
 =?utf-8?B?aUs4NWhrd0g5a0xFRmt6VFdBcURRL1g0T2lVRFYrNG1wUTFsekhXQ1lDM2ox?=
 =?utf-8?B?dVRVeGtYTWpIV1BPR1BWK0lldUhaT2xjSHNJQ2dXUGFZeDFJZTNOTWIxZEZY?=
 =?utf-8?B?TWhRL1AxZzVIUGM1T0oyY1hsaGVpMlBVM2lKcldZYzVRaUtrSGgvaGlETnpt?=
 =?utf-8?B?Z1VMekdrZHI1Mk5yVFNNVHhDZ0VzQU5lWjlVUWNjWW82a3BibDRIcGdIRlpj?=
 =?utf-8?B?eTZyOUNTM0VmTll1MVd5YUd5M3FQN2tsRU1HTUI1dkdzK2d5c01iR283bWN4?=
 =?utf-8?B?eXlyakNmKzd2Sitodi9jRFBVY3RFUXNldUt3ejJwZksxdjkxR0lmR014NFNz?=
 =?utf-8?B?NnFLa3hBSk9OMXd6STNURjhPY3NKaEU4VXhnTzZ0UDhLdkNZNzIwM2FqU1hQ?=
 =?utf-8?B?ZnBzdEJpaU5kVkY1TTc4RGNjQXpZN3k0dmpFWmNaTnNOenBxS1hMU0pRTGJT?=
 =?utf-8?B?eURmWkkwTjFyTDhaMHZ3QTJvemp0VFVNVVJlb1lqNFVjbmhGNzhBU2ZQUWgv?=
 =?utf-8?B?Tk83N3lMZitjL1hPdnIzcWRBaEx6WUZXczdKTWNNYXdpZWoybVlqekxWN2VD?=
 =?utf-8?B?T3Qwbm83c2pPVldyVVFneERuQVNiK0s3aWRaV1pMSmJiRmlRY2hNeXVZZDVN?=
 =?utf-8?B?SUYya3VaMmpQTmRoS2U3eUtRSEd4d3YxWGI2V1VuZFN6VkQ2V3NBQ2l6bk5D?=
 =?utf-8?B?Q0ZhN2EvR1I5OHhIMitFZmNaandDcDYwV3loY2puQlBmTWpkMGRuZTJyUTBy?=
 =?utf-8?B?MzNnWUxGMUxGWWNrQ3ZyZmNHOUs4bjY3MHRuemxiRENYaGNEbWxVbFUzazVj?=
 =?utf-8?B?ZEIrbUFrWlo5dE5YVmdSVnIxMkE3VVhSRDlkUUVIK0syMjErblVSVUo0S1gw?=
 =?utf-8?B?V3FYckczVnI0ZG8ycUxhbkxuUEVpT1piSG9veVhURGhMRFJmWFBTaWpQWExp?=
 =?utf-8?B?MTNEalUybjRBQnZzYWlHVVJOUFcyeXpBejBUaWVKemxNNGJISUttMHN4NURO?=
 =?utf-8?B?TitaZjFvZTgyK2REMW1zdE5QQVhVZEFzbVl4TXRHNld6NUVtWDJiUlVkR1lN?=
 =?utf-8?B?aExTRFVXTEFhbjNhM0YvUmRxcWVHdkFELzN4akx5cU1wN0I0ZWJSR0VUd1Bo?=
 =?utf-8?B?MmltV2E0SXlLMTZHN2U1R20ySzhoTHA2SUVvazBya1JjcUV1aU5ZbGxySWdU?=
 =?utf-8?B?MjVBZU9UWW0rcWlKOVFkT0RwejZxK3ErdjdyaDd4T2J4N3pVVFdVWTBDNUdO?=
 =?utf-8?B?Qzc1MWFqbVVtcTJFRTIrRCtlWXFZSktDWE5vL2l5bENtdzJDeWx1Q2FsNmov?=
 =?utf-8?B?dEdWZklPbGNKeGdRTDFFRjFtUG12Y3lVTmNaWWhMZDJtM3E5aldNZldYYlBa?=
 =?utf-8?B?SE1SeVlRNURUNmIxenZ0L3UzdHdXanBMWGUyVTRMdGV1VHpFQ0l0QnI3SlNO?=
 =?utf-8?B?QXdOVjlXbmFXQ0VEZVgvWmQ0ZVVRL1hKVVpWUjVUTnlqUWZqczYrL3N3SjFZ?=
 =?utf-8?B?ZGpSaHVyY05uQlNjU3NJSER6VzlmYWFqQis2OTRLWC9WTkJOci9OUktQL1V3?=
 =?utf-8?B?UkR4SVpSVDFydldETGRIK25uc2d2Zm1jL1RLMFl1b1c3VWtiQXB5ZEdNa1ph?=
 =?utf-8?B?aDg3aUhNOWFEeGZtZ1BaS2xyOENoOXNwelQxekJTbG5nUGQ4NW01NG04UjJ1?=
 =?utf-8?Q?SLh6wFLHvkPyzpNSOzdIrvphU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b2cde8-ff6e-4505-19e2-08de3ed3babd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 07:53:45.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLcml6c5uAXwdL0dUWxA3yblXEtWsTxcFvzaOE6Cu/CT5bt0e9As7TwIwJDSQ968Ik5SxxQx3vOWTgZIMVjnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_235350_247590_B371BB64 
X-CRM114-Status: GOOD (  19.18  )
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

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY. While access to these registers is not required
for normal PHY operation, this interface enables you to access
some of the PHY’s diagnostic features during normal operation or
to override some basic PHY control signals.

3 debugfs files are created to read and write control registers,
all use hexadecimal format:
ctrl_reg_base: the register offset to write, or the start offset
               to read.
ctrl_reg_count: how many continuous registers to be read.
ctrl_reg_value: read to show the continuous registers value from
                the offset in ctrl_reg_base, to ctrl_reg_base
                + ctrl_reg_count - 1, one line for one register.
                when write, override the register at ctrl_reg_base,
                one time can only change one 16bits register.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 221 ++++++++++++++++++++-
 1 file changed, 220 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index ad8a55012e42..cb2392008ad2 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright (c) 2017-2025 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -52,6 +53,21 @@
 
 #define PHY_TUNE_DEFAULT		0xffffffff
 
+/* PHY control register access */
+#define PHY_CTRL_REG_COUNT_MAX		0x42
+#define PHY_CTRL_REG_OFFSET_MAX		0x201f
+
+#define PHY_CRCTL			0x30
+#define PHY_CRCTL_DATA_IN_MASK		GENMASK(15, 0)
+#define PHY_CRCTL_CAP_ADDR		BIT(16)
+#define PHY_CRCTL_CAP_DATA		BIT(17)
+#define PHY_CRCTL_CR_WRITE		BIT(18)
+#define PHY_CRCTL_CR_READ		BIT(19)
+
+#define PHY_CRSR			0x34
+#define PHY_CRSR_DATA_OUT_MASK		GENMASK(15, 0)
+#define PHY_CRSR_CR_ACK			BIT(16)
+
 #define TCA_CLK_RST			0x00
 #define TCA_CLK_RST_SW			BIT(9)
 #define TCA_CLK_RST_REF_CLK_EN		BIT(1)
@@ -113,6 +129,9 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct dentry *debugfs;
+	u16 cr_access_base;
+	u16 cr_read_count;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -420,6 +439,204 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 	percent = min(percent, 100U);
 
 	return (percent * 127) / 100;
+};
+
+#define IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT 500000
+static int imx8mq_phy_ctrl_reg_addr(struct imx8mq_usb_phy *imx_phy, u16 offset)
+{
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
+	struct device	*dev = &imx_phy->phy->dev;
+	int i;
+
+	/* Address Phrase */
+	writel(offset, cr_ctrl);
+	writel(readl(cr_ctrl) | PHY_CRCTL_CAP_ADDR, cr_ctrl);
+
+	/* Wait CRSR[16] == 1 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_addr_err;
+
+	writel(readl(cr_ctrl) & (~PHY_CRCTL_CAP_ADDR), cr_ctrl);
+
+	/* Wait CRSR[16] == 0 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_addr_err;
+
+	return 0;
+
+cr_addr_err:
+	dev_err(dev, "Failed to address reg 0x%x.\n", offset);
+	return -EIO;
+}
+
+static int imx8mq_phy_ctrl_reg_read(struct imx8mq_usb_phy *imx_phy, u16 offset)
+{
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
+	struct device	*dev = &imx_phy->phy->dev;
+	int val, i;
+
+	/* Address Phrase */
+	val = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
+	if (val)
+		return val;
+
+	/* Read Phrase */
+	writel(readl(cr_ctrl) | PHY_CRCTL_CR_READ, cr_ctrl);
+
+	/* Wait CRSR[16] == 1 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_read_err;
+
+	val = readl(cr_sr);
+	writel(val & ~PHY_CRCTL_CR_READ, cr_ctrl);
+
+	/* Wait CRSR[16] == 0 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_read_err;
+
+	return val;
+
+cr_read_err:
+	dev_err(dev, "Failed to read reg 0x%x.\n", offset);
+	return -EIO;
+}
+
+static int imx8mq_phy_ctrl_reg_write(struct imx8mq_usb_phy *imx_phy,
+				     u16 offset, u16 val)
+{
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
+	struct device	*dev = &imx_phy->phy->dev;
+	int i, ret;
+
+	/* Address Phrase */
+	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
+	if (ret)
+		return ret;
+
+	writel(val, cr_ctrl);
+
+	/* Set cr_cap_data to be 1'b1 */
+	writel(readl(cr_ctrl) | PHY_CRCTL_CAP_DATA, cr_ctrl);
+	/* Wait CRSR[16] == 1 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_write_err;
+
+	/* Clear cr_cap_data to be 1'br0 */
+	writel(readl(cr_ctrl) & ~PHY_CRCTL_CAP_DATA, cr_ctrl);
+	/* Wait CRSR[16] == 0 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_write_err;
+
+	/* Set cr_write to be 1'b1 */
+	writel(readl(cr_ctrl) | PHY_CRCTL_CR_WRITE, cr_ctrl);
+	/* Wait CRSR[16] == 1 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_write_err;
+
+	/* Clear cr_write to be 1'br0 */
+	writel(readl(cr_ctrl) & ~PHY_CRCTL_CR_WRITE, cr_ctrl);
+	/* Wait CRSR[16] == 0 */
+	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
+	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
+		i--;
+	if (i == 0)
+		goto cr_write_err;
+
+	return 0;
+
+cr_write_err:
+	dev_err(dev, "Failed to write reg 0x%x.\n", offset);
+	return -EIO;
+}
+
+static int ctrl_reg_value_show(struct seq_file *s, void *unused)
+{
+	struct imx8mq_usb_phy *imx_phy = s->private;
+	u16 i, val, base = imx_phy->cr_access_base;
+
+	for (i = 0; i < imx_phy->cr_read_count; i++) {
+		val = imx8mq_phy_ctrl_reg_read(imx_phy, base + i);
+		seq_printf(s, "Control Register 0x%x value is 0x%4x\n",
+			   base + i, val);
+	}
+
+	return 0;
+}
+
+static int ctrl_reg_value_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, ctrl_reg_value_show, inode->i_private);
+}
+
+static ssize_t ctrl_reg_value_write(struct file *file, const char __user *ubuf,
+				    size_t count, loff_t *ppos)
+{
+	struct seq_file		*s = file->private_data;
+	struct imx8mq_usb_phy	*imx_phy = s->private;
+	u16			cr_value;
+	int			ret;
+
+	ret = kstrtou16_from_user(ubuf, count, 16, &cr_value);
+	if (ret)
+		return ret;
+
+	imx8mq_phy_ctrl_reg_write(imx_phy, imx_phy->cr_access_base, cr_value);
+
+	return count;
+}
+
+static const struct file_operations ctrl_reg_value_fops = {
+	.open		= ctrl_reg_value_open,
+	.write		= ctrl_reg_value_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static void debug_create_files(struct imx8mq_usb_phy *imx_phy)
+{
+	struct device *dev = &imx_phy->phy->dev;
+
+	imx_phy->debugfs = debugfs_create_dir(dev_name(dev), imx_phy->phy->debugfs);
+
+	debugfs_create_x16("ctrl_reg_base", 0600, imx_phy->debugfs,
+			   &imx_phy->cr_access_base);
+	debugfs_create_x16("ctrl_reg_count", 0600, imx_phy->debugfs,
+			   &imx_phy->cr_read_count);
+	debugfs_create_file("ctrl_reg_value", 0600, imx_phy->debugfs,
+			    imx_phy, &ctrl_reg_value_fops);
+
+	imx_phy->cr_access_base = 0;
+	imx_phy->cr_read_count = 1;
+}
+
+static void debug_remove_files(struct imx8mq_usb_phy *imx_phy)
+{
+	debugfs_remove_recursive(imx_phy->debugfs);
 }
 
 static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
@@ -724,6 +941,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	debug_create_files(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
@@ -734,6 +952,7 @@ static void imx8mq_usb_phy_remove(struct platform_device *pdev)
 {
 	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
 
+	debug_remove_files(imx_phy);
 	imx95_usb_phy_put_tca(imx_phy);
 }
 
-- 
2.34.1



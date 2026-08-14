Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C44C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCHVRXMR+EDPFR8FAq7iABKIk/ek1pWz1mg0Nj8Clv4=; b=eIGQ9bq1aCX3E3WP5E/bgD9IqP
	hB7d2+UzZj5pTm02IdQ9TXzrFxD3+yA2bfwGYILXT158jgam8JzVTHP7YgsYA3O2v0iyzDIrLAE0s
	ZhP5KDMu9tacdSwlA0op+9olCMSd8I+M2hJdT/CccuiOggbZWWqNoyn8o4GjdmpIU8lBjz5YqNh1q
	TzqXOMbvnRh+uUOnX7B0JQmjyPYkbYY3y6g86eyeoIdIO9rZkhM8uNJOZpj8wGmGCPcWfbbwdeP7A
	t1Iaa1N1HEmva3z0z8S5nmedqXqeD1QyAKb9eQIXahjsXKiN4nHKnSRgLTJjyiNRI2MeaKRfziqrY
	LQdm0H0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumEt-000000027aY-2c8L;
	Fri, 14 Aug 2026 07:22:03 +0000
Received: from mail-norwayeastazon11013029.outbound.protection.outlook.com ([40.107.159.29] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumEo-000000027U2-33ta
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:22:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q705L6vB+ppG4FmpxaYQ0QXD10WFDPs9e2yTmtrQYAMV/ue+lWZDHW1dBF0nQxENJ/wJholqcglgtZyZnDPdC/aQXGRkXIkVqmgcgpUJFJZNBMsPKx4gWjDEqWJZWEJ6OBl7EfcWq0mDC1YVgsXixwbeAIoOYv+jE4x2s4rqgp2VdEJJsBxU2vaAH2ptJuPij2yi8kwMeDCL4oJ8y/n3+rM0XUUqc0qZdshGT0dUh35NxYc2FybMMiY/xbbw5QVeAO5faE6YERoaC3+COkyl3pKZrKdOcQkipwvpGhMad+2GdnyUE01pDhoRAI+YzxByEf3IIbD4txveS62yfDn67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCHVRXMR+EDPFR8FAq7iABKIk/ek1pWz1mg0Nj8Clv4=;
 b=WqgCvechg8JzqZtsaSNymDuHLEw01Ka8oELwmWldLt//9TKegvfoF3Sn6PdDBLcrhkX3CZBPGkY/+Z5BhQfH9LidKNWyQMVo0SiwwM9D6D4Af0ecw01ugTDc8W2ihHPDq4ZViIlxTDbnIQndszrtrw7bf2Auey7aiYeLh/NK8xQM9flQ8LUr1wCxp5fvO01rYkSfhdRoZfNeGTv1lxZE8OrNZ6QNJtBQ0X5h72ZJyItXgmbGQ9hL+LYO9fDTrNm6jwgXq4+pGRtmOpzh82vsGNxjJ+6n9YsAhUYL3rsfJAPKQ1jZveQTxWCgZFtum2vTB2N7PjRha8emqLHWQrUlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCHVRXMR+EDPFR8FAq7iABKIk/ek1pWz1mg0Nj8Clv4=;
 b=ooUYJyifMobrO8c4Np5Po1lgYVOm6NbXMA/JQjBl1yv94SvFr2MvWBwp8aeGXjKsp9BrR5vdvwMP2ueylVoXLf8H/cUY+PNAWryDe30ZfnJYKxmXIAcS+jiKrSMSbkGMrnXExGnutPByKlLnNNtHNn1a08zUrIqga/s7IoRxlcEUupKSc2Rb1JIeFVnW/FPyDid5iSs43Jgcw9GoNg/HU0VNzH8dYn3uqyQxVWg3xHGAwp0M9K/Uaw5olPeibaIuqWCHIhjmD/0+RuGOBenIIfPoE7Hm9TutR66iYzucJbgzirosM8BswmiEEF8OsKRNCRv+7ZPkiI4PChwO0mLPxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB11339.eurprd04.prod.outlook.com (2603:10a6:10:5ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:53 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 07:21:53 +0000
Message-ID: <a2a49086-9992-4ed0-977b-88003329967c@oss.nxp.com>
Date: Fri, 14 Aug 2026 10:25:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95-15x15-frdm: add boot phase properties
To: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 qijian.guo@oss.nxp.com, daniel.baluta@gmail.com
References: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB11339:EE_
X-MS-Office365-Filtering-Correlation-Id: 31673ddf-fc82-40b2-a6b7-08def9d4b6c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|19092799006|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: p8K0pdpFl7UbiCHaWrE8LeMbOt4dCnKqA2fbYFO5uKKt/K9NCMOY/B4a8wvYeEAVAnk5uR6pklYA+fAt0GH0fASuI8psu3Hi64zErzcr8+prSuJRbyYMl2qrpRF9qeQYFeFVi6+z45u6vUaokdlP7AZnU1OAdYTSLLsppHs1t6jBwNTkQaefebYScUDo9Zq55/vconfxfHX0ZWE3qsoKcaZvJ7s9feMz+a7ibFrlTu066YAuabO2r36sDI4zouruv/uUVBXjDGCMEz+CW7zMqUyCWfN4lI7MDATRgRRItcP2NEOEoHfU0UEB+XnMK5P0hGwmMhjB8HVlhB/MlXKoUS3PUQ0ayfS3mVAIsdO/yDM+RLMJbyNBJD+KmVXc/D/tYyho4Tjp8iH94d6BTn4Yw7rk7L6de/5R02if8M+FXtfr0tntcl4sGpDLMQKFUFG83rAx8fNPeZTzonViyErzU6iKTpYcpzyHFW2qr4ba4WsBtDyG8KIGedQBb28XVTOKbLgydJlK6WjRhp1Cp5IIIaJaXDEDSBqRZBPqcgm0aFxW+pCLdVIA5uLZ25iwC3DCC/68Z5aeuhOC0/mnHb5t0hjppHG47la4A/iXzV9W3+8Xvy8o0KxNthA3LE78+hVp2OgNqz3iQ6bfewlm3vCvTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1BXcnFoMmt0T1ZjdXYzSFVRMktVS1R3S3RNWkljSy90NVF3bGhuaW9odFpH?=
 =?utf-8?B?YnBzKzltMUpPS0ZYV3BRSnJBK0kxaWpXZEFhRjJiNjA2UTBINGU0ZkZ4eEVu?=
 =?utf-8?B?NFB1eXFFTWFBRmxET3gzV1l2STZZTU1TN1ZXblBIWFpnOWF5VjVFOU5PV3hZ?=
 =?utf-8?B?Mms5WnoxcWU0ZWRCZjFqOTZDRHFKUjB5Z3NCZDFwUGE5Wk9XTmEwRG1sNWM5?=
 =?utf-8?B?YTlEMjJKZWVNc3o1Sm5WeGcyQWM3L2F3RHAraS9WdHYwbnhpcWpBZ3lWMnhl?=
 =?utf-8?B?L1o3aHg4eC9aZTcreTFpamIwa2Jycit4Z0F5N3U3cGhGQ1JvcGZFOGp5STBW?=
 =?utf-8?B?M2xKY2VsNk9iSitpSHc3Tis2cHZ2V1J0RW03WHpWNTd1SXVHS1NwSlJnZmJn?=
 =?utf-8?B?eE9jYVVaRk52TE5oa0k3U1VSMDJ1OUdNWkVrVVJQNktxYkt2S0tacG9aL05a?=
 =?utf-8?B?L2NkcXc5QVJFbGp1YXVBOXZCVmxtWEpEa1BicFl0cmZjTmt4R2FKQUJFaFhr?=
 =?utf-8?B?eFhRYVhFcEh6Wkh5U0t2YjU1UjllM1lpdlRuNWxMV08zQWlBWEpURkFFOTlB?=
 =?utf-8?B?eVkxYlhJT3VLbHh6UEt6SkkzRFpxM2JBYktxT1RzY0pUTnEwcFJlYkRlamtI?=
 =?utf-8?B?Rno4L2pYL0kvdnpxQkg0cCs3NUw5R2NTM2krNGwrUitONTREYlJpVzY1SVdF?=
 =?utf-8?B?WjJYUlVGZzRNQWJqdFhRK2htOXRsNUV1QXNabEFtVnNNbXRxR0gyY1VtcDBW?=
 =?utf-8?B?YnNlQWwzdFV5bmQvOFZVL3diUnR1SzlzelFFUGgrM2tnK1VVRGJOWERTbTht?=
 =?utf-8?B?NW44YTBiYm5JdkU0Zld0RmY0YjVtN1BuNDlsSVp3T1Bxd0N5aGJ5endCRXZn?=
 =?utf-8?B?QWdMVm1MY3Qyc0lHY0dmeldDMDNWME9aWmV3a29EdTc4ZHQ1SDJ0WjBhcDRC?=
 =?utf-8?B?dG9tMTI5b3ltS2ZjVmZDbUYzNm5OUWx2cU05Q1F3MUllT0M0dy9sUm1IWU56?=
 =?utf-8?B?MkUyNDVoTEFaaHVoSFFlUnBKL2J1eXBvNnhJblVqNkJzY3M5bGtRdDFUa1Yv?=
 =?utf-8?B?WWxUd2k3WnRzS04zZFlYcURrcUN0VlhhemFLcDhQUmhrMU45RkMvbW5DS3c4?=
 =?utf-8?B?UUNoMGFjWC80UVBQaEowV1MrV09PR0w3b1NKWDBSNXBDb1lvQ0lIWi9ObTNm?=
 =?utf-8?B?N0dNb21QWG02MllmM1I2REllcWJSczRyNDM4S3VYQm1mK0dlb0tnbFJDSWI1?=
 =?utf-8?B?M2xudEtDQkNFTEVRUDQwMFRET1V0c0xsOG9vckRrUkxBeGYybXVLbXY0T0Fz?=
 =?utf-8?B?cXVXUDd0LzQ0TlliSmMrdzluNEJVWTJPWi9MdHhNNW0vUXhTN2FLVnBHdjEv?=
 =?utf-8?B?d3E0aTVIVFhMeThESGJUN05MbWpRUk5iN0h6OW43Sk5RNzN2UmVKU1NPc3dt?=
 =?utf-8?B?enFYOHFSbmJRaFh0NGYybnpJWHJ2V21PNDlqV0FTbE8zOWFQM3ArOXc0NzBY?=
 =?utf-8?B?enFXR0VHbXdCSWhTZGVpQ1ppUWJnbDh6cjV5RVc4UG5sWDBxMy8zNUNDOVNE?=
 =?utf-8?B?T1pBUko3VEJmNXg3ak90eEY3bTFRTmtwdHM4R2ZYdnBuOXFzdXZxT0t5Vjcv?=
 =?utf-8?B?K0tMaDJUVWh0TTAweUVDU2RETlFrNWt5Vk1IaXBNNjBtQ0U3UG1zRTYzcjFw?=
 =?utf-8?B?RlRZR2dQWU1Bc21XV2ZjL1ZnNWlQNzBhSlFSMDcyYzdoNDlTTUQ2bUJVN2pz?=
 =?utf-8?B?QndPeFJvRTFEMWxSSTZ3b0dhbkd1LzFSOEhqL2lGVTFrTG5UcHI5Y3p4SXd3?=
 =?utf-8?B?aTBEUnNJeXJsVHJBK1h3RitQUFJoWkFqWDRTcytNTjVOYjd0ajlzMWFVSzJP?=
 =?utf-8?B?UXRaWllHanJiTkw3SHcvNStWdklaQVZoU2xJeUxQQjJocjVZOWhiWGYxczBL?=
 =?utf-8?B?MSt3Nlk2OHc5WGIvSGoyZzR3WHl4UlA0UExzQjg1Qk5wWXo2UUo0MUlObU8z?=
 =?utf-8?B?OXZ1Sm9LQ25MVEdaU2N5ZkVlOEYwWXZPS05qZ0tkZjlnaTdBaVhHOGJkeXZa?=
 =?utf-8?B?bDFBK3hzc3Z5bkpwOUpheDBCMXRtbzhFaTk5R0hpc1NkbHRBTTY5TXBKNDYy?=
 =?utf-8?B?TE1Sb2VGakVmT05YTm00bGhRS0pMUzZhUUcrdml6L3o5VUs4cnVPSWlOcWFk?=
 =?utf-8?B?djZ2SnBYeHloTlI4MFpUSHY3UkRWaFdmWG9RaHo4YTdKTW1QMHE2cGN1dlF1?=
 =?utf-8?B?aFhqZE5jN25QdVJNdFRKcnhUS0tqUWhKZFJ1aHd0cXl6dWxMSmtyZURUTFQz?=
 =?utf-8?B?bUsyejl6RElKU3FkV2xDOTdOOVVUM2pMSDl0WEZtK0NJbXF0a0w3Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31673ddf-fc82-40b2-a6b7-08def9d4b6c2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:53.0388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIVYP/+6OU87NwUZuSuzRp6pyBURj2yqE8bdmGerpVtYA5GYpp8OjX0iE/7CwAvGarsYRQO6KsVUneyXrJ4rkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_002158_907558_48937985 
X-CRM114-Status: UNSURE (   6.36  )
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

On 8/14/26 09:32, Joseph Guo wrote:
> Add boot phase properties to essential resources during boot phase.
> 
> FRDM-IMX95 need UART, SD-Card, eMMC access during boot process.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



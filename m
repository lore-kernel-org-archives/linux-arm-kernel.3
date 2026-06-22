Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0338BCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSUaAkplodbR9it4HhJuy2jJcVENKYCvBUg2ina55iY=; b=LoUjGBn+JtjAYuOKUhnFXjP28i
	UUmlOkvxYPKMHt8dWiUeHGp/UlZf61mkOiZhCCmLTribdx3RZfQoWHpqCKnCzZX47vND0HmmMrRoF
	LE+tzZh91lIWgIEp05275VWrPqbsvGyRx9KirArnCRvZHFpNt7Sd+PqENhIiMXLfnfra/Ma1kEWap
	RgBxGu8aeyIHfIVhWb0ptlim2SRm1JqVuDBuAtEXn2rIzp2PsvX9thEE3tJlF/kbeq8bEYyRsAroJ
	OT/AM5gPnSrV97vO5SA0YOnIJWALwi1bYJq7WjdwVa3GYTiZ9BA0pDbRjjVHCL1BwbHDpyaGJCOTY
	JxEQkBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaUO-00000004hpY-2hig;
	Mon, 22 Jun 2026 08:58:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaUJ-00000004hnu-2sZz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Message-Id:Date:
	References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=aSUaAkplodbR9it4HhJuy2jJcVENKYCvBUg2ina55iY=; b=O5oPzKfVA4a5mADJ6lLM02hiUO
	fV2W1cuhu/vol6sZam3NSNdnCto/Hu+xLnpAtsJdg+cLnsnPk7e7V8xOYzN9hkEtBz/GjDqqq0qWP
	XFRBrlZWarx1eMqBl+RabryygUA1KT5D0rkx5rdMw26wnyAsmNg2mYzSkuw1Qz8gsUFIfsRBruHNS
	atFH5bwOWmL3TEppCknzAHbtv3u6CtbiAPa0erfth8UVQobNXCipu4wHuK0j1mwEQBZcfoH8+5pBO
	vc4TLAMxsLI8ZQW0zzlyIN8KGqsIxmFoBSv6OCyBPAj8gd+oAG9T/QHLDGqE1cVMqvfdHYNee0Dlf
	hAO9yGeg==;
Received: from mail-northeuropeazon11010036.outbound.protection.outlook.com ([52.101.84.36] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbaUG-0000000HEdX-3m0S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:58:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=no7inYk4zH5BJZtBEfpewO0uo0M00CSMBH+tROxFyh4Yis/kr0RmkxG8mVj+4cDEpooSrIveg9+MAFk8LKq0RpZG2kP4BmfcwWZiZNuQAHvGkHI7KnCkDrppsxzC0mXbGSbhTg30Lu7mVa5PvDoEgGQFTVeX29QCEGxxRjmBKWl9JQw4DF3tTmGGYA38lzqlXhMKu07HVHcmHg00Qioy+g61SAG2bFn1jNk5kaKoX+GN2/EGyVw1AS7TpBuIWLNXoL/zCzxk7q+ZIC+ez8JQfC5qP/33Mq0eLjSvACfJco1RfrIsexUgY9S3w9HdxSe3FSqBl3sHwec6B70Xf0iAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSUaAkplodbR9it4HhJuy2jJcVENKYCvBUg2ina55iY=;
 b=zIeWGztF1YJ6YUhf7CFJKXTVFWt15mKp4B6e4wHGGx1LqJNvRfIzmb5uDcqsikmNWkqj1iH40cfBucG5ec4wbXcEe63Xqa5tAKl8+PRVSHoTBgx16kCX0JfSX2OPk95JJ504rJknZ9VF1mEN5fuCSbfqWYeVhp86lazJkR5fgcyymJ/IooeiywRrzGd0RwYusLkgxaGX4w+kPzv83OMzSbpc9FXTBN8+NbQYbkhaBNsW9WMUFkx4iukU28JhlyK1g0nwBCnOes1YH3VUFLOiCtiPEs1Xmk3Wccp2VwBR+LmfWP8PcH/CXkDr1M3gHhn6D8i3FldPSCQFbpyOBDqhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSUaAkplodbR9it4HhJuy2jJcVENKYCvBUg2ina55iY=;
 b=aB8V0fAVaI5jqvZ9vBFivN7deiEYTka63h1cWU9tJqh1HFFb8eSdHFlOtVklBOhVOzpBrAS3ekrUCrvklhCLoeGaxImnBeDKAkwkwLLB60LsB+6hfjn3+FDt/j1Rq1gLOSASaNOB1ZLClgu8myaHvOSpL9W+JtO5Qmx0yWdPHPkYAXINLtZNwIjuYi7Cirh+NzOXEEUTlU4s6j9bhK3KNoPjjY2eEicYK1B/GkhAY1VVdTNjmVrZT6rmnYQL8lNLkHySxJ2fROVMDPWjSZ+OzY/QlU7zNjliqFHKtaQB64zX1QE2emBG7zX4VTfY+WM2aVcHhKc6DR2kCxwZr9nVgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:58:31 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:58:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 7/8] arm64: dts: imx8: add camera parallel interface
 (CPI) node
From: guoniu.zhou@oss.nxp.com
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-7-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-7-7fa6c8e7fba7@nxp.com>
Date: Mon, 22 Jun 2026 17:01:14 +0800
Message-Id: <178211887405.4030874.3312107681383203634.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782118896; l=2090;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=FO6rykdyS4qr6KVQE0WiUcd7+yW5lVYwSW7HI3wyaFs=;
 b=suz6mLQUGwJfGSc51hFBV/aMN5r8IS8rmveHrc33Nfz8RBZWUEbB1F//v2NaQwAMD7OMQF5cs
 vzlUHQ+0rznCsZurq6j7uoVyiMyKbwSr8hwoUv/ajVhRiEQixnoMySF
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a41e8cb-5595-471d-d0f4-08ded03c6ed0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: xfbgy/H4kqSNBGf42hBsLbzoToD/2pwJZx6CwLRPzqmDUkgE+I0uNiWqeLsFCa2sAQnqDrkeY7T4TRqwU9r3CjTKgLJDzvGK+TT0buY5cknbUcTsr+HCjfe65rUts3BCOVcEG33kc0GclmSnJDj/Q1fzQpkOLFesGdy1DgqaP2OF5dbXiZN/9R8Wi5AsdVmNSeAZp/FV6zNd194Vk5QpPVCLZuw16OGdveoUOauWpjJfS05GxK1D790gTUCHUoH6LglFxdYXeYMn5lKj9UW0H8Uzh/THJNCqUIff6XZdv52WYbhrwsxPpK/iOaEmWIouv0jLSkjq+FoibAEJhu5trJtuNTs2n1nXBDlXp/To+erpEfTRZ3NYbPJlEK7ZmV4pJwANMhxiSTv+eeehpzs4EEKbmt8zvMnIk9tV4KQsqi0RPb1ah43WBReCYO9l7TcuGYn5e3vKRvMChsHUQQbD+vLMU2evrJ43Icy3Ptp1095bQgpEU0v7CXUWDfVgcx4baA6mTekA+8Y0rgOJz+ZItDNfg+vj72evQuDfH1ev3Zdqu4jLsmy16mIyTP/7TJh1vNp4XxSzyPIsvhcCwXgE7zubmic+lnOjs1azODWq4a6m0hATCs3MJFozZAuSbXOWVsOFlkxQfLY8ybGUhyQbaXmyUBH8K4U8zc2SIQUHNS0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkFCd3ZDa1NmS1V0RHVKK21VNDRjM2tibTRUTjdjRVgrQ0pSWVc2dTNsQjJE?=
 =?utf-8?B?bkhmZDgzTlFiUXFIZy9kdHFNMy92dXgwT3VldG1hRzE1NkRpcWcrMnAzd09r?=
 =?utf-8?B?Q2dLVUh0NFhRNVoxQkEvTjRJT3JTdzBGNW14d3RBQXREbHBZb3pHdUFqQ3dD?=
 =?utf-8?B?YjhwTDh1aU8xZW9xVFo0NjdsZS9idllnUWp1YlNYaE5peXFoYm9QZlp6UGdo?=
 =?utf-8?B?RGtFclRDSTVWR1JiVjc5SHlOQ05Edzdkd0o3MzRlSFBQOEt6TExQNVYyeFUy?=
 =?utf-8?B?NmFieTh2UTl0djN1c0lFTWJ6cC8zenZvN3owclZ4Z2F0N29zQ1ZMN0lFVVRu?=
 =?utf-8?B?dDZ4NWIzS3IvZ3FpQ0dHcUkybzhQUVB1K1cwT0RVMGoyOHY2ZnBNTFliNm5z?=
 =?utf-8?B?Tk1nOHJWaW1MMkJ5dFNZZjR0a0FOU3J4OGFPOFRvZzkvY3BvZy9GYUU0VGRT?=
 =?utf-8?B?TVBlL0RKeEgwdU1NaWhpeW5qL0tZYU5PL3N5UUVmOXhvY1NuSks5SVVDeHl2?=
 =?utf-8?B?N0JveWZHeTRzbk0vSis4SmhwaHU1ZlAvbFRONU5GVEtzRDJCMjRqWWoxbjQz?=
 =?utf-8?B?eGRKZlZGemUwSGxGZjRzdStrZzhJRFdpTzFUcTREUTJsd01Mampicnk4MmZ3?=
 =?utf-8?B?U2E2dlorSWlSNVJoOW80YzhQcVQzZ1RMRzJVUzdsbkVNdWlQeHVIQ3lFekdj?=
 =?utf-8?B?VU9abTlBK2ZybnFKK0FhMlRwN3QvZ0M1VlhnZ2oxeTB3TG5UQTZaSm5LZlRh?=
 =?utf-8?B?Z3ZmMWt5aHU4SmFjaGREN2tnWFpJSDVaVzVlWE9XUGZ2YUZEOU44M3NwTzRY?=
 =?utf-8?B?NStCUVcyNTB3Q1RwQklnQXN6TFUwOXZDc2Mra1Q2OUxOUnNtdkVNbitKbk9K?=
 =?utf-8?B?R0tjZnJOZ1FVRnc3Mlo3VTlyRHdHUXJZcXFGTUdHajAwdU92VGJUL1QxWHZr?=
 =?utf-8?B?YVJab3FwU0wwczJTUXdocWR2dldQWk9PVGM0UHNTKy9LbWJ4L3Q1M3Zmblc2?=
 =?utf-8?B?b3l2ZUhLSFREZHRocjgzUmE3ZEZydHhFM2ZSZ0FaUEpyMm1QMzR3MWlqUEoz?=
 =?utf-8?B?cHVsak1LQkhnaVMvR3NXZVJuaWFsc3d0aVBrVnRVQjlQeVhuUThtTGJPS0Rm?=
 =?utf-8?B?RUZQeC9QU2twUnNlWHZmSFBLUkhlb2IzM2dwOWdtVWRLM1pjdTF0U2dtQXZx?=
 =?utf-8?B?cE5pVTlWK3BGTUxQWUZlRHR5blNpVlZGek9SdmFGTmkrRTMzcXVsd0c5bGEv?=
 =?utf-8?B?T2Q2MWRwcDBzaUx6dUEvaGo3eGZZTEIrUERudzdKam9JdGhhRFZUTTQ1WThj?=
 =?utf-8?B?bXM5STJXa0NkOG1iYWs2bHVUa1NEa2lKVU1NWHRYRFRJTUVVaWpDRTExeDJI?=
 =?utf-8?B?OHlxQ3N6ZDcwVHhGci9mem1PeUZpakQ5K3V6aEc1THk3eTgzdFlSRlZoczdR?=
 =?utf-8?B?eGFNNng1a2crbjNsdEFNd0d6Wko2QlVKb0lURm1saXZzODlKUUFkSFNWQUtx?=
 =?utf-8?B?T2twS1d2ME5rQUdWRDFpLzYrV3QrUVZmVXBmNS95NjVCaWZhd1NhczZoYzl2?=
 =?utf-8?B?VmgzZVl0RWZBMURUYkNlVlhXWVZwZGwvQWJuTEM1Y0F2L1ZzY1FOUmtUZTdT?=
 =?utf-8?B?YlJtUnRtQnB6S1pIU3Y0U0pMb2ljaWtieE5veVdEeUZWQlRFcE1MNS9SOEtN?=
 =?utf-8?B?MnNlWnNSZ0lHNmJXcFFJMGRxWFU1OStjZHZzbExpZU1hZG8zdkVVMjBXWkM5?=
 =?utf-8?B?RGVYNWF5R1FRQmxGNjJReFpJUk4vMmhDNkJhTXdyVThyaDM3NVdpVTJjMmhQ?=
 =?utf-8?B?a0lnVjlRVnpQTS9UME10cDZ0R3Y2ZUdjQTloU2RzNkhnVW5PZHM2Y25KQ1la?=
 =?utf-8?B?eHlaRkxuUDc0dkxpcUZaQ21MMkw3RHRkQzJPY2lwVTJMcENGdE4zSGc3bGxu?=
 =?utf-8?B?NWFQMnk5NlFhMnA4MnQwd05CQ01jZkQ4Uk1UVnNxdkVER0llN0VGemF5NUNP?=
 =?utf-8?B?SnkrN05aVUhrdE15UTB0NzFXVHJzUUxuOUpHQ3JmakNNc2ZEUXNzeFM1L2s5?=
 =?utf-8?B?SHp5NG55RkhBREVXQjVxajNSOWJleVZFaHpYZ0VDSnlkcFNROEVZYTdvdDNh?=
 =?utf-8?B?ODhMSUlPM2RvNjdaUW5xNzZVcGl3RVROcE40bkkyWFl2dUIzUXdkNVBXQUI3?=
 =?utf-8?B?N0dMOGRFdWwxNENIYlNBTkJHb0F6SnlITk02dU5NSDdhMjE0WUl2UjZtTEYy?=
 =?utf-8?B?UlJjcHRjWXZzM0QxWnY1QU9nZEhQaEg4NUNmRXpOcTB0b2pDR2Jaenk0VS9L?=
 =?utf-8?B?QjlzWjhmWjg5czVreSt5K2thZnFEUnI0cUp4YVE1OFlxUEYvYWRnK1pVdE9y?=
 =?utf-8?Q?2j8WzqwTZez4y5gDfmS+hPuT2xgJ7GR+8QtgW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a41e8cb-5595-471d-d0f4-08ded03c6ed0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:58:31.2775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXaNQgO2fvDr5wRo0Msu62/c4P7AC/HiiTUR+GRelOYe/U/J9iUdJKIuSbcfRFZ7cUgDiXwin3i5MkfcxONAT1x70h/4r5gzo8Aj+93+5prKyzkrYN8OeuvPm683kIjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_095837_113719_42B37CE9 
X-CRM114-Status: GOOD (  10.48  )
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

> Add camera parallel interface (CPI) node.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> index a72b2f1c4a1b..b504f99f6acd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> @@ -222,6 +222,19 @@ irqsteer_parallel: irqsteer@58260000 {
>  		status = "disabled";
>  	};
>  
> +	parallel_cpi: cpi@58261000 {
> +		compatible = "fsl,imx8qxp-pcif";
> +		reg = <0x58261000 0x1000>;
> +		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
> +			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "pixel", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
> +		assigned-clock-rates = <160000000>;
> +		power-domains = <&pd IMX_SC_R_PI_0>;
> +		status = "disabled";
> +	};
> +
>  	pi0_ipg_lpcg: clock-controller@58263004 {
>  		compatible = "fsl,imx8qxp-lpcg";
>  		reg = <0x58263004 0x4>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> index 232cf25dadfc..5aae15540d6c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> @@ -62,6 +62,14 @@ isi_in_2: endpoint {
>  				remote-endpoint = <&mipi_csi0_out>;
>  			};
>  		};
> +
> +		port@4 {
> +			reg = <4>;
> +
> +			isi_in_4: endpoint {
> +				remote-endpoint = <&parallel_cpi_out>;
> +			};
> +		};
>  	};
>  };
>  
> @@ -95,3 +103,22 @@ &jpegenc {
>  &mipi_csi_1 {
>  	status = "disabled";
>  };
> +
> +&parallel_cpi {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			parallel_cpi_out: endpoint {
> +				remote-endpoint = <&isi_in_4>;
> +			};
> +		};
> +	};
> +};

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


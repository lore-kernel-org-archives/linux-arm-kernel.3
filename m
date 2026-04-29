Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD8CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlbbJbxPo0aP4GzXhNyzBQhXAGPrmjhEpkBfIaFaaFQ=; b=Qhsl8sSM8Eq+P9t35U0uDoS316
	5Kc9CQWHIpa13kF3P6wxypkYhI4Exj/VKhdZB6jhAhGI/Ds6DBiQ1xMFdWqaCgEug1pn55wzA5FIt
	gA8OUi9jFy5J9XrTvWEPH9sC725XX8BZSa1c3cYX+5l2oKhC4a/MBGMD6RSGC0mMmnodc/ce366lW
	6BmvWXMD4uOx5xYiSODxWhMVCzbhmsDXZt9hW7tG9ntIFhzbyn6nZWoaw1+CoOaHT2Ylas6/ultFv
	RafpAyoCuKweNpeuZgdnopMhqR9KrF0wzWZZHkmVKgzlRnLzm9Es+dhP6fxEOkjRx+XN0m/nHrg0i
	Xs9mDYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI98c-000000040Cs-42VD;
	Wed, 29 Apr 2026 17:55:54 +0000
Received: from mail-northcentralusazon11013026.outbound.protection.outlook.com ([40.107.201.26] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI98a-000000040CT-1ryL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:55:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmcrx2MH4SbBOXf7yEkGy0taqE/0XbFDHRMGoPfvtqB76h+8mCH7OxZQ2D7s6WYJALXk4GRPkrMPZ2c6IrDWaPdNrgihNxlmg2HUx8kPyxw4nPA/T+9Rg6iNXLjsmCLDXWZIXsmdpmXMsZ7laBpFjEGaES4ae+VRxykFQlfrlDbHrlVCn/IwTV7vJwo6Ln2bBJW8Kybds4CDQzavdiZSsmMjBiPLGclLyOMDHN5QIXIKcxf8jkfl5lm3HKpA2ndW5fPrBrtuHQIckJpwCqBREGZ/hHf43DbmnDhhdYxhHr7itZtksYTBsSvqIe7NmonUj8JncDgxHRdLjOUR51AnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlbbJbxPo0aP4GzXhNyzBQhXAGPrmjhEpkBfIaFaaFQ=;
 b=YUgLHPC9FnV79qLmZYi1xX/+6Z4SV8yyfKnfOHImVXLyBuuGSKY5tmylf2Wt136dcaQ8TJRwGT+xALhoQhPRfjVQkRXF489s1o8OYvYMmmUQM4c2q/QBvYrEmURHLBE08aOiJRxNQ6gV+Xs0aH3/Cdkx41I/ucNl85Z3OvH8iA2911hmSJ6QtzG9y9XSFJlsUIijHQRbQES1/nnFShmZy9X9rfGYPL0N6AzKtMKYWTH/50IOiTTDblTvmjKwrkcZI3hQzaCYaX85VbsyuYlh/aZMFPiZ3iTP3AxMNRG/Luw3b1i+YZzLOlBFu7tU4Eg3vOm6bPlFh8pIecpu3tXyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlbbJbxPo0aP4GzXhNyzBQhXAGPrmjhEpkBfIaFaaFQ=;
 b=VMWRuQQ/qAKtCHZPysrxDcc0Qi2KZAEI62YXsQoiKPlhaBCoTmxAN1S4CREGe+wk4N4ZtIr/ajnR5Lnu0clAC14UBi4Nt8cxnSAkpVWxP7xo/wL+rW+ps2mVVM59QJ/pPcn2zTmmg/3jA8xNDQkDcn3hv/mlxRA6HViqHQPqPag=
Received: from BN1PR14CA0027.namprd14.prod.outlook.com (2603:10b6:408:e3::32)
 by PH0PR10MB7100.namprd10.prod.outlook.com (2603:10b6:510:28b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 17:55:47 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::8b) by BN1PR14CA0027.outlook.office365.com
 (2603:10b6:408:e3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Wed,
 29 Apr 2026 17:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:55:42 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:55:42 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:55:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 12:55:41 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63THtX1b3830916;
	Wed, 29 Apr 2026 12:55:34 -0500
Message-ID: <b80e17fb-7986-4a95-a845-48a7d318ff33@ti.com>
Date: Wed, 29 Apr 2026 23:25:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|PH0PR10MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae93de2-0712-48c3-4e45-08dea6188835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6r1FzQhZ19nRjc9AYdMmQVftwIcCeots8hfFPccgbYA0cyd2d+jJNs3WuNokOg4CvkCePht5nneCj6PdG9tlsCCnCGIvqfxouluZZ/RwEHT5X7W5pjywMXD5F12Rwt90OkfgvNomvY0mR293eVef8HgBFn35w1609Nk3S2QjgBzBgRcJNsgtC3Yh1SmbJ1c5DPtgADBQPh9gNxojT7+XCmMQxGdY8pEhAsGDjdcf9AbgYQHJBd7gJfZBduavvEV1Ky188xK86683A9RC7lpVoKLo1zChiadYXrx0FRqaDhptCeK+TGwOQo8sKGSG8eI7vesBS01d4eJiA5tCOaoGq5MuFQIFYRdh1qov8JJXH3AtUtQkBUdi0Kqe2oiZNh2L2Uk/qE0iKqeY7ZqItrvcuIc9Vtbte05NE/J7ZdXq7UVqCQZ95sm8WLbabst0/k8kd6VTKsIlSORFbsmyWW2uTc7JRfENDF4PhcwwwV/wVVKvlzkvxoyrzjQWb5uL3bcKM+pDOAxJDlDlV+EAkRb9jJUEKlc92LdJV/7N+lHj5vioTnpVlib5JxhpsDjtgCph9aH/AnZTnUySlITpEMwYstezShxapzbEsGdHxrFQXv74OL6h2gRPHUeNUFU+MWxVVDatXcc04lVyXdXD3QkvZxO8niV/vP6ruHP5zV4IvzJnVK6pRRSCeO7QnWK+zzNPS932zJoL8ID3DY7Z5mXoRzB4KhkYUvSRicJM8KiPnqJJq5AZbOLgd7nmVCxdCT1jO5BUWAoVionsUcRW/8HZaQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7mMXbnVGA7ZBkonRmZbN9fU/IZXEGw0J2rWOhI1D132FODXcgH1b/eJszh8ZtMbhIXtcg1B6DcOwIgh6g+M8u3NkztZm7laYOMge+4itlq+f2CRGP8CBwDHzp9g37uDK8GNByK5fAn11Z8a6DZwzzWMSRzYj7qoxFONCBoWkxlcYan2Vyb2IRF3Jd83247FptkJXXefLGE+DJRD33BU6uK38jBfs8kpiJwNgoPq7JUg+CJSlM0CRw/PnIRAbPStIYKW/spk9FK8jlpQJD9OEn11Q3YG+AYtCOoDtlQdAfJ6fEgRB+vrTiHG2L/XONNn/MTM0+uheeC6pnb4MvbDMBS6AUW368MbQoR9F7L0YmIbZPQa/9i9UqR2gzoeYjjg+tCB7654sJ8uv+0atZw+MNR2DZcTTkxNAh80kQwFRxIFDbS5WIpIp+pEi/DA+FO/W
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:55:42.6615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae93de2-0712-48c3-4e45-08dea6188835
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105552_496454_E048E694 
X-CRM114-Status: GOOD (  17.53  )
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


On 4/29/2026 10:23 PM, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Sent: Wednesday, April 29, 2026 10:42 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>
>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
>>>
>>>> -----Original Message-----
>>>> From: Andrew Lunn <andrew@lunn.ch>
>>>> Sent: Monday, April 27, 2026 3:49 PM
>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
>>>> <brgl@bgdev.pl>
>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>> GPIO driver
>>>>>> struct virtio_gpio_response {
>>>>>>          __u8 status;
>>>>>>          __u8 value;
>>>>>> };
>>>>> It is the same message format. Please see the message definition
>>>> (GET_DIRECTION) below:
>>>>
>>>>> +   +-----+-----+-----+-----+-----+----+
>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
>>>>> +   | 1   | 2   |port |line | err | dir|
>>>>> +   +-----+-----+-----+-----+-----+----+
>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>>>>
>>> Some changes to the message format are necessary.
>>>
>>> Virtio uses two communication channels (virtqueues): one for requests and
>> replies, and a second one for events.
>>> In contrast, rpmsg provides only a single communication channel, so a
>>> type field is required to distinguish between different kinds of messages.
>>>
>>> Since rpmsg replies and events share the same message format, an additional
>> line is introduced to handle both cases.
>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
>> uniquely identify the target controller.
>>
>> I have commented on this before - RPMSG is already providing multiplexing
>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
>> one GPIO controller.
>>
> You still need a way to let the remote side know which port the endpoint maps to,


About this, we only need to do this because you are defining the gpio
controller instances "statically" in the device tree. I understand gpio
nodes can act as providers, but I do not see any device referencing the
gpio nodes you are defining in the device tree. If that is the case, you
can completely remove the nodes from device tree, and "dynamically"
announce the existence of these nodes from the firmware itself
(similar to what is done for rpmsg-tty currently). In response to that
announce message, Linux could send the "ept" it allocated for the
controller. That way, Linux only cares about "ept" and there is no need
to maintain port 'idx' info anywhere in the Linux side anymore.

Thanks,
Beleswar



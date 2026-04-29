Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBA3FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrydi5eifPQdALx9kN9OMrygMrzOlvL+9WlGxrQaOJg=; b=KDIq8+Q/AykZJP/bDTQE8iH1L/
	ghGX+p4y9a5/V0XGmmHy2NmXEOhDmeg/+bGXAaGH8aGVoV44A4j0mBQnd60QbPZPNVdvbhmTrvD7E
	ahp1BGPHTb2vqoW91aRfh5Sm1WOS5M2yb4Keqw5U5/7ljOiRGIVQjtS7dDFtCDaDgUn6wZLOdkUwB
	jGfDixW1myzD4fFrayqTA3eot4QlzaUS4l/TR2uFEdiweSo6QOr45ZRc9GbrHTOEtsj37i8p5d/BB
	eGGKQ9PAb6iRW+uu1t9jkGLdDGOlFrFyN6h55H+IamD1f/7SvzHoMfiBxH4rAtGQjaz6sEmws9Hjb
	vXDQzWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI61J-00000003m9G-0naF;
	Wed, 29 Apr 2026 14:36:09 +0000
Received: from mail-westus2azon11010002.outbound.protection.outlook.com ([52.101.46.2] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI61G-00000003m8k-3UMU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGgVti5s8ve+9oRW2N/fT4t8jlX2WXlhuMBLAIl7Mey+5tFzhEpOI8ZqUsVlgjK8NEmcsBXG4Yh6nQhmjj2jxXU6A8CA8E4WkliTJf3RqtWyjB8m5bkA9KLpkRu9UfSjfIP14/DsVW0sL7reEZXZFS2hDUnJGclApsRKCH3eehjtCCI3f+1qjDsDofsAsPnoPyFytVlJO0RhLiqcbaaknAPPX2KxWeho6gdVn0YtOuoQBhhaGj9k8AZFSYnhj7DKYCZdefQ5alhe5LMVlg7fmKUVGGQDiPTXbnsFyNTzZ7dWo9oa3lL3qp+dW2OpGl0yZ3nkP/VyIrCywY3qiZvM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrydi5eifPQdALx9kN9OMrygMrzOlvL+9WlGxrQaOJg=;
 b=dFni3UyqP2GIaBjNKijcXS/iWb427xrkW40eNv+kiwulHZMLavnOU8Zrf6zOMdopX8/mmwyVHGSJdSLKynYnvNbH9bftiWac+FIH2kaTKCPU5ht8bS9gkFHGh2C9o8BekD/p5HjgFtnV9dkBJlM1ke0kRV1fg+pjwX4eH/h+WZilRgP+XbU1HseN8SVfgGghaMAFuHgvSuq/NRenXmQQNo4nahTnWBAkMjFrI6E/h13n5QA4vlG7c34CgqQyRf43xKtTJrIu3tn562UajH4wtnK1RO51y/5bso0jfSIT/hud+rlkVi7X2kRrn3CZgkxGmg1H2If0erlfsh6X7st1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrydi5eifPQdALx9kN9OMrygMrzOlvL+9WlGxrQaOJg=;
 b=QkZEPg1akxIm4T0W/yeaZtfTGiTY7lF+8znRetP1ExjCVdMYaH9laHBzCXlRHEEAySIi2mZazG9jrc+1lP79UQvT38j5c4M+dTtor2Z4RIOvvEAMhe4HiCcZcr/33kpxFzAoidPbKquA02rqQLbhMxKlgGU43tUwoJNkJjx2YDc=
Received: from BN9PR03CA0734.namprd03.prod.outlook.com (2603:10b6:408:110::19)
 by SA3PR10MB6969.namprd10.prod.outlook.com (2603:10b6:806:316::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 14:36:00 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::f9) by BN9PR03CA0734.outlook.office365.com
 (2603:10b6:408:110::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 14:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 14:35:59 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 09:35:51 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 09:35:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 09:35:50 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TEZfVH3516102;
	Wed, 29 Apr 2026 09:35:42 -0500
Message-ID: <a067452a-9a8d-45ea-8bef-b44f851da7b2@ti.com>
Date: Wed, 29 Apr 2026 20:05:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <29485742-6e49-482e-b73d-228295daaeec@ti.com>
 <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
 <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
 <PAXPR04MB91858D4F2549FA068D7ECCC289372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB91858D4F2549FA068D7ECCC289372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|SA3PR10MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d53e4f-800a-4a20-8f34-08dea5fca1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: qFrb/kQdHn4xLG7o9LGQ3BuwOvV2fwIwEE/yEoTjn3HJbbkQfn6IaFhBtOCvwr1E694ULpuGfgLZQAqbPuESAaaenP3+DGguVFtdl8Dl7ZfVvmmMC4MhROuwa6PqEHUYIE/HxR+Igc6HXLIddJau2jKQ4i+JaTdDFegI/vm2YHrSfIHxFYimcbfysr3JKePlQngNPV4q+XT92sAk598sgOQv7F5F43+3V/b7r4cWiacr+VYuSfnjnyZzCbQ/C7b/XjlZYAYe/iQlaTuWiIJy1q+6IVSXag+fi+4658kuAscW2AxrfXTAF5UDMjWxmINwPzrRs5mhUX/tKlLLXbE6JjEU6QL33GykvJoP/jMlibqk7ansKoZAmaQQL2S985W+ApLRBw0YhcEnsTcCFCzePgxnbVNH5T/6MtsLD2mnoD5vjK689/2j06v7xz4yML/IqTP5BlbyGDm0dkquMAefEzLKcQIYe6aTqZovrkjfxLTiTlOe8X2sq1zdXah1229JZ7pVlhU1bM3ql9gKznZqNZy39NOv4uLwOWim7+SbW6bfmbrtmb+9JmDFdK2sCzposmMG1IK95TmIqUQ7WpdC0SvIfUnpaETtNEysf9YACqI3Clfr5LqbCDcsLAnJFCNT+QDxrbTKmxvQZEHbMT4BVI2JWQ8pmqK9GhUzgLkM7bNSY1qZEqjOE2208engi3tIVHgiaB6yzxo73BeOnb6Yfs28AQJS6BE7WCzbx60iWg0URjW+SSkZcTogFf/yPMunqTQZuGV61rrrJlKjHjAfaGmhomEw4ekZPxVAbZv05oP+DPZKy7tlKfJJksX08J5i
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZNkCmBjhX58/nGX9T2sADQ3irMoyczNEylJQGzz4jpcVJE8sBOJjEXAkfzcMfTcGK+sT33jQjgaw4/lqcsQeXIK/6h9r8fuTxx8Qw1r58IVSycdeXdM7dBPsMMS4Hh/DYBxc0pyizH+pvJWZ4yyD7puuj0ovWchouXO9CGgo3ICqWeg4s+81VVG12Kt6ePBcPWR+qsjiy/uIqr/broHZqymb6SjLcv+kkl65HVvsf19EHoQzN5cKJorjQN8DlO17MFT7bSaHFBKMMSD34zCilEPpP7Zt7oLtkHLjizvkSGlTe6KTbXDKExqkuEVF67CwkByV8tJIp/JIaFa3IwpPUT/3VbkkvnRQZxoUwbU7+lSx2putytr6FN0fLR+LWITELOHQYLl/mmLuWmYJe1p+NtNCCnJ0rVGqE1Tv3VTK+/Gi4jGiO+tT18yCUvmidblY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 14:35:59.5795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d53e4f-800a-4a20-8f34-08dea5fca1bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_073607_118777_9B9615C7 
X-CRM114-Status: GOOD (  18.94  )
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


On 4/28/2026 10:06 PM, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Padhi, Beleswar <b-padhi@ti.com>
>> Sent: Tuesday, April 28, 2026 10:53 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
>> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
>> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
>> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
>> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
>> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>>>> Nothing extra in my opinion. rpmsg_create_ept() just creates a
>>>> dynamic local endpoint address for Linux's usage. The firmware just
>>>> has to make sure to reply to the same endpoint address where it
>>>> received the message. This should already be in place IMO, because
>>>> currently you are sending all messages in the default
>>> Since rpmsg_create_ept creates a new local endpoint address on the
>>> Linux side, how is the remote system expected to learn and use this
>>> new address for communication if no additional logic is added on the remote
>> side?
>>
>>
>> Remote side learns the endpoint when it receives any message from Linux from
>> the dynamic endpoint.
>>
>> Lets say rpmsg_create_ept() allocates a dynamic local ept of 1026. When you
>> send the message from this endpoint, the standard rpmsg header would have:
>>
>>       85 struct rpmsg_hdr {
>>       86         __rpmsg32 src; // 1026
>>       87         __rpmsg32 dst; // rpdev->dst (e.g. 400)
>>       88         __rpmsg32 reserved;
>>       89         __rpmsg16 len;
>>       90         __rpmsg16 flags;
>>       91         u8 data[];
>>       92 } __packed;
>>
>> Remote side tracks the dynamic endpoint by reading src = 1026. And while
>> sending the response it fills the header as:
>>
>>       85 struct rpmsg_hdr {
>>       86         __rpmsg32 src; // 400
>>       87         __rpmsg32 dst; // 1026
>>       88         __rpmsg32 reserved;
>>       89         __rpmsg16 len;
>>       90         __rpmsg16 flags;
>>       91         u8 data[];
>>       92 } __packed;
>>
> This explains how reply messages work in this scenario: the remote side can simply send
> the response back to the source address of the incoming message.
>
> How does this work for notification messages initiated by the remote side? Should the remote
> system need to add additional logic to track the source address based on the GPIO instance?


You should already have the tracking logic in firmware. How else are you
sending the notification messages from firmware with your current v13
implementation? Are you assuming the channel address to be always the
same? If so, this is a bug and should be fixed in firmware because the
address is generated dynamically. For example, if another core announces
its name service first, then the channel address for your core would be
different and the functionality would break.

Instead, you should have a map of ept to port idx in the firmware side
when you receive a message from Linux (just like we would maintain it
in struct rpmsg_gpio_port in Linux too).

Thanks,
Beleswar

[...]



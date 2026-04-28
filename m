Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C0AFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UStshenfl68evDw2oqhtmkvKFIf5e8GSvhJpCiE/Q0=; b=uJyS+kE1DNwvK+J8LC0hPHzSne
	Ox7D43MrzuyEKpcNk384Lz0lRp0pPWzBfW0EqDGm+z35y6zA5sHAYBC78hy6asxLnEgtemvblpWST
	Kluzj8QepmoXoTDXRsWhQ7k1IKcu5ZNlONlE+RzcIE2+9qH2j+Prdv6cBUlgsyuqFdkvxJAlZCNx2
	NyDkb8QgETkt21kZtRn84/bcz0OEUZiX+jjdBY9zZrSMiqbC0HVGkJSnCOb1ZoqBH8TLifK/P+CWV
	7fSjKnIqfijzTj0ltW2KS/qQ/NVxc2wGYaePnksOQQva3D/5djxeHgtowjxYd8o1Ii5ytn5dpKL2f
	IPgVPcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkkU-00000001mAk-2lQk;
	Tue, 28 Apr 2026 15:53:22 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkkS-00000001mAO-1cyV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 15:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HruA0eW3NYvLDOWfAWJH0DDhUiDG7h1Q572CyA6mZ8YEdEiImjJHMkbZrDn7TiQE66v+8dMEtlqKJGzSPLe6uXxteIr9VCAgOarBctFYh0bmoFoiuC/4DPdNNDRtDWegiHr1nTpXNRmmFgeoE/oe9fcblu3vJMjMSSqYVLSNPUw9BgXVSu06Ijl8aHx7PHWj1p8YkaKP10E9fMe5I4/R454g0S7T9mOv8TORPTOUR+5Fa2YmTjTi4rgL4j5e9qfMuzY2zuC2/Zto3hVN+75RbAIq3Z708upX39rdrqrPbSBm0TZlJxqLhf7qNNUvTaAduuwV+GNJCoijrcKQXMjiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UStshenfl68evDw2oqhtmkvKFIf5e8GSvhJpCiE/Q0=;
 b=IYwL57UEyVn86aZrNjagmIHg0KAlPbk9MQw0lBQ9Uxrv5cdtmKG+z6huC5IHMyPxsPrc4tVubfk0XLBtxN7f6hktZp8Wf4LutHfuz+e/BaRg5Jt/lwcpkOMeGWZwBJ7wqUHAsjjMHuFKt3dgTvzSWNm9RzQwB3OFcnst3o6tX4IYXzQZ8Whsw/Xv6Hdm1yAqcQYFWvIGvixsDEF/BtxACEr1FtLE+nVwZYTePlilQXcZyXzvpOu0YEF2BbJJ4w8avW3GOw3n2abD4mXy69Z65tDwDvrcWsbUR/YM5jvDvsZakwL+qjBVoDX3PJiLPTlHGLYJNMpQU+XmqbhG3li3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UStshenfl68evDw2oqhtmkvKFIf5e8GSvhJpCiE/Q0=;
 b=wUNsd3ieYJcbQ12ceNFAH5RdAZambVJsXFUt2S7hxKuPe24rXdQGkFjSpOrsEwTs31QRrHl/eNb6csBh6k7BgCTUR29NNWPNlUOpQBHlyUY8ZtJVdNWNYq6HfL8Z1ZE82oSY6TLt3r37KYuKI3yhXp9Xyy2v3o0B5FblUnobTcE=
Received: from MW4PR04CA0141.namprd04.prod.outlook.com (2603:10b6:303:84::26)
 by PH3PPF654CF2C22.namprd10.prod.outlook.com (2603:10b6:518:1::7a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:53:14 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:84:cafe::3a) by MW4PR04CA0141.outlook.office365.com
 (2603:10b6:303:84::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 15:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:53:12 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:52:54 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:52:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 10:52:54 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SFqjvA1490451;
	Tue, 28 Apr 2026 10:52:46 -0500
Message-ID: <8c8cefaa-7d9e-4b73-b92f-40cb52b37f2e@ti.com>
Date: Tue, 28 Apr 2026 21:22:44 +0530
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
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB9185C7741DCC422212F952CD89372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|PH3PPF654CF2C22:EE_
X-MS-Office365-Filtering-Correlation-Id: 44843551-f79e-41dc-a1aa-08dea53e40d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: khVw6HnJblGWI6nschW9vDJPmY6vXs5lOxRoLXee2LtlAjQkLFTeNqlyw86TDEkWSilDze34HgNR1Fjx6gRAf//5pzvpISDJe/NYWG2JhZO8Qv+BS1IiEJ0dWxDX3FPuPO9CezGHhHwH0O7RVUBkiSsdmGRYTSSMZ8DYbufV051iwz/6Ov8VH8FZHsQtFqr0ZU+bA9SRoMt87GZ1aiuU5iothH1Q1FtXg1f4u27avW+7BQ/8guT/wy6nfueud02aC5ts0LMkdHURn1kt7mwr2r30xV3a8joEt/fs/WLCgykPSM19DJZ4OHmnLcblNgb0WVjriMZF4IXI9W7jFxR6r3VWFtdh4MC7jIgUrg4vcFriQXZf6AQhrGHw1S+Bg/5ZKFA7lX3vKzZYqzqSkapaoNlmGpbMrbH7rkkrbHWHMzlmxLgj+0wl0oUqGAuhOmQ65gZbBNVrnY3x7o/6h2lW/qrpFfT/A14ByUsV0DgQEO8nTLlW7hGbUIh+B7szeuVgfRvP8NhRX1er5oRskSc1nuSg2y8LVFC/5N1lWOJhdQZrlRTIizy+TKwKk9GHI74ZPBY0gNqMGOjwUY1ojZkYB0z7j8CgkopJ0snsQ5Ob+f+qNKzaf79NLAKsD7cfAGGhbYklscmTOwZict0ezD8tbbdVgUaj+uRFx62qx8QwmwNPM4Z9cXEWDiLwanJS6gIZomAgRNBbJcDyaPuL9zZymUpFB8yXRXjqgmUVXpDWmqzXbdUpEkYfobZY/BMWqbXrc6rRVt+nWC/WeaLiT6tqMA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: or24YdhpPzw8ZHHYFITXLjGnydT9c2ScOM1l8RS/RX6qVa23ZZi/e6CEeorXw7x0EF/OjqhjOEjj7z4NmDPNQA6W6wXFRnIf0H7vfaGaWtGa2oXjE5F7s96KDkyI1JjUQnsZAtCTHpTC4hwaFGM0D05MlVTF0NrQNwPbOCEAeGm21SeYSUFVnb5xoGAAimizVzeu9reW7c1WhxU9FjxKA1Ylha62lsXQaGJphWShLfick9r0qXZKuhL41aVAF4yJJfnhxMMemaMqFCfaTkvJ30KB9j6qcaRPojwzjKhIfjx6LWN8w410eu6mkuNd9wgb49nda1THIXy9fvH+ozbFEuGIEVeHzcT+0gnecX5jtq5tc9lZHTBxtk69ouIS/tj4/uiG1ZostlwkMSKyXlcMEFDKURalI1o0glA4gk0qL3bpYc4CLIj/QIrVRrtQ6bz1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:53:12.6043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44843551-f79e-41dc-a1aa-08dea53e40d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF654CF2C22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_085320_459316_BF0F2142 
X-CRM114-Status: GOOD (  21.95  )
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


On 4/28/2026 9:01 PM, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Padhi, Beleswar <b-padhi@ti.com>
>> Sent: Tuesday, April 28, 2026 10:11 AM
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
>> Subject: Re: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO
>> driver
>>
>> Caution: This is an external email. Please take care when clicking links or opening
>> attachments. When in doubt, report the message using the 'Report this email'
>> button
>>
>>
>> On 4/28/2026 8:13 PM, Shenwei Wang wrote:
>>>> -----Original Message-----
>>>> From: Beleswar Prasad Padhi <b-padhi@ti.com>
>>>> Sent: Tuesday, April 28, 2026 2:25 AM
>>>> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
>>>> Hauer <s.hauer@pengutronix.de>
>>>> Cc: Shuah Khan <skhan@linuxfoundation.org>;
>>>> linux-gpio@vger.kernel.org; linux- doc@vger.kernel.org;
>>>> linux-kernel@vger.kernel.org; Pengutronix Kernel Team
>>>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
>>>> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
>>>> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>>>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
>>>> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
>>>> GPIO driver On 28/04/26 00:53, Shenwei Wang wrote:
>>>> [...]
>>>>
>>>>>>> +     void *channel_devices[MAX_PORT_PER_CHANNEL];
>>>>>> So this is technically a rpmsg endpoint (struct rpmsg_endpoint)
>>>>>> without naming it "endpoint". Every rpmsg endpoint has a reference
>>>>>> to its parent rpmsg channel (struct rpmsg_device) which represents
>>>>>> the same information here. So we should use the framework standard here.
>>>>>>
>>>>> Yes, agree to use "endpoint_devices".
>>>> I did not mean to say to just change the variable name from
>>>> "channel_devices" to "endpoint_devices". Infact you would not need to
>>>> have this field & struct anymore.
>>>>
>>>> Pseudo-code:
>>>> 1. Add a 'struct rpmsg_endpoint *ept' field to struct rpmsg_gpio_port
>>>>       to maintain the ept to port idx map.
>>>>
>>>> 2. Call port->ept = rpmsg_create_ept(rpdev,
>>>>                                                               rpmsg_gpio_channel_callback,
>>>>                                                               port, {rpdev.id.name,
>>>>                                                               RPMSG_ADDR_ANY,
>>>>                                                               RPMSG_ADDR_ANY})
>>>>       from rpmsg_gpiochip_register().
>>>>
>>> On the Linux side, we invoke rpmsg_create_ept. What is expected from the
>> remote system in this case?
>>
>>
>> Nothing extra in my opinion. rpmsg_create_ept() just creates a dynamic local
>> endpoint address for Linux's usage. The firmware just has to make sure to reply
>> to the same endpoint address where it received the message. This should already
>> be in place IMO, because currently you are sending all messages in the default
> Since rpmsg_create_ept creates a new local endpoint address on the Linux side, how is
> the remote system expected to learn and use this new address for communication if no
> additional logic is added on the remote side?


Remote side learns the endpoint when it receives any message from Linux
from the dynamic endpoint.

Lets say rpmsg_create_ept() allocates a dynamic local ept of 1026. When
you send the message from this endpoint, the standard rpmsg header
would have:

     85 struct rpmsg_hdr {
     86         __rpmsg32 src; // 1026
     87         __rpmsg32 dst; // rpdev->dst (e.g. 400)
     88         __rpmsg32 reserved;
     89         __rpmsg16 len;
     90         __rpmsg16 flags;
     91         u8 data[];
     92 } __packed;

Remote side tracks the dynamic endpoint by reading src = 1026. And while
sending the response it fills the header as:

     85 struct rpmsg_hdr {
     86         __rpmsg32 src; // 400
     87         __rpmsg32 dst; // 1026
     88         __rpmsg32 reserved;
     89         __rpmsg16 len;
     90         __rpmsg16 flags;
     91         u8 data[];
     92 } __packed;

Note: Remote firmware can also send messages from dynamically created
endpoints on its side, and Linux can learn those in the same manner. The
dynamic endpoint address is passed to the callback as 'u32 src'. So you
could pass on the 'src' from rpmsg_gpio_channel_callback() to
rpmsg_gpio_send_message() as 'dst' and call
rpmsg_sendto(port->ept, msg, sizeof(*msg), dst) to reply to the dynamic
endpoint on firmware's side.

Thanks,
Beleswar

>
> Is this handled automatically by the rpmsg stack software, or does it require explicit support
> on the remote system to exchange and track endpoint addresses?
>
> Thanks,
> Shenwei
>
>> endpoint (rpdev->ept) which is also dynamic[1] and is created when the channel
>> is created. And you receive the responses correctly. (Unless you have hard-coded
>> the default ept address in the firmware)
>>
>> [1]:
>> https://github.co/
>> m%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Frpmsg%2Frpmsg_core.
>> c%23L480&data=05%7C02%7Cshenwei.wang%40nxp.com%7C4ec06bf01bb14dd
>> 2625708dea5387471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
>> 39129859078622527%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
>> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
>> 3D%7C0%7C%7C%7C&sdata=OUmjqOdWqiXSTjPDv1TUvrjKP1YTx9ji44SdGlIR2n
>> Q%3D&reserved=0
>> (chinfo.src is RPMSG_ADDR_ANY)
>>
>> Thanks,
>> Beleswar
>>
>>> If the remote side does not need any extra support, this would be an excellent
>> solution.
>>> Thanks,
>>> Shenwei
>>>
>>>> 3. Send msgs from local ept in rpmsg_gpio_send_message() by:
>>>>       rpmsg_send(port->ept, msg, sizeof(*msg));
>>>>
>>>> 4. Get the port info in rpmsg_gpio_channel_callback() by:
>>>>       struct rpmsg_gpio_port *port = priv;
>>>>
>>>> Which also eliminates the need for struct rpdev_drvdata as you can
>>>> just do
>>>> rpmsg_get_rproc_node_name(rpdev) from rpmsg_gpiochip_register().
>>>>


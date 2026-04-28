Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5C4FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0c+qrs/gClkxq5tXcm9hTzsCZbcAtpodGQaBqTNm8o=; b=CxdjcYZY7YrUj+64iy5DfSBWH6
	BfFN8p0ipVeCsPr8kEiseuIKy9cymHIy+Qj8mO9jz40/JVD90375cHZx25ex++JF+Y+c6nfOu2BY3
	e97JVwmd0Ci27Bg7fNO/NFgo7gqh4x8hsJj4dJ2TbxBuUatS7wu1aEurYbF7Q42Pu11BMBYeZ+Tic
	5+xkxKDjSqbNhL99nz0VAql+gu2+fE26Pfm2JeWQKyCXaFTrER8crQ9UK73F4a+eBWq6darIkbNsf
	L9uO5v6APEVsum2RRqar6qcJ5JDCwM4fLzoHpAquJdzrc2IyOxAg9zvRR8hyPHHN78GM8H5E+a4VE
	urhXkH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHk6M-00000001iLP-34Tw;
	Tue, 28 Apr 2026 15:11:54 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHk6J-00000001iL2-1b3I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 15:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQTS6Akx8e5lJdZKsXDT9hgdHx0oidbkLH58HKSIgxbBaft+H66C4RzOPpYpYfflTfJ3lHsgmNhFTODMwsZqx+SJhFnWAE6wXJhftLwnLciyU7ITf1cviCjri5kjc443zCoNd8MUmqu8bpsOnNYkKStg8OJd/LhO/LHtsq1cqE9L2/j5/7FCHy/G6uOHlPApXp6T4An98znT9TDFqZ2Tl+FLSqPAoND6m6IvOVzpg6WqZazs4vEOx5q9mL1kQ84/RX4cd+n8XCTddJmszLZ2iYtbgjIuyIJobTkfXhi8BtZbrcwAPpuLer+5wzbx05WaitEToPjasbsRiDiiiRXaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0c+qrs/gClkxq5tXcm9hTzsCZbcAtpodGQaBqTNm8o=;
 b=g7Z386TzHpJi+ot375VInO3rV8Xp77Biye4DWHLQ1fUKkFH/oVLxohcGe98PUq+eQ2uZ8TaIl/Vft01iwlH6P/dT9zuPFXu4NKoxGopSuyJ5FjcS6RJihG5DFyhFHmMakQC8ZzEKSssQWMrPExD1sctRlVX1eBZHY6X9f515253sw0FYBXLGbHL/UreQe73u4jt+dDqD5D8sFHWg9vFNNgajTb+zBSMCKhGaB0IirOAxBEgf/IiLGqBsMyPoPH9pm/h9qQpylSZ8qJGOGFOREBrDIeUORlzm8HpR7D1HnMEuqmeO5GpHKxRrRIbULFH1gT4a1HxeFNoeEEZRDlVVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0c+qrs/gClkxq5tXcm9hTzsCZbcAtpodGQaBqTNm8o=;
 b=FipIaiMKuf6G8RaqN9zPdLQZbo0EnbyMyHx551RcVANun5FrMcXVd4sYxbsAx08twZmUkihH9xv/4MtAPxI3wWK7fcQtSthnGXI3Ra8tql/iUClFKudQjTrIy01Wd+nsMMFbsuTOdlV9bTPDIDMJpAZXcP1uOHQ+LVEla3o/6Zs=
Received: from BYAPR02CA0050.namprd02.prod.outlook.com (2603:10b6:a03:54::27)
 by DM3PPF3F503E3E3.namprd10.prod.outlook.com (2603:10b6:f:fc00::c21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:11:38 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::7b) by BYAPR02CA0050.outlook.office365.com
 (2603:10b6:a03:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.27 via Frontend Transport; Tue,
 28 Apr 2026 15:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:11:38 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:11:37 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 10:11:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 10:11:37 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SFBSel1195788;
	Tue, 28 Apr 2026 10:11:29 -0500
Message-ID: <32c119af-96ad-4da0-86f2-cdc4ba57ef0b@ti.com>
Date: Tue, 28 Apr 2026 20:41:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO
 driver
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
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB918568939EC7DAEB4BB6C8F989372@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|DM3PPF3F503E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 0106b3d0-ef24-49e4-75d1-08dea5387214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: FlyLp3yWrAZXBDlLKReKJdGAYPEfzPJQrEbgqZD8yHV9ELM6+9QHcnK+fB+J4ZJHcPRhNzSR/DsPNYR/4LmlMXG3oW43ej/jYa5QiWO37N9G59yVkwYpgfHy4c88h38mjBDM3vhz2MaW28d43Egl4rVYL8y5dUEHIC70XnR0OGjejjyxyOAESnj6P5lQ3kocQ0fHnOgULaj1aSmH3Z5WgAS5Nc6zbkHyYhouhxN8xDs8jIHtY3FlaQASZioeB3OTpdnAOBcveai2KebK4RJuYci4QvYjz0Juo1C3ZrkYBlIcTMo5XedrsU9FRGK7NfC1Nr7NJTTPYUbtrVNw36dG7LeZMg3M6V38pFDGhWOzOYX1XRS6GyBDaGPfp2gI1p9T2aixNCPgZkQH3JzPTPM4bpD/tZdxeqg17P/SBv7bggVc2dDgrn5xfSnwvJcdoVNU+Um0ClRISHQ3/Mw4TbWuYZWG5oLlkFOuDVHb/Zxb3H1C1iYR6ZeItIN5+GdH/K7ybkNDvP894+era3RgBKNBdSFDGAoCIz/2nxqHFgUnEkhoID97aVhLWAV+fZQ0I4pA1JKkxaRVT79POrD0HPSU/MUIars61hNUOUjXUM8MOE6mjo814Tx3/+Okpqx+usMZsowAr2hYOu2ohnsE5fy24wLcPaPwCdQsLS4M1Dwx8DZTcPEAQUJv/3e0fgAu5gXTXMotFi/MgYWNaTbReauM+rRRCvS7Kghy+PjRNcfd8x3OQ0uZRvYN7yMSAAslHjrVIeBZUNuANF9PwmZSIRRtsqVwx8W8ubJFgB9sqXm/Sjz76/k6CCZOyWiObJt2k1JI
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 15IchVaeXB35DYOSULofuzjNXMYdFPuNq5Vieos2zAKAkWDC1/MFKYVQZtSc9Va+poMYZvmQLuNSQfxnVMqqpV96iJZNVUbxO3citwAh0hIr/aO8K6mDTv/gUAyv135eXm9LhFDc3FzIezCR2a2vMcLEeIKUflYyikGsdyXRqpzNqaHz27wzb6qqoQbJl5DkeoSQ9hKOikxZJSQy/9IMw9W+cVtTsImnQHp8Mu0jA0LJaJTQEcDGOcOOiwEleUHwVh2KKpQXTHR8j/IlQosssiTh9SxTATg4FVK7h5xoPTNPJNOVX1IxsiiZpUcuhzg8VvGVWphfBL/LANRnkvgMIsSh4vMVOEVakLVt4IUlKRV1GmD8WADh3WugAGvGjL2srqftugGpssTWhNauwSFj074g7MpHco1TrlslbbuaNJcPQwycFVntFXJuy5j/vAnG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:11:38.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0106b3d0-ef24-49e4-75d1-08dea5387214
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3F503E3E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_081151_528968_C73E4F53 
X-CRM114-Status: GOOD (  15.42  )
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


On 4/28/2026 8:13 PM, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Beleswar Prasad Padhi <b-padhi@ti.com>
>> Sent: Tuesday, April 28, 2026 2:25 AM
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
>> On 28/04/26 00:53, Shenwei Wang wrote:
>> [...]
>>
>>>>> +     void *channel_devices[MAX_PORT_PER_CHANNEL];
>>>> So this is technically a rpmsg endpoint (struct rpmsg_endpoint)
>>>> without naming it "endpoint". Every rpmsg endpoint has a reference to
>>>> its parent rpmsg channel (struct rpmsg_device) which represents the
>>>> same information here. So we should use the framework standard here.
>>>>
>>> Yes, agree to use "endpoint_devices".
>>
>> I did not mean to say to just change the variable name from "channel_devices" to
>> "endpoint_devices". Infact you would not need to have this field & struct
>> anymore.
>>
>> Pseudo-code:
>> 1. Add a 'struct rpmsg_endpoint *ept' field to struct rpmsg_gpio_port
>>      to maintain the ept to port idx map.
>>
>> 2. Call port->ept = rpmsg_create_ept(rpdev,
>>                                                              rpmsg_gpio_channel_callback,
>>                                                              port, {rpdev.id.name,
>>                                                              RPMSG_ADDR_ANY,
>>                                                              RPMSG_ADDR_ANY})
>>      from rpmsg_gpiochip_register().
>>
> On the Linux side, we invoke rpmsg_create_ept. What is expected from the remote system in this case?


Nothing extra in my opinion. rpmsg_create_ept() just creates a dynamic
local endpoint address for Linux's usage. The firmware just has to make
sure to reply to the same endpoint address where it received the
message. This should already be in place IMO, because currently you are
sending all messages in the default endpoint (rpdev->ept) which is also
dynamic[1] and is created when the channel is created. And you receive
the responses correctly. (Unless you have hard-coded the default ept
address in the firmware)

[1]: 
https://github.com/torvalds/linux/blob/master/drivers/rpmsg/rpmsg_core.c#L480
(chinfo.src is RPMSG_ADDR_ANY)

Thanks,
Beleswar

> If the remote side does not need any extra support, this would be an excellent solution.
>
> Thanks,
> Shenwei
>
>> 3. Send msgs from local ept in rpmsg_gpio_send_message() by:
>>      rpmsg_send(port->ept, msg, sizeof(*msg));
>>
>> 4. Get the port info in rpmsg_gpio_channel_callback() by:
>>      struct rpmsg_gpio_port *port = priv;
>>
>> Which also eliminates the need for struct rpdev_drvdata as you can just do
>> rpmsg_get_rproc_node_name(rpdev) from rpmsg_gpiochip_register().
>>


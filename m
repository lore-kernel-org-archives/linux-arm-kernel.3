Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F3CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxfA7Q5Y7nD+gwUuDUFShjq3jiQelPWszk2doqWP0uE=; b=2/aMifdY9coZu09nseon/3jB8J
	/PbkW2WiKNwxSY1cfDHqH0mj/I6fPfbttC0nbP2wYdE4OPwGEOj8WVm/ShGnMdMPzi2vvFe/USoTg
	lXL5IQMnm5BOOqEPP7SxMDmdV7lWlbNwF2wf9nr4IJNWrP2uELrQrBA9s9NGN1HBCn/JWmU87ikN8
	u1F/MysgvRjDz3JVbhDv2OgDTz0/fH7DRDdkukuLLlTFDn5dLRoDaxvJp12E4bcM+c6pVGHj8hEQz
	LPUSjDu+WParlcMg5i3UGrJvYS9qXKx4ELkw9rPbuBSero8BQLdEBqCXqJTAcuNXbxdv1RForU/sp
	wiMgKu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtHS-0000000EmWK-3Gw4;
	Mon, 18 May 2026 08:24:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtHQ-0000000EmTu-0x82
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 08:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JxfA7Q5Y7nD+gwUuDUFShjq3jiQelPWszk2doqWP0uE=; b=LVmvO46OEm8WF66su3N11rdt3C
	2M7GkU0SdmDLwYHvpnMnWzwJGM+9XcI92853g/611MK/s4WXR+gxxnAX5w5fAZe1YMaRWmuT7dBaX
	2Qb2EXhMndHgnlV28947WJLe+jXtGj5mGWaQgH9SV1DdP1nxkCCgDUaY6Io2E7vTeyLSbmFPZScxw
	ii2giPRWu2WgKzSPiXzPjKUziCmWjtfbf9j2UDSNjhGj1h+Y96h+fOGfpBVb2cYC9EtiD98GaVKJ5
	1Sm+SppnMaQjwA8sjrW0E14m292szHbfEljo/w0BBeXqswGeNVxn86Ia495TgQGxGadfmqDIEY3Mc
	fynoQIow==;
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtHL-0000000AMFt-1hpC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:24:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMiCa9pUDZE/zplmNIjkofkYjRWq4xkU+ooBVymhHrvjEHQRObCIEOZO3XGI7x9smA2GsyPCU4o5mU4Ou2oyEEO6+F71gDKbhm2PIE7L4QEaMlt2FyftQbWTJvWejARSFJymNTRDeHye+Gf2Ca85ZFEmiITpvJUNmAZtlkyWcKq0LTAsuGaZwb4NBK4foUFepi81ZzvJmzG38naNILKEkLcXqkcr7Aef0LO9aakLXIyQpGT7VkBP/GqM2pwUMjpWv+DQCMjBK0l16fvOmvOLjyafzbyQsLd+sig99OWBgRmVs0xlDGYKApOGkOYcNaqLNU0hrKcTy+4+7MEonI+biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxfA7Q5Y7nD+gwUuDUFShjq3jiQelPWszk2doqWP0uE=;
 b=Ayg1liI2FGOXtwVlGNic4sa+2rhgIjVqPqnPk6blH2SJFSKf/rQ7oThZRwziFj+dDZr6O8aj/i/X64lhqdNRumbxTStU5s4F0j59L1FsTX8aYwZPrJ08NAQtpApstS0sTI7cTnpmOeceiorTz8fkZSyDv77IZmEy99tqdjGpbMw3rCB+tL+Z5ZGnNo80RyP5+YMkM6IAug750G7vt1Thbxu01huG7nAlbdEh+N0d8zmckjaeHCwvcOmILJ7DllkpKQ5W4AZ2azE8WmAeRXS5idy0o0bJ2QXrwyl9qKdedzc2X30az1BPraYvfJukczo0KR+TCa/M25d0EkIgVD+ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxfA7Q5Y7nD+gwUuDUFShjq3jiQelPWszk2doqWP0uE=;
 b=DK3MxUcDHdwIPoZxrQHIvJt158ag6cUx45XHlHoTCBdyfPU1r998XNdlepF7DfZhfJsWUQydjX4wxpI2MiWtz9moVK8r7xgaxJzpoOQBIzRs2ah1IqVeaZkEHPJiV81/xsu9nxhs1JK7Br8AjNPblejzv5zq5rGE2s1A+t/TiNE=
Received: from BY5PR20CA0025.namprd20.prod.outlook.com (2603:10b6:a03:1f4::38)
 by IA4PR10MB8685.namprd10.prod.outlook.com (2603:10b6:208:566::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 08:24:38 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::ad) by BY5PR20CA0025.outlook.office365.com
 (2603:10b6:a03:1f4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 08:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 08:24:38 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 03:24:37 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 03:24:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 03:24:37 -0500
Received: from [10.249.32.6] ([10.249.32.6])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64I8Oaos1481366;
	Mon, 18 May 2026 03:24:36 -0500
Message-ID: <2e09535b-805a-41b8-90ce-a4306624d279@ti.com>
Date: Mon, 18 May 2026 13:54:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Lunn <andrew@lunn.ch>
CC: <tanmay.shah@amd.com>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Frank
 Li" <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
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
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com>
 <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
 <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
 <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|IA4PR10MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f38c77e-bd0a-4306-9aae-08deb4b6e6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|22082099003|18002099003|3023799003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info: wBXI1WJRsU9LsOnjO1dLJ7YbLT6cDeA2h9rofWnCfAQZ3mIg7IaXX5CKNXiGbrc3HOEJ74w5R2/ha4pa+QhUv+uEWiscyr5Gj15yitxPDaMDngwXFe9gTmA3ddNc9QH/3KWJjrY41VPdlK8+bBmURW/UTxFLWsLLlfs3qynwFb2EBxlsg3kfxxYz3WwX6ztJ2Qm3ZongdMZslurrzzknFlUgxaTjg8mLBZ24u1WxiFnMhS0mT3Rnm5SehSqib3CvaNNrfijY7uhEkUFl+BBw74oDxRetCXQECYsF9Y/9mmro5wkYFsaB3vrHtmz/3zDS5/HwMF79UmMv1wHYG9LXEyu/2NYWumFij2Pe6ZIWioiiKjtL2vuMMxl3s99sHsOpH6hBp8JElRHuHo4K2cexj+27uD+4SoMWVQei85tWy0niCiWKp0qUkbK+oOhLA9ABTVcWHqMU9Yywslk9A4/grK2gN/bFY5enq7mhq7BaadTfpOdir2AdFtRQELnUvx1E2IM3epTwL8lfy/zMOOEMg/yPfEmvKCHFERDOYz3LrqMbUMQwJnVkVm09GSQ7K174lUmcZUfWD0kAupsHqMibz8LH1WaNUByxBVs5J1nuFFJ8UZZLVzmzb2xMVQCkgU0akeV7g9z8dw+g3wwGOiiO7BstlEDv1ZZyoo7w54DDP22IXi2YmYcGn/mlN4mRJVqn
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(3023799003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jf4ohXrAPs7qpDiZy4tK9VbeJ0UG1+nLqu8Brreiwm/QRPD7aTEnsHKZx//RxE5KYn9nQlvTgV6jwYxhWb+yt3svUwRk+U9xyjyZEoJOJe4EMLhfWapMxoKCZzsXBdCH+i3HQ/ZvOUMuOpPN9uKyJK7woCf/TzYS5+6yfKtCh7rC38rMuJ1kPkzII/XyGT+fuDRvRhqKpXx3C8zwQH4X7+0fulU08okixEDNdxaJOVCf4N9JnvRvUrHA2GVR4SplJevjn61o2IxXfPtNU8+l7awUa7cLk1Nc7qC3QTuXxmZKJfdVGSgSQEsBJM6c9kUq6yyDuACOOXr6/S81Mnz5douEfRMOSAMZJVI7Y8/C5eYo0zF0H8Q3Rb77yVmM8kbo2XyR6/EL53pX7oiNbqldI346NanLrS8qoGgl+9FJeN1lx4p5P0sOiaJCzOVG0UUX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 08:24:38.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f38c77e-bd0a-4306-9aae-08deb4b6e6cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_092448_647827_0E4C6B44 
X-CRM114-Status: GOOD (  18.65  )
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


On 5/12/2026 8:51 PM, Mathieu Poirier wrote:
> On Mon, 11 May 2026 at 12:18, Andrew Lunn <andrew@lunn.ch> wrote:
>>> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
>>> GPIO controller.  The remaining issue it about the best way to work
>>> out source and destination addresses between Linux and the remote
>>> processor.  I'm running out of time for today but I'll return to this
>>> thread with a final analysis by the end of the week.
>> How many of the participants here will be in Minneapolis next week for
>> the Embedded Linux Conference? There is even a talk about this:
>>
>> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
>>
>> Maybe we can get together and decide on the final design after the
>> session.
>>
> I will not be in Minneapolis next week.  At this point I think things
> are converging into 2 main takeaways:
>
> 1) A serious refactoring of the protocol to include only what is
> available in the virtio-gpio specification [1].
> 2) The specification of GPIO controller number in an extension of the
> namespace announcement [2].


Fair enough. I am also aligned to use this solution with the support for
wildcard name service matching.

Thanks,
Beleswar

>
> Shenwei proposed embedding the GPIO controller number in the
> endpoint's source address [3], something I'm ambivalent about and
> still have to look into.  I also have to read Tanmay's latest
> comments.  I'm hoping to be done with all that by the end of the week.
> With the above (1) and (2), a new patchset will be required to reset
> this thread.
>
> Thanks,
> Mathieu
>
> [1]. https://lwn.net/ml/all/afjyH5JT0JS2j0L5@p14s/
> [2]. https://lwn.net/ml/all/afzIABSh1xtMEGbf%40p14s/
> [3]. https://lwn.net/ml/all/PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com/
>
>>          Andrew


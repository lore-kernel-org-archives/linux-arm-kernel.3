Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFAFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 05:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOk5wfbeYS54zS1/tFcTH+ngGVL9YXJA1CGNJRGjgps=; b=PwUp7tPqMacMYdjolM8BjIv183
	xK40Skw6M0tAK6yJ7+auV3l3CdJvPDR6A0xMWFDjgIXc2EjjiT+o+dCaW7TBjIiv4UCWa3Rj1CHwW
	fG0SnVMNQVu7AECR0oy8wEielpC48K7ak8PREoAY09h/cV784/x/yWEVtoArdA3Ex2ZOmpe1fbKij
	AuiLkzBH27dbskAlDINEpEcLaK8nd5yOrXKcfyAUEgsV7W1cn0QGXawTN5Luiu0wqxyVzEdtUj4H1
	MRogRXucGQ8bjt6x0wRG4oNmmygjpPrr8FB6GncSrObj3I0+5KCX22MH4WDG09JZuztv3ShIbXOqN
	71kVJgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8I9-0000000FBuD-1ae6;
	Tue, 05 May 2026 05:25:57 +0000
Received: from mail-centralusazon11010035.outbound.protection.outlook.com ([52.101.61.35] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK8I6-0000000FBte-0kuq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 05:25:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndO34ZEXfPLVlCeqI9MMjjRXkYwKpk+kYtvAGtXZtfF1QDbTTMdnDdcHEGkX5/3ktEbjQzXhl5zFGsogyrKaCY790bB2cyW2lFRfVy4qmv6ZiQlfwIzabo29y1d9lIR+JbiZYQF1zRNcU53kzXeRQwlKg006mSPQca45EK2dGyCKQdgoo4riHqJTTbBxFqflY68piwx+kWB07QjGrSxECooO3orf8ZVf+nFF4BYZ5YSck+y6Ojd9olXT1c54DPF0gc+vE9K5szO6/DAw39rAb4xZlYKkJoen1o+YL0BmQmvlyiCn1Hfq8R87G7RRhDXCeUCAcMeQ/3BMdwODF2ELDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOk5wfbeYS54zS1/tFcTH+ngGVL9YXJA1CGNJRGjgps=;
 b=AQwyLIo7ExY5nbyuDRORqvKthegwOftEA5ffBpzUZA1Sg7RuG4bWzjXdpvhADnnsTUkvW8WOzPxuy3eteOyWJ4Cm4cGHNr8bIUBKZMzcfQyHVrxhUuNzQzCb4Nzq0VL4c4L9cQqEULlFPgBJagWvqIQQATq+Gv+bdpK8qxpdbd8ws7XviBpYsseJUJ7yaC6HH7roLjzMUCZAYay3hGnCJN8fPUjtyZwQtYIL5/6NM6weCIV8eFpXFoB6xlFLBrSrY3RqhrJ91izBwJ01TgdKE7wVE1R05blx2TOfsyG6PKOFeddxeT3YON+ohQ2aF5KVoVMDrhi7VAYOaPdFmXrisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOk5wfbeYS54zS1/tFcTH+ngGVL9YXJA1CGNJRGjgps=;
 b=IqGR9CjAMBbR+VxHy8O9MBgnDyRNCkIFnsrk60537JnEQcguMtkSNCOGWbpxiOA6iaj+DedfdDrXm11TshLrCnm+WflM/v7Wu3ja5e496QoVBi2YXDNDOKKlgKHnybqTsVLbCQW5IYrnlYo0gZHFRuo2nbzuUJT2Ger6SHnurUU=
Received: from BN0PR03CA0059.namprd03.prod.outlook.com (2603:10b6:408:e7::34)
 by MW6PR10MB7685.namprd10.prod.outlook.com (2603:10b6:303:248::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:25:48 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:e7:cafe::7) by BN0PR03CA0059.outlook.office365.com
 (2603:10b6:408:e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 05:25:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Tue, 5 May 2026 05:25:48 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 00:25:47 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 00:25:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 00:25:47 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6455PeiB2559581;
	Tue, 5 May 2026 00:25:41 -0500
Message-ID: <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
Date: Tue, 5 May 2026 10:55:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, "Linus
 Walleij" <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MW6PR10MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b894af3-aa51-463c-8e3c-08deaa66c3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: sv9Afg6GMJVrgIorJ4EWFtQOnFDGBpAJFbD5NQHJmCgjLDK+8gDGy1GWRbHi/wbar6NOi2aRGFXv4rj4zhSqQqNdy8xJgf75bjd51vsGH2MJ4Ac+3E+jbPbSRDNdjpqL8JiWIaikUI1CWzsBkj9/hRIr1k3LyVZDcO/a6uQBwNYssvyNruVBjNijQ0Tk1XxxfLRLh+eM8k6ylZwprm4dMnlkhy/XhqjSoqlF/8Xfm3iOgZoym1oyxEPN+vHnHI0hx6aTQlPWs7grLANWXbHixGMM+zZYM9yMXgNJfLjNnyVuMV/OxibRbD+H91amy2DcOUqamp6daTBStAZLbiPrFdXfzi3z/M8ab9UXme6lSwHPDkQxQDn/2DKSTanEZg+YVYzYTEE0SpAzQj4hp8m8esObWK8SZl22r3VL4uKFYUedj+iUyYqvXz9ddijfyq3sRF2ZLShMtOTNghjAyGo9aoQpv9QIfYnUJQ4sHb2VjixE+Jx9iTpxtsbyGdEqefG8ue2XjskXPg2cnQTgsxKIDSbWWMKVB9oOugRIb/ot0ohLAN4HUGzCIhp12ti+2V3PSKiljwYzxFUq1yNVXSTd2yeMva1TQflZ0yk8988T1kjwFHyy0Az//tRrWo2waVPhLKtikkbt15dUU6cVJfFO9BqbRDiz+LuyWwT8kBcO0fhRQ4Yl06IpcgPXRnuwsBJeC9D0eQq4EnG0ZyOzj4/o5hsYjvyOxENd9yOXXpWaWlw=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MPJf/my5ai0j8UnRIOqwWXFt9XVYRQfmUUEn3ChgZXZ+4ZMXsVgIvn3kcfCt0VPFxYW2RlLm5q9F7k+SAsw4m3FlwKpvMKVLy5DUn2F31iIQJsyzoO5B50vyp3j5g+PVuxMM/de7KX08ft6qDlB/nrDYlZrkWK+xU4eaPgT/oi9HCAT6EcYzxGo6NTt1RpwdRuUu9JCYcs5opnO2Pt6em2Rw87B6pJXTqIbE+rFvUV/Cea4qS+Pq2betM3Zs5k/2aV46N0WIo6Q/dX7PasGce1pMSs+t83u17W3buWEI4yjeYRgcAublMncQZjmpuvTpxHxRiquBvH/rGh5bpdOP/dH/5KRQ7BOljpTSH9yAcmEkqHUSmLWhBi+q6av0IFGvgXnDsaTDCUFsEeiDhucJr0Qr51ALqjq2v6cTtubgBrJAJ43HkabOQEnucdiNMm1X
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:25:48.1132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b894af3-aa51-463c-8e3c-08deaa66c3d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_222554_349593_802F6211 
X-CRM114-Status: GOOD (  26.05  )
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

Hi Arnaud,

On 04/05/26 22:34, Arnaud POULIQUEN wrote:
> Hi Beleswar,
>
> On 5/4/26 10:17, Beleswar Prasad Padhi wrote: 
>

[...]

>>
>>>
>>> I may have misunderstood your solution. Could you please help me
>>> understand your proposal by explaining how you would handle three
>>> GPIO ports defined in the DT, considering that the endpoint
>>> addresses on the Linux side can be random?
>>> If I assume there is a unique endpoint on the remote side,
>>> I do not understand how you can match, on the firmware side,
>>> the Linux endpoint address to the GPIO port.
>>
>>
>> Sure, let me take an example:
>> Assumptions: 3 GPIO ports in DT, 3 endpoints in Linux (one per port),
>> 1 endpoint in remote (0xd) and 1 rpmsg channel (rpmsg-io)
>>
>>         rpmsg {
>>           rpmsg-io {
>>             #address-cells = <1>;
>>             #size-cells = <0>;
>>
>>             gpio@25 {
>>               compatible = "rpmsg-gpio";
>>               reg = <25>;
>>               gpio-controller;
>>               #gpio-cells = <2>;
>>               #interrupt-cells = <2>;
>>               interrupt-controller;
>>             };
>>
>>             gpio@32 {
>>               compatible = "rpmsg-gpio";
>>               reg = <32>;
>>               gpio-controller;
>>               #gpio-cells = <2>;
>>               #interrupt-cells = <2>;
>>               interrupt-controller;
>>             };
>>
>>             gpio@35 {
>>               compatible = "rpmsg-gpio";
>>               reg = <35>;
>>               gpio-controller;
>>               #gpio-cells = <2>;
>>               #interrupt-cells = <2>;
>>               interrupt-controller;
>>             };
>>           };
>>         };
>>
>> Code Flow:
>> 1. "rpmsg-io" channel is announced from remote firmware with unique dst
>>      ept = 0xd.
>>
>> 2. rpmsg_core.c creates the default dynamic local ept for the channel
>>      ept = 0x405.
>>
>> 3. rpmsg_core.c assigns the allocated addr to rpdev device:
>>      rpdev->src = 0x405 and rpdev->dst = 0xd.
>>
>> 4. rpmsg_gpio_channel_probe() is triggered. For *each* of the GPIO ports
>>      in DT, it will trigger rpmsg_gpiochip_register() which will now:
>>         a. Call port->ept = rpmsg_create_ept(rpdev,
>>                                                                     rpmsg_gpio_channel_callback,
>>                                                                     port,
>>                                                                    {rpdev.id.name,
>>                                                                     RPMSG_ADDR_ANY,
>>                                                                     RPMSG_ADDR_ANY});
>>             Ex- port->ept->addr = 0x408
>>
>>         b. Prepare a 8-byte message having 2 fields:
>>             port->ept->addr (0x408) and port->idx (25)
>>
>>         c. Send this message to remote firmware on default channel ept
>>             (0x405 -> 0xd) by:
>>             rpmsg_send(rpdev->ept, &message, sizeof(message));
>>
>>         d. Remote side receives this message and creates a map of the
>>             linux_ept_addr to gpio_port. (0x408 <-> 25)
>>
>> 5. After this point, any gpio messages sent from Linux from gpio port
>>      endpoints (Ex- 0x408) can be decoded at remote side by looking up
>>      its map (Ex- map[0x408] = 25).
>>
>> 6. Any messages sent from remote to Linux for a particular gpio port can
>>      also be decoded at Linux by simply fetching the priv pointer to get
>>      the per-port device:
>>      struct rpmsg_gpio_port *port = priv;
>>
>
> Thanks for the details!
>
> To sum up:
> - the default endpoint acts as the GPIO controller (0x405),
> - one extra Linux endpoint is created per port defined in DT.
>
> This should work, but my concerns remain the same:
>
>   1) This implementation forces the remote processor to handle a single
>      endpoint instead of one endpoint per port. This may add complexity to
>      the remote firmware if each port is managed in a separate thread. 


A. Not really, I just chose 1 remote endpoint for this example as you
    suggested to. We can scale it for two-way communication via the
    get_config message like you suggested below.

B. Isn't it a bad design of the firmware if it is handling 10 gpio ports
    in 10 threads? The logic to handle all the ports is the same, only
    the parameters (e.g. line number, msg) is different.

>
>   2) Linux, as a consumer, should not expose its capabilities to the remote
>      side (in your proposal it enumerates the ports defined in the DT).     In my view, the remote processor should expose its capabilities as the
>      provider. 


Agreed on this.

>
> From my perspective, based on your proposal:
>  1) Linux should send a get_config message to the remote proc (0x405 -> 0xD). 2) The remote processor would respond with the list of ports, associated
>     with an remote endpoint addresses. 


Agreed, we can scale it for multiple remote endpoints like this.

>  3) Linux would parse the response, compare it with the DT, enable the GPIO
>     ports accordingly, creating it local endpoint and associating it with
>     the remote endpoint.
> Using name service to identify the ports should avoid step 1 & 2 ... 


Yes, but won't that make a lot of hard-codings in the driver?

+static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
+    { .name = "rpmsg-io-25" },
+    { .name = "rpmsg-io-32" },
+    { .name = "rpmsg-io-35" },
+    { },
+};

What if tomorrow another vendor decides to add more remoteproc
controlled GPIO ports to Linux, they would have to update this struct in
the driver everytime. And the port indexes (25/32/35) could also differ
between vendors. We should make the driver dynamic i.e. vendor
agnostic.

I think querying the remote firmware at runtime (step 1 & 2 above) is a
common design pattern and makes the driver vendor agnostic. But feel
free to correct me.

>
> At the end, whatever solution is implemented, my main concern is that the
> Linux driver design should, if possible, avoid adding unnecessary complexity
> or limitations on the remote side (for instance in openAMP project). 


Yes definitely, I want the same. Feel free to let me know if this does
not suit with the OpenAMP project.

Thanks,
Beleswar

>
> Thanks,
> Arnaud
>
>
>> So Linux does not need to send the port idx everytime while sending a
>> gpio message anymore.
>>
>> Thanks,
>> Beleswar
>>
>> [...]
>>
>


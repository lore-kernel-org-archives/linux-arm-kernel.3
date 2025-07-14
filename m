Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ACBC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrzRIUHmvCSlZ+LIj286Iuv4w6Sy7CldafzzCelSpIs=; b=D+sxzxc68s2UiEFDspuhzd+tzN
	29dR7MioNmmWQuAsN+/pnglmd+D1FkE1eMTg8ANtXbeJxHzl9QhpV26IU9jSRlY9SggKdG87vuYhU
	VU/cJAi8JAU5nArGhbzgHmdBwhUhZz0wE3M4XXS+YRJglXhznRj+BmuIY6J4DXaT/sYR29I7hxEQG
	NAqReY3l4XiDyhi1YEkjZhEnJ7MYNUM8SYnUMSuMUzeJVVYBoJmhr49zVeQk2pSLPH9bNVxDwv5ru
	St00Vcbyoo3nRH+1x74aqIV0NsrsbbYqekB9ifFPizlINXEuKDU88jVmgLYeqb4gLSXVEX4vpWDrP
	jv75OLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJ6Z-00000002Gam-0C6H;
	Mon, 14 Jul 2025 13:20:27 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIXj-00000002CIp-2Bnj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy16s2AFuM16tK+TgIMugAlQqzi88S+f+zPyB3qKE4dQqENIyjUoaHgmtEdzF+P1lk/0T1uscG2wAdEYMan2psEyMWXZCajsmV3wM5oRnpaV3Q2sjtCJ+k3+dRWVwmEDAg2Ql/wzZrG4IX4zPjUOhLETjzupo+u/xo1wFYYtgY8Gzy+JaQrg3nJBtyiiLY7/r686VS1gdsCS3PBcBnekeZ3fT2y60TytTAFm2QW7Xn6BrQNO2XvaWa1MCLehB6rO7xt/QMhi8Px0/x7oSgD0yOacoA5nh1vrQ/qByxVYw+g4aQxI6K5CVspe2Sy3KrVtS/rhLqxmcQiLRl6+Z//koA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrzRIUHmvCSlZ+LIj286Iuv4w6Sy7CldafzzCelSpIs=;
 b=KCgNQKJMIYg0HP/ESC5sZIFKxUMMxSepozSRtqfgONyiN4EUgv/9FYivyGct1tItvd4s442k2/QERxnIdjvSs3nh+T+BH+/rlXVkRdR0btHCUfc3fN3f1+1v5wDMfF60yvyGeNzsaNfgFnkRu7C/BrZgRxRpe5/QqZaQWSBeMd549CWxJI0A0jJVI9hiOS2FsqdVHBNEkxjZcWfHnetwm0YuAB0A5GBtda5nYTCklyk0MFIzo94g/GZK6QRyF882z9WwwuhetkiS+0MOWFxPyudWYtrL4Cm6elzYb9Mok+ffYSTGRADhn/jzcnf14sG9JVaBkw5mRIZ2IMjRzGywlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0018.jpnprd01.prod.outlook.com (2603:1096:404::30) by
 KUXPR06MB8032.apcprd06.prod.outlook.com (2603:1096:d10:4e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Mon, 14 Jul 2025 12:43:56 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:404:0:cafe::a) by TYAPR01CA0018.outlook.office365.com
 (2603:1096:404::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 12:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 12:43:55 +0000
Received: from gchen (unknown [172.20.64.84])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 04F8140A5BD6;
	Mon, 14 Jul 2025 20:43:52 +0800 (CST)
Date: Mon, 14 Jul 2025 12:43:51 +0000
From: Guomin chen <guomin.chen@cixtech.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	Peter Chen <peter.chen@cixtech.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	maz@kernel.org, sudeep.holla@arm.com, kajetan.puchalski@arm.com,
	eballetb@redhat.com, Gary Yang <gary.yang@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
Message-ID: <aHT7h7/5Ip2dDJ4O@gchen>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com>
 <CABb+yY17OOBx73655OhBp8At1b81w9M61zzGu4uhXcMTw4Q=Dw@mail.gmail.com>
 <aG0i75h32dWg/L2G@gchen>
 <CABb+yY2BmqiQ18hU+7C234UnY8n-8PH5VEoS7nH5Xq5O1krGhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABb+yY2BmqiQ18hU+7C234UnY8n-8PH5VEoS7nH5Xq5O1krGhQ@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|KUXPR06MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b2adaa-76ca-415b-3412-08ddc2d41870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXZNeWRNU204ck03Ukk2YmV3eFhtUTdUc3lGNTk4cS9PbmMxZVdmd1k2RW1a?=
 =?utf-8?B?SUZuT2djWTUxbkJUUmd4ajZxbGd5MGdNbmwvWitKQ3N0bDdneUZ5c1c4N2R4?=
 =?utf-8?B?RmVSQXYyTTJOcUVZQzZYeWR4T0ZXNDVGaEs4amR6STkyZW5TeW9aUEtDTDNK?=
 =?utf-8?B?WXhKVjNjRUlpSWZ4eCtKaGlaNTBuTHVTRHc4cG8wek5qNTlzSEI1NzhnQk80?=
 =?utf-8?B?NHVyNExQNllVR2RjRFlrNitCVkNlYVhHSGZxZ284NUM0cEJFNEtxOHpZUEJp?=
 =?utf-8?B?Q3hCdlRSek1oL3V0M2NLYkorVS9KMUNtQmtoOXNMekRxdzl1bG1YdHF5SWF4?=
 =?utf-8?B?a0tQNVlVR2NtNnJZQ25ZRlNnZWRTSTFTY2g5UWFHVHluV1I4TXJnUFVUWTcx?=
 =?utf-8?B?RUF1UDl3elIwdGxOendQRGw1c29zcVlmK0dkc3hJaVlaSEI2V0YrendBQVVr?=
 =?utf-8?B?RlVXU0VzWUN0S2FXQVdvOUhKU2hma0xKbjdYbVd5dkpaMDd2UEJUS3hEQmND?=
 =?utf-8?B?UXZjVkdDcE1ISTY2VGtoUXVQcUV5WmtCczdRRVpReThTRTc3Q1cwY3ZDd0xI?=
 =?utf-8?B?TlFUTm1ETHlVQjBvR294eXZUaENEYmMwVFVpSHFqdUd0d3FCcXROTVMvUGxX?=
 =?utf-8?B?d2J1NUthYnNrZDY4RGthTG5GczROektINnhLNmd4b2ZYTVhLNU1wUFFWOU8z?=
 =?utf-8?B?elhlL1Y3WmdOcjF6MXg0eXFlWVVEdm15bGJRV1VPdkZLYk02cGcvY29MQ3hD?=
 =?utf-8?B?akpLUCttNnBNSXNLVUs5RlVBeWEvL3JxVDc1aTV6NEUzaDYxbFVPb3lHSTNP?=
 =?utf-8?B?SHpmWW9pcElIQnlZek5SUCtJcWFUcHlTQmRoVWc0SFArNEJ6bENveUxCQ0Jx?=
 =?utf-8?B?QXhPSDF6bDFTL3J4ZWlaYXJFVjZTZzNsUHJiNGZYMy9SamQwNmg0d0QxMXhz?=
 =?utf-8?B?Z1RjcGtLWFRGNXV2V216blFUQ05qNGNCaDArN1ord0UwQlQwR3Mrc1c3cFFx?=
 =?utf-8?B?cU9ud3prUWdQOGI0Zk4vaGVwdnJqTTlHUzVsZ3J5UUtRQWduODNZMG93K1JN?=
 =?utf-8?B?YVRQcDFsbnV1dnNHbytyaERtR2V4L0JnVkZTVkFkZENlK2krRkVEdlJaOGVa?=
 =?utf-8?B?RCtKQVBpeUZjSEpKN0EzelBpejVmb1ZkMmJDVStLWnFSTERFMURleTdta0dJ?=
 =?utf-8?B?eEROZDd6RlQ1bEg5aEJpS0EzSGJCUXlPalJUTlBkS2RKQVJQM3lVNFUzaDJX?=
 =?utf-8?B?b01rbENQUUFuWVdsenk2ZzR2Ui90SWVZNHg0VWIzTytEbEhxTitaMFhNQmRr?=
 =?utf-8?B?b1lhQ0VZMjUwUWhTYTFLLzd5UE1DQVp6N2djNDh4VG9HSWRrODNybFpya1dy?=
 =?utf-8?B?bmZmNURsTzFWTllQTll5VWhHSEJUYW9QeXhTa3lwbUlpenIvNWZCMm1MNlpl?=
 =?utf-8?B?Zkkyd2M5VmJWWWJ2NGJLazJZRWdkcFN1b212T25qWDFDR1ArUGVBb0JHRms2?=
 =?utf-8?B?WUJpbFRabE0ycXNzNUdHOStiYWZxY2c2UkRXeGVKRkdSdXMrcFI1K1MxNm81?=
 =?utf-8?B?K3JuSUVBbVIyV2hQOWZ2UDgybkJSV2g4aFBVMC9ZRHIycW45NXhvZ0dlZ1hu?=
 =?utf-8?B?bU9BeVAzMVl5NDd5QTloeUVzMzBta0oycGpkMzZQTHVsV0Nla0pTQ0JmWXp0?=
 =?utf-8?B?TmhKYXJCMnB0RmRQQ3FKWW0zV1ZpMENibUlGTEZRNC91WmdGV2pNdkU0ZEpJ?=
 =?utf-8?B?dlBhVjNBL1pDbjl3dVZtNDJ3OExEZEJwQkZtempsakJyaC9BSnoxelRRR1ht?=
 =?utf-8?B?eUNvNTdYRUhvVWlSKzlvUlBTanlCeGN4NHRGUTRzL1RIYzg1RzZiaGlHeE9w?=
 =?utf-8?B?QTdvMEQ1STBwYW9OSGVNSWVBQmE1MGUwOStmTkdSN3B3WGk1cEdEdHYwY3gx?=
 =?utf-8?B?VXRlYWZvNU9tRTBLVHVNRjRkSDBrOG1HWWNhdFQzK1VDZ1BtTE14VkhCYWJN?=
 =?utf-8?B?VGY1alZXakMxaml2R1czYzhyUGhmSFZrSzI3VTBRaXdFWG5LWU9Ycm9ENHo2?=
 =?utf-8?Q?b1cg7l?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 12:43:55.3064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b2adaa-76ca-415b-3412-08ddc2d41870
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_054427_562551_FCED463F 
X-CRM114-Status: GOOD (  36.31  )
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

On Sun, Jul 13, 2025 at 12:00:06PM -0500, Jassi Brar wrote:
> [Some people who received this message don't often get email from jassisinghbrar@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> On Tue, Jul 8, 2025 at 8:54 AM Guomin chen <guomin.chen@cixtech.com> wrote:
> ....
> > > > +/* [0~7] Fast channel
> > > > + * [8] doorbell base channel
> > > > + * [9]fifo base channel
> > > > + * [10] register base channel
> > > > + */
> > > > +#define MBOX_FAST_IDX          7
> > > > +#define MBOX_DB_IDX            8
> > > > +#define MBOX_FIFO_IDX          9
> > > > +#define MBOX_REG_IDX           10
> > > > +#define CIX_MBOX_CHANS         11
> > > > +
> > > if it is not really a single controller owning different channels,
> > > maybe implement only what you currently use.
> > >
> > As mentioned in the previous email, a single controller can support
> > multiple different channels.
> >
> OK. I am not too worried about having all variants in one driver esp
> when it is manageable and share the code.
> Unless I am overlooking something. Arnd?
> 
> 
> > > > +static u32 cix_mbox_read(struct cix_mbox_priv *priv, u32 offset)
> > > > +{
> > > > +       if (priv->use_shmem)
> > > > +               return ioread32(priv->base + offset - SHMEM_OFFSET);
> > > > +       else
> > > > +               return ioread32(priv->base + offset);
> > > > +}
> > > > +
> > > use_shmem is set for only CIX_MBOX_TYPE_DB, but it affects every read/write.
> > > Maybe instead adjust the base for TYPE_DB?
> > >
> > The reason we introduced use_shmem here is that we had to adjust the base
> > address of TYPE_DB to resolve the reg conflict in the DTS.
> > This change has virtually no impact on performance.
> >
> Yes, I can see it should have no impact on performance and I think
> adjusting the base once
> during init is cleaner than checking the flag every read/write.
> But wait... use_shmem is a controller wide flag, and isn't
> priv->use_shmem always set to true  in cix_mbox_init() ?
> Is the driver even tested?
> ....
Yes, we did perform testing before sending out the patch. 
The test here shows no issues because there aren’t more clients. 
There indeed exists a problem with priv->use_shmem always being set to 
true in cix_mbox_init(). 
So I will add a restriction in the probe function in the next version.

> > > > +static int cix_mbox_startup(struct mbox_chan *chan)
> > > > +{
> > > > +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> > > > +       struct cix_mbox_con_priv *cp = chan->con_priv;
> > > > +       int index = cp->index, ret;
> > > > +       u32 val_32;
> > > > +
> > > > +       ret = request_irq(priv->irq, cix_mbox_isr, 0,
> > > > +                         dev_name(priv->dev), chan);
> > > The same irq is requested for each channel. How do you expect it to
> > > work? Maybe request it just once in probe and pass the 'priv' instead
> > > of 'chan' , and in the cix_mbox_isr handle according to INT_STATUS
> > >
> > For the same mailbox controller, there won't be multiple channels
> > simultaneously requesting the same IRQ, so there won't be an issue
> > here. As you mentioned, if we need to handle multiple channels working
> > concurrently in the future, we would need to modify cix_mbox_isr.
> > However, that is not required at the moment.
> >
> Is it too hard to do it right already?
>
We haven't set the IRQF_SHARED flag here because there is no scenario 
where a single mailbox controller supports multiple channel clients simultaneously.
And, the ISR still requires the channel as an argument. 
While this approach does not support multiple clients in parallel, it does allow 
for better sequential support of multiple clients.

So we have placed it in the client's startup/shutdown lifecycle rather than in the
probe function.

Thanks
Guomin Chen


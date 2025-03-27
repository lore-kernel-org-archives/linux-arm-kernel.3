Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CF6C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV9LP68hf6K2CE8y+aCr/2IhFIriqYosoWyBNsTOUYM=; b=MdpGXyf52NM6jgotABy/PGrjdc
	sL+2oi1TGigA017oQqeKZIuh7MMhO0l3L2ZeLynnKsgkWe9YHu4QFdNGLGGYhSJY1lw4qU3pEicBq
	U1Ff/bpWVcBSKYpQ2FzoCu5XeR0xTjXKmNWz/7eADAQpS8352rr5XIyFWsondH6DbAeCNPyqzlW1A
	6J07/IP7+4M4PoYFv6AQXGHO38ivYN0n1PcPPSf66tR8oaSI1YtNFi2YLkIQm73m1boUawzuAGYyr
	PKMnjBDPKGxpkwjI30t6aIRp4SQK94SPWAl9P1NI5EGbpgP4fjKlXBPHRN6ilzCzewp9U5n8MQ4xl
	RLUXNAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjcO-0000000AaPY-1lbp;
	Thu, 27 Mar 2025 09:33:44 +0000
Received: from mail-eastasiaazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c400::3] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjaL-0000000Aa2T-2Tmy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 09:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpEYhQQ4JGgIyyHP6oleno36rnGq0LNT0VZ24jB23msj1zs0L4SEyJeUzpCok1zTTb/tXsqcgKjtB1/g1VgB7Pe96fkvAeWGDEB81FGQ9mrxWAkaeeDWW4tkYbDwWBqm+STegh2k3v0THsRGPwQ672Bd61GrUgyMCyywCS4lpdTTuDZRJilKwTYxeltm624BAJSnMfV2LNrKEalvPWk9KUgaqz0kqveMpUSNIol3gCjb5nWDruRl5MLVz6C/8MzFPqxxE5THfaL7/zDdMT07JFtUXh/4h0tkJ/clgaRUX59WsVrXkbdoZJJGft80n5HqCOr3VjaO/REqCzFx+mxZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV9LP68hf6K2CE8y+aCr/2IhFIriqYosoWyBNsTOUYM=;
 b=gjxyGcadIDsPrYJ9egJQF6ZDQHPpvXPh9EY8ro7AyBD/oliFttNvPaa/Zgy8lcl99h5PsjxfCzxQXnf4ApWvOi5q4bMG+KHkKMt18zA9w3pyeTSdr4vhmXExdTCEeMA34MxBmHj7tUcJtSDTuLEXUFmlmDegYqg7i1g1wKLj8i7YinbMs/xnfu/DaC5e70vT9xMEfyJch+uVsJ+mIW5zm7exeCj1p7Q9Tn6nXyHaDWEFrgXofpzu9xzdYr0P5wxAeASF/qoCr2UJQq5pYl2qYIYlnAMYdHf1YBUw60y1eeQWzLtL8VGomwKJK4Ca2AyP5L7r0H2lt8ofyS2dgTiyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0181.jpnprd01.prod.outlook.com (2603:1096:400:2b0::10)
 by SEYPR06MB5986.apcprd06.prod.outlook.com (2603:1096:101:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 09:31:27 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:2b0:cafe::1b) by TYCPR01CA0181.outlook.office365.com
 (2603:1096:400:2b0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 09:31:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 09:31:26 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 22C5841604EB;
	Thu, 27 Mar 2025 17:31:25 +0800 (CST)
Date: Thu, 27 Mar 2025 17:31:24 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
	"Marc Zyngier" <maz@kernel.org>, soc@kernel.org,
	"Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl, kajetan.puchalski@arm.com,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
	"Fugang . duan" <fugang.duan@cixtech.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z-Ua7MK-Kv033uDu@nchen-desktop>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org>
 <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org>
 <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
 <422deb4d-db29-48c1-b0c9-7915951df500@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <422deb4d-db29-48c1-b0c9-7915951df500@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|SEYPR06MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac0e4e0-db5d-40c4-1faf-08dd6d122589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xghCp3v/qoHCy1aiDnm2ZwVF6gh8+5W1MwQeaQSbGhu67R4LuJ2qmJRSXthe?=
 =?us-ascii?Q?+QhiLM76wLhcLVKQdw7oY3UyZUl6qbu5vWmO8qgZ0T5354hKrtlNVoD4/ZTJ?=
 =?us-ascii?Q?xA2JAEUxwKna6V1jsfPuAk0MYUQmj+k0kitrlt54zsgp3PyAuy3Z64uPOD/N?=
 =?us-ascii?Q?MUyicJFXnGMDd+8iGb4bZZ7zoJrYh0GISu+weCcZw+tpSspzj3ZLfzbC/zrx?=
 =?us-ascii?Q?+RD0ttgruohh05gntpyrpRCuhjEX4qXDUuimNb4J/zNFpQTxm5dy2pJiB7RB?=
 =?us-ascii?Q?wjlqgmAfBzarSk5LMgq6yXVNVe8MYRwtPgwALsSu1BHA0GysygO9bQXFMymD?=
 =?us-ascii?Q?6o420o/PE8kE50EGXDj26mVyS8FrsRSl39WlCav2jtUNHY+D4rqAdG8+e60j?=
 =?us-ascii?Q?B71vpWCYsRn3lEvk1lpwvSJ1SQAJmyH0EvnM798GnP4UMev5Q7tdSc+CnWgx?=
 =?us-ascii?Q?rkSoW1NmudRDnMwlZNKb2pJhXEUQ4xfM9M2g67Bz/+KF2/lkphboYYkb+wK2?=
 =?us-ascii?Q?phtvkf4bfZuh7qq6k0IJ0ybScLp7z11YX/isFGt4Ng5Vpt3f8pbGqaiL1O8C?=
 =?us-ascii?Q?uTzvVtF9hFjUawdBf4DkQxUxqDYOUTlhpNMeN7KUiCkqrcGil1mq7ygy63Nb?=
 =?us-ascii?Q?Tic1iKgcuUZjGhx1R4QcZGprVzlTjybkXkrkIlcCvp6QA7GMQFw7Jnk652cy?=
 =?us-ascii?Q?W9+fCHg3v94wIn7MsgLrE7HGxWTZhuGe8V37PPpCwh8NsC+DcUsbJTfW0q4+?=
 =?us-ascii?Q?yEr+ig48jcqPK+XH5qvp486fWnuW8NEOE2XTFeyUJqFpG+RF5g7RU7RjDwNU?=
 =?us-ascii?Q?yxnAfx3UHy/uCU3FPXQlcvO7vmRZwZKN2CIYt/x3tQJqnQKJgv39Mg9pxef4?=
 =?us-ascii?Q?OyogI/00Ips1gyYhByDbIuKgtoHXfk+M60IkOV37DpVWlstNRz9CrSs4WmVv?=
 =?us-ascii?Q?ZQVpzekjaIWM9m0qn9nyYVkBWuSLed6vojxlrMxJ4SaNtxWP2u2Z09OeP4W+?=
 =?us-ascii?Q?xQj376VYP8f3kozZYfnDYMAYPD0aXxO/psMyKQoxsMkq687NkeWWedzzxiTC?=
 =?us-ascii?Q?YjIyT9opAoYWsyjH0UnwMJxEap8Ls2Tfh8dqYud/iKaIJYWtXOFmeIpkDL/l?=
 =?us-ascii?Q?tE/GoGwKBA5+0wHTAw4BA8/HXox9iJUsbqsAL3QipqpY6ymJBmxs932H7GZW?=
 =?us-ascii?Q?8y+hE7FTsx7mrAJLk6nA/WfMYEfrxcQ4uq8EGdRfse2DUAvG1A59HIElGhRV?=
 =?us-ascii?Q?sSF3/dk0K57qaLGwj2zM8vETXZJ74Ro10vM7Yb6Os6uc4zNLjNNqbwnU6h57?=
 =?us-ascii?Q?auoQT+JHLdmtPehsyZWzBLhNYcWVNZlPGEKu3q3E4DcI38ZYTrdqeRIvABeT?=
 =?us-ascii?Q?6vY2xVW7FXtdue2XnqjQM45Is+UjpMOAqGQING/cTQ31q8778mZ3eoTl77De?=
 =?us-ascii?Q?95YLv+B31Vqiu2NEKBGe8HNRqJKK/NgnAgJ1An80EjPSQBo1d92uJ2peam5D?=
 =?us-ascii?Q?z6CFH6uQFzLbvF8=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 09:31:26.0716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac0e4e0-db5d-40c4-1faf-08dd6d122589
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_023137_629694_119BEFC4 
X-CRM114-Status: GOOD (  33.09  )
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

On 25-03-27 09:18:42, Arnd Bergmann wrote:
> 
> On Thu, Mar 27, 2025, at 08:16, Krzysztof Kozlowski wrote:
> > On 27/03/2025 07:44, Peter Chen wrote:
> >>>> On 25-03-25 10:52:10, Marc Zyngier wrote:
> >>
> >> Thanks for your interesting of our platform, and your comments
> >> help us a lot. But I don't think it wastes reviewers and maintainers
> >> time, a clean patch set saves everyone's time during upstream process.
> >>
> >> For how to organize the patch set for SoC, Krzysztof gave good summary
> >> at [1]. We are going on upstream [2], this patch set is just a start
> >> and base but not like you said for marketing purpose.
> >
> >
> > I do not think I suggested in [1] to ever send new SoC containing only
> > CPUs and interrupt controller, without even serial. My instruction [1]
> > was how to organize it. The DTS can be even fully complete, see the
> > upstreaming example I have been using all the time - Qualcomm SM8650:
> >
> > https://lore.kernel.org/all/20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org/
> 
> It is easier if there are other SoCs in the same family that are
> already supported than an entire new platform, but we have certainly
> done it for new SoC families as well.
> 
> > Entire SoC sent to mailing list on the day one of public release of that
> > flagship Qualcomm SoC. The SoC DTSI and board DTS have almost complete
> > picture, except few trickier pieces... but it even has full display and
> > GPU! Plus, as I explained on my email on samsung-soc, that DTS/DTSI
> > patchset references all other bindings with their state, so SoC
> > maintainers can understand what is the overall progress and what will be
> > the result in DT schema checks, if they apply the patchset.
> >
> > The minimum, absolute minimum submission is with the serial nodes. I
> > would prefer to have some storage or any other interface as well, but
> > that's fine.
> 
> Agreed. The usual arrangement for a new SoC family is to have
> the minimum set of drivers (uart, clk, pinctrl, regulator,
> iommu, irqchip) along with the DT bindings and the dts files
> in one branch and have that go through the SoC tree as part of
> the soc/newsoc branch. It sounds like in this case we only need
> uart and a mailbox since the rest are shared with existing
> firmware based drivers, so this isn't even the worst case
> but still requires some coordination between subsystem maintainers
> to ensure that all patches have been properly reviewed before
> I merge them.

So, in this case, we should add mailbox driver support in this
series, and once the mailbox maintainer has reviewed mailbox
driver, all the patches could go your tree?

> 
> Any peripheral drivers that are not essential for booting
> (typically mmc, ufs, spi, i2c, gpu, sound, pci) can get
> submitted at the same time, as there is no dependency on
> the platform being merged first.
> 

Thanks for telling us this.

-- 

Best regards,
Peter


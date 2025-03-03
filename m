Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C97C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAJ0Bhx/WxqnugD9Zk8bagbD0Hw1q3BfZGs5+RvZjNw=; b=0MxUZhREdEOOXEabSS34QRf8x9
	C9NZ0FiaAjNL5bFPTDw58hNtCo3iETDRA/27Z9LM+WLIsf79E/Is/Df6EAumBopiQA6iuectkDfvc
	e+1vT+7WrwvoCpd5Cm6Sb4hLGw8Zi+ammespivrh1Cm92sjmT0m55llRU48/CZW47Jc+ldvd/X8D9
	dH5lNCJiz82K5nrXZZshANY8TJu5fAUNC1Aa7BVX9XN+AMUTcLOj5owFHTsyugFOlPkPWBiwNSTIf
	9OMThOpfWiFVR6xJuyjWks1VKIkE9cT17JkuNB6VbRSER437M6+6O6Mcd4oB0oe7pNLTNS1VA4ECi
	Nx8gwsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4sf-00000000k2c-3zwW;
	Mon, 03 Mar 2025 12:26:45 +0000
Received: from mail-sg2apc01on2070b.outbound.protection.outlook.com ([2a01:111:f403:200f::70b] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp48Y-00000000bEF-1GXw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:39:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRJfWIU+AK23XwSO2O3mImVzh4dBw+RXI/2EV9x4azPf/YM0SJQSBaoCRAKiXrEeJjrUHPZhbyHcVxAShsB9mGuyxrmjeJYHinzVQnjgbR5Gk5kNbrhDDwulpmtwkaLd2ArJywdZLPhhefho26EJdt/rtzVqK8F77DyHj2IFDD7l8/jkTnLkcdJ2eHoWkky1hcHFL0ztVf4oAZRWSDC9vTFLyTURVvybhH1zokIiDtM6fA3lnH60qS7u3w0Bu2lByoVBS6UAwqQAlmjz+FRyxGk3Zlw9WohfBpqNnmyIMGoJ+ZsVVXBw4evCqFLm5YBJl8gpi1Ui3knh6BFejkrZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAJ0Bhx/WxqnugD9Zk8bagbD0Hw1q3BfZGs5+RvZjNw=;
 b=ovJAIpuOM6MXsBOKrYxwHtBeY2uyXCG2iqsMDjOHdGlMwcc0zSVKc+0EO0uM7O3PUKMbFxZzZ4FEmSnXnnIF8/qhOP030kIQCa3+A3wHCF2uboB34YI1f1KqkzsJZVP6Ay1m0kjv7soCUp5ZJMObI2IjzkIUKjNuO8F5PrmlLN/mGoW/T8ogoadh9WGoKFX0VNc4BJ3n3BvnR/5qccykCN5Ylc2/8FG3kodKsSMpiXWMcYmNVZ1fZYm1OrErdcvUPVcvqStgaUMsxzwuXVNYuHpACkT2W1UhWeSbhilid1tfmEoWidKRuINerElOx21DhF6AolZS8Tue6M0/6MB+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) by
 TYSPR06MB6647.apcprd06.prod.outlook.com (2603:1096:400:483::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 11:38:54 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::6a) by SG2PR04CA0190.outlook.office365.com
 (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 11:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 11:38:53 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 54C6240A5BFC;
	Mon,  3 Mar 2025 19:38:52 +0800 (CST)
Date: Mon, 3 Mar 2025 19:38:47 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z8WUxyJT1fdHKo67@nchen-desktop>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
 <20250227120619.1741431-7-peter.chen@cixtech.com>
 <86r03ip0kf.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86r03ip0kf.wl-maz@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYSPR06MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 38389ff4-3c56-4d03-e7f7-08dd5a47f9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SdA8uY2gjwXo/aZ1jwwMgu+Vk3jkEzwxtzluTze/XAyYBdCu7HBrt++Ky89N?=
 =?us-ascii?Q?BXmTipKnZFwgCwWhG5tE9Pt9t68YxS9S8u7dRrqtFVthUpJ9Q8zbyH8+Qgne?=
 =?us-ascii?Q?UgQrzAXfeCLR1A6/c1sIZksYEpCn43km5VGyRPpFSR2MGmX8oQlPLix2xFCK?=
 =?us-ascii?Q?gu6uFd3FS4vQSjqDlL5wmcGSGRKqr/X8TlomoVCZfuQZwrkLnPFYjN8Q8OYV?=
 =?us-ascii?Q?n0Rxq7BTNK/VthT5Tkzgbj82KIa7epLRlTwIp4gSQ8jv8fykelEGQRm59PzA?=
 =?us-ascii?Q?rQRZsCzLpIvozh/FCJodR89OKcCCs2A15CNkQjf4zJgb8oaZX4xqS6RWUkS9?=
 =?us-ascii?Q?8K4N+a1JwxPS/JeZ85AvJMNDTiJnxW3YJcT6SIFt608E1o4JsJelnr9ITJxX?=
 =?us-ascii?Q?lP/WBAAa+Nv/7OXvkNDt9b5g4S0kB5VrEfXXVEwbC8G9FZXShFb/xV5JIztS?=
 =?us-ascii?Q?9eD+yCVdfUBU3e+XMQBVRgFldrBm9FqzdnG5QFIBrp9BY3jLgFbOIv+vM13G?=
 =?us-ascii?Q?zf6ar4wPa1/h0iP4QvMVwDlg5t4/qOLZlwIats7LROviYfFTNc4LPNcCqE9/?=
 =?us-ascii?Q?8IFgJg3TNJK9Q/Os3uLgGi5uKBpvxWPVp03gSfAXqjgPM5ilc1m74lJtW+dY?=
 =?us-ascii?Q?FhxrX3CX7hrWytCGDj5hW+1FAc2ojB7PAY0nGXKa+18E4unueczgelNUIYrY?=
 =?us-ascii?Q?/I0BUzSCgH1J37WNN2qfsuZq/KM/9vXwc0PtsLJjELSUUAl5BJuLo2TYAV9z?=
 =?us-ascii?Q?ZSPajlPtPMhF+ntVn9Rm/vBE3ZqjUqEsozaIgUcl2EVA9ZaZwvGfKUv7Y84d?=
 =?us-ascii?Q?qEDaTKGi5VUjYiSUVV2nzeJML0aqMSMn7l8ySgqpJfBr+BFyT0E3Va2PlSGv?=
 =?us-ascii?Q?7eXmoEiXv7fru+zKij31G+vJ2vqQyN9HMFaIX4qGgYgJhFuAT3ueut+k8vK5?=
 =?us-ascii?Q?EyjqIbO0e67YCon1P6KjqgyjqxqRVTMXvi73q5S5BZuFFdJa/i0fPyeZ9guk?=
 =?us-ascii?Q?YqyWhPSq/pD/7QmScSN+J3oGlZTDy4rxXz0iyjmKjpAqe3TBukHgSfloEQHh?=
 =?us-ascii?Q?I5/T3KoxBhoSpClvfaYh+zlDi6O554jxKqRQ0Pn67coCCv8kLrUQiuhp5xtB?=
 =?us-ascii?Q?RkRufAN8UCRhKQgQ7UYnS1Ro2hB1lMtOAAW7J6ess82AEB13Lj82VkRF0B05?=
 =?us-ascii?Q?2eFLeIze2TL7ufVqaD2Zs1ODYtoHGqkyTbeaSuWhIcVGLSP7mduYLzH7mozf?=
 =?us-ascii?Q?Hk4qY9o8h6S6PFGYsvxYiVjXeHpCq0gWGeIUOBKZb1wdYm6mdGif6qqD+z60?=
 =?us-ascii?Q?qjUUjDt8+on+i6asxnj+kIbeZF5jc/O2eERNthoPmreSWDQ4MA/VMii+SE0H?=
 =?us-ascii?Q?JJaWggnSVYfA/s1q1Nh6M2KNNX0PCfIdoOLH8JFsIV6EnpYsmF/ar4G5QKTL?=
 =?us-ascii?Q?P3RsK371Q6AYBMXWQZ3oeBw3kNX7SYNke7Uf4HpcdR+Bh2TrtNf56bd+CmNN?=
 =?us-ascii?Q?7VuREbaBkrvemq0=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 11:38:53.3032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38389ff4-3c56-4d03-e7f7-08dd5a47f9b2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_033906_346196_9B07B592 
X-CRM114-Status: GOOD (  23.19  )
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

On 25-02-28 15:10:24, Marc Zyngier wrote:

Hi Marc,

Thanks for your detail review.

> > +
> > +             cpu10: cpu@a00 {
> > +                     compatible = "arm,cortex-a720";
> > +                     enable-method = "psci";
> > +                     reg = <0x0 0xa00>;
> > +                     device_type = "cpu";
> > +                     capacity-dmips-mhz = <1024>;
> > +             };
> > +
> > +             cpu11: cpu@b00 {
> > +                     compatible = "arm,cortex-a720";
> > +                     enable-method = "psci";
> > +                     reg = <0x0 0xb00>;
> > +                     device_type = "cpu";
> > +                     capacity-dmips-mhz = <1024>;
> > +             };
> 
> Given that half the A720s are advertised with lower clock speed, how
> comes they all have the same capacity?

According to Documentation/devicetree/bindings/cpu/cpu-capacity.txt
"capacity-dmips-mhz" is u32 value representing CPU capacity expressed
in normalized DMIPS/MHz, it means CPU capability per MHz. For sky1
SoC, both middle and big cores are A720, so their capability per MHz
are the same.

> > +
> > +     pmu-a520 {
> > +             compatible = "arm,cortex-a520-pmu";
> > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +
> > +     pmu-a720 {
> > +             compatible = "arm,cortex-a720-pmu";
> > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> 
> This is wrong. The default configuration for PPIs is to expose the
> *same* device on all CPUs. You must use PPI affinities for your PMUs.
> Please see the GICv3 binding for the details.

We have discussed internally, we have not seen the benefits routing
different PPI interrupt to dedicated CPUs. Any use cases?

I prefer changing pmu nodes as one generic Armv8 PMU node. Is it accepted?
Or must I keep both pmu for A520 and A720, and add PPI affinities to
describe hardware well?

> 
> > +
> > +     pmu-spe {
> > +             compatible = "arm,statistical-profiling-extension-v1";
> > +             interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +
> > +     psci {
> > +             compatible = "arm,psci-1.0";
> > +             method = "smc";
> > +     };
> > +
> > +     soc@0 {
> > +             compatible = "simple-bus";
> > +             ranges = <0 0 0 0 0x20 0>;
> > +             dma-ranges;
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +
> > +             gic: interrupt-controller@e010000 {
> > +                     compatible = "arm,gic-v3";
> > +                     reg = <0x0 0x0e010000 0 0x10000>,       /* GICD */
> > +                           <0x0 0x0e090000 0 0x300000>;       /* GICR * 12 */
> > +                     interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> > +                     #interrupt-cells = <3>;
> 
> This will need to be bumped up to 4, and all the interrupt specifiers adjusted.

Depends on if PPI affinities is must.

> 
> > +                     interrupt-controller;
> > +                     #redistributor-regions = <1>;
> 
> Drop this, this is useless. It is pretty obvious that there is a
> single RD region, and 1 is the default.
> 
> > +                     redistributor-stride = <0 0x40000>;
> 
> Drop this. This is a standard GIC700 that doesn't need any help
> computing the stride as it obeys the architecture.

Will drop above two properties.

> 
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> 
> I don't understand why you repeat this on every sub-nodes.

Because there is a child node for gic_its below

> 
> > +                     ranges;
> > +
> > +                     gic_its: msi-controller@e050000 {
> > +                             compatible = "arm,gic-v3-its";
> > +                             reg = <0x0 0x0e050000 0x0 0x30000>;
> > +                             msi-controller;
> > +                             #msi-cells = <1>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     timer {
> > +             compatible = "arm,armv8-timer";
> > +             interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
> > +             interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> > +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> > +                          <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> > +             clock-frequency = <1000000000>;
> 
> Drop this. The firmware already sets CNTFRQ_EL0 to the correct value,
> it seems. And if it doesn't, please fix the firmware.

Yes, you are right, firmware configures it, I will delete it at next
version.

> 
> > +             arm,no-tick-in-suspend;
> 
> Why do you need this? Is the HW so broken that you have implemented
> the global counter in a power domain that isn't always on?
> 

Not hardware broken, just arch timer will be powered off at cpu idle
and system suspend due to power consumption reason.

-- 

Best regards,
Peter


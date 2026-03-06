Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8E3F01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfg9+gLaHcA0dR3D0y565AQJas3n4i9mAKJfxQfEjEs=; b=RKTBKx+7WG5gQw7nf37Wjve2TX
	TGV0DJWVseP4Qw06aXhUkqG5j3cpWQj/Uw0+VNZ9gcIyvlbQIEURU2dtjInPttL0Hi5Y36hrxh3BK
	XKCGJWx/ikTmZ9EKWKitoNyzGhu2OE17x0lQQwkOclHAUKWbqXWXov2k+L2ZYbCCGVelheAGtupIU
	njdsm9v0bc3hczFJ+NbvLs/NLVoO67E8DucVNNSoKVmuumIeQrFIx6l16zibr5CE6udxBH6H1jM3V
	TFFgVQt+3bxUmu9PzW27pJQEYRb8IRCMuLtrKV56CpwDa9lD6ScyWZYBhaj3G+sOSULnLJLa/X55w
	0Wf9LNOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQrd-00000003HdS-0SGh;
	Fri, 06 Mar 2026 08:48:53 +0000
Received: from mail-northeuropeazon11012056.outbound.protection.outlook.com ([52.101.66.56] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQra-00000003HcM-31EC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 08:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqccUuX2Fy0b53AQykVXbIvSyD8n1iyQuyDz720+emcAucsq9PtJuAT5qkVLG8oWf8DN1d5n6/zk3RilGl0BKbDQgMs7XeVZf0uWYQHQhslpIqoNnGPsaVMBMoV7XaDBz54LhNP6hSK3hUOHyHgvkcTJaBiTsOi55IY1sUZA1ZvR49MaXLVCZc8YdVYJIs123V12CsOgp0FXe3mFKaZAjAAL7kP9nzAyi2cJ6JnNX457iFxIUHkW6ariD+oNZMORGWIu4fKTNzvSwBg2TqM5Q6seVOWEMnkcwA/tQvHMbKbOa/sqgvljvAKS+X+OyKqe5q1Fbb4NMBOMJd/ZDefLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfg9+gLaHcA0dR3D0y565AQJas3n4i9mAKJfxQfEjEs=;
 b=LTELVoXH1Jxt2GNt9g34JaQRSC81x2qqhyEXkkW6zsN09TKl7k64V2tIUN3DsBO8rsYUUxK+uLuscDEfWHB4j6CD1NB/mtlX/QCXOcnKzOx5QRt2JpC02PdXfi0SWdCtHvqlrJHmN1+cTCq4OCDyfUmqDCCPB+fsvpLFpIbW8Ff6QKrmE0vMjGjDis91QbwGqpM6IGOy6eolFhRcTVX0DX/gCLZAd1htbFr2C9RkKV5WXIoOzBYKWV5xJsuYrH2YPLhqxb/IzuD7ADMAIslchjhrkGj6b4+B1106ttmjpUEcGtaH1oyD/NZMdV8B0EXac5NEsfwV0Fob4Q9fZw82qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfg9+gLaHcA0dR3D0y565AQJas3n4i9mAKJfxQfEjEs=;
 b=IuiRxQzqUWI7qb0PK3oR61XLRwWJB52TneI+gcvhtc0sDMFk/m3wqWGQXijH9OA2Bqs0euMc+rZaQuDRhoeyd2d+RJtN6P3Ze7g7FOLCxt4XNsymAgN3G7o9QEGCDy3YIizEXnrzpLTGi5gV25ZTqZgTmnaPGJCxZkcBId/HK+MTA7elH5gELWZKWo0Kb/wRoMygDEQTTC9xMU5f56llfaJHfyCIu7kxxmBxX4xrIWNhVIIPsZOoUaJW2l5jdLNb/xw9N9W/OKjwE+S5kMWyVTmf/GunPx37RoKWQtEuOBaQAHMNPhsZ6UzitbI3QxiB8C54pnO7KWNMe3RA0hszeA==
Received: from DB9PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::9) by DU4PR10MB8558.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:55c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:33:40 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::7e) by DB9PR01CA0004.outlook.office365.com
 (2603:10a6:10:1d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 08:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 6 Mar 2026 08:33:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 09:35:50 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 09:33:37 +0100
Message-ID: <48b17cb3-d0d4-496f-9b5f-3df319f28b49@foss.st.com>
Date: Fri, 6 Mar 2026 09:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: soc: st: document the RISAB firewall
 peripheral
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
 <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
 <ac793499-bebb-477b-b27e-089529f3ee4b@kernel.org>
 <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
 <fd73947a-289a-43f9-9506-573fee935d12@kernel.org>
 <ed0ab69f-7aff-423f-8b93-980e79705b6d@foss.st.com>
 <c588720a-6a7d-4179-afb5-bb7e89e0e7e1@kernel.org>
 <b535dfd6-e4a6-4831-a868-c152574144c8@foss.st.com>
 <ae9962a4-b611-46e0-b124-5910e8708a20@kernel.org>
 <78be9de6-084d-4c3e-831d-a91fd0d1775e@foss.st.com>
Content-Language: en-US
In-Reply-To: <78be9de6-084d-4c3e-831d-a91fd0d1775e@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|DU4PR10MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f33073-103d-4ca2-2c61-08de7b5b10e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: W5yJtrZYdwBRuyLcAhcVGE3SclCcKPa9EOWY9c9MaY/x6r7/MzRILFSWvdnbbhDq9RXt8Pr1/eXhUGWLPn+XmsvlcpECeKneGmdVn3swxYYtCi4E0BhMj1oRbYyIOAO9DQ+zS7tB6Bk6n54uaAD3s6tsun3ZEZWHrlA8vUPYpzjfWi4qMH9+l+Pxgob4h36loF3CTOcJXxVMXbv0CvZB6tlBzuXQD1WIeetGGPY2OXgAgheItsWXpj9FZN+gljVH+vaX9oYDd79Z+ABqdGfXqgPmrm837cs4Kf1mWVVo6cJq9GNAI/ZPI57FtHsW3OvNMwYblPgiBoCcvi5VMmSzfs2Mar5699+XGhSnlEnCSvporh806D2jRw/Tih5/AwH6ne2NKbJXb4ixsj8r6vZbgbN5RqtHvZVd0AdBb8sQoN72zZtw/BCBc+LNoZb0WK5jL+scX9QhermQcNDPf37V3zcbM88eoWqC9TfGSO8RSfOQZaQRRg9++/UTJdYQiiusrmQ5Ifguvnhqa9wBcQ0HyjfS7TFS11Z5yHx4juwFmsCUDIj4vAGJGBx4vvYcwP8lQjOw3gIYnooLR18kdqcvw7LvrQeLda58y60VGj730csDMVQXRC/q49H8HBFK6aIyfEtq2npM4B1p0sdSJeceiioREhLBtxkJq2ba0G6qayXcoRS+zdtD0fIvJ4RhUj9++yFeDo37G7ZvDv2D4X4b29kI0Q2wX0a8T1hZJ9KpMKcW9X58Mnuj/rDOF+n4nRFj8zI0Bds53iFSs5a/mSVOlw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P8SuHmeHSZtWq4EfnI0PIqfLKWlEerMHzko0Y2WzHeosokOCXTsvMUAGTm4htIMWiinTDa4wcqOgNzqFf+KXoQmPk9vS8SD6YUsBBRy1YS8S1vN/rhfuBYVBTRpsTF6iZrqMkHS4ejugDpfxVtAyeSoGUN1+1Q4Q/wfmGwGqdqyLFFmWmJSeChas5/Ul38NcA9pDo5uTf4mZiwq2fgBvqpse7VTSdlI0peyhXfhLXN66OebepcgqblGvR34ehMacHz0nHImhK5HdgPa7FImVA2qO50EXPEgYcqJx4lIMKCEJCR4a8Va39agVLoWyyXft8e/4Tn9TMDGlyivQSvexDOhamy+QmN1wmYsDTutwQCpWrNROjSoMQymm/jLQ9oBwEt0GYvfps4ehznwlqqiYLRNyOylvNqIhzGhOqsMxqKKH9lyvzexZeKEXzB0p6VU6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:33:38.8066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f33073-103d-4ca2-2c61-08de7b5b10e9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_004850_902969_4B6FC366 
X-CRM114-Status: GOOD (  34.93  )
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

Hello,

I am changing employer so I will not longer be able to work on this
topic. Antonio Borneo (added in To:) will take over this and I fully
authorize him to rework the patches as he wishes while keeping/removing
my signed-off.

I'll make another patch on top of stm32 next branch to update my
email address in the MAINTAINERS file for the rest to keep an eye
on it.

Best regards,
Gatien

On 3/2/26 16:09, Gatien CHEVALLIER wrote:
> 
> 
> On 2/26/26 19:13, Krzysztof Kozlowski wrote:
>> On 19/02/2026 15:02, Gatien CHEVALLIER wrote:
>>> Just a small reintroduction of the issue:
>>> We need to provide three sets of information to the drivers of RISAx:
>>> - The registers of the RISAx device, handled through property "reg"
>>> - The global range of memory addresses protected by the RISAx devices
>>> (currently through the custom property "st,mem-map")
>>> - Each individual memory range protected, handled through property
>>> "memory-region" that points to children of "/reserved-memory". Memory
>>> regions may not cover the whole range covered by the RISAx.
>>>
>>> To replace the custom property, I have explored a few ways:
>>>
>>> 1) Describe the memory range covered by the memory firewall as a
>>> reserved memory: Cannot be done because, for the memory firewall
>>> covering the DDR, the reserved memory would overlap with the memory
>>> node used to describe the memory available for regular kernel use.
>>> The memory node represents part of the DDR in that case.
>>
>> But isn't this the entire point of RISAB on main system memory? You want
>> to mark part of system memory one way or another. And now you say that
>> overlapping would be a problem.
>>
> 
> Hello Krzysztof,
> 
> I explored a bit more the possible usage of a memory region to describe
> the range covered by the RISAB/F peripherals.
> 
> To describe both the range covered by the memory firewall using a memory
> region, I would need to have such node at SoC DT level:
> 
>       reserved-memory {
>           #address-cells = <2>;
>          #size-cells = <2>;
>          ranges;
> 
>          /* Range covered by RISAF/B */
>           ddr: ddr@80000000 {
>               reg = <0x0 0x80000000 0x1 0x00000000>;
>           };
>      };
> 
> The RISAF/B peripherals need to reference memory regions contained in
> the range of the memory it protects in order to apply access rights
> to these region's ranges appropriately. Therefore, adding regions like:
> 
>          tfm_code: tfm-code@80000000 {
>              reg = <0x0 0x80000000 0x0 0x100000>;
>              no-map;
>          };
> 
>          cm33_cube_fw: cm33-cube-fw@80100000 {
>              reg = <0x0 0x80100000 0x0 0x800000>;
>              no-map;
>          };
> 
>          tfm_data: tfm-data@80900000 {
>              reg = <0x0 0x80900000 0x0 0x100000>;
>              no-map;
>          };
>          ...
> 
> at board level. These are regions that can or cannot be accessed
> by the Linux kernel, depending on the access rights. Proceeding like
> this would also force the usage of memory-region-names to be able to
> differentiate the Range node from the actual memory regions. The
> RISAF/B node would look like:
> 
>          risaf4: risaf@420d0000 {
>              compatible = "st,stm32mp25-risaf-enc";
>              reg = <0x420d0000 0x1000>;
>              clocks = <&rcc CK_BUS_RISAF4>;
>              memory-region = <&ddr>, <&tfm_code>, <&cm33_cube_fw>, 
> <&tfm_data>
>              memory-region-names = "range", "tfm-code", ...
>          };
> 
> Notice that the tfm_code region here share the same base address
> as the node used to describe the range covered. This would result
> in the following error from DTC:
> 
> xxx.dtsi:109.21-112.5: Warning (unique_unit_address_if_enabled): / 
> reserved-memory/ddr@80000000: duplicate unit-address (also used in 
> node /reserved-memory/tfm-code@80000000).
> 
> In order to use it that way, I would need to force-keep the ddr node
> disabled at all time and use it only to extract the reg it describes.
> Which feels weird to have a node that can never be enabled.
> 
> Also note that, for our ecosystem, these 0x80000000 -> 0x84000000
> regions are inaccessible so it was simplified to (I'd prefer to
> describe them all BTW):
> 
>          fw@80000000 {
>              compatible = "shared-dma-pool";
>              reg = <0x0 0x80000000 0x0 0x4000000>;
>              no-map;
>          };
> 
> at board level (e.g: arch/arm64/boot/dts/st/stm32mp257f-ev1.dts).
> That is completely up to the user to define its memory mapping and its
> access rights per-region. One could use the lower DDR for some other
> usage.
> 
>> You do understand you do not have to reserve the memory, right? You are
>> doing only your specific mapping for that region.
>>
> 
> Yes, understood.
> 
>>>
>>>     memory@80000000 {
>>>         device_type = "memory";
>>>         reg = <0x0 0x80000000 0x1 0x0>;
>>>     };
>>>
>>>     reserved-memory {
>>>         #address-cells = <2>;
>>>         #size-cells = <2>;
>>>         ranges;
>>>
>>>         risaf_range: risaf-range@80000000 {
>>
>> There is no compatible here...
> 
> There's no need for a compatible for a reserved memory?
> 
>>
>>>             reg = <0x0 0x80000000 0x0 0x80000000>;
>>>             no-map;
>>
>> And why no-mapping? Isn't the point of the block is to have it as main
>> system memory?
> Main system memory is described using the memory node:
> 
>      memory@80000000 {
>          device_type = "memory";
>          reg = <0x0 0x80000000 0x1 0x0>;
>      };
> 
> this one is used to describe the possible memory range covered by the
> RISAF, which can be superior to the DDR size depending on the choice of
> the user for it's DDR, so we shouldn't map this region.
> 
> As stated before, I need a way to describe the range covered by the 
> RISAB/F, which may not reflect what memory can be used or not by the
> current execution context. Hence using a proprietary property to avoid
> confusion in the DT and simplifying what is the range covered and what
> are the memory region actually configured.
> 
> Best regards,
> Gatien
> 
>>
>>>         };
>>>     }
>>>
>>
>>
>>
>> Best regards,
>> Krzysztof
> 



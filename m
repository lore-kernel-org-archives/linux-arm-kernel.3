Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DE2CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QZdPuiF3s/K/hP6adyb62JYNxigoWxMG1szuuNaHkc=; b=Q9pCuXhWXdwQq4rSqSGgsX1qkv
	JinTZ1Ost1i62xubzey/KKRkp38BJpkdVjwbazWJ4jeAylgsd1JXIbNdy096nZqPe1/6rjxPtxZVy
	Gtsbu1kI1dgTPIrS7rq66eVhVeMevU89uNmLIcg1qAC9zfMd/bunXH9kI1rb5t4SesJeL34nWN7oS
	hx/v7AkY20cdesyu3z3qah3YDWUfrhHkTdWgs7hsDda1068U6HOh3qVggCMN+oqmoAjh8c00je+ta
	Kl28zaRcSrnBT4vQE4OoqIqQZMj/pJlanQId5IBZL0TAlu6yjw9Jgb7XhcaHw3q2IVmw5nNGP9yBN
	ZsFaaBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV88v-0000000GnPY-39DL;
	Thu, 04 Jun 2026 13:29:53 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV88s-0000000GnPC-4BTL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:29:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0N80djnCG8EMxaFkYJ67CYfDorYxAO4/IfdLWjbOdsdl2MufBrG0U9iWkDD3NyYLzxWlC1g4gydabeGlzciDyzhVKKaqajTuN1XjaRvvhw5P5Xbkju8UqnqS6UFQ8GLcp8Ouy/r3nbuQxoVYutcnhrOGCLbCVDi8iNSk/DTr3K6CrWYa7mlUdeRrB8zx0CnG490oHz3Y/p+PieIUylJMH+UQGcFeid0lGpAs+7oDV+paudW8yIQ0JRwg25IW8jaYhzyhnASyH6AkZYjocziBgQtFZSrjxe5QN4hKucrcscXjujuTzsjj06APqZrdkJfkFysy0TynYhFUSNp7Y0lKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QZdPuiF3s/K/hP6adyb62JYNxigoWxMG1szuuNaHkc=;
 b=UnxkCHnF6l6P7eYW0iALO4EWGAI0v98Y5XmEOAXTWBn+6DjRFurKYT0aLvS3hNgbryiAxi48Ww306176Xr6h9DwpJKuSzXiC1S7/cqnxW15S2thHeHX5fvE13LmNmbXWhitdhD5FVT4shXRu8CwHnDhoI0vogLmj6/YxCRo6pHyRMXxyodDMtDhJVmyfpZYqNpAwld2b5PkEk9J35lg26ves2mVYxyrlT1XsfchaFkR7C5j+/iwtiK3vod+H/k385NlCE6fiXL5pgZ0UAEU0E3dntSBX1FJNbKBeToc/ND1IZlHjDLoY8y+QTiX9oEq42c6IlfKBcGREqvOrGGJYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QZdPuiF3s/K/hP6adyb62JYNxigoWxMG1szuuNaHkc=;
 b=vYiNs4Tt9ia2xNkGDO1uJNlMtnceurxK3UXd1MZLeASODsUzPB7J7EvmwKtNJJrnfyI87bW+dpqX7+G4ADXxmhGJPY/KtRksDhW3aRBXwNBb0XwZ4JTJJjYuaESvRsBTSt8rS/nIcyio3uQOkuknnmoOsuygjABRTJAPeIUXMJ8=
Received: from MN2PR05CA0057.namprd05.prod.outlook.com (2603:10b6:208:236::26)
 by SA2PR10MB4747.namprd10.prod.outlook.com (2603:10b6:806:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 13:29:45 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::66) by MN2PR05CA0057.outlook.office365.com
 (2603:10b6:208:236::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 13:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 13:29:43 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 08:29:42 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 08:29:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 08:29:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654DTf8t3453466;
	Thu, 4 Jun 2026 08:29:41 -0500
Message-ID: <203d82b2-216e-4f5d-aa3d-f653228d397a@ti.com>
Date: Thu, 4 Jun 2026 08:29:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI0
To: Nishanth Menon <nm@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
	Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
 <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com>
 <20260529150119.dqzzruc7xqliftwp@bullhorn>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260529150119.dqzzruc7xqliftwp@bullhorn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|SA2PR10MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: 316b6f94-fa86-458f-8492-08dec23d56f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|13003099007|22082099003|18002099003|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: gq2d/GemulBTXe3/pXa0FVUE/YsKZjJcTzDAJAM9mjrurG+HYDY2jUBJbJSCuvSJqgWbbbmI/c2TCagQT8Q50ibLrxmLP2VH7npkxvYUfhUl7jA5J255pF8LcpPXdsb8eiQHPgiV7HgPBuzy9OkB/eY2kAZ+8UTuFR+Zw7orcb0UbA/NX3Jmvc8a17V2JiMB3Ecx+hGvfWsM2TQAJcjT45EkrqgFHwqw2nfWXZPrm7+LHVHRR/gX+ejpu2baN46Hsdb3QxyjE0aAkbnSKwcYWoq5C3LP6ZzhWF3iaVLl0XIZQyuiWu+tV9NLH2tcEfm1ccslCR1bY5mflwhM3wyQV4UjiNK0TcWfhllqHP7PCkDDs3XqaL92ouahW40dIm5FCOJYtIfvMbju+ArowckvnECCtf1ZvFBkzncrx260qtgb2UDtoZ0PG2U68bbKLhURI7U305PaCOltBlbPXFa4TJaFxwl02H6ItmkyZSfbNsXgPqSL/ENj37RDYBtKBng3YV6NwRrGX0T2q4a1RozipEiDB4QmNpGhvkGUSqdwBerY30u6sKZCc6y05AOWOfDazajbXezDmP3iVvGm/QFq0J5ppP7gR2tfkwDX2M8Ao6M8B9IAJlP8HD/UZoxoMQoycC0u1tyLTOxtjCT+xhzA+y9VgNLlO8q8gAv/rb50zWeuY6CKsGDC+hFDNaImxmZZ
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(13003099007)(22082099003)(18002099003)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8ATxqa74a+ctuapL15k+LHEYobWomREs2gnn/bzCQ4pZhcSsNgB0kZjJVP1ljvbIm1Oo6qtsb0ajdULymit68EEcCKAciIqouiicSkkDxnhJan/fcmoM5E8RRN2m4ocbaGeVnQIZHOe1NYS0mRt+uaaPsjTo9Y4dpXNdjKSVUwfrK8q6vV8b9nDMH0iIaO9pruqY5XCI5dcMAeFXl2yX8/f66VTM0ESeaWdmoCppBNsNzZGL6B6lmuPz7FtGQdEKt6WYclvy+2s4nyjRBYFBM8R4n7xlnWkWtopobNLA6qYsFSB1yMo8kl/cDlVCYn0hpW1wTLgOIpNbewFgcGRNTUiWQA6BfBFfHs0vObkaNZnTMNztPOiGEsVH+4VdMJs+XipVg4bNW4ApDtAVfbwxl/CekXag7y0hNV4iLCdLMQAVt4u069ukby1kt9IPgOnn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:29:43.9799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 316b6f94-fa86-458f-8492-08dec23d56f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_062951_144811_48F57C2D 
X-CRM114-Status: GOOD (  20.26  )
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

On 5/29/26 10:01 AM, Nishanth Menon wrote:
> On 06:46-20260515, Jai Luthra wrote:
>> RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
>> through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
>> this camera sensor through the CSI0 connector.
>>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile                    |   4 +
>>   .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++
> 
> Oh man..
> https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
> comes to memory.. Afd - what ever happened to that?
> 

Good question, others have taken over the torch for the most part. Nice
little talk[0] I found on some current status updates for the topic.

They even mention my little proof of concept around the 19min mark :D but
kinda just dismiss it as it doesn't support hotplug, which is a requirement
for their usecase. But my solution doesn't support hotplug because DT
doesn't support hotplug. And to add that kind of support to DT they are
pushing to change the DTC[1], the FDT format[2] (which hasn't changed in 19
years and is the basis for claiming DT is a firmware/"ABI"), and make an
alternative to DT overlays called "addon DTs"..

What I proposed was something that can work today without any changes
to existing DT infra. My only goal being to prevent needless duplication
in overlays like we see here where you have a new overlay for each
connector the device could be connected to. Just look at our evil vendor
tree to see what this problem can look like, go here[3] and search "fpdlink".
We have 14(!) overlays for just one camera sensor (IMX390) with the only
difference between each being a single line to select the FPD-Link port
where the sensor is connected.

Jai, I see you have already posted v3 of this series, but could you take
a look at what I've proposed here[4] and see if this could be used to make
a single IMX219 overlay that would work for both CSI ports? If you can
pull that off then we avoid the combinatorial explosion of an overlay
for each port on each board for each camera sensor.

Andrew

[0] https://www.youtube.com/watch?v=C8dEQ4OzMnc
[1] https://lore.kernel.org/devicetree-compiler/20260112142009.1006236-1-herve.codina@bootlin.com/
[2] https://lore.kernel.org/devicetree-compiler/20260409115426.352214-1-herve.codina@bootlin.com/
[3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti?h=ti-linux-6.18.y
[4] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/

> other than the dsi mux, painful to see so much duplication..
> 
> Other than that, there is the previous comment (ordering etc, repeated
> here). I also suggest people put the url of the board/part that the
> overlay is supposed to refer to when creating overlays.. at least, some
> sort of canonical link so folks are'nt confused in a future date.
> 
> 



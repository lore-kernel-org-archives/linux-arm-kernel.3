Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B51FCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy783P4Uivgl5+vlEpU5+66H3yCeVpDooWdMwJreD/M=; b=asqnfpTgsvvhflKwZGAUV/+Epr
	rt4qdfciY9AAlXi0Aiat5Tea/jghSoPkzEBFdN6yK6IlPR41wdpN677XHX7cWxz4gYDGB9PrnfgsF
	1oXCNHDCTFIzX+S4SQ8xohob8RObc9F8ly6oRqtDQwi6Xp5Kpb/PNXtxbnQCV7LQEp4SqPXbtqUKu
	Klfbg5vFfOqHCjcqQkcLmhfKPcwXdb3ASeHOGVsrMlhgL7t8u7JJUauxkVx0H1SK/mW3jQJF784mq
	IchSEMlrZ/Obu9tXesmS3fXj2kCKyF2kJuh5whJ4DQNmjVGhQMYGDuZSAMwIWYABhUPybr3JISC9X
	W3xVHaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMe-00000002uez-2Pgq;
	Thu, 07 May 2026 06:37:40 +0000
Received: from mail-westus2azon11012030.outbound.protection.outlook.com ([52.101.48.30] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMd-00000002ueb-0CuZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li7sXveiIc77h0Sy2CapMUua2qNNwB5kAqyjIXCMGrWrRZ+cZNC4W50tDWCxmSAHfUDg3H/B1NpcC2E9x00547DZGMow1BLuknFtd3ShScw/A25IMd7oS2rFd9Ob8YqdQfRgGeVMyTVUCh2Vr0ep2z8i1YUpU2Z1VygWtSc80dYSwtElkojr5bXrKvuYKvwP494l/pZJay86mZkVHhCXUGsQDoOUfSa3xXMwz5X03fmn65Gwc83s10TSsx5ICH2qL/U7pNkwekFEqNXGuI4AsIJjfu9RuifcfkxeASRd663322IuozDBh+uv2qcXSPOGz5rfAHod7T7dDagxoMgV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy783P4Uivgl5+vlEpU5+66H3yCeVpDooWdMwJreD/M=;
 b=dQZ0+ml/Iat43ZvPaErbi4aF/bSNR4Wxgy70W5nEkOzc2EQWQ6d/z8ZE1BJABM1ujVWQgXj4aIVKAVYnYc9kKu7kw//9C8mZ4ZSFJe2UWXXUJRB7wv5/4VCl4LCxDyestIslwpH6HYM1WaaCyKtqASh8jqMKoZGgcWjiVUC4r2elN4wM76nH1v91BuuYoq5Xl5Foy7MNi5P7Q7aW82H48H3MVX5Nl68Mtazj4YSJWmKJq8fmXKOE3a0bYEJp8ilwV6ALrdr7hiYPBdEuwZoRWjHVCmmJnWOjtGXXl0BdlUbF8LNSnPrAbGb2eQt7iPuOU1f3DX8Ss6HLSNsKSVSV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy783P4Uivgl5+vlEpU5+66H3yCeVpDooWdMwJreD/M=;
 b=TtrDOFDnytHokE07sBNzBf5YDD3+ejFHRJitx0Y/FfjrvM7vyayn6UXh8UuQKWobUY6YnccopfK7bud8rO9Ky9DyS9u5pdyIYpnmOO93eijfvlekWxMlB3yMbWipGicub/1dzvOIB6qj+j5jlUQ1XZno+PpNj1NYMtMVzvuUoLE=
Received: from DS7P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::13) by
 CHAPR10MB997746.namprd10.prod.outlook.com (2603:10b6:610:2f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:37:33 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::90) by DS7P220CA0009.outlook.office365.com
 (2603:10b6:8:1ca::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Thu,
 7 May 2026 06:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 06:37:33 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 01:37:33 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 01:37:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 01:37:32 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6476bQ133050919;
	Thu, 7 May 2026 01:37:26 -0500
Message-ID: <440c9069-b8dc-4dba-9dca-3a6c94bfd52e@ti.com>
Date: Thu, 7 May 2026 12:09:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: "nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"kristo@kernel.org" <kristo@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "w.egorov@phytec.de" <w.egorov@phytec.de>,
	"matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"d.haller@phytec.de" <d.haller@phytec.de>, "francesco.dolcini@toradex.com"
	<francesco.dolcini@toradex.com>, "joao.goncalves@toradex.com"
	<joao.goncalves@toradex.com>, "emanuele.ghidoli@toradex.com"
	<emanuele.ghidoli@toradex.com>, "ernest.vanhoecke@toradex.com"
	<ernest.vanhoecke@toradex.com>, "rogerq@kernel.org" <rogerq@kernel.org>,
	"eballetb@redhat.com" <eballetb@redhat.com>, "robertcnelson@gmail.com"
	<robertcnelson@gmail.com>, "afd@ti.com" <afd@ti.com>, "u-kumar1@ti.com"
	<u-kumar1@ti.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "luis.parga@ti.com"
	<luis.parga@ti.com>, "srk@ti.com" <srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v2 01/13] arm64: dts: ti: k3-am642-hummingboard-t: fix USB
 clocking for compliance
To: Josua Mayer <josua@solid-run.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
 <20260506141040.1368918-2-s-vadapalli@ti.com>
 <c5c8a3a0-c8c3-448c-83a6-99ffe3e6ef11@solid-run.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <c5c8a3a0-c8c3-448c-83a6-99ffe3e6ef11@solid-run.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|CHAPR10MB997746:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cdef178-bb72-4a09-191e-08deac031ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: hva7d/QhPOJEeE3GTQnPzzCRryRVDVJB3hbyfVM2ch4aRX5GRKhEX8iwXXv8fAwBd464Ch0IGcNMGUtbaE+oep35Uy2EMI4D0OU8zxq6TIJKoTWd4a47iVY6RLvuSAk2AWo4LV5fty41VMdPifqmq4dBskjQSzWUVDYzLhPSG0paUE3ppRe+Z0/bPVlSaLj0sTBORiWESCe6fmWOOJr9opUzl8/QdVTe+mJJj+AB2s88T9RFnCzSYqREy9o72vgo1UrB8FrPF9kp24yqAKX/Zlm8K1BN7U7iTbXfZdg8l0IHm6xylqTqpIg8+CveV0ZTMQufnzICsUS5jeToRlTgWOCr0aFFvLcq3NyJjyjMq5L25UaAtsu/3DSpUzLlWfs3i1E7ekhhrqE0x4qxlZ2ux+Q1xPs7YvOBeGk4vehf+j3JeI305Q57aen2BXjA/lpbwm6pcZvwmx6+acgvu018Lp5y08KHHEWqVuVK/NMlhDWFzFeqWmfifanmFbHO3Hzzf93tS+3C1nxbh5RGaGY9EYn+Pgeb/Nhhcg1oquWiIMkRLsBn0NReaFpVkfJTW/FaIdQOyuvThcGQjKvBIUbSOWDTY6CDZhf4Aa8pFe2FAUZxJBZp/Fz+ejgm14z9nA1tfvwgPaDbizfEt/SCw0+ykQFvTxJlnItOG3JnRKlt2ieXEBx2RTJCOitoGr/ULHxJkPS9Sfm1NPQWFDPldmtyI8o2OcyzgqzBZEDgJrEWPbs=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cwr0xRBhSNSnBsqLV6Olo79Z5apA1bn6gbpJ18O9NHxY6f9PgBcyDUqG3atiOq6BJCFd7OqLojloK0peNwf1blxNoqXRcDRYrLX6UZy2rJnPl+v7R0/7QDn5UbclV0AaX7wdP7TMr5PTc8V01NeS6jXpt0uZs4nYQJzG8iqZGig1xmfAaf/rfj1vbICOAZmBDGlEvv+VE1qHZw+P+b56yeRGXh/h7xtAE3riSTP81pfcoOdItR3pvaqfa9I5ucpz1p4Pr38SHyZRNxlSXTatrK/IOd5AEmUoqDMgP+iBc7F1m/eKzx0LYVu6bNNcVBT8SP9jlu9O9n+dRDAqL3yMvdBXYM09CukOJJSySbhCyQy0C+iHBUJqsRJ2L86iEnp7VAnH2LbTV/YyLhUZoa+oY8yd6XKRAWI01mIdNlt+uoZD5HX4ZMKnbEvBDpF2myc6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:37:33.6625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdef178-bb72-4a09-191e-08deac031ef9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_233739_178953_BA38B2F7 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
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

On 06/05/26 19:47, Josua Mayer wrote:
> Am 06.05.26 um 16:09 schrieb Siddharth Vadapalli:
>> According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
>> the USB 3.2 Specification, SSC should be enabled by default. This protects
>> against EMI violations. Hence, enable internal SSC for USB SuperSpeed.
>>
>> Fixes: e2b691804319 ("arm64: dts: ti: k3-am642-hummingboard-t: Convert overlay to board dts")
>> Fixes: bbef42084cc1 ("arm64: dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Acked-by: Josua Mayer <josua@solid-run.com>
> 
> Your (submitter) Signed-off should always be last.

I see both patterns in git log (Acked-by before Signed-off-by and Acked-by 
after Signed-off-by) for arch/arm64/boot/dts. When posting the v2 patch, I 
looked at a commit with Acked-by following a Signed-off-by and followed the 
sequence.

Regards,
Siddharth.


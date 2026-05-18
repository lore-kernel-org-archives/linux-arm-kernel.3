Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA884CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocUBXPIbrLYyCUgHYmEBOi9YRq/DzvVuga/ags9v9T0=; b=zzojMPfIsZfQ5weZ17ofBLt/QJ
	/Tbb/AVMmVSSDL9aQLt6NwBmYhuC3VlBhauRkk2U0IwX6gRU2o1sKjBHL4kdpunQwlT9zaXls4IZ+
	E+3FS/c1Bi+Sfk+8+xsJngGfEJmItIw32OtKlrprYf0c5Z0cXZLepc4+R5uu7WJoFiQqMPFN9Q7UU
	M4Lo13hleVASyl969Lp9BYIcDTzleiP5wSZOXqEiQQStBQnJSUzgOVvdEipPuWRHs2c1exPmsG/qP
	Ua6Rc3e5AhNZ5ZKh6Dj4a3CPPhwQTKa77cm/kQ8AoKFsS8q3aPd9wVQg9zpDisYhelf9nFb/HqQCd
	CSxBCKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOs07-0000000EVtz-2Ylh;
	Mon, 18 May 2026 07:02:55 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOs04-0000000EVs8-2cxJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBxylg3Zlc0OLKUU7+A7PqJx+I4YTLFIdS2KV+JH2H9RJPG8Y6kkt3k4peq8LUP4lvSmaP5BRFSY4VU0zyyRsjTTtv4J1LG5wei587xa3lgHRTuS7egBxypgwYt7OBOxUx76L10Qg6Sdbazu+uc+wc5aPzYiigrLU8KWbd/kCqHL0y7ppgw7OR2CGEUwUC0fw1fDBZj36z4AYOPNF/7Cxo/k5EDxDDqn/o9m5/OvY2PIxoGl+oY21lzKNfN1dn3m+pb0nAgkIIn7Mp/UuqOxB78QnYGQRvn4yvyAU6BQWhqeuNBTNfewg1KVcGEpQkFmfIR69zr3k4AmwIhY3N87PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocUBXPIbrLYyCUgHYmEBOi9YRq/DzvVuga/ags9v9T0=;
 b=iwFGUqsYPhAscV3peu9ZYx2mlHXSNMJP/G7Uanw3sLifChiJRaR1xrgdRveSw1wnKmZEcQ0DEVWL9Lvsp+lCgeEbza1yD7UWSpocCREkheLvRoZehR3MRgCF61xElPrdwtQ6ggglWlBuOWk6d0RkMMt8rXbdgLyApzrzJK4umdlrLq+C4Qg/8YRyk/C7YVqKufgCeyqZ+ZprVZFVhDE98pLWj8gwWYiDwTqJP3lOug0GOkzCBqqcU+/EwYSs5xHhapu3pd8SZhnrQRObeYls9KHwXJUfD068J9m2XLZwmPdLuuxh/2h8MfMbldNzhSGRo76kF4z28N8p2hf6yAE/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSAPR01CA0376.jpnprd01.prod.outlook.com (2603:1096:604:35::28)
 by KUZPR06MB7986.apcprd06.prod.outlook.com (2603:1096:d10:2e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 07:02:21 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:604:35:cafe::40) by OSAPR01CA0376.outlook.office365.com
 (2603:1096:604:35::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.22 via Frontend Transport; Mon, 18
 May 2026 07:02:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 07:02:20 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DDAC74126F80;
	Mon, 18 May 2026 15:02:18 +0800 (CST)
Date: Mon, 18 May 2026 15:02:17 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH 3/4] dt-bindings: usb: add CIX Sky1 Cadence USB3
 controller
Message-ID: <agq5eZSAZYRAuCH6@nchen-desktop>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
 <20260511024244.981941-4-peter.chen@cixtech.com>
 <20260515-dynamic-archetypal-reindeer-dc6dd5@quoll>
 <agb0he7vvbqSIym5@nchen-desktop>
 <ccc8ab6c-d301-4585-8be3-1977485c5e87@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ccc8ab6c-d301-4585-8be3-1977485c5e87@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|KUZPR06MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c9bc88-095e-414f-cdb6-08deb4ab67e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|4143699003|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: /mK33+RNJE/SXD6Om93xrCznlt+6UbdpOqSXT/pOzV8VjyNpa0vSvWN0Gb/4BXWIBRYHoRD/FzaEw2AEJviGtn0MxhH20JKegw2zGwP5X9JQu55sl5FdmZreBpIPqOIfoKMLIWX5SrKdWjK7VgZY6twEv4ZupkK1bhmWgm10NA+2EHBc1vwmUadY5V1dVjSep6oIDY+T/JWaCqrFJIhz5ZcJUH1FUTZtDkllueMEejKyLTqZoK79I/jhwFw2sN4IGGabwC4iXdZzxr1vDboZVHtVXfLrn2YA2vIKhuIHqqwR1ohrCKPgfAJXLDYfZYyOqMsKzOwpxvL0hA7IiWkuLMWVmMtokUtq/i8JDK4OG06Lv5wopuHAIgw/AEH6cHuU0KqLf31EYotNYrWl8pgwmhC7v7rBfrCrFuSvoV343wa3NMiUv1AxHU+zfMT6j6fG2HtWWkspWbefh93pvaa/P2FNzzSPg0Y+ocdB5heLTfGYPZECwglZFswCvGEWBK37dw3P7pXfOMmEkwvQXnIIJrQEqieeG93ahZT5yYoe1an1odoRchC5W6zB5oYfce75ImwGmoUjcjs28C43Ls2IkxsCE4O5hTVVLzezClTaqTdB7EVB4TzQAG85iISdd/Zgry6lcCm5mRinT7Hb5n4cPSW702kobm5asRBuW/4u6e2VkP/b2sIrv05lH0+SupEkOVcVxN8cvPTvF8CzGJkZr73jXr3jWF2k6N6BVpCtHRw=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(4143699003)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3I8Tpg3YCELk7vAbmPSMU6PLaKjfOQE4wI+8RfmGBqhHJfrx3dCgzp2t+ZIbLnkR5hqKkFbcpVfIk5zhLExfMLL1cFIOAHbb0fdF5Q9X1dk5P0NMLqgt13fUwefJY0Cunu35XCNamfYi7k0IShSV7I/Ij5l+n46ElGcEFq1G/+je/k9nO53lhyDafhlVBpZjH9WKLi1pSS00nhmW+1gr7bRSSxirEzltVVHUtLsx9Ek++BeFhCcHhZlr3GNCr3mVZAMpmQx5NLuRp0eLCwu6jL2WK9QybxomebShQpwXbQpLAtYQfACgvmhd1WuiqXKnyBuQqJ5xqlwgdXreiFK3g1VznnQ5TQz127zlhs+a0Nzqm3dXoQikerQJ0UfYcR4hB43UoxsriCTEjWm9I0HzwRe1u3vsO/qog5jerUEqwW+gKtYuii/uOobpdNSNvAcL
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:02:20.6144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c9bc88-095e-414f-cdb6-08deb4ab67e2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB7986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_000252_669235_52E69C41 
X-CRM114-Status: GOOD (  16.02  )
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

On 26-05-15 13:18:53, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 15/05/2026 12:25, Peter Chen wrote:
> > On 26-05-15 09:54:10, Krzysztof Kozlowski wrote:
> >> EXTERNAL EMAIL
> >>
> >> On Mon, May 11, 2026 at 10:42:43AM +0800, Peter Chen wrote:
> >>> Add a binding for the CIX Sky1 integration of the Cadence USBSSP DRD
> >>> controller. The schema documents the glue register window, clocks,
> >>> resets, interrupts and S5 system controller phandle.
> >>>
> >>> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> >>> ---
> >>>  .../bindings/usb/cix,sky1-cdns3.yaml          | 151 ++++++++++++++++++
> >>
> >> Why are you mixing USB patches with DTS in one patchset? Don't.
> >
> > In this series, the 1st patch is the IP core driver changes (export APIs for glue layer
> > use), and the second glue layer patch is the user for new adding APIs.
> 
> 
> Not really answer to my question. Why is DTS here? It has nothing to do
> with 1st patch, second patch or this one.
> 

Per submitting-patches.rst I.7, the DTS was placed at the end of the
series so either maintainer can apply their portion. That said, if
you prefer I can split it into a separate series, I have no strong
option.

-- 

Best regards,
Peter


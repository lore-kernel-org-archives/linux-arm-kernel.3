Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BADCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5qlMXbFpRlE4X3MIQCAxqaW35emWVZDHc8//Mm+AHg=; b=s+hadmjMVbO98mGtm17jj6xh1C
	IKuUJ/FT74I+i36fbOdg676CH50y9gJ+ZNz16RezukRpZUZ6PEJDNkD/ZU7/+9Z+k7DliRxmzqtfo
	zAWcigwMSRlfXGWhu6X8QNCsVy4L8EyZXyD6seXjB5N3NGBLNP6Dnl/nmdNBKuqfvOeakodHdgJxh
	63AuR3ZLcURaereQbl3wUVBCwRC1rDrtLwPZgbM5KPysirXK8CsUXMXUsb7PdT261d5StHYZdFWG3
	ZtjcoMPdLaP+zqS8Do/XOgmQy52SjeWEs3Ui9eZ6Mug3GcFZG4SnsKkyNCk/7QYn+nQsnvPbA9IN7
	ZIkiRCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL18q-00000004Guq-0U3a;
	Thu, 07 May 2026 16:00:00 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL18n-00000004Gu6-3Q0f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOsKGTesoqqYEIO5/FZ+T6X6w5prXsNUS8pXFXQCGyVuMlgaU5niE0xfDOnv5KojDuIEJVuRWwhbd/qHiqCnt+Ni9/gEnlLArJAnBqrCCasZHkfU2TRVsZoCX0KBIaYdBoA0uKh9BkvZz10+qUgTsqp5rouNGLleD85ulESwycr9gjgQSqbbpsAOf/5aoH6jIaGUhKyeyCLJdoHX68Wcp/0aXmhGwuMAGT1diiNKUjFbcO9QwJvpA8VXZC16fv67Eob6y9nwzbw9F5JIQKLts3HfQxX8dy40gfN10N5PgepRT85TBF76Tp0QdhIPsG6yA/bAtm5DNiqIuGURIjLCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5qlMXbFpRlE4X3MIQCAxqaW35emWVZDHc8//Mm+AHg=;
 b=aco06SjNplQfMySR2veUmKR0erBoidZS/faQSwbyqNFTLTE5K2BsejNOlRIjK99XCLWaxTVnl3Du+aLsT0l1qVQBvOTjetL7cuvRchdZ6t7vzyBFn2zza/+k3ngmSFHEqcYojOuAJIOsY40C6lKdh+jnXoI9veChXtgxwUBHGzsMyl9hjSDOtNDLYZvD4xjj8uHg4rZCrFgGSigh7MhiUOPavxWiF2JviVaHJ/GixflxVYZn0b53q5DGBNpz+sZwXBR56aysvzbEFh+ezzcRZ/9U4ZUemnJR70vEysqSnT2sJLAfUm24UXLJ+dYBLncCky4qsbR7GTjmIShDCs7m/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5qlMXbFpRlE4X3MIQCAxqaW35emWVZDHc8//Mm+AHg=;
 b=dVaxD4EDUn01lJPm8NMrD69FsxVf6kXLx1MndwR+XIFnZqj3MqvroeY9c8UEd7aHPTsNIH38rpEpn63kBuNnhvkIWuXo4px0fdYtmlTYlTwf4ueNWtJhFW+w/smNsOPx1iKObppVxavgXK/HDVpEReF538L/EES6OLjeOuG6mHs=
Received: from PH1PEPF0001330A.namprd07.prod.outlook.com (2603:10b6:518:1::19)
 by PH7PR10MB7768.namprd10.prod.outlook.com (2603:10b6:510:30d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 15:59:47 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2a01:111:f403:f912::4) by PH1PEPF0001330A.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 15:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 15:59:46 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:59:46 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 10:59:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 10:59:45 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647Fxjx03965288;
	Thu, 7 May 2026 10:59:45 -0500
Date: Thu, 7 May 2026 10:59:45 -0500
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Robert Nelson <robertcnelson@gmail.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <josua@solid-run.com>, <w.egorov@phytec.de>,
	<matthias.schiffer@ew.tq-group.com>, <d.haller@phytec.de>,
	<francesco.dolcini@toradex.com>, <joao.goncalves@toradex.com>,
	<emanuele.ghidoli@toradex.com>, <ernest.vanhoecke@toradex.com>,
	<rogerq@kernel.org>, <eballetb@redhat.com>, <afd@ti.com>, <u-kumar1@ti.com>,
	<stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>
Subject: Re: [PATCH v2 00/13] TI: K3 DTS: fix USB Clocking for Compliance
Message-ID: <20260507155945.alnz3z543gxnulxq@procurer>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
 <CAOCHtYjJRmr5LhRePqaOomjVHb=o+B8-3+6BN89Xx9erwRdcng@mail.gmail.com>
 <0e9e5de7-b456-4da3-8165-8ed7d66f2671@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e9e5de7-b456-4da3-8165-8ed7d66f2671@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|PH7PR10MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc0765f-82e8-4a29-a652-08deac51a95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bmhu4Jd1/cwg71tHJvj8z9SHmvNbXWCzN5dKISExq7bH8bsesTRhw1IuWSu4oZ4OamIGG922XhRzyujdGnUohMkYL7qjasxytxkXEWL8icerkDX6Fq0vRzC2j68eosh+v9bhQ53Tu6ojLpuQx708c13bNwhbwPJIbYX7R/jFrE3OkI2PhuuhBMK1cRC3i8A5dfalyASApADh5eafaf2Rm6vgPREV/jGVncI3/4j1dgo+j1AXjFw8yCKyNpv1+O37nt3l76MXabm14qRuA7Jf+bju/pX50d3VzrcJ46zksAKpoBd7H3Xat28ce4HxbvbDskUjnSiHi23JsROSUDIzeXvTHI2Z0f5RHn8AmIGBLeKmsFukwDsYdTvrUZwZN9u+SL9raQKpsgMkQRjWBCQ7o2zPD7fx2ZT5QRfxiNukWlg6bhhc7Fsx3VmhIJVEgrVsCxCHFFoHfx9fdNjYTLky69pRZOR5XSaay+jFX5rQ0onwEu5GCT6vfVAN8tUbrudkrkk3WeS/p7YZHMnMjWA1ax5GPrEVeSy5UFEvw6xygvQEi0uwvpf0RQO5XkCl1S/Qt0iHOidX8p5JQOug+Y87NvhNFgpPhS0pNw/QfxpT6I/hh2rl+eqp+7bmkso2PwBAjj020RvhqVKHrtMqrFqbC9iWo2PHeD3J9pJGUNkM5tOHPLlsCCV7ddNsNhPFPZ31T02mL5ls/3bA+3Ujog38OArk6sZbII/VEoCvvFNhjYc=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DJTxeq81vG8AaEix7tn8UvMiIIXYQy1M+sLJm0J/z2MiBQ+H3TEJXZyiglcQwFyOJMeuOM2d0sFDe3bP+MUlfQv25B66lvm5p2sp4rC+P2JxU50D4OQ59pwczWytQU/SgtSFkJ/Xd2yLJxq6MgALsGscP5eNAhnLxoOxEajA/d21ZjA8AXS9KHVetd2qMh6XFYYolhjV4c1knUtiQ/2Ssrcc3F41m2hxGKgQZt7FTT9YPGkRBkecnsMz4OSvSYNHAs2cIhnNGWr8iSQlHGyeVxE2Dz7FOtZFlaIVF3SenEZkeIkD76ovnsyHI68lkuqyp7LKgy3/dUsagNP/7U6xZl2PfaI6YGrWtDVJFWVAJG2im1veZIFn4whZ/ff9G4l33sUSTnmQ5/dFqHY3DFADVA5w+hiy9knHgQfZKqVPMtIKncbdQw/oo0Y7UJHzytKx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:59:46.6108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc0765f-82e8-4a29-a652-08deac51a95c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_085957_854821_FE57F03E 
X-CRM114-Status: GOOD (  15.27  )
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

On 12:14-20260507, Siddharth Vadapalli wrote:
> On 06/05/26 22:37, Robert Nelson wrote:
> > On Wed, May 6, 2026 at 9:08 AM Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> > > 
> > > Hello,
> > > 
> > > This series enables Internal Spread Spectrum Clocking (SSC) for USB
> > > SuperSpeed configuration. This is mandated by the USB Specification
> > > section 6.5.3 Normative Spread Spectrum Clocking (SSC).
> > > 
> > > Series has been posted as individual patches for respective boards since
> > > the Fixes tag is different for each board and needs to be backported via
> > > stable.
> > 
> > While yes, that's true for stable branches.  Since these are so
> > similar, wouldn't it be best to push them to the board soc family
> > headers?
> 
> I see individual patches per board+SoC combination for new features as well.
> So having individual patches for Fixes seems to be preferred given that
> squashing all Fixes tags into a single patch doesn't make it easy for
> backporting and reverting in case of issues is also easier for individual
> patches.

It is not clear to me the path to stable here.
1. Driver fixes
2. binding updates
3. dts fixes

How are we lining these up for stable?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


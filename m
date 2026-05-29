Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF1ECD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klROpu8KPSHJJAtWT3ipy/wabf74MPm35SefDHaWwa8=; b=xUJA0j5oHKXB0j/Eoc2hdsixen
	Q9rKU+9ZfdmvgqeU0AKOrhylreDQ4g2yoTzN00JHwB+sLRVU1gzaXsDmjeyTNLQqpMMWKCrnC9qF3
	5FlDhakTBCAOosZdvZNaMXPOT/zacq518/EISVvPGG//jgrDryx8Zmhg2aFz9jqi3xiR+CHtUFKOk
	zDUEM0/9B0RuDZT+EdY5EN2qDUzwlo9SpAWZpQvA8M5x2/3vqpF4+LLhzccTYvFZXDbeZq84Q0qxD
	0sm0KC/vZ9Dgvj6qk2wtvGqkoxgXTWyojzvyWKBtViEml24turT29KNw0qLB+P86FMSZBOldvbktl
	C+Q/n1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT4np-00000008FYp-0jpQ;
	Fri, 29 May 2026 21:31:37 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT4n5-00000008FXV-1UXT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 21:31:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTs01Mq/PKG7kH2pkw2oP+CrEfsCoRVmo+89eUgJ+BpoPqhgTsnFnKeSkXFDs0z5Om7PKW3Z+qhw2G1y9PIsb6CohDc/QiY58aUEV7bBPwcOvoj9iEAD6a6cFqVnGPM2ucd0k7qho4WecuxKhy/3nmxYFEgH+OmGK2ag5TaRBuNc/MfRy7S5LvZVYXxFNzixKEAkDUXvgM+QqqLnDlNVzLC14oWB8cTCj1W3enoqldX4k3t/eec9m2uH9pxP0TRvjVq40doEbMHK0cwSl1f5JiNJwdBhwACNnvA9lLp+r6YryLhDUmvY7h/aT61eYSokQqpKINwDAAAyYguKO54ybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klROpu8KPSHJJAtWT3ipy/wabf74MPm35SefDHaWwa8=;
 b=lIAxdsPgntmyR1xeCQriyB/iv1V7YEza5vjaQEJHnor5w+qliuh9h0+OF3wlFJlDsDL54NJZpQB8Q/hC4QjG2vCkt49+4hjvKS19IFcK0aBdTgS8Xdh6I0PzWZM4xAa5UHkRo+oVhddUKG1RWZYOlnOkWEHSiln4qHRPS0c5cUVAxJJ6P0pRi+k8mFo7eQCxnar+Njk7+pij+MeOOkRXser8yjEGqMVXkKBIy4jqootwH2KoxwR+I3LeXSQY0c/6WEicwCwPrW1zzxZjqQWHJQSVrXYugMiBdm1xshntB0WKdp/pFJjsjKVzzSUW8cCbME3mCKNJabINEKZw3hBbSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klROpu8KPSHJJAtWT3ipy/wabf74MPm35SefDHaWwa8=;
 b=UB0KHKAb/W1gRGpOSt6DeDGcGCnS7MhpgJbZYeZ1hbIls2oRsGGQZp2OR6AjyVgt5fcgv4R9Q6LjOG93s7FOcu+tVPt40TQ8kCEn8dBPCVyjFsfywqpBmPx94m5lNfNAF9pwJqrxrPU4sgpN1i/Ma3zJfwEbnwhE6U8lU1aiM3ddF5hmjlPYXfkGfx2Rl21qvi6kZa88Lek1nTViS2jWX5LjOvhLy3iax521bR9YIf2i2RBm5NrAH+YLojkkwa6u34s1inqYYjpuNhq+Bs10FaUgteDOr1iUrc/eECkULglS61QR7zM6GMJ22p+7GgizXBHcwwUAmXiy/p+PolJW4w==
Received: from SJ0PR03CA0228.namprd03.prod.outlook.com (2603:10b6:a03:39f::23)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 29 May
 2026 21:30:41 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::10) by SJ0PR03CA0228.outlook.office365.com
 (2603:10b6:a03:39f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 21:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 21:30:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 14:30:24 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 29 May 2026 14:30:24 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 29 May 2026 14:30:23 -0700
Date: Fri, 29 May 2026 14:30:22 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Ashish Mhetre <amhetre@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] iommu/arm-smmu-v3: Detect Tegra264 erratum
Message-ID: <ahoFbo7KNHiHh+D6@Asurada-Nvidia>
References: <20260529140830.629738-1-amhetre@nvidia.com>
 <20260529140830.629738-2-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260529140830.629738-2-amhetre@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 79638964-4343-47ba-e53a-08debdc98808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: W1W4jSuedWcdS0HJdB+Rmo1np2gNBdevXrPSw278grAIkh0zLOSgbt/uuLZVHTLdQ6gCDyJC0DdwFRot0VceZ+8UjbpdXxTW90SuijyYHnvs+av1uxO5SOPQR8TOyz48FJuDxoPCm9gbJJNB3VwasreQrx7ktbA4dUF7VPH0eIazV1xvO54cr29kA9usilDKadAzzEqgO7CKEhGxq4DWPwN1QgzL+ZZAwF8gPdJKKwxQIOa+kWc9X1A6M+0GFOYSnWVpa0sHVANvMcKJ+vdBGpnZsJPCH+8rf52dP1lFCaLvYWPdA0qF4L9fHe08X6ExwL9nNfg+JB2ndn0V3Z/zqaQXK/Ujb/0xkeSCQCUPcajBi4C2ADI5xdbX7LSeTf8x837LkguyhDKGsQ7oVU0HWRB+QbMQOCP4+K3P6IkIA0v+WpvRRuRdNXDQGM4qpK7Sq+5w4jenQ7APMYwohOmddCt1tfNHaN5L9RLFzOUGBvw0AoW1cuLs6O6TU8YDZz8KJf+h4c3hzEc+uIXrxPyYJKGtRFDraJkAv2y6ztIGFRnHYjhr3snSRI4dvon9uH37+HU4fusQLx80Ms5iKOfj8v3gieWSHAH4K/YYwj5mV4pr8ELcklAL0iC8mT8X5/9YHitcJhTovOADd1eb9OVop48txyDDnB+LwGTSJ5y2FiTbXy8+BrK8Nzoqawjk9LTApq6WCnquif9sabNeVMLXrFD6aDufuLgB0Ic9Ps6lBmU=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TJup/SQNefnTWoW+WNCw45JKkrfUUlabIn0JulGLt/MNmg/GfF2i9Uh//l4zijKCUp15JbWdyWLfeRhPOoxmrfeLbQABIL+q3GvfeAgJPAG615xN7NTKU6sOJ0AvnNbJxVu+T+4qh0ihH3O2xaH4HU1lFCBaOvFK/cSfdkTV7T4EMGzX88eZu6rd6NmyTuUf1ElQ3/AfH+kF4Z7oCczM7uCPTrbvQOjlzBAW33Ty60t9hh9YfLFWKAnF6ETgNGr40Iw9ptwS0V7Wp+AVlp+z9r57xIKj4a+a7Ct7+BuhW98YRgjQQMbMVwoeeEX2ZsspUIf2egsGzXfOB7PFO8OZEv58IpfQrwuP0OIwq55pIQWQ/eE3XeOKmKa/TX/IMoEpkhExOw6ZnfO+HwJU34O1oYUHcmecAwd2oEMsOr1+cfDa1N3VBHorAjKGSyC4xYmP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 21:30:40.1249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79638964-4343-47ba-e53a-08debdc98808
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_143051_399420_EE60FF06 
X-CRM114-Status: GOOD (  15.49  )
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

On Fri, May 29, 2026 at 02:08:29PM +0000, Ashish Mhetre wrote:
> Tegra264 SMMU is affected by erratum where a TLB entry can survive an
> invalidation that races with concurrent traffic targeting the same
> entry. The hardware-recommended software workaround is to issue every
> CFGI/TLBI command (each followed by CMD_SYNC) twice. The second issue is
> guaranteed to evict the entry. ATC_INV is not affected and must not be
> doubled.
> 
> The erratum is not flagged by any SMMUv3 IDR/IIDR register, so it cannot
> be detected from hardware register. Tegra264 boots from device tree only
> and has no ACPI/IORT support, so detection is through device tree only.
> 
> Add the ARM_SMMU_OPT_TLBI_TWICE option and set it on instances matching
> the existing "nvidia,tegra264-smmu" compatible. No callers consume the
> option yet, next patch wires the workaround into the CMDQ issue paths.

I was told to avoid "patch": once a patch is applied it becomes
a commit. So, maybe "a subsequent change will wire".

> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>


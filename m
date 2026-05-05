Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259DECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqGdWLBHmry+fvz+LqzhmDuNRWqG5My04FHi+nNbQs0=; b=NEqPgtQVbSxuFsT73YH0lBxzya
	zYbey3YXndJ2D+jzOZx9YDovWIDSkmc1qfqAkfP5nQx5iRmUF4pdAiRGyPDeVlis0dfChUNor6DfQ
	i5PZ6sQ+6Ud9xbLdjn4FA65mMlme/YSleORuKZmkqDLDZUwnc4tRFa1COkGIiCe88klStrQBA4TZm
	uOVl3+VSYJlbRxf7dzZyf3HX/IzHqcgeaJCgmgOKxOZZVz182U8/4WKHhBRh2PZbxmNO3BBAwC0IG
	ljnruZgGKLXNZ2sgjk33hPg7bZynZA6b3vU/qUG0JbuhYJo+dk0/D6NW8/yQlU4JgXzy5Z7ToysPb
	7rw1NANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKF5f-0000000GCwN-1bJl;
	Tue, 05 May 2026 12:41:31 +0000
Received: from mail-southcentralusazon11011031.outbound.protection.outlook.com ([40.93.194.31] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKF5c-0000000GCvZ-1nAa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:41:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLgY/jXBo5F4iEdGbdEd3LpPT4eGDQJbTGjFK324x+Wn9NI4OxNDn1TOKM0nmeY/pDvLlJfMxNdSRvwO9SFXAxGM/UuaJN6iW78EksPRQuOd0rV+eIn8F2t8PFGpgFZBFpk6snVd8UuiQm9ZoGFLXsRQdhDDQCvbH3m1zVRDPuSoGztKhrkinncBxciBZRiET9oKzTiehjpDjDxCCCSuE+KoZe2ecE9uN37cWlScb7djm9Wlgw7yXdpNkRsOad6rAF2xnhfJ4hb+Cx7Qbt9r8Jh+//ugWFIkE2UirWRDF7zDgq3r7paf+BWMCT2fZIzJJr81hxHfhO1RoRIfe4aEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqGdWLBHmry+fvz+LqzhmDuNRWqG5My04FHi+nNbQs0=;
 b=BU6H8TvY9njs1Eb4CljJNHuAviV6m31+XwRZXzvND917EtCkMSqeEh0cBUbR4RFLdMtuOouHQ/t4I0lSHkdIDILFtWOs35aEcjsh9XLyI/KmSBspCoxQO/hcYGRpbuGUnCUxgBPuN0QWud/V926zlAt0O9/gX7uiEF/+bRoLc9j7RMl3BiiIpy5GdTT4GelFRv636VnlNjuqPQaaufwYZsAhmMfg9wLRNRS+g2kTnUWbABzzV9cH/3XeJEqh0PLo2TFQos65+dRO//scQpmYgneEuGLshUpiUaMUqjaUaqogV0zElIYThXN68ccZBI17Ne/DLuZVSixyPW6gGPmFpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqGdWLBHmry+fvz+LqzhmDuNRWqG5My04FHi+nNbQs0=;
 b=bzjxX675O0HVDbeO5k+z4wwUib1EU2m8OJBpyydqpxnF4o9i5ON3d58Rxh+86indWHX/01bxfp3ZtC/GlT8QaYYTSujJ8AvkTBUet4P0LhQBupPwqxBfjVVs+V5gHmEYK2EUwlb9ThuAYwWFGFD/Eow8ydEE7pEzQUEpHXRqOWY=
Received: from BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33)
 by MN6PR10MB7519.namprd10.prod.outlook.com (2603:10b6:208:471::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 12:41:22 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2c1:cafe::85) by BL1PR13CA0328.outlook.office365.com
 (2603:10b6:208:2c1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 12:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 12:41:22 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 07:41:22 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 07:41:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 07:41:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645CfLZi3262567;
	Tue, 5 May 2026 07:41:21 -0500
Date: Tue, 5 May 2026 07:41:21 -0500
From: Nishanth Menon <nm@ti.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Message-ID: <20260505124121.hffywentvo5pusfx@glowing>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
 <20260429-topic-am62a-ioddr-dt-v6-19-v4-1-fc27d6ac753c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-1-fc27d6ac753c@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|MN6PR10MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e83d71-098b-4b62-bc96-08deaaa39d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ll7lfayHUdu7K6U3jUoFkYKH9QXv7AZRfZInucs68mMLnw3/zHl0LdDaYGK4kkoqB24n1BxI14dyfwwj+MQUwivS+R1K0WmpqaioJBQlyj43zuatQtX2ARNLayFGd8Pn3Hdqt7w4y9yPQegIOYDKlpfb6xamJnnPxzHE9zuoc8nHlPqRQFdFuKZbn0CB1h8/o5y9d2WeOXNSOIQgxx03idQnJUWQcPqBzOGpapaeHmhAYKAOMuZ3hwg2WFdzD7AAlh9h6tkkszRdAphFz0X53TVO/9orkGp7W2vmb7mJ0NDMaQZ57GKEZcvJiUxJ0+/Q7U7DkZt7wuR8bITj0LvauTzP+SNxND/TBGA/qHhFULGwCHL2YfWVTOTlzrAt7aLq5qgOw6JNMIaaGwSbU3PJqJWpC4252mAcqkSlFx2YkDPNYB8jfNIkGINAJUKjVekGnCa6H9rjaCHKY53RGrhFjqEdJnZUf2upKj0AmXUU045HVwfkQ5ozjM1RPJD2Vj52qqD/Ymy4ByJ7C+cuncISrK7fON2KSGxk6AdcZyY8NV4OEncdIuhlxVPlHWEmQUh1Ok9F7OBa1vA+CzlbLF3nvdWlnnYfKdwgdinC89NklBWzP/DoAITE4uOU8x8U5pr7M3X5eqgDJPnOGx6yT/z4k1Xrom5WHLNpYg2pZJmf3VX1LsPJhHSA1FWnduA4LrYT
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 97jPKgXnZ07udIk1s1A5KTm7Pk/R5gLswfnhZL2Dvfv/l1DNxL+gX/vT9I/k45y6tfsGPlT5yhZI5KDzqZt/iXB75bn2UM0FqP8YF/H5BVR35qb3Z3z1e8WgTcKYZF9aSjAaZ2vgKGDrwVPP/jpSft4lC8NjigQoiqh47G58R1H/c26AcmizjXuo1DH/BNd9M5/et1VTsQuuwqdQKi3DRbC5652w+Um7zdUAMYc28ZWobI+qyn+2rYCCtMF82nzImB9dZ0fHZgARTyU4IMBIbIngMJiJR6cQoglxSN8vk8TD90A6VSn+2B7zA+ydV3dkI523n9vHgxg2e1DvMqvXdXGWR2MeHfIHbL4Xi1u+2m6qC2uHo2ZQ1+KmObJb2nYTpd+1m2lTkgDh4yp2n0YdVYCS6twanFQDLSRkK00Z9gp419Nroffq7OCiZG0xBt+P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 12:41:22.5000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e83d71-098b-4b62-bc96-08deaaa39d27
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_054128_492489_F3459F1A 
X-CRM114-Status: GOOD (  20.42  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 15:22-20260429, Markus Schneider-Pargmann (TI) wrote:
> Split the firmware memory region in more specific parts so it is better
> described where to find which information. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..6f2ee93c7be141ee5ae3f1e3324d3a060db069f6 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {

Looks like you have'nt addressed Vignesh's comments from previous
revision.

https://lore.kernel.org/all/DHS46FH9ZYZB.3BG6HVH832NAE@baylibre.com/

We dropped wkup_r5fss0_core0_memory_region here..

>  #include "k3-am62a-ti-ipc-firmware.dtsi"
In this file:
https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/tree/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi#n27
https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/tree/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi#n68

I am not clear where wkup_r5fss0_core0_memory_region is now defined.
BUT, in the patch, we introduce:

> +
> +&wkup_r5fss0_core0 {
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_ipc_region>,
> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> +			<&wkup_r5fss0_core0_lpm_rest_region>,
> +			<&wkup_r5fss0_core0_dm_region>;
> +	memory-region-names = "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";
> +};


So we go ahead an override the definitions of ipc-firmware.dtsi for
wkup_r5fss0_core0 here - explaining why the build does'nt fail. I am
confused why the ipc firmware dtsi was'nt updated instead? is this
something different firmware dtsi now? if so, we should split the
ipc-firmware.dtsi accordingly. Commit message does'nt mention the same
either. This right solution is to make up our minds if ipc-firmware.dtsi
is meant for LPM mode support or not. if not, split the dtsi, if yes, do
the mods in the ipc.dtsi

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


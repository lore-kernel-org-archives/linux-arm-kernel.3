Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B62F4BB72
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AyxPNBJhItxJG3Fvd2Nk/Yo+ugr6c8H8klsFrAn8IQ=; b=0Gk8D7zrWdVDzLr3pRhwqaV6Xv
	jHWrvoBTphHLZLCnFUVxc5I+1jkds9YjAs7pVPSWP4NQM1j36ddaoG7UPFTgde+HVwkaImCTpa06D
	RNnIvrfzV/1xuISCDKUIMA2R3tE8oAXTwaVPcq7ed37Vc/5ujlAw0c0Bq4y4i5T61Af7uT6hrlFGc
	RLk6ZNQRVJsBnSUDGqY+5vLDH6eOqdOdogUB6zl8sRzhQp3xW8vp18b5XyLTFR3la5vdYn39Tsynf
	+SSdIxZ4xNCOjOlfJWostkqS9MitmubVfcXfLO/D0B9Y3N1uFR9iWK1vDgFtK4zSZp+0hPac98AhQ
	Wh1T/qUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCGj-00000003oG1-0VBI;
	Wed, 25 Feb 2026 10:37:25 +0000
Received: from mail-westus3azon11012016.outbound.protection.outlook.com ([40.107.209.16] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCGg-00000003oEt-2NmU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAZxfonudCE+C7w1tBkKYB0SpAO15pbBGfr4sE8Vc64KLwFPTCvWSLD2+fIhycfkhyL89lR8VoQozyW241HSXx+uvND5pv2h8qM3wiPVuG2m34WuhGcslQ/e97zEu7ktwQQVJweolTU311CeIRaOd5sQ9KRVC3lf0kMdxdPPDT+a7Pd/7ahKXn4rkfZn196+27ov9aBO9rAAmRVHSWY0uotFxXLTS5jYt68G6mobHnTapl+lAAuZTR1QTd7aIum9kCdNvsLd4N6iIkdUKAusIbRH6Sm0BGgaPbo1NW+kgOG0mhWX7ky3kpMnTcvdtpD+N5rkprzWmj0pov3WKQjrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AyxPNBJhItxJG3Fvd2Nk/Yo+ugr6c8H8klsFrAn8IQ=;
 b=v12N3eRpJjybm/mKXA+1QINqapdaLs3UPz1u/L2/CjbLXx/ifrnUQZlt58tvqYKKv1LSc73zpA6M+w6idbBvoqWtqO+9qmiC09GieGKKgnlOtzcpmZBROJ3tTN0OVcFjFZpw3fOeQMRQCJOjUDO/Ghfkkhx8Yk397PnkUNZ5QUUOmD4If7EAngLYbPBkFzHxkj/m9+3xOZov81sYQh+NFsn1fhgTeA+78Lhs9cymgmUqIKEFWY+P7dA+44VA/UAORACm/PTa+lphKimGnlcAwY2AbHEOzStZGIs/C/OrjeYT+19/fPsBHjNitSSV+kigeVuJvUSj55jAeBUJwr4/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AyxPNBJhItxJG3Fvd2Nk/Yo+ugr6c8H8klsFrAn8IQ=;
 b=rJ7TWH+7ArRQlInjYonljfA/FV6MbQX+tuwq4C1oSy/wQEI7EV0K0QqARnAuOf3PSbAmNmEcz3gHBGAwDgR9oEJWcP0zDh65pqcJyNraXSIoGb1DEDHlBadIeoPbx8+bnBP3goKeT2mFh41mQQG+AoHPjp+CBya7XFEzHUXr+WU=
Received: from SN7PR04CA0178.namprd04.prod.outlook.com (2603:10b6:806:125::33)
 by MN2PR10MB4173.namprd10.prod.outlook.com (2603:10b6:208:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 10:37:19 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::90) by SN7PR04CA0178.outlook.office365.com
 (2603:10b6:806:125::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 10:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 10:37:18 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 04:37:18 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 04:37:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 04:37:17 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PAbFcZ3995049;
	Wed, 25 Feb 2026 04:37:15 -0600
Message-ID: <3e005688-e479-4109-86b1-c2490cee1a8f@ti.com>
Date: Wed, 25 Feb 2026 16:08:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <s-vadapalli@ti.com>, Vinod Koul <vkoul@kernel.org>, <vigneshr@ti.com>,
	<u-kumar1@ti.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2] soc: ti: k3-ringacc: include platform_device header
To: Nishanth Menon <nm@ti.com>
References: <20260220070242.470060-1-s-vadapalli@ti.com>
 <aZ6pQMGJn99ZLWyb@vaman> <6b1e747a-fa42-4f1f-8d57-41f9d7b574c7@ti.com>
 <20260225102839.652wkz4o2fxe5eok@jimmy>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260225102839.652wkz4o2fxe5eok@jimmy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|MN2PR10MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eda91f1-aae5-4550-c312-08de7459d9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|34070700014;
X-Microsoft-Antispam-Message-Info: xXoW/ttMhrQ8rUuk/AyP9xCLLd4GoZf75CR/Eemrq9i9IMMJ+0woQouuJnkbe61vYZPjbOnHNM3ahGi1FjQI26DKp07p9Vm1uag1dcsdEbsXrolLDMeUyJQVBjaJ34vHVIukx2VBcezNUWY7qqhVvWghqiCDNw6S/TqR7Q42U2ggb6EF6KxUjnlbtAguxYCaeocXnYkOqkdeFrbPC1ktx2jmyZeQXnXrlgLY8Tv3+brvudap5tG21dlbRVJS3aLq97Lm/9qaIxh+P55UmAdfr3LudNQHqfT2/IZC9nnLloyr5FSJ9VyRYATx6azqd47+si20Z27jlDkfgeA+6yUt7JMU3aMcNuw8s4mtw/DsI7jCSueBSefQ9IM2utgzDxMIEqSNWAcCLC36DGqOHKmTmJSeyRzEy6V4IQalIhfnKfV2AxeFvI/f/FlcCxQlaLQ9Ka/wNQTyMsGp9mnBtwu5adsBZOlooCVZNIkrSZWgUVeJjWT79eQTYh8eOjwLdZWl64JCrFfmv/3Qb9hg/SWL+EMYCqiGdpAgmFLa+aETgiiHGflSHYHc+dGPvSICFo4ysVhxj20GSMDlGrcNAf4Pp7zwVfLjf5oZcHCfX89PMnA3TbB3an8E2rdJ7YTBhpTiwk8onmE9JKkwB+WO0yOD8JaPJdILMX9bTQoFN5x3JJ3/HQovY+fCIhWE3qtoE7/8r5psdOCtuOS/6vLeT36WWRXxb5Ui5zFT4TLe9spyK425nXw8c3bDyhkiemIs9kjlT/Zsl8XCJ9Gifrq1xdIjBtC3EXTlBMrbBVns3DULIr8aTLa+NMc4pCYh6ljeLp1qynJvTmdORi7rX89PwEj6Bw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(34070700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Pd9p3mKCEfTSOhxizaG5MpMXobtFIkglt5v6sPjnPe32ww4bPWedEtziQb7ZUosI2hSwus6OGG++hxCFSDTrMtZE4p/4IRI/Xn1VixjYZdjcmhwNx2N8CnkFA4M2f3LioYJSSxBUA8c5OT9NQzYM7FuNJb3ub9zmLRrQnyINJ3uVn5OllHbPB1rOfjEmtOFA1BiBeI9AS6BtGfxonHQFzHPCM1TyXIghH9UY2zFPRnbFKws511My6vzSZSWATHA+cgRoh/T+o5sjcVZc8t+Ksn8F5CX0xNcP4Vjw19jX7UijFgTbVWNhGBxkm36Kmpp1tqrN0oNAGL8Sad08oVYccPaUnFStjRa3ImZ5Yimo/nKI8Z9DoVOu57sPxGqqES9tV3JtPWSy276bQ3Ih7I6GQIZEjq3zYtjBGsIv/pbaSxLVyMBHzb3Wc/wF7CHGy4FC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:37:18.7900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eda91f1-aae5-4550-c312-08de7459d9d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_023722_623719_103B7452 
X-CRM114-Status: GOOD (  14.92  )
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

On 25/02/26 15:58, Nishanth Menon wrote:
> On 15:33-20260225, Siddharth Vadapalli wrote:
>> On 25/02/26 13:18, Vinod Koul wrote:
>>> On 20-02-26, 12:32, Siddharth Vadapalli wrote:
>>>> Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
>>>> users therefore will not include "platform_device.h", resulting in
>>>> compilation warnings for the APIs declared in "k3-ringacc.h" which assume
>>>> inclusion of "platform_device.h" by its users.
>>>>
>>>> Fix the compilation warnings by including the "platform_device" header
>>>> file, which should ideally have been included since commit under Fixes.
>>>
>>> Which tree is this intended to get picked by?
>>>
>>
>> I assume it is the SoC tree since 'get_maintainer.pl' doesn't output a
>> mailing list apart from 'linux-kernel@vger.kernel.org'.
>>
> 
> drivers/soc/ti/k3-ringacc.c already includes the header.. so who needs
> it?
> 

At the point in time that the v1 patch was posted, this was needed for the 
patch in an RFC series:
https://lore.kernel.org/r/20240518124234.2671651-19-s-vadapalli@ti.com/
Although the RFC series hasn't been merged, since it is still possible for
non platform-device users to call the DMA APIs which in turn depend on the 
k3-ringacc APIs being exported, I posted the v2 patch.

If you believe that this patch should be posted along with the dependent 
series, I will do so and the patch can be ignored.

Regards,
Siddharth.


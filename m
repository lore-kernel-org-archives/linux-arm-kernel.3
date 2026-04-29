Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A40BFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpf79PEMiDFcLFy80ngJH6MhWRl/V6bbtp47O63FGRQ=; b=ddh5VnSXAm/FjwmIryihdmw8rt
	p57lIiVtgvZjFL+HGZ4FmTarFCxlfYKcbw3lwt1jgG2h+Mvwdo/9/0BjaYtkhn2tt45YRuFVKgBf2
	hDyO4Dx2HVtqt3TlRK1g2yBT8b0+VaR4QHrLWTvADNbIhT2UC0FFTSJZvXkwu8Qs5EHsgmuTJiiCu
	FTrUtNSZZm5wC2NsCWhvIuTq/8jjC3RQydeLAmgsprhg1DYzPjusqFYMNePOcHnQ4Sa/w+dyZoMn0
	1oSsFht99X9/+Ee8SIoz6WrthmXLVRIS+ZtPwKsJUscodNmsfgtfFWWAi16r3oJCRBAyGmIUtzmb/
	DkE+etMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwXU-00000002vsH-0fUR;
	Wed, 29 Apr 2026 04:28:44 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwXR-00000002vrw-1xWm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfRY+CHof8uj7CeLGUEY3ohuTamwcbUdRgwNNs2POvfFe7HG845jzPblY50j6aszXZDRdf5Y6TOjBTIU7B+PTGu/EFe91hOSDHUZrEiG+qnPfPxsIlxLY4NyiOjrhkiK/vtqN48Rza7S+cTdh0U27IUoFoP405tYlbXD7CHZZPu1mAEKD5kurwYDtnU7Sfi7cahwtCmeJGnZSIiZArne7C+zaPp1fz7SXuHn/e5fJpge1vj1mNaEEZ6l08VRMkEC4iB3qdnR/1UHEbzOtcZgP2fRdpuIwh8v5YwIaajYKNfO7FQa17GzW/79E7BpLhASXXh7lM4o8uGuYpQmOdtOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpf79PEMiDFcLFy80ngJH6MhWRl/V6bbtp47O63FGRQ=;
 b=ABLAk/7l8HGusr0YwLbJYZ3urYxXWTdCMz6QAMeM/0R5Wq8YrWfPE4Fo9pbEc003H//hm3Mglkjo6lu1pYBCQHRaT3QCn7TieDUgU+C3YBHr7croUwdv0SJ86C0RNOsqvFToF6o0UepJeeZlU22ifrMSyJi5g+PDRx7cpO+IeQS6yB7t3O0spL2O4hLqwKU2QygasBOFPmXU9upzbheSaxaWbWZTZ6neUsaFQRgsE+wVmVbcAtBRcKmWX7i7tR7KOKyMiTWwxHMO8eX3NO61l0E90qg3phefTDRrf3N49YoBVznOjfenvF3UsNlE1yHjCaUJ7ZGlPDJHzwOfSWFNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpf79PEMiDFcLFy80ngJH6MhWRl/V6bbtp47O63FGRQ=;
 b=MNYevA7d/iIZshsAveb6To4Uk2k3rpuluyu/qzv9LXr5+SbbwaHIi10bKpy669oTEtUmVtJHPvXNygjE+xQkaEf6HwkWoHIimEL8mccTP7YQ8AAavAfKe9La5Hv74sNPfXjLmgkv4ab2h5/LKBY+79xW2N/Bi6Vy24qPceqho7Q=
Received: from SJ0PR13CA0180.namprd13.prod.outlook.com (2603:10b6:a03:2c7::35)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 04:28:35 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::bc) by SJ0PR13CA0180.outlook.office365.com
 (2603:10b6:a03:2c7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 04:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 04:28:35 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:28:28 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:28:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 23:28:28 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63T4SPRC2346763;
	Tue, 28 Apr 2026 23:28:26 -0500
Message-ID: <5c3ea9d8-063f-40be-9db1-479a1cd6ef56@ti.com>
Date: Wed, 29 Apr 2026 09:58:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: xlnx: check remote core state
To: Tanmay Shah <tanmay.shah@amd.com>, <michal.simek@amd.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260428221855.313752-1-tanmay.shah@amd.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20260428221855.313752-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH7PR10MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7b206a-896c-406b-98bd-08dea5a7c718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OuQuGqh/gPlm2ephpjudRJ3MAHCS6b8gUrzh0Up3rf93qqkpK/9qgFkrVlI14fH8aVaGHEkiYMqttpB5eKNGEjuCq5800QYLLhJ3rwqJ1Dkyd7jFBSHKUSCFcmNMxiuZxJykfvj4PxYgGwYrabe8lqdYbyEFsOY0Pih5hiWjD/+CUb50CFUL9Gh4I8ndVlA5W6+BqsGmvso4DNiHZ4y7LUThvOE3uN5g3eMpsJ1JsyJcUcv/KyL6l+qm4T4RQ9YMkYc8H2CQwtcnSNjibrHbzbNPr0C1ImXk0Q8Gmr8fZzTkQL3pAm3p4FU10t/bd2hFqhrALT+PO7Ua6+NU9JdBaywTii4XhvW6o6kFH4aBldUrZrhOWxI9DLuClNiqlhgpHrGMCsg7mDa3b7RlgWVjhP11X/viPfYPPkHV0psNzqaCre8b5uafwA6Py9ARzFZWaDJTZZZG1d92HrYadMXr/scQCiYJCepTtx4k47M0UEWDurVmVwz6+fd8y80f9IUbwT7zl+J1OF1c63JTXUWfIYmzjVU0P0m5eFnOOGTTivP8SezVCobbeJSs2W8KQd4HX7YTu2414Odz2xlt5oj5hcrNSFXHMU6UnWJfLO16eKpu38n/6VesvAz+ZqcHHrofbNu4taukZLQ0CdQKsL9Rjlq2HGRZ1gG7lEGKlWgWLJeEA3DazwATINbfWeQ11cnU+4TWQR0onmUgSD+OL/TDXO1TvYSmtwi2i/InT7EULsnbK4YnLnhHi1uyTYXeYXyOcdasSmAPmSCj1o5iEHFvSw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ATgCPepjKPs4sj7vawl6d4verjCMbgfKJl3qnU+rIEtwkG17jjmpNeuW3ISGfqAajSHvimkoEHnNqYJtIe3aYxp5pVaF+5PHNlzEwxeG3wK5vp/D9iZk7j4A8dzL9wpjhOMxEuZdw1XEeIA+xWR4Nsxh67yB/jUdHI/vAp0diSN+lto7qgzSZ3rnEseYEpjqmXKvsnqdJZpozAdvfGh14c6c0NROlqmRhKFFbAdMVFs6DasbJSRtqzufgeads2K4d6Hw/sxmjtQFgvhGPeMWX4f6UYUtBnQPYdIcL7Z9eAPPiXR2CksW6lQMUQxhDE3Xw7el8fnthqyskSOv2SQ2ZOA3FdO0lS31NvKVFvYkYa6lWVRKAViMJB1CsqXDchitLxoqvMwLO2+SU5RiqTTpdso3nfgpwuspMRByi/VpsqLyqRyQ+EJjd1bfEyH9+eWh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 04:28:35.0354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7b206a-896c-406b-98bd-08dea5a7c718
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_212841_516745_09BC439D 
X-CRM114-Status: UNSURE (   9.73  )
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


On 29/04/26 03:48, Tanmay Shah wrote:
> The remote state is set to RPROC_DETACHED if the resource table is found
> in the memory. However, this can be wrong if the remote is not started,
> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> to the firmware to request the state of the RPU node. If the RPU is
> actually out of reset and running, only then move the remote state to
> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
>
> Fixes: bca4b02ef92e ("remoteproc: xlnx: Add attach detach support")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>


Reviewed-by: Beleswar Padhi <b-padhi@ti.com>

Thanks,
Beleswar

[...]



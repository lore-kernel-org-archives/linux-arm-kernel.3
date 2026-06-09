Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A66CCD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 04:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ymppbXqM6XJFFxa93+J+kuVf/yq2ZgzwdYtpCHV3cU=; b=Ei5TadDLFCQiwzPlDp7LzwJeGV
	9GEwxFy/qCmIBzoTi5WgNQNjjQbgzzuwPY7Pi8bugCPOelNVUvvRuOiXmrJd9IbN5c8tTZqpMQtrN
	BvbPIcm50fioHoqlBtmFdTs+rcimP4yvl3n2zwxN37XE1kNcUvgNeWu8hiWIS/IXnwYKEbjyInA3H
	vJT9S3RVn+mshvGa4CBC5WQ1xejLXh65PfE5XIgzchKXHEsm3k/R5UgoJHnAbr4B3SAMUI0Jj2SEu
	mw6LDCr42sbKDiZOg2zFrxdKPq6ARiXmzor0SugQYXBEOnnHoJU74LRcNNnSPpd96yebwGd91wKfp
	QZH1JQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWo4q-00000004iil-3zD4;
	Tue, 09 Jun 2026 04:28:36 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWo4o-00000004iiL-25UM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 04:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJrEBEII4ZsrooWzM0BYgrQmrDziFM2/jkCzD8K8nBr40+QxpyBhux8AE46cBvl7LwzFT8btz5569+BCKbnfjnYIVPaYoRotRCnDTqcV7By2lHN1WPJgXhl7RQiZwWxlkJ7bhXXL2bFUf5OSRJ/m09ie01DUwm8ESIwoUt26GdhyrhIvLQPN2LN0ubkRcOp40HLb5aens+zIVk0WE77Hyf9BC07co9dEFcxUnmeHkqCuzbaTKxOExJrkjgCXYhCPiiB1j6+vnQIMfQeFMu0/GzvvO7DuAPt6eq1PpJRxNL2TL2MTTMQMsgOVreYi0WZ6aU839/MQaslKhPtAQmuF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ymppbXqM6XJFFxa93+J+kuVf/yq2ZgzwdYtpCHV3cU=;
 b=xr7OUIi0dYKoLy5svxeJfz6Uou7Sz0H19QqN9hFAVT4i0Jgb7WN+X9Fb+fYdjLEuxTv6hvWblS1DII34KrtqaLCuopt4hisRlKUbnYIt2jyJUSqyLILC9fZsBK0DtqO5MlKjjrV3GglhUvCWOZncK3XhkUrsxtugdYcExAjGQ+7CKP9fUYc1bKCOgs33K8hq+7Cbs6TFTo2tGJ/oKOZ7OdGXnX6S9Bat4C+oo02v74qBTrGuE2Zr2oGmEoXtAB57Ua84HdoZCHHCwwmbB3p4I1FnATwX039JZchJjdgBmZ9Z/hARWcr9xc7vxHnrGdoTKoUd2GApEmr/OdA4ji1F5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ymppbXqM6XJFFxa93+J+kuVf/yq2ZgzwdYtpCHV3cU=;
 b=Yey9F5cGVHrlOllAFcWOvr699LAPIJ6ktN4YJxu6dPwXB/U/zAOO8reFrWBY4s0gZeRCMOJQJTCb1Uwxs3ApmBOdJxkyQrC8Aua7hHQkgMw8e4wWlsI/y7siqhpNb3UOIVjHS0LoEQujmPLLXKVvyEME7KrskLKs4z1uBbJK9BA=
Received: from BLAPR05CA0033.namprd05.prod.outlook.com (2603:10b6:208:335::14)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 9 Jun 2026
 04:28:29 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::6c) by BLAPR05CA0033.outlook.office365.com
 (2603:10b6:208:335::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Tue, 9
 Jun 2026 04:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 04:28:28 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 23:28:27 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 23:28:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 23:28:27 -0500
Received: from [10.24.68.129] (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6594SNrH305516;
	Mon, 8 Jun 2026 23:28:23 -0500
Message-ID: <1362dccd-24b0-4b44-8e45-75cba81180ae@ti.com>
Date: Tue, 9 Jun 2026 09:58:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: cadence: skip the link polling when endpoint not
 connected
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <vigneshr@ti.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
	<mpillai@cadence.com>, <unicorn_wang@outlook.com>, <me@ziyao.cc>,
	<18255117159@163.com>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<danishanwar@ti.com>
References: <20260605071922.1724499-1-a-garg7@ti.com>
 <19ded2fa-4560-4b38-975c-6b490328e992@ti.com>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <19ded2fa-4560-4b38-975c-6b490328e992@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|BY5PR10MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4bb9da-6963-40e0-72e6-08dec5df8dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|32650700020|36860700016|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: OYvHmZZhGR2Jkx0/gJrGMf7sYTjLxl4yn1l8UoHh0eteAweMcm6AmIhvlpE5ieZMzqNoInAfNkSTbIedpkK1Y6E/X9g7YIZMYQTueFhTFd3IaMsBGEP9fHDsN5MWqF2N0e3zObVxXR59pJrbkPsfoqLayRrWxKFvyQdZJ6VgAT19aNtOU9Vh0LRDaxP8Y5gN6J8Nkhkyq650cLMmDxyR2dYytUrm8JymYSWoQKkllZihJ937xl/7uEoLCC/7VLrIeD9cKrHAzjU3jfSrsQB21vJnVL80R++JhL6baEOabWff3suvV7OTreu/ybT+8LXki0UjygMlS3qpS2oeNWj2xQsz0TMMwCQuaealXkAYem0bfKazU0JY4epDi4UPxnz6nCvETtGRHwQ6GjLeRs/S2rUiDqDNk2VY65D6yKVz4DeyZ5J+xYwZgBg2wP8Zjk9gbAZYwNMcQVcyw0ptsYS45MF8jF+mz1r9tl/hLVHaMbF+bnTF/9NfKmfY8EYLOxJVGZWscjlCxvaVm981CilUFYSARjQyzuNE60V4jvMGJrHJ1YirgjqqLJsDiNqirIvvCZjI5nr+aUFs3z0x374t2LaQdy2CMDharbqMmyD9laDYx9Ztjn7Fc4Bfgfx7jIDPQU4gkxohJsFP6PB6a7/1ssxzIIl8G5MlVGbwVArV95Deq/n7OhQd1ctFFvQma5BGCZnC080PiWEp2O3b9HOgASK2AJx/uJJycmefzcY4+PY=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(32650700020)(36860700016)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FuU1rs85VjW/I1+VV9iG2a+bJH8tEXapl2c1OdiwIDf5w6QzZ6RseztkQEzSVcV5IaI9HvEKH56fPyaRe32NN3dj8QUedblLLme55aEhoin5Rg/QTT0RUtn6DHWVlGDM+IJzeua1ZTL6F6g7lHfdslnF7hzvkTi36rpofQ/LNCUYZICLzyn/9ydgqi2WL7N3RhN7fuZvjjcaIJ1mz+jlyGV4SL4OXeVjYkrVa+1nenM7hf5rXw3BXSXt4LfbxxvbwhoQfzpWKCa9rYK6xNDsk8gG4/gsu0HUuPKF3bEHvNuhXbX2lKcNxsQlOAnQqykJSgsWZDQBW4h65L4igKC82RK1Fx3Vb9iG2yfVrWvAfO5/1bdsOacSkFJmKrQgU9OmhVhZKISSWzK863HYj5CTKlPA/ML3xN1fpEoTWiW+djjHbH/mxjnFQ7wf3tlWDox+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 04:28:28.2535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4bb9da-6963-40e0-72e6-08dec5df8dff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_212834_581350_FD3C8D49 
X-CRM114-Status: GOOD (  20.64  )
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



On 09/06/26 09:12, Siddharth Vadapalli wrote:
> On 05/06/26 12:49, Aksh Garg wrote:
>> cdns_pcie_host_wait_for_link() polls on link-up for 10 retries with a
>> delay of 90-100ms each (~1 second). A call to cdns_pcie_host_link_setup()
>> during the resume operation blocks the resume operation unnecessarily for
>> ~1s even when no endpoint device is connected.
>>
>> Add skip_link_polling flag to track link state across suspend/resume
>> cycles. If link was down before suspend, skip the expensive polling
>> in resume since no endpoint was present.
>>
>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>> ---
>>   drivers/pci/controller/cadence/pci-j721e.c             | 5 +++++
>>   drivers/pci/controller/cadence/pcie-cadence-host-hpa.c | 3 +++
>>   drivers/pci/controller/cadence/pcie-cadence-host.c     | 3 +++
>>   drivers/pci/controller/cadence/pcie-cadence.h          | 3 +++
>>   4 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/ 
>> controller/cadence/pci-j721e.c
>> index bfdfe98d5aba..849eb8bb9e45 100644
>> --- a/drivers/pci/controller/cadence/pci-j721e.c
>> +++ b/drivers/pci/controller/cadence/pci-j721e.c
>> @@ -686,6 +686,11 @@ static int j721e_pcie_suspend_noirq(struct device 
>> *dev)
>>       struct j721e_pcie *pcie = dev_get_drvdata(dev);
>>       if (pcie->mode == PCI_MODE_RC) {
>> +        struct cdns_pcie_rc *rc = cdns_pcie_to_rc(pcie->cdns_pcie);
>> +
>> +        /* If link is down before suspend, skip polling in resume */
>> +        rc->skip_link_polling = !j721e_pcie_link_up(pcie->cdns_pcie);
>> +
> 
> Please consider the following scenario:
> 1. Endpoint device is not connected initially and we suspend with 
> 'skip_link_polling' set to true.
> 2. We resume and skip link polling.
> 3. An Endpoint device is connected to the PCIe Connector a while later.
> 4. We perform a bus rescan, but with skip_link_polling still set (in 
> resume), wouldn't we skip polling for the link to be up?
> 
> Shouldn't 'skip_link_polling' be set to false on resume, after we skip 
> the polling initially, in order to allow waiting for a link up for a 
> newly connected device? Although this may not be done in practice and 
> the Endpoint device may always be left connected from the start, I am 
> wondering if we should clear 'skip_link_polling' on resume to account 
> for the aforementioned scenario. Let me know if I am overlooking 
> something here.

This path is not used during bus rescan. This implies that during the 
rescan, we do not call cdns_pcie_host_link_setup() or 
cdns_pcie_hpa_host_link_setup().

> 
>>           gpiod_set_value_cansleep(pcie->reset_gpio, 0);
>>           clk_disable_unprepare(pcie->refclk);
>>       }
> 
> [TRIMMED]
> 
> Regards,
> Siddharth.



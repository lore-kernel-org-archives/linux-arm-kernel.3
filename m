Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C51DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQ8R5hz+2HMQgOIT4Egku+daAX/QfMhbk2ccuSFhbaM=; b=rg2Zp/QnIMcsRMpe0wEUj1mXEb
	HkvDLoZjvqsuD+Zo92ZixIg0VuTaD4t2LJM0dGkS3srULQjNDThwEpZDAH88PukBV/4HP/QsrPQGD
	vzRuTAxVzVk8JW3B3flcUaWwlZ/dulkzZxQm92hToONshYg5mwozNx55x7GK/LePTRD5zwmTC8XqU
	zJA34yfSXQYO/F9OemizQuY9WKOm5t/3cUcAcHBPa0VFB+jlBJEwzP9KWvuOcTeUp5PHqv77QLj1q
	gJ3tss+pVsYgHP1QXzwJ3uZNXu/Q8QyCQmJVTeivQsCGocihuyhLZcF9BLOWilA7ixfRzu4Zbted+
	OffV6gZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPD2s-00000000CSS-2kwa;
	Tue, 19 May 2026 05:31:10 +0000
Received: from mail-westus2azon11010011.outbound.protection.outlook.com ([52.101.46.11] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPD2q-00000000CRu-0boj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:31:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdT9rht4iYNf4r3tDJM9KR1mtG4x+TJdvPH4WvcgX3UznICxDm9inU1ZEE1kSgplPh9rCwTb4o7YTsABuiv+hF/+lgIYfLjUv0kRZ81K1zPjAvqoOFMlvi4XIDt5E5oN1ppUXGrF7lMWyc6h4YDXxYAARBduv0zZ12Uqtm/b37TppFdtLfHdhOvTU+l32NBvIMARiYbTGf3Jy/BShjxbhg+n/Vbg2helhV77vCfreE50tqebDmKuxUJljNkB8pmjaRRT/Ja/2NcS9n7H+GZQUIEcMH5c2GMCQRmW9+ZUkVE+EDxTMcGtP84gYPc5Hdo3IeJtwnGI8Xe7ZFbBxsCBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ8R5hz+2HMQgOIT4Egku+daAX/QfMhbk2ccuSFhbaM=;
 b=eXhVAM099V3WYDUUoW2YG11HnW+YYcE96qlXGZZrA8a5BMf/iGMcTsYTh8/yJzFI4ZlRROBJsyBk7DXEDDbbHSwn3gqn3m0qsfVbIyVfbmAzp8yz80pvZn34ipFkxJbtReBdTVnqPntg+QtpmKt0QFFOow/0Rwm8oRB9NL8amDk1NqjO9uEh0AxiMup+MjMH1snUbOVpY82BO9fIOx3J4RbYdOwu848fyg1SWdV6MtCFK80sBnLsOcZeGEGg6u2BSxtjry7fsFD5v7nWE3S4Yw9FxUkqamFvoBsqS+yfy0E7ZCp1Pg5gKycrELr1R2Bhwb+moN35MN5pNHzINE6sfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ8R5hz+2HMQgOIT4Egku+daAX/QfMhbk2ccuSFhbaM=;
 b=p7EbI5HrerDRyRKj5bTbb7IMIs324j4rQojmzfhwUHDHHYStQTr8NUUIOGpSTqz2d06w4Uz6mpoTzK42IQKzudiNKgquAa03nnOP7MmzqqypZayy8y4b5II0n5NSTIoZyc/6BAHHxW5mj05Zpxnj++CR5d3W0R/KLZFe74e9/EI=
Received: from CH2PR15CA0022.namprd15.prod.outlook.com (2603:10b6:610:51::32)
 by SA6PR10MB8088.namprd10.prod.outlook.com (2603:10b6:806:43f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 05:31:03 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::8f) by CH2PR15CA0022.outlook.office365.com
 (2603:10b6:610:51::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Tue, 19
 May 2026 05:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 05:31:01 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 00:30:45 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 00:30:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 00:30:44 -0500
Received: from [10.24.68.129] (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64J5UeqD3370029;
	Tue, 19 May 2026 00:30:40 -0500
Message-ID: <b7fc62b7-a73a-4201-98e1-ea6a628e9dce@ti.com>
Date: Tue, 19 May 2026 11:00:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: endpoint: Add API for DOE initialization and
 setup in EPC core
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<kwilczynski@kernel.org>, <bhelgaas@google.com>, <corbet@lwn.net>,
	<kishon@kernel.org>, <skhan@linuxfoundation.org>, <lukas@wunner.de>,
	<cassel@kernel.org>, <alistair@alistair23.me>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20260427051725.223704-1-a-garg7@ti.com>
 <20260427051725.223704-4-a-garg7@ti.com>
 <m4z3q3pe3ro5vkl4uq4zkewpjdqccgeact2hj4tjnkonttx4vr@ndan37zzwgxc>
 <3853ba15-d096-4cf4-b52f-8a2e5f50fe53@ti.com>
 <mn7rnqdunp4mq45a7ypf26rfpzjr2gik7w4p7hpj4x3r3fzfzz@dlrsn27u5mbf>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <mn7rnqdunp4mq45a7ypf26rfpzjr2gik7w4p7hpj4x3r3fzfzz@dlrsn27u5mbf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|SA6PR10MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: aa36374d-a02e-4e12-8b84-08deb567d0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|7416014|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0d20Qou4Hncj7dLx93uIGaUxWr1m00ZJBqcpW1sCplSp7V0grAuwt9C+LW/tCnIyUreCATztL7vkQc9A7WAZFsXxSzNC7dbNfIzaKKZVNLky/7EwwvLBc0ng6QUlACgNA023HUgSKCQIHCHqPvRM02PZ8gQIFGCj13nGh4Lq6fMQfmPzCjDtk3XmRZJUS+8PGjfz5RPqxu+63HpAVXtDkYgwKkcwSB/xNGTVfT8PEE4hIg+c46yFrMm1iAmedGXENrwpU2a37SM2reDol8WjLchoHtNbqGYlx+lfo8mMYwtq4byBxzEl+NrgJKyX1daiGYgPm7pKm9NsWdswNL3XIBY4kQ7ranwjqTNWkMm9hTkzsoOljUyWlKoi4gmB8agEPdaGnbXxuvmQUsin2dMIEDx5TfSwNLgepH9mgc0NSUX96xvtHhcXsfqFzw+itBCML2SMG6l4rbInifqJO3mjVKPMQ6W1pi7OEjWF+LqzHvd1Ghrs+AUdyeqlsEcNT8pfEao3JoQHSnlaA11/BpLHqD+IOMpOj8YpghsgiShhySJ/Q1h3p8KJkap2rI3vlTShoQ3UKJDLgPU9WzHSfNpX8aUyEp+B7QBLxzqRF4P1JElijKxpUc8rG+VVkgGoMySWougnNjIpAZcJavR1FusyAgONaYmNShd8jjeyndkKgtXoAA4MhkEapecgPKybTw15wpOn3EnHVJG+LAfhssMqd8/fjR485ih24AqZcLbD+9Q=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(7416014)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: I2CKBJVpBRzPyz8YqFCVIvQ8sONy/U8zZOY2Dtktj0RjbHQ6lpd532jFCpuBqzFeNs5eFxWxeKFKAIlRov+cUr+fPQjCo5eZf2KYwLTcxfjMqGWxvbr5mpvniJ7NsNC423i2eJMbjgX6lPUNxSfcVKzTjVvfxQJg8tmaB/DswCMGFO2ziv7YJMuz6tgtN/0NNPEU8g4lTxypjZa4VXUeJxQJSGubKqDKtKwQ9xBXrk9A0rfECXNOizakbzL73czGc+JgFzcQ8lBPijKvOMsauIvvMM7C5vv8mh/QWfY8kpRhq3XPquiUhd8ZIghSu+wQZHQG+vWUJifgOgIPcpHeyJ1gUPSwLafD76Pekg0bX3CwPZFYCVJdARV9NgadD3M1FanTzkoZaJ5q5ARTAwRgsw4eGldudcQBw+BnIpVwncuKYvAieny5pvA28t8GcHDY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:31:01.9623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa36374d-a02e-4e12-8b84-08deb567d0af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_223108_196532_CEE49CF2 
X-CRM114-Status: GOOD (  25.33  )
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



On 15/05/26 18:17, Manivannan Sadhasivam wrote:
> On Fri, May 15, 2026 at 10:21:52AM +0530, Aksh Garg wrote:
>>
>>
>> On 14/05/26 13:38, Manivannan Sadhasivam wrote:
>>> On Mon, Apr 27, 2026 at 10:47:24AM +0530, Aksh Garg wrote:
>>>> Add pci_epc_setup_doe() API in EPC core driver to initialize and setup
>>>> the DOE framework for an endpoint controller. The API discovers the DOE
>>>> capabilities (extended capability ID 0x2E), and registers each discovered
>>>> DOE mailbox for all the functions in the endpoint controller. This API
>>>> should be invoked by the controller driver during probe based on the
>>>> doe_capable feature.
>>>>
>>>> Add pci_epc_destroy_doe() API in EPC core driver for cleanup of DOE
>>>> resources, which should be invoked by the controller driver during
>>>> controller cleanup based on the doe_capable feature.
>>>>
>>>> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>>>> ---
>>>>
>>>> Changes from v2 to v3:
>>>> - Rebased on 7.1-rc1.
>>>>
>>>> Changes since v1:
>>>> - New patch added to v2 (not present in v1)
>>>>
>>>> v2: https://lore.kernel.org/all/20260401073022.215805-4-a-garg7@ti.com/
>>>>
>>>> This patch is introduced based on the feedback provided by Manivannan
>>>> Sadhasivam at [1].
>>>>
>>>
>>> Sweet! But I was expecting you to add atleast one EPC driver implementation to
>>> make use of these APIs.
>>>
>>> Also, why can't you call these APIs from the EPC core directly? Maybe during
>>> pci_epc_init_notify() once the register accesses become valid.
>>
>> Can we add the DOE initialization API to pci_epc_init_notify()? This
>> API seems to be called to notify the EPF drivers that the EPC device's
>> initialization has been completed, as the name and description suggests.
> 
> That's correct. But there is no harm in calling something like
> pci_epc_init_capabilities() inside its definition. Only concern would be that
> pci_epc_init_notify() is mostly called from threaded IRQ handlers. So loading
> the handler would not be recommended. But since it is threaded anyway and we
> don't have a better place to call, it would be OK.
> 
> We could've called this from pci_epc_{create/start}, but some controllers won't
> allow accessing CSRs without REFCLK. So only after pci_init_notify(), CSRs can
> be accessed.
> 
>> As 'pci_epc_doe_setup' is a part of EPC initialization, I thought the
>> EPC drivers should call this API before calling the pci_epc_init_notify().
>>
>> However, I agree with your suggestion to call the DOE setup API directly
>> from the EPC core instead of sprinkling over the EPC drivers. I would
>> recommend renaming the pci_epc_init_notify() API (and hence the
>> pci_epc_deinit_notify() as well) to something like pci_epc_init_complete(),
>> and add the DOE setup API/logic just before the
>> logic of notifying the EPF devices.
>>
> 
> No need to rename this API. Just use as is:
> 
> 	pci_epc_init_notify()
> 		-> pci_epc_init_capabilities()
> 			-> pci_epc_init_doe()
> 		-> epf->event_ops->epc_init()

Thank you for the suggestion, I will incorporate these changes in v4 series.

Regards,
Aksh Garg

> 
> - Mani
> 



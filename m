Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D112CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keQg7FwQaY5dINm3w07p2a0/6qk+3CwnjgZeEz7jFBo=; b=JtWPSebJWCo3pY6DX4n4cQu0Zx
	AoVbEDuarEg5SQFm+VFalNBXsS/20uOJ2wbT0zKwgIMzBoG9L7dnoP02xThrCJcU8cZ/8WdInbeDC
	wAxkyFgq8BxAkWMmGPNmeXFYH/l97+mTMqQnt0Wf1FOw2pbJUcZQOWl7UuERBnplztKs8Zgr1Qgnk
	ofm6J2cOxx9r+xN9BiydMTW1p/k0Fm9pRqxxFN+V+UD85HMG/Wa2aoPm5BcB/67hrEny+JsbC6cCs
	byNFOaxh8ydR3vs152319Hlz78waLip319+upzBtyaca+kzkRAaJ+ghP47/RUmGja1KWk+irzJ9T8
	YH5KOotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxBm-0000000AZpX-0WQU;
	Fri, 12 Jun 2026 08:24:30 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxBj-0000000AZoX-109E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8IMl3XBk6xU/mhcwDrrR1it9xX0TjYilJ3OS314NV/kzDGtRm4wq44O9PUtAo9aAVX2k5LlhIRdTl4NpmyE+yCTvav7kMvF20pleqcAZ97+yCPetl97P7l5t/OHiVWZHHpur6cBl0JN7gOTyPuyotGuqg2/yqlU2Y6yir5LN9v/zBzjQiAsHbhrQktt8kBGqSFY1PzB4dhF4IWPehOxkzLBF3qOfuaDnHSk1yzcunn6Imxr+vpG6U4XqMgXqGyOKHvyK8KMn2bRHF0g1WwMYXHQl2MR1no3h/90LLF7uXLGPx3c25VWNFBOXGsH1BUylk5y5sCgftB7CfTcahJZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keQg7FwQaY5dINm3w07p2a0/6qk+3CwnjgZeEz7jFBo=;
 b=bdAuDRHvjOi1y/KEZytPYC7SidA7NzLAAAqzXAqUL8ki8KRqSnvkjUOw94ByS3DU+Uez5ypm81HwO/ZkZkYikDISsFIrsAGtFudwui1ufonmnCeB0jEtRCrnX61pYn1UpS/c0Fq09VEdymbSVIrR5mEz8fATS/RANCy+sy4PTYOTCzCzgjqFCitIHIBOpVd78NAs80P9XucKtzTQstIwCS97slrDeggMiLrgVmgezccTNH+bDx2NeYOD7PbBaW4eim37j5wn3lMbnyz3j/seZfBBbec7KcJRhHm1v32rOIm4cVXMWaI9diWAyZ0f5KyXxlcyIg1N7Go1uep1HfOOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keQg7FwQaY5dINm3w07p2a0/6qk+3CwnjgZeEz7jFBo=;
 b=njKNsbGB0k96/Q6QbYO8qYEYLdfwWR6Ky4TSu2SpHQvLKgWvX0hSUZJq4F94iOw+ojVluqPS8vT0gKgdQKvjEtpysuoRGWS2u5ez5Dk3AYh0QN8kQjeFNjaEBdorHZzCL0jJTCrXigc3QXxGKwXzA/PZQUsjOPVKSc7lyvUC78Q=
Received: from MN0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:52f::30)
 by DS0PR10MB6822.namprd10.prod.outlook.com (2603:10b6:8:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 08:24:20 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::5a) by MN0PR03CA0014.outlook.office365.com
 (2603:10b6:208:52f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 08:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 08:24:19 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 12 Jun
 2026 03:24:19 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 12 Jun
 2026 03:24:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 12 Jun 2026 03:24:19 -0500
Received: from [10.24.68.129] (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65C8ODsR3668782;
	Fri, 12 Jun 2026 03:24:14 -0500
Message-ID: <0216a528-3737-4714-b9d1-5d28008e0ec8@ti.com>
Date: Fri, 12 Jun 2026 13:54:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] PCI: endpoint: Add support for DOE initialization
 and setup in EPC core
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mani@kernel.org>, <kwilczynski@kernel.org>, <bhelgaas@google.com>,
	<corbet@lwn.net>, <kishon@kernel.org>, <skhan@linuxfoundation.org>,
	<lukas@wunner.de>, <cassel@kernel.org>, <alistair@alistair23.me>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20260611191252.GA499821@bhelgaas>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <20260611191252.GA499821@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|DS0PR10MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: e20660a1-e26b-4a0a-1755-08dec85c003b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|82310400026|1800799024|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 5Rq2rd8kwdArAc59j0NXlgQWLkFcBcrHwNtEyWOQT/h74YVkXmfRUV6FqsauE8uNWsvowG92bSomhQBxzdz00/pu3sRsviLxLEmCSgFsuOr9DYEsNlkqrjJt/9cTsX82M5jqrFTNtQYL+GTvpcPCSOHZPH5Y5zIUQle2I058aXbDCbWVnyULzczu6sgTxn4ZSc8evzlIzkgzap5S/anRIattjEfR5Xuf3mB8K256uey/cA/OPcMoxNfY5cMi8SQZbqhYztvZECgQN9yB6hhZjsiuP3t8Dl/w03O6ZBtivVdTl7be19KYR6IEoCr0NarbUPNZ9NDmFuwgWQlCU7o46cOJNxGkb+n2w9+Z0uXKgI9nTh94nlRFHrDcEHT9WjnpcoNyjwehvmA/FgRcGS0EA+k5ocS1wobTaw2oz9p6zmzpvzBi7TgcBRWDqztMrNfgSuJyRAyvH9esaFADzh7yBuZZo4aUuoV1sfHl/J8YfuI97vMtfF90YraRpl6bVsXMIfDnGWpZY0ctnt6UoP1eWPdcNuSEp8iIT4Ar9IntBIx86LmMphLe5LqpOoCFCPe9VdBVmlslvLrIBH03Kr3QRJIVP+GiV5bTk4ZL6FYf3VtimtK9RN5kZt0FiVAtXuWJKu89fI0GvWGXQej3de1xwsa8Rvacnz3hKauuPPoAne/M8JxE/m1kpjKxRU0xi8Fs5Fif7RhKtswt696O5FR625oyM3okiV4zJSex0XzDRl8=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(82310400026)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WHizbig8QcAReQ5mUh4t8u4FUkE4LPHsbR9MnWvugYklakbNeZrbaUfk7rM0UqjAH/CIErYJg/d6WHKu2yG9nkfJUkETv4U3ofKrtnZRyizFHoZ8qWdNb34QasXluNZafIDHQ2Marhr/omorSmsT0oLgNNSLVKGPLn2+N/JLsRPTMr+bbFZhINsdse1y+4BTAejAfL9nGlzGekalT7BhxW/0udRgbj9zKV6HaAhgjPRDuXmvfwPZPvYUnncUCzEn/2gGD0Q2g6XHBTkx6O0f3IBbm00Y6PpjH6TzsCZsfBqnmHqK7fqE6+ttKcy3Z533EguNXmSaOj+fND4K0yFy8A9pcMqXd27et5jws6oYnXBbcmfV3TwCbWIxk9ineG5W4lBr9Lnt8deixrw0RKpg3Lc54tVu/7fOPJp7zvr4egLOvyBgccs2CSLrl7JUA0+W
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:24:19.8435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e20660a1-e26b-4a0a-1755-08dec85c003b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_012427_285987_72703DC5 
X-CRM114-Status: GOOD (  21.76  )
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



On 12/06/26 00:42, Bjorn Helgaas wrote:
> On Wed, Jun 10, 2026 at 03:32:55PM +0530, Aksh Garg wrote:
>> Add pci_epc_init_capabilities() in EPC core driver to initialize and
>> setup the capabilities supported by the EPC driver. This calls
>> pci_epc_doe_setup() to setup the DOE framework for an endpoint controller,
>> which discovers the DOE capabilities (extended capability ID 0x2E), and
>> registers each discovered DOE mailbox for all the functions in the
>> endpoint controller.
>>
>> Add pci_epc_deinit_capabilities() in EPC core driver for cleanup of the
>> resources used by the capabilities of the EPC driver. This calls
>> pci_ep_doe_destroy() to destroy all DOE mailboxes and free associated
>> resources.
>>
>> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>> ---
>> +/**
>> + * pci_epc_doe_setup() - Discover and setup DOE mailboxes for all functions
>> + * @epc: the EPC device on which DOE mailboxes has to be setup
>> + *
>> + * Discover DOE (Data Object Exchange) capabilities for all physical functions
>> + * in the endpoint controller and register DOE mailboxes.
>> + *
>> + * Returns: 0 on success, -errno on failure
>> + */
>> +static int pci_epc_doe_setup(struct pci_epc *epc)
>> +{
>> +	u8 func_no, vfunc_no = 0;
>> +	u16 cap_offset;
>> +	int ret;
>> +
>> +	if (!epc->ops || !epc->ops->find_ext_capability)
>> +		return -EINVAL;
> 

Hi Bjorn,

Thank you for your feedback comments. I will work on them and post v6
series incorporating the changes.

> I don't see anything that sets pci_epc_ops.find_ext_capability in this
> series, so this looks currently unused and untestable, so likely not
> mergeable as-is.  What's the plan for users of this?
> 

Currently there is no EPC driver upstream which supports DOE yet. 
However, I am working on a platform which supports DOE (support for
which would be added soon). Mani pointed out that if EPC driver support
for the same is guaranteed to be added soon, the APIs can be merged
first.

For the demonstration purpose, he asked to show how an EPC driver is
expected to use the API as a snippet in the cover letter itself.

I will add a code snippet in the cover letter, which sets
pci_epc_ops.find_ext_capability as well, if that is acceptable.

Regards,
Aksh Garg

>> +	/* Discover DOE capabilities for all functions */
>> +	for (func_no = 0; func_no < epc->max_functions; func_no++) {
>> +		mutex_lock(&epc->lock);
>> +		cap_offset = epc->ops->find_ext_capability(epc, func_no,
>> +							   vfunc_no, 0,
>> +							   PCI_EXT_CAP_ID_DOE);
>> +		mutex_unlock(&epc->lock);
>> +
>> +		while (cap_offset) {
>> +			/* Register this DOE mailbox */
>> +			ret = pci_ep_doe_add_mailbox(epc, func_no, cap_offset);
>> +			if (ret) {
>> +				dev_warn(&epc->dev,
>> +					 "[pf%d:offset %x] failed to add DOE mailbox\n",
>> +					 func_no, cap_offset);
>> +			}
>> +
>> +			mutex_lock(&epc->lock);
>> +			cap_offset = epc->ops->find_ext_capability(epc, func_no,
>> +								   vfunc_no, cap_offset,
>> +								   PCI_EXT_CAP_ID_DOE);
>> +			mutex_unlock(&epc->lock);
>> +		}
>> +	}
>> +
>> +	dev_dbg(&epc->dev, "DOE mailboxes setup complete\n");
>> +	return 0;
>> +}
>> +


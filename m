Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB95BFED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTrOXIGxwARZQ/F2F1skxkGyUQQ9uha5q6tsKJdavrA=; b=GXbOV9XgRiilav
	77jTJaK0kG5uf7YnaJ5GeuQl8PcvKowQjLFniTeyxdrsUW2gR6w/dM3BtgVyctRdFYjuiQ9KuVPYc
	LpsiHD4euJw/zbUDaYOtNOb9nBtPnVW16Y3NSSDfXbv9gw6Kwh9kxOmghR5YwFEGtv4lj4KoUYDYI
	4Lz/sCVdKAT6ALQ/DQJMqsErJDiwcGeaU3elOMStc9pW2PTaydbMZ3mp0IfFA9+1sDPUu2juMjJLf
	cCXa9mmFPwPDxQPkWjaksGdauwKRikUmWewfIfIAWO+9d3mLpSeRUa/3h+WMjWr4NBLLlK7ZvH9M4
	RD7NGU3Zu0jkvAQxvHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKi3-0000000DbsU-0dCn;
	Fri, 24 Apr 2026 17:52:59 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKhz-0000000Dbrj-1HUb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 17:52:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6FBLjnnKavamL6K4BDuThl7pK9atjW6zvOklciZY+GZYfheeqwV85c3+HXeAe3R5xmlwaYvEh/eO26Aj1jsuNx4WyyZpNQ5HYbZTKas7eabrobo/puS13Qw5AZURCKClO8LXTQZjKBtOVaZ7WFo3tw0FtOeeRbAFqrs9J9MXVYjB4KtJbjkhLIDp3xNjA2lIHfb1keQdXMBn4pfGTGVE1VFLJVstli9fSQM4ZOslcjkMUHe/YsY+fi+kBpecBGJFZ9frB9cIZfgq4oa6ooNTQ4xXMunlFduX9pMI1k0Wt0j6hYUA/PAoo+++VAwTlTejWFwDJuyQ50l4YVGaE3D+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTrOXIGxwARZQ/F2F1skxkGyUQQ9uha5q6tsKJdavrA=;
 b=rUmk7k7+85eX3rPoB6HW9XmHePjh/GPA7+lK6ahAsJfYRQD4ubSGlol/9j7hjGginZuoZ46HfD0UmSkboEEKUPkETyOaNVlRmatrTi2aq1gXOahi+nMM1XfdVd5vBOioMliMeVUsTcgE3QXL0lD8up/YJblWnB16Jd3BMKIBG/6tyoBzLMXLvdhJaYB0E9m8ObQL5Xke7aWgs/kDkMAQ5nr5OMkUUaS3v5r1Q38nPIaHqVxBAaBnCjfJ2FofXRECjY5rG3n+RhGN1wDPzTIIT9q3aZdtbFbXtD6DYnRrRflfE2eyjo7ISVO2/8wPDu5DIz2nbgcIL45ClJq8weUVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTrOXIGxwARZQ/F2F1skxkGyUQQ9uha5q6tsKJdavrA=;
 b=GzQ7vSQbFXMT1++jC0yI9zr7cAxH2QprQ4GMn34a6fT3zUughM3HbYlYU3tpV2HkTDjHrhqVo4W2+FVnLXZbp0J9X2I/EAqzYVxatd+NnW3ykt3/duY1rGF+PpeRwxnaA4MTSaNxD82MTygOO20fL/Z1KN18MOLYN0oCndmOwqw=
Received: from SA0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:806:130::25)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 17:52:41 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::1c) by SA0PR13CA0020.outlook.office365.com
 (2603:10b6:806:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 17:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 17:52:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Apr
 2026 12:52:40 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Apr
 2026 12:52:40 -0500
Received: from [10.254.48.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Apr 2026 12:52:39 -0500
Message-ID: <09928c66-f041-479d-954f-56dcfcfa1c13@amd.com>
Date: Fri, 24 Apr 2026 12:52:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
To: Krzysztof Kozlowski <krzk@kernel.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
 <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
 <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
 <eac0f387-c38a-44eb-aed4-6c4022f01777@kernel.org>
 <faef3c54-2292-4470-be6a-4c347ca65453@amd.com>
 <67f442f7-377d-46f3-82bc-86053e34c277@kernel.org>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <67f442f7-377d-46f3-82bc-86053e34c277@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: d5151434-2e40-48f5-d235-08dea22a47e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: jOkk52CHa42W74300W0M/0B3LwhpV0JUmkrGuEQzzehYGKpvBRPxShX/GegwoPBaIC8b78OWzfAexISJhFKEyzOOC5ZTkuYSjG2nhzp7C7szL8wmPp8QsTMe+BHnsucnNdB9ro0lKn/Yp6jISSqP2mdmHr3X9fHh85P+o3oOVuS5HZeobqFkZZa3Y5JFbXZKL7+N01fU+ykMVzTAOlmCpbnT2MZSKVKjYyzOxONUNDEnhj/0zJ7sS+D37Cql71ZbRAsomHvhw+7hFSenlhhn999rt6NDOJlcskkaHkcJlxtQPOLD1KSA3gMuhWYDKaybv07umSDyxFwNtq4EzjYss4Inb1VbXpsGLmU3CorjI8TfYUxnfWfBi8SAsSm+iPPVPwlBC5l7ggwXvaT4sCFEUrOrDF5Pecg3mHg5ziwJ1KzwX6Dza4oJV+K4PeQZa5ZLyhItLCJ2KDdQYzIJXJnuuX38v2jwpD18Qaq+ZIMtcC8QNjm4cHAsXDLIz0c6/qUlHc+NmP2ct4LzuAlcria+7VM7anTzcaWabxK042OxzfbFHUKztvGPwpYm+gCegBswJavlWqI08uOItvbALn8TtswKmT6SxcebbBSVDGKXp1RSCyTts1IPr5TEv+HuVcuDvYzKpcqafsJ7UATbvkPsZbx+HF4oyjACILrobEp+5iBbUm9sab1cEustyPJ9fInRs2o9G6MLKdWNa9jrMTvZHJ6L7+pZeAcAPGd3Pd3zrgl3ZZfWGrwIOhJP7HjMOvW9tQ4QOV7xakRxJ3pdPF1XJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l/Yv6oPZ1a4gZFcGyoXHxvdhweYQewKUNCJ5jWV+9KVtLrKSoKqr63Hb+k5qeegcwQNSxY4qcRVqPckUNoubhDFJ8gJp1epA7ZS+6kHYzcGDCYLssfJt5AaaOVMhntEykg1Fv9ayLbIKroHhKQMwJsUuHlF7cajsIqotDyjcA4HkiPT3fNW6VI440lPBdF5eWbDxYI4QSO71lwu4nr+uym9kNvrOZsykZVhLh5Khed1dW++bywXPGsiymRRxFmmtsCRAMGp3CDWD4rD9QNzjNloE5iAI7P0nIea2Utb9Rrzrs54a5ugJj7nvnNcKDsRQgfWncJg3+GLr1MDC8jk8ftImObcpf748EtVNLMMv64wVPdS0fvYFgdDfQVpmfhGxpaDXPWhGK+5Nnz+AkaHRhA7qzIdNMhAg7TJzqxRsXascvC1pTa/7CHtNDVxRDgjI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 17:52:41.1393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5151434-2e40-48f5-d235-08dea22a47e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_105255_380273_D7C62D40 
X-CRM114-Status: GOOD (  26.99  )
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
Reply-To: tanmay.shah@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 4/24/2026 11:53 AM, Krzysztof Kozlowski wrote:
> On 23/04/2026 19:59, Shah, Tanmay wrote:
>> Ack, I will rename it to xlnx,auto-boot.
>>
>>>>
>>>>>> +        type: boolean
>>>>>> +        description: remote core is either already running or ready to boot
>>>>>
>>>>> And why is this property of a board?
>>>>>
>>>>
>>>> Not sure what indicates it is? The property is under remoteproc child
>>>> device that is SOC level property. Remote core is on same SOC wher linux
>>>> core is running.
>>>
>>> So it is implied by SoC compatible? Please provide some arguments why it
>>> cannot be implied by the SoC compatible. I gave you one way out, but if
>>> you disagree then no problem.
>>>
>>
>> So on some SoC, the bootloader supports loading and starting of the
>> remote processor. But it is totally user's choice. User can choose to
>> load & start one core of a cluster via bootloader and leave another core
>> powered-off.
>> That is why it is not possible to decide based on SoC compatible.
> 
> OK. The problem is that "user" is a bit vague and usually user choice
> goes to user-space.
> 
> The property will be set or unset for ALL of given boards. So all of the
> DTS->DTB. That's why it should be clear why all such boards should
> behave like you described. If this is truly user, as in user-space,
> choice, then DT is not the way.
> 

Okay 'user' may not be the right choice of word. I should say 'hardware
configuration'. On same SoC, some cores can be configured to boot
automatically before Linux boots, and some won't. So if device-tree is
about hardware configuration, then we need a way to show which core is
configured to boot before linux. This configuration is board agnostic.
So I think auto-boot in device-tree makes sense.

The only advantage on this platform is, it has a way to detect if the
core is running or not runtime and don't have to rely on device-tree.

> 
>>
>> If we don't want to make it a device-tree property then I can implement
>> in a different way. New way will detect if the remote is running or not
>> via EMMI/SCMI call to the firmware, and take a decision based on that.
>> If this new way works, then I don't think we need auto-boot property at all.
>>
>> Let me know your thoughts.
> 
> This works for me and solves my questions from DT point of view, but I
> cannot judge whether this makes sense for you.
> 

I say I will keep it open ended for now. I will avoid introducing
auto-boot in the device-tree for now, and send a patch without it. In
future if for some other reason this property is needed, will send new
patch later.

Thanks,
Tanmay

> 
> Best regards,
> Krzysztof



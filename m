Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA2AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnORj6AwUklafQliia+PljSSSNZViblW/zSxNbyZ6Ks=; b=R3n5eorYXYMfhc4etIDufVYF3F
	lvtXvsItfEaOUHGr3y8Dek0cms3N6awyxjTQ/1Dn8MAt6ZKme38zJgYwE46EMPnx+Qd4AlF8+JPI3
	/29yW0Rhuo5DYry2Sqt6m59S37VQXoxrR+MBp1FHio8gSLOXkEs7Sx1+c8MKSWjXr7Ri2rKgyDw94
	eNq/C/LGL7OTBHTY9aE/Cib59LbaDgL7YQUYCSSkESRpqPg2DTgY0a4iFxxZ3RJJ600jmFcZZd1gO
	sA32R4u0YQVsmdD69Go8EFIwDSl8TkcDB6ibumuVeczMRPFgH3bGA1KkrIJjVE2qZyExPV8o7tMe9
	u61dMhtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMDa-00000009uRW-0m9m;
	Thu, 17 Jul 2025 10:52:02 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL3c-00000009kBZ-2QbB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 09:37:41 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56H9bMY33050978;
	Thu, 17 Jul 2025 04:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752745042;
	bh=rnORj6AwUklafQliia+PljSSSNZViblW/zSxNbyZ6Ks=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Jt+ZgRWaRZ9mL/QoDBRinVRNWfgjmmowSR6IC9lqeRJJRsT+As4WaU6+WafqPJuzf
	 e02vXZR4TEY59hWvhsAL1Hip/MTvyoJXyoTk3yrpg9dVQu9hHcCh0NIIpI4SpI8phA
	 xPs8ZgH2RnJpazm6Q9ldLMnN00LEMttHjOp51pS4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56H9bLWX128452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 04:37:22 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 04:37:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 04:37:21 -0500
Received: from [172.24.29.51] (ltpw0g6zld.dhcp.ti.com [172.24.29.51])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56H9bBNA1949782;
	Thu, 17 Jul 2025 04:37:12 -0500
Message-ID: <94196b50-1fd7-410e-83e8-b71bb6835acd@ti.com>
Date: Thu, 17 Jul 2025 15:07:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix buffer allocation for
 ICSSG
To: Simon Horman <horms@kernel.org>
CC: <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>, <pratheesh@ti.com>, <prajith@ti.com>
References: <20250710131250.1294278-1-h-mittal1@ti.com>
 <20250711144323.GV721198@horms.kernel.org>
 <b626dc40-e05b-40e0-b300-45ced82d2f97@ti.com>
 <20250715102943.GU721198@horms.kernel.org>
Content-Language: en-US
From: "MITTAL, HIMANSHU" <h-mittal1@ti.com>
In-Reply-To: <20250715102943.GU721198@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_023740_812055_AA587118 
X-CRM114-Status: GOOD (  17.53  )
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


On 7/15/2025 3:59 PM, Simon Horman wrote:
> On Tue, Jul 15, 2025 at 12:37:45PM +0530, MITTAL, HIMANSHU wrote:
>
> ...
>
>>>> +-----+-----------------------------------------------+
>>>> |     |       SLICE 0       |        SLICE 1          |
>>>> |     +------------+----------+------------+----------+
>>>> |     | Start addr | End addr | Start addr | End addr |
>>>> +-----+------------+----------+------------+----------+
>>>> | EXP | 70024000   | 70028000 | 7002C000   | 70030000 | <-- Overlapping
>>> Thanks for the detailed explanation with these tables.
>>> It is very helpful. I follow both the existing and new mappings
>>> with their help. Except for one thing.
>>>
>>> It's not clear how EXP was set to the values on the line above.
>>> Probably I'm missing something very obvious.
>>> Could you help me out here?
>> The root cause for this issue is that, buffer configuration for Express
>> Frames
>> in function: prueth_fw_offload_buffer_setup() is missing.
>>
>>
>> Details:
>> The driver implements two distinct buffer configuration functions that are
>> invoked
>> based on the driver state and ICSSG firmware:-
>> prueth_fw_offload_buffer_setup()
>> - prueth_emac_buffer_setup()
>>
>> During initialization, the driver creates standard network interfaces
>> (netdevs) and
>> configures buffers via prueth_emac_buffer_setup(). This function properly
>> allocates
>> and configures all required memory regions including:
>> - LI buffers
>> - Express packet buffers
>> - Preemptible packet buffers
>>
>> However, when the driver transitions to an offload mode (switch/HSR/PRP),
>> buffer reconfiguration is handled by prueth_fw_offload_buffer_setup().
>> This function does not reconfigure the buffer regions required for Express
>> packets,
>> leading to incorrect buffer allocation.
> Thanks for your patience, I see that now :)
>
> I'm sorry to drag this out, but I do think it would be useful to add
> information above the lines of the above to the patch description.
Thanks for the feedback, I will add this information and create an 
updated patch.
>>>> | PRE | 70030000   | 70033800 | 70034000   | 70037800 |
>>>> +-----+------------+----------+------------+----------+
>>>>
>>>> +---------------------+----------+----------+
>>>> |                     | SLICE 0  |  SLICE 1 |
>>>> +---------------------+----------+----------+
>>>> | Default Drop Offset | 00000000 | 00000000 |     <-- Field not configured
>>>> +---------------------+----------+----------+
>>> ...


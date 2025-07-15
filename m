Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B85C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 07:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQzkqrfUSvnBljERKPGdhvxyCebpfiP092MYdAIusq8=; b=v8fS+KG88/fADkdjaouHlwfTZ5
	PXyk154P5ABBfG8ktuTtP84kOzmIXu/fdaHm+OectKauSWL2J0cgNLCdAvbvOcIgo+MDNCyAYNXHJ
	mL85j62spbqeoMX2oP33BTqX7IILyYjKZCl8LG8aHZdh73FXo0PxG4tZJkYc2G21FvKUHSgK0sOWX
	UQqE8x4Jd+3LN9Cw0a0G48tofbPR5VbT5tN+wank+fejJ76dxWivB9vMP9gvofPPFQwRX2+dDmIA2
	CehbwRKiHI3X7Tsn4ugJkmTbOrAr5TELwFg6GaXoIL1yPeARHyd9j/kgLOD4+b0H0jA2Eht4Dymk6
	tpAVhUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZo8-00000004HrW-2c0h;
	Tue, 15 Jul 2025 07:10:32 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZle-00000004HaN-3SKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 07:08:00 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F77pLI2835369;
	Tue, 15 Jul 2025 02:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752563271;
	bh=KQzkqrfUSvnBljERKPGdhvxyCebpfiP092MYdAIusq8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MKIN6RW9TRdeFPmiHw71lnX1kTy876Op/9t/NQFwPYM6UFFA9lnauRtaE9WngwFgr
	 7Hyi3/38a/CvPQiy9vcnhKl0HJh//xM37CuYPpH3CMVPcq6y58Wr476q+263x9AQgD
	 S2Aw7bC5lRugyLHJdS26wpyhp/4l7ZvrZKzJD7gU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F77pE04088945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 02:07:51 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 02:07:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 02:07:51 -0500
Received: from [172.24.29.51] (ltpw0g6zld.dhcp.ti.com [172.24.29.51])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F77kSv2459968;
	Tue, 15 Jul 2025 02:07:46 -0500
Message-ID: <b626dc40-e05b-40e0-b300-45ced82d2f97@ti.com>
Date: Tue, 15 Jul 2025 12:37:45 +0530
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
Content-Language: en-US
From: "MITTAL, HIMANSHU" <h-mittal1@ti.com>
In-Reply-To: <20250711144323.GV721198@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_000759_438373_B683ABD3 
X-CRM114-Status: GOOD (  19.26  )
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


On 7/11/2025 8:13 PM, Simon Horman wrote:
> On Thu, Jul 10, 2025 at 06:42:50PM +0530, Himanshu Mittal wrote:
>> Fixes overlapping buffer allocation for ICSSG peripheral
>> used for storing packets to be received/transmitted.
>> There are 3 buffers:
>> 1. Buffer for Locally Injected Packets
>> 2. Buffer for Forwarding Packets
>> 3. Buffer for Host Egress Packets
>>
>> In existing allocation buffers for 2. and 3. are overlapping causing packet
>> corruption.
>>
>> Packet corruption observations:
>> During tcp iperf testing, due to overlapping buffers the received ack
>> packet overwrites the packet to be transmitted. So, we see packets on wire
>> with the ack packet content inside the content of next TCP packet from
>> sender device.
>>
>> Details for AM64x switch mode:
>> -> Allocation by existing driver:
>> +---------+-------------------------------------------------------------+
>> |         |          SLICE 0             |          SLICE 1             |
>> |         +------+--------------+--------+------+--------------+--------+
>> |         | Slot | Base Address | Size   | Slot | Base Address | Size   |
>> |---------+------+--------------+--------+------+--------------+--------+
>> |         | 0    | 70000000     | 0x2000 | 0    | 70010000     | 0x2000 |
>> |         | 1    | 70002000     | 0x2000 | 1    | 70012000     | 0x2000 |
>> |         | 2    | 70004000     | 0x2000 | 2    | 70014000     | 0x2000 |
>> | FWD     | 3    | 70006000     | 0x2000 | 3    | 70016000     | 0x2000 |
>> | Buffers | 4    | 70008000     | 0x2000 | 4    | 70018000     | 0x2000 |
>> |         | 5    | 7000A000     | 0x2000 | 5    | 7001A000     | 0x2000 |
>> |         | 6    | 7000C000     | 0x2000 | 6    | 7001C000     | 0x2000 |
>> |         | 7    | 7000E000     | 0x2000 | 7    | 7001E000     | 0x2000 |
>> +---------+------+--------------+--------+------+--------------+--------+
>> |         | 8    | 70020000     | 0x1000 | 8    | 70028000     | 0x1000 |
>> |         | 9    | 70021000     | 0x1000 | 9    | 70029000     | 0x1000 |
>> |         | 10   | 70022000     | 0x1000 | 10   | 7002A000     | 0x1000 |
>> | Our     | 11   | 70023000     | 0x1000 | 11   | 7002B000     | 0x1000 |
>> | LI      | 12   | 00000000     | 0x0    | 12   | 00000000     | 0x0    |
>> | Buffers | 13   | 00000000     | 0x0    | 13   | 00000000     | 0x0    |
>> |         | 14   | 00000000     | 0x0    | 14   | 00000000     | 0x0    |
>> |         | 15   | 00000000     | 0x0    | 15   | 00000000     | 0x0    |
>> +---------+------+--------------+--------+------+--------------+--------+
>> |         | 16   | 70024000     | 0x1000 | 16   | 7002C000     | 0x1000 |
>> |         | 17   | 70025000     | 0x1000 | 17   | 7002D000     | 0x1000 |
>> |         | 18   | 70026000     | 0x1000 | 18   | 7002E000     | 0x1000 |
>> | Their   | 19   | 70027000     | 0x1000 | 19   | 7002F000     | 0x1000 |
>> | LI      | 20   | 00000000     | 0x0    | 20   | 00000000     | 0x0    |
>> | Buffers | 21   | 00000000     | 0x0    | 21   | 00000000     | 0x0    |
>> |         | 22   | 00000000     | 0x0    | 22   | 00000000     | 0x0    |
>> |         | 23   | 00000000     | 0x0    | 23   | 00000000     | 0x0    |
>> +---------+------+--------------+--------+------+--------------+--------+
>> --> here 16, 17, 18, 19 overlapping with below express buffer
>>
>> +-----+-----------------------------------------------+
>> |     |       SLICE 0       |        SLICE 1          |
>> |     +------------+----------+------------+----------+
>> |     | Start addr | End addr | Start addr | End addr |
>> +-----+------------+----------+------------+----------+
>> | EXP | 70024000   | 70028000 | 7002C000   | 70030000 | <-- Overlapping
> Thanks for the detailed explanation with these tables.
> It is very helpful. I follow both the existing and new mappings
> with their help. Except for one thing.
>
> It's not clear how EXP was set to the values on the line above.
> Probably I'm missing something very obvious.
> Could you help me out here?

The root cause for this issue is that, buffer configuration for Express 
Frames
in function: prueth_fw_offload_buffer_setup() is missing.


Details:
The driver implements two distinct buffer configuration functions that 
are invoked
based on the driver state and ICSSG firmware:- 
prueth_fw_offload_buffer_setup()
- prueth_emac_buffer_setup()

During initialization, the driver creates standard network interfaces 
(netdevs) and
configures buffers via prueth_emac_buffer_setup(). This function 
properly allocates
and configures all required memory regions including:
- LI buffers
- Express packet buffers
- Preemptible packet buffers

However, when the driver transitions to an offload mode (switch/HSR/PRP),
buffer reconfiguration is handled by prueth_fw_offload_buffer_setup().
This function does not reconfigure the buffer regions required for 
Express packets,
leading to incorrect buffer allocation.
>> | PRE | 70030000   | 70033800 | 70034000   | 70037800 |
>> +-----+------------+----------+------------+----------+
>>
>> +---------------------+----------+----------+
>> |                     | SLICE 0  |  SLICE 1 |
>> +---------------------+----------+----------+
>> | Default Drop Offset | 00000000 | 00000000 |     <-- Field not configured
>> +---------------------+----------+----------+
> ...

Thanks,
Himanshu



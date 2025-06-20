Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5593C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 05:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp9WhGtwITw4z4oqN2An4Zu7J7uX8VyvzwFQkz9+z1U=; b=P1qem05XfXKXwD8ykr12xUkClM
	dJ/Dv3muqcVZOn8ldhlMTeqlVjIWjtzgALs+C3jgU750qYRDvDnPxt2zRMtaZESQE4XqWAA24e6es
	sgZbVaTImAQo1d7tGXHBF+pR6/kcAgQyg8JImL57616mW0glDcTCvbneTbb91bKDtSL+8+3sebKVb
	2KYG3O37fEK6IYj1J4G1o8XO6pOidt4GED1RJ9FxlKdsQBh7v0k+m0sAptiqamdObekGruEDJH3YD
	Ij03oBiVOHf/TTFnclKEwtnv0UfWHbSAj9sZAb2OaDba3enclGqzx0kddrxG4AJtY6E6GniQYcrql
	FK4icywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSUjm-0000000Ep1Z-0poR;
	Fri, 20 Jun 2025 05:56:30 +0000
Received: from mail-m32102.qiye.163.com ([220.197.32.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSUhX-0000000Eojy-03a5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 05:54:12 +0000
Received: from [172.21.129.96] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1956def94;
	Fri, 20 Jun 2025 13:54:05 +0800 (GMT+08:00)
Message-ID: <b95a60f8-0e1d-4c81-8d5a-e2ea7d083780@hj-micro.com>
Date: Fri, 20 Jun 2025 13:54:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] PCI: pciehp: Replace fixed delay with polling for
 slot power-off
To: Lukas Wunner <lukas@wunner.de>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 peter.du@hj-micro.com, jemma.zhang@hj-micro.com
References: <20250619093228.283171-1-andy.xu@hj-micro.com>
 <aFP598Yyl0el1uKh@wunner.de>
From: Hongbo Yao <andy.xu@hj-micro.com>
In-Reply-To: <aFP598Yyl0el1uKh@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTBpOVh0ZT01PGB9LSB1MSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVQkJJTktVSktLVU
	pCS0JZBg++
X-HM-Tid: 0a978be6c2a103afkunm0488a5943ba0a8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mzo6Pww*KzE3DjQ9CAI2FjYO
	KC5PFDVVSlVKTE5LSEJDQ09NTUlKVTMWGhIXVRoVHwJVAw47ExFWFhIYCRRVGBQWRVlXWRILWUFZ
	SklJVUlJT1VJT0pVSE9ZV1kIAVlBTktNSzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_225411_210680_12CAB73E 
X-CRM114-Status: GOOD (  21.96  )
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



在 2025/6/19 19:52, Lukas Wunner 写道:
> On Thu, Jun 19, 2025 at 05:32:28PM +0800, Hongbo Yao wrote:
>> Fixed 1-second delay in remove_board() fails to accommodate certain
>> hardware like multi-host OCP cards, which exhibit longer power-off
>> latencies.
> 
> Please name the affected product(s).
> 
> They don't seem to comply to the spec.  How prevalent are they?
> If there are only few deployed, quirks like this are probably
> best addressed by an out-of-tree patch.
> 

Hi Lukas,
Thank you for reviewing the patch.

The affected hardware configuration:
 - Host system: Arm Neoverse N2 based server
 - Multi-host OCP card: Mellanox Technologies MT2910 Family [ConnectX-7]


>> Logs before fix:
>> [157.778307] pcieport 0003:00:00.0: pciehp: pending interrupts 0x0001 from Slot Status
>> [157.778321] pcieport 0003:00:00.0: pciehp: Slot(31): Attention button pressed
>> [157.785445] pcieport 0003:00:00.0: pciehp: Slot(31): Powering off due to button press
>> [157.798931] pcieport 000b:00:02.0: pciehp: pending interrupts 0x0001 from Slot Status
> 
> This log excerpt mixes messages from two separate hotplug ports
> (0003:00:00.0 and 000b:00:02.0).  Are these hotplug ports related?
> If not, please reduce the log excerpt to a single hotplug port
> to avoid confusion.
> 
Sorry for not providing adequate context in the patch submission.

Yes, these two hotplug ports are related - they are part of the same
physical multi-host OCP card.

Key points:
1. The OCP card has two independent PCIe endpoints
2. Each endpoint connected to a PCIe root port:
   - Endpoint 1 → Port 0003:00:00.0
   - Endpoint 2 → Port 000b:00:02.0
3. Both endpoints share a common power domain
4. Full power-off occurs only after BOTH endpoints are powered down
5. DLLSC is triggered only after complete power-off

Critical log events:
[157.778307] Both ports: Attention button pressed
[167.540342] Port 0003:00:00.0 power off command issued
[172.289366] Port 000b:00:02.0 power off command issued
[172.302385] Card fully powered off, trigger AER interrupts and DLLSC

Full power-off occurs only after BOTH ports complete their sequences,
taking about 5s total.

>> --- a/drivers/pci/hotplug/pciehp_ctrl.c
>> +++ b/drivers/pci/hotplug/pciehp_ctrl.c
>> @@ -30,6 +30,25 @@
>>  #define SAFE_REMOVAL	 true
>>  #define SURPRISE_REMOVAL false
>>  
>> +static void pciehp_wait_for_link_inactive(struct controller *ctrl)
>> +{
>> +	u16 lnk_status;
>> +	int timeout = 10000, step = 20;
>> +
>> +	do {
>> +		pcie_capability_read_word(ctrl->pcie->port, PCI_EXP_LNKSTA,
>> +					  &lnk_status);
>> +
>> +		if (!(lnk_status & PCI_EXP_LNKSTA_DLLLA))
>> +			return;
>> +
>> +		msleep(step);
>> +		timeout -= step;
>> +	} while (timeout >= 0);
>> +
>> +	ctrl_dbg(ctrl, "Timeout waiting for link inactive state\n");
>> +}
> 
> Any chance you can use one of the existing helpers, such as
> pcie_wait_for_link()?
> 
> Is the 10 second delay chosen arbitrarily or how did you come up
> with it?  How much time do the affected products really need?
>
Ok,  I will try to use pcie_wait_for_link().

The 10-second timeout was determined from actual log observations. The
power-off process for the multi-host OCP card takes approximately 5-9
seconds in our measurements.

>> @@ -119,8 +138,11 @@ static void remove_board(struct controller *ctrl, bool safe_removal)
>>  		 * After turning power off, we must wait for at least 1 second
>>  		 * before taking any action that relies on power having been
>>  		 * removed from the slot/adapter.
>> +		 *
>> +		 * Extended wait with polling to ensure hardware has completed
>> +		 * power-off sequence.
>>  		 */
>> -		msleep(1000);
>> +		pciehp_wait_for_link_inactive(ctrl);
>>  
>>  		/* Ignore link or presence changes caused by power off */
>>  		atomic_and(~(PCI_EXP_SLTSTA_DLLSC | PCI_EXP_SLTSTA_PDC),
> 
> Please keep the msleep(1000), that's the minimum we need to wait
> per PCIe r6.3 sec 6.7.1.8.
> 
> Please make the extra wait for link down conditional on
> ctrl->pcie->port->link_active_reporting.  (DLLLA reporting is
> optional for hotplug ports conforming to older spec revisions.)
> 
Thank you for the valuable suggestion. i'll  revise the patch

Best regards,
Hongbo.> Thanks,
> 
> Lukas
> 
> 



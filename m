Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9C3CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZPsbfVwlq65ZLIf6ETdavMzKAcLkBr2ZzzjFYJ/2ks=; b=MZmzaV3yJX82a3
	kaktFeuda/CANK8Ki5r7zJqP61FebREgmztocv0fVxhqJoJOQiPNcuqGCiAOZt8qeP80FUiTnNtn/
	+CuqFLiN88q8oGI1pdlyZrNb1XvGS1gCYMsj3tYJy9lhtMIsf06y7qPzVJivqhVEO9sjcwmkrgFqC
	FmTE5xcPJyaVWTJvHQPEzskFhblVyX9fwtfPrcTw8v1eKju0qErrMA0xAIOfn9kCqp8YAYH/75O2c
	9POMuZpWzoMj1bhRYOS53n3lZFJmproXkjM+fHJ5ligFKvMdkEPXK3gJKQec/BRlBYv/5X1ZuZ8IR
	U/PgHDra/iMDSd2jc3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmlq-00000003gmO-2nSe;
	Fri, 16 Oct 2026 18:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmlp-00000003gmD-3BVa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kZPsbfVwlq65ZLIf6ETdavMzKAcLkBr2ZzzjFYJ/2ks=; b=lgsZHQE9C3ULKMrDlF1teR5RYQ
	vSYDIbVEMQ/XTYDoPPhtkCcH3l5YpzEq6PPISo9+6IyJDA0przKIgK+z5c3ByfGnp+7ahQjhRax4U
	5X2Fc7iiRm7vn15heDUjj35OO/suAGrKMMfxtv5Hk7MXyzRYr/al75GLjnsh6G0hSTptwMlGvQHKk
	KEMVTmC/dsPQqVbCfaqRvAV9rBVzJycXjVVFxi7N00vlEo0BH0WOGthgiqtz6YNNGDsjebssu6abB
	6q95Ahjs/tUOf6l/QSitMS9Db6WSnbeNyZKFzj9FhhzdsDdQgB2PVonC3EbvdKVZAZ+Kqy3tHodp0
	ZEVw9gOw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHmlm-00000001qgG-155e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:35:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AC8114BF;
	Fri, 16 Oct 2026 11:35:01 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 381F13F7B4;
	Fri, 16 Oct 2026 11:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175704; bh=TCPs7Q0SBQpJG7xNxUhhLDp3yOSvi0sjiqAmnJ23vfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hsh/0GqCkAlqYTJU9xl7kQb9NsXeElnitnC2YjRO7T9EwLdr99K8MXIliaamEzXoB
	 dnTaROKxWPkpj+0foPQNAAP+50YLF4PsotSL6iEOZHrVjZAkgl1EcdRB0u2/6xMrHm
	 xeNS1jSSPMFFekE9SxLuAvFSx+ARfYvZX6R5jjBM=
Message-ID: <cb22948f-4e46-4b26-ba66-5b10054d6088@arm.com>
Date: Fri, 16 Oct 2026 19:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] firmware: smccc: lfa: add sysfs ABI documentation
To: Sudeep Holla <sudeep.holla@kernel.org>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-9-andre.przywara@arm.com>
 <20260921-essential-inquisitive-spaniel-9801eb@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-essential-inquisitive-spaniel-9801eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_193506_853588_67EAA494 
X-CRM114-Status: GOOD (  29.46  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Sudeep,

On 9/21/26 18:19, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:11PM +0200, Andre Przywara wrote:
>> Document the sysfs attribute files as exported by the LFA driver.
>>
> 
> Looking at the sysfs output in 2/8 message log,
> activation_pending is missing from the documentation.

Ah, good point, added now.

> 
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   Documentation/ABI/testing/sysfs-firmware-lfa | 106 +++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
>>
>> diff --git a/Documentation/ABI/testing/sysfs-firmware-lfa b/Documentation/ABI/testing/sysfs-firmware-lfa
>> new file mode 100644
>> index 0000000000000..afd349af9cf14
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-firmware-lfa
>> @@ -0,0 +1,106 @@
>> +What:		/sys/firmware/lfa
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		The Arm Live Firmware Activation (LFA) spec describes an
>> +		interface between platform firmware (an agent) and any user
>> +		on the non-secure side (like the Linux kernel) to activate
>> +		pending firmware updates at runtime. The actual firmware
>> +		update would be provided independently (out-of-band, or
>> +		via any existing explicit firmware update mechanisms), then,
>> +		if supported, can be activated immediately, without rebooting
>> +		the system.
>> +		This directory contains one directory for each of the LFA
>> +		capable firmware images supported by the agent, identified by
>> +		its GUID. Within each directory, the same set of sysfs files
>> +		provides access to the properties and actions for this
>> +		particular firmware image.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/activate
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(WO) Write a boolean 'true' value to trigger the
>> +		activation of that firmware component. An update must be
>> +		pending for this to be successful.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/activation_capable
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(RO) A boolean value to show whether this firmware image is
>> +		capable of being activated.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/auto_activate
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(RW) Write a boolean 'true' value to allow a firmware image
>> +		to be automatically activated once a new firmware update
>> +		becomes available ("pending"). This depends on a working
>> +		notification scheme, for instance via an ACPI notification
>> +		or an interrupt to notify the kernel.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/cancel
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(WO) Write a boolean 'true' value to cancel a recently
>> +		triggered activation, if that has not finished yet.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/cpu_rendezvous
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(RO) A boolean value to show whether this image requires
>> +		a CPU rendezvous in firmware to be activated. If true, this
>> +		means all CPUs will enter the firmware during the activation
>> +		process, so will not be able to execute kernel code or
>> +		handle interrupts for a brief moment.
> 
> What use does the userspace have with this 'activation_pending' and

activation_pending is probably the most useful of those attributes, 
since it tells the user that an update image has been deployed and is 
ready to be activated. For out-of-band updates this is the only 
information that we have, if we don't allow automatic updates. Userland 
could poll this file, or rather use some udev magic to be notified, as 
Nirmoy sketched up a while ago.

> 'may_reset_cpu' ? We should drop them unless you convince otherwise.

The consequence of may_reset_cpu is that a component cannot be updated 
at the moment. I think that's an important information to have.

Besides, the idea is to rather not filter too much here, but just expose 
the information that the firmware gives us. I am expecting some userland 
component (either a daemon or fwupd) to process this information, and 
let the kernel act more or less as a middle man to do the SMC calls.

Cheers,
Andre



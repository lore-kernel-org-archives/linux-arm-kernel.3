Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4ADC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEIa1uqo+xbksQKriDRPnzz0JmnX5o/pYdLRVvJjCks=; b=nglpvt7GqPExd+9gIp2/h2nKS8
	WKuQ24DYyeDgfbwTowp4G5V4doFLtXnjiWMvT2jwvBt8qyUutHzUAYK2qfPp7EOWHV6VpMkpAkDUq
	bgsUIr3tuDNlhwdeT82xhzvk8Iv+IV94F2PWx+b3dlyzaN+xxzeZMxoe84hY2DL5LZNKRqDD3tL4g
	uw5VJ4thGCy20FpBh1ke+d29VvTUo/a9Lfiye0P8xxj7EGssKCsYUhjxp7AYJTZoC+vm7VKLVN1M1
	dhf66UIJVkiDjN26LZHvLZWJ1LlUO/ug9KG/XeXmQIIG0BmXKcOoQT3PKRStNFA6wrW1wTgXCb3pf
	pc4GEZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLYd-00000002shn-27CA;
	Mon, 27 Jul 2026 13:39:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLYb-00000002sgt-0cGU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:39:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA9781596;
	Mon, 27 Jul 2026 06:39:41 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E7823F763;
	Mon, 27 Jul 2026 06:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785159585; bh=xETUF9IIL3+ftMMTTgtEotkAfkaiZAvCSchoDQclums=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jxlhdd9gh7eOXt/XnMupvdkOl7MwBMD8b3edsTMwEOXJpgDteef5HFwLdyotaMnmm
	 AS1IiW9NSDVK7hh6CmTJwswsaeLvivnaUMhb5s83GSSWR3lz2I7bJy5U8NGCjsbk0G
	 34KICvzxy2dXaQj7aZzKOvXW6SQ0h+djpzxWzUac=
Message-ID: <b1d346ad-2bee-4f0d-9ac2-08d4c1bde94e@arm.com>
Date: Mon, 27 Jul 2026 15:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
To: Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Hanjun Guo <guohanjun@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-11-andre.przywara@arm.com>
 <20260724-finicky-knowing-foxhound-df1e56@sudeepholla>
 <amdTr8Sxw9024CN7@lpieralisi>
 <20260727-knowing-bittern-of-tempest-6deb54@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260727-knowing-bittern-of-tempest-6deb54@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_063949_282989_8B718CCB 
X-CRM114-Status: GOOD (  27.99  )
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

Hi,

On 7/27/26 15:20, Sudeep Holla wrote:
> On Mon, Jul 27, 2026 at 02:48:47PM +0200, Lorenzo Pieralisi wrote:
>> On Fri, Jul 24, 2026 at 11:18:32AM +0100, Sudeep Holla wrote:
>>> On Thu, Jul 23, 2026 at 05:54:54PM +0200, Andre Przywara wrote:
>>>> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
>>>> registers through a firmware interface. This requires a shared memory
>>>> region to hold the message, and a mailbox to trigger the access.
>>>> For ACPI this is wrapped as a PCC channel, described using existing
>>>> ACPI abstractions.
>>>>
>>>> Add code to parse those PCC table descriptions associated with an MSC,
>>>> and store the parsed information in the MSC struct.
>>>> There can be multiple PCC channels, and each channel can serve multiple
>>>> MSCs, so we need to keep track of the channel usage, using a list and
>>>> a refcount.
>>>> This will be used by the MPAM-Fb access wrapper code.
>>>>
>>>> [1] https://developer.arm.com/documentation/den0144/latest
>>>>
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>> ---
>>>>   drivers/acpi/arm64/mpam.c      |   6 +-
>>>>   drivers/resctrl/mpam_devices.c | 127 ++++++++++++++++++++++++++++++++-
>>>>   2 files changed, 129 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
>>>> index 84963a20c3e7..ca9b8754ae5f 100644
>>>> --- a/drivers/acpi/arm64/mpam.c
>>>> +++ b/drivers/acpi/arm64/mpam.c
>>>> @@ -220,8 +220,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>>>>   	struct platform_device *pdev __free(platform_device_put) =
>>>>   		platform_device_alloc("mpam_msc", tbl_msc->identifier);
>>>
>>> Looks like tbl_msc->identifier is getting stashed as pdev->id...
>>>
>>>
>>>>   	int next_res = 0, next_prop = 0, err;
>>>> -	/* pcc, nrdy, affinity and a sentinel */
>>>> -	struct property_entry props[4] = { 0 };
>>>> +	/* pcc, msc-id, nrdy, affinity and a sentinel */
>>>> +	struct property_entry props[5] = { 0 };
>>>>   	/* mmio, 2xirq, no sentinel. */
>>>>   	struct resource res[3] = { 0 };
>>>>   	struct acpi_device *companion;
>>>> @@ -256,6 +256,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>>>>   	} else if (iface == MPAM_IFACE_PCC) {
>>>>   		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>>>>   							tbl_msc->base_address);
>>>> +		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
>>>> +							tbl_msc->identifier);
>>>
>>> Why is this needed then as you can fetch it as pdev->id ?
>>
>> I suppose it is to have properties parity between OF and ACPI without
>> having to change the driver property parsing path.

I could claim: "what he said ^^^^", but in truth I simply missed that 
the identifier is also the platform device ID.

> Yes, that was my initial thought as well. However, after looking into it
> further, I could not find any device tree bindings in the upstream tree.
> I am therefore unsure whether MPAM is supported on DT platforms.

No, at the moment MPAM is ACPI only. As you mention, DT bindings have 
been proposed at some point, but apparently there was no real user, so 
this effort was shelved until someone complains, IIUC.

> The use of these device properties appears to have been based on DT bindings
> that may never have been upstreamed. As [1] suggests, the bindings were
> dropped before the initial merge.

Yes, indeed these names already cater for the proposed DT bindings, 
short of inventing some new names, I guess.  But I was wondering how 
much of a problem it is to rename them, for ACPI those names are 
internal only, right? So any potentially deviating DT property name 
would just be a patch to rename the property name here and in the MPAM 
driver, right?

> Although we could rename these properties later to align with any DT bindings
> that are introduced, I think it would be preferable to avoid adding new
> properties unless they are strictly necessary.

I don't really mind, so can do either way, but the MSC identifier is 
clearly defined in the MPAM-Fb protocol, and connected to the number 
used in the ACPI table, so kind of assuming that the platform device ID 
(a more Linux internal thing?) is the same, is a bit fragile.

But as mentioned: whatever you prefer, it looks like we can change it 
anytime.

Thanks,
Andre.



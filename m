Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB07C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1y7pdhi6vSx5Y3b52EG5qi92OonZBV/y5k2J0kez/98=; b=ZP4G6M2k0GcMm8PxmKqO7FoX7y
	LhYivSMpMaotxFmIi1O3R30vERHqU06Ge+3qAWzLliAhwvOsopNIv4cS/HxPszqNcgaeSan8ybhV+
	0iya2+oAfPOZ7I8rvVNWuWC+991EpHnvd7XpJwTw/Jx3eqqrWetk+gN6rNM7desQmyq8ucaSeaB2j
	RF2e+4CpcaxT9TGTmRJyIREmXDdETj/fMRt5ATQc+JuaMBJ73E370KT9RHHAH8iiGa8+B0Cv9uaTr
	ua8tIO/I8PuPhinwzUxl1LO8ZwGa1JrMItTy4mggLYE+3ch/aYszBeDzGEOFOMOqSpjrNFezYx7eF
	Clg2imiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWOR-00000002F4O-3WH8;
	Tue, 01 Apr 2025 07:50:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWLn-00000002EpA-48CI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 07:48:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6B514BF;
	Tue,  1 Apr 2025 00:48:01 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CEE73F694;
	Tue,  1 Apr 2025 00:47:56 -0700 (PDT)
Message-ID: <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
Date: Tue, 1 Apr 2025 13:17:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
To: Angelos Oikonomopoulos <angelos@igalia.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_004800_072095_59F403F6 
X-CRM114-Status: GOOD (  12.11  )
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



On 4/1/25 12:28, Angelos Oikonomopoulos wrote:
> On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
>> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
>>> do_alignment_t32_to_handler only fixes up alignment faults for specific
>>> instructions; it returns NULL otherwise. When that's the case, signal to
>>> the caller that it needs to proceed with the regular alignment fault
>>> handling (i.e. SIGBUS).
>>>
>>> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
>>> ---
>>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
>>> index deff21bfa680..b68e1d328d4c 100644
>>> --- a/arch/arm64/kernel/compat_alignment.c
>>> +++ b/arch/arm64/kernel/compat_alignment.c
>>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
>>>  		return 1;
>>>  	}
>>>  
>>> +	if (!handler)
>>> +		return 1;
>>
>> do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
>> the right thing to do here and consistent. Otherwise does this cause a
>> kernel crash during subsequent call into handler() ?
> 
> Yes. We call a NULL pointer so we Oops.

Then the commit message should have the kernel Oops splash dump and also
might need to have Fixes: and CC: stable tags etc ?

Also wondering if handler return value should be checked inside the switch
block just after do_alignment_t32_to_handler() assignment.

	handler = do_alignment_t32_to_handler()
	if (!handler)
		return 1


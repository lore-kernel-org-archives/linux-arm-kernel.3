Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FD2C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6vW4NSGnOxnDi0VQotxMy3KX/u7aGrTt7sLX+40uF4=; b=waaOJWikQXdd86RhflfZNccfZn
	rx+ES4th5UmVxDz2Wd3vOGepFPEwEurcvwe1R7tw662gf1SitNT7jc4Mott+uYZpa10Ag/MpFWprm
	LQpWuM/wv5moXiJZbVygn6s+RWjuaBrj1DfpJv6oK/Rj/7RSBs2Cfs9+7oLUIRLNWQ6NmA5mcC2zl
	sivOZSAr/+tAhujv9MR6IlsSAGgdQXcGnm0/6GYj/lOe/sexasTmrFLbsb9ucFFfjsSkS99blD40p
	pcIhnU/yUflAgZfXTCd3ednwY98vjYwt61m3kjpacAafEUYgN3uFtTwzjC2S6runbHTm/NO5wfDoJ
	ZwKbcOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3Qr-0000000BjV2-1NIP;
	Fri, 28 Feb 2025 16:41:49 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3PI-0000000Bj23-1mR0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:40:13 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 75B44210D0D5;
	Fri, 28 Feb 2025 08:40:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 75B44210D0D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740760810;
	bh=t6vW4NSGnOxnDi0VQotxMy3KX/u7aGrTt7sLX+40uF4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qvq7hX3vmgvcAlM2s3ZD+rHzoKNsk7bPCxEHqpcjf3cIsKuDm49RePAi0xKglijjY
	 4yPi1ZUTnJAYR5Bclt2Frb7Vy2NW8C/oUhQQHc3TJZWwo+QqvmmLDE6vq7lKzVaO6J
	 MqXsFeBLG2Fs7Wz+dXsOtvPLCGOPdZvt9kJeTHC4=
Message-ID: <69c868f9-8bac-4bbe-ba56-832ab6a21660@linux.microsoft.com>
Date: Fri, 28 Feb 2025 08:40:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
 <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
 <7ea741fb-9935-42f2-a4f0-99df8df563eb@linux.microsoft.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <7ea741fb-9935-42f2-a4f0-99df8df563eb@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_084012_522315_F10C5C92 
X-CRM114-Status: GOOD (  31.89  )
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



On 2/27/2025 4:15 PM, Nuno Das Neves wrote:
> On 2/27/2025 9:02 AM, Roman Kisel wrote:

[...]

> I guess you're implying it's not worth adding such a function for only a
> few places in the code? That is a good point, and a bit of an oversight
> on my part while editing this series. Originally all the hypercall helper
> functions in the driver code (10+ places) used this function as well, but
> I removed those printks_()s as a temporary solution to limit the use of
> printk in the driver code (as opposed to dev_printk() which is preferred).
> 
> I didn't think to remove *this* patch as a result of that change!
> I do want to figure out a good way to add that logging back to the hypercall
> helpers, so I do want to try and get some form of this patch in to aid
> debugging hypercalls - it has been very very useful over time.
> 

Right, I thought that the function looked more as a bring-up aid rather
than a full fledged solution to some problem.

>> The "Unknown" part would make debugging harder actually when something
>> fails. I presume that the mainstream scenarios all work, and it is the
>> edge cases that might fail, and these are likelier to produce "Unknown".
>>
> That is a very good point. Ideally, we could log "Unknown" along with
> the hex code instead of replacing it.
> 
> What do you think about keeping this function, but instead of using it
> directly, introduce a "standard" way for logging hypercall errors which
> can hopefully be used everywhere in the kernel?
> e.g. a simple macro:
> #define hv_hvcall_err(control, status)
> do {
> 	u64 ___status = (status);
> 	pr_err("Hypercall: %#x err: %#x : %s", (control) & 0xFFFF, hv_result(___status), hv_result_to_string(___status));
> } while (0)
> 
> I feel like this is the best of both worlds, and actually makes it even
> easier to do this logging everywhere it is wanted (for me, that includes
> all the /dev/mshv-related hypercalls).
> We could add strings for the HVCALL_ values too, and/or include __func__
> in the macro to aid in finding the context it was used in.
> 

That doesn’t seem to be common in the kernel from what I’ve seen in 
dmesg, although there is certainly a lot of appeal in that approach. 
However, we will have to remember to update the function each time when 
another status code is added not to leave things half-cooked.

Also it is a bit surprising the *kernel* should report that rather than 
the VMM from the user mode. E.g. the kernel does not report all errors 
on file open, file seek, etc. As I understand, the hv status codes are
later mapped to errno in a lossy manner, and errno is what the user mode
receives?

As long as the hex code is logged, I am fine with the change.

>> Folks who actually debug failed hypercalls rarely have issues with
>> looking up the error code, and printing "Unknown" to the log is worse
>> than a hexadecimal. Like even the people who wrote the code got nothing
>> to say about what is going on.
>>
> Yep, totally agree having the hex code available can be valuable in
> unexpected situations.
> 

Appreciate giving my concerns a thorough consideration!

-- 
Thank you,
Roman



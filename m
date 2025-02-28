Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CDCC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+ex/PI1EKCfFK1H+WPecE98rrnjNmYMX0MiAFRCvj8=; b=swXVmfK9z97KXl7enI4xr2KfTP
	IEhzZPBgcJLHdijeCzM2zc/m7440RUWI/80DuCBPvVu5OM0luKy3U7n3OSYLk5Vwxa8DBLcjOHjpj
	V+dcrcNDnvALhmNPaVKjW2GkZ9RDJes60lZWMcXIm4MLJhytCYvPPHtUKBKpKozCOhTADVYUHgVBV
	MIxNeD+Ho+/enNSRijBbYa6KUBjFpSK5Kv4gp5Egqx8j/aPGvPca44Wy63GEkzEkYgMsiyzs6kMY4
	PYqfGP7ws3k4Aq51Fa+nA7XxvXuVkbh57fqHJSgLkce71jKmye1+IUL9BFclLZsbz4soj3sGzGveX
	E0iTESTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7Rx-0000000CfQh-1hzC;
	Fri, 28 Feb 2025 20:59:13 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6s3-0000000CZuJ-2g63
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 20:22:08 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id C698A210D0EA;
	Fri, 28 Feb 2025 12:22:04 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C698A210D0EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740774125;
	bh=1+ex/PI1EKCfFK1H+WPecE98rrnjNmYMX0MiAFRCvj8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AHwXlfxC/UwT2KDJZxxxubZgc0m3IVcGilsc4NKNEzIU5QifQ07agHrbNmiy942b/
	 rGO0voh/5Ip81GdgnjtJf1upTMe1spMlPxdqIAknZzNZF4SIv/ruxvWbY+bmOnnn9V
	 AkU2wGDVWiIRjauUiCOlel9XnD8iCjZ/Xdt+LH3g=
Message-ID: <9254eaa1-8ff0-4dd6-a443-5f127049bdaa@linux.microsoft.com>
Date: Fri, 28 Feb 2025 12:22:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
To: Roman Kisel <romank@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
 <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
 <8338dd00-3aa4-418f-a547-1c19623358cb@linux.microsoft.com>
 <49a69fe3-fca5-426d-999d-61ee0c8f60f3@linux.microsoft.com>
 <70b62e52-639a-4026-9a52-102d1de46ffd@linux.microsoft.com>
 <212cc582-845d-42b2-89f2-1e9579f752ec@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <212cc582-845d-42b2-89f2-1e9579f752ec@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_122207_729024_8BCEAC71 
X-CRM114-Status: GOOD (  37.36  )
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

On 2/28/2025 9:20 AM, Roman Kisel wrote:
> 
> 
> On 2/27/2025 3:25 PM, Easwar Hariharan wrote:
>> On 2/27/2025 3:08 PM, Roman Kisel wrote:
> 
> [...]
> 
>>> Would be great to learn the details to understand how this function is
>>> going to improve the situation:
>>>
>>> 1. How come the hex error code was useless, what is not matching
>>>     anything in the Linux headers?
>>
>> It doesn't match anything in the Linux headers, but it's an NTSTATUS, not HVSTATUS.
>>
> 
> That is what it looks like from the code, I posted the details in the
> parallel thread.
> 
> Here is a fix:
> https://lore.kernel.org/linux-hyperv/20250227233110.36596-1-romank@linux.microsoft.com/
> 
> Also I think the commit description in your patch
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d2138eab8cde61e0e6f62d0713e45202e8457d6d
> 
> conflates the hypervisor (ours runs bare-metal, Type 1) and the VMMs
> (Virtual Machine Monitors)+VSPs (Virtual Service Providers, e.g StorVSP
> that implements SCSI) running in the host/root/dom0 partition.

Agreed, that was what I was led to believe, your patch would help with that
miscommunication, though not in its current form. See my review comment in that
thread.

> 
>> Coming from the PoV of a user, it would be a much more useful message to see:
>>
>> [  249.512760] hv_storvsc fd1d2cbd-ce7c-535c-966b-eb5f811c95f0: tag#683 cmd 0x28 status: scsi 0x2 srb 0x4 hv STATUS_UNSUCCESSFUL
>>
>> than
>>
>> [  249.512760] hv_storvsc fd1d2cbd-ce7c-535c-966b-eb5f811c95f0: tag#683 cmd 0x28 status: scsi 0x2 srb 0x4 hv 0xc0000001
>>
> 
> It is likely that the PoV of a user that you've mentioned is actually
> a PoV of a (kernel) developer.

Actually, no, it's PoV of the WSL users that are having the discussion in
the linked github issue. FWIW, that issue also occurred in Azure with multiple
incidents coming into our queue because of the unusable flood of error messages.

> It is hard to imagine that folks running
> web sites, DB servers, LoBs, LLMs, etc. in Hyper-V VMs care about the
> lowest software level of the virt stack in the form of the symbolic
> name or the hex code. They need their VMs to be reliable or suggest
> what the user may try if a configuration error is suspected.
> 
> To make the error log message useful to the user, the message should
> mention ways of remediation or at least hint what might've gotten
> wedged. Without that, that's only useful for the people who work with
> the kernel code proper or the kernel interface to the user land.

There's a step between seeing the issue and fixing it that you're missing,
i.e. the reporting.

An issue that says "flood of hv_storvsc errors reporting status
unsuccessful" is better than the same without that status information:
https://github.com/microsoft/WSL/issues/9173

> 
> So I'd think that the hex error codes from the hypervisor give the user
> exactly as much as the error symbolic names do to get the system to the
> desired state: nothing. 
I continue to disagree, seeing HV_STATUS_NO_RESOURCES is better than 0x1D,
because the user may think to look at `top` or `free -h` or similar to see
what could be killed to improve the situation.

> Even less when the error reported "Unknown" :)

I agree on the uselessness of "Unknown" to the user, except as already mentioned
below, as a prompt for the code to be updated.

> 
>>> 2. How having "Unknown" in the log can possibly be better?
>>
>> IMHO, seeing "Unknown" in an error report means that there's a new return value
>> that needs to be mapped to errno in hv_status_to_errno() and updated here as well.
>>
> 
> It means that to the developer. To the user, it means the developers
> messed something up and to make matters even worse they didn't leave any
> breadcrumbs (e.g. the hex code) to see what's wrong to help the user and
> themselves: there is just that "Unknown" thing in the log.

I think Nuno's compromise addresses this very well, to also print the hex code.

> 
>>> 3. Given that the select hv status codes and the proposed strings have
>>>     1:1 correspondence, and there is the 1:N catch-all case for the
>>>     "Unknown", how's that better?
>>>
>>
>> I didn't really follow this question, but I suppose the answer to Q2 answers this as
>> well. If not, please expand and I'll try to answer.
>>
> 
> Sorry about that chunk, hit "Send" without looking the e-mail over
> another time. Appreciate the discussion very much!
> 
> 
>> Thanks,
>> Easwar (he/him)
> 



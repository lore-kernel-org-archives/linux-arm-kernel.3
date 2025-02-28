Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC74C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0FduMPXpF7odq2DR/Ozy+31RaB9icS1pf1FrxFmkKQ=; b=HEbAfHwrhwtP2nx2tSfpoE5lNe
	5ru/9orY3JFSiwfiNomFCvR38Yi2kWqcamkPNkjrC70SPIP3VfQfRUd8PvXIr+L9lM5y0rW9Z+iRQ
	jOuI6CfhTqf67BZLwDhVMwziIWIl4BgmPgbwn2t21HbbKt9u4yaJJdgWex0OkfjFK6t0uIDB74IPp
	roWVT0letFqM0enGi2idLdsCEG1dJE3wZ6g6eUp7WsECmjwevl9y9hK9c/uPhBTDvkdBrb8i4t1tF
	pk4pA/+fcXaFjcuYwylNRKNH/bqY8BxYbAxojVIsguKx6p+x1pSbIRkf1lh68oNwMKxRqp/3ZfvyW
	7dgLBizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno43-00000009FTp-0Oaq;
	Fri, 28 Feb 2025 00:17:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno2U-00000009FHO-24p7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:15:39 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 74A76210EAC2;
	Thu, 27 Feb 2025 16:15:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 74A76210EAC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740701737;
	bh=/0FduMPXpF7odq2DR/Ozy+31RaB9icS1pf1FrxFmkKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bhv8kHy+sgZqzC2QNGG4nkBJZmft7Ae7dPdAa+GFHwR1Y70qp9IFzmSOPqN67MuVQ
	 /Ig2XSXEsKwDNj83vkk5MSOUt2pKbARSLpttnbYR2YKRgUXbUBGMt6DNw0ILfTO2GI
	 o8FAi6neeKcLAEDBGoTLk6TGaC2VoExZGyxFKV3o=
Message-ID: <7ea741fb-9935-42f2-a4f0-99df8df563eb@linux.microsoft.com>
Date: Thu, 27 Feb 2025 16:15:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
To: Roman Kisel <romank@linux.microsoft.com>, linux-hyperv@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-acpi@vger.kernel.org
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
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_161538_585510_32A619AD 
X-CRM114-Status: GOOD (  24.00  )
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

On 2/27/2025 9:02 AM, Roman Kisel wrote:
> 
> 
> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
> 
> [...]
> 
>> +
>> +const char *hv_result_to_string(u64 hv_status)
>> +{
>> +    switch (hv_result(hv_status)) {
> 
> [...]
> 
>> +        return "HV_STATUS_VTL_ALREADY_ENABLED";
>> +    default:
>> +        return "Unknown";
>> +    };
>> +    return "Unknown";
>> +}
>> +EXPORT_SYMBOL_GPL(hv_result_to_string);
> 
> Should we remove this and output the hexadecimal error code in ~3 places
> this function is used?
> 
I guess you're implying it's not worth adding such a function for only a
few places in the code? That is a good point, and a bit of an oversight
on my part while editing this series. Originally all the hypercall helper
functions in the driver code (10+ places) used this function as well, but
I removed those printks_()s as a temporary solution to limit the use of
printk in the driver code (as opposed to dev_printk() which is preferred).

I didn't think to remove *this* patch as a result of that change!
I do want to figure out a good way to add that logging back to the hypercall
helpers, so I do want to try and get some form of this patch in to aid
debugging hypercalls - it has been very very useful over time.

> The "Unknown" part would make debugging harder actually when something
> fails. I presume that the mainstream scenarios all work, and it is the
> edge cases that might fail, and these are likelier to produce "Unknown".
> 
That is a very good point. Ideally, we could log "Unknown" along with
the hex code instead of replacing it.

What do you think about keeping this function, but instead of using it
directly, introduce a "standard" way for logging hypercall errors which
can hopefully be used everywhere in the kernel?
e.g. a simple macro:
#define hv_hvcall_err(control, status)
do {
	u64 ___status = (status);
	pr_err("Hypercall: %#x err: %#x : %s", (control) & 0xFFFF, hv_result(___status), hv_result_to_string(___status));
} while (0)

I feel like this is the best of both worlds, and actually makes it even
easier to do this logging everywhere it is wanted (for me, that includes
all the /dev/mshv-related hypercalls).
We could add strings for the HVCALL_ values too, and/or include __func__
in the macro to aid in finding the context it was used in.

> Folks who actually debug failed hypercalls rarely have issues with
> looking up the error code, and printing "Unknown" to the log is worse
> than a hexadecimal. Like even the people who wrote the code got nothing
> to say about what is going on.
> 
Yep, totally agree having the hex code available can be valuable in
unexpected situations.



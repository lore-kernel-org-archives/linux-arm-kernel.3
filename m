Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFBCC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6R/d69xIPnatoLajwtN5SPNB03Ui7q2MxXbR43k6h6A=; b=MO6vvZEk5DdYH2WZwPnpzHRj7g
	cjzVhSCPk40XDkJV1UffvSQgs5i/leJ1uBEH4vnao6b9qLqixu8rlCitGF1WMkngACM4BtB0J7Add
	afo4O0Dw0+YYCp6w7tqCGMVgUmr4yTUK9sNInix/trfZTDWydajpNf7KVaTRqPczZtG3wWmy3R+/b
	rT9iq/JgdFfot5FdW8fyfASnZ5idpbn1j+b28/ouQpiF0YJUfh/qRRjrjzmXu4JS/8nMT9aMff2zp
	I98cOqcD3DQDMO0G2/wulNA6wYw979h/S77O+9s71bPKs1ubjBbHV1Gdqn21oAnLTmjXoFaFcJ/JN
	z9tf2Gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnRm-00000009Bw3-1MSa;
	Thu, 27 Feb 2025 23:37:42 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnFo-00000009ARl-10XC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:25:21 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id A30CA210EAC0;
	Thu, 27 Feb 2025 15:25:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A30CA210EAC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740698719;
	bh=6R/d69xIPnatoLajwtN5SPNB03Ui7q2MxXbR43k6h6A=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=nUZ5Sq2woTZNa8bIOcVxHVzfj8fnmzJRFv8NcRJhxl7FGKh1FFsM5eMjQkaoK7hz7
	 3M2gjH6gsVfCr3K1Q2F3CZ5tmXjF7N557dC2trMTS+9aTnpNsCkirzR640o1v4r9nb
	 qoy7McOe2AL7Peg/quv8CSv5fL/iZfV0ryBMdo5s=
Message-ID: <70b62e52-639a-4026-9a52-102d1de46ffd@linux.microsoft.com>
Date: Thu, 27 Feb 2025 15:25:17 -0800
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
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <49a69fe3-fca5-426d-999d-61ee0c8f60f3@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_152520_385031_DBA2A534 
X-CRM114-Status: GOOD (  16.69  )
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

On 2/27/2025 3:08 PM, Roman Kisel wrote:
> 
> 
> On 2/27/2025 2:54 PM, Easwar Hariharan wrote:
> [...]
> 
>>
>> Sorry, I have to disagree with this, a recent commit of mine[1] closed a WSL
>> issue that was open for over 2 years for, partly, the utter uselessness of
>> the hex return code of the hypercall.
> 
> Thanks for your efforts, and sorry to hear you had a frustrating
> debugging experience (sounds like it).

TBF, I didn't personally struggle with it for 2 years, IMHO, it was the opaqueness
of what the value meant that contributed to user pain.

> 
> Would be great to learn the details to understand how this function is
> going to improve the situation:
> 
> 1. How come the hex error code was useless, what is not matching
>    anything in the Linux headers?

It doesn't match anything in the Linux headers, but it's an NTSTATUS, not HVSTATUS.

Coming from the PoV of a user, it would be a much more useful message to see:

[  249.512760] hv_storvsc fd1d2cbd-ce7c-535c-966b-eb5f811c95f0: tag#683 cmd 0x28 status: scsi 0x2 srb 0x4 hv STATUS_UNSUCCESSFUL

than 

[  249.512760] hv_storvsc fd1d2cbd-ce7c-535c-966b-eb5f811c95f0: tag#683 cmd 0x28 status: scsi 0x2 srb 0x4 hv 0xc0000001

> 2. How having "Unknown" in the log can possibly be better?

IMHO, seeing "Unknown" in an error report means that there's a new return value
that needs to be mapped to errno in hv_status_to_errno() and updated here as well.

> 3. Given that the select hv status codes and the proposed strings have
>    1:1 correspondence, and there is the 1:N catch-all case for the
>    "Unknown", how's that better?
> 

I didn't really follow this question, but I suppose the answer to Q2 answers this as
well. If not, please expand and I'll try to answer.

Thanks,
Easwar (he/him)


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03377C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9e9a8/heH4xuMeTDXGwYikxUbMHl5ORfY3Jz5KULqs=; b=bYbYIoxMzS1dDW7jOU9hXu4RUH
	33U90cCjIhP8Z9IGYXXxQnsUNCo519AmifZ1ouDorbmrbrV1fUH3HEB/TWvNMWWadWJIMd7i6oHd7
	ACA2eEjMvIXK6/Y6BbFOVTv3j6jI48Zs/db1WpOIp1NRpixLYXtn5wjc+upNqY3LzGwcyED7W9UWU
	dPq8mz/2HWPEkZIBhi01i3LtcCq1NwZEoVxNHIWruhOlDN86GlEKMIb3dxvfBheXxm5rdz9cW353V
	dH2g7ECHbACJyu6PN1JRjXPxmXKJW0NCCAJzCrt0zhepuaLov5ydXkJyq/Qnj9/b4Llyq/Rl5GGc7
	lcH6DoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmnz-000000095oE-01LW;
	Thu, 27 Feb 2025 22:56:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmm1-000000095YU-1rZ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 22:54:34 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 710C3210EAC0;
	Thu, 27 Feb 2025 14:54:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 710C3210EAC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740696871;
	bh=N9e9a8/heH4xuMeTDXGwYikxUbMHl5ORfY3Jz5KULqs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=hWbxuV9PupeHKuyO0Jlff9XgGej1tmlh9xoKKaLTJxZtVX5L3mKrFgoqXUYmhbxPD
	 vPwYqUasVmrF46RL++TMuFhde996cZq4lthnz06yokTUCjvCx7MUfWWgxBWCg+pr2z
	 vGdAotzlyZ6VMqEWaU+OwG9CiA1heCNEpHQ425NU=
Message-ID: <8338dd00-3aa4-418f-a547-1c19623358cb@linux.microsoft.com>
Date: Thu, 27 Feb 2025 14:54:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
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
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_145433_508850_74355EDA 
X-CRM114-Status: GOOD (  15.18  )
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
> The "Unknown" part would make debugging harder actually when something
> fails. I presume that the mainstream scenarios all work, and it is the
> edge cases that might fail, and these are likelier to produce "Unknown".
> 
> Folks who actually debug failed hypercalls rarely have issues with
> looking up the error code, and printing "Unknown" to the log is worse
> than a hexadecimal. Like even the people who wrote the code got nothing
> to say about what is going on.
> 

Sorry, I have to disagree with this, a recent commit of mine[1] closed a WSL
issue that was open for over 2 years for, partly, the utter uselessness of
the hex return code of the hypercall.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d2138eab8cde61e0e6f62d0713e45202e8457d6d

Thanks,
Easwar (he/him)


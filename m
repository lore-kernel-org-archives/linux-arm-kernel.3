Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71815C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoCV5HAJeH3XjGtJFdhDgStkjmGqfA1T4wdKfeu4AsQ=; b=gtLslht3tu7k9VkaPlgy/NatSO
	fj4DrUdLr+6zLTlBOzxNpFuao5WskeESE/9KMgv71bIFHIV71dlYdwioVOkIHCsObs7oF2xlNz/pX
	m/9P/ASJ4SNEJyERN+hv9RLh78YEuJN9XUjO4oP4wzVF3GL6lrRpgv/Hd0+8NuFWYIjFIAHNkCVBR
	puvK/y5C/JRTEjQcIjg0/MA8t7GzeJQM4VYzr5bd+ELscjRz5uor9PU73BTfH4FQ5QFecMoIxUTKj
	Qf3KaUByB3F1wsrIIgj3EOA7vtx7bmEK2PlDZRsDJmgPIayLAApHzv1J7FJMAMV8DmVlv5wvz/PoU
	lozaWmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkB-00000008ZhG-1qXB;
	Thu, 27 Feb 2025 19:40:27 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhH1-000000089zY-3xH1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:02:13 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id F0B68210D0D8;
	Thu, 27 Feb 2025 09:02:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F0B68210D0D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740675730;
	bh=UoCV5HAJeH3XjGtJFdhDgStkjmGqfA1T4wdKfeu4AsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VlV7HjWLGHggF73qzcmagSPrXdyB3Ix7hVmrQTgBusBHr3KadTdfJw7oJ2yXwUk/u
	 kr4aIHEUGfkzWNvvtjBkjAK/7EfisK4p8Jts/+3gCZZGO/f3wovVYe/0X7hvCNX0Nf
	 n+uakKRBuAXNaRCdRUx/ewFxPDYTCuUsc/g4y41M=
Message-ID: <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
Date: Thu, 27 Feb 2025 09:02:09 -0800
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
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090212_012429_A7BB0891 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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



On 2/26/2025 3:07 PM, Nuno Das Neves wrote:

[...]

> +
> +const char *hv_result_to_string(u64 hv_status)
> +{
> +	switch (hv_result(hv_status)) {

[...]

> +		return "HV_STATUS_VTL_ALREADY_ENABLED";
> +	default:
> +		return "Unknown";
> +	};
> +	return "Unknown";
> +}
> +EXPORT_SYMBOL_GPL(hv_result_to_string);

Should we remove this and output the hexadecimal error code in ~3 places
this function is used?

The "Unknown" part would make debugging harder actually when something
fails. I presume that the mainstream scenarios all work, and it is the
edge cases that might fail, and these are likelier to produce "Unknown".

Folks who actually debug failed hypercalls rarely have issues with
looking up the error code, and printing "Unknown" to the log is worse
than a hexadecimal. Like even the people who wrote the code got nothing
to say about what is going on.

-- 
Thank you,
Roman



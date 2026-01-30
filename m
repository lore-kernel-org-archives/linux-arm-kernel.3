Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA63E6BF10
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S587GzR4/YVCY/QYXE0GwuuvvAlb8tY57rX4G8C6bLs=; b=ihCz658g9gQCUZs7OBqo0PWpFq
	dETZcPNg7yUgMebUtue2poJiYtFLvjG6/MaIKi0LQOfYeSr6yl4DbcclMRH06S0RVV+riPUGmaqEY
	y+BXsfhF7rJPz545bxYciX6xe7/FzEw79vXc1s7KhV3hKKJap6yEk5pLnmicGzcfPQFrpnbHRCyVj
	Vy1y2jGKoscygfG04I/41kvfK0mj2/8sOdp9qsrZMlVFbjdl7J0VjZR8SBDml+fUrbMIPjOtlsH3Q
	PaRZUYDmIx5CTO04/ME5atiXhA1D0BnFHMsqNX+C5ksFfhchSkqU9QfwUUGJ/4+57c0SSDefTrU9s
	bwg0v/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlwhl-000000021L1-3hlu;
	Fri, 30 Jan 2026 22:11:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlwhi-000000021Kf-2PNz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 22:11:03 +0000
Received: from [100.75.32.91] (unknown [40.78.12.133])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7860E20B7167;
	Fri, 30 Jan 2026 14:10:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7860E20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1769811059;
	bh=S587GzR4/YVCY/QYXE0GwuuvvAlb8tY57rX4G8C6bLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/p07QActjgiHNcnhmZsRTLUFAuzv8OY9gTXXsPwS4J8GyF4pNSuVniqUb1LpipFK
	 AbRAuJJOuGrsaUNuTxwNkfS+U+w+JqcqBbxv1weBv/3ctrswVNuecYXEVPwC8Ux0xd
	 peGfHlBkqCvfmDGYYOMJ+6xHY4JPa4fGfMIMJcvE=
Message-ID: <ace4f4fd-f328-cfdc-00eb-6751c8c9ebb0@linux.microsoft.com>
Date: Fri, 30 Jan 2026 14:10:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v0 12/15] x86/hyperv: Implement hyperv virtual iommu
Content-Language: en-US
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
 nunodasneves@linux.microsoft.com, mhklinux@outlook.com
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-13-mrathor@linux.microsoft.com>
 <20260121211806.000006aa@linux.microsoft.com>
 <34de2049-912e-fc9e-9fc1-727fade0480f@linux.microsoft.com>
 <20260127112144.00002991@linux.microsoft.com>
 <20260127143119.00006d2f@linux.microsoft.com>
From: Mukesh R <mrathor@linux.microsoft.com>
In-Reply-To: <20260127143119.00006d2f@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_141102_673487_A3324BBD 
X-CRM114-Status: GOOD (  13.81  )
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

On 1/27/26 14:31, Jacob Pan wrote:
> Hi Mukesh,
> 
>>>>> +
>>>>> +	if (hv_l1vh_partition() && !hv_curr_thread_is_vmm() &&
>>>>> !hv_no_attdev) {
>>>>> +		pr_err("Hyper-V: l1vh iommu does not support
>>>>> host devices\n");
>>>> why is this an error if user input choose not to do direct
>>>> attach?
>>>
>>> Like the error message says: on l1vh, direct attaches of host
>>> devices (eg dpdk) is not supported. and l1vh only does direct
>>> attaches. IOW, no host devices on l1vh.
>>>    
>> This hv_no_attdev flag is really confusing to me, by default
>> hv_no_attdev is false, which allows direct attach. And you are saying
>> l1vh allows it.
>>
>> Why is this flag also controls host device attachment in l1vh? If you
>> can tell the difference between direct host device attach and other
>> direct attach, why don't you reject always reject host attach in l1vh?
> On second thought, if the hv_no_attdev knob is only meant to control
> host domain attach vs. direct attach, then it is irrelevant on L1VH.
> 
> Would it make more sense to rename this to something like
> hv_host_disable_direct_attach? That would better reflect its scope and
> allow it to be ignored under L1VH, and reduce the risk of users
> misinterpreting or misusing it.

It would, but it is kernel parameter and needs to be terse. It would
be documented properly tho, so we should be ok.

Thanks,
-Mukesh



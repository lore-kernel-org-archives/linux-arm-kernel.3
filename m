Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3C9C021B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXGH9Z+OdViyLyaeNdj+evSOC05tFiOwgQvPxQsepcw=; b=AuOfalztMiBAR0SBuSOx8A8NtC
	zLS4BGBvY63RtRekacDlZElC0TXPM2VOMmmq5YnHevIj1D1iDsmP3IeSGND/IKZ100Ka69wUpJzmQ
	Q2ILKiK7fUTgWFLY+9T20rXx58CKeVuggV2oL4PMhaIAzo4wFj4R7kSreF3HfCxkU+P1t/9NrjQh6
	4lp8zVSliMzr9fCxKgR7d15j2S7u/AnEci2nXU7gFxuQ7s0FnLaNnyHc/jsu0n3ouPOAb0EL75d+w
	TIXoBB4OJIiVp6CLDU3yXhvXOfjhQCNSVrkmSPgnyCkWzF0ix7OGtF+Cu5BOHHWxW5F7qrE+gernS
	1pvpKXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEZJ-000000033Rf-3fbd;
	Thu, 20 Feb 2025 21:58:53 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEXp-0000000339c-0ND6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 21:57:22 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id A2784203E3BD;
	Thu, 20 Feb 2025 13:57:19 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A2784203E3BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740088640;
	bh=hXGH9Z+OdViyLyaeNdj+evSOC05tFiOwgQvPxQsepcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XtGknKWpWoB+evSUfsY6KBr3Lhb1Ju2CCc638EfX+cLZ0/PDofVE7HCnnownVNu6h
	 4q03qcOPhOmEu8nMMTIoirXxamdOrA8OY90k3D6HNMHI2nfHmrb2v9C7eVGgeTUR9m
	 kpqR+22342pJd/TO0Iag2Y5Yo5rxJLEmTX8xeSjk=
Message-ID: <6e7d0116-82b5-4a39-997e-24143d7d3584@linux.microsoft.com>
Date: Thu, 20 Feb 2025 13:57:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hyperv: Change hv_root_partition into a function
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "eahariha@linux.microsoft.com" <eahariha@linux.microsoft.com>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mukeshrathor@microsoft.com" <mukeshrathor@microsoft.com>
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740076396-15086-3-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB415703DF0CD1EB3523E3C79AD4C42@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB415703DF0CD1EB3523E3C79AD4C42@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_135721_174671_6A8D821F 
X-CRM114-Status: GOOD (  20.67  )
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

On 2/20/2025 11:17 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Thursday, February 20, 2025 10:33 AM
>>
>> Introduce hv_current_partition_type to store the partition type
>> as an enum.
>>
>> Right now this is limited to guest or root partition, but there will
>> be other kinds in future and the enum is easily extensible.
>>
>> Set up hv_current_partition_type early in Hyper-V initialization with
>> hv_identify_partition_type(). hv_root_partition() just queries this
>> value, and shouldn't be called before that.
>>
>> Making this check into a function sets the stage for adding a config
>> option to gate the compilation of root partition code. In particular,
>> hv_root_partition() can be stubbed out always be false if root
>> partition support isn't desired.
>>
>>
> 
> [snip]
>  
>> +void hv_identify_partition_type(void)
>> +{
>> +	/* Assume guest role */
>> +	hv_current_partition_type = HV_PARTITION_TYPE_GUEST;
>> +	/*
>> +	 * Check partition creation and cpu management privileges
>> +	 *
>> +	 * Hyper-V should never specify running as root and as a Confidential
>> +	 * VM. But to protect against a compromised/malicious Hyper-V trying
>> +	 * to exploit root behavior to expose Confidential VM memory, ignore
>> +	 * the root partition setting if also a Confidential VM.
>> +	 */
>> +	if ((ms_hyperv.priv_high & HV_CREATE_PARTITIONS) &&
>> +	    (ms_hyperv.priv_high & HV_CPU_MANAGEMENT) &&
>> +	    !(ms_hyperv.priv_high & HV_ISOLATION)) {
>> +		pr_info("Hyper-V: running as root partition\n");
>> +		if (IS_ENABLED(CONFIG_MSHV_ROOT))
> 
> I'll have to rescind the "Reviewed-by:" that I just gave. There's a patch
> sequencing problem in that CONFIG_MSHV_ROOT doesn't exist yet.
> It's added in Patch 3 of the series.  Because it doesn't exist, the
> IS_ENABLED() will always return 'false', which isn't fatal in the sense
> of causing a compile error.  But the code won't run in the root partition
> because hv_current_partition_type isn't set.
> 

Oops! Thanks for catching that, I'll just move the check from this patch
to patch 3.

> Michael
> 
>> +			hv_current_partition_type = HV_PARTITION_TYPE_ROOT;
>> +		else
>> +			pr_crit("Hyper-V: CONFIG_MSHV_ROOT not enabled!\n");
>> +	}
>> +}



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1533C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeNP9qTG4NblI43yV9gDsR1NWq0U1vL5VHxMC8sh8Ak=; b=lOEJ04zcfsf5/qpV3R8tBIB1O4
	dWxvDvxiUBV4hTiYrb68dLXJylrhh0L5i+VRDKBJ/fqMww9l7/qsh8nc0TgLXtVl/L8iGwTCOoG1x
	cZH9V/iNsfJwbqiHsMYU+X3DqGeVcDQUWXVQxA9D15ibVa29vhVGDef0nR+7zKYNWGr4RgSSehOSM
	DNv8OthBsedbdGIsI6juJBrCR750sebmKTtiPhTanXtiAQGE2in0RXq5mKefLIjL5r9npIxUsdKDZ
	AU1K7udIEAaeEZ/yqoT8YkFGFgHYw33IaNm+dfZOx3d0dUlDyRnKOVnyMNk1WudR2wk87Pj73aoi6
	rpb8sicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsdo-0000000CxZ6-1dzV;
	Tue, 13 May 2025 16:38:04 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsXZ-0000000Cvpf-0zUq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:31:38 +0000
Received: from [10.137.184.60] (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5B716201DB28;
	Tue, 13 May 2025 09:31:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5B716201DB28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1747153896;
	bh=xeNP9qTG4NblI43yV9gDsR1NWq0U1vL5VHxMC8sh8Ak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PxGNd/DdbrmBW7NsLSjWGWpIQwTV5jQXEIrAyEsEvUtoZo91/T7H8HFZ5U+7WAKE8
	 e/EgCpq2DQYeg+7CgV4P+eS2XizEApZfcH24R6hkNyEoAmvcRya+7SItd9iodwFLNI
	 Z66jY48yWnl7EOg9vSwruk0X6yHKwqaeLDB0bAdA=
Message-ID: <a7ad48ca-2346-4039-a3a9-f93317b2d1a1@linux.microsoft.com>
Date: Tue, 13 May 2025 09:31:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v2 3/4] arch: hyperv: Get/set SynIC
 synth.registers via paravisor
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com, arnd@arndb.de, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 kys@microsoft.com, mingo@redhat.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, x86@kernel.org, linux-hyperv@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
References: <20250511230758.160674-1-romank@linux.microsoft.com>
 <20250511230758.160674-4-romank@linux.microsoft.com>
 <323ecc55-d829-4c74-8cb6-7b3a77dd3351@oracle.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <323ecc55-d829-4c74-8cb6-7b3a77dd3351@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_093137_302765_67F07491 
X-CRM114-Status: GOOD (  15.91  )
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



On 5/12/2025 2:39 AM, ALOK TIWARI wrote:
> 
> 
> On 12-05-2025 04:37, Roman Kisel wrote:
>> +/*
>> + * Not every paravisor supports getting SynIC registers, and
>> + * this function may fail. The caller has to make sure that this 
>> function
>> + * runs on the CPU of interest.
>> + */
> 
> Title and Intent: Clearly state the purpose of the function in the first 
> sentence
> /*
>   * Attempt to get the SynIC register value.
>   *
>   * Not all paravisors support reading SynIC registers, so this function
>   * may fail. The caller must ensure that it is executed on the target
>   * CPU.
>   *
>   * Returns: The SynIC register value or ~0ULL on failure.
>   * Sets err to -ENODEV if the provided register is not a valid SynIC
>   * MSR.
>   */
> 
>> +u64 hv_pv_get_synic_register(unsigned int reg, int *err)
>> +{
>> +    if (!hv_is_synic_msr(reg)) {
>> +        *err = -ENODEV;
>> +        return !0ULL;
>> +    }
>> +    return native_read_msr_safe(reg, err);
>> +}
>> +EXPORT_SYMBOL_GPL(hv_pv_get_synic_register);
>> +
>> +/*
>> + * Not every paravisor supports setting SynIC registers, and
>> + * this function may fail. The caller has to make sure that this 
>> function
>> + * runs on the CPU of interest.
>> + */
> 
> ditto.
> 
>> +int hv_pv_set_synic_register(unsigned int reg, u64 val)
>> +{
>> +    if (!hv_is_synic_msr(reg))
>> +        return -ENODEV;
>> +    return wrmsrl_safe(reg, val);
>> +}
>> +EXPORT_SYMBOL_GPL(hv_pv_set_synic_register);
> 

Indeed, I wrote a bit of a novel in the comments which might be
distracting and making it harder to find the point :)

Ought to be more conscious of the reader's perhaps constrained
time budget. I'll restructure that as you suggested!

> Thanks,
> Alok
> 

-- 
Thank you,
Roman



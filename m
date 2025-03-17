Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CF3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z47vl0XJ7IhEChc4ZDP47YOchtvz+VbR9iiUVCc1kw8=; b=w3RQXZL+Qz153CiI9xpi1M3NKo
	EglccQMw9Q2NslkZvgW1x+GPFmuYMvvhCWViKztjO4DC3FYH93I7LHEk0Q8JR9gSia4qHCepqj7Ze
	H5qmYvWa9M1NwXGNu75TpneojuYT1slW4G9TckVe3NjaPkKQOqMtKINkhIKxOO81Ickm8O7ezI8sn
	QAOOcOfEQ8hPyagIIp262c16BuD7hg2OafI76egt5WjIRE8tgRoH+2AaItlDlCq/sW/C7DhljiqJZ
	og3DklNL/w0SCc67ZPZgVgo/h7PB/vQz8k6fOofx6tFnvT3RqutcJhKr8y8oiI91BuRq7R2v07UOK
	gdfqwP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDCp-00000003J5p-16EL;
	Mon, 17 Mar 2025 16:20:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDB9-00000003Iyc-0kQ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:19:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4273713D5;
	Mon, 17 Mar 2025 09:19:06 -0700 (PDT)
Received: from [192.168.3.45] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 194A73F63F;
	Mon, 17 Mar 2025 09:18:51 -0700 (PDT)
Message-ID: <c357e638-d523-4cd2-a15f-ed3b0b41bd22@arm.com>
Date: Mon, 17 Mar 2025 17:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
 tglx@linutronix.de, peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, pierre.gondois@arm.com,
 yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-3-yangyicong@huawei.com>
 <2bd3aa0a-d700-46bf-81d1-a5fb0364d1e0@arm.com>
 <c88e5b78-37b7-3023-7842-56a93fe119d2@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <c88e5b78-37b7-3023-7842-56a93fe119d2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_091903_253632_047F4EE9 
X-CRM114-Status: GOOD (  12.94  )
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

On 17/03/2025 12:29, Yicong Yang wrote:
> On 2025/3/17 17:56, Dietmar Eggemann wrote:
>> On 11/03/2025 08:51, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

>>> Both method support to completely disable/enable the SMT cores so both
>>> work correctly for symmetric SMT platform and asymmetric platform with
>>> non-SMT and one type SMT cores like:
>>> core A: 1 thread
>>> core B: X (X!=1) threads
>>>
>>> Note that for a theoretically possible multiple SMT-X (X>1) core
>>> platform the SMT control is also supported as expected but only
>>> by writing the "on/off" method.
>>
>> Here we still have a little misunderstanding. IMHO, even on such a
>> system 2) would work too.
>>
> 
> 
> yes but only by writing the max_thread_number. e.g. a system with SMT number
> of 1 (no SMT core), X, Y (Y > X), 1 works same as "off" and Y works same as
> "on", as you shown below. write X will be blocked by the CPU framework:
> estuary:/sys/devices/system/cpu/smt$ cat control
> off
> # emulated CPU 0-7,16-22 as SMT-2, CPU 8-11,24-27 as SMT-4
> estuary:/sys/devices/system/cpu/smt$ cat ../online
> 0,2,4,6,8,12-16,18,20,22,24,28-31
> estuary:/sys/devices/system/cpu/smt$ echo 2 > control
> bash: echo: write error: Invalid argument
> estuary:/sys/devices/system/cpu/smt$ echo 4 > control
> estuary:/sys/devices/system/cpu/smt$ cat ../online
> 0-31
> 
> so method 1) will always match the expectation to fully enable/disable the
> SMT on all cores, that's I mean here. But 2) won't work if user expected
> to write 2 to enable SMT-2 (I think it'll will work if we support
> CONFIG_SMT_NUM_THREADS_DYNAMIC on arm64 later).

OK, looks like you're aware of this then. Just saying that technically
'4' would be the max thread number of the system and not '2' so it still
looks OK from this perspective. But OK, we don't have those systems now
anyway.

[...]


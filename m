Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCFAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XSDmssemR4TkQFiq7Jxa4Dv0YRrXqVa8+1ku5HSWRk=; b=Seiza+szN9PUcBWaLdrxxT2zFK
	IaJ7cWRx0irTtw4mleQMs3kbiZ2XJDs2p35c6yG7nl9irHQgnf9RefbLMwvipgp7pSb8LMv9HgFBH
	wpfNEsA24X7RBRXwvjh60roxn5O48ZcGcUpPxzRDGChusWi22WLoAGosN13wdDG7Yi8ezJN0nBHSf
	DZiKb8RkHFo8rI38rXK+c13ITWZ5YqQgh//SPR0d7Q1q6IZaVAs/0GLQyjJBTigBqGrPzOin5rxop
	b2QGAtEf6BjCrhi49beztw296B9QsPK0+QzDl8gCkRyNRaxh+sNmq1ckotk5OOvRtaX5IHh7q4qv4
	SStqtrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOjj-00000003vmP-2bPS;
	Tue, 04 Mar 2025 09:38:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOdS-00000003u7P-0L49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59B18FEC;
	Tue,  4 Mar 2025 01:32:32 -0800 (PST)
Received: from [192.168.178.71] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E86613F66E;
	Tue,  4 Mar 2025 01:32:14 -0800 (PST)
Message-ID: <5435fd87-6209-4896-84cc-27a35ef3cea4@arm.com>
Date: Tue, 4 Mar 2025 10:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>, sudeep.holla@arm.com,
 pierre.gondois@arm.com
Cc: dave.hansen@linux.intel.com, bp@alien8.de, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
 peterz@infradead.org, tglx@linutronix.de, will@kernel.org,
 catalin.marinas@arm.com, yangyicong@hisilicon.com,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 morten.rasmussen@arm.com, msuchanek@suse.de, gregkh@linuxfoundation.org,
 rafael@kernel.org, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com,
 sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-3-yangyicong@huawei.com>
 <8a9aedef-08d7-445f-9b67-85e74ec6bd50@arm.com>
 <21e74021-fb68-0003-f0f4-7f54dd674b9d@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <21e74021-fb68-0003-f0f4-7f54dd674b9d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013222_207144_F4426B85 
X-CRM114-Status: GOOD (  13.67  )
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

On 03/03/2025 15:03, Yicong Yang wrote:
> On 2025/2/28 19:11, Dietmar Eggemann wrote:
>> On 18/02/2025 15:10, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

>>> If a system have more than one SMT thread number the 2) may
>>
>> s/have/has
>>
>>> not handle it well, since there're multiple thread numbers in the
>>
>> multiple thread numbers other than 1, right?
> 
> according to the pr_warn_once() we implemented below it also includes the case
> where the system have one type of SMT cores and non-SMT cores (the thread number is 1):
> - 1 thread
> - X (!= 1) threads
> 
> Discussion made in [1] and I thought we have agreement (hope I understood correctly)
> that all the asymmetric cases need to notify. Do you and Sudeep think we should not
> warn in such case?

Systems with non-SMT and SMT-2 cores are IMHO a special case since for
them the '/sys/devices/system/cpu/smt' interface still works correctly.
And on X86 those systems do exist today.

IMHO, it would be awkward to see the message 'Heterogeneous SMT topology
is partly supported by SMT control' on arm64 but not on x86 on such a
system.

I do understand that this message is more tailored to theoretically
possible 'multiple SMT-X (X>1) core' systems (e.g. 1,2,4).

And here we cannot issue a '2 > ./control' since
cpu_smt_num_threads_valid() only returns true for 1 or 4.

IMHO, I would remove the warning and state clearly in the patch that for
systems with multiple SMT-X (X>1) cores, this interface only support SMT
completely on or off.

Example Arm64 DT:

cpu-map {
        cluster0 {
                core0 {
                        thread0 {
                                cpu = <&A53_0>;
                        };
                };
                core1 {
                        thread0 {
                                cpu = <&A53_1>;
                        };
                };
                core2 {
                        thread0 {
                                cpu = <&A53_2>;
                        };
                        thread1 {
                                cpu = <&A53_3>;
                        };
                };
                core3 {
                        thread0 {
                                cpu = <&A53_4>;
                        };
                        thread1 {
                                cpu = <&A53_5>;
                        };
                        thread2 {
                                cpu = <&A53_6>;
                        };
                        thread3 {
                                cpu = <&A53_7>;
                        };
                };
        };
};

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 3
processor	: 4
processor	: 5
processor	: 6
processor	: 7

/sys/devices/system/cpu/smt# echo 1 >control

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 4

/sys/devices/system/cpu/smt# echo 2 >control
-bash: echo: write error: Invalid argument

[...]


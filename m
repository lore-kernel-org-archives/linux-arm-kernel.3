Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB39D1A605
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAkElEqvuK3lcmA0Lcu1Dy1ULv3lH35onFLQZmZ8LH0=; b=4L/q6cXdIOyVgUSJfcevRP9U/K
	8wuYfj01RQPQaiEruM7ofvKvm1VOOoOlpBLHAc2a0lVcmHpOE0XgncQtM6sdb8lYSmqYMNQN3uow9
	gbO/mxL/XB205iW3Mg464JynsWtPi+FksuC61CkjviXt0/+0TKdNsWY3WhByX5G5L0luSKACK6Ef9
	SJFx6TpUNabn+rOwRHLOQ1dRhmRzfgJNLO/xPHXVHm3TjarvoKqkvr5Fy8rXtwjZm/VzHBjq93B6T
	jpDKkNmlXQ0s/8P4LrroXYa2a9dZecUrjkHRpwCWgjjGfoK/2aqT0Wd9js2Zc5PIl+iq3nwXHaM4J
	3UxKcJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBZs-00000002J1u-01eS;
	Fri, 09 Jan 2026 12:26:52 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBZn-00000002J1N-13zZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 12:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767961593; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=wAkElEqvuK3lcmA0Lcu1Dy1ULv3lH35onFLQZmZ8LH0=;
	b=lnlFb/f1n+wzKdsNqp8GVoKkJB01HmoAe+QyU0rYo/P+D9st807xe7hGXqumulfKZC77LTGLTmnmooX90RulxyrfTuUCr1R9Lv6F+0Pq7mCYHmhMq0aOEjr0kYE6FK4vc5wA3ha15Dx5OfucodxnthvTeCnX4YmuTjCyzx9YVRg=
Received: from 30.221.148.170(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WwgnTgj_1767961589 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Jan 2026 20:26:29 +0800
Message-ID: <1243a296-f018-42f8-9c07-297862fb0f4a@linux.alibaba.com>
Date: Fri, 9 Jan 2026 20:26:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] ARM Error Source Table V2 Support
To: Borislav Petkov <bp@alien8.de>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
 guohanjun@huawei.com, sudeep.holla@arm.com, xueshuai@linux.alibaba.com,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rafael@kernel.org, lenb@kernel.org,
 tony.luck@intel.com, yazen.ghannam@amd.com, misono.tomohiro@fujitsu.com,
 fengwei_yin@linux.alibaba.com
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
 <20251230202211.GAaVQ0cx8o-CqzGU2O@fat_crate.local>
 <0038141b-713f-4024-9f8b-e5f748f5a6a9@linux.alibaba.com>
 <20260109103416.GAaWDZqDYoyt3KRAE9@fat_crate.local>
From: Ruidong Tian <tianruidong@linux.alibaba.com>
In-Reply-To: <20260109103416.GAaWDZqDYoyt3KRAE9@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_042648_213452_04B398C3 
X-CRM114-Status: GOOD (  16.50  )
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



在 2026/1/9 18:34, Borislav Petkov 写道:
> On Mon, Jan 05, 2026 at 05:12:25PM +0800, Ruidong Tian wrote:
>>> What is a "RAS node"?
>> A RAS node is the hardware interface for error reporting and control,
>> consisting of one or more register sets (a collection of RAS records). It is
>> responsible for error logging and interrupt signaling[0].
> 
> OMG, one more meaning for the word "node". Because we're not ambiguous enough.
> 
> /facepalm
> 
>> A single hardware component can feature multiple RAS nodes. For example, a
>> memory controller is treated as a "RAS device", where each memory channel
>> has its own RAS node. Interrupts generated by these nodes are typically
>> aggregated into a single interrupt line managed at the RAS device level.
> 
> Nomenclaturial tragedy, I'd say.
> 
>> Comparison with x86 MCA:
>>
>> RAS record ≈ MCA bank.
>> RAS node ≈ A set of MCA banks + CMCI on a core.
>>
>> The key difference lies in uncore handling: x86 typically maps uncore errors
>> (like those from a memory controller) into core-based MCA banks. In
>> contrast, ARM requires uncore components to provide their own standalone RAS
>> nodes. When a component requires multiple such nodes, they are grouped and
>> managed as a "RAS device" in AEST driver.
>>
>> [0]: https://developer.arm.com/documentation/ihi0100/latest
> 
> Yah, thanks for explaining.
> 
>>> The ATL is very AMD-specific. What does "conceptually similar" mean exactly?
>> By "conceptually similar," I mean that both ARM and AMD share the same
>> functional requirement: translating between a System Physical Address (SPA)
>> and a device-specific address (like a DRAM address) for RAS purposes.
>>
>> The goal here is not to share the hardware-specific translation logic, but
>> to provide a unified interface (an abstraction layer). The actual
>> implementation of the translation remains entirely architecture-specific.
> 
> And why do we need an arch-overlapping unified interface?
> 
> You can just as well have aest_convert_la_to_spa() and none of that "unifying"
> churn.
> 
You're right, that would be much cleaner. I was trying too hard to keep 
the interface unified across architectures. I'll drop the unified 
interface and use a direct helper instead in next version. Thanks for 
the feedback!


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F357C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqvkAwCOsL1hVuT8GV7hCB1OxrgOjfzOsoMOW/vy4SI=; b=QLrMOVGV0ICLHm
	0pMb9TW0JdaLQv8EaqQO7HAPIUd66oeeaui9gfs7Tw1BGJ4pH5HDjQSwbV+YtsfpG5C0QnmoqPE3E
	Pffz0fyGxhbd9v6VvDr44AQYh7n9802pDQLlrujKX/ZxCvIePWxi+7pmQE6TUcZVqveaFteROJtCu
	xyII3FxlHNq82UjhWrWOxK9jZ/GiDAxzxBKYG1sXh1WHtHDEmVGzcEzXTc+cbihGZR+rIL+3ktTBJ
	ML2rLAVmWKrbzDrrY2xhxCEPXSuJaM6GfOlsWWQ19nivYjDTlFZ/N1rePJfJvXvXnZ/YG2r1rnuhq
	xk8YhtvT7I5VL9UnMZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlHR-0000000DyqJ-2esk;
	Tue, 11 Aug 2026 12:08:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlHP-0000000Dypi-2NLx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:08:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC6991516;
	Tue, 11 Aug 2026 05:08:20 -0700 (PDT)
Received: from [10.57.68.120] (unknown [10.57.68.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46F423F86F;
	Tue, 11 Aug 2026 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786450104; bh=nOdG3GEOAIhS+BTOXENo2dxte+PXbMMlKYJCLwWAc2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NvcAZYGj7W1RZOM8r24q6SdYh94WxBwaTQurPr3Fq1AIq9cH3E/KyBRHkRihM7ZHX
	 7aPsCzJCZc4/29K/f2y6XEPFRlowo5i5AzLzHbK3aIDxtRNnhslfqyugbvVXfhuD1N
	 KA01KCxZcCMbV3UETKlJXggohnqtY6JqIWBmEnLA=
Message-ID: <12843f8d-8c70-477e-904b-ba775eed6345@arm.com>
Date: Tue, 11 Aug 2026 13:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
To: Will Deacon <will@kernel.org>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3> <anXqMsJ14r3BAbMG@gmail.com>
 <anYHjvJ1_4dDjuzw@gmail.com> <anm5T9FazACqOWXF@willie-the-truck>
 <2a97f777-d33a-4b3d-8c8c-6f6894f04c29@arm.com>
 <annoxlkkq1NpujsP@willie-the-truck>
 <9b06f274-8db1-48e4-839e-e387c050d328@arm.com>
 <ansIT2PCHq_EKuTE@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ansIT2PCHq_EKuTE@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_050827_697222_0948CBE0 
X-CRM114-Status: GOOD (  13.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, Breno Leitao <leitao@debian.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 8/11/26 12:32, Will Deacon wrote:
> On Mon, Aug 10, 2026 at 05:39:52PM +0100, Vladimir Murzin wrote:
>> On 8/10/26 16:05, Will Deacon wrote:
>>  > So we could probably hack something as you suggest, but maybe the best
>>> option is to take patches 8 and 9 from your FEAT_NMI series? WDYT?
>>>
>> Whatever you prefer, tbh :)
>>
>> Patch 9 codifies my understanding of how things are expected to
>> work. That said, I accept that I could be missing something, hence the
>> RFC tag.
> Those two look fine to me and I already took the preceding changes.
> 
>> In case you decide to take it, we probably need to:
>>
>> - extend the commit message to cover Breno's report (right now, the
>>   commit message makes it look like a refactoring)
>>
>> - add Fixes tags if we want it to be backported
>>
>> Alternatively, I can respin the patch separately with the suggestions
>> above applied - just let me know ;)
> Lemme have a go at picking them up... I'll yell if it all goes horribly
> wrong!
> 

Ready, steady... :D

More than happy to help if those go wrong.

Cheers
Vladimir

> Will
> 



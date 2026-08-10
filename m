Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C72CC5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnjbos51Za84ZPWRFbiDJnG/Ba+BOoloe4dPGytCGus=; b=aGNEXbzCm12bca
	SOIn8FwgtMNBy/HN8lnhcF0s4R9uCzNcZMU+dJrEl6AfguYNoJFfG7VGaIT0MTBJET3uyOROA+LVW
	T/5NrVMvUPTqggWtPws1dxgfGLvpwDAZv+E8GBbyrwBKhijAmW9Od3TzI/qKwxCCVAV1EqeEZ9x9g
	jz6iGpD6+YTkiFTGoW09l6o1ng0enJ1o4m3ecTtSbngBkwH03AHBJLZKA+YYz6Ev81Fd6omSyh2tH
	iSgaPHQIEgtWtNkWsMHw1034PwJj0Izo0POiQSQZ9y1rSRl1sMpmny0cOgW1REN/NSFyicl7mdwl0
	KKN2WTUPVH6qwmI9g03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPgF-0000000BrFH-236s;
	Mon, 10 Aug 2026 13:04:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPgC-0000000BrEc-1A4D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:04:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D80F41477;
	Mon, 10 Aug 2026 06:04:30 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351C93F632;
	Mon, 10 Aug 2026 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786367074; bh=hlXJomjLgBXp0Ul7Z1Job3/bOI0RHCPuj7WyA5oymnk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vTbMpWMYAlu1DOrMZXzzJmdoxgfgdTRRrk7V2ZRJq8vKD5PqjeUrNU7umCA44YSp1
	 CJFqn1/65rrwYMEbAZrpeC/KF0mYp6G6z9ydg7gwt+mMMZ8zAQnutoTOBj6ZOVXXD3
	 b2HeKsmZEXfHoBDuVnPMGN0K82GgS7tqsl0c1Kf4=
Message-ID: <3e5f1532-ea17-4994-8cd0-5ce1d42e9049@arm.com>
Date: Mon, 10 Aug 2026 14:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
To: Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Breno Leitao <leitao@debian.org>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3> <0c47125b-6a5e-41c9-b31c-d78643cbe6bd@arm.com>
 <7b16d183-86d5-481e-b212-977ad0598ac7@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <7b16d183-86d5-481e-b212-977ad0598ac7@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_060436_365053_7CCCAC2D 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 8/10/26 13:44, Jinjie Ruan wrote:
>> Agreed on the need for a clearer explanation.
>>
>> Perhaps local_irq_disable() isn't the right API here, and we should
>> use local_daif_restore(DAIF_PROCCTX_NOIRQ) instead?
> The local_irq_disable() here is pair with the local_irq_enable() in
> preempt_schedule_irq(). So I think it is not correct to replace them
> separately.
> 
> The pseudo NMI does not consider how to do local_irq_disable() /enable()
> when the interrupt is masked by the DAIF.I bit as I reported before.

Unless I missed anything local_daif_restore(DAIF_PROCCTX_NOIRQ) would
clear DAIF.{IF} and set PMR to GIC_PRIO_IRQOFF which is the state we
expect from local_irq_disable() so we can do local_irq_{en,dis}able()
later on.

Cheers
Vladimir


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE2EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c64JaDaV6ECA1xhld7oCdozfda9VS8MooXecoHKFhHI=; b=qeroumW8JgrOTOu2Y+zJ9ddNQW
	WBE5satAwzb5NWrwAPsKXjaSwYNB+LjNzwlq6TDSh68P3bcZO41sw4oKlFUMj6wD5yrqAfyW8gZCI
	AnL6mW2UjGxOSArKdiXy8XmMcyGoyHn/1ky/7h57bWqa6Ljz/Liu4pbgzaxmM8iXMxDccjez3/9D1
	g1+TIRWcZWlCL2Xh6m9s6WucV+v4O3zIYLfCxlTPE9xavScXckJhihm1TtVSDyV6fWE3KTdXsdow2
	btYPsxcGk2tGq0dsgfZVNOcfldw/Cn8T2/RFdwHiJhWOJX0wPzHgbDY7faCt1NPFto4AesXsHfSDz
	CffOyk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwh0-00000003nLj-2JS4;
	Fri, 16 May 2025 15:09:46 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwH1-00000003hNT-2Hnp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:42:57 +0000
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B2E5FBBF31;
	Fri, 16 May 2025 14:42:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id E08FA19;
	Fri, 16 May 2025 14:42:49 +0000 (UTC)
Date: Fri, 16 May 2025 10:42:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>
CC: Gabriele Monaco <gmonaco@redhat.com>, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, john.ogness@linutronix.de,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
User-Agent: K-9 Mail for Android
In-Reply-To: <20250516140449.GB13612@willie-the-truck>
References: <cover.1745999587.git.namcao@linutronix.de> <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de> <20250516140449.GB13612@willie-the-truck>
Message-ID: <3E29A42D-8A6A-4342-8C60-2BEF1EDCD640@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: fwwnh447t6mutbrmj9ubf4jooxi931wy
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: E08FA19
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+36P2fhVcgnroof75qoF9SN8UIqAFV4Kc=
X-HE-Tag: 1747406569-593877
X-HE-Meta: U2FsdGVkX1/rJz6ABQ1M8TIvkNuAzUINTERmcuNlJj2x1fELWAjnH7lQfAVhELL24XkGy9kmwrwdnkjVrou5VOZjQ17wqMAclrNj3DlF6WNjtsFUccLbUPcUgDQO9ki9jxH21hIajoME2RyLrlWS+IEfzvmGx33+TyzIUSpsLo7kaRHf8ZG+70PSvSjxWcGB2rt+b6B5fqecJBnerXVJ50YNZgrMrNv1gku7mayGZw8PDblh2anVDXPkgVJPqO2zJwhLXkRPnlh5H5h4IpEdvuP48qNzyxJOdRkdsUNksXyR7SnXlnA2RR09aFa8GQV6Upv7tK7OakR2jJzyJdhoLtm+6VtuBo4n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_074255_637945_C582A0F8 
X-CRM114-Status: UNSURE (   8.82  )
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



On May 16, 2025 10:04:50 AM EDT, Will Deacon <will@kernel=2Eorg> wrote:
>
>> +	if (user_mode(regs))
>> +		trace_page_fault_user(addr, regs, esr);
>> +	else
>> +		trace_page_fault_kernel(addr, regs, esr);
>
>Why is this after kprobe_page_fault()?
>
>It's also a shame that the RV monitor can't hook into perf, as we
>already have a sw event for page faults that you could use instead of
>adding something new=2E
>

Perf events work for perf only=2E My question is why isn't this a tracepoi=
nt that perf could hook into?

Tracepoints are made to be generic, whereas perf events are not=2E

-- Steve



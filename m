Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0691CFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWEp3vPM9oHHrXo0a4SYBugyipdbCtP06g6AkOcLzNo=; b=HbszLMQ5C5PzTvpqqiKuePPlVg
	HufnU4ldkGYB92tXA91MMALhML6PeH6Rn8fOVZT1KNAxjl4v59+/+5katiquNK/bmased4vjt+V9P
	jYkyb15XmcH8odMMXhVs2SmtGQYe9kDHA2fQNvydrUnC2S8Ih2e/IOLiEJeXRYRDC5a5rSD24+l9u
	CPB1+iShg+p+3vBvINlaoZvM49GNPfFGHR85sRB5zPrknw9h0xT6MofH5qDFvlAPhclNkk/N/4RTx
	Eq738pRXIDiYTQGLT6xZqtB38bimYne+BcuISSP+zrvBtX/7tAUYkgTcRvFYu0ZIYQGjiFy8nPtKR
	mWTuNSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa65-0000000C52v-0QVK;
	Mon, 24 Nov 2025 17:11:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa62-0000000C52V-3HPf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF0C14413B;
	Mon, 24 Nov 2025 17:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F528C4CEF1;
	Mon, 24 Nov 2025 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764004285;
	bh=bWEp3vPM9oHHrXo0a4SYBugyipdbCtP06g6AkOcLzNo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=T7PUyzdcYOjYhbjL+noP71iMLU8qCNV4cVOJ/3rJKP8WjNW1x4z3T6+ZZtTcS9Haq
	 s6vahxmY3XasEIi9II3M+gLfrS24ITj/yUv3VWqrA++GwfiuH6RXrStGykTjTztoTf
	 KeToYQ2GnMQTh3y6C9TOYK7GtjGXAcrmRwora7MppvsGsQdV2BoNMakYpfKchhbsUk
	 Exdp3ErPxTI0X53u/lgExx9u67FY6q9WuKhctfH0J6eLLzYtFG8xHqmSkeAb5TWg/r
	 R3PAEx4ag7w0O5LKZ0zoNIdlR0TcVU0Z5ijT1ZJam14GdQQf0lN9aFFMePyJeoy8S5
	 gEwAy1kpPyfuQ==
Date: Mon, 24 Nov 2025 09:11:23 -0800
From: Kees Cook <kees@kernel.org>
To: Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
CC: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
User-Agent: K-9 Mail for Android
In-Reply-To: <aSRtaVjfNc11EtKg@willie-the-truck>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com> <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com> <aSRtaVjfNc11EtKg@willie-the-truck>
Message-ID: <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_091126_840530_C8213504 
X-CRM114-Status: GOOD (  16.36  )
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



On November 24, 2025 6:36:25 AM PST, Will Deacon <will@kernel=2Eorg> wrote=
:
>On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
>> On 17/11/2025 11:30, Ryan Roberts wrote:
>> > Could this give us a middle ground between strong-crng and
>> > weak-timestamp-counter? Perhaps the main issue is that we need to sto=
re the
>> > secret key for a long period?
>> >=20
>> >=20
>> > Anyway, I plan to work up a series with the bugfixes and performance
>> > improvements=2E I'll add the siphash approach as an experimental addi=
tion and get
>> > some more detailed numbers for all the options=2E But wanted to raise=
 it all here
>> > first to get any early feedback=2E
>
>FWIW, I share Mark's concerns about using a counter for this=2E Given tha=
t
>the feature currently appears to be both slow _and_ broken I'd vote for
>either removing it or switching over to per-thread offsets as a first
>step=2E

That it has potential weaknesses doesn't mean it should be entirely remove=
d=2E

> We already have a per-task stack canary with
>CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
>do something similar here=2E

That's not a reasonable comparison: the stack canary cannot change arbitra=
rily for a task or it would immediately crash on a function return=2E :)

>Speeding up the crypto feels like something that could happen separately=
=2E

Sure=2E But let's see what Ryan's patches look like=2E The suggested chang=
es sound good to me=2E

-Kees


--=20
Kees Cook


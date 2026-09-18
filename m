Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F22FC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOzOdR9Dgb9ug7ABYVlGK+L+i1z3UtyHNtJ++kQhWy4=; b=q8ErBBgD+8cdyV8q0PkYkBEA5s
	9KVDI5lZXlZAmAyv0LNcBnpK1cadFNbespcj/CtA5X1qHsXGbrhIPiS7bxrklq0CekYC8ga9sLS6w
	m4DkGjA8v3xQydjZM2MOybESkRJs1I9iz6Rz5a5nBVVRRFIKRW1mFin5dITKaCDZVzlnnumajAxYT
	v7Jknk7M1WzTSqUqkg3tGL5em4DyGPGr10U8g8KKTAIyyU97GZiYFTKyNQQmuB6SiwFSJ0L5NSY/4
	Bf/Qj9xp2nXtWBvZM96OOPkWmWYrOYk0HuRq+QDaVr5RfyfnngDpzzK5kPr3z8/W9XHhfw3bneVcY
	02jWBeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aZJ-0000000EtJS-3Ni7;
	Fri, 18 Sep 2026 15:32:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aZJ-0000000EtJF-0EV8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:32:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30BFF6057A;
	Fri, 18 Sep 2026 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1E71F000FF;
	Fri, 18 Sep 2026 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789745523;
	bh=uOzOdR9Dgb9ug7ABYVlGK+L+i1z3UtyHNtJ++kQhWy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eovGOh8Av9TcbchgCOYIOuOMAYojGlgSXHqc7vxl0rNyG8pgXDhaknNvzG6HRFPBK
	 OKc5SxxVCOfINrNh3b8rXr3i91xuVAvpnUssX0fWe0INOCg66vx21eEuFQWsrap941
	 MKaKp3McYW4mow3ZOfkI0frYIvDw6rumkj7ONHScNv2ow8qzyMMYFsoNgd2+qj74ss
	 oYEO/UwKnHjhMxV5xlbCgSWefKLUbjCqvqP89CF9c55ToRBTeWC8j9wnuXCaHT96PF
	 mSFu01gWQWcSVWr40k2mBKAKKbpquvFEhNEpSs6D4jih6hI8SpK2iQDz00WIhyfVjh
	 Dq8FnAbBqrT+Q==
Date: Fri, 18 Sep 2026 16:31:58 +0100
From: Will Deacon <will@kernel.org>
To: Ya Han <hanya8186@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, catalin.marinas@arm.com,
	liuwei09@cestc.cn
Subject: Re: [BUG] arm64/sched: hard lockup with rq->__lock stuck locked and
 no apparent owner
Message-ID: <aq1Zbo6XofYytAEL@willie-the-truck>
References: <CAMg_TGOZPtzzZviZ+pre=_XMgX5rs0CaaVn3GhvM4qwKr=Kk2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMg_TGOZPtzzZviZ+pre=_XMgX5rs0CaaVn3GhvM4qwKr=Kk2A@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 12:42:24AM -0700, Ya Han wrote:
>    Kernel:
>    5.15.131-5.xxxx.aarch64

Sorry, but you really need to try something more recent if we're going
to help you with this.

Will


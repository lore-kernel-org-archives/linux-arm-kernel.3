Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F81BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anAXTn2WVNJfQBijdvlVjx89L+KjLxZQUrMBMBAvn58=; b=TUA3H1cu0aBwauv0uKd/lDGi39
	3KbxUDq8bdvmPnxlAq5MMp1S1p0QJIRS3zO7N3Rsvum0BhbeJhgNuxUt2F/8n7/bm16Cq0XkYtkUv
	yt5v20yCbhVsC2eEhEJAeMitjzg3I/cR7nRvX+C4gIcwJLBRSn6HSQBE8JRaSuc17HviJM3Vd8bXS
	5q1W+eudbzJeMHBEoSHOpRkmPRZoWiUb71SI/OqCojZxNNbWxU7X7OleqCEypILwgr13M5s4X6fAY
	ACWU4ji87/ZFuJEEgzk4adx2Y654yYJZyBgeYgpMCyLBfH3uyW3EJqO1qf5yhgihea8y+U+w7Eh2w
	IpuffPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtSk-0000000DK5e-1eBz;
	Mon, 04 May 2026 13:35:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtSi-0000000DK4u-1LoO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 13:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 962C244057
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 13:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7554EC2BCFD
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777901751;
	bh=anAXTn2WVNJfQBijdvlVjx89L+KjLxZQUrMBMBAvn58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lm8czak3ojKL/iSeFyCXKqI7NTDydVsOyB2+Hmt8nIK2EusB+d4Z4frGvii94dCYM
	 jWu0DSEVVN+bGYmtnqjUZ613RrBl279QTX5Q4GXGY/7uhrANxd69oXqVhg4v9RhlDr
	 j0Bf6ACKU0YROCTpFS5awmkcjdKqVuM+Cdbkq4OknL3HDQb1DpvjyXBC7KufyhvzqD
	 7zI8a4XUxzPdXMbnVIlJrXSGL14ML23Gg2KG7zpTnsaZSKWHibluTUhcKe4kIIwY+6
	 YESTlho5Ct6TbII6iOg1nmDm+rg+TnF6JT9MWtZidEiRLMooEyQHzB5HaaV3YK9SH9
	 zy3fy169eVGyw==
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso24892976d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 06:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UYM9z3FmbGOgmqQFUg2viBGyJEEQCjZoxfyZRfKQlsl15Y9LjCMBYNh/y3pTQ9qFvL8nz81FqOhJELXWVsU0d@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt/5l2cWjJUC7B+ouMUEhvPIiN5mIjqMYDQlcn0dkS+ORZ7j73
	Dua5M4snIIe+7mGf1CHUIaHkuKSvO9HvyRKvOfWiDGg9GzQ0khAWeajlcb6sdQoJ2/sOy3Ak8TW
	9q3HIZbTNkvLuB2to7p3A1lkoI0wXuLQ=
X-Received: by 2002:a05:6214:260a:b0:8ac:4fd1:2d4a with SMTP id
 6a1803df08f44-8b668a259e6mr167277966d6.33.1777901750649; Mon, 04 May 2026
 06:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
 <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com> <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
In-Reply-To: <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
From: Barry Song <baohua@kernel.org>
Date: Mon, 4 May 2026 21:35:38 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zBiRTttf1nR0Ni9BRT3Cv5XFZhyYP8oipFodpS7saGwQ@mail.gmail.com>
X-Gm-Features: AVHnY4I0u-Qbkg0vrggpRHSUVs_cQpUa3gydJwrEbvTBOzz3MxeuFlaWucVZXHg
Message-ID: <CAGsJ_4zBiRTttf1nR0Ni9BRT3Cv5XFZhyYP8oipFodpS7saGwQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_063552_409145_B443B308 
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

On Mon, May 4, 2026 at 9:04=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
[...]
>
> > > BTW I'm not sure I quite understand Barry's priority inversion proble=
m
> > > since I'd expect all threads of a task to generally be treated with t=
he
> > > same priority...
> >
> > Exactly not. Maybe these slides[2] and this project[3] can give
> > you a hint=E2=80=94they aim to standardize things on Linux by
> > learning from Apple OS. Basically, tasks are classified
> > into five types:
> >
> > USER_INTERACTIVE: Requires immediate response.
> > USER_INITIATED: Tolerates a short delay, but must respond quickly still=
.
> > UTILITY: Tolerates long delays, but not prolonged ones.
> > BACKGROUND: Doesn=E2=80=99t mind prolonged delays.
> > DEFAULT: System default behavior.
>
> Again, this is a clasification of tasks but not really of threads in a ta=
sk
> so at least for VMA lock there's no inversion so have?

I=E2=80=99m specifically referring to a task (i.e., a thread) when
discussing scheduler context. It may be clearer to use the
terms process and thread explicitly.

In a typical process sharing an mm_struct, each thread can
have a different priority.

In an Android app, some threads handle the UI and require
higher priority, such as the main thread and RenderThread;
otherwise, frame drops may occur.

The Linux scheduler can control scheduling policy and
priority for each thread.

Thanks
Barry


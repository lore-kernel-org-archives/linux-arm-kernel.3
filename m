Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B065CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI1Q4vEGNEU0fE/E9tkpqE9hUY1F8qMwgptcgzPih7c=; b=v/5vUvcA/NINhyzIDu6mojchYQ
	L7b0kC7OE6xH+m7F3/F98SHhrsE4/NC2gkr9sZGGd7uO2p87ENRN5/3X6TbfUqLE2VzTQaWLzQyTN
	4okT8fOTTtXSxGDHI7iz7XR7Cb8tWoHroiid1H3Yqhc6LclYFR/9f7Fxc2JBD2SAtSLpWq1Rm32uW
	ywwkwRQcAgX/ECCsLawUV1B1o+iFU4EA2uDrL7xWb+45UBxOE3BM1RpDeELP64uSwdrUX5t/oxXuG
	63k9w29wpd9iSaxW24P5U+y1g8YqtbpKCoNmClM5Vy5cbSrMNwWc9Q2ODBKsIp133IVHWYjpV1JV4
	nh9WzpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6dn-0000000EDzq-2SqM;
	Mon, 15 Jun 2026 12:42:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6dm-0000000EDzM-2n2x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:42:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 584D240416
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA1B1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781527330;
	bh=kI1Q4vEGNEU0fE/E9tkpqE9hUY1F8qMwgptcgzPih7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VvU1+2TE/oOlezw2t4z08IOzMXU7gfxjJ2hHTHOtxRLzHU0N4fQ9YYs9FeSSDFF3l
	 46T11svpgrygwqax/Dq7dlfa30CE+ibdATh7DHq0Buv42dQ96l76fJxwtPeJ3SG8kF
	 9HqDZAuhqQ8GF1arR76D/Fiflc1uX29VkGsrUMsbmqABsug9lQmX7I3Cpi0E7ZHtcO
	 kh3znysoz8EwqhvwYszDpy+Q2ZDj7MZCbYB+x1WEsxFZpBLV0GSgrDKCYGIPO6ZypY
	 tRS42/7TgZbKrcNNCLmsomdOrzuxtXXsgV0fixnrUZIMKXTdvGuX7hACR7hlISNGkW
	 4JYyvXaw9n6jQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso2972030e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:42:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YzP2ek7xt0AfEyufdB3lV1HynLZAZ3Icga/GR9aI8LKk05iVvxU
	C1WC6VEQyxadkmsZGvzmdu218PRqW8WE7p2lSXwOT1xJhkqpg06tnaodQHpzmBCqQmOAVbK0b+g
	6ymBCUZPBUYUXxozfxWvukG4DYSGKP+k=
X-Received: by 2002:a05:6512:2314:b0:5ad:abf:1e19 with SMTP id
 2adb3069b0e04-5ad2db2bf27mr3545999e87.6.1781527329057; Mon, 15 Jun 2026
 05:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260511011504.77760-1-enelsonmoore@gmail.com> <CADkSEUiGDsGxh-qxqHMbmvCRF=VNmh2VyT9Ko7sj2Eau-sTWxA@mail.gmail.com>
In-Reply-To: <CADkSEUiGDsGxh-qxqHMbmvCRF=VNmh2VyT9Ko7sj2Eau-sTWxA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:41:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLm8e1ZXk0TrCQmETdbPwOfkAXnH1Ktt5KZM9_6B2__skg@mail.gmail.com>
X-Gm-Features: AVVi8CfLxNuROrpQvnuv7jG0XP6DPpDUo-akX1IXiICj2p42gtzu828zbNXZjjY
Message-ID: <CAD++jLm8e1ZXk0TrCQmETdbPwOfkAXnH1Ktt5KZM9_6B2__skg@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: move reserve_lp[012] handling into affected machines
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Jiri Bohac <jbohac@suse.cz>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Jun 14, 2026 at 4:20=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> On Sun, May 10, 2026 at 6:15=E2=80=AFPM Ethan Nelson-Moore
> <enelsonmoore@gmail.com> wrote:
> > arch/arm/kernel/setup.c contains code to reserve lp0/1/2 I/O ports for
> > machines that can't possibly have these ports. This code is only used
> > by netwinder and footbridge, and is small enough that it can just be
> > moved into these machines. Do so to make the setup code more generic
> > and the machine code more self-contained.
> >
> > This patch is an RFC because I'm not sure if using .init_early is
> > actually necessary. I did it to match the place the original code was
> > called as closely as possible. Can anyone weigh in on this?
>
> Hi, everyone,
>
> Gentle ping (+ cc Arnd, LinusW) - anyone have any thoughts on this?

My general idea about this and the other patch for sparse IRQs
was that I wanted to drag my Footbridge (NetWinder) out of the
closet and boot with these patches to make sure they work.

I just haven't had time, and it got buried pretty deep in there
I think...

Yours,
Linus Walleij


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78359C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njDMlwwUjrHXZJhnlxUW9cltbD62DWGi6t9OJ+YlVIk=; b=fvfg6+8Cr5cIVUOwaQ2cDnc5o6
	O3K4olE5bLub5XS5HY906hDgVqlCKxWH79uPmTBmcqoqavJTkNg4ybUbnSxaIzBucqCzThDWNV5TQ
	XQOZNrYKai7+LRA3iUzFxU9745X5YV4xw87RD3YSw1hYEvdpLIiLSHCdGgTr13BLM6b5fWP0oAjhQ
	8vjR1s7I6R8lF+E/Lksa+2hhlYkmEjBqmERi4Y7H3POhkntlAEpIbYV5nU5e4oKq5JXOA3X2uO42J
	lUhS1iKkd2mPBnQpY7BC7KvnNgKjPoNgprdpkFQlrBxXCJJ9nrPkyEOa/F3iHFPzg23DCZcKQq4mG
	HMD2EHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyya-000000079lE-345D;
	Wed, 29 Jul 2026 07:45:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyyZ-000000079l6-1aL2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:45:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF21260A9B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8651B1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311114;
	bh=njDMlwwUjrHXZJhnlxUW9cltbD62DWGi6t9OJ+YlVIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hvJbwWEk1wDJE7TCgcNdKpdwDRIu1W6PoTdSnh/RV+9zK/l5333jglBvwZqAhBLth
	 5ft4NXICyK5+5IOxAD15zNN2jp0ZSZE5qqrv5BJ0TzcOALo1M5wJWVrnfLTIbG97EW
	 x1pigRMhyySvq8qCu1mLfOziedjFqgp/aky5bia1NM6tZ/YXx8Krjtav79gRWMHHsF
	 D3YsgHuItwfQKADUz+DyvPUAQt78+sAn8YsCZosaN6wEqZcQt56SAJZUgzdHh0kMBM
	 Nuop3BaKf5rGk2PRnBdFd8xyzWJ7Tryq8nahuHIvcQZVF9rLsIO5lrZ7Vo7RJZsXaO
	 e2G670YdDUyMw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so5434601fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:45:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RohWa8q2OL2ZHOCsRYy2EDfOq25EBKMIiObMI0VB/uI+Ei/rbzp2dfr6neqMV3+KIg4qPwvlMGBqx9r1AcMyB9F@lists.infradead.org
X-Gm-Message-State: AOJu0YyBj0CLj9yAhNyskISA3Htr+IpiR2OskZqS6Hpi0v8fuWm7OWP6
	PV4i+X2JB02y6h5LCn6GR+Vjdv7KOFn9pSv4YBERLBlcr2wrpBxH3iKzasWVg03RLGeacQmkzur
	3itfWT1UWQ2olOj9X8eGco7RPOgf3fcU=
X-Received: by 2002:a2e:bc82:0:b0:39a:ec7b:6ccc with SMTP id
 38308e7fff4ca-39f51e7e76emr9843921fa.27.1785311113316; Wed, 29 Jul 2026
 00:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org> <20260724-zinitix-modes-v1-1-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-1-f6df7d86a878@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:44:59 +0200
X-Gmail-Original-Message-ID: <CAD++jL=QfXJ78pfKy1hV6wGfSYzERUi=-nmqjPfMiXr9xk5+aw@mail.gmail.com>
X-Gm-Features: AUfX_mybtqZ1t6TZw4bPWVPdjZ4BP7r6xZ4c1gUK05ScOPIPKt8w7HC1bwxjbdw
Message-ID: <CAD++jL=QfXJ78pfKy1hV6wGfSYzERUi=-nmqjPfMiXr9xk5+aw@mail.gmail.com>
Subject: Re: [PATCH 1/5] Input: zinitix - check all available fingers for
 every touch event
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
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

On Thu, Jul 23, 2026 at 9:24=E2=80=AFPM Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:

> When this initial driver was first added to tree, that is, in commit
> 26822652c85e ("Input: add zinitix touchscreen driver"), the touch_event
> struct had a field called finger_cnt. It was supposed to report how many
> fingers are touching the screen.
>
> But then, in commit e941dc13fd37 ("Input: zinitix - do not report shadow
> fingers"), some touchscreens reportedly exposed a bit mask for the
> fingers, instead of the count. So the code was changed to bitwise
> iteration.
>
> With my testing on the ZT7548 touchscreen of the Galaxy J6, I find the
> former to be true. This shows that there's two valid methods depending
> on what hardware the driver is made to work on.
>
> One solution is to implement both methods, and use some flag to select
> between the two. However, this introduces more implementation overhead,
> and a possibility of regression on devices the driver is expected to work=
.
>
> Instead, unconditionally check all fingers. The finger_mask field is now
> left unused, thus serving as padding bytes in the struct. For each
> finger, zinitix_report_finger() is called if the status reports the
> SUB_BIT_EXIST bit, so phantom fingers are not going to be a thing.
>
> Moreover, the android driver [1] does exactly that, so it's a tried
> method of implementation.
>
> Link: https://android.googlesource.com/kernel/bcm/+/23d376ef33aa4c500a5ea=
24a290f029d5f8e2de3/drivers/input/touchscreen/zinitix_touch.c#1942 [1]
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


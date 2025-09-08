Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7498BCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpB5tNXBjyOovnphQdFXz5SaIPdBCpYHvTLfm99HsZs=; b=tUTCU5g6isIQGAVC5tHPpCAUxZ
	2AkdROutRFNIRApyAFkD+8KCzR2pea73Wp5lu7+3liEXzX4vyUlq57l5QQQPXSj6o2k6ImRIlaipz
	X8Ge/QXzRCS/VMAnt6cQAEsR7BQcDLeJuWEt1JH3+3e2OUxLVukCivVpl/r1kxqtfxrjMJSuGYQLC
	EZ+ZogAvsB+P6uZwrwT7S0zEiYZsWgriiokGp/VhrwJLLNGkvH5nxepj5AVWjjWbDnpNAiy9OkHCY
	v1sVix0SaVF8+BFCq0k1gdhpTm3ByG8W0fmxp+MKfZS06lJrolyTQGOrcWp9RgF2nT/ur016REthY
	U/Ws+l0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvibW-00000002EAd-2WEa;
	Mon, 08 Sep 2025 20:36:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf3l-00000000s8t-1GQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:49:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8233601EA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 16:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEB7C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 16:49:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Vv9fpBv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1757350177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpB5tNXBjyOovnphQdFXz5SaIPdBCpYHvTLfm99HsZs=;
	b=Vv9fpBv6zOVNc2wiXzUH8hqPT6/w9QKa42prXd24TRVkuGq0vms78eRkV0/+5GmHSeQT0u
	or/xt3dOnIUEUBJWkn/794RW0z1Z1G+xf5zTtotCA37n/G11BfLwVJH0fUxsbvr3WRq8mI
	V16AkEUbATUXANihR8D2O9swr/NmZWw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17389eb4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-arm-kernel@lists.infradead.org>;
	Mon, 8 Sep 2025 16:49:37 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6218f23ab18so197791eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 09:49:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVc8YweHjo0tCKWrwBlESudCw3ea+c7TC9obAXE8RxjUqSDvWf+Y97LNLtqo/7EH3nyUEIo16sge3xCxy669CyK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhmb1YhWjAJXOW1TF7++GXlGkxhEofX9PLXZhJHycbhl2qv9Ib
	hBBnN1Lka088G0cY5Ah5hVNsLizKZ4sp6wPNpbAZXgVcHEh8+Oxcr/1Dy1qgfik8M1BnmvzxB+I
	k9/NpUX0SZQ+IfZ9VA3DjMGUmvLgjbQg=
X-Google-Smtp-Source: AGHT+IG1k1MmnF81J1Vo2jmXSIx1yHc4qgVkpm2QOFlj3gX2CeXc8Y5S0Gow70vJKvxabq0LnsYZB9vjl73O/LZxUXQ=
X-Received: by 2002:a05:6808:15a0:b0:439:1c13:4585 with SMTP id
 5614622812f47-43b29a8995amr3903338b6e.20.1757350176315; Mon, 08 Sep 2025
 09:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250906213523.84915-1-ebiggers@kernel.org> <20250906213523.84915-13-ebiggers@kernel.org>
 <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com> <20250908164706.GA1331@sol>
In-Reply-To: <20250908164706.GA1331@sol>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:49:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9q3qa2ZmPrZWAe5tkWp2xGgNd=1BBx0APa_ACb3=bo-1Q@mail.gmail.com>
X-Gm-Features: AS18NWCGPRb7OwMUI-tVEiz_hU1uUOJpyLd0OY7Ve43ZcitTO73IQk18snpDrbA
Message-ID: <CAHmME9q3qa2ZmPrZWAe5tkWp2xGgNd=1BBx0APa_ACb3=bo-1Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig selections
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Zhiqi Song <songzhiqi1@huawei.com>, 
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
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

On Mon, Sep 8, 2025 at 6:48=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> On Mon, Sep 08, 2025 at 06:35:04PM +0200, Jason A. Donenfeld wrote:
> > Hi Eric,
> >
> > Just a small nit -- would you commit this with the subject line all
> > lower case, like the other wireguard commits?
>
> Done.
>
> > By the way, I have been reading every single one of your patches. It
> > didn't seem like it'd be useful for me to respond endlessly with
> > Acked-by/Reviewed-by, so I haven't. But I have quite actively been
> > looking through these series. Thanks for doing these cleanups and
> > reorganizations. This patch here especially is quite the relief...
>
> Thanks!  I think Acks/Reviews would still be helpful, as it shows that
> someone else really read the patches.  Maybe you'd at least like to send
> those for the cleanups for the algorithms used by WireGuard?

I can do it for everything I read, I suppose. I care about a lot more
than just wg, anyhow.

Jason


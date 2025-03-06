Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD055C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7YyaxuyjzZE9rRVT+aVgEUuE6f/mN7Q1m2L/2ehXpc=; b=fTvOE1IYzykHnoq4PhvBAWuUeH
	svlck9QOwhHxEk9LcYP1YxnU6sQHruFa/zAGU6wOa+6u6q7ZQDxjLO/vo8utqpeNYLa24gUZlxYPu
	E0KsUcSGKOktaw81FY4KlK3gY6iknd2ouGzUubjhmDhu6xTtDtt0nkWu7Ff213eh6TQuyXzlIzFv3
	+u+yvALLWaO+0szMutMXxDz3DtMHSRXv38mPM1k5HQ75tVW4eqGnrksV0cvdo4El3SXM8J9qGZ8QL
	rVlOAL+nYiRw7rw/tO+XQyk3rgXXGPDkFIK10c0f1FjigfuUHZq10WpsxxccS11b4O6GborQPaUcB
	fbxGmI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBat-0000000B6LA-27rO;
	Thu, 06 Mar 2025 13:48:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9XI-0000000AoBB-0rGV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 11:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=J7YyaxuyjzZE9rRVT+aVgEUuE6f/mN7Q1m2L/2ehXpc=; b=nonbztPWM6p9rqJR2hNrcNFSUn
	5Wbs21AgAfHoGWiF1uvMgCL8QWH+IjziX4iNj13idfwWmYsqAPvE6CthQ3mNDfuP73KFVJjFaGgCA
	7wanqYmXa3mvG7bWUTq7MNK6NLWpv0c878BLY+2X9eT65PNU1nkymiUzmStflN7HuvySKYfdZT9wx
	VsIO/BF8u9SfZIiUzDiriKP/Por28pDGueRrbCbchhO23qaQb5pOTxdIM+d+uPthZVWWJkkzhjPjM
	sT5VSAGoNvVQgc+EhylxTRPcknrurOj0XYclrKW4fe+nyJqCpgR19HLSFj1rl3Mmn3wK6C0PClGPG
	sKC5zoqQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9XF-00000008ADU-1SZq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6ECE6A43E6B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 11:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8576FC4CEED
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741261019;
	bh=J7YyaxuyjzZE9rRVT+aVgEUuE6f/mN7Q1m2L/2ehXpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKzo6U209sNppYHc6sLdNcpyjyK6SqEQnFg0sdVpTiwIlDzaWElb4aACfqV07f0DS
	 MP4IxKYG4uxqb7HfH1z15wrpRANN/sxA7rUdePL+JwAVM7XQ5K3QvRApdWyaT+2q6h
	 K6sV0pGTnNDhbeOkYMwcmGe95/alky+/VV50Nxnb45VIpTWuPR09Fbrb+yYLHCZTub
	 ZZRP1eKkDZClNJKz0R0RpKyHRr2PQPe/1tEGP6/bvykyEcjtv6P+Ig+X8LsJ7e+83t
	 Uo4J2oR3eE6j/Jf4QaqjExxhBk/n5qzzau0wKGyP3bL5jw+4rHiaK9ot+YOJfUjiWc
	 nugrFRR0MnXSA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5494cb8c2e7so641013e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:36:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAzc0JaaXXsVkRn6E5eBMi1/7gPRQgFDb9U5RBy38zoRCp/VZLxBRaObFx7tnJwolldBkvTo4WJnqs1AR0NDar@lists.infradead.org
X-Gm-Message-State: AOJu0YwZFcmKJxjtFBJ8qmMOawLUWTqOsk6l5AsfjlK9NHgDNwuJoT9E
	INbEnGfh04x3r7Gm2MQiJHmP71gvAdgtDHkdpxqYfx5V23fNBo9ZPoM63DfjswwfSUfO4txvnjT
	Gwx21T+wpAQZbmddFRkEZGcURZJY=
X-Google-Smtp-Source: AGHT+IFzAyFRwVte8Hotabo7FMYBd05dZcaElxdlKllY9eUVFhjtPLRMD29Y6HH4VN6rZ8EcX8AQhANlE5QfwByaun0=
X-Received: by 2002:a05:6512:3ca2:b0:549:4ab7:7221 with SMTP id
 2adb3069b0e04-5497d382feemr3061824e87.50.1741261018116; Thu, 06 Mar 2025
 03:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20250210164245.282886-1-ojeda@kernel.org> <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
 <CANiq72n=95jgJs17NFAkit5uzxqtO9xij9Um3ybd_RiMCpFrDQ@mail.gmail.com>
In-Reply-To: <CANiq72n=95jgJs17NFAkit5uzxqtO9xij9Um3ybd_RiMCpFrDQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Mar 2025 20:36:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQC5Q5EQjuvMEWS5NAs-pixj3b--rkCHZ=xGQDTHqBBFQ@mail.gmail.com>
X-Gm-Features: AQ5f1JreRF_M4JISf0E2-xc60a7758UzryRd2z_zSk0dC77hJQoqe1lml4uhHqY
Message-ID: <CAK7LNAQC5Q5EQjuvMEWS5NAs-pixj3b--rkCHZ=xGQDTHqBBFQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_113705_473338_41069216 
X-CRM114-Status: GOOD (  13.41  )
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

On Sat, Feb 15, 2025 at 3:48=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 14, 2025 at 2:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > Do you want me to pick it up to kbuild tree,
> > or will you take it with my Ack?
> >
> > If you go with the latter,
> > Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks a lot Masahiro -- happy to take it on my side if that means
> less work for you.
>
> Cheers,
> Miguel
>

This has not been picked up by any one in linux-next.

I applied this to linux-kbuild now. Thanks.




--
Best Regards
Masahiro Yamada


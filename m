Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7FEEDB7D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35utQv1mJDn/+FVHA9rap7AYG4gs2p36qLIotZXtT0g=; b=DHS9y/b7iJrpP2GdBnzpLzgyW8
	D0SarEPChUMnwCK2CsrqfHu2mLxLmo4WoSeBLAEoDo4t5pa+OA85uiExJTNmHmEtiLRPif6Zxqz5r
	ulCK31CzBxwoJ1ruth3bZXZ0+rBmLsaqlRD8k1wJ7tWxyAliORQTVi46+dsAjnKhrr9uPCkGOEewP
	NCiasQlmtYlPR0t95M1HBB9H9ZvvKodxzawj690T8O/nYjdvflqOEKqW5EXz2cpNvWWgT6IiYnrX+
	FXU66XIWgs+83wRX2BE289+uHmGr3bi7zQWOX9/66R/DofnVr1p1JUU+GsWmotWEJQfaQAEffKYtb
	rllYCi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2hG-00000006Dlb-24HF;
	Tue, 07 Apr 2026 09:26:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2hD-00000006Dl6-3nVo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 112BE44234
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 09:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA73FC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775553966;
	bh=35utQv1mJDn/+FVHA9rap7AYG4gs2p36qLIotZXtT0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kwPOA/g+hTcTrDkQ3laEHU10cLlf8nRjTe2c/DeUoh57DV38a/+blLLBZSpSLjiVS
	 r7ZKEzbXxarw4uZeLSCuq3iKW2smXGmJyRUz/OX+xJzybsU7w7No+QOqxGdAqk2kdB
	 poe038axHQ+y8PtKbcWHg6z2iNz/SZM8SqvEQUD0g3nS0K6nWf6CfJKs3FtnuMYKED
	 j/191VqiOgd7PKAk614SOJTgGSTBH5sL/RO9m3nQ9vyI+QIevdr9slunsImKLiVHKJ
	 rbnA3ZuevAh8ecHFpTBGKwqSQH2eFXeoTiFzE3TfrysAvIfUV0dB8wxw4zyByijFfs
	 33ZKgUcGHH6Hw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7a469383e0bso31135137b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 02:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI9XzQPO35bfKMGbOLp7d0pIRbymRuEMHusUUurseVsNj2Td6Ov/luphv5lVemrXmCjxm5Mu+37YyX8QRzcgwz@lists.infradead.org
X-Gm-Message-State: AOJu0YxmGQ8emTKugxZf+ibRB2PXRUQpZQONiZwGK3yepF4iimGKnYTq
	E7xEBVDS66aJzhAfrSnx5XsNYsu5uJ+y555bI/R31WWOX2Ox5DmrAhEE75GkGQNgiye/zqfDoFh
	oUbT+mWEI9xxQgXNi289SV6HDRVSSduo=
X-Received: by 2002:a05:690c:dc9:b0:79b:e346:980c with SMTP id
 00721157ae682-7a4d625504fmr162419117b3.12.1775553966242; Tue, 07 Apr 2026
 02:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org> <ac7YJPo4Np2zxxEp@arm.com>
In-Reply-To: <ac7YJPo4Np2zxxEp@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:25:55 +0200
X-Gmail-Original-Message-ID: <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
X-Gm-Features: AQROBzCOCkncZm_JCfvTszNJbimlQJbAZxhLdXzaXBoMHZTRztuKC4ciORt69b8
Message-ID: <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
Subject: Re: [PATCH] arm64: clear_page[s] using memset
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_022608_010967_1963A361 
X-CRM114-Status: GOOD (  21.99  )
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

On Thu, Apr 2, 2026 at 10:57=E2=80=AFPM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
> On Fri, Mar 06, 2026 at 09:57:50AM +0100, Linus Walleij wrote:
> > There is no need to try to second-guess the compiler when
> > clearing memory. Just call memset() like everyone else.
>
> Hmm, that "like everyone else" made me think - why not move this to
> generic code and only the 1-2 platforms that need their own should
> override it? Could we do the same with copy_page()?
>
> Sorry, more work all of a sudden ;).

I actually had that planned, I just wanted to know if this would
be fine for arm64 first so that there is a user.

It seems you are on board so I will send a 2-patch series
next.

> > Since memset() already has an architecture-local MOPS
> > optimization, we do not need to do anything else to preserve
> > the MOPS optimization.
>
> The custom clear_page() had the (very small) advantage that it can skip
> the length/alignment checks as they are always page-size.

Yeah, it seems that is so fast that it doesn't really matter.

> > While at it, implement the shorthand for directly calling
> > the new prototype clear_pages() for larger page chunks.
> >
> > No performance regressions can be seen, the fastpath
> > benchmarks differences are in the noise.
>
> I assume the benchmarks ran on real hardware (had to ask, last time you
> mentioned qemu ;)).

Quoting my own commit message hehe:

> No performance regressions can be seen, the fastpath
> benchmarks differences are in the noise.

This was tested on hardware with Ryan Robert's fastpath tool.

Yours,
Linus Walleij


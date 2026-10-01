Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C3ACA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmVFF1nXCXJO244kYT0wDxxDBN+y/dJyhYK3aGkTJlY=; b=e+IHLAGLTXbqNW
	/nLStTaFZFKj9HeV+TVDVhzi1kRdqUtj4HbCYPwtRYjv8S4CgitlOtkoOcdzFz93gc+VoDhPna5ZL
	nmRlZwj9dUu9qGQKfb4OSBvZpsm5NICLenbuDxzOUWPsohwzwQBHLJkEZP73gBNgzoNiFpqxCEiBf
	mBE4pUpLP1aUdS/7FfLOfZvyg0joU7UtUKHMzIHlYLt5e08yuylyWeRG1CUC6rppSqvF7kbqDACz5
	ImWmUnwUVzFf/mtp6slxUS+dsyg/noYJpZyfgPRalWi0oSmbIM4b3zTQevRdlfEv8jTGq/1sm7c1V
	Qt1D9nH4qOoZxMf+yF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCF4W-00000008eAV-3UeQ;
	Thu, 01 Oct 2026 11:35:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCF4U-00000008eAA-39PU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:35:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34F3A60A57
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 11:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DBF1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854529;
	bh=lmVFF1nXCXJO244kYT0wDxxDBN+y/dJyhYK3aGkTJlY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jwXMABLGDse/lPscqO8TloE6bDUdUuDr0fKdSPAdYGQKZ+tXWPZQ97pjoHNbXokTX
	 86n3XtKkEXGx2oAJ/hhsn97FYrqQ+t/thnaTN8GgBbIxY7hd9UBeo1dYsQVn+6brP3
	 uyCLaIKVdrhkS3fNOLseME8si8m+JGSZx0Nql5Rq+JPiLMOXTneIWshUuu4xXLHD2T
	 Bbx7S0RgRnW2iY0rBMUucUZip1Mwt+3dr5o/BQecBrnYhguAhFj5GxzlIVXyAsODn2
	 fw6d93oNQiPPtl8IzcXpvcnydx1c+Yxtv8fkgsAPpyrf/abIvFgpoRIS0CcQlEtZ0H
	 Tm+xqultb0MhQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba43157c71so965383e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 04:35:29 -0700 (PDT)
X-Gm-Message-State: AFq9FYI74BrGEwAmJYANqX/yFxqlAmKV07t4VXsAYb6XBaZ2EkcJ6uNI
	Q5SW2A9cLtBms5xzQUnUZePrp0z82fff7oYj3ko8VG43nJA23CFFHDHlxtfuYATbrc6Zm9l+RLD
	ApvA3oheSQPYKVLSqvqFETh6yk64Xbcc=
X-Received: by 2002:ac2:5930:0:b0:5b8:f816:ec70 with SMTP id
 2adb3069b0e04-5ba405f57d1mr1355745e87.24.1790854528685; Thu, 01 Oct 2026
 04:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
 <ar4LWGJ_qfV71_Ia@willie-the-truck> <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
 <ar5Ex6nNxmdgzbva@willie-the-truck>
In-Reply-To: <ar5Ex6nNxmdgzbva@willie-the-truck>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 13:35:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ujWPMdXGtuq=TF8vct=fB=Lpzj+mNzX6VD1Srro2Hhg@mail.gmail.com>
X-Gm-Features: AclHuK8I67CQYv5b9ACMbbIAsFozd-dw4qbwbLd-GEz-j_rLU-8nMqq0lUW0FN4
Message-ID: <CAD++jL=ujWPMdXGtuq=TF8vct=fB=Lpzj+mNzX6VD1Srro2Hhg@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
To: Will Deacon <will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Oct 1, 2026 at 1:32=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
> On Thu, Oct 01, 2026 at 10:38:22AM +0200, Linus Walleij wrote:

> > > > This patch gives me panic, and as can be seen from the review
> > > > comments need some love...
> > >
> > > Please can you share the panic message? I'll definitely be reworking
> > > this based on the review comments, but if there's a bug it would be
> > > great to see the details now!
> >
> > Haha. I was not referring to the kernel function but the emotion ;D
>
> Oh! That kind of panic is easier to fix :) Are you going to LPC?

Sadly no. This year looks great but I'm just not in travelling
mode for the moment. But later!

Yours,
Linus Walleij


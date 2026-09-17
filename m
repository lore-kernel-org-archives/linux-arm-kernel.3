Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7CC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6B9j/a1/s4fshEJb5EzFOlgfCFA7frpy0VX2srAiwg=; b=WAIa/soqGAcfm8rgyIPXq4AtHy
	xqF5itWavXmF5gko2yL5eLI21HxaIEZBvZjpQJWub2ANzZo9DSAmtUz7yU4I9ncUOwkYPN6/5E47i
	TRN882Oeb0tQC010/IJYsCimWa/kq4Jbgf+6l7P1UbhT3BYNAZjVihXlMbpo2+vnfVD3YnnKeuKEV
	c1+pGPBl8QIE4dXhKQ82vhzvFuixsUNB5vI3iMrIxyUB1xzpqKiVdlQvXaJvj3FG2lu3xTUcKI49b
	IgZDgqQeJPnijZmN+M4pc0bPHdjD6eMjwik7CDGa6N0ZiJzBG9T5l90pc0rlcB9bSe8VWyI5YocvF
	d5th+ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ACc-0000000BB3U-2dk4;
	Thu, 17 Sep 2026 11:22:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ACa-0000000BB3A-2uG9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:22:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AAD642D76
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29B81F00893
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644172;
	bh=n6B9j/a1/s4fshEJb5EzFOlgfCFA7frpy0VX2srAiwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TXiXYNpabvSqHPTuVy63UzlukAP9rW3YxZn68xoZHUgyHw7UYnxU5Qi1d3+f96V5e
	 F02mqfQ0pDCExHmUmcF5lPKldiyNFr41olfeSh3y5vdzPOBl6Lfag8kwxpbWDNAx44
	 jEG/vybZryl02Mcyxq67Dv/ZEDQHg5WtfNZcWKFzkfVtX71DBRW6BpPJNPm5QJXWi2
	 P7O5MDIxS325W+D7YNh05nZuASiwbgkSVzXKVIo7N3XVcaBq5xwJxetGX2i1IIdrud
	 UWlRlcQdHpj+jW9rLUUxdGWDY1ob+Tv08ZjzavvUVtnsA/cF3qTeyR2azgeb18s3be
	 gvOG0s+xZvzjQ==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so401998f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:22:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKpAcY9lb5dqRAkCb7VgE7cUO8893QncXuwt8wrv0CM9h1IHPKtM12Zswb7FKE/cklfOUUvedgWKpQLZ25soCR@lists.infradead.org
X-Gm-Message-State: AFuF++k9VDnvdJjmkyPWSQxJGTRSYgH0HNq/aZb12CCOdUZekkjKoyN2
	fC07syYo7a+qcozATODMKPpM3a4yNvgovm7KpWBrFIZR1HnxODnmWnmvBLxpcza/KBQP1b9EoW8
	zQ4clx6//vvDPNgk0fr2LuRXJZSyWYek=
X-Received: by 2002:a5d:5c89:0:b0:484:3310:f39b with SMTP id
 ffacd0b85a97d-4870d05a853mr8600400f8f.28.1789644170593; Thu, 17 Sep 2026
 04:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org> <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
In-Reply-To: <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 17 Sep 2026 19:22:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
X-Gm-Features: AcwNN1VkQt2KJ9LdNhZ0s1HMZyJ-GB0dwEmH64lRQnabSIV5TmddFI50VGPY-Rw
Message-ID: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it consistently
To: Radu Rendec <radu@rendec.net>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
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

On Mon, Sep 14, 2026 at 3:53=E2=80=AFAM Radu Rendec <radu@rendec.net> wrote=
:
>
> On Fri, 2026-09-11 at 03:27 +0000, Guo Ren wrote:
> > This series removes the implicit assumption that RISC-V supports exactl=
y
> > eight IPI message types.
> >
> > Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
> > BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
> > separate IMSIC_NR_IPI definition set to 8. These values happen to match
> > IPI_MAX today, but neither is the proper source of truth for the number
> > of RISC-V IPI message types.
> >
> > Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_MA=
X
> > directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
> > IPI_MAX.
> >
> > This also makes adding future RISC-V IPI message types independent of
> > the current eight-entry assumption.
> >
> > A follow-up patch renames the MediaTek VPU mailbox terminator from
> > IPI_MAX to IPI_VPU_MAX. That token belongs to the VPU firmware IPI id
> > enum and should follow the same prefixed convention as IPI_VPU_INIT
> > (and SCP_IPI_MAX on the SCP side), instead of reusing the generic
> > IPI_MAX name.
> >
> > ---
> > GUO Ren (XuanTie) (4):
> >       clocksource: clint: Use IPI_MAX for IPI muxing
> >       irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
> >       irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
> >       media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
> >
> > tip-bot2 for GUO Ren (XuanTie) (2):
> >       riscv: smp: Move enum ipi_message_type to asm/smp.h
> >       riscv: sbi: Use IPI_MAX for SBI IPI muxing
>
> I am confused. Thomas merged your entire v1 series a week before (see
> the individual replies from tip-bot2@linutronix.de). Why are you
> sending v2?
>
> Patch 6 was not included in v1 (but it's clearly related), so perhaps
> you meant to send only this one as a separate patch?
>
> Also:
>  * The cover letter should include a changelog, indicating what changes
>    were made in each version compared to the previous one.
>  * Patches 1 and 2 carry a "From:" tag that attributes authorship to
>    tip-bot2, which is wrong (if these patches were to be applied).

Sorry for the noise, and thanks for catching these.

You are right on both points. I missed the cover-letter changelog,
and I should not have resent the already-merged patches as v2. The
"From: tip-bot2" tags were added by b4 because those two patches had
already landed; that is useful as a reminder to me, but it should not
have been left in the patches themselves.

I should have skipped the b4 v2 flow and just sent patch 6 on its
own. The only remaining change is the mtk-vpu IPI_MAX rename, which
is needed after IPI_MAX became visible from <asm/smp.h>.

If you are willing to pick patch 6 as-is, I would appreciate it.
Otherwise I will resend it as a standalone patch.

--=20
Best Regards
 Guo Ren


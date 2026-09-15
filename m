Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2108C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dVu5sGWbQKQwOma7Xi4cL5jAvE0AQRc4TSNUprY5+E=; b=00XCRTrCoT0pV3
	CdHyFBWanyOO4w9Lmw3L4uCdv0/nyvh7x8xAydoM1DNcz6q+F6fnopunlYusiww6XxPUgx3kxV7fD
	nn93eGXFphwHKic7/9z0wqOev5wbRlHEAqtAzcMCIaYgSKxz1AqXKzRC09ipKdNKecsBhfK9gLg+a
	uhv2DtQSIWewXe7Fm8GlYb1fKAX77Fwew9L153Q5xvlAehEdMVc7ebKvmab6RR4DRe/wLREjtLHHa
	5h+pnr559q06/6JwOAetWAjD7TZitl868/HSnSUy1s5ZF/xkxj8hSUsv1fnYObiwR2B+88SYFsCnG
	aZKMbmLfPQoQC4O7oTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uu4-000000078D4-0ATR;
	Tue, 15 Sep 2026 15:17:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uu0-000000078Ce-488f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:16:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B939643E11
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9545D1F008A6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789485416;
	bh=+dVu5sGWbQKQwOma7Xi4cL5jAvE0AQRc4TSNUprY5+E=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=IKwXBujtiq0ha8T8DARsdFuYpzysYWxzbW6bLVocjyfaygL3QUFjlIlnjANxOABKp
	 Ngl1Etijj2DojJpbizndyMWR3OebPB6Mm+oeCZuWoA7mLvY6pWQnpKPYwhyQseoUKx
	 BzWGozlyBravBMTPky+8ZB5upHVF3TnIUYsc/U0R9T+pTKzV662v/utcqELTzHan9E
	 iJJVt+ebOLQ+c5IesLnkKr5OOhxKacD7M4xUU6FsiKzvQQcxI/VlUJ2GXQTcPcf5pF
	 1FeTNO7ljgNnbFPg8VA0kgD9A/7tE5jofhG44fV502PzyJWVRzwNBzbWhBWtV37KJg
	 bTn4H+p6ZOjuA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f18010so3486091e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlXiB2N0WKl8PZphjA9uKUsyMBIRLBMtTWw9wP8vg5ZwB90vk1PdZ/XVe6bW7Sj2cixSOJK4BaWZh4La2Ocdzq@lists.infradead.org
X-Gm-Message-State: AFuF++kz36Vyx1Urch9Nwe1hJXM3oINT98oDjuBXhbB4/iXi8rdfTMle
	YoxSH3fzisCB182tyK3ETxy16bq3WbAre9MXhCKgUO4bmRZzV9HVovRIpykgQYckYi7pDLwvkxi
	sFsV3xcTLWyQgkDAX0T9XBqyZvmCq5Rw=
X-Received: by 2002:a05:6512:114a:b0:5b5:e53e:5710 with SMTP id
 2adb3069b0e04-5b8ae662458mr2061203e87.2.1789485414817; Tue, 15 Sep 2026
 08:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <nIKN_benRn2Bk8SDZrkMCA@gmail.com> <86943057-f5b4-4fae-9172-45f13814494f@kernel.org>
 <0r4us4OeRRWtJhxvps-bZw@gmail.com> <b1f03d81-85db-4303-89ff-64440b6e1890@kernel.org>
 <4709b24a-f421-4c81-a023-c37ea66c88bd@arm.com>
In-Reply-To: <4709b24a-f421-4c81-a023-c37ea66c88bd@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 15 Sep 2026 23:16:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64d-UOdKkDF9u62NB-a5EsFLQckUH1hoqDbmz7eE7wQiA@mail.gmail.com>
X-Gm-Features: AcwNN1Ua9fzIlsNRznQ7xIwsHTsfTLXcvWghC51yBM4u0ScR5WKMEqw88iUtY7s
Message-ID: <CAGb2v64d-UOdKkDF9u62NB-a5EsFLQckUH1hoqDbmz7eE7wQiA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, conor+dt@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, krzk+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2026 at 9:39=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 6/16/26 05:51, Krzysztof Kozlowski wrote:
> > On 15/06/2026 17:47, Jernej =C5=A0krabec wrote:
> >> Dne ponedeljek, 15. junij 2026 ob 06:28:54 Srednjeevropski poletni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> >>> On 14/06/2026 16:08, Jernej =C5=A0krabec wrote:
> >>>> Dne ponedeljek, 25. maj 2026 ob 14:10:38 Srednjeevropski poletni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> >>>>> On 24/05/2026 23:33, Chen-Yu Tsai wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> (resent from new email)
> >>>>>>
> >>>>>> On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> >>>>>>>
> >>>>>>> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> >>>>>>>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>>>>>>
> >>>>>>>> As it turns out, current H616 DE33 binding was written based on
> >>>>>>>> incomplete understanding of DE33 design. Namely, planes are shar=
ed
> >>>>>>>> resource and not tied to specific mixer, which was the case for =
previous
> >>>>>>>> generations of Display Engine (DE3 and earlier).
> >>>>>>>>
> >>>>>>>> This means that current DE33 binding doesn't properly reflect HW=
 and
> >>>>>>>> using it would mean that second mixer (used for second display o=
utput)
> >>>>>>>> can't be supported.
> >>>>>>>>
> >>>>>>>> Remove layer register space, which will be represented with addi=
tional
> >>>>>>>> node, and replace it with phandle, which will point to that new,=
 shared
> >>>>>>>> node. That way, all mixers can share same layers.
> >>>>>>>>
> >>>>>>>> There is no user of this binding yet, so changes can be made saf=
ely,
> >>>>>>>> without breaking any backward compatibility.
> >>>>>>>
> >>>>>>> There is user. git grep gives me:
> >>>>>>> drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>>>>>>
> >>>>>>> which means this is a released ABI. As I understood, the old code=
 was
> >>>>>>
> >>>>>> We held off on merging the DT changes so that we could rework this=
.
> >>>>>> I can't find the actual request though. It was probably over IRC.
> >>>>>>
> >>>>>>> working fine but just did not support all use cases. Why this can=
not be
> >>>>>>> kept backwards compatible?
> >>>>>>
> >>>>>> AFAIK the "planes" block is shared between two display mixers. As =
the
> >>>>>> commit message explains, this prevents using the second mixer, sin=
ce
> >>>>>> only one of them can claim and map the register space. And on the =
H700
> >>>>>> (which is the same die as the H616 discussed here but with more ex=
posed
> >>>>>> interfaces), there could actually be a use case for the second mix=
er.
> >>>>>
> >>>>> It explains why you want to make the changes but not why you cannot=
 keep
> >>>>> it backwards compatible.
> >>>>
> >>>> I guess it can be backward compatible, but I don't think it makes se=
nse.
> >>>> Yes, original driver implemented original DT bindings, but there is =
no node
> >>>> which uses that binding. If there is no user of that, why would driv=
er
> >>>
> >>> Did you check all out of tree users of the ABI? All vendor kernels,
> >>> forks and all of them for which the ABI was made for?
> >>
> >> Since when do we care about out of tree users? I understand that drive=
rs
> >
> > Since always? That is the meaning of ABI. Otherwise there is no point t=
o
> > discuss ABI at all. Why would it exist if you had all DTS inside kernel
> > always matching the code?
>
> In general I would agree with Krzysztof, merged binding means we need to
> stick to it, but in this case I think that would be over the top. As
> Jernej said, there are no users, since we didn't commit on the DTs, and
> the DE33 graphics support in the kernel (bindings and code) is
> incomplete: it's really just the mixer, but no other components (TCON or
> output PHYs) required. So it never worked as such.
>
> In hindsight we could say that we should have never merged the bindings
> without having fully working, reviewed and accepted driver code, for the
> whole display chain. Which we need to do because we create those
> bindings based on reverse engineering efforts, not by looking at
> documentation or design documents (which we don't have).
>
> >> must support old device tree files. Once they work, compatibility must
> >> be carried forward. But that's not the case here.
> >>
> >> In any case, vendor kernels have completely different DT structure. Th=
is
> >> was developed independently from them. Take a look at [1] how BSP DT l=
ooks
> >> like, specifically Display Engine node.
> >>
> >> Of course there are some distros which grab WIP patches from mailing l=
ists
> >> soon after they are available. For example, I know that Armbian carrie=
d old
> >> WIP patches which used old ABI. However, such distros generally don't =
care
> >> about exact solution and ditch patches as soon as proper solution is m=
erged
> >> upstream or even when better WIP patches come around. DT files in such
> >> distros get updated alongside kernel, they are not hidden in firmware.
> >>
> >
> > I am not talking about BSP. I am talking about out of tree users for
> > which we defined the ABI and called it that way.
>
> If you are looking for DT users outside of the Linux kernel, this is the
> result of a quick check (list of users from ChatGPT, checks by myself
> with git clone/git grep):
> Zephyr RTOS: no graphics support
> FreeBSD: no H616 support
> OpenBSD: no H616 graphics support
> NetBSD: no H616 support
> U-Boot: no H616 graphics support
> Barebox: no H616 support
> TF-A: no graphics support
> OP-TEE: no (Allwinner) graphics support
> EDK2: no Allwinner support


We really need to move forward with this.

Are there any concerns other than backward compatibility?

As Andre already pointed out, there are no other notable projects
implementing the old, incorrect binding.

Out of tree users such as Armbian are likely cherry-picking WIP patches
from Jernej's tree or the mailing list, even the current stuff like this
patch[1], and they can and will continue to do so until the stuff is merged=
.


Thanks
ChenYu

[1] https://github.com/armbian/build/blob/main/patch/kernel/archive/sunxi-6=
.18/patches.drm/0036-dt-bindings-display-allwinner-Update-H616-DE33-bindi.p=
atch


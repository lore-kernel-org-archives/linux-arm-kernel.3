Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE88CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 00:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=; b=QTy4AniAcPgUWgOHx7yhiRujhR
	5YBhyjzb38PWEsW5SU49EuIBrdUmJlK+Acb9ZvLHu4x8abIpOxypOharr/pES7iQwodg2gGUf6VHp
	sWSsNGr8kGHDLxvQ3oOuiKQJoCCYmQ+2PB8f9xQYdnxgfNXXiCDAQSRncuialx9xOfDHccXWD2vGe
	/WfNou6GWklZAzYARg1901EiQxUzy0Qc/jHHH6K1QyK2QhpVLaqVsGc0cTpLzE940VUcBpS9w+o3E
	Ls133RKguc0+AC90dzUQEgWmVxzlhmMoPmOSzjcnOxxGRsvL0l54+p7sq0+Mot0zfvRD4LmWsDOIo
	z2seZrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8S7-0000000HHNq-2rR1;
	Tue, 19 May 2026 00:36:55 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8S4-0000000HHMY-1nyH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 00:36:54 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7c58e6eb2c8so23400657b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 17:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779151011; cv=none;
        d=google.com; s=arc-20240605;
        b=XZLZyxpSm6qohnkTHJJgs+4TR+9ty6kMj6MdlCiHaTChOqmOQoyYyuKCjYCKlsdKMy
         dLKsMa/W5iF5D2Q/cJhf813W0s8poh43Z+gcL7clK0lKLhrVc6qpIjw3c885mB0yFpPz
         3DpBq1qSEQ7+WlctAzx4n1pU6SiX5+QKVfjDezQLR3Imw6x2Kj8xB3fQxbOWylSNuVl1
         UK8EtqAGF2XvZFmrF1vbKi8Ivj0/2uEx6jXHa6JhUVGiX82WcygFwP6UeACHYoTp/lbY
         sRwoPD2mIBZrLc8spH8Ev5t2wCG3lwpSmj8J46JI3v4+c8Ap85YVhnbNcRYX4SEmo7By
         Gh2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        fh=oRpMUXkJJWdTPNLfqFB/9pssR6e+ZrsI0TDfOppe+T0=;
        b=LtZq7CeygtQY7shjQSXsJvT6j1u0FddBPg2z5/G2IoAdrVQjfOL3ImOu6k/vR/k08Z
         e3oLvMbF9bHqDRvxTLHzyG8F1QwXzz3CcY7WY28gGoPx3RXxNdILb8W5JjTZVqi4SAMC
         5vVuVg5U8uUn50E1FGTXD+3RfQMipa/Af3kFT8kk/GOR3QxiOYxqWbEgB1ykXMK8fVw/
         ipBqNYfP1J3vBEG7pRs9SYHMa1FE0JfnsUfMO/3BpUsLdWlM2tGBOI/znhSNHgFNSIF/
         kAbqAqhs6bISoQGx26+8PBvyUD1rhR+IWlZ9LYpM6LLOswLvVvS8mxnPWM8ORa6SRezM
         XZzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151011; x=1779755811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=YKDwSMkhfEahul8Wo3lcbPSn2hw3zgQiv26Rkot+h2v96ujLRXF4B70aBIkwjHumTe
         1+r5+choEsTrEoSQi9zRgf56RXWQq58wEcXVcCEFQ5lDGUmpbD65OsVZx9Km266zsdK7
         L0xc7DChn3O86AMa2R9FJJnuOqyNK7ILIj4R0qexJgLqrHzmLoZrRXzl5moI8S+g8CrO
         RIiyDm3jBK7eWob4lwd2cccKlL3jyVv4lbMWAtURc/FRRlCN/R8OIsaeSsscEJ2+ZtuV
         RYBpO0w8KplL1oluI19f/NzbiWXs/FaMK51S33wqYOXtAa0x0VRjc42SnJPAwbrVKt9S
         j5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151011; x=1779755811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=BhWGoX4hdtzczPcrDWDqfcwSHA0omy4H5eUClJRbZeKgFkcahPc8mTHevIP0b7IjG0
         mOxXXzRsAXqAUiU1sqapxwhONp6AJYydCynwK2IO/urfdlRBLovkdg5iuTE38RJCsDEY
         tDmmj8DH4HrDSzcAzCVKmTZhE1c8+bx7Oz6T1WUS3B5VxX3xpz4EfkdvbiRs8TWLDK27
         81refUI6ZEd9/czTSPod+5R94ZdDZ7Kgi1nHnvke0uJDKZzBHSKVZYv9d81Gymfwruph
         l0IyDIbokz55LHQC3uJRlO6CuGrEaNzu/y4yppDgo1+z1Y1XHU4G3N+V4MNuykprxG9H
         AOkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BMtwyqSlcYpf7FHX5SiQ4XOd2ZY1we94E+XHNjggdMYbno5jPGsiATy0GdZ6r/RhQflovOdWDb95lxiMm9rz5@lists.infradead.org
X-Gm-Message-State: AOJu0YzGgClBBofyOJLEKk3qO4BhgDEGJKZMscCbwShSfUkfosPnyOjE
	IkWkGLw6Dj5e9tHGQLsJ3MlId8jqufM1U2aP6n9DMV9Acu2BpqTIhpIHpsN+GDIIern8AdRU14t
	T+2MP8nmL6rEnbU5njQ1eD2UJRROptqc=
X-Gm-Gg: Acq92OEV07nsr27Rao3U+C+ibCyhGgPacMcZdlZE5+1VgSLCNLPmpEyDHMbhaHKX6fi
	nkRCEPhDN+8ggMX3FbfA9pGZqTsWE24t7beiQ264LQffPBrdgYN+rOTi7WM577Fvz+YSBGIB7oq
	8l9/dXJtmGgEd1P6a85s916zgHOed74UjAiLGVoYD2K8Q52Z/UkQ1EtyiKHj2UrrY6lwNst8UKZ
	JE8QejgvZadUxtwSFwpm3o9s9YWpwU78PCDXl783zmC8UKWPD8LHbkI65+QZROmkGW7tBye0yzo
	ieOxeDeUWoq3J+Dm1/LMD0xOlrsWzxLRoxEK5KHf8HkNjifADpUaf1HCiCgTzv7dj5EL8FSL
X-Received: by 2002:a05:690c:19:b0:7bd:5cc4:3e49 with SMTP id
 00721157ae682-7c9597a969fmr213746077b3.12.1779151010945; Mon, 18 May 2026
 17:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora>
 <agNJasayW8VCHTiU@e142607> <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
 <20260518091650.5a7a4f4a@fedora>
In-Reply-To: <20260518091650.5a7a4f4a@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 18 May 2026 17:36:40 -0700
X-Gm-Features: AVHnY4L_pqXJyhSchHbjEJHIXbJa2yYodKfZcbmSmhWAfddYBdzbaPZTcjMiQrU
Message-ID: <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_173652_489192_97F4C3CB 
X-CRM114-Status: GOOD (  55.88  )
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

On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 13 May 2026 12:31:32 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.co=
m> wrote:
> > >
> > > On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > > > On Tue, 12 May 2026 14:47:27 +0100
> > > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > >
> > > > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > > > >
> > > > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wro=
te:
> > > > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panth=
or_device *ptdev)
> > > > > > > > >                     return ret;
> > > > > > > > >     }
> > > > > > > > >
> > > > > > > > > +   /* If a protected heap name is specified but not foun=
d, defer the probe until created */
> > > > > > > > > +   if (protected_heap_name && strlen(protected_heap_name=
)) {
> > > > > > > >
> > > > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() =
fail is the
> > > > > > > > name is "" already?
> > > > > > >
> > > > > > > If dma_heap_find() will fail, then the whole probe with fail =
too.
> > > > > > > This check prevents that.
> > > > > >
> > > > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > > > currently probe and boot the FW even though we never setup the
> > > > > > protected FW sections, so why should we defer the probe here? C=
an't we
> > > > > > just retry the next time a group with the protected bit is crea=
ted and
> > > > > > fail if we can find a protected heap?
> > > > >
> > > > > The problem we have with the current firmware is that it does a n=
umber of setup steps at "boot"
> > > > > time only. One of the steps is preparing its internal structures =
for when it enters protected
> > > > > mode and it stores them in the buffer passed in at firmware loadi=
ng. We cannot later run the
> > > > > process when we have a group with protected mode set.
> > > >
> > > > No, but we can force a full/slow reset and have that thing
> > > > re-initialized, can't we? I mean, that's basically what we do when =
a
> > > > fast reset fails: we re-initialize all the sections and reset again=
, at
> > > > which point the FW should start from a fresh state, and be able to
> > > > properly initialize the protected-related stuff if protected sectio=
ns
> > > > are populated. Am I missing something?
> > >
> > > Right, we can do that. For some reason I keep associating the reset w=
ith the
> > > error handling and not with "normal" operations.
> > I kind of hope we end up with either
> >
> >  - panthor knows the exact heap to use and fails with EPROBE_DEFER if
> > the heap is missing, or
> >  - panthor gets a dma-buf from userspace and does the full reset
> >    - userspace also needs to provide a dma-buf for each protected
> > group for the suspend buffer
> >
> > than something in-between. The latter is more ad-hoc and basically
> > kicks the issue to the userspace.
>
> Indeed, the second option is more ad-hoc, but when you think about it,
> userspace has to have this knowledge, because it needs to know the
> dma-heap to use for buffer allocation that cross a device boundary
> anyway. Think about frames produced by a video decoder, and composited
> by the GPU into a protected scanout buffer that's passed to the KMS
> device. Why would the GPU driver be source of truth when it comes to
> choosing the heap to use to allocate protected buffers for the video
> decoder or those used for the display?
I don't think the GPU driver is ever the source of truth. If the
system integrator wants to specify the source of truth (SoT) from
kernel space, they should use the device tree (or module params /
config options). If they want to specify the SoT in userspace, then we
don't really care how it is done other than providing an ioctl.
Panthor is always on the receiving end.

If we don't want to delay this functionality, but it takes time to
converge on SoT, maybe a solution that is not a long-term promise can
work? Of the options on the table (dt, module params, kconfig options,
ioctls), a kconfig option, potentially marked as experimental, seems
like a good candidate.

>
> >
> > For the former, expressing the relation in DT seems to be the best,
> > but only if possible :-). Otherwise, a kconfig option (instead of
> > module param) should be easier to work with.
> >
> > Looking at the userspace implementation, can we also have an panthor
> > ioctl to return the heap to userspace?
>
> Yes, it's something we can add, but again, I'm questioning the
> usefulness of this: how can we ensure the heap used by panthor to
> allocate its protected FW buffers is suitable for scanout buffers
> (buffers that can be used by display drivers). There needs to be a glue
> leaving in usersland and taking the decision, and I'm not too sure
> trusting any of the component in the chain (vdec, gpu, display) is the
> right thing to do.
The heap returned by panthor is only for panfrost/panvk. It says
nothing about compatibility with other components on the system.


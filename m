Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A8FCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=; b=DdcbbVHcj+mUvbB8ezl8IZ1Xf5
	7SplL/yng/Z0x3454stITYkwzQfV/x7JNHrGjnNe6p5vgmKNym/OQbVFcPyejQyzzNIQ1dIZbte9O
	w0qGX6Jlqq4OdumhaRKjQTLKrXxZf/nkHLQC2MZPV8FZaqgHcPl+KkIWlrwpNthDqhHLnMsum8TI/
	+lyKGjb5jxiTnHtSHAR+7IlEURyXPpr9IJsKiBLnvJE3VJa/gJnAqAc9gLgbJOSzT+yi/wz43Z5du
	tSqm/GU8k7PsCuHhS3AJeBibodfRCZBhYBHX24ijdkuGlR8mUCAY5MzCCNMFKNYD8vj065mSs0vIJ
	321BgdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFJ6-00000003b1Z-3Anf;
	Wed, 13 May 2026 19:31:48 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFJ3-00000003b05-25xX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 19:31:46 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-651c5d525f6so8399328d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 12:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778700704; cv=none;
        d=google.com; s=arc-20240605;
        b=R526m0Y8DAlVOYgGPQGbzMvab7rPGT+LppsjkAhSDGFO4bq2i2iD+nL0s1vRAGa2jw
         kOZw3PsIbpum27gd+XUiAezY29A4xP3ip3CHoA7BvQsQyJhfSOEM+8xVkIzqK3xKrhUP
         /SIQLhToSkdIXEe2QGKtRKXUPXBQ4uWDV5A2d3HAThTsd0OCSzx3nxvET8ZXuf6HUorY
         ch/ljx27zksWzhURHGV+KiXR5OaKDLx9iY8C4l3Qgx/nP2p8vmxfUMHk3H3K8/IWbPgI
         alDyce6R+ok4Ftp6xDCTFSwmPeKznLxjPNiM4Q1glfrc2vPCFZBXiVd1S8mVXanyN/Nn
         y3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        fh=mSlFAGCyg9KVvzseuiodveMp1s61D/LTfISpex9nRZw=;
        b=eGxt5AfpYZWCStQOXz+q7W7lgn/3cOFW8eK0lKMBh/zYjV8IEhx187dfshKvSeZ2Rk
         yKMHIod0KfMvZgjTav/ZNPPfi8eeHY/c28IWg+cZBQ0RmBb0fmfKv76d8u/ZYGwfXaDh
         jt4lK3oSMBGgvuzPQIP5dR6x8UbvJhpfzoCrV4OFqoBVhFQYYGkGTsGzTIUVspgAFcp/
         MFXQeKpoOHj2HiHkrN0pbUfa1sd6f+Q2tWRKHVNpIBD7gbS04B+5DYR5E36a4BQYQqTG
         0WCudDeZZb34R8QjJLHmGztKHkbY/JvCfMGmFC/TUF0BiLdJ9h9PoalQJNCw/KeHebnO
         hKdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778700704; x=1779305504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=SXVDZBrywoEVYS9zbNFQRgV7Y423de6xOHM9fJD78DhK9lRQ0BmRDcs4lANBq16YbX
         bAEstwimAYxzFUP3ZBpXvtkRoB9DSMtUINxUZ66AYDX7V8rt2KntbCh2TfehS7/I78AX
         k4KPUMIUQw7Ka2/dBAcsFTaGG2OjwWC6SEJiIUgepqqUbgcXQP4A8oGGQjp+QStJ6bK9
         1+8PjGfgpRVHttfGFD8w4LphCgTA8F+vV0cYDDldfBi7TG9WSXCEFB2Dp7XC+NGLpDQk
         KaCfdpTmeBNk0XYDrUmaSEoLxc424Q0Rdf4zYFVE/1NnlqHnyu742hLSxh725Kl6juG2
         hD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778700704; x=1779305504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=Yhncrhotes2/jDn3fvJeW02titu3nPDTxt42dKaOEQIWXKqUHPns4K5zra6sF+Bx+N
         e2BO67sjxpN+cGQjoe9FQcuzcjVLpPpJaRkvSk+h9E4vZg9bPC08mTObSLWS5DVrQcZ2
         xTzPF2J0KMhfSUMPZfyA4YNzvJ8y76wW/FJPq2PauY/0SN29GVXlTB6u6eWYthVAkIUX
         50mc8AZXKuTfV0qX4yhTp7XvhCHvAsZsyj/MeeCnnej88fn+g/mglQXO2lphLl1smJIz
         ZYASsLeRoSRcKnqpO+e0/8dmoeIDcFJ/i2sEhDGgIT/tMxpHJyM4w5CM16ZGfXyUy7ZX
         37+A==
X-Forwarded-Encrypted: i=1; AFNElJ/3iuHQ/WMqQIYHCD8pleSK9wXKeitQhRdG4apcsET4DnlFJS+Mzt0IWNUfG5MDaz/liDrITM2/ahZ7CA5JjSUr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzumej43u2VSJX5S9FWBty1ns8MDJdeE3XfJeEFFnfmkGiie5o+
	NNSXnYaIaoFdb0ZRq+6xSo3g4am6HHnqtAc9JlCRrWMCfZeRv+o2rDcMogQ2UMDYKGLvgDL3GuK
	3H9GlABNE0tfQQq0xY3Jdy9LBzPAE/go=
X-Gm-Gg: Acq92OGZS1qZvEYmgb1ExkTUERmxM5UwRUR4ZhH4UD4FT7cQeJa0FG2Ofvrpz39fJgl
	gCnZexLQy9wlKy4Yfms8ciyrS0XlIYV7SvZaL05GdM+ZbcD553763KF7o/RUyDt1kKuIP5Icg1h
	0b69WiUqs3xezS60fQtMIj4bpphiHB3b+oT0ZVvyJrWLXaLkI6rFkQrF7TIg7J4VpilgUVSoTnb
	+hqyOIIsBue5nTPOKEsIIlia/kGvdl05vYhrvRHY1LRPEbrj6eHrDbIA2Il6dNYaHlFRnvy2q6R
	s4grgrEtCmujLn6hcy6LQTQUFhmxX/qEzNWkl1OYT0su7U1C65nPKGc/idzxqVNaM7zIbPsx2w=
	=
X-Received: by 2002:a05:690c:38b:b0:7bd:a50c:454c with SMTP id
 00721157ae682-7c6da2152a8mr42579647b3.19.1778700703738; Wed, 13 May 2026
 12:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora> <agNJasayW8VCHTiU@e142607>
In-Reply-To: <agNJasayW8VCHTiU@e142607>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 13 May 2026 12:31:32 -0700
X-Gm-Features: AVHnY4JH8Ip_tVhSu6utyw5cZH7Mreif1YmCt2t2xjBKPcGuoTWdGxm_i0T-RLg
Message-ID: <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	=?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
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
X-CRM114-CacheID: sfid-20260513_123145_550756_9DAC0C31 
X-CRM114-Status: GOOD (  38.84  )
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

On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > On Tue, 12 May 2026 14:47:27 +0100
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> >
> > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > >
> > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_d=
evice *ptdev)
> > > > > > >                     return ret;
> > > > > > >     }
> > > > > > >
> > > > > > > +   /* If a protected heap name is specified but not found, d=
efer the probe until created */
> > > > > > > +   if (protected_heap_name && strlen(protected_heap_name)) {
> > > > > >
> > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() fail=
 is the
> > > > > > name is "" already?
> > > > >
> > > > > If dma_heap_find() will fail, then the whole probe with fail too.
> > > > > This check prevents that.
> > > >
> > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > currently probe and boot the FW even though we never setup the
> > > > protected FW sections, so why should we defer the probe here? Can't=
 we
> > > > just retry the next time a group with the protected bit is created =
and
> > > > fail if we can find a protected heap?
> > >
> > > The problem we have with the current firmware is that it does a numbe=
r of setup steps at "boot"
> > > time only. One of the steps is preparing its internal structures for =
when it enters protected
> > > mode and it stores them in the buffer passed in at firmware loading. =
We cannot later run the
> > > process when we have a group with protected mode set.
> >
> > No, but we can force a full/slow reset and have that thing
> > re-initialized, can't we? I mean, that's basically what we do when a
> > fast reset fails: we re-initialize all the sections and reset again, at
> > which point the FW should start from a fresh state, and be able to
> > properly initialize the protected-related stuff if protected sections
> > are populated. Am I missing something?
>
> Right, we can do that. For some reason I keep associating the reset with =
the
> error handling and not with "normal" operations.
I kind of hope we end up with either

 - panthor knows the exact heap to use and fails with EPROBE_DEFER if
the heap is missing, or
 - panthor gets a dma-buf from userspace and does the full reset
   - userspace also needs to provide a dma-buf for each protected
group for the suspend buffer

than something in-between. The latter is more ad-hoc and basically
kicks the issue to the userspace.

For the former, expressing the relation in DT seems to be the best,
but only if possible :-). Otherwise, a kconfig option (instead of
module param) should be easier to work with.

Looking at the userspace implementation, can we also have an panthor
ioctl to return the heap to userspace? A dma-heap ioctl to query the
heap size is also lacking.


>
> Best regards,
> Liviu
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF
>


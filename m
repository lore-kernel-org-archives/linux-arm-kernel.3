Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F95CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzHbHM5F2Rwe7GWQtoT/vBL3j3IgEpxjxlyoiFn8SsI=; b=yRPDA9PkaMEqbnmP/dOuM85vU3
	n4gs5qaqHqLApuhHIal1CrBsf2K+wv4OovYiL8EY/uD8pnNpigm55S5UqfiIeHMtvn37dxTd0Fcjg
	2dayRZUVYH2JGPzJszUg17rBjBtONlc3nkDuP/BtKShHGItsHpt9shVMdG7qrGVBUKEyMZXvYchGv
	EzYoqn4XFjO8CHUe3ZFqfZyh1tnmWcxnsQncZjMZFh3llyEAp1UkYnbS5FJ60Du2Sar1XAFw3vZem
	P1DdEgUNTYsV26qU6FLuoTsnLKj5FQQz1eHeWFF78cFXcQl0r/kdled7TGHmkMmhwIlm/Meanh6sP
	nc/gzyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMZl-00000003Qnj-2fN9;
	Tue, 04 Mar 2025 07:20:25 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMX4-00000003Q8v-1qZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:17:39 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-600038877ebso1282380eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 23:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741072657; x=1741677457; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzHbHM5F2Rwe7GWQtoT/vBL3j3IgEpxjxlyoiFn8SsI=;
        b=hwxkjXm3d66xI07edtbhn9j3fYqkbpJI3EiV6JxhKsoiaHy/usgjm434r+UsZsO9fV
         os5HXuxC/8Rr+MdvtS4RzJi9rF+3byBagZ5w/yDncRF8p2MWJl4WLk3DgcfIXFJzNKXC
         7HAhzMpUM13eYDM9iIi/tWxKdxcA+hNvyMob1D5YuGbWvUscwSxSqQgW1jZXc7F3KVsF
         gpIPhkMfeke0iHLKXPsZiC9IJ1iUUsPYQa/uhRYmYUGptiYL8edHAUwmkGDs4RyFXdEb
         4RSwUvli7jMilr8dKj80eCaXZJ1UdPC5m7n/pfUf7YLtyK+tALizdIeehnD1ZSH6xmZh
         /2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741072657; x=1741677457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzHbHM5F2Rwe7GWQtoT/vBL3j3IgEpxjxlyoiFn8SsI=;
        b=QCdase/3Ba2L2kn4V2WSqUuOQDwFJFB6+kdUvKuxLisuOFZWeSOcSiMeI728eiNj99
         v+Qg2I+LTRVasioBnk47lUnV4Ss+Cb8Rd8hzFQuEc+gM0qPklAIuzUe01Z1vLwh7NZg5
         OO694D7boDxNE9wMcxNjJ9UCmWkBTwXEMLY0x0VfaAj24CtN8FuV//CzijQ4ArJ2zkNq
         8MqPSGyEaqhL6SREnk+NDds2PKt6qY7nk9wvNdaXmHjLkleIF10O0n8ciPOwN4umsXEC
         DUyu95dP/tmCpbiDyuFwfhZpFGueX2IUb7YE4uQXP/Z1TQRK7cNz85NbNZSEc0asWXQ2
         LgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC21b8/tC9cDLnw6vRBCNnBnXeJ0WRqSwCWf6c2NxOEirJ5tPwpxyw4ako7EbMpTXNlcoHzByat28MpADO9QQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwuuAC3fpmbO0FMRxNbXeuHv9JUKadcmTk9Rzn242DeZD0tjBOM
	t3+Ki9vkQp+lgXwRUb7By8/as/48kHJC3Gf3Z0vkA4BgsFl1MsSRtjcOexMUWI6/jyj/8BfFsBH
	0sZdEXQZ/bKWmM11HUueal4M6qIE01lcM+yf25A==
X-Gm-Gg: ASbGncv4UKz4D8UHsJ2/ZzjTy1fk78vTtYzdQZkRqZ/AagH3pDaoaD30GEgXrIvvLzM
	QCLZBPJG7MsY6stBKv6xltcMrfAtkBenfyKG8jGPfbStTMkd9C5S4LWaAWDBl8rEEbxE7HnSLE0
	quHbv9T1Ewvjw70sX1+sCS64z1Ac0=
X-Google-Smtp-Source: AGHT+IGeWth+Ec7HvnFz4HF064DwKqNeMXOfgif6GoecOEfs8x2Q7Fc7PxDdZ1yzepEKq7Z5LS0hsWXFxueHCzU4cFY=
X-Received: by 2002:a05:6820:2217:b0:5fc:e323:785e with SMTP id
 006d021491bc7-5feb360c2c2mr8620716eaf.5.1741072655731; Mon, 03 Mar 2025
 23:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com> <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
 <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com> <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
In-Reply-To: <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 4 Mar 2025 08:17:23 +0100
X-Gm-Features: AQ5f1JrEtCh2L2kJC0WD3IbY9SZ2HYIAKqjRP2-ff7KQiuotp3pduZ0dOaK3kQU
Message-ID: <CAHUa44FkG1NAWpoW8UVBywv44XW_mjAJa32PcC9mcmiOLdiRqw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_231738_494352_91EA70D0 
X-CRM114-Status: GOOD (  59.42  )
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

Hi Daniel,

On Fri, Feb 21, 2025 at 3:12=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi Sumit,
>
> On Fri, 21 Feb 2025 at 11:24, Sumit Garg <sumit.garg@linaro.org> wrote:
> > On Tue, 18 Feb 2025 at 21:52, Daniel Stone <daniel@fooishbar.org> wrote=
:
> > > dma-heaps was created to solve the problem of having too many
> > > 'allocate $n bytes from $specialplace' uAPIs. The proliferation was
> > > painful and making it difficult for userspace to do what it needed to
> > > do. Userspace doesn't _yet_ make full use of it, but the solution is
> > > to make userspace make full use of it, not to go create entirely
> > > separate allocation paths for unclear reasons.
> > >
> > > Besides, I'm writing this from a platform that implements SVP not via
> > > TEE. I've worked on platforms which implement SVP without any TEE,
> > > where the TEE implementation would be at best a no-op stub, and at
> > > worst flat-out impossible.
> >
> > Can you elaborate the non-TEE use-case for Secure Video Path (SVP) a
> > bit more? As to how the protected/encrypted media content pipeline
> > works? Which architecture support does your use-case require? Is there
> > any higher privileged level firmware interaction required to perform
> > media content decryption into restricted memory? Do you plan to
> > upstream corresponding support in near future?
>
> You can see the MTK SVP patches on list which use the MTK SMC to mediate =
it.
>
> There are TI Jacinto platforms which implement a 'secure' area
> configured statically by (IIRC) BL2, with static permissions defined
> for each AXI endpoint, e.g. CPU write + codec RW + dispc read. I've
> heard of another SoC vendor doing the same, but I don't think I can
> share those details. There is no TEE interaction.
>
> I'm writing this message from an AMD laptop which implements
> restricted content paths outside of TEE. I don't have the full picture
> of how SVP is implemented on AMD systems, but I do know that I don't
> have any TEE devices exposed.
>
> > Let me try to elaborate on the Secure Video Path (SVP) flow requiring
> > a TEE implementation (in general terms a higher privileged firmware
> > managing the pipeline as the kernel/user-space has no access
> > permissions to the plain text media content):
> >
> > - [...]
>
> Yeah, I totally understand the TEE usecase. I think that TEE is a good
> design to implement this. I think that TEE should be used for SVP
> where it makes sense.
>
> Please understand that I am _not_ arguing that no-one should use TEE for =
SVP!
>
> > > So, again, let's
> > > please turn this around: _why_ TEE? Who benefits from exposing this a=
s
> > > completely separate to the more generic uAPI that we specifically
> > > designed to handle things like this?
> >
> > The bridging between DMA heaps and TEE would still require user-space
> > to perform an IOCTL into TEE to register the DMA-bufs as you can see
> > here [1]. Then it will rather be two handles for user-space to manage.
>
> Yes, the decoder would need to do this. That's common though: if you
> want to share a buffer between V4L2 and DRM, you have three handles:
> the V4L2 buffer handle, the DRM GEM handle, and the dmabuf you use to
> bridge the two.
>
> > Similarly during restricted memory allocation/free we need another
> > glue layer under DMA heaps to TEE subsystem.
>
> Yep.
>
> > The reason is simply which has been iterated over many times in the
> > past threads that:
> >
> >     "If user-space has to interact with a TEE device for SVP use-case
> > then why it's not better to ask TEE to allocate restricted DMA-bufs
> > too"
>
> The first word in your proposition is load-bearing.
>
> Build out the usecase a little more here. You have a DRMed video
> stream coming in, which you need to decode (involving TEE for this
> usecase). You get a dmabuf handle to the decoded frame. You need to
> pass the dmabuf across to the Wayland compositor. The compositor needs
> to pass it to EGL/Vulkan to import and do composition, which in turn
> passes it to the GPU DRM driver. The output of the composition is in
> turn shared between the GPU DRM driver and the separate KMS DRM
> driver, with the involvement of GBM.
>
> For the platforms I'm interested in, the GPU DRM driver needs to
> switch into protected mode, which has no involvement at all with TEE -
> it's architecturally impossible to have TEE involved without moving
> most of the GPU driver into TEE and destroying performance. The
> display hardware also needs to engage protected mode, which again has
> no involvement with TEE and again would need to have half the driver
> moved into TEE for no benefit in order to do so. The Wayland
> compositor also has no interest in TEE: it tells the GPU DRM driver
> about the protected status of its buffers, and that's it.
>
> What these components _are_ opinionated about, is the way buffers are
> allocated and managed. We built out dmabuf modifiers for this usecase,
> and we have a good negotiation protocol around that. We also really
> care about buffer placement in some usecases - e.g. some display/codec
> hardware requires buffers to be sourced from contiguous memory, other
> hardware needs to know that when it shares buffers with another
> device, it needs to place the buffers outside of inaccessible/slow
> local RAM. So we built out dma-heaps, so every part of the component
> in the stack can communicate their buffer-placement needs in the same
> way as we do modifiers, and negotiate an acceptable allocation.
>
> That's my starting point for this discussion. We have a mechanism to
> deal with the fact that buffers need to be shared between different IP
> blocks which have their own constraints on buffer placement, avoiding
> the current problem of having every subsystem reinvent their own
> allocation uAPI which was burying us in impedance mismatch and
> confusion. That mechanism is dma-heaps. It seems like your starting
> point from this discussion is that you've implemented a TEE-centric
> design for SVP, and so all of userspace should bypass our existing
> cross-subsystem special-purpose allocation mechanism, and write
> specifically to one implementation. I believe that is a massive step
> backwards and an immediate introduction of technical debt.
>
> Again, having an implementation of SVP via TEE makes a huge amount of
> sense. Having _most_ SVP implementations via TEE still makes a lot of
> sense. Having _all_ SVP implementations eventually be via TEE would
> still make sense. But even if we were at that point - which we aren't
> - it still doesn't justify telling userspace 'use the generic dma-heap
> uAPI for every device-specific allocation constraint, apart from SVP
> which has a completely different way to allocate some bytes'.

I must admit that I don't see how this makes a significant difference,
but then I haven't hacked much in the stacks you're talking about, so
I'm going to take your word for it.

I've experimented with providing a dma-heap replacing the TEE API. The
implementation is more complex than I first anticipated, adding about
400 lines to the patch set. From user space, it looks like another
dma-heap. I'm using the names you gave earlier,
protected,secure-video, protected,trusted-ui, and
protected,secure-video-record. However, I wonder if we shouldn't use
"restricted" instead of "protected" since we had agreed to call it
restricted memory earlier.

I'll soon post this in a v6 and an updated demo.

Cheers,
Jens


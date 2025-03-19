Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B84EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owwDzzKUpGneXk0r6P0900oOLRuhEZkHOZ3jJ6/2920=; b=QrFoVmIPO8IoIFe9eLAmvAIeIw
	erh0OHL1jMepo0uOKz4HD1/LqDiptonF/yasV3nikdViQGPXkg3JfVf34WmJmcrNVmt4VeiQpCwRE
	MP3glgXx0DEGI2EVoH4btwM9PQkDdZe+0ffprr2i1gdfRNotGjxikbDbekB6/NN7amgV7nFhhmJZX
	+Sue8q7JZ+6zizLn8A/XmXViQhQ+o+GpAP/Edr1tNnudcPOttR3dKsonTLCw03HWbY77UIErPL7DI
	muAuZPYZH5+OI+yzkqfibjtkO6CLdcIJDYRxAU5GWrdk4GBaNBhqFnhUg/j4RFGTJp0pbmv0he1dC
	nDvDJkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuo2l-00000008FHh-2Za4;
	Wed, 19 Mar 2025 07:40:51 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunzr-00000008EnQ-1zdF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 07:37:52 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2c11ddc865eso2187540fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742369870; x=1742974670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owwDzzKUpGneXk0r6P0900oOLRuhEZkHOZ3jJ6/2920=;
        b=F5DQVChOA4xuomDMEwkdrsEzbTZH09JUj+IgIhiqj4t4HoTJvs3qFHQrRPPSf/IAuq
         mlXOSA4g8qGmXz935DAXUVu6Xq7nFC3VpI9dUJGF6UMeo7+8d/vgSvzgaLtpq7br48Ar
         PNA8N3w9SWYBnwauiHxf8f16ovusshY2z5lFURlB5VBBzZvblivO5POJo2khFjOZ5hgC
         s51F4h7lCm+Yg0RLU6fwBodHyeKoHvcccPad3bPZUzKSZ+9bEYu7NzUsjd2W41bwwOi4
         QPZ/t2i+NNqx+1wS83fRelFisN5U6Fd68Gq4jBu5wSWeYoF7Z87dNwSPb+gBilgp83nX
         vqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742369870; x=1742974670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owwDzzKUpGneXk0r6P0900oOLRuhEZkHOZ3jJ6/2920=;
        b=sv7If0Z6gLvOJG/fYLQ1m29xEMhK+cdcFE8WXibEyuYF/k/u8YCWksHhz7RJdwlO5u
         Vz4AT2V47Da22aUee4wZY6sYeLPH6G8h3Invk3D0TkP3qGCATfBgVzZh+PD0vcIXIwsj
         V0YWKtErMeomX6XPnrBRo7hqOrst2RpOwtlOrhRIaasz9+95Jn7w3uF3gOEA2RYSjNZK
         ChEHOJBm3VmUGNWoY7n3/TYZPWFA2BWTevKiWvDI2KOJITY7pCaN0hguV3hivpXI0ct+
         E72lzAXALSJSVJZYoM5fxqz2rLFbJ6ysbhWDvn9jkmeNsvjIAsSXAYjFuZhxesWj/Ozq
         xMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjUNVpFztjfH1rxBjYB8awX6LxlvF9XzfHfJvULB7DaaQXkTuwHRQC49OfuooHpRKChiYA+DfekJYzDf47sIaG@lists.infradead.org
X-Gm-Message-State: AOJu0YyGBCp5bgQLPv9K87IKkWKVvCHvQQl3nkFSN294d2NnsnjgTOKR
	W9G0Kjw66MpY7OcfkLV8Yz4i5xDXa8jjrwWPjmaLlRHmViWgTgzfWsKLxEJTpRUiGodbbwD894+
	3YYpakK7+FHijtgm2y+F1FCO3MEltxG9FreLvuw==
X-Gm-Gg: ASbGncvkwL2rbS3/Uh+ifryG0m1YHgz/z98mwByAfW4TEdEtRORQL7uQaiqjDayoFxg
	pGtHgRYKOD8649V6HDiDm+Z8B23i6jGZcqhW5HlXAHonK8c7AR9N4PnNL+5vybHejABDF7fQG7d
	QNPRHdWcwRvm00ExzdNfTEHo+3mYE=
X-Google-Smtp-Source: AGHT+IHhlr0ebpnI7ur3lSLDToxyweC0Ao9NnSXnP3sZR4rKFcxyBq8t5/yasVPUDL7hE6LOxReMuAl1+DoeTa0xu40=
X-Received: by 2002:a05:6871:710:b0:29e:290f:7aea with SMTP id
 586e51a60fabf-2c745785fb8mr1233815fac.34.1742369869734; Wed, 19 Mar 2025
 00:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com> <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
 <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com>
 <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
 <CAHUa44FkG1NAWpoW8UVBywv44XW_mjAJa32PcC9mcmiOLdiRqw@mail.gmail.com>
 <Z8avsigZJ4vqmiA4@sumit-X1> <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
In-Reply-To: <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Mar 2025 08:37:38 +0100
X-Gm-Features: AQ5f1JoBpDEcbO9dlVRTjtWYtOyjNLGsFkNPj_PW0jLG2Dag8-4LN8wDdyWmUJE
Message-ID: <CAHUa44E11jYFrAFrZmNVTpLJ-XDs45QyTr-_DbeWBOQ0DjHPkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sumit Garg <sumit.garg@kernel.org>, Daniel Stone <daniel@fooishbar.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
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
X-CRM114-CacheID: sfid-20250319_003751_567393_6C72D350 
X-CRM114-Status: GOOD (  72.40  )
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

Hi,

On Tue, Mar 18, 2025 at 7:38=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le mardi 04 mars 2025 =C3=A0 13:15 +0530, Sumit Garg a =C3=A9crit :
> > On Tue, Mar 04, 2025 at 08:17:23AM +0100, Jens Wiklander wrote:
> > > Hi Daniel,
> > >
> > > On Fri, Feb 21, 2025 at 3:12=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > >
> > > > Hi Sumit,
> > > >
> > > > On Fri, 21 Feb 2025 at 11:24, Sumit Garg <sumit.garg@linaro.org> wr=
ote:
> > > > > On Tue, 18 Feb 2025 at 21:52, Daniel Stone <daniel@fooishbar.org>=
 wrote:
> > > > > > dma-heaps was created to solve the problem of having too many
> > > > > > 'allocate $n bytes from $specialplace' uAPIs. The proliferation=
 was
> > > > > > painful and making it difficult for userspace to do what it nee=
ded to
> > > > > > do. Userspace doesn't _yet_ make full use of it, but the soluti=
on is
> > > > > > to make userspace make full use of it, not to go create entirel=
y
> > > > > > separate allocation paths for unclear reasons.
> > > > > >
> > > > > > Besides, I'm writing this from a platform that implements SVP n=
ot via
> > > > > > TEE. I've worked on platforms which implement SVP without any T=
EE,
> > > > > > where the TEE implementation would be at best a no-op stub, and=
 at
> > > > > > worst flat-out impossible.
> > > > >
> > > > > Can you elaborate the non-TEE use-case for Secure Video Path (SVP=
) a
> > > > > bit more? As to how the protected/encrypted media content pipelin=
e
> > > > > works? Which architecture support does your use-case require? Is =
there
> > > > > any higher privileged level firmware interaction required to perf=
orm
> > > > > media content decryption into restricted memory? Do you plan to
> > > > > upstream corresponding support in near future?
> > > >
> > > > You can see the MTK SVP patches on list which use the MTK SMC to me=
diate it.
> > > >
> > > > There are TI Jacinto platforms which implement a 'secure' area
> > > > configured statically by (IIRC) BL2, with static permissions define=
d
> > > > for each AXI endpoint, e.g. CPU write + codec RW + dispc read. I've
> > > > heard of another SoC vendor doing the same, but I don't think I can
> > > > share those details. There is no TEE interaction.
> > > >
> > > > I'm writing this message from an AMD laptop which implements
> > > > restricted content paths outside of TEE. I don't have the full pict=
ure
> > > > of how SVP is implemented on AMD systems, but I do know that I don'=
t
> > > > have any TEE devices exposed.
> > > >
> > > > > Let me try to elaborate on the Secure Video Path (SVP) flow requi=
ring
> > > > > a TEE implementation (in general terms a higher privileged firmwa=
re
> > > > > managing the pipeline as the kernel/user-space has no access
> > > > > permissions to the plain text media content):
> > > > >
> > > > > - [...]
> > > >
> > > > Yeah, I totally understand the TEE usecase. I think that TEE is a g=
ood
> > > > design to implement this. I think that TEE should be used for SVP
> > > > where it makes sense.
> > > >
> > > > Please understand that I am _not_ arguing that no-one should use TE=
E for SVP!
> > > >
> > > > > > So, again, let's
> > > > > > please turn this around: _why_ TEE? Who benefits from exposing =
this as
> > > > > > completely separate to the more generic uAPI that we specifical=
ly
> > > > > > designed to handle things like this?
> > > > >
> > > > > The bridging between DMA heaps and TEE would still require user-s=
pace
> > > > > to perform an IOCTL into TEE to register the DMA-bufs as you can =
see
> > > > > here [1]. Then it will rather be two handles for user-space to ma=
nage.
> > > >
> > > > Yes, the decoder would need to do this. That's common though: if yo=
u
> > > > want to share a buffer between V4L2 and DRM, you have three handles=
:
> > > > the V4L2 buffer handle, the DRM GEM handle, and the dmabuf you use =
to
> > > > bridge the two.
> > > >
> > > > > Similarly during restricted memory allocation/free we need anothe=
r
> > > > > glue layer under DMA heaps to TEE subsystem.
> > > >
> > > > Yep.
> > > >
> > > > > The reason is simply which has been iterated over many times in t=
he
> > > > > past threads that:
> > > > >
> > > > >     "If user-space has to interact with a TEE device for SVP use-=
case
> > > > > then why it's not better to ask TEE to allocate restricted DMA-bu=
fs
> > > > > too"
> > > >
> > > > The first word in your proposition is load-bearing.
> > > >
> > > > Build out the usecase a little more here. You have a DRMed video
> > > > stream coming in, which you need to decode (involving TEE for this
> > > > usecase). You get a dmabuf handle to the decoded frame. You need to
> > > > pass the dmabuf across to the Wayland compositor. The compositor ne=
eds
> > > > to pass it to EGL/Vulkan to import and do composition, which in tur=
n
> > > > passes it to the GPU DRM driver. The output of the composition is i=
n
> > > > turn shared between the GPU DRM driver and the separate KMS DRM
> > > > driver, with the involvement of GBM.
> > > >
> > > > For the platforms I'm interested in, the GPU DRM driver needs to
> > > > switch into protected mode, which has no involvement at all with TE=
E -
> > > > it's architecturally impossible to have TEE involved without moving
> > > > most of the GPU driver into TEE and destroying performance. The
> > > > display hardware also needs to engage protected mode, which again h=
as
> > > > no involvement with TEE and again would need to have half the drive=
r
> > > > moved into TEE for no benefit in order to do so. The Wayland
> > > > compositor also has no interest in TEE: it tells the GPU DRM driver
> > > > about the protected status of its buffers, and that's it.
> > > >
> > > > What these components _are_ opinionated about, is the way buffers a=
re
> > > > allocated and managed. We built out dmabuf modifiers for this useca=
se,
> > > > and we have a good negotiation protocol around that. We also really
> > > > care about buffer placement in some usecases - e.g. some display/co=
dec
> > > > hardware requires buffers to be sourced from contiguous memory, oth=
er
> > > > hardware needs to know that when it shares buffers with another
> > > > device, it needs to place the buffers outside of inaccessible/slow
> > > > local RAM. So we built out dma-heaps, so every part of the componen=
t
> > > > in the stack can communicate their buffer-placement needs in the sa=
me
> > > > way as we do modifiers, and negotiate an acceptable allocation.
> > > >
> > > > That's my starting point for this discussion. We have a mechanism t=
o
> > > > deal with the fact that buffers need to be shared between different=
 IP
> > > > blocks which have their own constraints on buffer placement, avoidi=
ng
> > > > the current problem of having every subsystem reinvent their own
> > > > allocation uAPI which was burying us in impedance mismatch and
> > > > confusion. That mechanism is dma-heaps. It seems like your starting
> > > > point from this discussion is that you've implemented a TEE-centric
> > > > design for SVP, and so all of userspace should bypass our existing
> > > > cross-subsystem special-purpose allocation mechanism, and write
> > > > specifically to one implementation. I believe that is a massive ste=
p
> > > > backwards and an immediate introduction of technical debt.
> > > >
> > > > Again, having an implementation of SVP via TEE makes a huge amount =
of
> > > > sense. Having _most_ SVP implementations via TEE still makes a lot =
of
> > > > sense. Having _all_ SVP implementations eventually be via TEE would
> > > > still make sense. But even if we were at that point - which we aren=
't
> > > > - it still doesn't justify telling userspace 'use the generic dma-h=
eap
> > > > uAPI for every device-specific allocation constraint, apart from SV=
P
> > > > which has a completely different way to allocate some bytes'.
> > >
> > > I must admit that I don't see how this makes a significant difference=
,
> > > but then I haven't hacked much in the stacks you're talking about, so
> > > I'm going to take your word for it.
> > >
> > > I've experimented with providing a dma-heap replacing the TEE API. Th=
e
> > > implementation is more complex than I first anticipated, adding about
> > > 400 lines to the patch set.
> >
> > I did anticipated this but let's give it a try and see if DMA heaps
> > really adds any value from user-space point of view. If it does then it
> > will be worth the maintenence overhead.
> >
> > > From user space, it looks like another
> > > dma-heap. I'm using the names you gave earlier,
> > > protected,secure-video, protected,trusted-ui, and
> > > protected,secure-video-record. However, I wonder if we shouldn't use
> > > "restricted" instead of "protected" since we had agreed to call it
> > > restricted memory earlier.
> >
> > Let's stick with "restricted" memory buffer references only.
>
> Until now, we didn't have a standard to balance our naming choice, we
> simply wanted to move away from "secure" which didn't mean much, and
> restricted met our needs. I think the discussion is worth having again,
> now that there is a standard that decided toward "protected". Matchcing
> the Khronos standard means reducing a lot of confusion.
>
> https://docs.vulkan.org/guide/latest/protected.html

Yeah, that's fine with me. I don't mind changing the name again as
long as we progress. The latest version of the patchset is here [1].
I've published a demo and changed the patchset to provide a heap
interface instead of a special interface in the TEE subsystem for
memory allocations as requested. I'm interested in feedback on the
patches in general, but in particular, on how the heap interface is
provided.

[1] https://lore.kernel.org/lkml/20250305130634.1850178-1-jens.wiklander@li=
naro.org/

Cheers,
Jens


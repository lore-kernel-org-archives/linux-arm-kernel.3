Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9198BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpF7wEE+1cJWx9zAtKf9QlygCmnNGJM9CNsxuBDedRk=; b=rZLsaL41rFIJXlnOkjli55Rs3R
	N+giDCiPKYRyQXDl1SaPPoxxtoQOU9Q/kRwOBMvK/JTGtpSkfcRApUm8CnkRt25o1fRu4hT2bDIdT
	67nl2seS5jSU3Y4iJKIV4q/W3Jf4/yK7JqvsSNZ6lAyC9Cp1bM/VNcWD7YgAxFrL/5G6XVGYYPu89
	K4IhqLzMxzlZTJdgKu4YO6s71kuHlJyHXfaK5QMyGVcgcfw5Kp99bhCWQ8s2etUOFPqLcXcYZzvpN
	g4i4RMmXuWYLCPz5EwAFVjFKA+kj0XalPMo0oecbPKZ9PZTo6UEBTkr/xkZ4PEuxp84SNfaNT+PKf
	v9AiI1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mHd-00000009XTO-0eQJ;
	Thu, 10 Apr 2025 07:25:09 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ljU-00000009QOt-2sAS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:49:54 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2d0a742df27so441277fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744267791; x=1744872591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpF7wEE+1cJWx9zAtKf9QlygCmnNGJM9CNsxuBDedRk=;
        b=w08dLJbVjUwyJANpBguUx9T29g0DwhYGxz1Hiu2U/8HB680hmptqGW5djCf3ZUFjtI
         zHAuDgoVvFVcz2+owotO8N4pW2ptTYir3V8iMefJ9YdPmQ749Jwqhgjuz1MSqXxuiCG6
         p/V8DRGcK+RSOAmijlRa6Z66eAF35bFnkvwlLkO4ViQfBAn42cxfMTqYJLq7MlOKojJX
         3emvbe+MGeu9uA0yiJm//gCYknpQ3J3hjNDT7DBYcGyQ602+ceBnqlscuqq2jHJ1PLBT
         VCohOBGwfBJQiFoIOcj8Ay1wSHUo3mhvXPRUg9IrzPUQSC9XGQBlCrDs4F31flV7++XU
         PFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267791; x=1744872591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpF7wEE+1cJWx9zAtKf9QlygCmnNGJM9CNsxuBDedRk=;
        b=tmK5PJdfXpeY8OeYS8vtm1jC7QP9gwKD2P+Kmy2T+NxpNMyM1Gt23ZdCLUJBoYeZYY
         CohTDOBJquM0iXRdPRuJMKS8mdgtZOgAaY5l1ap+imsbGUdSoPDba6fC0nZFcAOEL9BI
         Nr5PAdW0JC5pcKkTLcadLx38oaAEeoa7ODshz16gTd1Zc1vEkKLT/cVcQ5odEHJAlltC
         j+DB1tOtKgbZSa9+w99vmo8GkRp81cVU2bn2y4Sti6wopGkDe8ovfTp3TmefCdn9hB/Z
         2U+y2AnAYMDk1q1LuaLlAq8fLTWpAMwT6x4crkxlaeg2dvHXRJhDBhrSfZyxhtHxqqMS
         sYYw==
X-Forwarded-Encrypted: i=1; AJvYcCXT9XxauVMs6HfeIZPYziRoUgJXIlqJtrltiDQ5UR9vJ6mk8lJ5l8tlabDmm7HFw4Y8EH5ig6sVBssBWisLmNeJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxHj4i1OuGCyvLhRLj74MZnChCiXW0ZGQKXGBRijyMudML9QMqk
	53EOMS//D+VsvGuE0YGH3G2mFxg7ozl9Fz0+NFz2zp31IbRJuotUU1M+PBbG6Ushup3VGvWQzfR
	bwCiiaG9+WuOkOfcG6ytGmqLqPJ5ZjEgAo+sYCw==
X-Gm-Gg: ASbGnctaFc0pGiYFhVcB/2WZfITi+grPGaCsim1QA92APYVz082e1I0EguqL2IxSGMy
	IDyygnH31Z3yVkx/4WRIfSUBOZhz+WKtr6dRUEtgl97t/2oA76hSXw9R0dt5dWvPMT0RnpNULwn
	d6DCfdWnPEz6VGiLl+ZLro7DQ=
X-Google-Smtp-Source: AGHT+IHI4FgOoH6eOg0ztL2Lx7hiXdosqXiiUD+d8J9IOEiCubchzZoLqMtVD0Mmvo3sJz+QQ7r84CVnm0uFw++DJDA=
X-Received: by 2002:a05:6871:4009:b0:2c4:1b1c:42c3 with SMTP id
 586e51a60fabf-2d0b3a2a298mr929589fac.9.1744267791101; Wed, 09 Apr 2025
 23:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1> <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1> <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
 <Z_ZtDQQY4eouqBh8@sumit-X1>
In-Reply-To: <Z_ZtDQQY4eouqBh8@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 10 Apr 2025 08:49:39 +0200
X-Gm-Features: ATxdqUEvXiuy3pdj5yJylN_i-qNjZAR_HHoPy2N2W57yI_8PinKhMCxfS6kRFGI
Message-ID: <CAHUa44GFzG8dr1Kbapbjy77c-wJb4gQVVom24eLLueOK=gCq=A@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234952_726430_1124CEBB 
X-CRM114-Status: GOOD (  43.27  )
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

On Wed, Apr 9, 2025 at 2:50=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Apr 08, 2025 at 03:28:45PM +0200, Jens Wiklander wrote:
> > On Tue, Apr 8, 2025 at 11:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > > > On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kerne=
l.org> wrote:
> > > > >
> > > > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > > > Hi Sumit,
> > > > > >
> > > > >
> > > > > <snip>
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +#include "tee_private.h"
> > > > > > > > +
> > > > > > > > +struct tee_dma_heap {
> > > > > > > > +     struct dma_heap *heap;
> > > > > > > > +     enum tee_dma_heap_id id;
> > > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > > +     struct tee_device *teedev;
> > > > > > > > +     /* Protects pool and teedev above */
> > > > > > > > +     struct mutex mu;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_heap_buffer {
> > > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > > +     struct tee_device *teedev;
> > > > > > > > +     size_t size;
> > > > > > > > +     size_t offs;
> > > > > > > > +     struct sg_table table;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_heap_attachment {
> > > > > > > > +     struct sg_table table;
> > > > > > > > +     struct device *dev;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_rstmem_static_pool {
> > > > > > > > +     struct tee_rstmem_pool pool;
> > > > > > > > +     struct gen_pool *gen_pool;
> > > > > > > > +     phys_addr_t pa_base;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEA=
PS)
> > > > > > >
> > > > > > > Can this dependency rather be better managed via Kconfig?
> > > > > >
> > > > > > This was the easiest yet somewhat flexible solution I could fin=
d. If
> > > > > > you have something better, let's use that instead.
> > > > > >
> > > > >
> > > > > --- a/drivers/tee/optee/Kconfig
> > > > > +++ b/drivers/tee/optee/Kconfig
> > > > > @@ -5,6 +5,7 @@ config OPTEE
> > > > >         depends on HAVE_ARM_SMCCC
> > > > >         depends on MMU
> > > > >         depends on RPMB || !RPMB
> > > > > +       select DMABUF_HEAPS
> > > > >         help
> > > > >           This implements the OP-TEE Trusted Execution Environmen=
t (TEE)
> > > > >           driver.
> > > >
> > > > I wanted to avoid that since there are plenty of use cases where
> > > > DMABUF_HEAPS aren't needed.
> > >
> > > Yeah, but how the users will figure out the dependency to enable DMA
> > > heaps with TEE subsystem.
> >
> > I hope, without too much difficulty. They are after all looking for a
> > way to allocate memory from a DMA heap.
> >
> > > So it's better we provide a generic kernel
> > > Kconfig which enables all the default features.
> >
> > I disagree, it should be possible to configure without DMABUF_HEAPS if =
desired.
>
> It's hard to see a use-case for that additional compile time option. If
> you are worried about kernel size then those can be built as modules. On
> the other hand the benifit is that we avoid ifdefery and providing sane
> TEE defaults where features can be detected and enabled at runtime
> instead.

My primary concern isn't kernel size, even if it shouldn't be
irrelevant. It doesn't seem right to enable features that are not
asked for casually. In this case, it's not unreasonable or unexpected
that DMABUF_HEAPS must be explicitly enabled in the config if a heap
interface is needed. It's the same as before this patch set.

>
> >
> > >
> > > > This seems to do the job:
> > > > +config TEE_DMABUF_HEAP
> > > > + bool
> > > > + depends on TEE =3D y && DMABUF_HEAPS
> > > >
> > > > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into =
the kernel.
> > >
> > > Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsyste=
m
> > > to use. We should do that such that there isn't a hard dependency to
> > > compile them into the kernel.
> >
> > I was saving that for a later patch set as a later problem. We may
> > save some time by not doing it now.
> >
>
> But I think it's not a correct way to just reuse internal APIs from DMA
> heaps subsystem without exporting them. It can be seen as a inter
> subsystem API contract breach. I hope it won't be an issue with DMA heap
> maintainers regarding export of those APIs.

Fair enough. I'll add a patch in the next patch set for that. I guess
the same goes for CMA.

Cheers,
Jens


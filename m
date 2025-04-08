Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309BBC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHOdC/Vml2+FnzmLfGzflP63fCypDI+MruYpwHo3lNA=; b=LgVZifBCBggbpNdObXlB6S8G8g
	ULZ0ZjuQlz1s35r3FZA6CffKgZaZeUH1foI7hESTuGd9hFj+59iuRRz36LKnt6qCRgLEzBUIVWDrP
	ylDZ2wOkrSbouxqG3Jv5fhIlkczOAdS38sYEGNgk8GxWSOWT1MbwJeqRvXtHahE6yeO4wYbAkK1jO
	wiJf5qPkUAlInTRz/jXM8EBac5hx3tHiOCQ/JHxEPXbwZ2++DHbGioMgH8FXrATbsHoQMOSPbcX5T
	sPl2cu7qbal/54r4rFhdljfBZTniUXyGLfcFo4k4sXfpKV3PlSpbOZt5R6IDSl9XErIpmdlqF/6DJ
	kcLcH0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QJ-00000004HMm-419f;
	Tue, 08 Apr 2025 13:55:31 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29B4-00000004Esb-0mEw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:39:47 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2b8e2606a58so3000085fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744119585; x=1744724385; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHOdC/Vml2+FnzmLfGzflP63fCypDI+MruYpwHo3lNA=;
        b=ykCHTAPcP2N8HBCp3Lh2S4iSYiABW9NGmTQ0ZSSCjkkakxTZ8K016Bm5+5ExHCi7Qv
         lFdMbBLAv/mZRKI/ooOnAV0kmTj80gupLGkXHxi4wVyEl3SMgBJdOdaXAoefhOrZ9rBP
         GMBoS4uZZwTU/TrA0odLnkQkCVLRBPoGc7ZzmiC3WBJvynZ8O+K7MTMVqPEfS4X5OCEk
         4OaPu8sdkPQsc0d4WwQI6TVBl76b7UMlo21HMWBpwAhr2i3zIQAJuI+XFynQESkvEw+q
         12USxGRr2qHQVkmJFDdDS2HKJa5i+n/A/lqeGcxCmhaGfpPGg6K03P0fWP91Mt+NwyU9
         EskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119585; x=1744724385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHOdC/Vml2+FnzmLfGzflP63fCypDI+MruYpwHo3lNA=;
        b=aHpYAoPVcb1c/vzJEKWTkSXfd+CSNk7Dgpb2LXPzNeZTAjbzlUx9Blg5FZI2nqABsx
         By59FHBtnu/AUrRQm+1dnPw1rSUM+7XVJysorX20O3CnTvCiHXIxqD8wZMw1jsQ26YP2
         Sl6bbfMaPLZxPMmb/66zx0GsZSmQCKs0R70Vlzw9hW9OFudPKoWu3vitUQsr0W7zy72+
         U88oglh8w2jGlWdShr8+zPtnQRrgRAuq/mEUgf6ywci9cNIsxrFLvxV61FM0QTa5nE05
         etvgHIE7EX5Mm3eLOtLu6ftkhDTX+oYzuTxrCp0zUAcLsV1ZQBYSocV5TrCjdbpBoan3
         8XkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlZ9yaqBZ8XGIU1+/Ly6fWe+elka9xAqu0HEvqiP8RZ3dR+spg72UKLdgtswfjk7+BkM765J+mjKG8MQrAeHQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YzVZ1xKELbbr/mR+pWyrsefgsXvdPCpptVQky4U4A65n0EhMYkY
	EQ8KUbT7dUp/zdBP445KQ8HDpULb2OlGUy0Gysu2ZiwxqVaWs7MfxAYUSqZE2Ss3upVmWgyFp/1
	oKr3LRBGnq5mEdymh+ffV66MlF+Drs+4dCPmlHg==
X-Gm-Gg: ASbGncsHJMxZMo0EQ/SzZMtjJZ0m7E/AApOu6yc92gKz6B2OSnDr0ityYpUA/LTRD+W
	oz+ARXDRH7KQWejMP+kHkdmlcLF8ktP4yhGcwvr5YBVFa5Sg5vKoz4vfVwYNu5PRg5QSZPwBBpV
	9PsI847A3PTwI8PbO6HHbwVrRkXMA=
X-Google-Smtp-Source: AGHT+IFDzPIFIE+uzUvKzwMFVIPM56PzO88jEFUON9fAPcL/eNFR02o6bcfZi6WAQ34EoSMSHnDr8Fk6F3d560XOiCg=
X-Received: by 2002:a05:6870:2b10:b0:295:eb96:9fd4 with SMTP id
 586e51a60fabf-2cc9e59d03amr9326894fac.11.1744119585123; Tue, 08 Apr 2025
 06:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org> <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
 <Z-u8MWNVNy9lLbkK@sumit-X1> <CAHUa44GGEypYfiVz5E1aBsZ0TOK0UoeDBVRYB8_dUYJLhrSyUg@mail.gmail.com>
 <Z_TqTUpGhz1s-F8h@sumit-X1>
In-Reply-To: <Z_TqTUpGhz1s-F8h@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 15:39:33 +0200
X-Gm-Features: ATxdqUFlhhnGRONqCMm9Feg_Wns0J0dqc4_QCcuIsEY1x6VIJsUuiFEXYdjvaKs
Message-ID: <CAHUa44EV=q35i-anXkAF2N7mY8gmWqfMbU0YXARHHOas5iKxHw@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory allocation
To: Sumit Garg <sumit.garg@kernel.org>
Cc: akpm@linux-foundation.org, david@redhat.com, rppt@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_063946_226638_FD163E43 
X-CRM114-Status: GOOD (  50.42  )
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

On Tue, Apr 8, 2025 at 11:20=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Apr 01, 2025 at 02:26:59PM +0200, Jens Wiklander wrote:
> > On Tue, Apr 1, 2025 at 12:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > + MM folks to seek guidance here.
> > >
> > > On Thu, Mar 27, 2025 at 09:07:34AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > > > On Tue, Mar 25, 2025 at 8:42=E2=80=AFAM Sumit Garg <sumit.garg@kern=
el.org> wrote:
> > > > >
> > > > > On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
> > > > > > Add support in the OP-TEE backend driver dynamic restricted mem=
ory
> > > > > > allocation with FF-A.
> > > > > >
> > > > > > The restricted memory pools for dynamically allocated restrict =
memory
> > > > > > are instantiated when requested by user-space. This instantiati=
on can
> > > > > > fail if OP-TEE doesn't support the requested use-case of restri=
cted
> > > > > > memory.
> > > > > >
> > > > > > Restricted memory pools based on a static carveout or dynamic a=
llocation
> > > > > > can coexist for different use-cases. We use only dynamic alloca=
tion with
> > > > > > FF-A.
> > > > > >
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > ---
> > > > > >  drivers/tee/optee/Makefile        |   1 +
> > > > > >  drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> > > > > >  drivers/tee/optee/optee_private.h |  13 +-
> > > > > >  drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++=
++++++++
> > > > > >  4 files changed, 483 insertions(+), 3 deletions(-)
> > > > > >  create mode 100644 drivers/tee/optee/rstmem.c
> > > > > >
> > >
> > > <snip>
> > >
> > > > > > diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rst=
mem.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..ea27769934d4
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/tee/optee/rstmem.c
> > > > > > @@ -0,0 +1,329 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * Copyright (c) 2025, Linaro Limited
> > > > > > + */
> > > > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > > > +
> > > > > > +#include <linux/errno.h>
> > > > > > +#include <linux/genalloc.h>
> > > > > > +#include <linux/slab.h>
> > > > > > +#include <linux/string.h>
> > > > > > +#include <linux/tee_core.h>
> > > > > > +#include <linux/types.h>
> > > > > > +#include "optee_private.h"
> > > > > > +
> > > > > > +struct optee_rstmem_cma_pool {
> > > > > > +     struct tee_rstmem_pool pool;
> > > > > > +     struct gen_pool *gen_pool;
> > > > > > +     struct optee *optee;
> > > > > > +     size_t page_count;
> > > > > > +     u16 *end_points;
> > > > > > +     u_int end_point_count;
> > > > > > +     u_int align;
> > > > > > +     refcount_t refcount;
> > > > > > +     u32 use_case;
> > > > > > +     struct tee_shm *rstmem;
> > > > > > +     /* Protects when initializing and tearing down this struc=
t */
> > > > > > +     struct mutex mutex;
> > > > > > +};
> > > > > > +
> > > > > > +static struct optee_rstmem_cma_pool *
> > > > > > +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
> > > > > > +{
> > > > > > +     return container_of(pool, struct optee_rstmem_cma_pool, p=
ool);
> > > > > > +}
> > > > > > +
> > > > > > +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > > > > +{
> > > > > > +     int rc;
> > > > > > +
> > > > > > +     rp->rstmem =3D tee_shm_alloc_cma_phys_mem(rp->optee->ctx,=
 rp->page_count,
> > > > > > +                                             rp->align);
> > > > > > +     if (IS_ERR(rp->rstmem)) {
> > > > > > +             rc =3D PTR_ERR(rp->rstmem);
> > > > > > +             goto err_null_rstmem;
> > > > > > +     }
> > > > > > +
> > > > > > +     /*
> > > > > > +      * TODO unmap the memory range since the physical memory =
will
> > > > > > +      * become inaccesible after the lend_rstmem() call.
> > > > > > +      */
> > > > >
> > > > > What's your plan for this TODO? I think we need a CMA allocator h=
ere
> > > > > which can allocate un-mapped memory such that any cache speculati=
on
> > > > > won't lead to CPU hangs once the memory restriction comes into pi=
cture.
> > > >
> > > > What happens is platform-specific. For some platforms, it might be
> > > > enough to avoid explicit access. Yes, a CMA allocator with unmapped
> > > > memory or where memory can be unmapped is one option.
> > >
> > > Did you get a chance to enable real memory protection on RockPi board=
?
> >
> > No, I don't think I have access to the needed documentation for the
> > board to set it up for relevant peripherals.
> >
> > > This will atleast ensure that mapped restricted memory without explic=
it
> > > access works fine. Since otherwise once people start to enable real
> > > memory restriction in OP-TEE, there can be chances of random hang ups
> > > due to cache speculation.
> >
> > A hypervisor in the normal world can also make the memory inaccessible
> > to the kernel. That shouldn't cause any hangups due to cache
> > speculation.
>
> The hypervisor should unmap the memory from EL2 translation tables which
> I think should disallow the cache speculation to take place. However,
> without hypervisor here the memory remains mapped in normal world which
> can lead to cache speculation for restricted buffers. That's why we
> should atleast test on one platform with real memory protection enabled
> to rule out any assumptions we make.

Do I hear a volunteer? ;-)

Anyway, this isn't something that can be enabled in the kernel alone.
Only platforms where the firmware has been updated will be affected.
If this can't be supported on a particular platform, there's still the
option with a static carveout.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
> >
> > >
> > > MM folks,
> > >
> > > Basically what we are trying to achieve here is a "no-map" DT behavio=
ur
> > > [1] which is rather dynamic in  nature. The use-case here is that a m=
emory
> > > block allocated from CMA can be marked restricted at runtime where we
> > > would like the Linux not being able to directly or indirectly (cache
> > > speculation) access it. Once memory restriction use-case has been
> > > completed, the memory block can be marked as normal and freed for
> > > further CMA allocation.
> > >
> > > It will be apprciated if you can guide us regarding the appropriate A=
PIs
> > > to use for un-mapping/mamping CMA allocations for this use-case.
> > >
> > > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/sc=
hemas/reserved-memory/reserved-memory.yaml#L79
> > >
> > > -Sumit


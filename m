Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B2C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=; b=DgpWM24kPpkweg1Jcu6mDQytdT
	RghFSEtWfUe18sLybtYL88jTYY6HH6qNMy8IULkZXqx40z5aeo1eh3DgB1siZH72gBInb9bapV36m
	sA3Wqp6ZyrnFdB4G+63X8Ac2YadyWvPy2yVLw2iCoUsAZFFjcbpMykokHGlWJCUrfPbXjhI+WK3Bp
	X12Pytw6bWaegAsHMWbLDxmMIP/exOtcfQo8EUnXoJiXegBPqgckbidlUfKJ6zy5dQgjQJ19tMXgC
	c9vmG7NlIFpDqEZdELYc3TFgIPsIojWxyx4tIvWPLidpm+lbLE/0dG6gTEITtcyh2p1dySHV2O3RQ
	HLPlZdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzX6s-00000002LTM-3fyP;
	Tue, 01 Apr 2025 08:36:38 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzX3d-00000002Kz1-2SeR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:33:19 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2c7e5f7f0e3so1518676fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496396; x=1744101196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
        b=zTLj2TkUc5oJADATBxTckhsKUb54j2KYJK/l/xZPM/QG4tG5va4c6lRCs0ZxQnTeQZ
         6SSWvuk3ZqNl/n8f4EBifyXqCSs/2K+4ooBtyfe9bN52WzFU0MG5k3MDDa/vlJkvl4JA
         zuPWJPR0kuy5L2wDIWlhEFG0f5R/lUsW5ZttK5G/F7ytANMrJoJ4G1/w0p75kFEk73yq
         0Ie5rV67qiAWgM9qBrlS28cJsuKQCcRKOeLMZbSLitqFl/zYoTVZ2zYZZat/X+rB87dY
         e5fA968QeQTu0yCCc9+xbJIWmUx2Slo2ey0pW4HKRVqtHXZiamL1tuQqlxfbl8JYcbGh
         FkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496396; x=1744101196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
        b=aJcCzXjz+FtCySnxIscEXltWfD6jy6b4c91RRXmMcCySJQjQXyoU1mPwR4sLLdpmdj
         KzDk8GS8KBzu6YOPQ9puxTghKrGlm0P7Ddh0UHeiS6T4vHQ02Y92M3pz/nq1tvz29su6
         owv7IFyCTb0sWzdFq2DiTRp+cWS1DmaEfUaxk3pBerVdoi+oTewyOutXC/t2lovT0LIV
         SxaHs+IXNzWF9NC2jqOOOtc+qQa36bOZNp5KF3mcXreqClEgo07NNzo2rBT40VkGShVD
         Dn+RLqta3i/Ga+N6BHnErgi9fBcR9IC+mdsTt/ymUUV5LcFzIGarOrNQkGCURTKlecrt
         X1jg==
X-Forwarded-Encrypted: i=1; AJvYcCVqZW8JK/X1cWkiAGv/00k6e0zMU5vqo5+ndBUpvelRxS99TGhhq6KKoc3K0rTW7nHk8z00/OXV8KkHJb8vCrTw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5q39dUz650Et5OsfF6LeYkVn0C2bIDmW82GeJxUFG3/G5EXtD
	P1R3sOemsp+MSpkhAu2D/1qEf4xRYfLEQDL6JGlVAo8u5t7a+eePDJ4EdK7Mo14rA8fCgq4ga/q
	NSKDjdtFgOtc0z0Hoj5iFNHHHTeDrGnCqAa+1TvHYLeFd7sYR6eehPA==
X-Gm-Gg: ASbGncsGVoRCtB8LMgFkTZIzcerPo0KHIv8StqDJEqNhATcRTNBxL7U2kl+Aj6FoS5D
	PDKKjWLF2M4Hkkugvc6t+2xC/3ohgJ4yl4YxRWV4y6Z8bhle+rWlKMSiSMGNO45Xxq0WpLH2a6E
	4LXdKlSJROIXkWLjxezjFvYAaO5jo=
X-Google-Smtp-Source: AGHT+IH9KoU4vUjjPFFl/HpklAnLrv8QnpnI/vnq7QrGKUOSlwBJn74UzBQjYlMDiU71pl/whujtfshDhL1bJanCT0o=
X-Received: by 2002:a05:6870:7815:b0:2c1:9a53:83c4 with SMTP id
 586e51a60fabf-2cbcf755a40mr7187474fac.26.1743496396402; Tue, 01 Apr 2025
 01:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com> <Z-ucuPzwz4IqVTgb@sumit-X1>
In-Reply-To: <Z-ucuPzwz4IqVTgb@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 10:33:04 +0200
X-Gm-Features: AQ5f1JrwSW9AJKXv4JPdCzTC-p9MDUHywS1_JUmGEaiaPvfsks0gIEo3VJPjUog
Message-ID: <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250401_013317_631678_F2D2C99D 
X-CRM114-Status: GOOD (  17.30  )
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

On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
>
> <snip>
>
> >
> > >
> > > > +
> > > > +#include "tee_private.h"
> > > > +
> > > > +struct tee_dma_heap {
> > > > +     struct dma_heap *heap;
> > > > +     enum tee_dma_heap_id id;
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     /* Protects pool and teedev above */
> > > > +     struct mutex mu;
> > > > +};
> > > > +
> > > > +struct tee_heap_buffer {
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     size_t size;
> > > > +     size_t offs;
> > > > +     struct sg_table table;
> > > > +};
> > > > +
> > > > +struct tee_heap_attachment {
> > > > +     struct sg_table table;
> > > > +     struct device *dev;
> > > > +};
> > > > +
> > > > +struct tee_rstmem_static_pool {
> > > > +     struct tee_rstmem_pool pool;
> > > > +     struct gen_pool *gen_pool;
> > > > +     phys_addr_t pa_base;
> > > > +};
> > > > +
> > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > >
> > > Can this dependency rather be better managed via Kconfig?
> >
> > This was the easiest yet somewhat flexible solution I could find. If
> > you have something better, let's use that instead.
> >
>
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -5,6 +5,7 @@ config OPTEE
>         depends on HAVE_ARM_SMCCC
>         depends on MMU
>         depends on RPMB || !RPMB
> +       select DMABUF_HEAPS
>         help
>           This implements the OP-TEE Trusted Execution Environment (TEE)
>           driver.

I wanted to avoid that since there are plenty of use cases where
DMABUF_HEAPS aren't needed. This seems to do the job:
+config TEE_DMABUF_HEAP
+ bool
+ depends on TEE =3D y && DMABUF_HEAPS

We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kern=
el.

Cheers,
Jens


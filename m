Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7E9CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4gQv0EOz4rGm7+DH/Ll/ylPaIILm6U8HqWQMm5vF7w=; b=U5hZGXPQ5SvH3s9+te6u/A2vuX
	MN8NmLYMkZxwDVucezwAsuXaxQKtzKo5oBcWTdjSmNw+06d1bAkFCOrX8EEkUnJrrxstc+mjU2eL+
	KkjlcUPgzPMt8sPxNNbSi4cfuGsQXN1tQTGy9y6/HQRR3kYpH07h/HtpnTydyvIAPeJC0i4eep4EP
	7OKJp0e+DXXE6Db9NqSqCmdlaVdKY90wY6Uz+ySLCms3O5P+P36973KRucvuaymzNlhbfrowI0xmF
	gNQmkarfugnne3ZLaToC5CjfjQbmpccXQ8d4jX4wouoS588m8yZwR+gFITqBAO3DEQrYRA9fEABwV
	wJZ3p1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4PFW-0000000B7ux-2gsb;
	Thu, 02 Oct 2025 19:45:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4PFU-0000000B7uW-2Qc2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 19:45:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so277751566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 12:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759434354; x=1760039154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4gQv0EOz4rGm7+DH/Ll/ylPaIILm6U8HqWQMm5vF7w=;
        b=dCGGLUCMWy25G7Xi/rLYQjX0BEC9TJcVa+S0polBVBVRva965MuYL+Droq0kOlkXHj
         SOoz0XBribbYmCOQnhuXzplYxWOV+ZmNC8llYb4HEdVVyhdYTM4R97tcb4cw1FJDFkOf
         GmsWrOIdun+CaYXiOKNMlJ1JHeiEa1w2qsIqnHXAME2qoJngPp4KsmYRt8iDV+Evr9S8
         Z8ov59/Lv/bKpbMU20o6kXgOcF6ky12cpZGMduizKPVKBu/xMqMyaGoCRVyeFhbAGQhU
         qYFiLlSsgilCPTQN2um5Vzz6rDOLlCTBr79ERU0rpIDNabvV1MpFnxxypyrLiHYggVxY
         Kmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434354; x=1760039154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4gQv0EOz4rGm7+DH/Ll/ylPaIILm6U8HqWQMm5vF7w=;
        b=o+svGELaHnDGKCVxd1sQV/HqSqfEVT/ZlIWl875PZtXHAubFo7INyXl1FwTRlb3g+q
         Tt6I3BHiF+W/d8ZdDE59V8mGlZvycHFSFD6Dz5Lw8CGYUMPzZEdImZqjOGLXu/upN3bA
         72Da05ewxvPbrU62senvTK98UhJxCEaMJW3wLCE6JJEUFGbikMuirimJN+S5SwnAiDip
         IRtf1eCtidi8OKHN28MjLlD7K+EoVvjr/SzeIYFwYm45u3R3z767aQAhojdSnuWfnNGt
         yoJU+56lqe6JPbYPmeUD8cBn2dDk6dP6sRWflbpYsy3+o5MFakxuCroTq7MKFkoUsFmD
         t9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUbWde7cELRv5hkFFXr2DEUYpi2u3Q1qOKsPnJ2CugqeM2hIxkhYo1OUMEbn4B6NwmMA0rvHmIlOmS9R+PT8/na@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1mBTw3UwNNl28ZD1pdZFNDXElzbvG2+tQQKXnDou2lyYJEgjg
	O0W1En8TfAXvR0Un7RdIq12Sh96aP1gbGOfa6xulgKRDnVjytjrAJfPf8FdUHP4jM6iHmqpS9xf
	oyyMTknLqeN5cOgWXNPyrk7VfcmiHjUNnNXOO85g=
X-Gm-Gg: ASbGncvKxX0W52+ztX74LP55Vxpri8sJAh1yBTMyMYIsxw1VAnSJJWiB52cLzS0G3vf
	MwIDaU2ZcPcxCa8pbQ4vudRZT8vzFVYVGVxEyEXtU/PZ86tVZOm8aM8wgMeNpaHKL75jHM1k0Rp
	xDqoJ/o+gtMJ7FVUwBbFxWa6ia4BdSUggxLKsNjnVzuRDFQx8c3ZIRT3hljJtYNpnBBzpxeNeaj
	HBLWgJ8UJIVfsYKE9Mi/Ph7o/vT6jzwAfcONy9kCUPk+XnoYMSG7/EF/c7KHV18X6I=
X-Google-Smtp-Source: AGHT+IHFUMZbxy2/RNA58+rbmrFxgard/FJeBDueJyRahdE9BuRrcf+Nu3HssY90NgcmF3JiiWGdZyfE5Xm8slA6aeE=
X-Received: by 2002:a17:906:dc94:b0:b3b:eb5f:9f1a with SMTP id
 a640c23a62f3a-b49c3933030mr76697066b.38.1759434353566; Thu, 02 Oct 2025
 12:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org> <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
From: John Stultz <jstultz@google.com>
Date: Thu, 2 Oct 2025 12:45:41 -0700
X-Gm-Features: AS18NWBdha9LdZ51VIWM4Jj3n7QLoIkRAEzrxrFPUOsILr8-gV57tRYN27CBzqA
Message-ID: <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
To: Maxime Ripard <mripard@redhat.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T . J . Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_124556_637245_2704F5D2 
X-CRM114-Status: GOOD (  24.70  )
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

On Thu, Oct 2, 2025 at 12:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
> On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..8ab49924f8b7 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/dma-buf.h>
> >  #include <linux/dma-heap.h>
> >  #include <linux/err.h>
> > +#include <linux/export.h>
> >  #include <linux/list.h>
> >  #include <linux/nospec.h>
> >  #include <linux/syscalls.h>
> > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>
> It's not clear to me why we would need to export those symbols.
>
> As far as I know, heaps cannot be removed, and compiling them as module
> means that we would be able to remove them.
>
> Now, if we don't expect the users to be compiled as modules, then we
> don't need to export these symbols at all.
>
> Am I missing something?

For things like distro kernels (or in Android's case, the GKI),
there's a benefit for modules that can be loaded permanently (not
having a module_exit hook).
One doesn't have to bloat the base kernel image/memory usage for
everyone, while still not having to necessarily deal with
complications from module unloading issues.

thanks
-john


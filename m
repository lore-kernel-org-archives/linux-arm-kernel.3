Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF13CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGsaoeFP4OZoz2ETAlY65ICprHno78vJEjUPKXAIoTc=; b=4wjY7rYcjv6KFKnHu30BkDp9Gt
	c6rih/vHNeA935Gj9pBbqAtCLOhkSLr60dhzWNGIXYmWSsgwsL5j+Jt/l4QBxhH132rq+nnsNtmOx
	NM2z6GMJ5MpHyQmWZZGJjJ0Sqgh2MTYe4Ev3VtL+yvH3gISxvYFWXe4OXxZEVVgy9MOgpVelrAg52
	vYYmbMlCA0QDJ68ub39fQf5ZAIjMuFkx1y+N4ww+zmvmOZY8FqHjKmerPIYy9+QSH1Il9COzD9xiK
	SCdFRUAz2jyi0/0CwmmY8HNcv/1jE+5FFgPUz/V4UrUwRLdhdZbj63fjzDn3pkrpM7H6iXMkCjEy7
	InNDkcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4IFi-0000000AQtx-0Ggn;
	Thu, 02 Oct 2025 12:17:42 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4IFg-0000000AQtZ-1kb6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:17:41 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7b7325d8fb5so611828a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759407459; x=1760012259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGsaoeFP4OZoz2ETAlY65ICprHno78vJEjUPKXAIoTc=;
        b=cRu589lcHl0ch+w1/B51iuo4nFYb7tZIWYm4Oez9oWkHOM9LL9jKvd+vrn/I3KXT4Q
         suE/zhpaIgAomoVp4ECdNBJB3wTLOqogQjJQn1h1IWVmcYN+FoOq/4Z/Q3Z6n5j8WBzQ
         JWAalxwTgUbhQEK5Ya5O9efPdqmk29DXHXXOKC5Fr1Vxeni9qjtiAbIwSlr4G7QwZ7r2
         cuRs5fJUBRwofHhoKG3hh0yHSPfk79HuTUxyzTEXfm3oIlXaUm1Cb8ebzZ4PYQPBaE/u
         JOR/fUU7jAaNPIrKWvcrXBK0ZOUeR15E1iY4ll1K0tODiQVohIemYMMlPwcXAJ8mjbMD
         Rs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759407459; x=1760012259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGsaoeFP4OZoz2ETAlY65ICprHno78vJEjUPKXAIoTc=;
        b=tYaixbPpeVuPvLV9bNWNmZhSgP94ztJijFDdzbgImZQlrFn5SfStwr14+bR1N3+DoV
         zariHcXVh5D7iJ2M71tatlSDTWZ28PFcDBpmGC8qKzLrMgrn4pPT/5yHXPtYtDTfuWlV
         YOhZrsezeRFSizkVvAx0CZ9ScZ250htFKbddbTtf8O+rwUd5dOhjTarbhIWsui5jAZL/
         kA28DpwhplfcI+bIS4iSDj4NfPenHMzoPR5KNE6sAd2RkooNytSVm88hgld1IraqPwpI
         umSLigjYKPXU7N2jKvTuoCRAKIDT4Dy0//Zuoz41aD3V/3d7IGz5MItBJiVYmgLpPorv
         Xzug==
X-Forwarded-Encrypted: i=1; AJvYcCWOJNCAa2GmjW785h2dv0YgNqqfB0aSxdaqP12py+ZXXLc8+WRWnuJtMjIuzPxM5V20ipCtJDXjQ8Ufi3jnTh7J@lists.infradead.org
X-Gm-Message-State: AOJu0Yz32CyCJn7e5A09fT5oKMhF4yFnFpVk/1xNJBT1YUD9pMuaq4Wf
	UnhTMGnC6XGpCtYPGv2420Xytui82GaRcNy8nik/NstaGY0WbnNTmy8hYnHmj4CMSQTGhNTBSO/
	3sd69Zr5/iR4yTD/x5XXHa/33ksaKOocAOm+9uLqHqg==
X-Gm-Gg: ASbGncuP0QC74bOB7dh0k1XenLOOs27UmpU1Jm7ZB3eXKB9h8CzIfTd1lYhZbOSl62k
	ptGglGiYS5QZrZNjNzMtxij9SgMTF1nYvrkr9CXeSadaDmqy+I41GQq6xzuZ03h4vRskEglpS12
	wBq844rePo9JkSGN9SAvRTuewtVuppDBZ1ZeRaXpHdSv3AWQfM/zQ9YePZXoGT6rfuqzdfXDxcE
	5sgTAVciEmjlXEvLNctcUUJig1+5ITOz+eoJ4E2Teimgpg=
X-Google-Smtp-Source: AGHT+IEfetTH6APo2ttHfmQ/HD9OGM73G7JSFHlGpVInBdI/YWyuV7C6xZbIUTpTHqoh4vyg+PN0N+hbiXUnxi0n74U=
X-Received: by 2002:a05:6808:6f92:b0:43f:7287:a5de with SMTP id
 5614622812f47-43fa41ccaafmr3695885b6e.41.1759407458820; Thu, 02 Oct 2025
 05:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org> <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 2 Oct 2025 14:17:27 +0200
X-Gm-Features: AS18NWAi5-v--TYVxyZOnQiOgWgAxWVYCjBvI6uxhCSDTvPtA0sa1z_it1UPtE8
Message-ID: <CAHUa44GtAY7=r_bA7ETOsBq+K4w6r1CtY7T9rFn224mshA5GYg@mail.gmail.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_051740_472558_066582F4 
X-CRM114-Status: GOOD (  26.96  )
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

On Thu, Oct 2, 2025 at 9:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> Hi,
>
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

In this case, it's the TEE module that _might_ need to instantiate a
DMA heap. Whether it will be instantiated depends on the TEE backend
driver and the TEE firmware. If a heap is instantiated, then it will
not be possible to unload the TEE module. That might not be perfect,
but in my opinion, it's better than other options, such as always
making the TEE subsystem built-in or disabling DMA-heap support when
compiled as a module.

Thanks,
Jens


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA16CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ6E6bW5eiC9q7CDA3LI31bAgUOE0PZhjrPZI2/QSuQ=; b=lfisgNoXd2JsDYJixgkiGEcDaB
	LU6kMo3T4PAcYHSCUdM7pOC/AOh71ekBpkOklcz9oQvaswiGuaaey6Y2Fgt6KTVpW+ENtM5S2oc/1
	DPeTcQIW5gt4LyS1zx01vjxEgwwHDhttNPzwZleN3JHHkyvPD/HdOl2Nc2M8F2aeq7ym61YdFxwPI
	aF6hZNo5rOQMt+lRjdnoMKujLDNEhYBBITrRrNRa4imHTvAc83BHoENsyfANa5Dly3QZX4rOCyk0j
	+I7lol2Xgr7T0Mr70lZgrLBxgaT71Trr+X+ruld2WNy0fWw52FNRzmzAx07GwPZn8fB/W7nk87Xla
	Ll0je2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc4R-00000001bdv-1AWQ;
	Thu, 11 Sep 2025 07:50:19 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc4O-00000001bcQ-2v8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:50:17 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-621a79a580bso51371eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757577015; x=1758181815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ6E6bW5eiC9q7CDA3LI31bAgUOE0PZhjrPZI2/QSuQ=;
        b=xMqYdDHRf5nYSbiaqCQVi7iUojbyd6LeeT/5jwwrcJM5Z/ic7NlF76//RHghXBI14B
         YtvfjgtSJ5eajojFs0WRdUBMRjjgIPBggfy5Yqu3FcpR5FjpvJb4CXvpn7sKISUuP4XY
         GwTO37DA7usGkh6WolssY4JSatBpidLQYlwaaXSsksjlNm35Qu5TtSZdhQtGDN+rrSSf
         Sxn63RykeISX9rC/fNhgMBtnoc6jZEiU/mFeprh3uxbJ6vGvYQF1FVTQvxSKEhV8LJlX
         bOqvZRCeHyrQI+yWlkDdg6eo/HZkjorMMcVARNPVDQwp1XryyDisW4kPH/l4P5vvrXQg
         PUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577015; x=1758181815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZ6E6bW5eiC9q7CDA3LI31bAgUOE0PZhjrPZI2/QSuQ=;
        b=SUNUHiOYEtMUNUaSmdaLPzSBtQ9v43R6N4SLIPOHWvw0CmIeNr5a3HRagSo5QmYyGi
         kvHYsRPyOpGjzrD4nIpyb06DPhlOHi7iBnW49qBZZwIShuAc89bm7vF2oCMogEHNMruo
         xZgSpEOwcGO7K/BWXL8P7A9DFx82Qyh+jhudVzPldhxCyuUVNrzgMViGiTCVF+6T903F
         xADm+X61SEl74Ddg9zKYTe8BLsn6ytRTa2YGjKSBslspeVZX9h78EAiI8MOhOMWyuAWZ
         qKgTEDmltGNiCEraYPf5e/uO1e7SZu747YrLmSbx7UzeBCP/SL9rRTeXH8wCSIsxAm7y
         4WHw==
X-Forwarded-Encrypted: i=1; AJvYcCVivHKZSUMRDrFeNQdC9o4FW4xQHmHGbKrHlB5xms5zxwm8n+pvT0+hnZT/WiFuzmQTqZGAA5AD9jLwGvQdXJmB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdk+ZgwmvRSaamvOox19Q40MaSuad66voOvXczHkQJrmClG1LN
	i+dtxqL8tdUuuS03aeVGHsNtPruiXPEkVWlbpBpfekmSCiBZTzgLFEaRhYUZytXEomGClYANNyg
	AZBnxZIU+qokfGbRtysDuF7vUYWTgLrRwThv3I893SQ==
X-Gm-Gg: ASbGnctBmLCpGO/BcfvA4883hbba1oT8RnKNN7h852dcD/NIrP0JIZj5X78fug8NOmo
	0KdRAsxOU58aYlC0JrFik3xHYRRkCojhR1soRM5pOX/OMMCc+x4aIlvRpEoNbgkC5yFd3UYGJhp
	ZN6xSxPdfmIZtbiHEzOjBU+nIBobvE3wpLAjEJCuIEIVsk8lrTeSqTHMCPSnbqTpJPH8HxQIrQb
	ml4BnkL
X-Google-Smtp-Source: AGHT+IHM+qomPa7mkwPaxbF4J0ZwMvmQZ4r3i08spiXwqRdColY0ofOiN+xC4zPpK9pKKDVK1an+zwdrKVe+3sc2KLA=
X-Received: by 2002:a05:6820:1518:b0:620:ea78:ceb4 with SMTP id
 006d021491bc7-6217897a730mr7686244eaf.0.1757577015334; Thu, 11 Sep 2025
 00:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com> <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
In-Reply-To: <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Sep 2025 09:50:04 +0200
X-Gm-Features: Ac12FXyvCWRnQD7Gsb8VWVWslCX8Upv9AarUZnTiiQT33HIlYHfy4GNTnaJlFIg
Message-ID: <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005016_755451_596EB541 
X-CRM114-Status: GOOD (  25.58  )
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

Hi Sumit,

On Thu, Sep 11, 2025 at 9:15=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hello Jens,
>
> On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote:
> >
> > On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > > Export the dma-buf heap functions to allow them to be used by the O=
P-TEE
> > > > driver. The OP-TEE driver wants to register and manage specific sec=
ure
> > > > DMA heaps with it.
> Thank you for the series.
>
> Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for th=
ese?

Sure, what namespace do you want in the argument for
EXPORT_SYMBOL_GPL_NS()? "DMA_BUF"?

>
> With that change, please feel free to use my
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Thanks,
Jens

> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > ---
> > > >  drivers/dma-buf/dma-heap.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > >
> > > Can we get an ack from DMAbuf maintainers here? With that we should b=
e
> > > able to queue this patch-set for linux-next targetting the 6.18 merge
> > > window.
> > >
> > > -Sumit
> >
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> >
> > Sorry I haven't been able to participate much upstream lately.
> > >
> > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.=
c
> > > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > > --- a/drivers/dma-buf/dma-heap.c
> > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *hea=
p)
> > > >  {
> > > >       return heap->priv;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > > >
> > > >  /**
> > > >   * dma_heap_get_name - get heap name
> > > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *=
heap)
> > > >  {
> > > >       return heap->name;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_get_name);
> > > >
> > > >  /**
> > > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_=
heap_export_info *exp_info)
> > > >       kfree(heap);
> > > >       return err_ret;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_add);
> > > >
> > > >  static char *dma_heap_devnode(const struct device *dev, umode_t *m=
ode)
> > > >  {
> > > > --
> > > > 2.43.0
> > > >
>
> Best,
> Sumit.


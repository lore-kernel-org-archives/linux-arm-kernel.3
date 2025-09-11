Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5FCCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1PODi6H2K7+3LlGxoQuwHZt3UE/qkC9ZdWrwkyFJNM=; b=piU0e73h3o9KyhB/TjPl24m1w4
	KMeSKJUPXJXrVydMYSPCiKzrK2fyVNPfbcYeGCrZihnDxZ8l+k5nQBYvrLrLIWTUUh8QurAYOzFV5
	gIwns0MCG+AsgbSUR5KKdadL5K/8/5OkILCegur+RaquXrDuE27sGzg54eLLT3liUCIQahGML0gKU
	b3RcVf/L/zhh/z2Ivy4PfnqCGKRYeIl39wTDQAqYkJZqHojRVmduezB8Mm4CZGVwNLcR5PvfkuJ8T
	dmFsX07BLCS3FAT18ak+0vd2qOE1rKt77ptfpsN4tbTPFVj0ZxG9EduTAyNqeqlf0yUDNN3owqp55
	bds/Vn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcEc-00000001gb4-3vVL;
	Thu, 11 Sep 2025 08:00:50 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcEa-00000001gYo-3sNI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:00:50 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-623720201fdso846348a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757577647; x=1758182447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1PODi6H2K7+3LlGxoQuwHZt3UE/qkC9ZdWrwkyFJNM=;
        b=SEnYGDDBXQiP/czFDVWCji1mBHw1JFfIDFR8oIQFhFtC32IRyvCx81tXMRzzUDP+Fi
         OdTKcillKTxT6gMA8FgX60XyQ94Yf1h5aUaf/i3GGMquy0NguLB2DHF92KxWGyHRZcME
         6B5MOmGu+luZDln2Y4Y9GXdCT4RnJ68f+lOlY9WhNEbYdXaAmeo0nit0/ntDZLcRcLC1
         L0d1I6BoVUDvZDrnd3zMhnFy8nNzRuAPRwsBEgQwx3pXeKi1ICinCAV/TF9OJlxrdqVJ
         eLQjKtqXYdksBgOgJg/myKNt9wi1g6k8Uz8c0x+Oe/NcWDPdiLOO4v8QZ8AgiYN6OQ4V
         TRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577647; x=1758182447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1PODi6H2K7+3LlGxoQuwHZt3UE/qkC9ZdWrwkyFJNM=;
        b=dcTsXnZL2cs0TrBzkcybGOEFvcu/VT/rpNulnR3vBiCRH74LdjxV7ZZqCZ8hanZhvt
         +oXlrwUElM2APLmCanWv36U+WfY23uakVxRWf57uwJeR8L4S2+9lke2ccJc9XmxuPkiq
         KWBx4DNbcXGul1sEumP9fW45/8+QhgqfpLeMCsD64xmC3JfF2o5zk31uooQDZSk6jSRa
         U3uKUXknBhaXor6QNo5PArpUam4/OACvekokZpT7p7Q/FOflrDuT1hbCvrTsrrS0oVe+
         oLlF19cdeY9JfIxpXLrrYQ99wW8Ln4Z8+jnf7ugiFxWDPq+Zx6bUWevuaqiDaLfwYcx2
         xyEA==
X-Forwarded-Encrypted: i=1; AJvYcCVidFGI3NeBcs4irbd9kf1S8oHH/jKQPNJ/7inJjP5fH/50V+od2F/0TyekGVxfvOvsNchnqwHaD1OLPEMZih/e@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ/JXeu6N4DHeHOPvblRpbUw2oAL+zKOI1FK6dj3HfGlBecE2a
	98uT9tRQ3yxDzoPSC4vWai1uEhVCpFMLpHUyp4B1VMVpJLdixowbxRrgAao5pKb/H4Z4lQ2gIiI
	9zLzricKhxMxfw7fffJi2nVjKMMzIclsKVdPoI3CblA==
X-Gm-Gg: ASbGncuRM62jAzPeZNvimGN5SXlsDiXjObYJPY0e3Rv1tdPq+WFDS3R336spfNNCKh+
	9cw36nabkw+wJsj+KTQhZikEFsb6RPsKnJ20QjIbaTjGwQTzjsani4NHN2j/4i3VZdfDczLEWgb
	8AMhgLlPVJaXDjRhc+d/n6K89lo1tVGfF3y7q4YEKQ0ZeDg0ioqEOxhWwGgUYPBdPuHTRfikLbq
	zZbS6Up5Lx4HbzmY11EuWwV8qbV5Jh5zjVv/twSChA7qAeAlA==
X-Google-Smtp-Source: AGHT+IGzEzYwQLiPc3IcgYMCTY8qsO9y3WwakWS4JOu30bLWGh1BqDh6LLf50f7d7Tw863clhJFa4G2RQKg6ioIUUPY=
X-Received: by 2002:a17:907:d16:b0:b04:568b:8a42 with SMTP id
 a640c23a62f3a-b04b14bbbf0mr1838289166b.29.1757577646906; Thu, 11 Sep 2025
 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
 <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com> <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
In-Reply-To: <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 11 Sep 2025 13:30:35 +0530
X-Gm-Features: Ac12FXxwSUSxE1PNcza1ZTKnBgiGX0FqXLDfvqSE4P5WPQr00OaAEtYCSrcigho
Message-ID: <CAO_48GE=FHaNzybUxjY=igyOO1oasKb9yu_yAjJEdjTQXicaJA@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Jens Wiklander <jens.wiklander@linaro.org>
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
X-CRM114-CacheID: sfid-20250911_010048_992180_5CA73B34 
X-CRM114-Status: GOOD (  29.58  )
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

Hi Jens,

On Thu, 11 Sept 2025 at 13:20, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
>
> Hi Sumit,
>
> On Thu, Sep 11, 2025 at 9:15=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro=
.org> wrote:
> >
> > Hello Jens,
> >
> > On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote=
:
> > >
> > > On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kerne=
l.org> wrote:
> > > >
> > > > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > > > Export the dma-buf heap functions to allow them to be used by the=
 OP-TEE
> > > > > driver. The OP-TEE driver wants to register and manage specific s=
ecure
> > > > > DMA heaps with it.
> > Thank you for the series.
> >
> > Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for =
these?
>
> Sure, what namespace do you want in the argument for
> EXPORT_SYMBOL_GPL_NS()? "DMA_BUF"?

I think "DMA_BUF_HEAP" may be better?
>
> >
> > With that change, please feel free to use my
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Thanks,
> Jens
>
> > > > >
> > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/dma-buf/dma-heap.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > >
> > > > Can we get an ack from DMAbuf maintainers here? With that we should=
 be
> > > > able to queue this patch-set for linux-next targetting the 6.18 mer=
ge
> > > > window.
> > > >
> > > > -Sumit
> > >
> > > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > >
> > > Sorry I haven't been able to participate much upstream lately.
> > > >
> > > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-hea=
p.c
> > > > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > > > --- a/drivers/dma-buf/dma-heap.c
> > > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *h=
eap)
> > > > >  {
> > > > >       return heap->priv;
> > > > >  }
> > > > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > > > >
> > > > >  /**
> > > > >   * dma_heap_get_name - get heap name
> > > > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap=
 *heap)
> > > > >  {
> > > > >       return heap->name;
> > > > >  }
> > > > > +EXPORT_SYMBOL(dma_heap_get_name);
> > > > >
> > > > >  /**
> > > > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dm=
a_heap_export_info *exp_info)
> > > > >       kfree(heap);
> > > > >       return err_ret;
> > > > >  }
> > > > > +EXPORT_SYMBOL(dma_heap_add);
> > > > >
> > > > >  static char *dma_heap_devnode(const struct device *dev, umode_t =
*mode)
> > > > >  {
> > > > > --
> > > > > 2.43.0
> > > > >
> >
> > Best,
> > Sumit.



--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed


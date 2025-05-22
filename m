Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06AEC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=; b=Qmo610Yn/z+W8K4K9xkfTO0qB4
	ysyMXfhw8TlRFSzm24l9n9ap+S+vfHOLKWeUs+Gqfi+BmXEjoquEta09uunO6JJvFUN67tKGMdIKZ
	rn914Jvhj+EPuL78hbQNcWq9rFqqDLyqOny1lfMRuiLcKzbI9IKdnJc3EPSal6PCbHmugBLVvHTZT
	BQw2yhpKqOCWCsnw7hUn4WFJOtAvRnO5D3x3I2xTLfHSbk2Sg+9/WeRqpj0dEDfxzVS2LWTW7R2a5
	tnMmB9CIHMdQ1RlmvmKZLVeFqmxpxyxwEc1tT0AjnaA290iQxIIAi3Aqmm8SOH7Xmrtzl2MZUxJQ0
	6zpaj6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHztE-000000003a6-1tOF;
	Thu, 22 May 2025 06:58:52 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzrA-000000003GN-3jdh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 06:56:46 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7311a8bb581so5807992a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747897003; x=1748501803; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
        b=AILPDw8+kTXmpbgcffam5PPAsLqDKlAev40yLqSg9xsbq+Pn17G3FYynb39vI+PFMW
         V8uP9FcnxkZAa1ihNLc8cGWnKCJ7W8hx82XrLZgB47UR3smspeKFMKMlaypvWDPmgbKp
         8NE1wSD4m8EmBxPee99uHSk7YHm+z7NcQl4iI3FsZtMPWh4iJDCsMdJF22TwbK7PzIG1
         6IjhFexMtU5xGqP1FdDcEHdlcjPB0NASb4VAPxIR1hzMP9N24Fnz2bYtgWeNbuU9NDoV
         dKiC7F1zoyDxDwJzGkCFjXi4U2cb/mzeXJrAkYgXwYcoOk37vVP0dOStBkHA5AmJD2zp
         J4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897003; x=1748501803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
        b=xJNQ3obEmYxODy1TqscwlHEv8uGqzvsey2PJBDmZ1Vog7hUy7TaqUWMYTkhyZkWq6a
         8PwzX/hggn5wYI7XFUfEkJX6vGPODuEeL0UGSCGJ8VvuknUdx8fEOVk+PzbCS3PQScCc
         m0h2yYzjveyt2IMfqnjny6akBFUAJZNCU0HdLJCrV59fmBDo7ydTjto6BAk+jfg6d7er
         BgObfRKd4qj19ESF1tYh+i3/LyMIJvNr5esBDfcBxi5qdbSlPlP/nxWCJbuqO4eHja8a
         R2xaKz1TrgiUau0Zr1CAv+1KIW0oLEGhZKqPoDqXuux6EYOBmuL1LIhjX5+ly7QE3nIN
         IqLg==
X-Forwarded-Encrypted: i=1; AJvYcCVHFey8IHfJAobNCzt2umveCt1SsZ1xLTif3ltEqcG2E9S39iFenS5r6wOkkiajf28L1LZ4Z/3+rcN9gn7Mu3MB@lists.infradead.org
X-Gm-Message-State: AOJu0YyCGDi7QtiDgy4D+vxbfp91+M09I4j8aXtSLPxLeeGmPQ/iVql7
	h67lvWZtun/hThyMT+HOMLVMnhvZfgYtAjRQp/EdgzJqufCU8g3ld0bPLftgsWUaTF+Cw+1l369
	/YPcyPzCcQZZYF0DOSSpb5nBqDDt8oNZJl/RvgqKcfQ==
X-Gm-Gg: ASbGncuEb0FcHNGH/B/oKhi5VaI4WgqoxdQ9KToZI9BeF4YSR7XNxlUWHmVPALwnUV0
	cHhizM6hTZGjJXJ7HcBtHEak32ga7qsTQH/d5O9+d6PB88n9J4q0x9pk6t3TaMGiY2HjeA96M3p
	8IFgH4C7mjrHhiWvW+EDmvFCwkBTiwvtaolQ==
X-Google-Smtp-Source: AGHT+IHkFUemf1YsBa7Ra5vRLLSyYkClMUJvfuEYqOo7C5Q/HY7RUEskcqp+LiC0Z8m9NvJveoTaK0UdZlaYOd03Who=
X-Received: by 2002:a05:6808:6410:b0:3f7:ff67:1d8c with SMTP id
 5614622812f47-404d88d532amr14478281b6e.36.1747897003075; Wed, 21 May 2025
 23:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org> <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
In-Reply-To: <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 08:56:31 +0200
X-Gm-Features: AX0GCFsuHYqDh1JYpWH8r8xDir4J3V2XXHJjiARqLynYHFcDQxMIIZpQ5oYhZd4
Message-ID: <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_235644_936948_62191FB0 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/20/25 17:16, Jens Wiklander wrote:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h>.
>
> That is what this patch does and that should be obvious by looking at it.=
 You need to explain why you do this.
>
> Looking at the rest of the series it's most likely ok, but this commit me=
ssage should really be improved.

I'm considering something like this for the next version:
Export the dma-buf heap functions declared in <linux/dma-heap.h> to allow
them to be used by kernel modules. This will enable drivers like the OP-TEE
driver, to utilize these interfaces for registering and managing their
specific DMA heaps.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..cdddf0e24dce 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_name);
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL(dma_heap_add);
> >
> >  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
>


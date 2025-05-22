Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73728C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=; b=Fh77bmj8rV/z7bebonuAU8DNSM
	nVcehVlj6UcrSKoujBX12PCp3lzQlVresxEJe31zCFYeRPq5orKu0nmttuy9pzDhrDGBahEBH4BDW
	HqsWhe5rJkBNpW1cLF0XYIDkEVUNJ22daVuxp+hw7aAUQvf78yGzjDMPZdBgnKnPWt043SgmEO2b4
	+AyPo3YsOySfP99gzNB8N+BCoW3d/1sjAq3Ycr5iViKwc9wkVsW9wUSWFxL3W+vOlKch9fIFUBteD
	NZO45dyuGamF5JzlbRJ9WMKZad38xZ8IIwH2h2LRjMfcysOLvREnDpJLyVYua9epdOx0vlstsfmcv
	HZ77ya0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5CM-000000010Xy-1TNJ;
	Thu, 22 May 2025 12:38:58 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5AK-000000010Jn-3AvC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 12:36:54 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-40331f302f1so5021070b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747917411; x=1748522211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
        b=VYhgElvOEjMfXERgGW6HTr2txS2GCNQF4CTMUG1E9odkfcwCiiYGwnyG8Mn7ZOvquy
         QRkZ9S4OjmFPhd3HQKw2KT568uiIi95l/TY5eQq1WxPbvnTH6xjs744yYJl3QhX6yfFK
         drAtvlDQwS1B0nt2YLHHdSijf1A7j0S12ye3VkPdAsUeBgXAdJfiP8xS1VpE8Y6vkyhP
         CzpcHunQ6c8FT7eX32FaJCOgFSIipEbRpBQtirEKPhx3Vu5+fn/lH7Lbr9bsfNwKdeFB
         pdUOfymbv6NP3mPFyqcTShIkIw4ZTf/YPo7SpAPVcA3fHCB9O7qMfZcP6V185BORAuNl
         XysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917411; x=1748522211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
        b=bYd6tW4cqIwsiSaRZPXLrTOUoukNYrot9lp05PWHqVynrtUiif1lhggjKlF15VaE63
         el3yPpkHcsM5BQ0IB+myngqA4TrMbGnzfnYaxbMAnpoIMY4e+rvWkh7igTroyv0DIGDH
         t7JgxBkTubyK89+pXV8rcxXj7dWZzwmASQmQh0fkxzgsJA6AR+ASJcLDMtZjEUY4k1f2
         QZywHk06KTuWiJUXaiqFLiDOihCsdFwDvJv3w2mA1tS5x5I7jJCCkzupF4SPB6AxsUWJ
         7J7CTTH5PJH4+Gr+MXg6qW7JpAYSj7Vbg8V6vm5Y1YhvwlYWU7KqaEYZU41XQa7wJSzN
         Qy8w==
X-Forwarded-Encrypted: i=1; AJvYcCX7ex7N3EjheKc9JyqGliIUa/gjj1LBmrwu5SflOI15TPlL9ohM+wmFkmUtDwomx9RTuF27bGIhBoSA822WPgqC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0JJ5Umrm7JlvRtZ1dpNomSLJqxPh6P5Qi+uv3dyAB6UhCk4uA
	HsiBEHjyl3k3vmGAHmeqKP2ruQ/lbTpoKdxWiM5OzhCWxiRKsme1D27lsfWh9XkD4QA4/q3AHAZ
	BC0ydrXnJuLroLg+hP2avfq59XRj5+r1XVmE1CrhA2A==
X-Gm-Gg: ASbGnctHQjse3OJfPzL49qhTE9MmphvAK61Of1gXwg3E+43qDPmcb4+WD4zfWHvhThh
	0rPJWYlBjVjCmJ06n2WaICzwXkGyGbcEi6u1cTHH70o7FT8FGYvAsZhNHWhxqdpPDm/F/CuX3tW
	9qwZJ1Z420QLGfphffaBUbfRPg+MqP9NTyFw==
X-Google-Smtp-Source: AGHT+IFaxfBHByqapVV2RXkEPTMYtDPJFaizTF3QtPLs+N+jP8G9GyXQ9nHLQfE3byrCa1MQmfMacM+snhhkwuWXSyE=
X-Received: by 2002:a05:6808:338a:b0:3f6:a9d4:b7e4 with SMTP id
 5614622812f47-404d86f3f18mr17232381b6e.20.1747917411552; Thu, 22 May 2025
 05:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org> <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
 <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com> <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
In-Reply-To: <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 14:36:39 +0200
X-Gm-Features: AX0GCFtomK6Kj4MbJdPbWNPCFM5pduAepClCBqfPEiiU97RKWiikvixpOO2yK1w
Message-ID: <CAHUa44Hgu9DnmeGXAoFKkRBt6jFCAb6Mi5zzuuvVVSgsxDZQWA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250522_053652_811343_328F40DE 
X-CRM114-Status: GOOD (  26.10  )
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

On Thu, May 22, 2025 at 1:52=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/22/25 08:56, Jens Wiklander wrote:
> > On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/20/25 17:16, Jens Wiklander wrote:
> >>> Export the dma-buf heap functions declared in <linux/dma-heap.h>.
> >>
> >> That is what this patch does and that should be obvious by looking at =
it. You need to explain why you do this.
> >>
> >> Looking at the rest of the series it's most likely ok, but this commit=
 message should really be improved.
> >
> > I'm considering something like this for the next version:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h> to all=
ow
> > them to be used by kernel modules. This will enable drivers like the OP=
-TEE
> > driver, to utilize these interfaces for registering and managing their
> > specific DMA heaps.
>
> Works for me, but it doesn't needs to be so detailed.
>
> Something like this here would be optimal I think:
>
> Export the dma-buf heap functions to allow them to be used by the OP-TEE =
driver.
> The OP-TEE driver wants to register and manage specific secure DMA heaps =
with it.

Great, I'll use that.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Thanks,
> > Jens
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>>  drivers/dma-buf/dma-heap.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> >>> index 3cbe87d4a464..cdddf0e24dce 100644
> >>> --- a/drivers/dma-buf/dma-heap.c
> >>> +++ b/drivers/dma-buf/dma-heap.c
> >>> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >>>  {
> >>>       return heap->priv;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >>>
> >>>  /**
> >>>   * dma_heap_get_name - get heap name
> >>> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> >>>  {
> >>>       return heap->name;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_name);
> >>>
> >>>  /**
> >>>   * dma_heap_add - adds a heap to dmabuf heaps
> >>> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >>>       kfree(heap);
> >>>       return err_ret;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_add);
> >>>
> >>>  static char *dma_heap_devnode(const struct device *dev, umode_t *mod=
e)
> >>>  {
> >>
>


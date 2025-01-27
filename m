Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BDFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 19:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VUoGCwfVNYXwKgXNKkHD5VpTMGwmKU++/GyIsT0nn8=; b=wNQh+ntWl+GQ+UzeJuuKcWh0a9
	YN5TDeUvtWYEEJVWgrX/mnb50H+0/Kel6X8Dy8/tKD7cDAxYQPi0e6SxvW3+1/dNKO4BgiAdoFC1p
	Pmo3HM1yhjxPwnseB5BU5cHL0bWOm0m1w0vnDDCCwpSpP0Ys+2EJJp8O1IYuuNdvjemTnX4czWxw+
	tnv4+sI2WfamHyMQZi4ljMOXTFXiIWcHqVAAdtECky5L6QNBeumTAYQ1B8j5cG+BdADncNgA3v/MH
	z/nNFRVMrEFq9ZTToksHblcvowAZzvRELGzM4gssviay2iAvKQ/HXJvDczwCuQBV9ak1/sSatG3eE
	iMmazg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUuP-000000038Dl-3boL;
	Mon, 27 Jan 2025 19:36:33 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUt3-0000000388T-1uwl;
	Mon, 27 Jan 2025 19:35:10 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30613802a59so52799971fa.0;
        Mon, 27 Jan 2025 11:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738006507; x=1738611307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VUoGCwfVNYXwKgXNKkHD5VpTMGwmKU++/GyIsT0nn8=;
        b=A6KcZjd3O1f0GZ4FySxm1imoHM2onTU6HGPXEpne4qN9o0UavKsePH6lazxQRg4AqG
         xeDx1afJGTBRdp6FMcl9ST7R452h6TxXUX9jYoVCD4R3SGu/e54nHxLhb54d361anYEb
         v7t3Dip+Eu89sCIK9aWLQ0vY4L4hkudEwU9S5Sw0iixHEE9z+EdUyBQsurJqs9cFh8Ac
         XzzLod86hnbneddRuMTHdn9uZA/ERX1hkzqTq06cuzYSXo/eie8UyeNUn2/8JeCb2FLl
         gPxd4D4Z++lj0nwr3+CmytBtJveuzmbNVUmmrCBATgCy+PDU7GW1tmQCpUhwxmIG7PC5
         fgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738006507; x=1738611307;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5VUoGCwfVNYXwKgXNKkHD5VpTMGwmKU++/GyIsT0nn8=;
        b=Hp5gmWSNw35HT0V8Pj306MplS97KTK8a+SUo1LLlqy8b0/7PyumIscbDsqjztJwPyE
         HdItKbMGnqUDWnzgtnPFFAPVMw1NFqabt0A7VznhM9OaUWSRQhuzMu40zPXl0qq2HFkT
         cM65pVqvb0Tc/ea7KXsKWK1J5KV8j+FX23HG9LHEwscdnEMDvx0zYwWff3jnS9wGAaqx
         Xuz5sGK70TvDwf/QoVUTBVCj9eWUMtnjvLePZJwtC3xkPeAk8seJUezRYOVe4UgwVG1O
         jRuBuo48R1FtdIDUh/JQdSxLW6XJ3OFdY2Y9kgWF5SXvrGBO+Uh1p13uiJbihJTKpR7w
         8p4A==
X-Forwarded-Encrypted: i=1; AJvYcCU26vvj1dcdHOJhiB9BQlQRKNKZ2H2mCQevtdh03SRe7h5XyWz6mxwY+ulIYwQriQFi7ysS5iY8bCDiSGkBYCR0@lists.infradead.org, AJvYcCVYpGOi2szNMyy4NTkOuS3KbCb3cKR80sQ2ZhNYutadpXswU4NrmTFFKDPl1xBbk+MPQrizj6MV8mykO0hiSb0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0jg0/7uJuO5Fk2SZM2WVQ5czq9ba4/GSiv818fgouSdR5nLry
	BdUT6rsJTOi8HlZwH4fVwnlkcdssXa9e9RR8feYAWYjVpTUCpUnq
X-Gm-Gg: ASbGncuJ66iUzXg88FW3UrdXGQnsvRxvisuffMoip4ILFp4b85UUrfzhF4SO1UQirCg
	KWpb9iZ78wSRBH6p5gLMbtivuio/RHmjSrMi2dAVDDs/7rFCfET5GGJmaIyxowCOtqt5yaTBlmp
	0u2b/cx0nj3GKlJQXweVzCfDbrnCXwBDF5zqCqUMXkgTLQt2Nmwb05p0Ki/TRhZUt/wgNGCBQM+
	ycOqZwnD8StNlEtLYFB9JEpnVOuhnJYaMsK1xfAxnWKtewGHClidIWFtJk/Osb4T2nlsttY61W6
	ebImnuBhwYiJFaV0UMuvsX3PvzfHIZNpUU8edP7RuY9paJ927Xsy9Z17iO89qSwzIvoT
X-Google-Smtp-Source: AGHT+IGYlUkHvv8II3ZmzjPYZOyuE8bYVugVsv3AwxgDWrxCyoTSMTVmYGtMCYbLyZ+vF5rQMN00+g==
X-Received: by 2002:a05:6512:1247:b0:542:98e0:7c67 with SMTP id 2adb3069b0e04-5439c27d401mr15203413e87.51.1738006506652;
        Mon, 27 Jan 2025 11:35:06 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8381772sm1375919e87.249.2025.01.27.11.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 11:35:05 -0800 (PST)
References: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
 <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
 <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Mon, 27 Jan 2025 22:25:51 +0300
In-reply-to: <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
Message-ID: <87jzag82zd.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_113509_500266_3C14E04E 
X-CRM114-Status: GOOD (  27.05  )
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

Hi Tomasz,

and thanks for your review!

On 2025-01-27 at 20:18 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> Hi Mikhail,
>
> On Thu, Jan 16, 2025 at 2:25=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gma=
il.com> wrote:
>>
>> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> commit 129134e5415d ("media: media/v4l2: remove
>> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> no-ops, making cache maintenance for non-coherent dmabufs allocated by
>> dma-contig impossible.
>>
>> Fix this by reintroducing dma_sync_sg_for_{cpu,device} calls to
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> buffers.
>>
>> Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHE=
RENT flag")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 14 ++++++++++++=
++
>>  1 file changed, 14 insertions(+)
>>
>
> Thanks a lot for the patch!
> Sorry, for the delay. Ended up being sick with some nasty cold that
> took quite a while to recover.
> Please take a look at my comments inline.
>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/dri=
vers/media/common/videobuf2/videobuf2-dma-contig.c
>> index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..889d6c11e15ab5cd4b4c317e=
865f1fef92df4b66 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -427,6 +427,13 @@ static int
>>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>>                                    enum dma_data_direction direction)
>>  {
>> +       struct vb2_dc_buf *buf =3D dbuf->priv;
>> +       struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_finish)
>
> skip_cache_sync_on_finish shouldn't apply to this function, because
> the buffer was shared with an external DMA-buf importer and we don't
> know in what state it is at this point.
>

Ack, will fix in v3.

>> +               return 0;
>> +
>
> We should also take care of the kernel mapping if it exists, because
> on some platforms it may not be coherent with the userspace one -
> using flush_kernel_vmap_range(). Please check how
> vb2_dc_prepare()/vb2_dc_finish() do it.
>

Thanks for the pointer, will do so in v3.

>> +       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir=
);
>
> We can use the dma_sync_sgtable_*() variant here so we can just pass
> the entire sgt to it.
>

Will do so.

>>         return 0;
>>  }
>>
>> @@ -434,6 +441,13 @@ static int
>>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>>                                  enum dma_data_direction direction)
>>  {
>> +       struct vb2_dc_buf *buf =3D dbuf->priv;
>> +       struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_prepar=
e)
>> +               return 0;
>> +
>> +       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_=
dir);
>>         return 0;
>
> Overall the same comments here as for
> vb2_dc_dmabuf_ops_begin_cpu_access() +/- flush would change to
> invalidate.

Ack.

> Best regards,
> Tomasz


--
Best regards,
Mikhail Rudenko


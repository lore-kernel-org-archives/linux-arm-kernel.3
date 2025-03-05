Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA617C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiTpS6soFncX3ap+JUlkCx1cOPiDwgUNOLW0huS1jJo=; b=iot1y0GWhIUdgaO4+8dHMG8y37
	uFNMMTihR6uzvwQwKp61deMYq2oVPMyICyOPF77GonjULYWxILaJK5pX+nerOh8wsO8mH/m/xCQa5
	i40QrxGbSpYo+zNaF8NHVYYPtTvAp+RvFF34Lta+/YyGdUoQgmtUVvV4puQQc8hfSMjKfa2p2zK1A
	Fk5mGblS3HHp2+ZqfFr2HC9HpJvIqKnLSaLC5M36TbSEbud7yzxD8jdqFyljkT4hPKQ2n+CE0k4T1
	4ZCjnR0kKWeQtgt/NuEOE6pvNvzH3UYzToVCN8+hV+ZOypXZXPCcxmqHADSHYdI7wc1AwsLiPc9Hp
	pa4lUqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkq6-00000007Tlw-3xPw;
	Wed, 05 Mar 2025 09:14:54 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjZX-00000007IHN-2VRe;
	Wed, 05 Mar 2025 07:53:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54954fa61c8so5306325e87.1;
        Tue, 04 Mar 2025 23:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741161221; x=1741766021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiTpS6soFncX3ap+JUlkCx1cOPiDwgUNOLW0huS1jJo=;
        b=G7oOLH3zeugRFmagiKpNE5xYgbj6zWgt8ne1KZTM6pSuVQ5EzoxAJ12Y363yRNrpoZ
         Sqrvb3++EM2HYW4d57wp+wWHZuVmqZtlrQKi4P5ZPvroZoGKoRH/KluhqyXOwODjQn3L
         M4NjKNYtETf1O7J31vDvgG6oUQAf+f+6gFBA9y4GKh88kt3RfFNX4jUUVbl2fafXk2uF
         necHLJVVlDGWkYynOnEmVpf5LBLCwDAy7azBGdLDTZbDJMoO7hmNrevac4GCgxLU7HWD
         UPilOwAosOs6J6lUusqAWfs+X0k9wmA+53lHSmeuMAcEOzI7B1NEJlRexzS7PNs2iw1q
         hL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161221; x=1741766021;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HiTpS6soFncX3ap+JUlkCx1cOPiDwgUNOLW0huS1jJo=;
        b=KAlortb2tYpo+RSEf0RJ8e5dyVN0dE0+RuL/0hy/qipk5v7QADAmgnpIWC4icDzxOa
         l2Y2N2Zy+Q3PdzDzBL/85AVEGleio4Ca9ts8XMQErpuTK/l2hrZYVeDp4SD2MP4euIl/
         htkC5cMA5uDQqls5UK1YuNClMaz6eZdzLIBIKCcul50P7PYiV6RUU5fM9A1g/e/6TLcx
         pbLLvP9J2t6nj1jtCu7qk8YqtEPC4Y2D6jE2agDDi8Iz45mo2t7cGoFcaUQUn7nc+GhF
         ht+Yduf92xXv8ZlawOfPLWHzQmo/k58lHd+t5ykstNzEOMQCUxZtQyjHdwSs6NukDkv4
         0Uig==
X-Forwarded-Encrypted: i=1; AJvYcCW/WxL+whbTKAj1XONuVydBpeqiHHGWOKCGHTSFFf4nb+S2NXUgQUXbS7qBz51bBMaZCgdlqEghg4HCo/r5/P+C@lists.infradead.org, AJvYcCX+Cc2V0fob4FjQJhQKE0bqRSeYenfotbCMDNj73RDOcLxpHzi2/4sGX7lT05nwtwAokunrnzaNMkns92tG7oQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6qxWvQ2cGuFF3DOm9SVCIMtDWcQJT+dhd1W2688sAtqT5LTDi
	uLUPjNahX0mfxZNseMGacdU6DR7gB0J5Tcp9g7A23QM+zHRj3sRq
X-Gm-Gg: ASbGnct6q38pBVyEC75GhpbXE9+NmQJiHTdr03P97hqDl+V7GIh9rh9S45nmoGdO3MU
	L16oEImdKFRfwWDx1cUcetwfm28VFDcZLhX3zDIogh79ePmnqWZNFuyym8Qdbw6OeZCz+RWOAxG
	nwV7qzogXQun8mR34u++auAn6o5Crix+sQUSbdlcD6bOWwuSANwzaD/KdkmS0kgPXN+IHNZGpQd
	ktuJfT5ZvxaabdxCX2t9UX8OgchFeBH5aATw+47uLVGVgtM7Jar8H7viasPRvirAvwFGWL/ii55
	FPJcF1NyjTJzYTs0Vy+tNBNhGXk4oInP6LJLg2mhiJlbKo2PnpUx1hvrG55eGCVd/Jt2ml2iSYN
	0ucRWER4wbVTbSh1p0FTmKyTnUiyqLAFB
X-Google-Smtp-Source: AGHT+IGoSfXFo2jQfX6zwJukiQLZftqM9VYE26ir2v2Z98LPwA2YNZbRZg8LePVsUKETExIau4wjew==
X-Received: by 2002:a05:6512:3190:b0:549:7c64:3bc0 with SMTP id 2adb3069b0e04-5497d35028emr565104e87.29.1741161221096;
        Tue, 04 Mar 2025 23:53:41 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495b3f4ebdsm1155605e87.102.2025.03.04.23.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:53:40 -0800 (PST)
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
 <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
User-agent: mu4e 1.10.9; emacs 30.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey  Senozhatsky
 <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro  Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Wed, 05 Mar 2025 10:40:31 +0300
In-reply-to: <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
Message-ID: <87y0xj29rz.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_235343_633942_2AB62DB6 
X-CRM114-Status: GOOD (  20.35  )
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

Hi Nicolas,

On 2025-03-03 at 10:24 -05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Hi Mikhail,
>
> Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit=C2=
=A0:
>> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> commit 129134e5415d ("media: media/v4l2: remove
>> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> no-ops, making cache maintenance for non-coherent dmabufs allocated
>> by
>> dma-contig impossible.
>>
>> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
>> {flush,invalidate}_kernel_vmap_range calls to
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> buffers.
>>
>> Fixes: c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>> =C2=A0.../media/common/videobuf2/videobuf2-dma-contig.c=C2=A0 | 22
>> ++++++++++++++++++++++
>> =C2=A01 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index
>> a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
>> bc888a84a95d5 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -427,6 +427,17 @@ static int
>> =C2=A0vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>> =C2=A0				=C2=A0=C2=A0 enum dma_data_direction
>> direction)
>> =C2=A0{
>> +	struct vb2_dc_buf *buf =3D dbuf->priv;
>> +	struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +	if (!buf->non_coherent_mem)
>> +		return 0;
>> +
>> +	if (buf->vaddr)
>> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>
> What would make me a lot more confortable with this change is if you
> enable kernel mappings for one test. This will ensure you cover the
> call to "invalidate" in your testing. I'd like to know about the
> performance impact. With this implementation it should be identical to
> the VB2 one.

I'll enable kernel mappings and rerun my tests later this week.

> What I was trying to say in previous comments, is that my impression is
> that we can skip this for CPU read access, since we don't guaranty
> concurrent access anyway. Both address space can keep their cache in
> that case. Though, I see RKISP does not use kernel mapping plus I'm not
> reporting a bug, but checking if we should leave a comment for possible
> users of kernel mapping in the future ?

I trust Tomasz here, I'd wait for his comment on v4.

>> +
>> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, direction);
>> +
>> =C2=A0	return 0;
>> =C2=A0}
>>
>> @@ -434,6 +445,17 @@ static int
>> =C2=A0vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>> =C2=A0				 enum dma_data_direction direction)
>> =C2=A0{
>> +	struct vb2_dc_buf *buf =3D dbuf->priv;
>> +	struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +	if (!buf->non_coherent_mem)
>> +		return 0;
>> +
>> +	if (buf->vaddr)
>> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
>> +
>> +	dma_sync_sgtable_for_device(buf->dev, sgt, direction);
>> +
>> =C2=A0	return 0;
>> =C2=A0}
>>
>>


--
Best regards,
Mikhail Rudenko


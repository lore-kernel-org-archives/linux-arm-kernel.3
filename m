Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EABE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=max4o05U6BdkP5TJyZsv6kGDcb+vMqaGNhBvv2OXqQk=; b=aV1cISqjlNxv4vps7Y2Bnycsj4
	a178f/Cr45ek8IgHTUbqxHfJxWAiMnqwR+9DLylK00VDn/pWojDidbWTQTKVNOepQ5xoLllOePdw9
	Q4JnDkNAhnoHTUmsno7ErSB5TqncQYcXLU1o3johGeVvGL32X9j/C46RuCIZHem6KRbmXsnbrvuGA
	oWMopMwwqYJNkKqFFh7/IPzD5keJlGf5O3suHjU34GrUfFXfT6XN9UEYqJIiZ5cQzu4EGUNNpJu7u
	+tFNG0ZU94eWNOxse1xlCQFV/CU76YW2VdCYoHwf3pd4EQ4ABs+Ju2pCYHuIKYxQkSekZJ8OLZBOa
	T80qrYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZwf-00000009Owy-2EbB;
	Wed, 08 Jan 2025 17:34:17 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZPp-00000009ICA-1q0b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 17:00:22 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so566335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 09:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736355619; x=1736960419; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=max4o05U6BdkP5TJyZsv6kGDcb+vMqaGNhBvv2OXqQk=;
        b=OF9SKImN/9ZREfllh1cGZ5O/UicVRxb18P+MKz5Hp7LNWpTxazNfHmbQP7f4HX3FB4
         eiT6dHd0ShpKdQcaEDvwdm2DIi/hD72EHlmPcwmwVOoKR8iiIz2FtxK9EsNO7DhrkOVC
         Kx5I74WFfkZ0HzPxWWU+jyIN8yifYawuEBh5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355619; x=1736960419;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=max4o05U6BdkP5TJyZsv6kGDcb+vMqaGNhBvv2OXqQk=;
        b=f+mDfTEht6OtA2hb0fYRS9UN+tkcaJoq0iq72fG/QRZxk/zeW80QFJrnqDHN4ZnKSH
         7lWiwzAx27HA9BYb87iB1l1X7vRvu/VnN7/+ZrIFgrLdn4JCQHGK2IwI+UiOTJnMtZXY
         8KMJ7iN57Tz6e41U5ynOyf8kuToiYu7j60/Dbz746C6HPmOWmS8BkhV0DpmVPSK5Mz+X
         rUxOvbMUw9IH5Qe37dpdueiSh/wgfb5oTjVULfz1XgZqVB0yX9LHhMwd9B39pGk/OPUV
         IbSXqA0u1pC7kX19XlvxPO1GlVUytVIEMFOUmuvir2oeDSp+X50kuose5A67y27Bm08I
         ld4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0Xf1FR9HV396x3QWR9vOkUCq3Pc6POlIlC53pyWUKR9a9mBLfwS++OLI/Qls5mBNOmXVGQbwYWT+Hp0wb+rlC@lists.infradead.org
X-Gm-Message-State: AOJu0YyBqjC3lOrRFbp2oNi4WB/XaLyKPTFo4cVaw49J8GIXnpxGgYj7
	vXnouBRuYLpJs3o32cAsJprKx+ciafYTUEQN66yzg6LW56sNfjVmE4p6FVVRI3U=
X-Gm-Gg: ASbGncv7dJZOqWsbIe5YCJyTshgJGh0MxH9tFL61S6RJveql+AJcHH8PgaW7tKG/hF6
	fUIWQCRtL+bYH/khHnXIPlWrYhUsSX8wLzdEZMys2AQ6nMzIIYKLZABYB3WpCwDjPlf6na9rBhY
	wBjdZMTmPjr0EmRZT1nBSm1F0H0xA11vis1qIetEX4iAGIQ3q0UEvAA6N29O/3ETaeKG9i6yzkP
	HFHU52RdvpF6B/vuHIHdzOf3HT3Huv1wXy1C/ZpnV0FHs3VSbkTYdqiGpScQAqGgUqw
X-Google-Smtp-Source: AGHT+IFmXBbhRF/ktEnx5uywuanupMYlXu4JXUiqRvhVOlqL+e96UOlNBaIepmawU04+oF/ngviO2Q==
X-Received: by 2002:a05:600c:524f:b0:435:d22:9c9e with SMTP id 5b1f17b1804b1-436e26d0cf9mr31801485e9.19.1736355619213;
        Wed, 08 Jan 2025 09:00:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8287adsm52618501f8f.16.2025.01.08.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:00:18 -0800 (PST)
Date: Wed, 8 Jan 2025 18:00:16 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lukas Wunner <lukas@wunner.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, simona.vetter@ffwll.ch,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z36vIB-JrF5Ddhuf@phenom.ffwll.local>
Mail-Followup-To: Lukas Wunner <lukas@wunner.de>,
	Sumit Garg <sumit.garg@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
 <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>
 <Z209ZegsmgN1xlNG@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z209ZegsmgN1xlNG@wunner.de>
X-Operating-System: Linux phenom 6.12.3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_090021_477021_9FDFFCAF 
X-CRM114-Status: GOOD (  22.47  )
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

On Thu, Dec 26, 2024 at 12:26:29PM +0100, Lukas Wunner wrote:
> On Thu, Dec 26, 2024 at 11:29:23AM +0530, Sumit Garg wrote:
> > On Tue, 24 Dec 2024 at 14:58, Lukas Wunner <lukas@wunner.de> wrote:
> > > However in the case of restricted memory, the situation is exactly
> > > the opposite:  The kernel may *not* be able to access the data,
> > > but the crypto accelerator can access it just fine.
> > >
> > > I did raise a concern about this to the maintainer, but to no avail:
> > > https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/
> > 
> > Herbert's point is valid that there isn't any point for mapping
> > restricted memory in the kernel virtual address space as any kernel
> > access to that space can lead to platform specific hardware error
> > scenarios. And for that reason we simply disallow dma_buf_mmap() and
> > don't support dma_buf_vmap() for DMA-bufs holding TEE restricted
> > memory.
> 
> The API for signature generation/verification (e.g. crypto_sig_sign(),
> crypto_sig_verify()) no longer accepts scatterlists, only buffers in
> virtual address space:
> 
> https://lore.kernel.org/all/ZIrnPcPj9Zbq51jK@gondor.apana.org.au/
> 
> Hence in order to use buffers in restricted memory for signature
> generation/verification, you'd need to map them into virtual address
> space first.

Nope, you need to get that old api back. Kernel virtual address space
mappings for dma-buf are very intentionally optional.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch


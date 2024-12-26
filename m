Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553A9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 06:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tj/33c0J9joYWGIFk0SUpBommdcWsbOtMfpln3ym7us=; b=P04SykUcmJsRHVgKgg4gvHRMwI
	oeayyb00elRk4J2n0wMyhO5lAsIT3fr1vQeJHlTNdXRIms7D8EUxJ9rSPENV0tutnECOeaVTug5NM
	XuZuPzk2SIsquzi8OD+Pzn2BtxIpsvzsQ12E1HRr4MBLVEr3jtc4kUbKqfQoyDqA63JROpcp3MdAj
	uXZL8RAYRXgTCFSQFuZp7YTjSWzLXaZACR9JUUA3DPL3O6v/RMMXku3+XglVuU91zBhbK6QXL3rjB
	CH0jPwuSA3ONd5MT6N+wBTEIcJG97TQroR1SmJs0HnokkGm80XrJmCnmOFReFhY9exTNYN5JabWhG
	71ophSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQgvT-0000000FGAH-2qIc;
	Thu, 26 Dec 2024 06:00:51 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQguG-0000000FG2a-1qnR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 05:59:37 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-85bb264993cso1050813241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Dec 2024 21:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735192774; x=1735797574; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tj/33c0J9joYWGIFk0SUpBommdcWsbOtMfpln3ym7us=;
        b=liLOGU8EZprfqk7O1PxBpkI0ssUsthq+8X1eHUqTF4Tc+f7u5E8YJitqh1EAeq+l3J
         GPRX9lamzoQjWwMO7FORPVE5Omb2Y95rVPf7842NsSzkEaxGxjBB/BdSjz2Q8uNicK+O
         W9W51g3uAEqoyV8H2De2BJ70dgZZdEloBVDhw9LJTP7MOqfR+upb/xBs+dfC0iHTY2uQ
         zw7c+aWPxDbO01mKK3fJW516bDjaCdWHXdVgusyV8MqelLmnx3mbXy0guxRzU8ckt2ql
         HoAKPSY9gJ1QooDwOAdJiO1AsCa8cre+DBu3PcXKjgRNB2ARfhYGE6WxkPFY9U47+ojg
         cBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735192774; x=1735797574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tj/33c0J9joYWGIFk0SUpBommdcWsbOtMfpln3ym7us=;
        b=XpMuw0oXpr3RO/m66cIs4cV32ik8oUXb7WBEYkxSAFoxBCLtKMjqMBNI18v6NX31Iw
         79ZXbJIigeYftw0a7f0PGrSz0ctQvKVHnIAVEz6Tabfy5ZQYJaGAtVL+3KknCigypY8F
         ttVDzX4u8rJx9Ju1oDbfR19+6IFuDUi1cZqLXoJ50mPz1Dn22bZ+RnhoeWgp2NzP1ofg
         izlyFiPHxRNxlmQ1QGwT3IZJqA7r2J2T1vE+vtalDe6iGQ15JDPjeA1mHbYhr4xnmsyq
         zs3cnjgooN2OU3uHofsP8xzH/Yonk32aoFB3tZjgtr65AgF896e1WEF2tM20T3PFfsBt
         47bw==
X-Forwarded-Encrypted: i=1; AJvYcCWczQGxD7/eSQ0zdCanFSuf4urJ1UwKA9DN5SKRoAV9lP0XIdQCBDDuljbHDFH9rerOiqz8CLIdlLANc6OoHAyb@lists.infradead.org
X-Gm-Message-State: AOJu0YzUVvS4ndDai+evQ55yvOgA/SS6YR7NgTRINkdM3tbSsbHpXX+3
	qP0BlvzqrPHl5mJQVfygrWUYJExlg+6L6R2fyiei/UTyG5sEf7v4amceEM7vAlngW5BL5VgAIoy
	a6zqtzYYv/Xal5HQ4KITcLAhy1AwUMxFJkyiqFg==
X-Gm-Gg: ASbGncstt0DX2/0XoeKu8p+sqFhOoL3qQtIrolNouqEWbXFwTNtb0JoQuTTrTo9iY1f
	RQ/Rs+gx2fF0V6xcXU6UfdeYNQW/yVWvSIx48nBA=
X-Google-Smtp-Source: AGHT+IE00N5vnKOUc7MqeRMXg+SxsijMu6w8qky0ELkHlxmHmPLT1blVC7fcWxjQJ3Y0TOTnD9UaTmwXTcjzXGMlnJk=
X-Received: by 2002:a05:6102:3ec6:b0:4af:bf45:39a8 with SMTP id
 ada2fe7eead31-4b2cc3a793dmr19596749137.16.1735192774291; Wed, 25 Dec 2024
 21:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local> <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
In-Reply-To: <Z2p-v-xjhzhPso6u@wunner.de>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 26 Dec 2024 11:29:23 +0530
Message-ID: <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Lukas Wunner <lukas@wunner.de>
Cc: simona.vetter@ffwll.ch, Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_215936_507711_02FB8067 
X-CRM114-Status: GOOD (  37.34  )
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

Hi Lukas,

On Tue, 24 Dec 2024 at 14:58, Lukas Wunner <lukas@wunner.de> wrote:
>
> On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> > Restricted memory is a feature enforced by hardware specific firewalls
> > where a particular TEE implementation governs which particular block
> > of memory is accessible to a particular peripheral or a CPU running in
> > a higher privileged mode than the Linux kernel.
> [...]
> > - Another possible use-case can be for the TEE implementation to store
> > key material in a restricted buffer which is only accessible to the
> > hardware crypto accelerator.
>
> Just a heads-up:
>
> For RSA sign/verify operations using rsassa-pkcs1 encoding,
> the message to be signed/verified (which I understand could
> be located in restricted memory) is prepended by a padding.
>
> The crypto subsystem does the prepending of the padding in software.
> The actual signature generation/verification (which is an RSA encrypt
> or decrypt operation) may be performed in hardware by a crypto
> accelerator.
>
> Before commit 8552cb04e083 ("crypto: rsassa-pkcs1 - Copy source
> data for SG list"), the kernel constructed a scatterlist
> consisting of the padding on the one hand, and of the message
> to be signed/verified on the other hand.  I believe this worked
> for use cases where the message is located in restricted memory.
>
> However since that commit, the kernel kmalloc's a new buffer and
> copies the message to be signed/verified into it.  The argument
> was that although the *kernel* may be able to access the data,
> the crypto accelerator may *not* be able to do so.  In particular,
> portions of the padding are located in the kernel's .rodata section
> which is a valid virtual address on x86 but not on arm64 and
> which may be inaccessible to a crypto accelerator.
>
> However in the case of restricted memory, the situation is exactly
> the opposite:  The kernel may *not* be able to access the data,
> but the crypto accelerator can access it just fine.
>
> I did raise a concern about this to the maintainer, but to no avail:
> https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/

Herbert's point is valid that there isn't any point for mapping
restricted memory in the kernel virtual address space as any kernel
access to that space can lead to platform specific hardware error
scenarios. And for that reason we simply disallow dma_buf_mmap() and
don't support dma_buf_vmap() for DMA-bufs holding TEE restricted
memory. The only consumers for those DMA-bufs will be the DMA capable
peripherals granted access permissions by the TEE implementation. IOW,
kernel role here will be to just provide the DMA-buf infrastructure
for buffers to be set up by TEE and then setting up DMA addresses for
peripherals to access them. The hardware crypto accelerator can be one
such peripheral.

>
> This is the alternative solution I would have preferred:
> https://lore.kernel.org/r/3de5d373c86dcaa5abc36f501c1398c4fbf05f2f.1732865109.git.lukas@wunner.de/
>
> > I am also in favour of end to end open source use-cases. But I fear
> > without progressing in a step wise manner as with this proposal we
> > would rather force developers to upstream all the software pieces in
> > one go which will be kind of a chicken and egg situation. I am sure
> > once this feature lands Mediatek folks will be interested to port
> > their secure video playback patchset [3] on top of it. Similarly other
> > silicon vendors like NXP, Qcom etc. will be motivated to do the same.
>
> The crypto use case may be easier to bring up than the video decoding
> use case because you don't need to implement a huge amount of
> user space code.

Agree, if you already have such an existing hardware use-case then
please feel free to build up on this patch-set.

-Sumit

>
> Thanks,
>
> Lukas


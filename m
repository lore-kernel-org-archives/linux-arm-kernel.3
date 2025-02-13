Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B439C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTmB7Ig1eQii2PQt8Vq5KK5KdLNWvxjjdgsBUW1hd1Q=; b=Hrt1+cXxr6L9UbSaEr9vfw2Snh
	+iovCPyCZ1wiEWzeNb7vgcAtXoLxI0eiILPkMnEdxcoleJwVwB6fyE/K7A4Z3pxUoboGkj28ZG+0R
	Qt4eipHWE3ki6CkMz+aAw867hQfaJ70x5JsMDso9MJLe52b0wWQYQet6XgKMquYWYLc0n/BDT7/Xy
	fAfrEhJ4g80QxqRge5NTU7smtXnjuArBvXIOaK0e3iBYSVF0PacSSIon/2tVNBCofn4+/+oVkvDXE
	pWbpYkTwShg8ahthsJ/Ve53kcyYPWUXFfkvcEtOOifw9YXHcor9XbHR8l+nCGzxb42LUBPSiYpu6+
	rCj3uXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSwf-00000009yrf-4AQ5;
	Thu, 13 Feb 2025 06:43:34 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSvE-00000009yZI-3Z4M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:42:06 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4bbe0d2189aso132692137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 22:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739428923; x=1740033723; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oTmB7Ig1eQii2PQt8Vq5KK5KdLNWvxjjdgsBUW1hd1Q=;
        b=bEYx7WkH2zhUb5TBLA2H5BinbhEUTPMVVgJ6DHYavGHPB871FzzHetl1duKcNH1YeC
         UPME4jgSINRoZxWmQXAQpyu9Os/UIYgkJcvry1mbI/VzsllBb8ppStmwhzOAtM/ESxiy
         71ci+inVEeA/hsTuMHJcvGqYOAr3xAA8NJ/EG4G+zuzppeZkcxmML0QGw9TJGwGalcIx
         BcjIu+NayAT4ShrqC2sslEvzV+72hioBepkZwfHCfnA+v5Aq1AzhMr7wkRnDhhFzAz43
         WO+EESKsfUdwUyjxwOq50BeouOvYmIuFu0WB7dNuBITZyoKCcZezQnPJ7ygFTVguPSjL
         3q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739428923; x=1740033723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTmB7Ig1eQii2PQt8Vq5KK5KdLNWvxjjdgsBUW1hd1Q=;
        b=be4aWa+6UCqXcv5AVmXwJQG/WWFzKAQDBVlijG3x/rTPj5jIjqOjqRFixlVrlMAuO0
         7cHBCNsiHAgE98wpwCmHglZUCnZz2scHB4dVqyCSviuN2avJcHmonyox8IulRhbVaurr
         AzHISlap5OgL+vKHpZ/RJ7vxKHzqcQIGxpLQXSvUVoRmy8rnBUwrkRKNH7PQKrFJFPvR
         nLCmz93FbvJIOdBPXL8nUKcmye7LlLFl2HVHYlMn0/5csyubzLH6h6iEymMYSpb7/9hJ
         j/aMcbx0Kuwf/CogKFb5W6few624AMSgffyB0fYb8Pjuxb5HLV6MBQbatGyPTF54K+F1
         0mrA==
X-Forwarded-Encrypted: i=1; AJvYcCXxmLHlHWRNPxwRREwWGY7SlNNl5HtQR6f5/Vrq6vWw/RUJzPp6BQwxK3yByULA9vVEq1gfhs4zyTh72WfuJ3RF@lists.infradead.org
X-Gm-Message-State: AOJu0YxNzu+38+0G5iV1U4xyhJek5ud0NgaaU0yysrcwp76Mjkgh9eAV
	TZvkB68ORSTP8H+Q3v9TrM6SM0610ghBysUtnZGrpFpSyuFD2T1WZNuB6T5lwHAMTUi3qjWzjCR
	GWnMMRM3wc8I3qT1kL+xkQawoJe8ZJ6BDt/LHjA==
X-Gm-Gg: ASbGncvf1sgWGfLHneh+b+IM/vFiVADPIjoRaxBmdaZ66mC3843xURILaiY86mIehKZ
	O7W5TaKxvATT49KbKhzEI+G46MsF9Y1HG8rPxixJqw5UEAMo1E7JvwfoAiB64FxWRjJQO4qM7td
	A=
X-Google-Smtp-Source: AGHT+IFhSui+oRYa0yiUwlfe4d8Dd+KjfAVoX7QGNMnwQAifah82de3Os5iBk5Pb0QFnrRe9uhZGgxrDA5ujKbbjaVg=
X-Received: by 2002:a05:6102:2c08:b0:4ba:eb24:fb06 with SMTP id
 ada2fe7eead31-4bc03562833mr2668789137.6.1739428923140; Wed, 12 Feb 2025
 22:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org> <20250212205613.4400a888@collabora.com>
In-Reply-To: <20250212205613.4400a888@collabora.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 13 Feb 2025 12:11:52 +0530
X-Gm-Features: AWEUYZkoZwXb13fMynlvth-g3hUZ-u2ftHq4Gn9B-5c6gMjO7S6PRx1iL7ELE6c
Message-ID: <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_224204_897464_7556E8D7 
X-CRM114-Status: GOOD (  27.81  )
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

Hi Boris,

On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> +Florent, who's working on protected-mode support in Panthor.
>
> Hi Jens,
>
> On Tue, 17 Dec 2024 11:07:36 +0100
> Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> > Hi,
> >
> > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
>
> We're currently working on protected-mode support for Panthor [1] and it
> looks like your series (and the OP-TEE implementation that goes with
> it) would allow us to have a fully upstream/open solution for the
> protected content use case we're trying to support. I need a bit more
> time to play with the implementation but this looks very promising
> (especially the lend rstmem feature, which might help us allocate our
> FW sections that are supposed to execute code accessing protected
> content).

Glad to hear that, if you can demonstrate an open source use case
based on this series then it will help to land it. We really would
love to see support for restricted DMA-buf consumers be it GPU, crypto
accelerator, media pipeline etc.

>
> >
> > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > restrictions for the memory used for the DMA-bufs.
> >
> > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > how to allocate the restricted physical memory.
>
> I'll probably have more questions soon, but here's one to start: any
> particular reason you didn't go for a dma-heap to expose restricted
> buffer allocation to userspace? I see you already have a cdev you can
> take ioctl()s from, but my understanding was that dma-heap was the
> standard solution for these device-agnostic/central allocators.

This series started with the DMA heap approach only here [1] but later
discussions [2] lead us here. To point out specifically:

- DMA heaps require reliance on DT to discover static restricted
regions carve-outs whereas via the TEE implementation driver (eg.
OP-TEE) those can be discovered dynamically.
- Dynamic allocation of buffers and making them restricted requires
vendor specific driver hooks with DMA heaps whereas the TEE subsystem
abstracts that out with underlying TEE implementation (eg. OP-TEE)
managing the dynamic buffer restriction.
- TEE subsystem already has a well defined user-space interface for
managing shared memory buffers with TEE and restricted DMA buffers
will be yet another interface managed along similar lines.

[1] https://lore.kernel.org/lkml/mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge/T/
[2] https://lore.kernel.org/lkml/CAFA6WYPtp3H5JhxzgH9=z2EvNL7Kdku3EmG1aDkTS-gjFtNZZA@mail.gmail.com/

-Sumit

>
> Regards,
>
> Boris
>
> [1]https://lwn.net/ml/all/cover.1738228114.git.florent.tomasin@arm.com/#t


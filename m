Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB62C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiZcI5pNzRU07XzzU8EnwEz/jsrm+hKHSzrUBfY4xZU=; b=OvI98n5er8D+e3jDyetHFga7p7
	fOWiYf4SVG9ApduDmnO/aZaXr8SjN0BvlTVBzX6Kw5MeDfe4+/CAmqyzj6yjVoVHlHL21SEikqTRq
	ljQ4Uiji5JBsaMaxpArdtM/lsv8qPdOK75pU0eDZj8dKT8xyYR5W55xTnn1KjBHYek1Sb1dDZPQZo
	aIcxH3lmDjgBwQKBrP/3jIlW0ijgLfRqqzZ4G3tHDUjTO063NlG7CRWk8Vs+WpvfhACOPHb6K9cwL
	usOnAalg2wEEtaHLchHo2y940l9BYxGKYFGMBg+7jqu/fc4fC0ow2VxK1DWISyqwt3UxLHiFmSCbS
	ybZw9azg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIJ-0000000BL2Q-3gMT;
	Thu, 13 Feb 2025 14:34:23 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZqR-0000000BFr7-0oCe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:05:36 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c05bb6dab7so94950085a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 06:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1739455533; x=1740060333; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiZcI5pNzRU07XzzU8EnwEz/jsrm+hKHSzrUBfY4xZU=;
        b=B9flqKe1lENvGJNYPW5/kBGoSup3lKjHZRAvSr1SVBBhg7J+RjkAWtuAys/fg6yw8c
         2YnMhBZhxwKxK+xTuesm8wend2rmFEumNuKPktfV3mIxvsaymtVa80d0zx9Hw+wFujfI
         g8OwPMFPePWNyJPiRQsMeu4tNioaENqG8l3sZqE4WMEp9VplT8DOc9hdDMtv39LFvVmx
         YaEWBuEE5FMMRp7iGWiDIpoYzkZ3xeCHJtDVR09PJyUcJsQEEg14aW+CqB7y2PlCPwKH
         X8V0j9koPK8U/V1xCexe3QrNPxigRhgfWyx6A2PA/u7Yk6TZ59UC+HqNPkA0cLIqq0i+
         pPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455533; x=1740060333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiZcI5pNzRU07XzzU8EnwEz/jsrm+hKHSzrUBfY4xZU=;
        b=fzEU/c8ppPFpQ1cO+E50LpW5ZzMfXxYhptbNIuTTG6OciOof8YqCG6/FBixxCadmEv
         gkPRw8RXzmyDQR352Pb0K7YDQ8JWwszDuH2UN67s7cxe4x57NO5NBFAdEBHm2/R/uD2N
         +PpQGSgRr1SPLHvTsXHSVzLgRDCWWk57dC4fZVpGUdaYAKtycZzyQS30g+wbHMu9sDAE
         LXvXB/Pg/SGLAjvsVb7NFRxVeEAsy7LVUv106pHw86SVNSI4kM5S80o0JZ6PxdxS6gaz
         ojOeqHBpezbmuTFcLAqhM2j4NZfR+pv0PH41ZEJp9zGKs95GYtl9F72Vu3M1wJ4qBgue
         gHMg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9JXNZdc4qwmqzCWQXPAcFWeCVfb3qWKj4QefMy6RVaQlvcUua7srBLU/+fhHPFHaDnlWPIx9HfzyeomDcetv@lists.infradead.org
X-Gm-Message-State: AOJu0YyHP9+cvRqNCyMGINYqh+WwMF3DEeNcYhGDPjpfw/UhVcjeq+Nu
	7MEhVC3G9U6xa+5yuey0sEc8w+JJZ+/xwRgg92AjqY6RL6xQscki2YeeocEqXf1vF3upjWGFAkP
	fVlGaQARo3G6uB+Dw0LsVp9BOQjYPMt+JG2wa0UoqnSSx5Ugz2RM=
X-Gm-Gg: ASbGncsD+Agb2HCoEQFW1Cc3FHjNsQ6sEU6PDxajma1Uhi+ARzLG+J6i92J/PJKvJKh
	tGYn679IytuIUa2Dt+CYJPLItaWiLageuLd/yqUfYIS83NjOs/8NCC1a0OmLAeWefDSkWkQ==
X-Google-Smtp-Source: AGHT+IGMP88jINMPoFMOhhs/JAOS7v2yzIBooFPBVGpWjkqaheBF8kqUyMw9whWPj/OQ8rwmytDe/wVilf8O/rIqWwA=
X-Received: by 2002:a05:620a:6841:b0:7b6:d611:ce6f with SMTP id
 af79cd13be357-7c07a89294cmr506602985a.8.1739455533614; Thu, 13 Feb 2025
 06:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
In-Reply-To: <20250213134008.4cbef142@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Feb 2025 14:05:22 +0000
X-Gm-Features: AWEUYZn29uWPvEYSBg2IY8QVofzDJvdO9H1dHkQQoSFoIsbJfLKOXfSzgdbP8WY
Message-ID: <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_060535_338078_505330EF 
X-CRM114-Status: GOOD (  26.47  )
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

On Thu, 13 Feb 2025 at 12:40, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Thu, 13 Feb 2025 14:46:01 +0530 Sumit Garg <sumit.garg@linaro.org> wrote:
> > Yeah but all the prior vendor specific secure/restricted DMA heaps
> > relied on DT information.
>
> Right, but there's nothing in the DMA heap provider API forcing that.

Yeah. DMA heaps are just a way to allocate memory from a specific
place. It allows people to settle on having a single way to do
allocations from weird platform-specific places; the only weird
platform-specific part userspace needs to deal with is figuring out
the name to use. The rest is at least a unified API: the point of
dma-heaps was exactly to have a single coherent API for userspace, not
to create one API for ZONE_CMA and DT ranges and everyone else doing
their own thing.

> > Rather than that it's better
> > for the user to directly ask the TEE device to allocate restricted
> > memory without worrying about how the memory restriction gets
> > enforced.
>
> If the consensus is that restricted/protected memory allocation should
> always be routed to the TEE, sure, but I had the feeling this wasn't as
> clear as that. OTOH, using a dma-heap to expose the TEE-SDP
> implementation provides the same benefits, without making potential
> future non-TEE based implementations a pain for users. The dma-heap
> ioctl being common to all implementations, it just becomes a
> configuration matter if we want to change the heap we rely on for
> protected/restricted buffer allocation. And because heaps have
> unique/well-known names, users can still default to (or rely solely on)
> the TEE-SPD implementation if they want.
>
> > There have been several attempts with DMA heaps in the past which all
> > resulted in a very vendor specific vertically integrated solution. But
> > the solution with TEE subsystem aims to make it generic and vendor
> > agnostic.
>
> Just because all previous protected/restricted dma-heap effort
> failed to make it upstream, doesn't mean dma-heap is the wrong way of
> exposing this feature IMHO.

To be fair, having a TEE implementation does give us a much better
chance of having a sensible cross-vendor plan. And the fact it's
already (sort of accidentally and only on one platform AFAICT) ready
for a 'test' interface, where we can still exercise protected
allocation paths but without having to go through all the
platform-specific setup that is inaccessible to most people, is also
really great! That's probably been the biggest barrier to having this
tested outside of IHVs and OEMs.

But just because TEE is one good backend implementation, doesn't mean
it should be the userspace ABI. Why should userspace care that TEE has
mediated the allocation instead of it being a predefined range within
DT? How does userspace pick which TEE device to use?  What advantage
does userspace get from having to have a different codepath to get a
different handle to memory?  What about x86?

I think this proposal is looking at it from the wrong direction.
Instead of working upwards from the implementation to userspace, start
with userspace and work downwards. The interesting property to focus
on is allocating memory, not that EL1 is involved behind the scenes.

Cheers,
Daniel


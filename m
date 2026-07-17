Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B259C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 02:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=; b=C1T9OA44q4SjohdiDG3ExyGMVN
	9FAZLa++1jVxUHbQx+qANnMdN2vNtpULvgDO1SoWZG4wVktZEJ4mHu4Ln5Lh6awDSOVfabZ+tCReM
	i1FSCJjB0Mb7iDbsdfWdjCAOfg7WPiqiO/F01I3gis5dc0axNoMC3ZX/tkQBKqWmKYBG2tHZcn714
	UOsyq2ep4Pec8Tq3MV5j7+ylbO1uEBsEXCAvfhyL8ixjFJnZqxfrYOcekvlECoVwC1l7F2M+vY+k9
	Q6SXRT3uVngP8x+NccHR6uf1fy32UjGoqJa1/NE3x1pfnJHTd/+X9+TCxNmBd+5f7YyBamfVhTGmH
	yVaT5htQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYY8-00000000z9K-0dWl;
	Fri, 17 Jul 2026 02:43:40 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYY5-00000000z8w-3Yas
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 02:43:39 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso4328484a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 19:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784256216; cv=none;
        d=google.com; s=arc-20260327;
        b=JIQnhiRVn2UQWyALkirxV/du56/Aoj9qOTgv/FfMR3CxA1k66ApGiFxWUsZz5dQNbz
         Zkr/8eDqcuWo3u/Xkjvz004ocfoJOHj2tw+JtvxEpxAE+ajoVNdG/83RUpSxCX05eAJd
         b4w7clNwTCXSke0VhgNAtURo1KyeKyc7SMYqbTroUQF0VR94tsV0JjK0LXCamZDWjy3F
         KUMOXyoHzmN2h409+n0kWCy1VMlclRRilWYg7Tmsjm4ixu+cM5mdgaHbPFWL+BgLJjJL
         0uqzZZMH9bAvljofhCTVoy30M/+C0dX1jwBsUzpHBz4q0YFf1Qah3y2vbOUGuJk4Gnx/
         2pkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        fh=7nuDBGew4tPOXitgm6bQNL1pqBKivg9N5I9IllBKHFQ=;
        b=KxEXD/tqAYxgNK2JGs0Io0CICCckymI6Mqz1nc5ZFtgz5bSSHT1WpvPwUNCCZVcIL4
         YP8zuwSJeIJDPsbwCLftm72kB2xthlR4HNgWF1UG4Y2uP47g8zufNT3S1hhFmv58Hul+
         FRyD3rqiQIHGwLMp3Tm4e95gKL2VMt+MVXwRp1fMc3Umq4H4d57mfVKNR9gOHGhCUh6y
         B5Zib9i602P/YTOZW9LqVQ6sg13TRHT9WgXoYGDUzPlNHF3QTtfOhd5pbeuCfet7TJzN
         dA9Seo5ZU4I+6wBQF6EH1NgAsz8Ear2Zg95VJxcnodqSOYCe2DY1Y4Gi445y9QWaj1X8
         oW2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784256216; x=1784861016; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        b=pIeKnoqZOPp0liIPn/i3IQWhFsDyT7GuGZnWRjErVmfj4dM/GxRKgWf1nHCmjr+ISJ
         a0yXF2N8tNMYyCapeip+gnmaL9tKqrxhD4dubWuQM8DKDndkJf7cNUfxlYo6HDMRYpwa
         4z8c+8X/nma7ZlG54+/dqZVSY2ZYmuSscSYN1AmdfB0MQ+yCPogYI2iclgp602Clkmvc
         SuPZ1AThus4OvZ9+w6h1MCQ1d/w7/r5GqkIAJjlolQOICvxTWbL2+p30FPq0PjKMwNgv
         a+Cj4CEuvUz896E47dZjGrVfSQ20LQFURnq/adhIDG+gNNajNgCNHhnZBEjZvvprum3U
         2ZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256216; x=1784861016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6ZTvlGa1jAX6x6nu+mWtSYvum03unbr5qRkIHCRmmA=;
        b=p44JKmiz+mfSHDH0dp3QZUT/oixsVxUW0OF0CjF7sHJbSNk7vaQSNdFDeNavwul8LK
         0+Sy0RcI2QiknSrUcdnc4Lk/53ofk5yINuzci5vL72OM2LMa5dGW9CPSNKXapdNiBWDt
         wtzl7DZTfc7ZpnJkzY2uPOKY6IKrr7BdUQQJy9sCIzVSVRgaLG87ok/G7mmF5YfF92E0
         dVi8RcbAEdklNot3PAnhGPfd6WvwAi9vQf9R5LgnmiaarcYRViKCU1419NTan6G5xhGM
         L/K2ipSerGvgINIevSdDvGimb76FGN6CPYtr6idVXBb3cx1jzJ+Mu3+eRBPKRl0xUM4C
         JNKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqegd10NNtjDIXt+rkIHIQRWeAmCMayOjbPniU5XaphOElwYPXjBrSjjbgW9G8FIzVn02WO7wOzhAA8OeqJ66V1@lists.infradead.org
X-Gm-Message-State: AOJu0YzM7t12GFyz44BvHP1OH/F5lj9+6icNcuWJrX0oHn0mMoC4z+5w
	EAzI+CKEH0t2QRrk5EHaWC0/UU0E8wc1f9IXrIM9PcTSC7SbvVp4QGIdjp34NAzLABCFod88ZYY
	rsATYnhIFqxK2Th2CAPlJbmeu+qWBu2Y=
X-Gm-Gg: AfdE7ckWvvIJHTW9zr0O+r+eOmCfQnQPKcj4ahQhXyO9bSWKRaRBjICzz++D97Gg6XS
	CnlTzOV2V+RVRQhkjWs7T4basI91P/gN3B9HLEOVfSCstc44Bpz0I2ekle4BQyk4W3T3JHklFCD
	gtHg3MK/LFhR/dvOY8qpYYDfPsnSeEpQX7SQXVreTr2F5i1dAQpdvbck9ng9IpTfoy13kZa38+6
	dUozPsvujUjMDP9APFoOHwg4Tq8DNQw7wccNZ9UBnW/GgLs6XNQ+v8+imf3E3JlO63WVIl8eN9j
	IQFF745ZqNTzAQFH1FYsKaBIivo1lnR3+BbjGUVR9PaqcgYUuHk=
X-Received: by 2002:a05:6a00:8c2:b0:848:54e0:96c1 with SMTP id
 d2e1a72fcca58-84c29590547mr541291b3a.77.1784256216411; Thu, 16 Jul 2026
 19:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
 <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com> <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
In-Reply-To: <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Jul 2026 09:43:24 +0700
X-Gm-Features: AUfX_my9M2Eo3gIu3CtbO4S8ow-xrYGE6kyiiiETHDgngv6Z4-cu_CPDtHYWoKs
Message-ID: <CAABR9nG2vYKhMKeSxFstCRcHb8Z2FzDTBuQ3PY261Lipx7FfJw@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: wens@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_194337_914936_88AC1F2C 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Hi all,

Actually, following our discussion about dma_request_chan() not always
printing error logs internally, I did some further investigation into
the code paths and have submitted two patches to address the underlying
issues more comprehensively:

1. A patch for dma_request_chan() itself to prevent potential NULL pointer
   dereferences on invalid arguments:
   https://lore.kernel.org/all/20260716052758.23465-1-phucduc.bui@gmail.com/

2. A patch to improve the error handling flow inside
   dmaengine_pcm_request_chan_of() when calling dma_request_chan():
   https://lore.kernel.org/all/20260716080428.57979-1-phucduc.bui@gmail.com/

I wanted to share this here to provide more context on the proposed changes to
these DMA engine error-handling flows.

Best regards,
Phuc


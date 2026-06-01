Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B3CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iDvFkdNstCMV6U6YBcdPpzEdn9fHll2vJW0mE3op7o=; b=pufyT+mlurJsg/1mkzx62LermY
	gK2rxnbN19FuxWp1rpLFKwQmKKIN+t0lTOwzWNrxlxv1X73dpCyauCq/s8G44zQ76yp0w6PHMADsK
	AxURkFWIRnePHEtEXCtZFRwJ2Zi+iV8X/k+TzrligiuQUzctT+/fiZuwNBC5azKbqizaVIBGDYVdS
	3He8HoM+wXvCzyBpfF5uqsu7cQWo+NqoZTP+P90pnmoDF83LOeGEPbOVO+ksiflWFiJ21EyrDTTmo
	XbZ+p4dLV3BwRdY02JbqP5FSYeeGFWN6bJZdznUswT/7a6vSIwG2wP3N3/o5mlFZ3EQd9d8oE/IMt
	jpY4VkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4FY-0000000BLed-1bib;
	Mon, 01 Jun 2026 15:08:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4FV-0000000BLeA-3Zxp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:08:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490426d72f7so89724355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326496; x=1780931296; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/iDvFkdNstCMV6U6YBcdPpzEdn9fHll2vJW0mE3op7o=;
        b=pBX9aGmoQCVzqMEyR1qSnrA/6/dPLRC84WzZqOeJk985nu7TEylRbBqLZmSCWbfIp/
         Be8zr4IAfolM32Fb03ZhKgI1ePfpuTWOhN9fgPIsQJ3AKLCCCJlg5ShcLZ+swEaWzodv
         Xhsf4x07UrhkNi67NppizMdn6J+DdSDGtf9Ocd/z1T7aZnUnBEoOELQKo7YIhgmzpQNd
         YoLPF30tguL3o2qozeEUb9b4V3cwTwPbpfSydQEl5WwzcYZ3hc27RP7SlIHTkHFH9fs5
         b5nOrPYebmR+PhVoIA0xi34gcPae9HQwLtso744hRvMI8FbDO1Ea1eqFB0ZlwBwPDeKx
         YAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326496; x=1780931296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iDvFkdNstCMV6U6YBcdPpzEdn9fHll2vJW0mE3op7o=;
        b=hVtQnLi/jJp9rO+QMuhyEaPPZbEvYxOMDileAScTw0ZSDv14NyGaViNmT190vZ6mAk
         xX78046ugx+QrnmY7VB0mVS/Zi41NyGFfMguv3pBdDWo2p7wXkIjt/VcI41rqqkdajkh
         xZFZm0cKJlCDkgof2294eEKvSALzrjp99x7ZQ5zeWBBUXuU0gG7IHiBEvH+Y4X3BnNIG
         02ecaVKgKHG4Hmu0VGb7oGXoCLBSQCmx5Sx+qJhWo0s9uE7UrrC9RdWQGJgkX5umFfzp
         yV55fPv2r/FXdbx/NqZb3fqC5xy2wQzsRSwVYE1ocYI9ELzWdIIUPUQ7FiqtZd1wi8ir
         xR7A==
X-Forwarded-Encrypted: i=1; AFNElJ94prmcbbjZ128YOmnFSkgX1/PHkNxnkB86CmLf6dMF+qrnZ7JM370IG4aOYTc4sShkV4E2THymU/fKmsXJ7AJK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7MIFrvW7+Lj33if3ug5SnGqrxrQp8ReJcLQsm2J/r4C8dsrnB
	+mQKNxXDxBqd84oqmAbCMC1JmGh9EPUCIzYs2uphqrRi3O0doHFBHd8p
X-Gm-Gg: Acq92OGyuHd5vmcXO7+y3PJfAAissmaJjKu24u/yI1NBwO1/DSQaRNY72l6Hmn1Je76
	UtHmlTiMMpEit0/xif5tr+8uGIvm1WAvrPm9dOtiyWIsPuMty03SOgn63yexRd7e8jPN+2/RlJ+
	sxLAzASNUwEeG41X13rCFSRr/n8KJjd4FCBgQnoTGsLjcdXUucMw0+mSYjwV6onp0jzm+lzmZ4U
	mN6qbLhFDTD9tJyZwS6DBqTPmNqyYlX/ZRBvuvNPThKKbCFpkmgStH7lZV4sZThXPBbvQXY8IKr
	Yfm9N8q7QkcHlEgA9Lw/o7gKmThhMutRmuXnQ3yhmp68e4BgdbwU5R9lwXDSKZlwk9MWbFb4uBr
	FhS/MpgV9wrrrdj3d1ErDXxOKL6ixVD82DCqaS3L0vTTDiRZcpQORy/msXoeQJZ4is7GXTpwb5w
	2UFZpO2K5rFb0ROQ0pDTsCFRIC2b5fHzu2gA==
X-Received: by 2002:a05:600d:4453:10b0:490:6869:ef13 with SMTP id 5b1f17b1804b1-490a2918e9fmr148899075e9.14.1780326495794;
        Mon, 01 Jun 2026 08:08:15 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c6319ddsm245702965e9.0.2026.06.01.08.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:08:15 -0700 (PDT)
Date: Mon, 1 Jun 2026 17:08:13 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss - Remove insecure and unused rng_alg
Message-ID: <ah2gXTMxfH-ux_J2@Red>
References: <20260529193648.18172-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529193648.18172-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_080817_894386_80D94A84 
X-CRM114-Status: GOOD (  14.26  )
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

Le Fri, May 29, 2026 at 12:36:48PM -0700, Eric Biggers a écrit :
> Remove sun4i_ss_rng, as it is insecure and unused:
> 
> - It has multiple vulnerabilities.  sun4i_ss_prng_seed() is missing
>   locking and has a buffer overflow.  sun4i_ss_prng_generate() fails to
>   fill the entire buffer with cryptographic random bytes, because it
>   rounds the destination length down and also doesn't actually wait for
>   the hardware to be ready before pulling bytes from it.
> 
> - No user of this code is known.  It's usable only theoretically via the
>   "rng" algorithm type of AF_ALG.  But userspace actually just uses the
>   actual Linux RNG (/dev/random etc) instead.  And rng_algs don't
>   contribute entropy to the actual Linux RNG either.  (This may have
>   been confused with hwrng, which does contribute entropy.)
> 
> Fixes: b8ae5c7387ad ("crypto: sun4i-ss - support the Security System PRNG")
> Cc: stable@vger.kernel.org
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>


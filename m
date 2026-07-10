Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9qWk9cJLZQicI63fmh7280tbO5NRBzwGQME6T3CAn0=; b=nIWw3dfg4yuQdjCKgKlTaZNlBe
	QmL6t9ZEpzlskP0jE0RL1fY593PUTELDsd7KR2ds0W9wR3u0P1r41clxyo3Gb1zs0osWCvR1KF9jW
	dlsomTyVUByQaDGR2qIh2GDAQFf+J3phUIqhw/faB4384fxUXAaRuL2fuZ7tSSdvvnk+cFh7XYGLx
	wq0TODNc4gCP8VcO7HmTItf+lEs+qbpbGS751a/LJ9l8BKEclNN4rWj9sPZ0duldYL8/j9E5NR0MK
	RuzlMYRfTSHQcWCij8Dx2Ilv1Z2SCJmmjqCX2p8ew7U3jvpHZSvd1mfnE0Byg0xPDTL9CuLqHintG
	xEYr15KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Io-00000004gPi-1B2D;
	Fri, 10 Jul 2026 10:17:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Im-00000004gPb-44iz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5814460051
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1274E1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678668;
	bh=y9qWk9cJLZQicI63fmh7280tbO5NRBzwGQME6T3CAn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhM5sijXvczeoHmlKhz/HsYE6VmxCT9Vtcgly8UR+p/QL7SufvSABA7TtWsTAuvpB
	 meJeg8zwicPNnpM+QEmvnX8Gk7pzUaAqeiH7uDTut9qyy8HsFu7wHRjks2dxCvj6hI
	 o4Go12W+aUBCVSjIsURPD5Mz19mxmAdceT52cgd3w/mds8SYdy7zYwH3d2JcpudS4i
	 nxkLzDY57I7ti04FcqfEdYv+Smo/Mn3Pm7MLUt4RKTQbJ/ihHuNVyy+QKbwB7jAR+N
	 i++tUcQ0UZcYbNaWNoJyNTEz25UxkDB8EIExBKrynaXNuDVlvKUW2m0qnAc1oKLsHy
	 5xIm45QJo/kdA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3997a448ecbso7747941fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpSk7jFsE06PRFCM8W2bA+CG0dWXey/+dPDqUvp/Te9zRFTopdRo8WyeDOf2VlF/JeX9ZUlfmDu0XDswNwSm0EN@lists.infradead.org
X-Gm-Message-State: AOJu0YxRZLu9ISdtY28HzBCRbSzNw+OsOpLavYZ//ESvY99Jhbtl8NrS
	ztjElnept3rRESNU97I8QHD7K6llVPWA8yc/wTgR6W0OT/Aat0liGIzRcJe57riFEKteBEGDliL
	QNBGI0E4uTJO/9j5J/XW5UPpDiqNHjbw=
X-Received: by 2002:a05:6512:2305:b0:5ae:bd53:70f6 with SMTP id
 2adb3069b0e04-5b011463cf2mr2828605e87.4.1783678666894; Fri, 10 Jul 2026
 03:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260710074216.734849-2-thorsten.blum@linux.dev>
In-Reply-To: <20260710074216.734849-2-thorsten.blum@linux.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 12:17:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmWvxiKX6=3-U0nxLYnm2uWkUrd1ac7P1LK9xn6-93aFw@mail.gmail.com>
X-Gm-Features: AUfX_mxDcKSIV5VeiNMT3WnVlpI0alYwosA8IttxVMHe_RGcKbAuZnkNYzHD6zQ
Message-ID: <CAD++jLmWvxiKX6=3-U0nxLYnm2uWkUrd1ac7P1LK9xn6-93aFw@mail.gmail.com>
Subject: Re: [PATCH] crypto: sl3516 - drop invalid sg_dma_len checks before
 DMA mapping
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Corentin Labbe <clabbe@baylibre.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jul 10, 2026 at 9:42=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:

> sg_dma_len() is only valid after mapping the scatterlist with
> dma_map_sg(). However, sl3516_ce_need_fallback() checks it before the
> source and destination scatterlists are mapped. Thus, a stale DMA length
> that is not a multiple of 16 could incorrectly force a software fallback
> when CONFIG_NEED_SG_DMA_LENGTH=3Dy.
>
> Remove the invalid checks; the existing scatterlist length checks are
> sufficient.
>
> Fixes: 46c5338db7bd ("crypto: sl3516 - Add sl3516 crypto engine")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Looks right to me.
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


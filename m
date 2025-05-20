Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C4C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBe9HFmfYkZA0vZ9epGzGQwP62XWv9bdcLFLfgUYqN4=; b=i9x/QpGFCkyNj1GkaK+czzTmJM
	gpxJXQ7/Xhtm9LJXXgpNnvEyDJbFQIj7T/hfWWCnGCIFExSzzskRHoqNzF50/4bkFGneaSDQ+OIjH
	cT+zd3Zl/1Qhw6e5DfnCPe9rkpDQ7ReoCmqHzXuU7IH1CZ0fsCxpfPSMlH52tKHdOPoKtVb9+tTzM
	izadnyFcHQyn/VTeN5Pc+UsZLM3BaJZqYzWZTeuZB84IaUYAFRjooM3kVYskEcQqIMkS1OlgdyaYS
	3mQfCZiWCIHJ4wW97KQC0lnj478YEAQAGCN8OWEG0Es0VssFFUANXLxHnh7Pmao+IdplEGzMby/+0
	CD4sHt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIJW-0000000C1JR-2GLi;
	Tue, 20 May 2025 08:27:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIHN-0000000C0o2-3VtQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:24:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-441c99459e9so33868195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747729492; x=1748334292; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBe9HFmfYkZA0vZ9epGzGQwP62XWv9bdcLFLfgUYqN4=;
        b=W4yCAsjHm/BvRgNU1fkYvEOgT6lFFQOMGP5cj8T0EjRj8O9uyR+2R8EUbwM6RllYr4
         dP2SiTfQGVLe2hGZBLWpeEBoR1KvdOgT6TQfjrCiaxSurUIFJrMLIGLFbA/zbiMWLUnb
         cNkEBcqw6p5XZDNrvDuboq4iLAINZMEuJu8P5JWbLoYE8TKHzM+8D4MoCUJBlE0yx2AO
         v1fCQKzMBO8dxWwwNWZXfKrUNI4hUJOLz4yO/Wbn95DkX9cebTWTp5+uo0SJcf8N867h
         6vQsm404sCsMavxcnu9at7X9e8fWAH/q1jxYycjVm1E2SnYSgy6BL0SXxX5TNpiosGfq
         rXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729492; x=1748334292;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBe9HFmfYkZA0vZ9epGzGQwP62XWv9bdcLFLfgUYqN4=;
        b=Wk7sG8pmSJmPKz/ylcpYFMAb/EoRLijB0+FaNUao8nkI2iFZlUsHdTMWqVte8g5VqY
         Xn/lfcgieLda/fm2+qXEJrwu4dS/S1FhgSDP+ey32bOetoS7PO0b8EyFxU0jHCDhL1Qf
         QYZiAHNwm5/8qfJ3p6CcBODAcau5cGzXORq5ovqcLpe9ff4O80e6td8niZNh5h4cAOGA
         rLM+m61md2vjylyqoUjeo6/zA3Cz2SPHk2SgMe0tlHkqmbnT0fVW5wHMP9g9CScrr730
         y2NmUYGnfA/TeQljCeD2mMVb0TjcBRKBrOK5YN+OI/P7oA63DoLn2QbHXLtZPLBO7I9p
         QC2A==
X-Forwarded-Encrypted: i=1; AJvYcCVcEA16h5HT/D40mE4XZhjxv1XFipZen1dKmPc5gqwbyThKCXpjiHLydt6qZg6ixNMYi+zqbeVTFrRt4vmcygcw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtgy0zWkLN2CnaszwoZtGs2G8YdUs5E0zMbeVZzHkwiucHIsez
	jY4SEwKv5h0eq4z0RuJIuN50JJoWU4saN1/lBRwKo79vZFr1okeLgLH67Iebrg==
X-Gm-Gg: ASbGnctYlASbAp1ZN0j7d+b9XK1UDjwCxO8IdEmBXOUj6SRAyufcWk+VRsHnbhSURNW
	bLdi+Ej1eSXZ9B+geqDcz3ea1+GfUi6hg9ueC5tn6bwyNSKEW6eD0DKHjBVxga7sHFEkErUFe6G
	xslppExj8kkRxJQH8twM9FO8FOa0Bd0FVnVUht920G9x17U6sonbY1ybqwHsnAe1Wbg4SDzcc/O
	zGC9o22W8/klqt0hTyvxQV777KTXOtNHv8mfc/dkwCeoPNnT1CIXOYkySpwnxXscGe5iakvauH5
	NwbEJ8b7eizz2AvKvUltiolFu1S/ruBp4Hq7eD/jM8RLE7Kk7i3H
X-Google-Smtp-Source: AGHT+IFiq7yNzRMHYgxf8Y2AvL/vFL+N/JR75NfHsu+y2i1yEiKH/7J56FYwi2SZ/j61+N05P1IBwQ==
X-Received: by 2002:a05:600c:8597:b0:445:cd3:fa00 with SMTP id 5b1f17b1804b1-4450cd3faafmr73300515e9.4.1747729492130;
        Tue, 20 May 2025 01:24:52 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f74cce5bsm20578415e9.24.2025.05.20.01.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:24:51 -0700 (PDT)
Date: Tue, 20 May 2025 10:24:49 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] crypto: sun8i-ce - fix nents passed to dma_unmap_sg()
Message-ID: <aCw8UVORVj7GFc22@Red>
References: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_012453_878654_4FFE27AC 
X-CRM114-Status: GOOD (  13.91  )
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

Le Mon, May 19, 2025 at 06:13:48PM +0300, Ovidiu Panait a écrit :
> In sun8i_ce_cipher_unprepare(), dma_unmap_sg() is incorrectly called with
> the number of entries returned by dma_map_sg(), rather than using the
> original number of entries passed when mapping the scatterlist.
> 
> To fix this, stash the original number of entries passed to dma_map_sg()
> in the request context.
> 
> Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Hello

All patches are:
Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards


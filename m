Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA54EE3683
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LZ2bvypPMxzhIptX4WSvP0fSGSKv+YQ3mad9vCIS+0=; b=YyKqQACIXyom6PVIHOKdxANu4P
	Ia6V6CVSrp+gypOy8qDDQCzRY+MdtSClCT/j6I2i8NbNNP5uS99QGSAtvKhmnciLEjZ89AT12lfoJ
	gcn8bi97r6QWDGHX8OdGhiItu1PmUn7mUtHV/0baGyDBxuWfGY0f4QT/kf63iVKYT7cpU4tHFwmtA
	sr8Jf8Im+Q81UEHyr2EojYa5P2M25ef+DJvrcW6uq6xfQxZF8eA51xcl1dZQf4/zfGWiXGEI98aAS
	bnKby5cS82qwfLzbvrskzDC/QcK9jU5XiCHwogNoUKLEdG0ltU92gJwvPofq/K8ilWK/hN8ZI2/7E
	WNQHa7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWr6-000000028v5-4C1U;
	Thu, 12 Feb 2026 13:35:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWr3-000000028uL-31Da
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 13:35:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-65a35fc8007so3685571a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 05:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770903335; cv=none;
        d=google.com; s=arc-20240605;
        b=dvXoJRTtvzJgpdJD51MbBIPvuYKQw910BBpEM4YRmsfBZ1FxGFDYpuAw4KDo+EHck5
         9QSPPtO4sgtWE1TesSOpTnn+uNH1uf8LwEd+WOAaltqkRjJr6EPAGsFqbIU7IlkSI64r
         eBCagtNNbtINMbsyy4a3hADUCT1RhjZsQNao5Z2uTqVtxTm6Ci6kVMecwptXcNIHTJvJ
         1rHUE/Hv2XD1S0BH93iOQD4uJHSuWllV8gm4FGbmpj8+FhMqwbB/MmIYpmRfk0MskJTz
         MkaIB46+YsyMzN10zvj81dAMM14LAR2PoOfZ/rHHruItszgxgyNP1Wt4EEwlohVLKkAl
         ++AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5LZ2bvypPMxzhIptX4WSvP0fSGSKv+YQ3mad9vCIS+0=;
        fh=isDTJY4ces/2S2fJSKwVwBKQtNXZQshCGxV8s5pqwBU=;
        b=IPbjpuXixOM786cBXb4+gL5MKviJ9He+ksyXCBhC8OqYXvHcK35VGlEHwDxFzAOR7P
         ktaRJ4OARqJ9vv1GY9ThqDRWobpB8cZ/xb7mxI5tovm3J5qYp7KMyOMGYhbDxi7zJArv
         Ti0pvQAYqNuZ+JaZ/e2z1QRDmCjZMJMnNc7q8xjZLfuq7eRw+EllWJFwJAAZQu7pnp2V
         SIvxytY3OWYfv6iXNnRWXviiLy1tsRwLiYZjMZ99bUwC157tnnKbboP7N7VTZOT5DHlZ
         zsCbPFYMW/TvF8nwanKWFW0McoIMzMNgKck1eK1iib1hrEv2I4nxAIbhrCkl1hPyDpkk
         Zh7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770903335; x=1771508135; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5LZ2bvypPMxzhIptX4WSvP0fSGSKv+YQ3mad9vCIS+0=;
        b=kVpY1Fgf4Gsn2ocO0efEanzR3u9bvoXlH+3LtUIDVLsnM3m2w85UFGLk+8y2r3xkBD
         IAuiBd3uLy9Tb9NjVsIvknt04VIX1zdsBCBnvkAvtRVmbYBGh33UH3lv2zgy4nzs7gks
         ntzMLTdDu3DAorRKM0oCR/6Z7qWMNG3vl+jY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770903335; x=1771508135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LZ2bvypPMxzhIptX4WSvP0fSGSKv+YQ3mad9vCIS+0=;
        b=uqoGzgVur8gWACknB76qGi0fzJ/XFrAMrxvPpi1iLiqEg6y//crpMlfcjithRsvX3i
         tOq2nUnSHwVYagnimEleUgdUFjeXnTT+4+vZgJ3QK5bcJ30v7Bl4voSz0QJSHTAIyXNZ
         SzTyZO92yudCczi7ph45Gd3RiccQPd3g1M456hEVolGs6pGBqZ0ayoTuEgA+/PaJAeDH
         HWDJmU3jxtaQSPKTKKMcUCqjYmy6tg9OLkKzQuuKoYTYnidGkGbBT4uWT6zsc86FdJsv
         CzNp/dBirz44iOw/cdjNn8jP13s9z+Va5KNk3mf7ZkPcpn4nw6OEAy5xtQ/rC7aWbSXI
         U1UA==
X-Forwarded-Encrypted: i=1; AJvYcCWNnaQE4hZXQxawMnTXQj3W15XJ+Ut8ybZ8Gy1KWDJCdj4elXjUUyQM7g5Vg15M+1giyz6KMjj5pRYN5FVbDlnS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8/l/wGqcU6yxsgMmINqqJcG8zTBsLV7TNHCVkOkDZ7+pmVGzu
	T0KAC6IOhsdTn30sOP6/EohRKgEijEaSQDXoDvJLBhDJi70Kg9BpgIpQLZop3EuimgeOEHPHNKs
	lZpYU3zZRqtwQ1fKIWw+cAGtGCmx0ZgmbmWLfxLSw
X-Gm-Gg: AZuq6aIQ4U78/wljWgVy0cdCOTgEipSKAu4xf/33r3MnMB4fe9DJGC5ZVV5xbh14u76
	bB57QPqUTT8UL0HOuAVS1NTa0tM03Surd5ByCzDpsrwAJg2kqtnLbfo4FtxPgt2dxOL6Q3Nq7VF
	4GST7MXZBsrBqna6GUXNFbrsO6oGfnCVDINb2t7mi90pvu1I7uHyZ8g6tNoe85wYfxFpXPmMwZd
	aDYd7MNGDnV1tqhWh28DTIWPjJwMoR3cxSSBMA1DECMKLQ+zCxfo7YHvv74ym9v6tViHuDiygWb
	W+8wEg==
X-Received: by 2002:a17:907:c1f:b0:b88:5d85:48f with SMTP id
 a640c23a62f3a-b8f8f525fe4mr154030766b.14.1770903335167; Thu, 12 Feb 2026
 05:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20260212074308.2189032-1-wenst@chromium.org>
In-Reply-To: <20260212074308.2189032-1-wenst@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 12 Feb 2026 06:35:23 -0700
X-Gm-Features: AZwV_QhXBJZx3ycl3X7ONyTOoj_tVsIZOCqoqWgMm1-ziv_a5Ce_83-ZKe0zuqU
Message-ID: <CAFLszTheTgp7Tao7UBZf=zwWy+mOCjPbjMWm0ZqO3gPamrGWAw@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit.py: Drop explicit LZMA parallel compression
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_053537_911422_4FB1791F 
X-CRM114-Status: GOOD (  22.79  )
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

On Thu, 12 Feb 2026 at 00:43, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Parallel compression for LZMA was added using the plzip tool. However
> plzip produces lzip format output, which is different from the raw LZMA
> format that the lzma tool produces. This causes depthcharge (the second
> stage bootloader on Chromebooks) to fail to load the payload.
>
> Drop the explicit LZMA parallel compression toolchain. If the lzma tool
> on the build machine is from xz-utils, then there's a chance parallel
> compression is already enabled.
>
> The xz-utils manpage says the following for the -T (threads) argument:
>
>     Specify the number of worker threads to use.  Setting threads to a
>     special value 0 makes xz use up to as many threads as the processor(s)
>     on the system support.  The actual number of threads can be fewer than
>     threads if the input file is not big enough for threading with the
>     given settings or if using more threads would exceed the memory usage
>     limit.
>
>     [...]
>
>     The default value for threads is 0.  In xz 5.4.x and older the default
>     is 1.
>
> Fixes: fcdcf22a34b0 ("scripts/make_fit: Support a few more parallel compressors")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Please merge this for fixes.
>
>  scripts/make_fit.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <simon.glass@canonical.com>

Thanks for spotting that.

>
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 517ca84fd32c..76ab40353d9a 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -54,7 +54,7 @@ COMP_TOOLS = {
>      'bzip2': CompTool('.bz2', 'pbzip2,bzip2'),
>      'gzip': CompTool('.gz', 'pigz,gzip'),
>      'lz4': CompTool('.lz4', 'lz4'),
> -    'lzma': CompTool('.lzma', 'plzip,lzma'),
> +    'lzma': CompTool('.lzma', 'lzma'),
>      'lzo': CompTool('.lzo', 'lzop'),
>      'xz': CompTool('.xz', 'xz'),
>      'zstd': CompTool('.zstd', 'zstd'),
> --
> 2.53.0.239.g8d8fc8a987-goog
>


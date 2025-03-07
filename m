Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3FDC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=; b=LI1rRFOPx0m3fdRcRjox+L3k8R
	wLZmtzkRbphvQUGjnGxEJ76tkXy4YNZbPfMe7aP5hH4eJ43e1BRxzhbNlDTxu9foJiQMcP2MVCHF6
	EOORY8Xvf33SotxIJVX+KVXGs+s+9EcOFf/ewC7Rhk+OINgntTJL4zvncBmhxqc1H/i9bxWSyprRF
	096QuosJpVw+eRFMvVvzOsJUPtTJhxm4SbOZ4eHgz5FqDDqZJMvRUnY4H76pcigtTJNVFsv7lX9AD
	mpAcCKG6MfG9/ok9/pzXpXt0dtp2lrtlHnp8khEaM833QIpuOoIfVbnT1ElP5KItaYoIlTBbrG29w
	oG2B+qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYkk-0000000ET8Y-1uKW;
	Fri, 07 Mar 2025 14:32:42 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYhy-0000000ESjJ-2QgS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 14:29:51 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-60029342c98so1102216eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741357789; x=1741962589; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
        b=xy1RiJPsHioRFgCfG5AVXdyMWXIvHJBnBNwnkFvd6dK7BSA351LURu3/j3b2pKCAY2
         pzcFZX+RTUW80N/8aJ3hVH/NFWLIPfM4eNNuubMuzmnO2D3spJ0kocbMuYjVqXpifPt0
         EhYCmvYJuDjjQ81FvbT2gXpA0M309lRig3ayW9OhWGxkv5nGcoHaneo8/9AYzeJnY4en
         xiShLB5/v8NN4ZAEiZ0Tpd0IOkcpalvcK6L/9dT5JXTtMCvGFOmuIB5dC+yAzc6WlQUZ
         hLY3sASf9AjBLNax5yRyTillsCg6axZDmelZNp2R12XtcYkQGj8ePc5WwsPabkJCy6IN
         wibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741357789; x=1741962589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIOMNLEjH69nnT403tSpw0NEiiWDGz/NjC6xURZwUgE=;
        b=NcjfmX+KsnzEKxZ2d92jaEw8Hm51tc5ObsLtvsuRP22JcKOTuOkA8YN7SVF7f2EHYS
         1o31CNtnJEerXjLtYFA1KKn+xVuh7rVlgXzksNBDSvC/HZZhYhLeeGUUdn3UHatoOndO
         K5euVA4rhMLXEkOE32mYQlfGoeLL2lohPq/Ict6bI7XOYLboc9YuecaKMZiXQ2mZT7e5
         ykO6e29g3bXCpHFzyKDFvagi0rr+7jTl/FAuGaWeEsccKIkUGP0WNDkpn6I9fnqj5NhL
         LJKA7xHPJB1KlsRLqwRn2DvdSImKmKPiYlUEWj03wqRJ39xnkHIKLFZ5zb75utOWHjDZ
         oECw==
X-Forwarded-Encrypted: i=1; AJvYcCUwWgIRPHmR2d+MThvEzhdzYk2D/sDfHI3JuLo5CG42W8Wwq4kMSJDfNM4LKQleURI10Nhq36ssCcqHt02E1aDm@lists.infradead.org
X-Gm-Message-State: AOJu0YxLHGWZmlP7r/i0EG/qsKdpcZLT6YcmxL1pHp5U4wm/bHiA3b33
	cTOeiJcSiT51Mjy1Mwav+gmQfzN9pBfaP7RyjDzsUwPaS3dtwgv1K+hZJuKS4JrKYA/n2y3AXef
	GIsnPeO6nprOg3rk/9It6DYdFmO33VKIDQnl6tw==
X-Gm-Gg: ASbGncs9x9tk1rwFQN9oKqKDqIY6CYTdSHIc+i/wFMSdioglPT4ZgkSadBEHsHGNDw/
	XVT7ueJAJveZ/RHcqF5NTyZ4pD5XeMiPxhsmO59z0e0Yqny9BULgp+5DAz12hLQ9kyREi/wCJSp
	0iZ4mU1tkCRcMP2mk7yZpzt65sutc=
X-Google-Smtp-Source: AGHT+IGGmn8xLMWajxv8ICMHuaMrPUNcMWpzQrq5wZQhGe8IYs0letUmBAshmOVmzeAwyTeMZx2VSjL3a/o/8GUoJQw=
X-Received: by 2002:a05:6820:2709:b0:5fe:9fed:f391 with SMTP id
 006d021491bc7-6004a78b8f1mr1708857eaf.1.1741357789463; Fri, 07 Mar 2025
 06:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
 <20250305-clk-samsung-headers-cleanup-v2-2-ea1ae8e9e2bf@linaro.org>
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-2-ea1ae8e9e2bf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 14:29:38 +0000
X-Gm-Features: AQ5f1JpUppE0sfHDV86NNTwKvteo5ZV6XyAd9bvAyX6uA7UR9Otm7vbstJwPknw
Message-ID: <CADrjBPq3CA97cGopuCFD5BrPH8KnM-rsi7vMC3w285ihNDm40Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: samsung: Drop unused clk.h and of.h headers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_062950_614739_2D609890 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, 5 Mar 2025 at 20:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> <clk.h> header is for clock consumers, so drop its include from the
> Samsung clock controller drivers which do not use the consumer API
> (there are few which do, so leave it there).
>
> Drop including of <of.h> and <of_address.h> headers for all drivers
> which do not use anything from generic OF API or of_iomap().
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


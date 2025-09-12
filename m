Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A58BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=; b=mLP8XGNjbGkkCMKx4CbrPTNs9W
	aLCbQ31m5h8cQXrAjWKumwRkq8jGq5WZ9dS8w2XaL0yK4mR+zgWRvN7+6xvGPtyg5sawMV6FFLO6S
	xKdgNysPKM9id/gtwtpWnanZ7DCC1EV4VCYgVykXXdxoKQ0ZBAVT41LxjjFvV4/ve5qvfX0mRGQXY
	baZyRhtxognH+tUbJrIsjREWgGGjKCLCOiUJKvwoJq39A2VOHy/wOCgaiv65JRifrqmEmmF8MbtZI
	g9sOUwOvkSyeCSp4l+Ds8MjVdlti7w/Ywcz3C+wr8NoBs7q74SVYQknmmXUaESwxTsGQz9tlglS6x
	Rr6LgZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ma-00000009CFk-11J7;
	Fri, 12 Sep 2025 12:21:40 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2mX-00000009CDu-1HnF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:21:38 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336af6356a5so15745001fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757679695; x=1758284495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
        b=kdyElbvev+Ej79JxkxHGw/O6hj3xl7wAWvBLtj351oC5i5GyUiADJM3rGzEG1MTONE
         s/ZNycmmcAs6SAODZhxa09y4ssyaSHRQpiTcmVA4A6Qq7vu/IyJ1HYmQo1PsajUW0iez
         IOw1B4N29hUYaEPCv5Ji/SWvzxYpe1QKLteH0eVdBwuxPXK3qIx+DCiaiuMBChRG8R/a
         kA5hy7Jn04wJhD/H5FE9IrZ4iiRmzgU0706S6xtKJB9sAVnp/DsHyMFgww1Jlu3bqx8D
         uRx1Yv5p3xaWci+RruN89+AldaQ02fC79VnLcMx8dwYRJioXBG/K6k33vhT2Uwxl0FWf
         YZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679695; x=1758284495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
        b=snaC+u4W1GO3+iek44JV7t6W+MrVJrGOQYb9FqyKm7dRO2ChX83kKwaqvy8BomO/eU
         Toh/J2RXNuaBbGe9aiMTAwWjhhn1BKPshdPIEThCOuGfSxKRY8nlgADdCbCsEfkHn7US
         l+PaCbU1NyJC8pIyLRKC1E8PEHJ+MiFyc9N1xqyFTVShJItH+B82/ts68s2d3Qm7IxjA
         R+TLwisG54Tv1OmrGV8EBBTlBH9H/Bn+lIs1K/QjMcCFqHIW14EziddIes5PN4emJSXz
         eDpCSCjcNZMZK49Ld8Bp9GgiPd+qTrOZSn1Gp5BVEf+CmYPfCHc4auPIFtXHfnuP2tNZ
         S+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUyZHZW/iRmodkDbN8rNK5BIrJb4cHnYrZ4sbC7URjpR/4Xla9G7wQ1OHX3AIRtqTJpx7Wvab1uqwv4ekxTidWU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/M4g7syrM3bbinorW0J/aLCG/ISH/X/jotGQuB5d2zSrRmFdj
	X+IW6r+yhij1aWuZbweOhDLSIGR8jiSdc5O54Pvz9xO+x5XILPyokqGwxNXOuaebmossXlu7wBL
	Hm7WgJt42PeQYOmCq3GvIR+KnEV8AC3Fw6Le4Fzgw8g==
X-Gm-Gg: ASbGncuevLjbKqBav8U8XnuctjD5ixoHcHkKC7q6DL46PYlDtXbptzFD2yVgp41d3lK
	WkYAv3L0Gsh5M7+84MgYN5PU5pai3Tnpny1zmSpAkOB194Emri2J8nSRi25VfvrP4V9nGUDqy1Z
	qH0Nv0zjdhZh+8pFCsjvNvo+vwfApEFs7XJW+8DSd7IseT/Gknary3uUiFM6tCiLt6W4hAzZGZU
	5P/bgA=
X-Google-Smtp-Source: AGHT+IGIryVwwWle5BuCNtAg9SWHOa9Fynk/RUJtYWpT4Bd8pqtmMPa6Br277pH3nUbppV/EZnHRiOtwLb2ws10wbU8=
X-Received: by 2002:a2e:a9a4:0:b0:336:cce2:fa5d with SMTP id
 38308e7fff4ca-3513a8ee15dmr9949001fa.11.1757679694596; Fri, 12 Sep 2025
 05:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:21:23 +0200
X-Gm-Features: Ac12FXyVfQQZrEJmw9O1A4dKUe7GIFb_xvJhZW4e_4RrQjwp91fxqMFdqNnM--Q
Message-ID: <CACRpkdY8-j0aCoz+akWHOX6WQ7nNLMbN50A=_7cgNPSUBuQb-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Simplify printks with pOF format
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052137_356283_CF6A981D 
X-CRM114-Status: UNSURE (   9.58  )
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

On Fri, Sep 12, 2025 at 11:24=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Print full device node name with %pOF format, so the code will be a bit
> simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

For the follow-up remark, I think it's an improvement with the
full path, this is better.

Yours,
Linus Walleij


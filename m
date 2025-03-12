Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526EAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UBmSxv1OwD+ioMgQknmsTs5rUzvzJDaMUiBaEWBDEc=; b=dKEj4n6mJ0hezF1GbgjFakApGY
	3XpEx8uN8Q6vd4Q5NYnsbFgp1xeVbXJsY8qRWLCReTDSgd1rj3s6vcJF9gSntif7SapvN0lkD9939
	nyJvWQaWixDCAT9p4n8GgaifMr46nvVKwA8RufHQs56/yPW88k4FEN3Hr6+bvUfTVaCCY4oNWT8qj
	G7e1UehpQ1nEI3hsdF97ZK6zQDBGvqBbpDwLDYAoTVBoSFvBG3RBB5pDd5tMlUeHnvB4N9Q6P9h6L
	UXsJgk92UAW5SMGqi4jQIVFPUyn5ah8t1UoAZP1Wgc2aa8Z9yo9Jh2+KKCioMG8EPaPR8uFYnCxkk
	XB6IQwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLId-00000008PzB-3asD;
	Wed, 12 Mar 2025 12:35:03 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKRO-00000008IEn-0hUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:40:03 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2bcceee7b41so1813602fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741779601; x=1742384401; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8UBmSxv1OwD+ioMgQknmsTs5rUzvzJDaMUiBaEWBDEc=;
        b=bEveWfEZw7JzM80Fg4wPOpI7nPQWDCYq7lro2UFITLW04JZz5efps+Zkf4x1Rsdej3
         Y1wB5RPIUySDfvvMEhrqUAt5Wp3aBDbB1ydmo5RaIAk7b1vENqadjhUdv1bkGqHl+fEb
         KOLTrUONzlZtr00SZJfUjr8sHprD/yYJh5LkBzP9vKt+LAiwTr3WQFYBq3MbFjN9WuZb
         bthkJTx5trrSIfxJUT0fFKtgOJ6raPiqIT0WdhrT5UpkYKjuRXcm+QiVPsLfHSFpDi5j
         lKBYWN6dTRbZ8DqhHTKfazr8jvkfbkwdN+OCz3Rqf57hDoWp+8vxBufQziqLK1jn4Iq8
         o6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779601; x=1742384401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UBmSxv1OwD+ioMgQknmsTs5rUzvzJDaMUiBaEWBDEc=;
        b=wMLmi7PFDvTkzkWXHndpqmzoAPHbhB+gPG2TWdsrGs3Y/i6S3wBuTXUANoZAPKkO7a
         b3QUBDxPDKwQRSbulHyGGjflSk3vKQFZansrPlUGdAQzrOgrKiyeAj3S/dAzWcPRIjjv
         oUo6kSE16yenfFF7mtgAW35YT+Eg6GMzhUjwjiL0oVg7z29sOrM+csRJGWe/VLGB59bx
         K21yEmpR0RnC17JqYkb3JuUepp07g88oerFKJe4iIIQFuAvNMNfkI2i0INvexjHiqD+K
         i07ntbBYB2LjOdINt8uq3peeJYPRKlMqXuv5UNAY63EbQ2UaAZPuq1Z4Ji9kI8n2DgMh
         g92w==
X-Forwarded-Encrypted: i=1; AJvYcCXYd50Wqr52raBkgfjdIqeSCUcovirbOFswcP49HDcQRgKNRxpFx/99krpxZN82LAW9F8oT2wnczPHpeFJaRiqm@lists.infradead.org
X-Gm-Message-State: AOJu0YzUbfa89CGPpwtzKXCQT7ffDZmv9FIirnpnd78UPsVKhThSJz8B
	0JcZ4GG/4hrR8JSIx4Kju6K53TdIPEozzKP/Vzlve+e7CltgIhIQ+4Wdoc9Mr2vJ84IQ4x+/eNI
	nipRlATRwp57Bk8vNLbnTrA/738IXXlGBqHR4vw==
X-Gm-Gg: ASbGncvXWUVRm8gWL1iP+mQdd66E+ZIOwne6ylUtnA2v4Ti6LT54cJqgzO02e4vD3EI
	Gm1rLoL04HLIKzjWdyt5s3D8FsuGZi0X7eUwmUVJDLnz+60W44chOaYu3LKvgCEGJ0yYUR5D0gm
	pGbRhy09+uSh8ykN0AlrWcv7IDl5TR
X-Google-Smtp-Source: AGHT+IEOKr0G9dvkjWIRUB6KSVHU6mQO45AWdp58WuGfhWD50M7ulSEgn1psTWYM0zeljiehFpwBV8RLclSGmbEE8iM=
X-Received: by 2002:a05:6870:6f0e:b0:29e:4578:5f74 with SMTP id
 586e51a60fabf-2c260fd90dfmr11572872fac.4.1741779600961; Wed, 12 Mar 2025
 04:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
 <20250307-pinctrl-fltcon-suspend-v4-3-2d775e486036@linaro.org>
 <59a1a6eb-d719-49bd-a4b5-bfb9c2817f08@kernel.org> <CADrjBPqYoHckqr43y1z8UtthZ9DOG15TJWSv_707Jbyf1yforw@mail.gmail.com>
In-Reply-To: <CADrjBPqYoHckqr43y1z8UtthZ9DOG15TJWSv_707Jbyf1yforw@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 11:39:50 +0000
X-Gm-Features: AQ5f1JormaFnXJuP6e1NiOQZPsn_AaUXUkojjSZ_JcJhsq5FNURWiGRoLSlUVIY
Message-ID: <CADrjBPqSSbt=xM7u12BU2nsF2xvyXe_+bLSCxCPBTfCc07VpuQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_044002_227748_32EF0973 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Krzysztof,

On Wed, 12 Mar 2025 at 11:31, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Krzysztof,
>
> Thanks for the review feedback.
>
> On Tue, 11 Mar 2025 at 19:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 07/03/2025 11:29, Peter Griffin wrote:
> > > gs101 differs to other SoCs in that fltcon1 register doesn't
> > > always exist. Additionally the offset of fltcon0 is not fixed
> > > and needs to use the newly added eint_fltcon_offset variable.
> > >
> > > Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
> > > Cc: stable@vger.kernel.org
> >
> > It looks this depends on previous commit, right?
>
> Yes that's right, it depends on the refactoring in the previous patch.
> To fix the bug (which is an Serror on suspend for gs101), we need the
> dedicated gs101 callback so it can have the knowledge that fltcon1
> doesn't always exist and it's varying offset.

and also dependent on the first patch that adds the eint_fltcon_offset :)

Peter


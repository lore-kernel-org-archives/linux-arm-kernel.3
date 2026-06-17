Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C748DCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ois7uJYLekKAQG+JspaUzPJU4OIUiESd+WUf3xjbcM=; b=JyUe/fJKR05JXtnk59iMDLLMZ3
	X7QSZO4w5Gwao44qW1JujdqiexYJf8L2+qjbxR6Xv54APOyNYK+6ZfOK7e+2iDr4YbeRLXYEFc+yO
	uW3VNoo83xMTm+BIdW80t4QNRmDHovQPxEe0dSd5MK/CG3/CVP1H0o2DJ9L1sgJOAcHfZuN51DiIl
	WUWFmSDSBBaLoMnekN8ATbGEW/D1qJH5JQXcTSXiEf9RbKOzvKflErFbz19kc+dZAzUYAekVVRPci
	5+X0WQsxR0LvsRllTH4Q0YV5m71JeTtq+y3R112gyq5cOVD4WNROhXMnAeuUv+iUGBG3/AYYGnDt3
	eMO5hiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmLK-0000000GwSv-0JGJ;
	Wed, 17 Jun 2026 09:13:54 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmLI-0000000GwSa-0fQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:13:53 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7e2f3646c10so62080447b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 02:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781687630; cv=none;
        d=google.com; s=arc-20240605;
        b=YIHrSKSLHO84cF1ZtNYT1ZRq4YJoHDY5LAafoi8nKYjZz7dqY890g02DvsTjSyF3k2
         QFthlugMoTDEiug3aW1QjVQXpv1h1cxwegNINwTfkJMuZptgNltJUHfC25MEhhwZOhVL
         6KwiO8HMkpBkVjhH71Yb6YQWBRMQ2etTAS3H1FK+I5/C3o5E5WEEByEPS2gJUHsHLITA
         HMEJhVJnCoS0vVa038e3/PDvo9NgK+H60JewplxbyqE8ZD1oKGp+KUhDBSRwzBvD/hCr
         tIhVqU3d52JhX73BnZkzKjaQlXR3vHyDVdtmzXIOKWOqV/nCWRGgv8L/W7T6HLJdxSYN
         /ZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ois7uJYLekKAQG+JspaUzPJU4OIUiESd+WUf3xjbcM=;
        fh=Xp15ASsOvsXFQqoVaXQagCaHO5IUP6suz/I4y4T2MPA=;
        b=KzL1mKE8rC0awxf4dMZzlYd7+KGJz+gcnVpL1PvgKZbvQZpsLHq0kSijYpqtIOtrAg
         XtR3wjTDfk/+Z0+kcqbFtddjIZTCDYbAYBHSw5OEgPqfvIZS/d/kw2BVloOuZ07vzgkj
         yvj6DTziQN8bMj2kLybdX6X6aNaxB/IX9R4leZx8G0T143AX6dYUmDY3vQTufldAPqWg
         hyHFculXFM3eDRGiO/yQ/y+jPa4DsQmP86UPzSoY3vtIFeeWqb4qHIo7A9db5H7y4P4A
         vDZDy3EKgyUUzS0t5zHXvWxtCwCEQgItx4yZ9Zr7sxVUM9cTQ1nHHekNuA3CmRPnbX2V
         OE0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781687630; x=1782292430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ois7uJYLekKAQG+JspaUzPJU4OIUiESd+WUf3xjbcM=;
        b=oTU4OSU5wnSnDyercD031CKv/t9cLGlYb97lP/1Z2cvrnqX1HHutOsrXhRQHKjKjMR
         OZbpxY8idnXmnYGRBkxnmRuNkYAQ4ZIOUIQGMU5BNVlO/lLYzF50zUjMxXngrXLKIjGQ
         o8DzCnn/znH0bRL2cJzsPesKK0jt3Fze00JQnsPbg93PTRUsa0u55Ume3x0Genu+/AYB
         Hx0cl1KH/+VqyIAS0/KdlU295ICGCpuQ8ibUZeK3nTCyflh8OtSXhzvx/Sh/iIRIATDN
         L96fFODJrl5u8nErWcrWQGdYRfEpWvglebK0x6Vmt8gKvbxy96eFx3wNMcrs2gxgQr6R
         pq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781687630; x=1782292430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ois7uJYLekKAQG+JspaUzPJU4OIUiESd+WUf3xjbcM=;
        b=YH5MgLbJB+Xp9OwLqItGRyA4iHLt8tN5pFgoGtpoCRxgL9CsM/xvryBOAkz/xp+ajT
         h4h9Kw9RRz0KY1BLGjJk1jubQT6eEOF1s5/K+Ojyr0XqP6lWDg4MLIHveER1Z2RSQWBm
         +JcOQWmzTy00k6DouQkUWDVr2fsQSAQi94iptv4LK3umw5mIsWsbBG2mS73e2BMCOPI7
         Jzo93DmIUp74nbLc3epjqJZmbKQMpa4EtR9uNSAZq8zqBMmAn1/ZdEr/toJYMnpSJnnQ
         yDwS9YrZHmhLEc4dum1DJF3k3GzJ4ZSflC5wBhO0oLWX5EX4207qxAAri+geXeF9pAAL
         OvNA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ika2ETqzan6urpmcF+q35n0F3E5zNgCiHrVc4GjPu6CufZmeizZq7FD7mRKMIAS25rKBYIm1yJF5pk22uJF8x@lists.infradead.org
X-Gm-Message-State: AOJu0YxVx9kxUG30OgvlzAtvQOJF0QJKJFBTdkNehYlcXnUv2GtCZPfA
	O4WkU+cCMfEYzN81W7CIjjXti1oFqHrBqdSrTg2ByCqBngbxkaO09fgwhEIwJKM++V14zVR8xUz
	Upsq9RkW9k2c8qAPVf1Ks85tyLXVllOY=
X-Gm-Gg: AfdE7ckUp+kG7Fqx1SBwM4nMMaONewpZRX1DWWZxZdWIGY/1b+FCqhjZmnI7MITceYw
	HVM5FcMfUjwKF1p0CvvHMOHfK9Vr4BHsUdkPGk7GyxGZEaGKKsCCCVSK/YLJqfqefoJ4Qbk1AJY
	HTIV+cJnRuMsT1EaCFcBUG65pIjshigRx/qEWn11V9e2nnAHqqbXhMmIF/EkT4qIwH2pVjm3/5y
	lgIkBgHragSAIfImCLkr+Nv+euYqWfBjJF30nCrSlIituZP31PLxewNmx56qdWhwjcmRs6kpZmP
	PaeeoOjdzjc3sT6g868qrEFt/EKR
X-Received: by 2002:a05:690c:ec1:b0:7f8:7e31:28af with SMTP id
 00721157ae682-7fe5e3949a6mr25687807b3.49.1781687630339; Wed, 17 Jun 2026
 02:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260611104857.242153-1-guille.rodriguez@gmail.com> <ajJcxgVejqzlwo9A@zenone.zhora.eu>
In-Reply-To: <ajJcxgVejqzlwo9A@zenone.zhora.eu>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Wed, 17 Jun 2026 11:13:38 +0200
X-Gm-Features: AVVi8CcpI0W5riwjaqmESRlTpsqx7BYL6KjvKyJMbak5WMtWwLSsdGYOX4x2Jls
Message-ID: <CABDcavYH+=xrCA605me+6XrjV3QmVAqdfEmAC7SwFQBT4GHarQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: stm32f7: truncate clock period instead of rounding it
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"M'boumba Cedric Madianga" <cedric.madianga@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-i2c@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_021352_231464_2CDE1F7F 
X-CRM114-Status: GOOD (  21.29  )
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

Thank you everyone.

A possible improvement would be to derive the clock period in
picoseconds rather than ns and do all the timing calculations based on
that.
This would reduce the rounding error (from max 1ns to max 1ps) and
help the solver find TIMINGR values closer to the target bus
frequency, while still keeping both freq and tLOW within spec.

I wanted to keep this patch minimal to address the spec violation
itself, and also to make it easier to backport to stable. The
suggested improvement is a bit more involved, but I wanted to mention
it in case you want to consider it.

Thanks,

Guillermo


El mi=C3=A9, 17 jun 2026 a las 10:38, Andi Shyti (<andi.shyti@kernel.org>) =
escribi=C3=B3:
>
> Hi Guillermo,
>
> On Thu, Jun 11, 2026 at 12:48:56PM +0200, Guillermo Rodr=C3=ADguez wrote:
> > stm32f7_i2c_compute_timing() derives the I2C clock source period
> > (i2cclk) with DIV_ROUND_CLOSEST, which may round it up. When the
> > period is overestimated, all timings computed from it (SCLDEL,
> > SDADEL, SCLL, SCLH) come out shorter on the wire than calculated,
> > and the resulting bus rate can exceed the requested speed, violating
> > the I2C specification minimums for tLOW and tHIGH.
> >
> > For example, with a 104.45 MHz clock source (e.g. PCLK1, the
> > reset-default I2C clock source on STM32MP1), i2cclk is rounded from
> > 9.574 ns up to 10 ns. Requesting a 400 kHz fast mode bus with
> > 72/27 ns rise/fall times and no analog/digital filters then produces
> > an actual bus rate of 415.6 kHz with tLOW =3D 1254 ns, violating both
> > the 400 kHz maximum rate and the 1300 ns tLOW minimum of the
> > specification.
> >
> > Truncate the period instead, so that it can only be underestimated.
> > The error then falls on the safe side: the programmed timings come
> > out slightly longer than computed and the bus runs marginally below
> > the target rate (375.3 kHz in the example above) while meeting the
> > specification.
> >
> > i2cbus is left rounded-to-closest: it is only used as the target of
> > the clk_error comparison and is never multiplied into the programmed
> > timings, so nearest rounding remains accurate there.
> >
> > Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guillermo Rodr=C3=ADguez <guille.rodriguez@gmail.com>
>
> Merged to i2c/i2c-host.
>
> Thanks to Alain and Pierre-Yves for their review!
>
> Andi



--
Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com


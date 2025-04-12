Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244F6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 18:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dTqsGRTGY0t5K+LIOjuDzlZh6c2Mj0q/pqOoIFtsZM=; b=hr61BM0sJc9HPvYb0ydKXGANLd
	PnqqhJfDuWGkFgx+czSx0/RWKtG/NXARkVnQOV7kFIv0meQV++xUTrhvvGrOjp/lsg3w7jo5qcTpo
	wFvBUMYWwIg/dgemgibPEVj7xki9OVGc6UKNGGQ7tiBeN0U3mCouxDlmdxJiEmkQYXztq48C7heMA
	8N0zyQQEXou8B4mTJK2Uknw5z8QOJk4UtdMl8PLh9qUsq3bEcw1MHjgL63DKSFoZFNcMtTI6loM64
	flL8Sw6gN5Ub6GR67nC94sfu2/IV+AbxEire2ja0cSh5RnOWMfmpNY5B8Giwtt6RyOviXeVbBUljp
	iXn62IJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fJw-0000000GFXu-1RTK;
	Sat, 12 Apr 2025 18:11:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fH9-0000000GFJV-2NOg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 18:08:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac289147833so594131066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744481297; x=1745086097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dTqsGRTGY0t5K+LIOjuDzlZh6c2Mj0q/pqOoIFtsZM=;
        b=kzSTMLAI/LQOm74juNrjLbH2JpJMVXGgQTJQXU5peJoxXq8CuNPlgKmsI00E+XfOjW
         cMku5Lz77nSVFcFQQ13rnYBAQzIsaqkt9z6N69cqfySAJUwNFTb/GcCs4MUOgSNQloDm
         6XZ/L5dwnN28Sen1p/SuX4O/ycEAb2cUUou8OdiKL8YBN/KYRdCxKcREr5fbvz7lSCjH
         HT9F/b576WGgPtrQA58+nKhK2H4vwJSb5bW/wyfTJ9B1ytcGGd9VsxC0zfZOr3deKEMh
         TcITLD7lEm6nLSHMwaGjBq8yb6wM+MFKkuyj7yg3C1sAIKUjrV8yo57xWMbZoxGI39QN
         Z8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744481297; x=1745086097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dTqsGRTGY0t5K+LIOjuDzlZh6c2Mj0q/pqOoIFtsZM=;
        b=D+woBIritJbpUd3Ds1Z4YRlP66pKRoqttEnLBcPeiFDqMQekKTydqNnA0ukhtFtk3e
         hQspJhIGMPX6Ve+0K4hQgWIGKittVws6ehh/QXJDyiqpvlASSiGTzNGZjn62OfgE5u0h
         TsDT0k2GJugtdCj0/3qDWfcOLFYnM0uzBsM3FXODNZ3lzMAklV22oApS1eJ0jHFF9O7S
         9eR8j9DNmRI+N/kPeYtsNgBWpaguCW0O0eEAV4tcaAghtt+ukQFYq/B5nrY9LsKF/iUp
         aQ01+SZocW1Hxsh3vqtZPbgslkNG2xJEsh5+V3anHLoiv/lZkwuP2sLRh/gIGGbw0Ia+
         weNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRGLXr4xAR0jWOoY5HO90Q39/aqsn5eqcCUQfPQqUqca99JNSp6qTrY4DaIMhxLejxEwJPo71oGEQN5Nz0Vn7i@lists.infradead.org
X-Gm-Message-State: AOJu0YwsPnVmUFBjkNJFXVDs5Al9YgzgZDSLpi6elteADGzOXoBQpY2A
	JEfr59POGHfnzZWXXLb5Usf2SkxpHykZpCUFeY7EO2e7G5LA27aV14GqwjlP6KZHqSWPKn6Z2hq
	XU5g+cj2Kr/DD2kq1vIrPN1GGuHw=
X-Gm-Gg: ASbGncsqrVTycrkDQ06pe5FnxCssPvEiMefyO0VVfW45UT9MK/H/Z/nB8x97QsqAAn3
	voYqW1i1bECCUTAUvyQsRJXRqlO3y5UK5XmmNV/Iaj+J4kU7g/DTpmOUKP2eQGtpH8hOyFj1pEC
	E7unM/z8NHnEaEuPZnmJBTdw==
X-Google-Smtp-Source: AGHT+IHwlMauSDYb3F4+xs9iOl49uDgO0Bqw97Xx22A+KavQlXG+0XcEY/aOXY8qAnhH/8FJz/p3UexMTPyWevIHvSk=
X-Received: by 2002:a17:907:8694:b0:aca:cc2c:862a with SMTP id
 a640c23a62f3a-acad3456e74mr687348866b.5.1744481297320; Sat, 12 Apr 2025
 11:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250410135836.2091238-1-olivier.moysan@foss.st.com> <20250412142606.66673634@jic23-huawei>
In-Reply-To: <20250412142606.66673634@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Apr 2025 21:07:41 +0300
X-Gm-Features: ATxdqUHG8l2dJ0PpOTJX-K4td1_yt9Tsr0rZ-bQ6xLHZ1IHBrZe_mC4b0mFcaRk
Message-ID: <CAHp75VfUkStzq4zrKkaQ67REuuTSGhoD9o1LXU-YohUULBnd=w@mail.gmail.com>
Subject: Re: [PATCH v4] iio: adc: stm32: add oversampling support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_110819_605338_05FF4782 
X-CRM114-Status: GOOD (  13.10  )
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

On Sat, Apr 12, 2025 at 4:26=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
> On Thu, 10 Apr 2025 15:58:35 +0200
> Olivier Moysan <olivier.moysan@foss.st.com> wrote:

...

> > The current support of the oversampling feature aims at increasing
> > the data SNR, without changing the data resolution.
> > As the oversampling by itself increases data resolution,
> > a right shift is applied to keep initial resolution.
> > Only the oversampling ratio corresponding to a power of two are
> > supported here, to get a direct link between right shift and
> > oversampling ratio. (2exp(n) ratio <=3D> n right shift)

I have just noticed the interesting (and perhaps misleading) symbols
in formulas here and in the comment in the code.

I would expect to see the above as 2^n. Because exp makes me think
about e (natural logarithm base) rather than about power.

--=20
With Best Regards,
Andy Shevchenko


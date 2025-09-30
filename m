Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D7FCCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5mPBHZgztFe+UJNNaee0Rp7S41YshdGbGpEnWAlyw0=; b=uQ5FNJMtnUWu+xl9IxPyPE3kX1
	vQrCF60S8symeLcuMzttnGLQeodQYxX6Yr0QZvLEN1A6aoGy3bxAdk7mVIlo62ieffcvcgvRt1xFK
	B8xMb+fTJA9dnq+f8VZ8xjqASZHGNbQeklL5tUBt+wwkSckAr4Qby+jTE2NLfsdSQvqQKbAFJlG1A
	XubGHngoTwKNxq96lp1oYBM3IBZCtOxICyAzSiD2E5odpWSGr5XPaOhalvv29UOuFClyJME++DVAc
	KpI/u2h5JaSZUKx74r2R2e1k+6kTP3gIitl7tGP22RQL1kGhf1XPXmYJHrWaex/qQWU+jXgfP8IZj
	3v9ikoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZOP-00000005FUw-0plz;
	Tue, 30 Sep 2025 12:23:41 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZOM-00000005FUL-3vFw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:23:40 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3635bd94dadso51534751fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235017; x=1759839817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5mPBHZgztFe+UJNNaee0Rp7S41YshdGbGpEnWAlyw0=;
        b=UK0fQSw5i0Jm3hzMfrArkTiNj7gbEEW7ba2IGqArYq7zLXkXycwYerkXg63BH1VFTs
         r0FawpffA6QdsDuXdfb4bKpu3CVaq3eMGdl5ujqKMFgqIA4XyJjOBs0k6zNeci42r1DD
         whH+7DFwI3KjK3kj5EEao6i5ubNoh4UFF1fgQkToqomckuBBr1huL3PKiQm32A63HIp1
         n2wxq6fotCsgmThLM7SkzozqIqKpMqtfRflfPpg4Q4V5MLfABQHxO0o0jt87okEHboJ3
         tBepv4Wx7m2/+vNQS0VWJEkZvLlOrqVHS0SXf4Vy+iF1BKodb2z0zzxwZkTusklxd4Ma
         zjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235017; x=1759839817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5mPBHZgztFe+UJNNaee0Rp7S41YshdGbGpEnWAlyw0=;
        b=kiS9lnnv2IKS0CewE25J6qjS1utUaY3dhp7p/1DVbvnsH5hgi+lOqdyqIfKWZKHyCS
         +5oy/D4sG6olducVpwLTkUoXv0jzmtFlAlieijXTcZK9Csy8XLsmteKcLquBsrq5ddss
         Sej1u/U6eRRfWD9sM1vyHbDEw3m6foSC3iItVvNSAkr8TKE8k7CmW+xIOF6c7QWUCyph
         5+MaWCZC5vv6XhvgLpcX7J0rkLw8hNTb343MgsutAIjeVzFTZA3s861o7Ql2Mss/IhUj
         fEQxJVTuQvoMxAYJmbqARGK1PDN7uGo1fCiSqtf41Gu2bmNl4AoReSbZGLdiXX/m4ZKj
         jipw==
X-Forwarded-Encrypted: i=1; AJvYcCXIxgZU8FO0LGTg4bLhgVAsQ5jHwwGAa0QF7zfNjGFLhrhM2+p5ncCwiMLZ9XGpREmV1dWSiiU0P2Fd5jSNvode@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu+VpG695UFL5RNLgoZ4WrO1G6ouiifu3vwC1T+GwrNjhyuQd2
	NjAGD0SfT/Ys0lbJqpWcb0Aae3AmcUWZ+Rr+kKHnncpOlfEIurfn9eMtT3cnrpX0EQMXVu/pGAe
	QHQ4LMlLErMm6HFL72/4M1gf9YTvJY040ji2rJJILKg==
X-Gm-Gg: ASbGncvHBIgXEyO4p3me3Tv1JoKDd5RjNuzsb5+BqDaatedGSuPUYeG5rRU530vXtEp
	7l3dhP9Fv2OeGhkNHjNwBOF3WGIgkPWl4iBdlj0PKcGSsTmTbTDNjMte1cj5ZAT7OVldPHz1Kmp
	NcFjsre8LAGHsEOoLLhRKNuAIyMVTJmHdIBUmtA3aEXQMoo1f4D0cVuguOtsyzDddlKIGv2Yfxk
	lZdMyaDhDmKPnSuBLHHpAimKoG44NA9XhgkLO9Orw==
X-Google-Smtp-Source: AGHT+IGSs2X9ijyFw3JfP/dbcoV1x5reGxsDzHTGImekBQcST65Fp+vF2qwnOoDfoooKD5etndPOpCBR4hOz+YmTkyE=
X-Received: by 2002:a05:651c:1541:b0:363:f65f:ddcb with SMTP id
 38308e7fff4ca-36f7d8c0278mr61009281fa.18.1759235016634; Tue, 30 Sep 2025
 05:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250905135547.934729-1-antonio.borneo@foss.st.com> <20250905135547.934729-3-antonio.borneo@foss.st.com>
In-Reply-To: <20250905135547.934729-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:23:25 +0200
X-Gm-Features: AS18NWDLuT_uRRtCvqxguuDTeW5zZ6aEk6iy9iHLeu2I6jlVchqTLlkeIzQ-p-Y
Message-ID: <CACRpkdZCKXYEegV1cK6X9A9k8ORLWweBQs40PWYuTof3JgcC2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: pincfg-node: Add property "skew-delay-direction"
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_052338_997984_1745BDAA 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Antonio,

thanks for your patch!

And sorry that it takes so long for me to review it! :(

On Fri, Sep 5, 2025 at 3:56=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Add the property "skew-delay-direction" to specify on which pin's
> direction (either input, output or both) the value of the generic
> property 'skew-delay' applies.
> For backward compatibility, 'skew-delay' applies on both input and
> output directions when the new property is not present or has
> value '0'.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
(...)
> +  skew-delay-direction:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    default: 0
> +    description: |
> +      0: skew-delay applies to both input and output directions
> +      1: skew-delay applies only to the output direction
> +      2: skew-delay applies only to the input direction

Unfortunately I don't think this will work, because skew-delay
has a value, and with this scheme we can only specify that we
want this value to affect both in/out, only in or only out.

What happens when someone want to configure different
skew delay for input and output?

I think it is better to add:

skew-delay-input =3D <u32>;
skew-delay-output =3D <u32>;

So the drivers that need this explicitly specified will need
to just define one of these instead.

If you want to be very determined, make the schema
not accept skew-delay if either skew-delay-input
or skew-delay-output is specified.

Yours,
Linus Walleij


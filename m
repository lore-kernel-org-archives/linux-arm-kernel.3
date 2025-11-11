Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C249CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=; b=h0HqmT+FmthDmjxtQLvbCm6KG0
	QLRXpUtuwJF3CcgLb1gksL9q3SXnTuJT3II8lNHzlzuvxJmLgbpzkImQRSWdZx10BBvdYxFCi1L/l
	5f+BCl541oGwCXmkB945shB1GeDge3U5e+Tu8yInqPtpK0Ya/4n+s/M6r59vGGWzwm8BgJJL+kGOE
	g5Kni9ytRMmLNPXOmHPBM7bca5cS5VW5xKPKdAmz+c/evj5F80vFhVWxyMYO8f3WxCTrvYpard8ZX
	FO7ubSufOR/n8WqSnv598kIMAipTjt/78yXqB/RpDjKyauz4zp5q3JuFE+vRIjvguVIhn2rEYvj1x
	MojqFP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIltl-00000006zQh-0aKD;
	Tue, 11 Nov 2025 10:46:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlti-00000006zQK-0efw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:46:51 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59435d82c1fso4121114e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762858008; x=1763462808; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
        b=Tr37SCff7TwwRLPvmlDE/qzKqu7HQLL3E42oMieTUpM0lwxXXM7EBOUyuyTSRGZyCz
         ALLlsRdzYvDe4HxCGFqoC8J7dCV1jAArxXPuQE9KJRfYwf26lFuOfccErelf0kRCzcne
         z9eVbDh7lBla/Nv5cftcnt5p1DuvDfVJV85JardcSNYDv8br7slbwlc3NLZvKLClEORm
         TMhViSZXL1YPSpNEbjRiJJf4uhcgWcNkSXgJfijeMhsqVU7qbMZpO89D8DzXsWXzOrJP
         K5gtjhE2KZ+P2lDqsj1pF/UDkYk/jcLYqS+/YKQQCgR5Tg2tGKEf05KABCldYtVuXiuC
         ywzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858008; x=1763462808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
        b=aW3sfywiWVRsxXlVld58TgIs94Tccr/l5ZPkNoM6IohCt4aGrjar0l5Or7ifeOG5xN
         ua6ukyCGW1U4qTs/v0Qr/8wW/lA8rpckf9FApsKswmV532119aB1ETntn9v/AIvgqQ4p
         yZLIDMHontHQcbEiC6BAh3doiOdbf4r9uX3BqRrH8nQYLZ2D4LxAC/Laws/EK42FPPZw
         YcxmGuxTIjymg31qOyZx9E3YV330LOUEB5Y4n/Dl6PbR58FgqdbVm3GSjHYWEhZVIIYb
         KI+vqL8ZFnl9KcG5nIJBTojYqj63iy2gOkGGemXsxLFv9OG3ecH/UL44rdr0jxhnSF03
         iwbA==
X-Forwarded-Encrypted: i=1; AJvYcCVpsmyXhLzpA52+6yYQIbnVPjqzg5oJRseCmbVUQVB0xAueRo95HJU+gj9ScNwW7+PY7xlCumjqSN/nQSHkcwzr@lists.infradead.org
X-Gm-Message-State: AOJu0YzYwHE9yCXjG2DedeJv9RY+t4jee/IQvxkkbP6wZoNiXJU2E8aU
	0J7shI6fw4xijHAAQwHTSxsmGuPLJpp4gZw8FlrGnlTNs6lDz2vBMdbDhVgtY8vqcxJWXeVLNTN
	BgUEQYXfceuGqDyrwX3B3F1dxmlLBsXXlC2r7t2PkFQ==
X-Gm-Gg: ASbGncvRhSpGQjAKtQgldvX3+RU6PAVaQAzweMWBO38GDZEKnyTAgRwBSdHqDjW+eVi
	0klFI0Ii2OL/EzWjKc5Y+kCO1NS5itbhJVj9dQ3ot17yKg9tnbcg70m1FCZQ8695CUVf7YMIy60
	EqbIlQchIJqYbcimFGRTi9cGqdRZqSgwMHD1FIaorTKFDq2+2vvv2B8pkJuMqCiTX6m6rM4tl86
	Ax479MK5lOmMO88G3z13twxwe8PC7qCDEIhCtBXVplxi6jyri3EEPbdZJQE
X-Google-Smtp-Source: AGHT+IE/zC5OMsYl03Nj0mPJmaD1a2IXwBvVIbEcz3pKu9CsBoN95WeMpa65Ti7xOQGESKhkoy/5byt8ZxIuQV5LRlc=
X-Received: by 2002:a05:6512:3ba6:b0:57b:5794:ccd9 with SMTP id
 2adb3069b0e04-5945f1465b9mr3570547e87.9.1762858007876; Tue, 11 Nov 2025
 02:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
In-Reply-To: <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:46:33 +0100
X-Gm-Features: AWmQ_bmu8Uv97qyqiqkPQLTOzsrjTmZVCm9AYfJGSsxfxSYvRIGYvQTliDsDKgo
Message-ID: <CACRpkdYBZQJsptXhxOHvFdNwU5_-_QDfaLN6tiDqgL=bBWoXmQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024650_230128_2BEFE879 
X-CRM114-Status: GOOD (  13.22  )
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

On Mon, Nov 10, 2025 at 10:46=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Can I get some Reviewed-bys under the GPIO patches if there are no
> other open issues? I would like for this to start making its way
> upstream if there are no strong objections to the concept. After a
> release or two, I'd like to start enabling it on more platforms.

I'm convinced of the soundness of the general approach so I have
added R-B on the gpiolib patches, FWIW, for the rest:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

You clearly have an idea and a plan here, and it looks solid to me.

Yours,
Linus Walleij


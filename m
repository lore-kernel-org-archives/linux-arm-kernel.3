Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354D0C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=; b=hkOslxqzK6dxZ4NSlTK7TP1DwI
	duwXuHOkjMXaq8t2vtIbYBHS64ZWAFtRI/h5pg4LReqVXrOjNn1M0InIol+7tGyJLHlXqAI7TFWce
	0GZBHtktoAJVPWHmbI6Ogo7M3NAuJP4Z4vKPIKAOGVPvPwwFHG5K6mj7S5BwCJfm+FtlFWj1zEgJu
	nrQLjt0tQ2Ks4aN4ASSKV64jKmxuCVIb4XGb58Yrzc9LcAhMKqi8OTnNN2bKh+hMG+rqTa6EBNc0Z
	wxvnz4Z6+7HdQnlhirz1/RPgjpp9M97sHDwgL8XM5XFJJTeD7CwQ0aGYuDeckNtquUIVHh0DSJF2w
	RIMlhUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAGB-0000000FY60-3jKM;
	Thu, 05 Jun 2025 13:03:55 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNA9u-0000000FX67-0ZZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:57:27 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54e98f73850so1060867e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128244; x=1749733044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
        b=suMO0fjQ6cKdx0ASCGOhpWEMN8FYaSPMTPLuBARx9FL3it/w/z3gUocYDwD9o5y2lB
         W4QWEN4voIm41dVHxUnWN5CwUJtYRj2j6s0eI3qzWT5NSJ1OorFK8RP1oISPl79qEePc
         /BHWoGeLickcCFWiqqPa7WbHGMyy87AM+Tl52wMis+9Jw79KKv3cchA6GgNHN1AocPUT
         0aMPQXhPF7wWhYFjYilH96TRBA6WJEj1rqtbLftHyTwINdHUoc2QJXPZgOvoL9LRoaII
         2zS0PYvVCq5kVfdfVuTs1thiAVbN1Kh/sobyKaa8O+uUwdkFQS1lYa+34d32kXBDS3VD
         C+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128244; x=1749733044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
        b=eypNpu07yUen0f07LoHWV2APYheOusFsnp6mN4YYaT1DMGQFF4c/8ol51pjh3Ci8bc
         gBU9yiLilIfzKJJmrI4QrfRsj1tvpZd0Oxd9/wzGyr8Z02Nsygb+GzJX7ocVVj9kpsMZ
         hcG7vDdXG1wYAzp8SBrwa9CuXe/BnAZNquGZC1ldZasPwTCszZtJlKfuuC6PB6MUFx81
         Q1uz5vp0vagu6Fri6l6qrS3RHa9GmKI8sgtOCVnOcSlVGxbZaBSEoZ+g6ZKJ7YNwxMSD
         8QML69ozUlBzoUPnpU1rjKrl0rYJ2BpTc3dBth7PbUqB6Dr8+jhImUuxWcB4s3CJqxlw
         3MWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcgEKJ1ftepchJmpVpQ4xUFBNqLBgFG4iiJqZXzJZ/77liqpsSVzzg0VIiQ5eoEL5WzoaVIk7sr0HbglxEQtE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5IcBeaSCPf9kmmBXvx+H1jwtIAALXI16yHj6tgSDlPWbJfhrb
	hTR+/KS0LaNrosbM5nx3ajWOjtaIw2g5+LE9O/29RNGFbAPz68esN8wBrEg3fRvewBq7Dbr64Ln
	boj0U0STLJnBl9mcsfcBEIkxF5Yd6OWeJMMEy6yjPzg==
X-Gm-Gg: ASbGncuoqb7qLXsXxGEbLQ3C/0xtWLFG87mq+fl7osovxN2WtzTaM3BWwTyvs+vmjgC
	+PdldkaItbTKTf1QwlpXhEFdXWSo3/g398OuwGkPzsgp1eDAu9vqcKfK/fwo0hHY5aNZq8mnmuz
	ehAFFuycVuf2QMzxbFUwnH6IsxAr9Q7UgR
X-Google-Smtp-Source: AGHT+IH9Fc11r+z9z+t3mefrHIVAfP3iFGxFMGaJxOiqNg6l3VU72qxYnBUmiH/fduZ1DDpbUCP8vP1nlENlTDvVodQ=
X-Received: by 2002:a05:6512:131b:b0:553:2cef:2d2e with SMTP id
 2adb3069b0e04-55356bf062emr1989659e87.22.1749128243632; Thu, 05 Jun 2025
 05:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com> <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:57:11 +0200
X-Gm-Features: AX0GCFtoxtlGiRHxvWStpchY7_DopJKwnpQcArCi5YFUYLwYh-hGYulMuAzYZ6s
Message-ID: <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_055726_176785_99D9A170 
X-CRM114-Status: UNSURE (   9.49  )
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

On Fri, May 23, 2025 at 2:40=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> Introduce hdp node to output a user defined value on port hdp2.
> Add pinctrl nodes to be able to output this signal on one SoC pin.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

That's nice, this is exactly how pin control is supposed to be
used!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


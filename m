Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54200C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=; b=iWMz1MjNmEZihjsTOclNON0LtJ
	G15LM7cciEi0caG2/gzW4S/jbZ8BPPzvkNuY025R2U1B85ebTxEobbBaHahvdo/LqX9W73tWA8V5z
	3UhOYQE+DxRYiEC6BjkkskqTBcP03mA5uR/OiKDBeDjQbxpZWgrGdUs3n7mcFbw/BNXiMYOKCVOpO
	FY3PAi9XbD3BmTrDCXZ9Ahpluy8VXQCF3mw2AuvJ58SQVsJs/bOet6a0voaBoQjEGGtO89tfMGQbD
	1YI3JuT8RFT7WL2iDAEAAWnRlk+pVjYZ3YeFDl4ONEUYxupzd6oaPAHJs0Wq6dfG6wh3q7HEmImOw
	xRl/K4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrnq-00000006ryM-2EMB;
	Mon, 05 May 2025 09:07:58 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrlp-00000006rY2-3RxV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 09:05:55 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54993c68ba0so5334515e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435951; x=1747040751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
        b=QgJVWxMHespXDGeHdqMIZu17QN9ZcuD/g1nFgbAMBU8Q6SOdAMTL96qR2nJdx287wV
         zJSA74rtE1ZDMC3FzgQBj9QZfBdnxF47jvTQa9OYLpeSErMIvMVT2tFr6YKLowfqWnE4
         UHT0XjG+NhGebwAj6THvBOzmiPOKmKxPpYbh7bITiH2qFielBa7bt7CRe3wpJnRz2eb5
         UULtGSU3nEifcwKO/flx9MwapG7VUA6AS7aIvz12Drowogs37U1/MxWccKLqrsVxnrTD
         btUPChctdKkvc8+sbuc8sSGC+sK2W8vz7mepkIRq9FftNbGeLLNqq39aMPY5xYQkMp9H
         UY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435951; x=1747040751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
        b=ZT3DwSi9qXtBgx3Xuw75cX3gSp5GTSE8PlfqcmOl7SLlHNAjSaDvLjQZO0XBoHaKhL
         x2lB1TQW5Gb++cCxYlNTmwqRs20j5K0AD+V+AGokcSBAtrFqsEmrb9TP9skTaWuK7Got
         8YpX+NkV/Iesdkwl0w2ErvpBa8Q55B55f1G8yal6lARIM2XGitYve0mXf6w9XkxcabJx
         7+eKGeidtMCeN67Q4mwYjfimxcNZb357SCWLt5dmiV2gFaHFrb9t61fciVhiMVf8jcrZ
         VcHhFfS9UHzsEtzcjuWOnrAzfDjXqzKnWYCXB6oQGWOH9IbnxlaPcNZyF69QgxvQiiRM
         ZKgw==
X-Forwarded-Encrypted: i=1; AJvYcCWIGd0QlQAxIWSJmQvB5x1ifs3zMCkQq2g7g2PpJEIpPJ90HW3PkN5PG2IvZ0RF3NSJL/C/R+zwbBPHUbQnb4mf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5pyFJR320UJD5sUmoIJgW6qDB8L7PBd30jDGar00JpG2c6itw
	VfrCxV2WJ/ryMovQ6GvKrtqriwnTuYrRfREmBcnzM3Y2jpcHUhPBA25lWrJCayhNjWDYXnusXaC
	FuUPeltsMcc/0Mx3Q8xqF/YgBMSpPIuka24n2YA==
X-Gm-Gg: ASbGncvWJZw03tEEXhVNmEDJfi8zfX6i0lsf9T2UtDc0FgbM4IWaxSRMWqwXZQTRrsL
	fes35xfYkFjUfYZpzSgKcp6Tr6wu/qHzDk7/NNEGYq9uqn5skyVRkEB1F4TxxOlyqTUJQw7BlTy
	K0183Q5W2SEXW6sSLn2l0u+g==
X-Google-Smtp-Source: AGHT+IG1Gg4cqaY2027Xkt9vszcojc1RUUWP69uzjNjCzPb0+lNxfxbfad5R/RgzScrc0f+PobFDAQA8A6a3BcrID1g=
X-Received: by 2002:a05:6512:118d:b0:54a:f76a:6f83 with SMTP id
 2adb3069b0e04-54eac200d31mr3042013e87.13.1746435951218; Mon, 05 May 2025
 02:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev> <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 May 2025 11:05:40 +0200
X-Gm-Features: ATxdqUG40K92Q6cLhA-jiK9adWrE64up9leFqXIiQtBvPLIG9_nqRk1Z9BFEJZw
Message-ID: <CACRpkdbCfUEZd06yeZTNecGFPwBgJkpMH3hqkvJw4J+iSENG=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: gpio: Add Apple Mac SMC GPIO block
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_020553_863255_1C94F604 
X-CRM114-Status: UNSURE (   8.27  )
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

On Sat, May 3, 2025 at 12:07=E2=80=AFPM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:

> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
>
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


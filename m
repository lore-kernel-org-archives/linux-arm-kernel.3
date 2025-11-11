Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16437CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=; b=PYa7uw4GEgZaOiY50QWkw1nd86
	+8LbP+lxNVe8lBFBThtZyvPA+B8+h7hNqT+RCwyfydG0p+Q8zWw/w/KB85McRdsqC/g20ht5T0lpm
	Cjm4l1ciDa6bovmvsQ85hlw0aYLN9dZySzFqGURZ1MpLhsEkOflgmNgEV9c9RSW6q1qLSFXyDQDwT
	YvDc5FNQg3WvEmTA51bLD7UCFSLe/zyt8+nqRjKu80UnxGb2If3qeJ079xohKAqgEj5OD5a1Lo8Ax
	YbcpwfRVdaUQXmAwQtrG9nc50FepF1PXoQNT5LD1Emp2lLfJA1Eb6mcwgUnTNsBuizlo5QBpR9DpC
	8oP8+4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlog-00000006ySJ-3Zkq;
	Tue, 11 Nov 2025 10:41:38 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIloe-00000006yRs-22Bj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:41:37 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-786a822e73aso43785937b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857695; x=1763462495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=cnGmGWC3cb75Gg4dmd+84EkTpm8tIPcUUwJkFEQIY+a2pum25bMvR83Xhl2W0u93Sf
         VEbNiUlCb8l/C9ByPk5Z6vnm+umu4d5KC4Cg0qZUst0Uu06yggSnGJlCzpMaPE0Hu0Gz
         8shi3xVSpapuYjhDW2FBo2GmdnrFEU8HUAARAl8tAmaHRAz7SoEOj481rWBXV8vbWFnt
         r22hF5avHe1b0AZfLdRINJjTCi3Ddj+98cDYKmNtomz80MP5yYmi/mNlaDZvtWi1F7kF
         McH2lhJT6SHhjmH/+7mSifK9FZcCoYQerY7OEB5CdTq3IdB7+yb2otueYMvmKs09u6rK
         VD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857695; x=1763462495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=Dzw+7wM43mbe2spTWhcThbG5HdzxRx+ke9Op8e12t2h6HMJacrKFADscVmMunrcj95
         YuoESfWL/1wxi2lsVuSLOoTTZ89EDQSywbOrKQtkwoGukkzqvxogklG7SN9cp2iNk1kN
         48XnZVOFelkJfCNfQQ9utBP/zmulHSR4YLq6UA+upQaq9jFtMCMUxTOgK2fIK8VYsQAq
         nG7a8Ge/b8vVredYvpovJj0Z1whFfe4jzDFMMWW6Kxszi5SVkYgdkLlYqHroyydUKnp9
         W/ERBzVrQGhf+BTM3DgcAZtJGjzqw3upTid9fJLhp/7CV7sj+y1sOTO6rZbJPlUwlDcz
         DGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAIspkAMi0BgHdQy1En3EkPkDmCzrjBif0kVimZ3s/TZHg3twIWXNjDmNmG2tzZJvNl5YBQcQScmUk6dpRhdQP@lists.infradead.org
X-Gm-Message-State: AOJu0YwKC5tvKogF5ZaKOEnr3vmneqvA/d9oF4pbSnX/Q7MIr7Q1swpt
	Lh69sG8h9MQl/wXY7Sx+rNW2Ju0FQtRan9yoxzfdSKxn0ZLI3IDUfWt37kUWKt3iw2r+qV8Vx9L
	8SSOxe80S4adlLwH3ZOEsfi9iEMAovgHKywbEVK+zLw==
X-Gm-Gg: ASbGnctw6jU0bN2ZfEK5vlAb6nGvTJGM2Rhe+mp5TRAoOmjWE+TbLg87neomicUCezA
	F0iTcHN0p17sILAhaJ5+zdYklcT7AfNwV4Z36o9nHDDUthJtJPq683o+WPbfr6uapKPMl169+U6
	II8pYjEjUVQbRJPbroDw0o3m3qIK0AbLWwBMoJkcdaFjK2+a+5x0gwGK8HpM6tESyyTM1ScPf2X
	acQKEODji4abZLbmN0odRDgce94M7FQ4hYFYujg4Ku1soabOszMx55Qrl7D
X-Google-Smtp-Source: AGHT+IHoTEqTIMeK7JCIYihCqYCVhAe4gzTa4C+3j+k47suT30AzzIQmG9wEWL0FkhepDKD6CvXqSafZZ1SR1+atEmQ=
X-Received: by 2002:a05:690c:8687:10b0:787:cab5:79a1 with SMTP id
 00721157ae682-787d543ce2dmr101353817b3.32.1762857694963; Tue, 11 Nov 2025
 02:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:41:17 +0100
X-Gm-Features: AWmQ_bn0WFQEeQmuj7iPjvAHMQKL1gkynLIxqjiJlR4NSYtZ2qnuSvoaANZDav4
Message-ID: <CACRpkdZwO8mXvjwS7xgVvHmcpF+_pgKYsj3c3QRUcYWPdCt5ng@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO support
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
X-CRM114-CacheID: sfid-20251111_024136_554245_1A2C76BA 
X-CRM114-Status: GOOD (  15.41  )
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

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This module scans the device tree (for now only OF nodes are supported
> but care is taken to make other fwnode implementations easy to
> integrate) and determines which GPIO lines are shared by multiple users.
> It stores that information in memory. When the GPIO chip exposing shared
> lines is registered, the shared GPIO descriptors it exposes are marked
> as shared and virtual "proxy" devices that mediate access to the shared
> lines are created. When a consumer of a shared GPIO looks it up, its
> fwnode lookup is redirected to a just-in-time machine lookup that points
> to this proxy device.
>
> This code can be compiled out on platforms which don't use shared GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The concept is sound and we have to begin somewhere, optimizations
for code reuse and cleanups can be done in-tree.

So:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


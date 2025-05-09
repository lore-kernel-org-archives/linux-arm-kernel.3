Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670CAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=; b=o4fCy3rvlTQIOZ6K71gwKuLNVv
	CWQH6OE6DxV7Rbf9RasLxlo30WNTB5QQ5FoTpBUWnmTCJWipQssDvg8sf/cYT013YCKb5sV4IJeI2
	i27tdV3kGiVr2C7BhrIxoJl7xUv/QzjO1mrrn2HT79/iVvoccFzN6zaZpB+lLypcmkxCKuMKR7YXW
	0GgQ6h96wQkwF8dUquXeIK+4h13N/W8fqA5TsLYgwZvTV1F0KZL/MwLAQ1XVebYSPIh6FknAo1w/9
	M4LpUeix+XL9Jp1uicOzLNiJqtpArava/xpggqD6DMLWgc+jsne44ZfHQES0yfT5JdgHyIlHuj6F+
	WxQUKb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJWB-000000030IM-3kQH;
	Fri, 09 May 2025 08:55:43 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIkY-00000002rez-1QsF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:06:32 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54fc9e3564cso60691e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 01:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777988; x=1747382788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
        b=WHnDeOTOG6dOSFimFBUEB7Yxi6Oda+67nOKxN/mkxreITO7D4n5BLMlR0Dq5BcRwLX
         gK2qpW7IIWpgJsoYMqoSKBQEaMVz2GUkF4yF8aO68pWjcIuvPJ4Swqh/nCPMO6PUuwyy
         1cTYh72L34rUOhwa9bpLaatUkPlyti2tOHrV/AvGP4VGvww/FD0OuYmxqG+Jc3tF0Hqy
         Fw+7r37HMWtBIAfFpbVZd+Jas8thocFnc+QSHdG0CVuMA8N3U/QEKQR7ol3dr2OfcjRv
         WPJY6aJ3AmkqSrVp6WKWW7l2XbG1kygTW7cD5lMOCuX7sr+0VvFUGJLraFCW0LDiA+0q
         u5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777988; x=1747382788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqCvODsHpIfhcMqnp7QHHWAf2VlzjskdSxaKx6IvzpQ=;
        b=mZg3M3OdybpzOuLdQFjf7Of5cWK5QHYw+UVSJ3WTo2fSd7hMJ4uOnFAuxLzF0CJyaN
         j722POU9os2sfY8CxAFgHSmnhYTDun+k0BVhwpaY0PNdCBGXzkE5Qc2rT31GfC2gPQCS
         j5nL1ZS/PLAd9riqrgKhYDFEVwoITslhIX32fcZDr2kALWSvTiJqdg+HgQcGxtlPSneE
         q4nKhXsPtO0KbYSUKVOlTtnY/6X6tkRrrNDVd8OEEOCuIgBepTfzlfukKSDLOO1xanvE
         +9aIdp0qRacglFD9gzjr0+2kXlu9g011MafffBsDWzdSoiVkvT6uoZ60rfMKTfr5oOQl
         Ioxg==
X-Forwarded-Encrypted: i=1; AJvYcCWUYI/WLOAtSffK2/lPELltlq9MYkGbJn3QnF5uP88J6a5Jnx7hOEetz0CjgqnuotcpIxwlaaAhS5CTXcm8TpaK@lists.infradead.org
X-Gm-Message-State: AOJu0YxJMI3pZjhdZbWzdjI7YJ5OXfo1oHlq9r6T5V7SdVN+EJJNSyr6
	4SuaoZLDJ6De9zhsvSyJBy/lkF9EVw7VjgcvKuAygwkSPkHkCzsUcE8VHTmZmDmPYcaAgUpn7CR
	95FSM6YD2naeuLQZK1KxMW5w+iY9MJJsmTGNOoQ==
X-Gm-Gg: ASbGnctsDjQZU8mb5IhjRlvTdm8AlMgflMRVrFyx4yFZOPpO7tYuBevIFyZynQRIRRm
	mPZhqZjjg9IsbjOkVo5wP1baMxd8Cols5gmzOEaoH8rxqi6SgckQOd+r1qfaZjF7BRAp0ujvSNJ
	cnWtbLoozU0bYwJvbCUiyKjQ==
X-Google-Smtp-Source: AGHT+IF/OaH6tvPTnpWGCU15yq3VtPlZCMuQXSmIR+VYN20W07SffN7TF5F44rEgRUHfgjiVA1uoD+Xl6WIttmOvrl0=
X-Received: by 2002:a05:6512:1382:b0:54f:c31b:aed4 with SMTP id
 2adb3069b0e04-54fc67e3490mr781088e87.48.1746777988424; Fri, 09 May 2025
 01:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 10:06:16 +0200
X-Gm-Features: ATxdqUFnVH5j_K9bIXCXJ7lpjCcn1ZQxHRcfa3pHCEiiJ5CP7DDqvtQgyMgegYA
Message-ID: <CACRpkdZmePbKDE90WEhLgqPrgN5prSo0K1B4_2zS1i=1Z7zHKQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: bcm: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_010630_384145_500FC0BF 
X-CRM114-Status: GOOD (  10.94  )
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

On Fri, Apr 25, 2025 at 11:08=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the broadcom pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All 3 patches applied!

Yours,
Linus Walleij


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DCFD462B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuUoL/3Od4PAfLx0IEVL7oxlLvlZraYaALoxt1cPU/4=; b=ItEN6gL93/xtCv+uyzeopCPv0k
	It3WRF7J1sbA5iHPIdfogWvLmxC/h1cSqdqyVVflJ1agRqKOULy0m0mvPNFveV9fQXWxY9ZphEJ5l
	Jnv+ABAPjoAXNRzYIlV5GqxcVXncnljLHI6kAp8uEQMUF4mpcayvO9putVg5R83J/cpfuq1yOcAen
	RrMhWKu0uW/d58ISaDgiFqZSIcs/IhYfgl+h9cRy+cTnpQsK8oLDUiMEg+vIBbBC7eDTb2VWu/q4g
	LuN6uwl3JiJt84jyfE12oImH7CKaTdYoI33ZiLqR5SbEeZf6ZciAjYF5cmJ5KD+9CgQoMywH4HVA5
	PPVOO1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBEOy-000000079o0-3wkN;
	Wed, 13 Nov 2024 14:31:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDLS-00000006ttU-3k8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:23:53 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so59163881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 05:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504220; x=1732109020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuUoL/3Od4PAfLx0IEVL7oxlLvlZraYaALoxt1cPU/4=;
        b=LXz82o2MYKVRxGg2qKJeUro9xj+VAWqr8H01gq/Wx5WxJayU7qiPrcaMA+5hO5pPL3
         oNDwntCF3j70qfMRuGycitM/8UmNZyBC0jxFErBpvdnUSMb20Anddb7dps+dfHhGisYZ
         aDfbOd7L2NjQhzm9tX6Vt6XXcqmMXjM2XzyENr82joOxS+ORLge6fk/qY9hoWzUT1l0I
         hu2XMIY5dr0UNsOwglB0VnXQmoHsvOiU2ftuZUxxoBHt1pHtpvPqoLrP56at9RDtjVEE
         o8EKIA78Zuogpt2os0s8hTgMYoGOEk4M4r9fODzCax9oxxQ9++NCojEgZITN7eCwYK2z
         7Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504220; x=1732109020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuUoL/3Od4PAfLx0IEVL7oxlLvlZraYaALoxt1cPU/4=;
        b=PQgltK+MkaoaUK1IFcGkx3v4AMf2/PuXZHqxaIb0tcrue25wxejJADIUBlYWFdD+Kb
         C06YWfbTd1eWia6XJmqXmHvR7qCWbrE2FgkQwWmrCtlnlqGuO5LbI3tsL7mYbISsT8QB
         PP5x4BlbqHOK/yP0QuK77e+paWByKFBLXv4Ylb3zLcJeIIID+AB+9/Agg2h1ZBiPgVEs
         LRQRJZY45eFeB/f/fTsB2j/LL5tKe+fAldRgYtPEKp7Hk09ujxsbk0S3bb4rymozJjtr
         1WivaVceX6HWWAj3YwrB6UNmH5ZwTfk9b7PfIaNQRrwjkblQ97zMQynyDytBTBauuG80
         jM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRqMUzRq2yBi2cEzJSPVMTPpGhj8EDvi5mLsl0J6EoEcupwpniQCIl8osdbMrhs65n2kxLtQ5BSYvpyYZXwjEF@lists.infradead.org
X-Gm-Message-State: AOJu0YzxWf6SNx5Lyjz6rYc0VSMt2Bgpipxx3JOmyyxMnbmIc56S7qoZ
	Ux+HFo64zjqwpsZLdZP6SXvdhg02LMopnCBobaKCbqMrHcvChbQK8608/BE4xfU7si7FnTGMzrE
	pxeLjmTabwvcKdO5vA5pGehtMjra3NmR543/g8Q==
X-Google-Smtp-Source: AGHT+IHPQaK5Q2KrP40p6fsjtBW+uQBglC9BCYxI3zoro/0CrtBDXagUb0BV8QyEJHptozHMaCqcNJb9txvKEMn8wa4=
X-Received: by 2002:a2e:a552:0:b0:2fb:3bc0:9c7c with SMTP id
 38308e7fff4ca-2ff202e135amr113365511fa.25.1731504220103; Wed, 13 Nov 2024
 05:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com> <20241111023412.3466161-2-ye.zhang@rock-chips.com>
In-Reply-To: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:23:29 +0100
Message-ID: <CACRpkdaswgKiFXQMHgAW=eXCw=BG3+2oQTwq4PaAf7--vUiKiw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_052342_953936_78A0E45E 
X-CRM114-Status: UNSURE (   7.79  )
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

On Mon, Nov 11, 2024 at 3:34=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> Remove redundant comments and provide a detailed explanation of the
> GPIO version ID.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


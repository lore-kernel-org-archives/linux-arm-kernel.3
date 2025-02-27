Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91D2C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyq7rCZAildVjmFezfKBEpeheeeS0M9w2vanP83edP4=; b=LEzq1DcbQVR8BmVBMvNBFtvnAz
	52lzi1+beONqEFkXIMdW1VxbIBxvhqLiMBvdN1ChnbwAyYi/jnA0pS2eaOKoD8Fq7Glgf6HniWOlP
	MSbgUc6vdtVUUWTuwGROVfr1w1Ea4fDgSTND/gqQWZ2Yy79TEM3wvHjnsMoYP/Pk9x2/UuV4byMtv
	U7CAIUir30sr3HPghtFpenZ3yFGZa9UaJJ7op6MYZ96Lk4WQ1VXIVIAcoCiU4uNWxd5dBLQBBNY+f
	k5QIYl2iXRts5yVgUO0HX/wLEU+IR5+5Kj8yMIYyoiQ0GrD7VqOjVDUG8puyX1yH5Wq6EMYEKcqwr
	pj4U3mDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkRu-00000008m68-3wpb;
	Thu, 27 Feb 2025 20:25:38 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkQL-00000008llD-0LV1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:24:02 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-307c13298eeso17116801fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740687839; x=1741292639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyq7rCZAildVjmFezfKBEpeheeeS0M9w2vanP83edP4=;
        b=ckLfEZBF8FtKVMz5Yi/82vsqtQNR4R0ymf1mtU26zqESRT4LMN5tC6Mj/6crzkhbiW
         WEx9Sha2V1wQ9COLuACFiibRgT2TqBclTONw3RjOmCJdDNbUwLg6gRiVWX7Oce4U9zq9
         mCK4eiqoBwe9Cd6YwnM0gljGZ1ZlwxyYvGiIj5PvDLa0KnOlhlply7rWAX1XOnUFosYT
         Nyp7LzrF/wAi0IwAQGJjKbnEMEOXd9fjxgvyEvX4RXHWYDvw/87FJnSC7M4onWChDBkm
         SEEwe+M3FwwT4JgwKObOxd2QinWW1g5UOUakWdXSrNGUQnrEFYnoAhVzV00H2lHoISFR
         dTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740687839; x=1741292639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyq7rCZAildVjmFezfKBEpeheeeS0M9w2vanP83edP4=;
        b=og7sCF0UwfbiX73OZS+ltRiGOUMj0Dawn/QtJeVzHnQZymylZQDnx7RVymkxT0ZJvM
         5hgTnkegerGZIJp1FlTq+e85lNQLORBrY/O/TR1PQNyuQ3t+JHi27z6QzS2lnRriRDQB
         B4ac02M+xFuQXWClzGB41JF9z9JhpgjfQNgYzaKWInRnM4orl6qkPA575cMp6wLFo02l
         eY10HLUNpgbat12gbsV6ZfADNc/v4nePGGrtaTRQjPNhCGIt1zOMGv4YSPfQNGlm3c3s
         I0jxxCqUY35wSDzwv0NCjO3pjFtJPX/H72+BhYUzQch7KOLsXsVNTHsMioPvRVnQDGHX
         zRJw==
X-Gm-Message-State: AOJu0Yym6nKiyoPs9BXMWh5snknNfa9A9wWBXrJ7T6F3q2rqbDQEAfHy
	sJwH+iHQesnSo0IY2PYpOd25MqNSPG5UPhfYJKDH2Z9ftuZZ1/TQaod+4utuF39YYOEvuPUfL27
	CqB4z6ghLJYApZ1ejig2lWWrNYJq9vfR+UftXVw==
X-Gm-Gg: ASbGncu6AtC5bwZIzAaq2tL3XDcmd/1dB+2mz9+Jr9L0fYXvURAuf91mf2la8jN1HNE
	iC1wHNKsacqUwaLSBbA2/bCedhu3jBjmc6IFb97J6O08fqvRHcAl0od9z7A0W3cCGJVF+dxMidv
	5zHYf6U0M=
X-Google-Smtp-Source: AGHT+IF8jr1RPuup3BcxHI4jeLlB8xSlyodMY3QSAvlSz4clUiZCsM6vxrH9ix6FZsUN5FoNEP8fAezlutGEF+kORI0=
X-Received: by 2002:a2e:b8d1:0:b0:309:1f1a:276b with SMTP id
 38308e7fff4ca-30b90a0d479mr2534371fa.10.1740687838584; Thu, 27 Feb 2025
 12:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20250220085001.860-1-vulab@iscas.ac.cn>
In-Reply-To: <20250220085001.860-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 21:23:47 +0100
X-Gm-Features: AQ5f1JrSbsBZYhsgrUajyxaLegYWak-pVEINzJX3bUZh51BhE0XwC_gtDg2DUjQ
Message-ID: <CACRpkdZShkMhO9vTvdbyEzkGLL2+mfnLmADGukNZ-Xw=NNxksQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Add error handling for find_nmk_gpio_from_pin
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_122401_121674_14F39E97 
X-CRM114-Status: GOOD (  11.94  )
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

Hi Wentao,

thanks for your patch!

On Thu, Feb 20, 2025 at 9:51=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> When find_nmk_gpio_from_pin fails to find a valid GPIO chip
> for the given pin, the bit variable remains uninitialized. This
> uninitialized value is then passed to __nmk_gpio_set_mode,
> leading to undefined behavior and undesired address access.
>
> To fix this, add error handling to check the return value of
> find_nmk_gpio_from_pin. Log an error message indicating an
> invalid pin offset and return -EINVAL immediately  If the function
> fails.
>
> Fixes: 75d270fda64d ("gpio: nomadik: request dynamic ID allocation")
> Cc: stable@vger.kernel.org # 6.9+

Unnecessary to tag for stable. It is not causing regressions.
Skip this and apply for nonurgent fixes.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


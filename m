Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A68C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pw9b1PNCrvCj4pipFtdGJnivRzpncTcPSw1C2hnQDIE=; b=LcWN3HT51KUGpO97LLfN64qJz8
	uHckYi/2sR+Hxk2WCOKWTK1sCi0Rk5Q8QxlNVNrHoooSyXClhRyibNlYbIKieuUi9pN+eWnL4ra87
	XSaRBXLJShpYPn7s7MftVXOLHvVejcU2VdqQgPYRjTmUTkxBUJZyoanuqQfBEI06hHRHioAvYV/OU
	/b0zeV3YHwp8EUHmNiQ6eTVK/PznLf9YJArcAdovZXCrnG01yyAoxbt3P7XsR2Mg02d2BaLZWjhgb
	4/L5jkYLQiJ2kpQWq9VeGIdZC2idLCw9T3TZCyKc/I5PCsxi2TLyajvcuuQ+EOvpiX1N3RnPZAVAH
	ErbIqEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twzGC-000000059Qe-3FmW;
	Tue, 25 Mar 2025 08:03:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzEU-000000059D5-0hRC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:01:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-391342fc148so3615308f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742889716; x=1743494516; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pw9b1PNCrvCj4pipFtdGJnivRzpncTcPSw1C2hnQDIE=;
        b=k9nGQcjPu5Dx/sTyn9cjLCS1A47TaneKZjll9/DWFaRZkezQH2iKeW307r8xwYMVUD
         pd09nEKiVcxuYTfF3fqWosFh7gUfD2Y8HDdO0whC2YYmODXlGXoCH5gcudbSnCaKC/2d
         ARDDD8tMB3U+a6war8XbNhCNIUfuilP0bqAqz+yQTjWL0hYdNcLOVK8cZQU1i+3nIWog
         pRlTWO+wP0/Tn61gOpStdEndMRgUnNCbsRVo7YIBbVJSoc36jB3OW4TXpfhh8QPwoN+7
         B/ZLK2AAIuESyz+HnHaZCpayxAxdgUihlv/keYd3RluzLU79jGvbtzQloX/OXTEFj0lv
         oRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889716; x=1743494516;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pw9b1PNCrvCj4pipFtdGJnivRzpncTcPSw1C2hnQDIE=;
        b=OKcVtjwIObZIz7yCE6yFXsrKnZYccxhVBjuIlvQ9q9pG7zOqaeCcdvzWbLdH6V3zTk
         8VVO+ZPCoJHXC0ahyw+IhAFDXSxq+XgMKMVGyMlcifi4lGNJLBUzoJcsiyoGZpXBBT6/
         GuzPLkq22Nk5UbVTw/X1VTeD3EuO9NugBJdTR4KA0IjvdplwdLbVgm9DPQ/ZDj1ArADk
         OnBIypgWo5GLmZBExN96qLI4WbYpddRG11D5ndO+LRQGehQYhJi0XFJ7dxN4X31wcbNM
         d39xsHnQU88+D2FWUyMTGKTOgo4v1BbMbhJ8enrKObeT1rUMnCXEN6kK3T7Np3rgsr2U
         Pvbw==
X-Forwarded-Encrypted: i=1; AJvYcCXuv4hxohhL8nHne7+7Tg2CzL4iuKcWYhAjMddohddQscXRYW5F5y8oC39p7ayBWKS+Qd3/t60fZovTwP09EH7V@lists.infradead.org
X-Gm-Message-State: AOJu0YyQVTDd6ZMS2dT+ZpQRQnKKcJG/4qghlkyx9imrJFxzdgv+Wn1g
	Ajf2ja1Nbs7uWZLsah+bz5fHYFJVxj1u7UPiXCOwoAlZe3XJ5oIt8eMP2dnW404=
X-Gm-Gg: ASbGncvGlvXEknSEIvQFJqQCTCUGrkL6iW0tCwzmrsLj38qmVX8hw+At305NPExmmrJ
	QQbAtRun+IwIZNq199PV8spmEgoAZzSx7pJkTqWu4fRGMEUeyWZYIIkMvkqYivk5K0eqoK3dxru
	+M2qE0l9M+JxH5Gd5h6aB5usF5+tfL/AuurRMJIuzi8A0FWra0IWCcOOsIcCiE+4WssT2W88Rah
	ZYZeuvtiyU5rNBGIqf6K7H5QtA7MY/AGDVYqnXTWPiVEHpai5cHzCwI9KjmpJCuLG4KwtxJ7O/X
	LLIu1MVSYJ+ZNW79ErG19FcPxZSFx3xWyGSAMLKKmlS8gKfS3Q==
X-Google-Smtp-Source: AGHT+IEdKMh5Vkn8qIQcdV6MaRJha1LCACg2NhchPePa1fLHxwn1+onjPFo7rIPkaF3e2QGOEbXqGQ==
X-Received: by 2002:a5d:6daa:0:b0:399:6af3:7a77 with SMTP id ffacd0b85a97d-3997f8fe892mr15837727f8f.19.1742889715763;
        Tue, 25 Mar 2025 01:01:55 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5939sm13303207f8f.60.2025.03.25.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:01:55 -0700 (PDT)
Message-ID: <974ddabee5a2a43b9d32f382ec4b13afab066f1a.camel@linaro.org>
Subject: Re: [PATCH v2 2/2] firmware: exynos-acpm: allow use during system
 shutdown
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 25 Mar 2025 08:01:54 +0000
In-Reply-To: <be580155-372f-445b-b9d1-2dc4fbf1c3a1@kernel.org>
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
	 <20250324-acpm-atomic-v2-2-7d87746e1765@linaro.org>
	 <be580155-372f-445b-b9d1-2dc4fbf1c3a1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_010158_221264_40F3E76C 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Krzysztof,

On Tue, 2025-03-25 at 08:57 +0100, Krzysztof Kozlowski wrote:
> On 24/03/2025 16:34, Andr=C3=A9 Draszik wrote:
> > +static bool acpm_may_sleep(void)
> > +{
> > +	return system_state <=3D SYSTEM_RUNNING ||
> > +		(IS_ENABLED(CONFIG_PREEMPT_COUNT) ? preemptible() : !irqs_disabled()=
);
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * acpm_dequeue_by_polling() - RX dequeue by polling.
> > =C2=A0 * @achan:	ACPM channel info.
> > @@ -300,7 +314,10 @@ static int acpm_dequeue_by_polling(struct acpm_cha=
n *achan,
> > =C2=A0			return 0;
> > =C2=A0
> > =C2=A0		/* Determined experimentally. */
> > -		usleep_range(20, 30);
> > +		if (!acpm_may_sleep())
> > +			udelay(10);
> > +		else
>=20
> ... and what do you do if IRQs get disabled exactly in this moment? This
> is just racy. You cannot check for a condition and assume it will be
> valid for whatever time you want it to be valid.
>=20
> What happens if system_state is changed to shutdown in this particular
> moment? How did you prevent this from happening?

Yes, and that's also what the I2C subsystem is doing, AFAICS, see
i2c_in_atomic_xfer_mode() and its use. This is to make a very
specific corner case work, similar to I2C which has to deal with
the same issue during shutdown.

Would you have a better suggestion?


Cheers,
Andre'



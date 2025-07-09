Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BC5C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSx8Je+RgwnMEIAcCKMHtWK8TOYZz4SAUO07h86htJM=; b=gDE3U69FrnDUXlXFIZj1nvYvgh
	UmnbAqcSPsYVPZ52/1whK2uxIybQKm9cCkcEjjSRWooxFJeLTAfLOiEm5pAcq4Nqk8RkaQndCeKo+
	0gw5oX6cvhRcgswCJeICUiQdyl52hQL6bMxSVH1LEKaZbIn6/4m/V6B8A/4faFdRczzV1wVmgquiy
	swQzrHmDrmxUAp2+HS3upZqKCK0O2EzLbfDt9Rkiwwhe0Ol63AKZ98Xzn1j9lcQHWl1l4ydIOHtBi
	XoAD9JyQZd9kK4uSwDLL+pivaNr3rzTvQygG0KNhy9l441YeiDsd52HVgqvS2SSRNViVGJsL1h+VP
	CsJTYdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS2V-00000008J2f-0wKv;
	Wed, 09 Jul 2025 10:28:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQEx-00000007yps-2J16
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:33:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so907680466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752049997; x=1752654797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSx8Je+RgwnMEIAcCKMHtWK8TOYZz4SAUO07h86htJM=;
        b=EFeffyqv1M+NoPmV01IlrUSTbGzn/7/3GTHSD83STITQiue+IkfWq02Hm1M3ynLgWf
         0Cwtb+SDtK3AOY6crkfDxklBq/BSEs23KlvN3IrixfW8gAP5FYW/tmcOLxlCy5pUWTJ7
         flYehPY8ZrEzo5lSz9ikokSgVUw+f/LwoEInIuWIfcLg/SeGFxMnlMpFYkkwFXwDE2kf
         oSSqUipEGB2sgzBlrOBnFiWNzDOxbyypolPGn6KggKWKkcqiG0FjyiLPpwxUcubRLEj8
         VPPx/mQ3XopclNFg4XQKzHSPbuJ5A7Dq2pCsaNbBcSYELVYYqo7lCUNDYnNM5OVQ5uaS
         UD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049997; x=1752654797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSx8Je+RgwnMEIAcCKMHtWK8TOYZz4SAUO07h86htJM=;
        b=Vo0uR7ufLlktoaRreJ9Hfmks3VXTRavJaZnJlqSYwcSHfCdxDVSpgCC6YleEaWw/qV
         ZDSI8uI2yo3wqfKMXzJ978me508tUSy6p8bMTcZbkky4bMY64Tnpvo2ipbMyOGn/Fv/N
         HcRZlFPA+Pbv/Qs2LjcXiMRSTA/wUR54WDtEKHYMdCCJuyK4JD7YadiVn5vhMOOQahVM
         ezy8GVEHsxFwfEMwSgFLvulSgOPVi3VSr+l1NdQhsxx1sVJTVgrve3BILl5fwMOJLqzp
         aqZ5ZpOCqzyXiQYOnXlfzFvI4ffD7uUxczaizsqFzpad9ZShk7g7Y2FwZ/Qn6O8CbzDY
         0zEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJiraSsKtLWD0VIiiSPlpShgDpuaFgcT6ju77RMjDYc+bIMxJFXeT8+cR2f2UY8EZszPzZhIBEa8iJ7FyOURRa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1yp6ImIuUnZ6GF2tfXUQ+UESHjNOxCNTqdxHEBQFStOefp52g
	vvHWJ/cuIi5xqC/8i8G84IDMawAAqbhh3+yop/nPWpV6IH494p+qsYAK0myukWcVAJ1JBmwBrk7
	8hwDGmxYCDFxMcsQ0CGiaRjlGknxw2b4=
X-Gm-Gg: ASbGnctGJaO5ClK9uEr3CGoehVzjbhyEoP8dduPGasWhWSYDFDowan4QKVFR4j+9kEy
	0BFOKoMNMotE2PIJAg3hepUlFbgrayoaNNcSY7WN+klTh95//cmDcr2ugEnmiFlMEEuHRPLiayP
	Vm/pEslxnSKDXBqakINSPEdhDYgFc8XMfVuycaoHjBRc0vbU0SxnHBuSq9
X-Google-Smtp-Source: AGHT+IF/ot5abuPWaIOwiRC4JZt3VIY7aaAsHT4N9dAkO57tMuiiTFRQbOKdu5Dhl8ZD0DF4+QEKTtLhXBuMHBQgEMU=
X-Received: by 2002:a17:907:7fa5:b0:ad8:87a1:4da8 with SMTP id
 a640c23a62f3a-ae6cf5d79a3mr174652966b.14.1752049997183; Wed, 09 Jul 2025
 01:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 9 Jul 2025 11:32:40 +0300
X-Gm-Features: Ac12FXyhWxVavHHS1_aYBkGHdup2qwUn7gx7FkWSFs41ui6Np3n3cHuITzjjqpU
Message-ID: <CAHp75VckSCyDiAtP+q8nGGiJBuMFi3Nke7Puh0SE9nBX4vUX+w@mail.gmail.com>
Subject: Re: [PATCH 04/19] gpio: wcove: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Nandor Han <nandor.han@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_013319_616077_A71CA08E 
X-CRM114-Status: UNSURE (   9.76  )
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

On Wed, Jul 9, 2025 at 9:42=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

...

>         if (value)
> -               regmap_set_bits(wg->regmap, reg, 1);
> -       else
> -               regmap_clear_bits(wg->regmap, reg, 1);
> +               return regmap_set_bits(wg->regmap, reg, 1);
> +
> +       return regmap_clear_bits(wg->regmap, reg, 1);

return regmap_assign_bits(...);

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko


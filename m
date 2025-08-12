Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EF4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aELAU0xO9WCQzlDQodYCe/e/6u4XRmODgZyX3/n+xdA=; b=mhJYXrK3OGVBMmXdbvfYauT8XG
	fkZBOq9FWVZdqePI9pMThMGzmMnMgzl7t8Lsm6BmbpjDZnR1v0vn0Tt5mPwPQfXzoDaMUe+8HJ1qg
	pzdd/KH5htNAQFfq1sOis1ipimFWQV/Bt17WTqdQHRr10jSyxDaSMbpR0lMQ6j2W2G4MMnjeO2JwA
	MryLPwMsIqRk0BW8qJUZZy6sRomoMcPv2SkokergVUDFsF6qTWPKV/m6pKe/dbWkn5pnbYSzgGluH
	Xnmut1aWbno67egFiwkvkydYBMvmkG0Nj7oHSL4egZc06p3LIEGU8V8WJYq0G2Z1nCMmHPw1kYhSs
	UoLEv7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIA-0000000AmJd-23aS;
	Tue, 12 Aug 2025 12:39:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkyH-0000000AKSJ-3vhe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:07:07 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-acb5ec407b1so734663066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754989622; x=1755594422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aELAU0xO9WCQzlDQodYCe/e/6u4XRmODgZyX3/n+xdA=;
        b=JSdcRgt2u6l3eCnF3A8JRFkwDoq938AovHbBz8ns9YJM8FFmGfMXSQvgAin3Aer7U/
         OnQ+RgnJbKjZs4f8Z3tplsVqMfuya4yiSbiB4MbHNKdw7S9PCtGZ1iauXww0c+dBSKIU
         h65vWLlj/yd6itD5Yi1Lv9VXmMBlyprdSjmI47NasP2ilhCjPd64yzCdRbN1KkIhiPME
         8YW+J0GHGaYT56JIAqJUOVcCT6f9Gu82l4MCgpiaPt4moM01/4lFLdy+saI/4sKRkI0Q
         O6jKHItmwYPYKh6tZ0GuFbRzsqPERsqNvdG9xFJJqHPzb7KrB026xlt+PreOXgcnrbkb
         +6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989622; x=1755594422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aELAU0xO9WCQzlDQodYCe/e/6u4XRmODgZyX3/n+xdA=;
        b=Plqa7IsXV87F7Gl5XdhiKIhQ2wxCQlpV5P/YVfRVafw5RIJ++b0f6nvgALgKk6h9JH
         JigfYc34es9pwYDBz8EfE+twnmsooMVfxwQZSQskpGop/0b4gHfoSrZ7AXiLR/BA/I7t
         ssD/PUm3e/oimr7Zh/3jVzIq5rAgFweSwpO4g6fEEGXBgeGOm78e68+eixkDb97Fs8R6
         lr2erEVUXazxv+QtQlrLmM3IaEeJGdCUMkkq4pYmG9CdmAYnJA1qNQ4nhkqtjhSbK8Gq
         GB2rRsKA1WR82vOntvE55H5+STV55Qr0YMS9G5EXWs3QXgeVX2+1GuU83gSxvrvG1dCz
         5/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWs0/9M3abDE9oLAWRcuhvibrj3jjUyulRr6tkTtVGotjwY6TOqTVj17dxlowk7bC4Slc80vT4dyYQjUixVRyxM@lists.infradead.org
X-Gm-Message-State: AOJu0YwEwX8XQWEsjwg/El4foxj+/aXkvfV5nsLZgvO0OQ2htlrVvOIb
	Vvowyd2MoEUWVPB+L+eliUJq48QoiRZsNZI0PmTG/b0UpZ3z1Mlabv+nIgoWKMQp1GyUcnHf7Uu
	t2oHIR4eoclE8xlJYToamJWjeKRSbf64=
X-Gm-Gg: ASbGncsCYB7WMzJziFUCOWv9DYzVrKkb2uoTX5Jeh3jkrY5DKnjeWnb92QVCrFFoNA+
	VQ4DcrrWXl2oSxfB91x60wSDem0mnWg3L3qb8sWM0w9HhtgbVoPC0wkR9nZJ9/5sT7660W5Isv9
	lyMugM34N731ERmvkBqKUOMxm7FoyWAnyBDVdIY6IjKSHsFy4K8DthC6UcR0iwn95FJSjWeqiIP
	8I0N+WyZw==
X-Google-Smtp-Source: AGHT+IHwJkNNhHLywqfSPYJXYdJDdl65CBIyoMCDmR0B39XH1dI9WmEu3RjwIKF0CFgvYLwlX3o/8962BYxHWt6bfIM=
X-Received: by 2002:a17:907:787:b0:af9:45ad:2a3e with SMTP id
 a640c23a62f3a-afa1e10105dmr246353266b.44.1754989622099; Tue, 12 Aug 2025
 02:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-adc-v2-0-0260833f13b8@nxp.com> <20250812-adc-v2-1-0260833f13b8@nxp.com>
In-Reply-To: <20250812-adc-v2-1-0260833f13b8@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Aug 2025 11:06:25 +0200
X-Gm-Features: Ac12FXyX_4FNVjRioSrZAzjWhbMWY63pybVPFgJ1OZyn5mocEBo4lC_tirfWAEc
Message-ID: <CAHp75VeYxLBwH10Z38Ez_TOu4B=1hW+TR+=2wFJHur65toCJUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iio: adc: imx93_adc: keep one style of the hex values
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, primoz.fiser@norik.com, linux-iio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_020705_999355_2A27EA66 
X-CRM114-Status: UNSURE (   7.95  )
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

On Tue, Aug 12, 2025 at 10:05=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wr=
ote:
>
> Use capital letters consistently for hex values.

Suggested-by?
Reviewed-by: Andy Shevchenko <andy@kernel.org>


--=20
With Best Regards,
Andy Shevchenko


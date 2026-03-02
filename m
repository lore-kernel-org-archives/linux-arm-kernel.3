Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBF4E9B36B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qAHqn3E4KqdIyv4rJj7K5venbc/uUWQxC4/jFfSWpw=; b=eAq7kdjnk/0v9KrS4LSM1BYeLr
	ZbUklHPqmsZ/V2LDD6/nvV2LAu2GAraxfEKkqOGE5lFcOHXm8iowMJVkxTXjJ83Gt9cCqM89AAhIf
	K6et7M2Ay80hVIlr05+Q9bfT2iRASes0zpoLDAhS42b/uA8wXXXcm87SX9T/FhkxLh7c1Z5/qU+ta
	mBe+E+n0aZpyADMcbIY3xddOFgT8ObBXQ/XEXnKR7KX500jn4BNi1lp4DaU4EwPscZxH0NfdBIVKo
	IgTHe+hh4SjBjl8PCesiShJ0nF4jodPhglWW4jtaAPPWCBxoObZhd3XFLFMaD/aMOwcuKAaJwEAXi
	IeG6BndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1my-0000000Crea-0s0p;
	Mon, 02 Mar 2026 11:50:16 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1mv-0000000CrdW-0XtQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:50:14 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c70ece855e2so1879608a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452212; cv=none;
        d=google.com; s=arc-20240605;
        b=ByE55d82OkxOf7W1FqOL9cVnGqPwjXblrOUVuTD2dG9SP/+fsFFg4xiGFobtnyDObz
         n4VkC7UrpDSuz75oIFuVjcV1Gl0UZL+a2oZ3+71mlatXErLuj91iMwbfUfxpxcaKQs+k
         cMmzAwHqtX7OS822Zx8/GW9T2s1L7dx/83FsMbYRBGVu55mYjrNtYG8lOKCgM0ISN0W/
         WAwS9O9CL1ShJ4CDIHC1MwaKXuo7grkkRvGukAHt3etzRhZyMa67jExcN9SqZr2CWS0S
         aLlYI06xV23KDdjXezSW4iwc8OWpxS9gS1D0PActCD7aVzhPUTUD0oViDXipNEOxcfj5
         mnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qAHqn3E4KqdIyv4rJj7K5venbc/uUWQxC4/jFfSWpw=;
        fh=IVN8x2xhJzh4dB/vGYGuoDhofCDCOgNnO61BuyqiB0Q=;
        b=W3Yhq0O1ndevc8+IgKJ3rIgnKW3il1VTSSnwvlRhyhrIMHr08RJLwUJtKKVrUHmjCl
         BLo2jbosTm1pe1qIqfn4seBwSRyNZBgDflKsCZJGFFLL4uqxveN22mSUwpAPEGBlFcKJ
         KYPLzkN7o6c0Jape9NRDIlpFuwZqjUZ++e4C35icsW2GaKvf+MIRx8ADKa8sKpcR3rSr
         LO+tzfEay7RpZ+yCbiKyRoeKt0CTK04F9/AY3GdAI6YQeO9e6qN7ExTOwIEAPfykSX5t
         Ejlye8fisekv0se06PKiSCvUIxgInw1kWjz8P+8mhfnDTSoBa2a3mpQeoQEeT/YnTsea
         pXtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452212; x=1773057012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qAHqn3E4KqdIyv4rJj7K5venbc/uUWQxC4/jFfSWpw=;
        b=CI0KNr6JDm2d1E3yyI8MOG70GtfcPPGkyKUXlexoP24lfIcBmt9wcVlo6l8l/fteu8
         qQhoT3B/5tbuHUA8d7j5FNOjVVvtUpLC9R4tnLPxmGNinLqDtHD7Z9ftt+/IQQhIy/rn
         lG28f4VjGll5O5FBF2IAwT4vVICiidLfWDU9mFiJ3n8tYRp36DruicErDV4uyjHhRk8/
         hHMCiAxx/lbnsICb1slN46EHifqzXP+f3EMZKtCcGuwSI1zFY3ELmGdQwEhHq1LxeYuD
         NzraULiiUhkPeqFYeWwYhvIPHAPkOcGAR5oI2K+XJpEcgMAwQ615PC4RRO2+X5jvPRmo
         cwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452212; x=1773057012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qAHqn3E4KqdIyv4rJj7K5venbc/uUWQxC4/jFfSWpw=;
        b=CbAtxbIQEUbxciUk6Aa/zXgYkd9a/QoZet4Xq0v2Xqv7fL1pQM67OAgL3DD5pnaq3A
         u3VxIDD3mOjLAiOg735NJp2EEI3f9Om2riGUoQXYlEUkd8QhSBrJh+ntv8mfje/bekry
         CcvlDPuFXPBRNLT2jDvA8gZwN+uj+71HBNgg+n1qIj2yPSpApYACbjAf0yKOU/9KXcnO
         p/ZVpYFWLKhg9D5YDuQncoD8aAa8FtSE83Ecs+1+d/IiwaZiGn5acys9mJGSqvbjPsYN
         uP6x7Rcd3vpYKNTtPhiS5ZdaDLT8bwtK8b9qp+6ZILtkrL2tGw7ZUSRAUVdw6s/o7L8Z
         WRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPpXZsI/6jdq13oJXDRE2FyuTzmBz9MOAr+CkTQjMcCDOW9rm+f/R6/BVP5CObPkiZjhNXHp16F92StXqHqnL5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhxekkqr0NTh3iMMPQG72p/bNHPqiYuv+qtMZFYVyzqYuw47Mg
	qDDBwCk73/cPFFYlrt3RpP0EakRsZ8BFKiuRUKsWeMlB1ueeKgWzs4IHA6ya6+9YLC4k4B8NLvP
	osQRNt1nbLUx0jYetLxIOkerYCPXG9yQ=
X-Gm-Gg: ATEYQzwc2lCR9XH9GyyCUhSVIjYnNs3Q+c68g6b+hHxs78ZjwXeDvPy9RlYZKD6y8En
	uZH0XB1gNUwGYKSPS2OICcvjdAwyO9nCPkzpV8HxOHOdqxcXbfmx+/hQfcSJePjBzJwKyFtuH/X
	7bRk4MiCOV9vNykvtNNJrw7KRQpmXK+iQhhw3/xlcEI6BIO0fMZy2TgAWVmI9AYJiffczJSS17O
	1fEjgrgZqs/6qOPbVgO6OHp+kDox8HqFwPZ0i1LosObcOaMdBIoRpnt92k0UEISHLpQL2el+W0V
	zbLHFtjkZJpEwS/9rFoRj8/X95VQEzATI5g9nUhR
X-Received: by 2002:a17:902:a508:b0:2ad:da28:8c7a with SMTP id
 d9443c01a7336-2ae2b6500c4mr72503075ad.8.1772452212244; Mon, 02 Mar 2026
 03:50:12 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-3-nick@khadas.com>
In-Reply-To: <20260228065840.702651-3-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:50:01 +0100
X-Gm-Features: AaiRm533eCqYaaq7O8tndrUfX53W9xWv3UJ4VGBrO0ObYcu87bP8ebrDMdBbpZs
Message-ID: <CAFBinCATMbC_Q85QHv_=v1cdiNjD-+X1eR=eZB_0Yvj7DC4LoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] iio: adc: meson-saradc: add support for Meson S4
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	krzk+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035013_163476_419545A3 
X-CRM114-Status: GOOD (  10.54  )
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

On Sat, Feb 28, 2026 at 7:59=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
>
> Add support for the SARADC found on the Amlogic Meson S4 SoC.
> According to the documentation and current testing, it is fully
> compatible with the G12A parameter set, so we reuse
> `meson_sar_adc_g12a_data` for this new compatible string.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01DFCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvc8o7UNrMIYNJEN9nvLvWQOOGJV+mKtBRbCIep0MbE=; b=Gav6a6g3igKiUes7zNcuDl7nJt
	oMqDdsiLgQPdgv6uGx+3luiJDaRgZjRIC1H2fJsWtCX1krnN8sIryCW/CcsKYt0FXTmPgf2smd4E+
	nVgJ8biAmYae9MbgUxSch0tHmgS5GfEwBd2P23RERgpA2ev3PB7xdBDFDNKS0pWKXFp04x4w3ZSba
	XEwkHHJb8pQ7WldSxKpPtKSMxIomHHLyzWR4mb9VPiSKaah5OJz9S8tfvfKW1H9ZKTswd0tuJRU4O
	i03ULRfsNaflTX3T6fw4EY0/jkde5zxwqw/OSF+lD4Wkhp01/3KWYIbEDd508GJltIDwd6Yu2ULMy
	pHZ2Xjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usKjV-00000007rjm-1BQ7;
	Sat, 30 Aug 2025 12:31:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usKgl-00000007rca-1pBP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 12:28:12 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso400305866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756556890; x=1757161690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvc8o7UNrMIYNJEN9nvLvWQOOGJV+mKtBRbCIep0MbE=;
        b=lrIPHxFDp2FAihpkxf2S67GNKjaCKHdJ3v84JNXTqpRz/jHpWzQ6/L4VOybr92aXnB
         ZXJACHBn0iLkZpRMCfNUREOLjGK6bi1Ilz0XNfISeVdtwIeExBQN4lXHFTDRb+YzuKHB
         JPU/3z/yJNy+hLI90cM7NeNQx5aWDEOxJWEbNdFnS01114p8XqGIH5+hUym4HefFr4UY
         7GRQ4Eq0uW+t4YcrlA3EmveAg6bRV+94l1yv8JVVS86BFu3zzoPb625HaKl5/yEunisE
         FDXM9S0qrmnsl9GBJSkjiFfzm4BmLUs+GGFBD73Coao5GG7B6AA89uCY6j/8AoATJ4b9
         DL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756556890; x=1757161690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvc8o7UNrMIYNJEN9nvLvWQOOGJV+mKtBRbCIep0MbE=;
        b=rCIy/d7MohPHSMqW1BvT+QB5KLGLj12AmjqClOwGWK+jhV2zAAoW6J2Onc1EJz9ixT
         MXpO9PA290Yf5DMvvHcsS/sQOA1zUfbpwxgMR+Q5XaIzp9g0/eg/Fz9FEwZpmDQz4bfa
         xgmHbsxUeaicHxyxmeS+Zp2jtHHuaLTnP8MUmXHihYJKMvQZFrQSwgaHsfJXwFhUl8fs
         mHTyw6tlGCP8oy3dAcJtqy7WOPg0k61sje/Jauaw46hYZvipwNIrqra1KMxSZyqHj21C
         5vtkBIP7upjXeGjq52AKMjtYftWrq4aQtIzPQcbJ/SWDAwalK3bJijNBE1UjedhCBPLD
         AlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd2uJlu6BXxBFeSb8StcpFbPsm/j6WuYx9JJ+pmLZiUFaG2gD+k+G5LC8bkvU0L7ySRoSxLvu1o9eIKHSSb1cH@lists.infradead.org
X-Gm-Message-State: AOJu0YyYIs45d1pKcQ4hrWCmM5rjS1MOuDrU+9zj1F9BkOsnbLw9URA9
	VLqzq7TXPCXg1ImFezXyImBhPp7KCu9DrOK+h0JXS0JbDwALz/OVjShhwoisdXhlTIxliYy8XPi
	hFsTlNFOkpux50GW4NlVAQ38LPcTug6NhTE9tnfs=
X-Gm-Gg: ASbGncs4gRzfGOVR7+cykBb/eNBUVn53PTOAYcn8OCQnXn+8U4HRBetL7+LUkqxg0Qw
	1RXKwN3oH8bxrLi/vfcIOK6cYMGErWi8cObT4Q6Fv+ZeFcgoLN2SuVt4Or1ciM2/MgQvfhvwD49
	XjmH9a+cMEl74kskAq7TSg6gZlzhSBgbEyY+gXZC6ImACQMLMYiZgD1vFS//eMxuejBlgknp7hE
	haCxAA=
X-Google-Smtp-Source: AGHT+IEr0gAqLRVPp+T6uONOIrQAUIkZ8IPlCVuv/BuIBm4huTRigMtOCfRrrfAh3rWu2s7VHQSCiaBIs2UpJH3Iosw=
X-Received: by 2002:a17:906:c149:b0:afe:af91:2e44 with SMTP id
 a640c23a62f3a-b01d8a6ac14mr178645166b.14.1756556889693; Sat, 30 Aug 2025
 05:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 15:27:33 +0300
X-Gm-Features: Ac12FXzTMEaLZRx4DmdS9a1kWVVbTCHUuOOLisze_-ZWmUB9tOIR-XUWXvJJxDc
Message-ID: <CAHp75VfTk7Vr6Rccq0DFDm8Qnhb37iPYj4DwH1U2bwDMV4h_Qw@mail.gmail.com>
Subject: Re: [PATCH 0/5] iio: adc: samsung: Simplify, cleanup and drop S3C2410
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_052811_479941_BAFEEEB6 
X-CRM114-Status: UNSURE (   8.31  )
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

On Sat, Aug 30, 2025 at 2:09=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> S3C2410 is gone from kernel, so we can drop its support and remaining
> related pieces.

>       iio: adc: exynos_adc: Drop S3C2410 support
>       iio: adc: exynos_adc: Drop touchscreen support
>       iio: adc: exynos_adc: Drop platform data support

Reviewed-by: Andy Shevchenko <andy@kernel.org>
for patches 1-3.

--=20
With Best Regards,
Andy Shevchenko


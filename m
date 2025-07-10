Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEC5C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYNoVdAKRWVmE1F4lpwjJnXn6AMF9TT383wPE3kxNxc=; b=Ad/++QjptD2FjvSoMZGtgNzPXC
	erHsFmVAYiry+0cxRLFcnp3GJELKrEQXR/sMBy8eBbZNnDIJcGoNEvvMRPyeczhsEywFL18qZ872V
	qU+/ynDHDy/lZmZfqX51QOebmZlLrG6fCGtlk/DvygUgGp4/Kc0tX5JrKzOXVLijMR3ep/YgeWKoG
	w9vNjqyCBZOJJUolm/yxq08yonO6zF98w7YsAQBqyBHfUwrvZ4HQm9B6dkYzFe98Oqk2H0RVrcQRc
	s6PLPAw+uWaKt+T4R3ojJmOjEBa3ZNM2iSOnfEIpot+43DdNdvJVUBBcP2mLjdLbOQG9NFN14hb6P
	IbOx85XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnCw-0000000BHQD-18h0;
	Thu, 10 Jul 2025 09:04:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlu3-0000000B2rX-1Akd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:41:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so4511525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752133269; x=1752738069; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYNoVdAKRWVmE1F4lpwjJnXn6AMF9TT383wPE3kxNxc=;
        b=WT0Au8JIEq8dt9KiABMAj8++Z3uPjNhenfyTk/+DlzVssSWeO/ti5TGVbdxmvfu6uc
         CVchyAHYS/Xr2wO8URIYZ11pfWwsFFwHQUYO0BVWnbReLjGl0MB7UQgkrAYC4LTuZhkk
         Luegdtq4C8y3hO7Qeo1tFmiYfh7t7+/TnvbDCGSo+RRKvAUl3gmZC+4z9UWl0xY4eWw7
         cmfusTfoWjrfS1wiMxyBiE41oGylzhKhUdF/3hwnw4mP7tr35z/VeFLnFHlpFg/vKIMD
         /5QPiW1bS6+twYY3ciD6riRJAuo7s9oxcRhRTd05jfNl6rki6RKrSID4obiyOteeTMKL
         F0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752133269; x=1752738069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYNoVdAKRWVmE1F4lpwjJnXn6AMF9TT383wPE3kxNxc=;
        b=WQTZKqrB+1mOI7+0EJMj1FpuIqSP/XIHHdvX50nqKrrk1J7NKCZuVsPGkQbZpIWnZK
         NoQ6tL20iBDbmvLkoxtyT/mRFnEZnPnzSgykswRwIeRmw1qYeI6XJzxNGZB6/bjaUntG
         J6yfrTWFMDIoUat18d3za3CliPilwO+3w3t8Nq/mZ3kmWYekL57QFNitPU6F2jjLiggm
         rZOYwgAP51tadRx2VyXRmxKZ4OX65rQCu9d96A3DdKJ8Rpr3sVzRqX1ZesEoaXwWpIcd
         i6nOzUsfyfxgeC8uldpXu4BN1CLrFmk3n8q4+2Ys2BQ9Ch5yrc/Khv0cbBcg87JFNuL1
         dR5g==
X-Forwarded-Encrypted: i=1; AJvYcCWcD2L+FGhP6PpcBBJ9Et480MMVUFkNwXtg4Mb251YRf3vGxVUqBV0pS5Kctw2ntcmrUaVkOorXUB7fAmwbjbD3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd+hAq69t+OajOUX3Srw8XDBMPaYDMpkJFC/oOEllpHVu+dHlx
	4VPGw2pLRgBW1v1TlHjHXGEeRIL6ZsndYzJdKN+nIEZ4QmfIiqP7KVOZkPVr/LXFTOo=
X-Gm-Gg: ASbGncvlj65PRRBbo3vmi3CWnUxKYRYDK6hi+wHu0/A3bEC6egqiWtWHcWUNcdJ09os
	pwlZpr0BVy39jnsXUs0maVpviFMIfyCFF2U6R4+mczEYfeQeYJNrGAIMtbHEx9gu31FRfUxrR8d
	l3snVKRQBEKQzTOtPoslZjifWZvTjX3DQKAKJ6avoJanwNnmpW+UpxUyYIM2UiMr49fBYZ1mD1y
	VejM53XQRwzRhal58t+y5E4+5LAgDb+2rWD85lFV60kPW3h6zasVZZcEvw7FwYdu/2GQM2gDO/i
	BdM4RWDDmTrKJVBa2P6YH4zbNF+/7rl3M3/VVG52NVcLCg1rGtTgH0yhRCXLsFRSOshThUDUm8t
	C
X-Google-Smtp-Source: AGHT+IHAKWHAz0ARt1BvQlaWFcq4y9BAt+xbNRCyzxhCMv47nKYFLDZpuaCU2IxFuVRakMsMLi6B1w==
X-Received: by 2002:a05:600c:1546:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-454d53a0186mr65715925e9.17.1752133269645;
        Thu, 10 Jul 2025 00:41:09 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd474a9csm11086495e9.16.2025.07.10.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:41:08 -0700 (PDT)
Message-ID: <fe445967514bbbb5bbbcc806f98dd6bbac9e032a.camel@linaro.org>
Subject: Re: [PATCH 2/2] arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to
 Exynos entry
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 10 Jul 2025 08:41:07 +0100
In-Reply-To: <20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
	 <20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_004111_315830_F5568C80 
X-CRM114-Status: UNSURE (   8.82  )
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

On Thu, 2025-07-10 at 09:34 +0200, Krzysztof Kozlowski wrote:
> Effectively all Tesla FSD DTS patches go via Samsung Exynos SoC
> maintainer, so add the pattern to make it obvious and reduce the chances
> patches won't reach these maintainers.
>=20
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0MAINTAINERS | 1 +
> =C2=A01 file changed, 1 insertion(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


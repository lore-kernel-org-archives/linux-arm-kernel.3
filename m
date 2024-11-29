Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286ACD6EBF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNgvtRisS5u9cN6139hn+NK3qqVv5Yd3nHI/xvwV1jw=; b=s7EkuAjy0R2IY035a+qpB6gHYs
	AGMlzdOIvxOTvRnANBUAK8tYuLK9NaxcVVPIfzG7OkKJ2tDz41QhinBoSoMkdZs/RfuW3I+Ztdvt4
	935DjKD9hImMaY7wI/CHB7F11kdoV10tQYRDwFxRGF/47c6D8W/Vr3yEmP0XC1C9nEwRoyOrrJSfG
	T2Qdf81KQeMJOR5pbjfCqdSukLb+fNYoN4YMg7S6IWuohzkX7WMyzQU8lBZafWG4B33FOv8VFDUHM
	Cm5XDZHeM06gEtq4yn+15Ncl1yw03149QFfvHzqGbL4V1Exgj5gEZ08w/06+2WaLM53UA72dTXHnp
	14FK1Zvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxP5-0000000HLdi-0FJh;
	Fri, 29 Nov 2024 09:35:11 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxO5-0000000HLVb-3FJ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:34:11 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5f1dc7c6c67so545955eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732872848; x=1733477648; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNgvtRisS5u9cN6139hn+NK3qqVv5Yd3nHI/xvwV1jw=;
        b=EEsupXpTYTVQTKudkoSKB2NdCtGlizSqPZY5Q/ANjA8fQQ+/24KrW7oGISVJhNtEOx
         vBLs/7u+0FWSDPnKcpFHh+6pwptNgip/6gIHJQZCB+CekelDBCF0wRqzqyKcbh9GNXwT
         0t4W9HfFLJmtVG04u8N+EBwqNcGmMxIku7mSV5eVS0udAm3d71j2vWsZHrcUcq1Z1b/J
         U3VAvB0j2EXk93UlSyK5b3Uird9RwdJ9MVualrkkjR/+3zJwqUZ+9dj4cIUu6zclT/rk
         3m2uwqXMavZCx5e6igI+QdaiYpEpt9FHHmOuIPjW0gGG780WN14MfvbOX47PJ8SmLTmq
         enYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872848; x=1733477648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNgvtRisS5u9cN6139hn+NK3qqVv5Yd3nHI/xvwV1jw=;
        b=PQEMtxT3bsQwGBpX0FPc3R+l6rrr6vxjUxwTENMLj46EPTL+uPnbC1kCBROvutjJvI
         rZHmdNTwU7M35xX+q8gsWwLQ4wvzOhGq21tlbFJPFf8JNrBxJ89F4XJZAAEbBnAu5QWK
         8ebcjsv/IXo/q9F7Exm5VzMx/IZ28e4ckB7aEtkp+2qEIJlnS+do0Q0n0N22mEXoowXd
         BlqRBU9drPAk7saZPmljogat5/JxUSacCD2C02xpnmSEOMLYr+cVBMHVuzj7bshZsZZA
         HQCywSISR2RN+UkB8pRS4Es/+fpNmKqYjnADEtlNGjJCI+e00+QjhLfq6xuYnSN5hhae
         oI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLwFlXvbATTRwWFMSVzCViBp0qnhhpCq79qdOxXQ7aHU0YVhrr+VnC+cygxdndIEPbjuk7kljHEU2BWNWNNeYH@lists.infradead.org
X-Gm-Message-State: AOJu0YyoplGRlnJrp/rhvNIgkS3Mjuw4fNRkrn+qlcmZZPTXhe13poxp
	1xrQk78qpVMIbhwbRwfO0wBRaHPSQIruOirdCE2LUQFkUmPJduroaqvTS3COz50DLoaB4hyaskZ
	aqE8knVpCPXdhA3F/jjCql00CqilaOt8SmyMRzg==
X-Gm-Gg: ASbGnctKoF2vug3h2ek5DAVsFeiw+lDM8yGfoc47ErIyRtl3+dCxQCiG6LrlsvHcM9j
	p8eCWrnC6K/vdXe15xWtX2F/28kGDiKJt
X-Google-Smtp-Source: AGHT+IHSSMxnaGOmFOSkOhhOzzx4jvQ52FptkRVrDxK4pnBkB3GqM5Uuf4cKswcMzu4vXxrMnL3Y6LE0/UTLwqBgt4s=
X-Received: by 2002:a05:6871:321c:b0:29d:c624:7cd3 with SMTP id
 586e51a60fabf-29dc6247fbdmr5795597fac.4.1732872848629; Fri, 29 Nov 2024
 01:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:33:57 +0000
Message-ID: <CADrjBPpLDLoPkvAno5dqsUtZGAcxuTMf3X913syKmY68ndwggw@mail.gmail.com>
Subject: Re: [PATCH 6/9] phy: exynos5-usbdrd: gs101: ensure power is gated to
 SS phy in phy_exit()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_013409_824038_065DF0CF 
X-CRM114-Status: UNSURE (   8.90  )
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

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> We currently don't gate the power to the SS phy in phy_exit().
>
> Shuffle the code slightly to ensure the power is gated to the SS phy as
> well.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter


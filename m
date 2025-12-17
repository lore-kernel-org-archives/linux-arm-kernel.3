Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50C3D65C73
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4Hj6kUIjPKS1U4b5WrIC6hTm+90YDETyj8ZGZZXRGE=; b=JWzw9ZbsvZ/DTZOCijrdWl+i8E
	U8m0CF87jOs2U7LGfPUK9/boIR0SWe+gKw8esGI401Gt4xOPmdQVMF+DD8JHtjJukvE4xww7xigXm
	acwghAeart91dW4K0GpHrF63Yb2nD1aviBYjGvkiI/njrzfOypT2y3m0qAX5ab0wgw483Eo/E6JH4
	eJ5iH55nM7Z/3gI0+PnHCjJctufzI25yC79afSj06ten73qzj438rtWilBtUONPsmp/w0P9F8jzHu
	GZR/vdchq3uZzGu3934boRPSETc0hxoyRjcg66ujjHntiWFHwcPXuWyeurrUgED+aa5AKCuJQUTMk
	flrT/89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtaz-000000070uX-0lV6;
	Wed, 17 Dec 2025 15:37:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtaw-000000070to-43X2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2524440FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 15:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE80C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765985861;
	bh=3zWGgAak/FBm7Vkk94ZrLytELeHbedaeePRas4C5o5A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hMNPbQfHkiOGVqJHw5AtuOCvRV0FWKVO23ESw20F2cpxcqWTBIOhlBqGNkwequi0i
	 3oeUmzcEgHgSCtPoeLi5W9KvVXmE1VGX7UUnHrN1mtR68GvWl08uXF7HTsH54i7ZE9
	 KfYRP9/8MnbbeqwSYkqRzywXs1Oee8xupqaf+a3s5LDAgTLnveEoDXptQ80gqAbzq5
	 bjMNZezJ7p4GnTY2AwYJ0eq5AHSinGdYScOtbFN/Adxv8qepgBFrnvzwv9d+LJGjra
	 iG70B1IeKSjTYdQQgNkT1NrvCLmUQmuqa9VxS8bv5ivZq+pOTD21TTRtZYR98YCKkC
	 GNKlOB4AN3+tA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79ea617f55so599483066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 07:37:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWk1jjV5gk95xgGaOdbjHrwzAxl4GjEBqQmq1OzHzbRfZT85rb1oX0EAjQSG8O9FUQOfvHwGLQklZy6IWcgkGuH@lists.infradead.org
X-Gm-Message-State: AOJu0YzxxZCwz42dqyy8LsTbmqT2TwbUySUfrbKv8otW1nom16jfjRt7
	GTubvCIIW/p2OjStRzu4MKgVfoPb1baLyMx3HH3DYYWW8l/ApjJgBOTQo/D+g9FGTlDNf139GfA
	SJ6xvUMddQ8gTOR+MUlQx+4p1nCEI8g==
X-Google-Smtp-Source: AGHT+IE+MbpVy0D9cI7vtayEcuAQ5BpKDVDav3dQlj552I/4svzEpwf9VDtWU/NeRoVokGuFNkCPT8ATPD0NU91eNy8=
X-Received: by 2002:a17:907:3cca:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b7d23af00e6mr1859042566b.50.1765985860268; Wed, 17 Dec 2025
 07:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Dec 2025 09:37:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
X-Gm-Features: AQt7F2q-nb9Xy6ZmXCdkQqrO-_0mpnqJ_RWJ9ZzKv3sOBl98lQ-TH7L8rvtaBLo
Message-ID: <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho
 to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_073743_066853_D13B95EF 
X-CRM114-Status: GOOD (  14.63  )
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

On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> From: "Rob Herring (Arm)" <robh@kernel.org>
>
> Convert the ASpeed fan controller binding to DT schema format.
>
> The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> rather 1.

Okay, I can't figure out why I thought '#cooling-cells' needed to be 1
here. I don't see that anywhere in the tree. The driver for sure only
supports 2, so anything that's not is an error in any case.

> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++=
++++++
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
>  2 files changed, 106 insertions(+), 73 deletions(-)


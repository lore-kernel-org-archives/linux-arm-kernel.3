Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE24C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=; b=rRgu1I2vHUVezeGCtifOXEuiMz
	LBHiG2O7qy1218OnIb9AE5HvpBKlxmmutB5megN1rObs+pTA9lohg4J4TvZKyzdH3/hI4n6Tw/j9G
	8AnPKSdrYHzJDkWL+yKj469gCADY7h/S8wSqnsxA+n21XhX7nMqKlVDoomfuk7FyoHnVTZRX1QHSG
	/4e4X4L0Nvfk2+Ec2/wyNDPJuIoY+EkQpcr4hIbDQwiS5B4lYCLxbZo7kWVyy8irkUhFuEw/vqgwF
	6Zlp0jjdy/St+pJlo+Y1Uao6flfDAd0tyzFsf3tQSwoezdf42A9UpeS97t3qa3hX7Y+IaO7u1wtta
	iLKlvPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJDX-00000002YKp-2xcx;
	Mon, 27 Jul 2026 11:09:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJDV-00000002YJu-0cFb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:09:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso12766435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150591; x=1785755391; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
        b=bhKWeIozDt7z8ugtLfJH5ijsk/3zQGZvlssmBq8IAM9pvH2xEia7orlVE2gEAEF69E
         HD7eQSTPVXawzLWjVAehkoU65YLihGLNEmR1EkMEtHhfG6UmWbJapRNjN0MLe5NFI79g
         C/dAwE81671LiDT6oloJdzS3mYI9WqmXvOvhf/4RpYr9ednKXiOrVZL/QDozmKSS/Cgr
         cAfNynCB9Z42qEM1fQNi1fxJS68QsU03cXR2dG7i5/CVOL1VFKUDXCa2QHNvD9YrrCRz
         vlqeudI9F/N0sAtC2xuAz9QiLQpb7nvzp1N96r9pXyytzg3mcAhVDa0TlZwjoH9VCb1a
         k3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150591; x=1785755391;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
        b=lp3p7Qh2D2hOns6vKMBxZv1flBj71+t3X/0ZV4vvtBXIqw6CAcgiEshUWzBU+ZdIBs
         3uBKx+6cYw1D6KkLYjAqXZRCpfciZqfkRC3Bzi2sxrQrDBm90eL+ppAHt7lC72z2ofMg
         kQecnxCK1dFgMDTT4Bit5NCKuLAt05F7vTnF/oo7VzH88figf4lqoCiK//XIdU7rIHoG
         7ZKVYAK1QLwSaBcocNwqrZU8/75ozTcOjhGCmzVR9oORKpxMFZp2nW0xOBlGzWYePoU+
         //7f8dlmQSBXaCPUlh9nhzouUp8XawYqWfzuIOGGDZNuwDI+461KI2Ixv4C0xMRCpgmn
         1Hfw==
X-Gm-Message-State: AOJu0YzPKMDFhPow/AUOtxMXAwCTRt7EEscJjw8NxZAJqvykuN63kcwl
	Slb2BhjQGTYff7lYYqVckY2IbMEcggiW0I9aMfWg6qYVt9SbyLF87Oe8OBPAhkKlv3Y=
X-Gm-Gg: AR+sD13DxeFVI3vJpYbfKclwXwTbAsVtwOoxEl+TwGRLRlgUWHGKnVvS7/n6bDSOrTe
	Oz1a/IIesxwZfODYG77CbxSfH13iMp2CnaKT8BpLoD+HdmgYe3FQYtDkZB8vP32tGDQSXF63nxV
	FbId9xZ0f24CJNaXrTvdUG/akOualRzyALUt5jvW3wU8ENHbyj39FURFnaQbrOVXHaIsxOuSusb
	eZhep+oxAOFPbLwTb6M7Jg6xvNT5H7AtIIBAFAgmkUB7xlvaSJpXIpHNQsg3s0Vc4+R5eWb6pnb
	5z04U0HCLo0cuzvr6tr/6C+0+cxGyn3C+gCH1Jk6kBcnttp+51xNrUXyY+ydVUYRvf6m+h4tvL3
	9WwtbJrzv6SL9hYRRtTPXA3ct2xLvTFpPtxh73FYUXXsOVkoZeLR5zAqrz94Kq0TKXeeZUvf38i
	+oCmkOhw==
X-Received: by 2002:a05:600c:a4a:b0:495:69bd:17f7 with SMTP id 5b1f17b1804b1-496b571c52fmr99418175e9.32.1785150591301;
        Mon, 27 Jul 2026 04:09:51 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm243575875e9.0.2026.07.27.04.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:09:50 -0700 (PDT)
Message-ID: <0bb8cc072598421ab67c463322da429152d4f652.camel@linaro.org>
Subject: Re: [PATCH 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:10:09 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_040953_189931_51AD53BA 
X-CRM114-Status: UNSURE (   8.97  )
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

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>=20
> =C2=A0 [required-blank-lines] child node must be preceded by a blank line
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>,


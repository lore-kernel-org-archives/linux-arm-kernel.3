Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE42CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=; b=bl2+pZBH/N36UX6WJ9QCf/US4j
	reetOpIWCQAIJGljQQxhGEWmcU+OWcnFbCtjktJJjRhukmsARjvuEUyflFw+urexxatJizjcb2Ydc
	IIzHCftpt+SxY2Yng/iGVM2oWZC6X82xGJJtrQ0ySA1UKM8MG+n5+OZo7wIwCMIyz+xDIZ7kCIlJR
	6c7kB4yE+XFGiiA56x13K9VJL6VC76kJe2SQmE/QPNeWs0lq0i2IADo5B40xosbcMIaftrOyfquK7
	wOCeRdAPCZnsdC+pQZn+Hgvyjv+mWuqoxOfiTXEGtLxWrl7HD7DYC1oJQPEODeVSWKquASIF/LXPM
	XJFXQhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqkm-0000000HE1d-26fE;
	Mon, 05 Oct 2026 22:01:48 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDqkk-0000000HE0Y-1q2L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:01:47 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c2e31c05606so67987566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791237704; cv=none;
        d=google.com; s=arc-20260327;
        b=iLqfTn73L+Kjz048bd2LqS/gkOJLzymTtEWoee4UPIG7cCf8ajdLt+MQW564WwnKf+
         GsYXR6lX3A2ZiVi0McO18bapiexG6qWgvru5EFSFfUAHOvbOZG19moSHUgHg9ZeecgIq
         j3POREuE/IF1MsDrv3yKSxECk6PuLZHvzxSb+Iq767ddnHWsSIeMtNumUS8ROWZTSYTz
         YnB7nFkI9vYWljtQuwD7QJzcWRCxwoYXluPOQpaGPFyAg/W+lAX0IIEXNQb5BjjwmBRf
         b9yrCK7SjNTJSkGND00jRxP6MHsoU5WNlwSn+RumlqRSaQ/06x98m+Tehoh1pThCgpRO
         2Sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        fh=oUtB7jJCvitP+UdAwhax/UKQ7XvbFL8qMkQ1fNOT/Qs=;
        b=WFqmibKRAZnfeqEgYXwEu5vouJr6FrMFZ2nVkdiuwUrOCNNIEK1+nDPVvSuYBOvLNf
         877FPzozvukdjwbIyJrbKDLWZtEA2QO9xtWhbZvhixfXIaakdcLa4mozEl0ZbXEVjMtA
         qCfeyBV3J7X9OUHIGepKA2G9omjzByIpi96eGU1ZWU1iUHQz8Rnop0KIQlZJUiiqkU0g
         nkmdFk/6QrRSUlv81sjDfmFkBRFimBTpxFi+fXqwxF/EQYFD1LFcyIHbO/uTG+LlYqiL
         eah//wUgM4PKGpdVA7i2wywTkPnI4LP8arYgcDYXiOGqVSdGn7ykYu1wxkJEbYMABODE
         iMMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791237704; x=1791842504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=PB3Nty8kztJr5gGuh74+34XwhLggVXKqURIb/jRVopZ0FKopPvzYQkoJxUVaaAo4ob
         bWxFJH1VqX9/esjr/IfjITMjBJj1ntSDJv2zRJ6BQZgAixcpgRu5RiwIw5mHzH2pOrfZ
         GI4HRaO+amTIRKdZQM6d66uEXRAurJXdy0aePYFwCnTFWVpH0x5Lto1AkFI/FSQEL7p0
         P9TGagJqa584cY3dLSntBu6YZH/yzxo2D7lSSHDZU3ciWZMxMeJq/W4OcUBviF1HXC5U
         u56hNQkDxE7UPCHaxiPd2YVmSc3cpdAMyan1m93WaFKIknvcI/7t9SvQYpkX1H4gfEDJ
         OtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791237704; x=1791842504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU6N+LDOUo5/wsUPaDzc+C7fTsEvvOq2zd9vTznRek8=;
        b=xU0aV9/95mreLEqHh24pKlX/uXwDhASu46A14ASYC1AdIk7dee6daH2sGxTWJcuR9J
         Slu3orKjWOv/eFhQrp5yvIFPgU62fNrUC8kR9cFsa7rmv4xk23TzFGPu8aI1qa5lPHoY
         ZIXwJ1/6shOPZl2TypwvirDZQJYDYqHGLCarGjuSqBrkyCl9Skko/vVH4riXTi5lNrI9
         7olQrOiT01Vb6rWQwUQjlkP2use83cbz5/BdHky9I7ctcqVPXSVxQpuD3Q+p7x/9QEJv
         pzixMihJlDw3jHwj/O00CdHKHHrKqyHsF5BC7V7DBJGcIj/wAAU8iE4CNIWg+cXMRm9W
         /+ag==
X-Forwarded-Encrypted: i=1; AKwUvBxw8qElq5vQYdfrqTJUd0+OX2EbLaeLvLg/DgpyyL+8rIHTgWSMtCfMm4F434HM0A/AvizDg4XK/WZlgXjDVerx@lists.infradead.org
X-Gm-Message-State: AFuF++mCuNsvlYXXRr5Kotnx3qFj4sa9lWDRanRVy068+vrijUHEcX08
	by+VujmyI25va5nJWT6NwICKjw+IEKWRSjpiCdwIX/YCP7g1NE/kd4S3flvt+S9YPCXPKmBzdG9
	1/TGWU8L6jUhvHQrKMLNDcB8Uiz7hgjQ=
X-Gm-Gg: AYBFou0jwJxe1hGgCcPzC3TNolqBVjHp7fi4O7Dp6IUE3N2wyeegr23iw+wNna2EQLM
	hpwPDfXIoujoorS6CoerAaKCq13k35dDjSZqk/tDU/RT4Oc1zCTIWgisaInWxFt4dXLQy0HPxpT
	jQlLDtsnNbIbLEF+WpE9a0MwnlrMvLzp80xioc193C5ak4DegNMGb4nJ1+tC9L/8CAIWYGk5w2w
	FE3TRoLuVRyuW2KgOF7Komq/1hi9VUbq4UzeC/2UiHSdUw/DOzwmIj8Y+8FPljDvxythVDQ0XLW
	gg4nlgEkfXt6cs6Ivm+rqFf15A7WB1er+8GHxPXSKjRDkqsO7lEwUcdnUg==
X-Received: by 2002:a17:907:2d92:b0:c29:f5d5:5a92 with SMTP id
 a640c23a62f3a-c2e4b007c22mr1011878966b.28.1791237703713; Mon, 05 Oct 2026
 15:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-4-coiaprant@gmail.com>
 <20261005135939.01ccde50@kernel.org> <CALj3r0h7j-4ZAiX67LmbgpmYCvK-Xmzd_qnYYgoBmniAW+eiWw@mail.gmail.com>
 <asQZ99CMsQF10-RZ@parshuram>
In-Reply-To: <asQZ99CMsQF10-RZ@parshuram>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 06:01:31 +0800
X-Gm-Features: AclHuK-R2LsVgHnJjNmWI_vZ1n3RwcrYHA0O30u1dyI8VYXPn7GxP9tLow2x2eg
Message-ID: <CALj3r0i+sBhefWPqzt76OX+DxEZqzxg1JOz3d3te0sHzHQTV0A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_150146_859545_CE7D124A 
X-CRM114-Status: UNSURE (   9.77  )
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

Vinod Koul <vkoul@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=8C 05:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Typical order is that binding and driver goes thru subsystem (in this
> case phy tree) and dts thru the soc tree.
>
> I can review and pick these if you would like
>
> --
> ~Vinod

Hi Vinod,

Thanks, I'll resend the PHY binding and driver (02+03) as a separate
series to linux-phy right away.

Thanks,
Coia


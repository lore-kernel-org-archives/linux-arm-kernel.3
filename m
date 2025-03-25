Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13178C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJcwO6oJh/3y1WM8EogHyJVWkUsi3cC2Ve5E14+wX6I=; b=zUVXbgCJeaud5QH9bOH47V5X0r
	IorO7k5eFLwPmEqXJvogk37qlXUX7kHNwH2gLg+uk7rNcjUnKJs1Uz3/u5hza1/UZXXUqXr+49XSp
	uaHZT+F20fPx2les3diwA8CY18CGxHG8FnC7NEt4UpyEUsvF0lPPg6q648QTSEZXT59rJxENrC6zw
	XuXedyzqZIe+UQDXPJIEsJlm+92BdULpqungPLPdsH30Yjl8NojAYvMDEaypOcbASdlKIrQ3+jdQo
	aL2Vux6eAe6gVgk0q/aDkYA87LTtTI3mrCBhir6aUC0l0jCYh3EI+8kHgzf9+t3IFer1JVj9iizv6
	JsO0KgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4jK-0000000672M-2o5R;
	Tue, 25 Mar 2025 13:54:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Tz-000000063We-0Qzx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bJcwO6oJh/3y1WM8EogHyJVWkUsi3cC2Ve5E14+wX6I=; b=fyQDiUcM2sLTA0BiCpZnPCk3rk
	ELJBc8KH19+VWGvRW/lIq6Q9RpBVTaYgySUGycV3ARSwOdHxrGVrv+EZpox1u6aOphd9vWv7WAbFJ
	06s8/x3K0mCEL3iLueYXBktqU8DoM50o/1u7fj4xCN/sMXajZhx0yS8j5zEIZeNfNxtmZ+3C1S2kk
	u1b3jTk8NhhbmZkOl5hYJq+kyKyJmJnJf43AN3ME9LgSbZRvavLtZkxaAGQ16JeFgEf/9tFO4JszG
	fcKSRABfmnoe4CqzJJNx6kT0o0+87hXpBlyM5pYc1KvIqRE6EIjhOXH+N2DeWD7OutsoOGiV/zL2g
	b0JH1TPg==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4Tw-00000005TEs-1HLx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:38:18 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso61178971fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742909893; x=1743514693; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJcwO6oJh/3y1WM8EogHyJVWkUsi3cC2Ve5E14+wX6I=;
        b=Zg7o/tyBxEHEuJ+Z1w4xZR/MBjsLxWVueBR+2miQE0lx0w6lA5qWgqF2h3zcuz8TRa
         6Xb2VSM8CxSBmjwxh80P1nOtu/aNJM5RdI4IstFETVOl5fyYY17V9MdW6p73iSE14DSd
         C6GFudXHNg2XmVt/ECcxZztym3SEv/3gJtj0nhkGxfDMtuwjfG9CJ/WFW6HTGq7Mkpqh
         dK1Uq7at+BE4JDZkF5r6pglcBS95nr7lOPsBd3IHQOqWtocRI18BOH0CcabloEYxowR3
         +e+WqduC4Vzm9+B7Lf9vq7EDkjT/b7UFhtymDgLMgot/l5gwBOTWMgTEgIPJ0HuZRPxR
         K88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742909893; x=1743514693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJcwO6oJh/3y1WM8EogHyJVWkUsi3cC2Ve5E14+wX6I=;
        b=eyVUTkCYLcWumzGM5Zvx+Qx39lvRFdFw6JTS2/66gB01jvT/hQ8mnoienmus3Ne8Z9
         Z2lRmWKepiWt4yUVvtZ10TmddDFszM2oGN8E+bLWr9u3G6A1MNfMUDzIE6p6lIZ4CaD/
         emipFl1NwATXLfL9jvgEakb9YEn7wenL4xCvNvNocCpfoyYUV/aER1lIQOVz4pg39SE7
         XsDIkubF/rLWSw5mCTNOCaGvL9sJIGFCLWZCfFzqMC8X1wFrhASv5m8tEhUc2fX726IZ
         P1+ZeLnYNu8n2yp9ChHhlUEwA4FB78zQmnX87n9TxZ6Q4xilFqrENCwEAGoO9qfT0MGO
         GzoQ==
X-Gm-Message-State: AOJu0YysqmQLzIqT1hVV+r4NRq/pgYS9sFw4VmYC5c5XTzq27zpQOYW/
	ZeZdZZSq404cI3f8ubuCy+kevz1VfPu7Urb+EHD5PUK/f9QuWnCS8zFtHmIRD7rVdnOPmAEYmrd
	gwihUhpiXCaNu6ZRZhdf1cIDl1/o=
X-Gm-Gg: ASbGncvXnJy9ks6iBXK+H1+osAI1LEOSZc8aTUwtmnWM1WcDIZhM5J7/0miAs2dHQ93
	uoX7YtdPT4tRq9Kgam2tjllc71xGX+kryz3A0/ugVnYASta5ZX1GoKSs1dLJgtetiTQ1wVfkN5V
	kcl84NetowS+ej5efm64ihZaI7obPF0XFza8wvB/hBGUq65r7b/naRbfKy
X-Google-Smtp-Source: AGHT+IE2jBJpiBJtfwsHoNJN87YabNIB3Bk17olZpd4dKi/GPoInYLNljjvK/5Lld/OJTFfbkolpcu+ArxWQkLCWGFg=
X-Received: by 2002:a05:651c:39e:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-30d7e2be3eemr64314551fa.34.1742909892678; Tue, 25 Mar 2025
 06:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250324234013.140440-1-marex@denx.de> <20250324234013.140440-2-marex@denx.de>
In-Reply-To: <20250324234013.140440-2-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Mar 2025 10:38:00 -0300
X-Gm-Features: AQ5f1JrOTiHA3zEWxRMp40SYF5x01ogmRGkPujdxnIUlw181i_K13kaKiIhlIDY
Message-ID: <CAOMZO5AVRZBNntXD4p+esOFMrex4a84p12xL509Hg=cVpRnO8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial support for i.MX
 95 Verdin Evaluation Kit (EVK)
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <joao.goncalves@toradex.com>, 
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_133816_390443_ACB15C27 
X-CRM114-Status: UNSURE (   8.79  )
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

On Mon, Mar 24, 2025 at 8:40=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> +#include <dt-bindings/pwm/pwm.h>

This is unused. Drop it.

> +/ {
> +       model =3D "i.MX 95 Verdin Evaluation Kit (EVK)";
> +       compatible =3D "toradex,verdin-imx95-19x19-evk",
> +                    "fsl,imx95";

The compatible string could be written on a single line.


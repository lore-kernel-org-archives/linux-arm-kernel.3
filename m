Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C23C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL3Fsx5eUxzUjpXw1rSTcpeo7oV1xwNF/0+QoaOG4Ac=; b=wyL/GlTqQ5G0i2WEg3ltcIl5a5
	GXzlVzdcwkT43UnJP8FkacLoL7TkNMrTfL2IBiaNcVafzeXrtuzFKXC6sDkUgZVidwTUMMd/8FKdB
	Mft+oaPHsdV1v1mtu7LxdqLhUQ/gM+DsUwYYjmAxjbDc5ZgZ5pZA2k+kZpC3W4LARKpUViq18yrjB
	xuCaT5KFA7YyN3OMHv5+EkHSKSp1WZpbIxR0aDJSk7T26Wr+w1j+uizHh83J5uoBJ6x0GfT8uthcK
	QZaRk74lPej5YTIi6QJ4MyeqkBLa5vdFbaoLcXo4aJ5/MoGIIjrPbZjHp2+q06uNZNCZlNPLExwR5
	ZM1i7L2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13rv-0000000E1H5-1ort;
	Sat, 05 Apr 2025 13:47:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13qA-0000000E19v-3J90
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 13:45:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so2468479f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743860740; x=1744465540; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LL3Fsx5eUxzUjpXw1rSTcpeo7oV1xwNF/0+QoaOG4Ac=;
        b=LvwfOdsHSMrv/ws0bCQZJGSQE9pXS4Iq1krx70gDFOI/datGGeBXo5OkG5lLc4LMCx
         t/HXNuaTyEarCnXMQBbqI16TuMEjbY0h93K50wM9GYh3XVHlrHfgj9Cv2hf2Wze+dQIV
         M0aIZRHmaV0Sda4Fp5hE2sHZBYc1XTBVnNXPprNZQBYmAx88Kabi/YmaryByjna1W/8E
         ncqDtyYZCJr7Gy+RtgYI7huluiMFPO0nVlSlbsPL7EmMZxy1TtYVDaditdIzV9q/UXG4
         F+Ul6gI3dxM786wG059GFbsnGzo4wEe2SzOSXweDlZvZaPwkmbSyhPYdyF8P+/BIq29t
         v9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743860740; x=1744465540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LL3Fsx5eUxzUjpXw1rSTcpeo7oV1xwNF/0+QoaOG4Ac=;
        b=gWM8aVIPoJl2FzmHBFb4Ey3HYgnE+skorxJ5+SlFFk5W5uMHWpwi0Xx/xi4m5KiPI0
         hW+XQ05yiRrnLj4I2TxS7KWOU5+yGyN3yVtBFUrSaWpSbvPLjr9Uvm7QtvKWbNJaWUki
         KZpMfxp95HyoN9WjU1OhBDzBbopqA7BWVIPO8GcQ8Fjpy4Bij7Uki8atEbymHRlymX/+
         dZ9dfVBtgiqerW33xf3D73im5rI7mGED18r1ugLvK2JEtzE4lqmmTA/PRtG4mv9I0sec
         OCoAjHeYBnx8AynXnlPwXnq5HqyfA3HO/0feIFS50DPO5AGT70Tb0p4yP0wdkXK49Edq
         Hiig==
X-Forwarded-Encrypted: i=1; AJvYcCUOxnsV198Dz5tBihVfDSd+SXEifzdHvKCusYJdfs9hUIATmF16tVUkdH+E9a8G/qYvP5ZACKJUEaoz/wIUeHHL@lists.infradead.org
X-Gm-Message-State: AOJu0YxE2BWckbIL8bn+8xPizLmpgIhGUZSbD2c1c/Zbf159D0NDRyQJ
	XRPWl9W2jqg3I7JmOnH6rQL9D1HigUS3qacbKxTd23aS4JT57CnwpgiW6i2reWc=
X-Gm-Gg: ASbGncvHesYrKRO7kFNxdYJ8Ua4psUoa7YRL+QWpcVma69STenMR/2AvL9sDAsQY13j
	0GGCL45sGGKttaixT1rC5NuOZe9YA3SkUkAGNd3Mqihra5edx3RqlqGR2yQ9O7IMZGmqevPuRXn
	Z8jXbeJfMqzBxc328qg8iyJrTeExTgykKli3DP8BXGc4IvUSgX6h9hVO1vZzGyytSUpI3S/fumJ
	bPpuPCj/LAO84bSibHFmuj187hZcxF6FQx7EU2DQG6E2Gxw0cggx69rOXUv+0ZF+7hncsR/5z68
	FPfJjli493wb86rBga7cpe3hhZ0u4Rx8P0OVoWxPJM1Ug9io
X-Google-Smtp-Source: AGHT+IFIrE80vYu3YH4Ih/F6/gPGXeytXrp/n0l7rEzhE9ST0HxKzD27qJymP07gALKPmymTgWitJQ==
X-Received: by 2002:a05:6000:2410:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-39cb36b2972mr5950841f8f.10.1743860740427;
        Sat, 05 Apr 2025 06:45:40 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ed7sm6770756f8f.8.2025.04.05.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:45:40 -0700 (PDT)
Message-ID: <932d245b63abbcb96611715e8b234138087d84db.camel@linaro.org>
Subject: Re: [PATCH v3 10/32] mfd: sec: merge separate core and irq modules
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 14:45:40 +0100
In-Reply-To: <20250404092131.GB43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-10-b542b3505e68@linaro.org>
	 <20250404092131.GB43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_064542_843088_3DED538B 
X-CRM114-Status: GOOD (  17.04  )
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

On Fri, 2025-04-04 at 10:21 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > There is no reason to have these two kernel modules separate. Having
> > them merged into one kernel module also slightly reduces memory
> > consumption and module load times a little.
> >=20
> > mapped size (lsmod):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 before:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 after:
> > =C2=A0=C2=A0=C2=A0 sec_core=C2=A0=C2=A0 20480=C2=A0=C2=A0=C2=A0 sec_cor=
e=C2=A0=C2=A0 24576
> > =C2=A0=C2=A0=C2=A0 sec_irq=C2=A0=C2=A0=C2=A0 16384
> > =C2=A0=C2=A0=C2=A0 ----------------
> > =C2=A0=C2=A0=C2=A0 total=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36864
> >=20
> > Section sizes (size -A):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 before:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 after:
> > =C2=A0=C2=A0=C2=A0 sec_core=C2=A0=C2=A0=C2=A0 6780=C2=A0=C2=A0=C2=A0 se=
c_core=C2=A0=C2=A0 13239
> > =C2=A0=C2=A0=C2=A0 sec_irq=C2=A0=C2=A0=C2=A0=C2=A0 8046
> > =C2=A0=C2=A0=C2=A0 ----------------
> > =C2=A0=C2=A0=C2=A0 Total=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14826
> >=20
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Checkpatch suggests to update MAINTAINERS, but the new file is covered
> > already due to using a wildcard.
> > ---
> > =C2=A0drivers/mfd/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 3 ++-
> > =C2=A0drivers/mfd/{sec-core.c =3D> sec-common.c} | 2 ++
>=20
> Okay, but why the name change?

Because I wanted to keep sec-core.ko. But with kbuild, you can't generate
sec-core.ko from sec-core.c and additional files. Either just one file,
sec-core.c, or multiple files none of which may be called sec-core.c

>=20
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
9 ---------
> > =C2=A03 files changed, 4 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5=
e49e760bd8f930aee 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+=3D rk8xx-core.o
> > =C2=A0obj-$(CONFIG_MFD_RK8XX_I2C)	+=3D rk8xx-i2c.o
> > =C2=A0obj-$(CONFIG_MFD_RK8XX_SPI)	+=3D rk8xx-spi.o
> > =C2=A0obj-$(CONFIG_MFD_RN5T618)	+=3D rn5t618.o
> > -obj-$(CONFIG_MFD_SEC_CORE)	+=3D sec-core.o sec-irq.o
> > +sec-core-objs			:=3D sec-common.o sec-irq.o
> > +obj-$(CONFIG_MFD_SEC_CORE)	+=3D sec-core.o

Unless I'm missing some trick.

Cheers,
Andre'



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD09D6CFDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jT9NZUzEXDkXmWjrnYYCDqk40FJEePHa/GTVTCRXgM=; b=0toHT4ZpMcTu+ms5r1RXIPLxfH
	x5eKtS1nG4CY9+jKzduZWNzyPOmG1Jg3vYV+HyHeMVeDEbvizwuSvDP8FCkdYVDSOnfIRfJBzi+IG
	5EwMyNI4U+rbMt+T0JIOmHvXZgQRHlgczs7OPpmA8WF1YbZANH6wvAQjkO2Lx1AopNxyW/OZ/UhFU
	BfAUdhxga2/lsoSkbttvvPCQaPPd4JW/emVjvSZwnGkLinoGE4aLmU8vqlkvr48sjrvJ72D9mZJ9S
	qimakSygOEbKecaUxj2pi53HwTu91+GZddtGjD81jIj1IqESKHQQDi/bwiSSDc2J3kkuQe/Z8RRAc
	jkvmXknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAf3-00000008INt-0On7;
	Fri, 23 Jan 2026 06:28:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAez-00000008IN3-3g4F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:28:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4327555464cso1130101f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 22:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769149724; x=1769754524; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3jT9NZUzEXDkXmWjrnYYCDqk40FJEePHa/GTVTCRXgM=;
        b=mBRsPRrFaLtZaVF9iNESBEAdciuEn1uym2Kzm8RBG+5U+9dX+Ghl1SeByjJ9C8YSdH
         ZnL5S/1WnbanPUL3ji4fSi8MbQ+oYAsb3I2cFqmCJ4K1pSSqDuS6nSWIpxBEs4AU6QZj
         zXimzvyxK6ygLcvHhFWNSpWMWTx//aqJNKx6FZ4qkBvShFJu+TrIe2eVJORjZ7KFzoH7
         UmkXgXsuC0iOkcQPdl/Xr6pLjdKZfCW9p/bdUkWSbFjfHms67GKgzREpeJXanXi6BWUV
         9uMMza7qvi8+BtyaroItYzq6ldN8o5LyBdZFQabCeTSIjbGcnQ+4W5OZmSS7ArPveY3K
         CwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769149724; x=1769754524;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jT9NZUzEXDkXmWjrnYYCDqk40FJEePHa/GTVTCRXgM=;
        b=do1L/irjU2z4jgUtEAvvqbxBpzUf/YZhMQx5RpYxgEB61bAfEKlriNkEI7kJ0knNTY
         JbYxMogVWzW10kchN8z4dXmsiJSH+0+Q7QYQuynfGzkprsCmsV+ID1X59OmeGcx+QnZ7
         /3ysXg8a2nxaxKQCYNP0j7HUA3w1yeJYFfxcdKhn+BDJmZunlTvYFa4SAl9MjpcinDBL
         TYe0okKEp30f993hIxJp/MWZcKcTmJno+kyaGH4vyjJ6X9ozpgF5l4PZ0n52em0PRg/7
         4SkG3mRA9EV7ELwu0s/0dLOqDPJQOe+MlQDqK167V1U4LoZcVWE5TUAEnuQWCACMkuBO
         Locg==
X-Forwarded-Encrypted: i=1; AJvYcCVVTrFxXTVgkBGQZWPGI+Wit9rt+jXholGmSSGwF46SfkTRKzBW0nyK18yyS8ohOLUZeqt4+bpwtUaWwF5YtQY7@lists.infradead.org
X-Gm-Message-State: AOJu0Yye1OGBsNWGGJk4zkWLJI25zD9hBRWolsqU0sW+wjxL3wlt6U/U
	GtyCwydopxnwYqzO2c/ZrFd6YFkgd1sCZ09JioGT5MozBV0bdbBEMaHIQCrjOGNO7v0=
X-Gm-Gg: AZuq6aIhRubbzFdINZNGWAH47JQPavVBl563s22/PGnPFxSwAI9BclcSgCwOu3QruFm
	vjAaJRB5qbD3RXvFVLuZO2fWhWZX4F/jU1Lq/CPzlweFxmJIHkwTPlaExjF0Iz8O4RKw0Z8G4aT
	Z7QXJGi8E67wnkzOpqDDOFhB3peoDHAXhPfyeEOZnNF0f3kHgAazOF25EboW2Pxhk17whf8SGuM
	JP4n82IYQ2Ch4V4VXEsNMmI2jPgdFyA6hAQ72H5jIzu6sFhcxbBWfMOMj9BkERfNL00AGkq1qyA
	1OYpuiF6JUa92G8BOWH7qWWZQHSLyKBSttrHpeoLmEZe/eOfvCq75FvUN2jjL8nKio2ZnVWw4zH
	1GSLrAjiw2dii7ZKZxIbYJvKmRzNc9Gx8islR5Zl2vaDVvR6qIUUoJnasvzEvIsZJs7r2HN6hBc
	3E4PFAEWpnySzq/v1Hsw==
X-Received: by 2002:a05:6000:2c08:b0:435:9522:2bc9 with SMTP id ffacd0b85a97d-435b15bd97fmr3431523f8f.5.1769149723683;
        Thu, 22 Jan 2026 22:28:43 -0800 (PST)
Received: from draszik.lan ([212.129.79.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74b15sm4214449f8f.35.2026.01.22.22.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:28:43 -0800 (PST)
Message-ID: <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google
 Tensor USB PHY
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty	
 <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel test robot	 <lkp@intel.com>
Date: Fri, 23 Jan 2026 06:28:44 +0000
In-Reply-To: <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
References: <20260121-next-v1-1-c18068b091b9@google.com>
	 <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
	 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_222845_946036_1F7B8BDA 
X-CRM114-Status: GOOD (  24.87  )
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

Hi Roy,

On Thu, 2026-01-22 at 11:00 -0800, Roy Luo wrote:
> On Thu, Jan 22, 2026 at 2:39=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > Hi Roy,
> >=20
> > On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> > > The Google Tensor USB PHY driver uses the Type-C switch framework to
> > > handle orientation changes. However, the Kconfig did not specify a
> > > dependency on the TYPEC framework, leading to undefined reference
> > > errors when building for architectures or configurations where
> > > CONFIG_TYPEC is disabled or configured as a module.
> > >=20
> > > Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> > > required symbols are available during linking.
> > >=20
> > > Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-l=
kp@intel.com/
> > > Signed-off-by: Roy Luo <royluo@google.com>
> > > ---
> > > =C2=A0drivers/phy/Kconfig | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > > index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32=
e3e52d4a57b26a62d8d 100644
> > > --- a/drivers/phy/Kconfig
> > > +++ b/drivers/phy/Kconfig
> > > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> > >=20
> > > =C2=A0config PHY_GOOGLE_USB
> > > =C2=A0 tristate "Google Tensor SoC USB PHY driver"
> > > + depends on TYPEC
> >=20
> > Can you make this
> >=20
> > depends on TYPEC || COMPILE_TEST
> >=20
> > to allow some better test coverage?
> >=20
> > Cheers,
> > Andre
>=20
> Hi Andre,
>=20
> Whether to add COMPILE_TEST for build coverage was discussed in
> another thread [1]. My takeaway from that discussion is that
> COMPILE_TEST is intended to substitute for ARCH_XXX in build
> testing and should not be used without it. Once ARCH_GOOGLE is
> present, we can add "depends on (ARCH_GOOGLE || COMPILTE_TEST)".

COMPILE_TEST is not limited to ARCH_xxx. It allows drivers to be
compile tested even if the current build doesn't enable whatever
option (like TYPEC).

See also https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.htm=
l#compile-testing

Cheers,
Andre'


>=20
> [1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPhJ1=
6xExgko7Dw@mail.gmail.com/
>=20
> Regards,
> Roy


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A360ECD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=; b=kjw8HxYYUA2Scl4Arjo0ibdnfm
	IUzS9NB7nsehU+11fVoT5Hadtt2ZGK3E62LauR5tcW7dhnWc1cIKnzFoErys62fjYO6+wUl2KwN7l
	+oMnywamkKNKg0YpgUwKWgBjSwX6YUXE2Z91GbcgbBDqfuIS5qqXhPgiz4RoTx1zW6Z9hGvXgfNv7
	cS27qCpN+wEjWI+/gbkOMddXPOe4PQamOUN9OkO0QO1Al3GDTlXhx8FVyRxlS/9x/qTL+73rfp3Jg
	uW+KJDBs/Sg3gjpVbN55AbEeYzWfrXHkT/+NYHKyK9XCXpYuwtmEqu59A/f6UeSKxDUT2rdW4Hw+f
	SRCJITpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzW5-0000000G68f-0I9l;
	Mon, 18 May 2026 15:04:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzW2-0000000G680-1M3w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:04:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-444826c16ffso2116720f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779116660; x=1779721460; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
        b=qo6Q0Vp5vpNXwuSTWmslvB3X+76mZMsfkrxk7qLXxBcB8rOhJjReEeSrwfhsYLmdq7
         WQgxVL6jh8yd72JycCbUu268+X1ue2r4aC/ZmNfoQlrxRw4CeVRkugRbsW4Oibyzt8ue
         EmJCb3RS8Lso21Nh3D8RYx6gxImZdbtldcFtVhIucAMh0yHT+tGpTgtS9d64+8Gfs/PJ
         uYtC3eN+plx/vt6vxrDRRiLTSJjHfsoIzMYeUaE43rAa4GkhgI8xcYIsYezYQ5umg/pD
         N8fXv5nYtvu41ZX7fv9vaL+u2UQBF4w9s/REpb3OhY8B+9khYhQhVGEv4dHB0+jH3cnA
         nCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116660; x=1779721460;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
        b=CST4AmcrauMjUNnhckuI99Ec5qYBY4WtpgeuA3E2mhiFvCKuTxyzsizpbAWksHTxw7
         nYSiQE4JEMLExmL51PLsCN0XA4yOYzzO1o2/XDWDVGJQrU6uGk863jdBYp1fhNYi/3Hy
         ryB4Rl8PyhuLyrVf6GQXGi2CwEZmRoHAXl/sMpHq8axI8M7LQ0hXVyHzp7vnSDWak9wI
         IBTjMIRopahLFSCRmnmbUTlim2J6z1WoWk+fU0yBRTYZF4IAmgEK9EfIRVEv0vASbbR5
         fh1uS6/bRYbpC1OFaEUsL+zD9Ltk144ouy2QXpb6/sDAm/GSOiiaj3T/p7NqXeMZtxvp
         GGBw==
X-Forwarded-Encrypted: i=1; AFNElJ+O4qnCVFH5GVYi62iLO6PBsTZXJuLqIx5oLDm29Hs9lZku3N/6IBfe5H1IZeOKWVVbBdTw/X39rHAC004TI3pY@lists.infradead.org
X-Gm-Message-State: AOJu0YyHmW2RwmBbnlp42ief51MA/9pxKOprUei/wGgfuXpwKEDprPiI
	7JdXWLgGwTN507fDC28v8NBbk68z9ilIN96lQF+HPuTN/Ib1VtMCJxdC
X-Gm-Gg: Acq92OERssYTKPOW3fxCAOcv7bAeMGeEz7DIXMBWElUrqlUK1SWxOOKFFyBcb8I7RIi
	6NjIm6AdpIIQaBoCoiKQJNqHjRLNfwjC9shQl1MYvzXsP8P6R4zQEfx7NF4vl0LjZm32uuFFq2L
	3J1kaeNEPBb+uiG7zMvoF3d+1FMFNwPqRtoSH/JuLxMfijtsB7FE7SnIDFYdU58EyOjyTX9F3z/
	wq6qtrcyk5mI1IrJvwecyxQI2mpvN8GwLgKUycuV7p8gltIPWYbfLwr53uw/hlcgmeVGVbLvnIg
	zk3cPHpCS8ScuO233p2zL//Qt2fk91WnHW9yuxLP/FjzSoR4i/YBF+zx+R78NClFXvsbsYq4TVV
	THLb63jdXs32ljRS+llX8tnlYOAaJPbiRJmawQPTX6rhGEVcRI4zsrGOvnl83Hy3IDrTB7zhqVE
	0AOf8/aUaLwdCFJ3j0lBfjTljXlXBfvIxIiL+ecacjVzLYT2MGHds7PoC+oXTrVjCQGyWsWLRzO
	5jR1RhbT9IpHG6a1NWBolDR
X-Received: by 2002:a05:600c:c167:b0:48f:d410:6065 with SMTP id 5b1f17b1804b1-48fe66138dfmr242995475e9.29.1779116660290;
        Mon, 18 May 2026 08:04:20 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm81701595e9.17.2026.05.18.08.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:04:19 -0700 (PDT)
Message-ID: <a921e006b872de3853069ddd08facd3dd1c719c1.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 17:04:17 +0200
In-Reply-To: <agsohFpjuGqRRDO-@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
	 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
	 <agsezxcxjQlBmesm@collins>
	 <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
	 <agsohFpjuGqRRDO-@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_080422_379640_93F6304E 
X-CRM114-Status: GOOD (  15.40  )
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

Paul,

On Mon, 2026-05-18 at 16:56 +0200, Paul Kocialkowski wrote:
> I also have the 7" LVDS LCD that goes with it, which was supported by
> Parthiban's initial series (but needs rework, and it seems that he's
> unlikely to do it). I also have the 5" MIPI LCD but it's less likely
> that it will be supported, although I have seen dirty patches to make
> some other MIPI panel work with A133.
>=20
> We'll need PWM for it which should be a follow-up to the current H616
> PWM series from Richard Genoud.

I didn't have video in my mind, but...

> Other than that there is a PCF8563TS RTC on the board, audio stuff:
> speaker (which I have) mic and headphones and a GPIO beeper which could
> be added.

... would be happy to work on higher quality audio I/O support after
we get the base merged...

> Do you have other A133 boards that you're interested in?
> I also have:
> - KICKPI K5C
> - DshanPi-R818
> - Logicom La Tab 129
> - Trimui Brick

thanks! I'll try to concentrate on the SzBaijie Core/Helper boards
I have for now.

--=20
Alexander Sverdlin.


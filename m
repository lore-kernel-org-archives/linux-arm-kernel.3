Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E122CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 02:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=; b=xoqj0K2YScAwgwQNBRx0OGgUPm
	7rgJktnBXM8lUC9CLm4viYDeWgVx2IjXfeIDJKfSCyu8KZPBgqExfZl7/vjFIqbRorab0jQy43P/U
	9R0ace7evpWb4bktRZFUWRpgHseBo0/hSCWHPXuKOjjq6cwUllmUmLgZScISqB6DQIVufYwrywFs5
	+m43iV/4ibOnXxAHXBOF9KZ83pI9xAfcrEzzVED+Ooi4HLr5iFnf6qaU50FqPFbOWGmFO7VbEf8c2
	XvtD8UUNMF/91n5NYbX7dL0sD76Liu9SSML7aYb/2+siPOoDVFZbavXze7NZuEBbaQNq1WNZjqjE2
	E6q8TWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMhA-00000007Q0l-0KxW;
	Sat, 10 Oct 2026 02:20:20 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMh7-00000007Pzm-2NRL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 02:20:19 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd1e069cb19so167565a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598816; x=1792203616; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=HhgQxIej7NFgRNGFreKiZfaRIxep+JU+ncloJ2PQtfiva8ITkYRHkaOGgcYtr6QSIj
         8BlwpH4OhuCMx2AxIGoCuUwpv1i9zr26Dv4n9TjRfiIyeQ0t3g+OLTxgqhSCY2GrZMTl
         yFY2l2YsNrcrMD+X3YLwk7TFf52Vw/jqlzH9OJMwJtNmBS5uUuOHO5nHbvyVwRz0qdkC
         JDtLD7w5tmyvuPlCYD+xcXLi6OxpYHaFcsqQzG3TgFJ6q/odtGtdODQdTbdxaaWihkmu
         OoMoYWoH4Xar4CMbuVB7n2Cwgwv3LOSNdsCzQXU7V2SwyQC9YWWtw5s+1lGC6EAyP75s
         lGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598816; x=1792203616;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=baX6mGWwoR0YwntPCqCks7f20J9joYTEJivwP3FyAlK9CubFe6LiooVF6YD3lUY0BZ
         ng/pIB+GPRoMpQ6WeLdW5vVuxM7iU0Gb6xSuKm/YI5qqI6qNuJ5rV4OZbSMzS1kXIp73
         2xWDNTRdoFyJ643yrRmM1zZINQVFHrIQyMW8cRlnzwVXM0klO7jtt8OFcNTwFuAZJWs8
         ez0eVj7Dxlp4eSkUsLhePYCI2VOCx9tQtbkLol4eIZDG6XLUDYBrKSzpS3DyWWGFpV8o
         aYDl0nAlmgZkRo6UBxp06KYq9XmqzxYte2rfDOyGceozFxADZGXmvRJpHQ5Gt9LnH9pi
         P6oA==
X-Forwarded-Encrypted: i=1; AKwUvBxhLD0brtyHdJL2ws29qOhwVMLCm5ecUfrUY4iAyA94Fjm4uIfiPOETaJG8I0CWvdlpvEc3N6o8NezZskUHGKa8@lists.infradead.org
X-Gm-Message-State: AFq9FYJLqO+13HgA3yiaijGyO41fgWOvDD8CLoMfWzzmdABQhTprur5G
	xoCo2XwOFa+6hmVW7AyAAmPEa7d8Ug/e7JdIr+lVRIiPMt2jE5tDuDif
X-Gm-Gg: AYBFou0FUHS6xgXUlAcW/6y4aTzr0ZUsqGHeyVYXY8bJJJdcWEnEovj5M2TATsqiVo2
	Y9+qa3UTcxjJHMy3BK6OLYwN44ACqev3Y8Xarlvg9CLhXdzMMR00/CJ3seEhzbiPQ5e8qRz/F0I
	gSgQwAjtE4q0DG4cLRboIkthdJQM+tebPxiJif09M3zCn9GHC6NJvskeS+C/xUnWe+9KZuo3Ije
	/lLm5lgJOSyjnx4k2VrUctEwyWDkhW5iC+bu21rfAK+o5QgoDi0FKlPjTbCySpbVRRHyJqLJulP
	H3Wh2t4UGPIKZR41EOTL5QSbwjf+SOXlcIZEFj72kv741EhcEsfw7v/hb/UcRIarY1xGLZvqqW3
	Url8U2KwU/CdrZZ2PIWXQhJyKvaOXYpySsHgY7JiOtQGCSiiRZIZigOkHpYtBKYTbihUFGtNcNr
	vsLwg3GQPxSuvXgjfzWyuxlILGTxHEP+Mn/rpoBq8ZHLeaS8v02LJlmEAOf6PlxoqwaYWLKIp6z
	nGC3lzWjlZ7RrjciiHLz9Zbil9jgwP9u5RQloBJHlCTDBC0nn7rRo0tNWvv7eCqkyp2MpdDsN6e
	/v2di8+37pTkdF8q5jDE/NatQI8um37gPbOfgRDnT0nwW98AwdY=
X-Received: by 2002:a05:6a21:4eaa:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3e16bab5c23mr3009407637.2.1791598815958;
        Fri, 09 Oct 2026 19:20:15 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c479c2cdsm1804113b3a.55.2026.10.09.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip power
 supplies
Date: Sat, 10 Oct 2026 12:20:04 +1000
Message-ID: <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
In-Reply-To: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
 <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_192017_604638_8EA7F671 
X-CRM114-Status: GOOD (  14.50  )
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

On Friday, 9 October 2026 5:10:01=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> > Some integrators do not expose the power rails connected to the codec
> > in a way that can be expressed in the Devicetree. Do not require them
> > to be specified on such platforms.
>=20
> I don't understand how these cannot be expressed in Devicetree. What are
> we missing?

On Apple devices, the regulator(s) driving these pins are completely opaque.
They are not exposed via the Apple Devicetree or any other discoverable
interface, and they are not controllable. As far as we can tell, the pins in
question are powered whenever the machine is powered on.




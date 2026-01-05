Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E39DC79FA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERyjgMpetsSV7HmNF4hsqF0bdrmrio7r57PRd234Lqw=; b=fx+uq0nZMGCmXWTKvo5US1lvSW
	EzKANPLwiG66qKlk2HLhOyFaQ8ehu40uBBp1SaAOZ1RuIKEtd9Xn94kNet+Axmh0XhDXXADTfODhU
	Jk23yP/VxCmWQeurcb+Xy0LVeeIhXs+eD9NssZIlgOlpOGw7lLuCBN7h0MXKu/hVjnlYomKlMAs6p
	HJxeKyKOXbXzh6hOMUiBIwOU54gMYaV6gS9l79tQRT6nHo85Tndq+s5vUUZQn4afXBHNdsJHA4fLG
	LRX7QMEpD5ImBzASxcrZjkPJHyTcFs9r30zLH3BrGxbTQKKJWm3Pf7Mto2bCNEY7m+8rNsz/vKJ3x
	4oT+AORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnjs-0000000Bl2J-23GA;
	Mon, 05 Jan 2026 16:47:28 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnjp-0000000Bl1m-3HVK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:47:27 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so25886066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767631644; x=1768236444; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ERyjgMpetsSV7HmNF4hsqF0bdrmrio7r57PRd234Lqw=;
        b=Za7o7q9MWCi3km23LGoXrozcnk0fD006IX7+Sq7jwaB4aCnEWPMrVxPQ6VhQXykg+7
         FtKQhplVtsMunwdfFN7dpNkDklYifN8RjO9iP6usGSy+r4rDiqyrtC6mUS2kJGjYEpm2
         2ltbpKDIGne3FxBvZM/2vLjsXjStU0IC5tcgqIWtm9LHKVUnFDaAIke5Z8fBkPFMi3rl
         72OHqQ+abq91WnAhEyGpzocj7E0fhf4S/lxUoDG8hdf2TxkN6gNpQ1inZBEx4MFPUUPo
         sRdgKaAbZ8iqZpTBOdMY3/qi4BzsZ6ol862SoUEAyOyNnLL0gQslqlpnjCUPHqqYPeGk
         3ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631644; x=1768236444;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERyjgMpetsSV7HmNF4hsqF0bdrmrio7r57PRd234Lqw=;
        b=NwzcZa/lAgB0VS/zqvf17x/yrdTn3a8p0OiaReQyv94Hm1XORSkkKM0mC2/gzyvVcY
         o8vipusjlEggbB129mKxQ+8PGIki+45v1pbQuSA8oAVWSuXg+9fgzcz10TyPl+VvnbTq
         xQd9khzXC+FfQU+DZwYWmuKrAVTJE8lkXIg6e2uYMz9Guh3ThVDnuDaFqxGhFQXAsv3r
         y9SicX22SWGXyMmpE/09p7vNYmfcmII2OAu18IvB7VsHD9P62YxiWLXmgFL17IjJCbim
         vW4hZ5yaByRgZcgdAF7M4ohn52bcrhUgKrXW9rSb+YaDmEfXXWZB9k/uv1hfCF96QLKW
         TbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIaT9iInAjL629d2mvojM/abjHd1FuwSH9VRhsZssq4TI+PTcjldS2iz6K0PmL59aS10rO8Jo6WGdm0BVe6QQG@lists.infradead.org
X-Gm-Message-State: AOJu0YwIxisWW462/fw1560GwLC37iKLCRmsbA8WD1BZIxGcKpztN9re
	O6duALUrdoQ7FG8Ok5r7s36d4wJovJPeRo4rjeUc/we7ogtn0te/e9moLGakBoNnav4=
X-Gm-Gg: AY/fxX7O7KQnIatdr8uyFHbic8dAKWXqfWRy5VIiXk77ep+0fY/FaWXNNW3VIzPJJlN
	I892v7AbuUsJZ14mBGDsdYh9ehIk4ohR6Sc/aDuG2BxPWybiZMQ2YR6a6mvL5MKbMYb7hwmrG3s
	QtGOv3pIR7ZmV7XWAXx2mueAT4SPOXt5tKYXzqHp96ojHAyA47L3+WVQYdcuPho67tz4y0CoOje
	vNT0cd8pKQJ6G9fOBESsPL/1lhDo81MtLT6PBtpITTJ/pIggYRh0hHEygQmq2iHQ1oZtz8AnBzs
	h5gZuiBwk/XMMq/6ty48NshovcRF5Dh6Ugqm/6ti6PTd5vuqTrx0f2dqgnEDPMGF02915M5TPGi
	j6z3x2jvrOB77uwx6LwB8txi5i91GyS7WCXPC+rl+7Vsc5edOZrugs9lJbq4hH0Te4Q7fzhFzhl
	QmNYndlotOYN/b4SNjUw==
X-Google-Smtp-Source: AGHT+IH8PrChGbBe3ifcPMF0XNauYBYKXVAb42mE0WG2Oe4GF884wrbNFmqGeNp3hqqHYpAdiAIsJg==
X-Received: by 2002:a17:907:706:b0:b77:f4a:ca1b with SMTP id a640c23a62f3a-b8426a6c79amr36443666b.16.1767631643937;
        Mon, 05 Jan 2026 08:47:23 -0800 (PST)
Received: from draszik.lan ([212.129.74.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507618cc59sm255498a12.28.2026.01.05.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:47:23 -0800 (PST)
Message-ID: <da028427208fc4d515060375fc95f1cc0f64e2ca.camel@linaro.org>
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 05 Jan 2026 16:47:58 +0000
In-Reply-To: <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084725_848227_A75ACC6E 
X-CRM114-Status: GOOD (  10.66  )
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

On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> TCPCI maxim driver directly writes to the charger's register space to
> set charger mode depending on the power role. As MAX77759 chg driver
> exists, this WAR is not required.
>=20
> Instead, use a regulator interface to source vbus when typec is in
> source power mode. In other power modes, this regulator will be turned
> off if active.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 +
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c | 54 +++++++++++++++++++-=
-----------
> =C2=A02 files changed, 34 insertions(+), 21 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


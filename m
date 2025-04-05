Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA6BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aUz9xevIHtQ5HcguqoQTB6cntYV4+ru80uxVrIvvK0=; b=PKHsuzELeJzgYyzSRvZIhgJuOJ
	ziIV/DaoqpOuvufw/IPaUdv+HtOHL876/VqazszIK2Bwt5oOdCTUjLnluPfWCbExlAMkzRqxH2nPa
	QmZO1DzouUopQ+7gOr6cIg6N76Paka3+ma9MrP5RdOCduS9Tsb9iEStArerEb0t1YqlKx60mmj0c9
	2IxrhAMl7BQpAlIMAn0OOzfmAGI8d7+1Be/6riBpNFi3DYDPNDnr/idOiXZOisIrP6FG+35yCAz6Q
	fju/TpqDWlTj2OCZZ7K9UCpBIaX1/V2TaHUTRig6MWsVN9+0O7mrpT6YaedjAWQQjo15+Hg56efMP
	ezpcAgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13w4-0000000E1dO-2qvs;
	Sat, 05 Apr 2025 13:51:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13uK-0000000E1SK-2oXQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 13:50:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso31685115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743860999; x=1744465799; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+aUz9xevIHtQ5HcguqoQTB6cntYV4+ru80uxVrIvvK0=;
        b=dBl5vwi/cAFf1nUZTSamkOWcy3GqInXHiBrRmO8msdi+2fMa7vjXTbpCgX/lf+1et1
         /u13/CPW4k/p4bj50IO4RQRmyITWsuYBVey9H9jA2hXQjsRW6OZSqbQrxM0MhL1qQ0/+
         kX9+WKEDZSUoqHRVadIbaDZjbOV4RPbbu5X5oc7Z0NWGi8aQpd8RV6rS8+kCT/cF9Fqo
         3aCOn1r2CMcWvVmjvuDPvK6qbyqUxpq3679ENua1QxFkf/kvNbTKAIA2tod51gOI+vyR
         KZUuJA18aIzQxIzSnRocFNL8ozaGhLZUrko6UCw5/4EhBG3tdd7mzw0wgcRpb8cWZBkR
         Spmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743860999; x=1744465799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aUz9xevIHtQ5HcguqoQTB6cntYV4+ru80uxVrIvvK0=;
        b=PrmTdNkg+WfpZ0WZR6LbtFyQmnENoY4oQ6BTHpWr4BK94k0vQQyCMNu5PkMRnYEsd1
         reySkP3aBTNPgiKa6VSQNrvc7O6tSFK7bd+EiSn+h02EZQNmH6ybosFvECYtbMEQeL97
         OhgUfj47my7kY0fOM/Vf0l5pOh0unLodZ/PXIgl4bqbI3B+u8Exc4xReDUZkuJklv3VF
         hp+gFgy0yB8rEn8gM+oQ2sBtHUqOXAhg95B9vo6hvmWRiXUvpoUNhlGiWwSHikZ7+gM9
         KtR6xnt/GxgnucS5bsVgsODmRo28rI5tmyq2MB9jj2nfFO36bGv0Abe2eVg4dOG6gEOM
         9HQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYG0lV7qqjCASQbXuZ8SzywHLIT1VF7No8c96EnLcP+QdzszYBCCp5Z4THtR3Izj8KN1/nfAo++dtxG1z4MOJD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7lpNh3ytYjzwjOxRXoGjGiyi7ZzBnG1opFEOfziUb1mJic0mQ
	z97fUXj9MtG4oo652+YmYsI4y2ffMIrxT6FGNFELTUliZmBDCJsZlyBTUu3tvE8=
X-Gm-Gg: ASbGncvJ3aIFvCBahf3V30FWaWcKknrtlFPzXKjqv/h9crIJhpILOZEc50eMDjPdgqf
	Pq8GxRUvGHGCUfnJwcKtMIQeFfRXmjWkzW81nMcot+oNEAmHGeLMyizd8biopD5aT7Ju6pb/JJy
	KRqgJQoOvVd95K/uo7V/yftazaZJststFchmVkFS3zVrn2K6NydlJD2mR+5SMWvlYnKIO71Dd5V
	U/CZWZpLATDj52rVA1cj2m0ydU86LgDIPvYEAuU4kS0NpcI1+cxaoUqN7xkyqf3YchysrpV6UW7
	0J0qXNnKBjh1r38gYwrbrSy0AaFveCS3zV6OvohF5C/pwvTH
X-Google-Smtp-Source: AGHT+IGEMTPUEjKXv72J87fcLD9Q/jwVNzAqgI5y+bsn5JH5gR2xHN4lAAplyWAjbnnOZ73qIK0SCQ==
X-Received: by 2002:a05:600c:4754:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43ee0640054mr27782485e9.11.1743860999041;
        Sat, 05 Apr 2025 06:49:59 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226f2bsm7018626f8f.96.2025.04.05.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:49:58 -0700 (PDT)
Message-ID: <3d688dbd2f88ce8db854f6972ce9105202ed4c06.camel@linaro.org>
Subject: Re: [PATCH v3 23/32] mfd: sec: add myself as module author
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
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Sat, 05 Apr 2025 14:49:59 +0100
In-Reply-To: <20250404094229.GF43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
	 <20250404094229.GF43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_065000_714383_E4B54378 
X-CRM114-Status: GOOD (  17.73  )
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

On Fri, 2025-04-04 at 10:42 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Add myself as module author, so people know whom to complain to about
> > after the recent updates :-)
>=20
> Full-stop.
>=20
> Smiley faces might be okay on the list, but not sure we want them in
> commit messages.

OK.

>=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/mfd/sec-common.c | 1 +
> > =C2=A0drivers/mfd/sec-i2c.c=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A02 files changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> > index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b=
1cf25de4870e1a95e 100644
> > --- a/drivers/mfd/sec-common.c
> > +++ b/drivers/mfd/sec-common.c
> > @@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
> > =C2=A0DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_p=
mic_resume);
> > =C2=A0EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
> > =C2=A0
> > +MODULE_AUTHOR("Andr=C3=A9 Draszik <andre.draszik@linaro.org>");
>=20
> Might be more polite to put yourself at the bottom.
>=20
> Not sure these are ordered alphabetically on purpose.

Yes, I wanted to keep the alphabetical order (by first name), no ill intent=
ion
here. Will do.

Cheers,
A.

>=20
> > =C2=A0MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
> > =C2=A0MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
> > =C2=A0MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");



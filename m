Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60946E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evV3vfqPSZenjkxuiuVbkt4Uo538mTCtLcz2OWZzZEw=; b=UBlvJ2/zOlAmD/i5ZBD/Q7w/Df
	1FvckZGFOu8WTH0AFVfau/e7x6wODOWRBojOOrIQeg0Rtfs9tTN9IGjEDLoxufCXEBXeufWb66Vux
	PzDtQGfT+EP7kZ9xZA4jjsnzcV/AdE1EZKsdNU+carrBpaxdQyADwrTUUYcnKiMmWCc1OCpDlu0Ne
	10zxQUd4ApSJLt74rbLUDsOtQ3ww54P+DoibgFOe4TqJRrV+vFBF6XpyXvV9S5Pl7mgS4GMY3xX+h
	KRW/AWAgkjeVTmqJC+efnBiW3iQOc79f9KHhMgAJx3OaSvqfOjxkBLorr0rYI3TrmNtDvPAcIs9cG
	J+RQHDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo1F-00000001Yav-3ehG;
	Mon, 06 Jan 2025 14:23:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnyh-00000001Xo3-1Euu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:21:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso146733655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173269; x=1736778069; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=evV3vfqPSZenjkxuiuVbkt4Uo538mTCtLcz2OWZzZEw=;
        b=eKOoFzADermJAR2xtFWWaNAjf9K++P6VS5gGNl/hLtOipOsiW5Bjh6dsRzQZBcbmxl
         zE/gdBiOToUfRtavUcPniZGkuWaqtKD9PXwkMyVeb88ENcrETzwRHAHBTvAtDuU+oMcQ
         WJ7V/4g8njcC8qOufTJiSJpPNJd9cEof1OVd27FwooqQu4vMrdY4u4VyPWjCa1GqAE+o
         ZsWagZLk9al5596p8HoILAPcvMXSi2y6+7tfz9m/hk925k1scJr6fsTirV10wKBMHHJv
         Lg+8CzPf+EcXYi8+38Guv3AGijO4A5224UCJyhgIUYXxDwWUnB7vIeVlGywZsc3wBPlA
         jliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173269; x=1736778069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evV3vfqPSZenjkxuiuVbkt4Uo538mTCtLcz2OWZzZEw=;
        b=uqqo8DWtBKBQYRwOPzxpmx7AArDY3WMs3YyJ+A//ngtNkNaJxplVulBxcznwGkLNwK
         h0Eaxy+HzKvRhHZZy1leT+nC0y6iGkMxJQW6SJI2DXVKUhQKfB3IDn8pdzvPVgpsq8/X
         xcsKJN6yeeutsEq9mAy6bPzMx3qnO8JjfRxFCs9xA7AiI9OlZWDjtvF5mlzCpbOEIjVs
         NIys6070xTo51W3PXB9EkXbeVSU3a7uFQitRulMX1RBu3b3NUXmQNGizNUzy/pDemRGL
         MsZxEcGFAGUKsFBUPmBzICOV2OJMIKb7zCSXx0jwyruuLpTvWydF9Br/3lbLgUqSL//O
         9FIg==
X-Forwarded-Encrypted: i=1; AJvYcCU8TumI4+cPQpId5PLxzvlqarsB3hHp49zjcKF2jWO5LSbq/ZJq9OGNN9jityuBRuw36/Rx1wOLbi2HoiOhFoG5@lists.infradead.org
X-Gm-Message-State: AOJu0YybHRK4Rk0oI0muWK2lQetd9jN4cz/in1YdsvMfYEpoQnZeAmE5
	t5jqgv3RJ8arSx76kzR59yFNIaCvx4hr0sYXtOgS7g751opGXxMKavThYgmjGg4=
X-Gm-Gg: ASbGncv3gkcSJWOcH8Ed33cgEc1TgSq0m1wTkqt/kIjyz7BT1OUCS0+GziSpLrO+jyt
	Q6lj94hSBZs+J8xTmEs9q9VIqWlf6F2gyxToz0e7N2UXwOPNC641xZx+OWg+8zMWx6ApaBpQulV
	kU+71CoXv0lw+0psvYZMteKSvC2V3yIdd8TNb2tbdwcOBRPEkHF90HZIe2jZtEML94TZy5DT7E3
	1S+YNJtcUo5PopskH0YsSQ3t+Cjz66OjmU1CUS/N3qrQ0URlexf6aV/S9fEQQ==
X-Google-Smtp-Source: AGHT+IGaidTwju8f4iTgTdz1EKQVrkbPeOyWSscY7DkQ0gKgcAzgpgkJvVTjzuCMb4bNihTY/QOv0Q==
X-Received: by 2002:a05:600c:35c1:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-43668b7873emr393116775e9.28.1736173269113;
        Mon, 06 Jan 2025 06:21:09 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b1f6sm609901075e9.31.2025.01.06.06.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:21:08 -0800 (PST)
Message-ID: <8563b573d3d545bbe11298774202fcbfa4dcb13b.camel@linaro.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, Roy
 Luo <royluo@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Mon, 06 Jan 2025 14:21:07 +0000
In-Reply-To: <8f75da5d-ef9f-4324-9b8e-bcb1e8741a8f@kernel.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
	 <20241203-gs101-phy-lanes-orientation-dts-v2-4-1412783a6b01@linaro.org>
	 <8f75da5d-ef9f-4324-9b8e-bcb1e8741a8f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062111_329508_B335C6EA 
X-CRM114-Status: GOOD (  10.72  )
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

Hi Krzysztof,

On Mon, 2025-01-06 at 14:33 +0100, Krzysztof Kozlowski wrote:
> On 03/12/2024 13:40, Andr=C3=A9 Draszik wrote:
> > =C2=A0
> > =C2=A0&pinctrl_gpio_alive {
> > @@ -142,9 +228,16 @@ &usbdrd31_dwc3 {
> > =C2=A0	role-switch-default-mode =3D "peripheral";
> > =C2=A0	maximum-speed =3D "super-speed-plus";
> > =C2=A0	status =3D "okay";
> > +
> > +	port {
> > +		usbdrd31_dwc3_role_switch: endpoint {
> > +			remote-endpoint =3D <&usbc0_role_sw>;
> > +		};
> > +	};
> > =C2=A0};
> > =C2=A0
> > =C2=A0&usbdrd31_phy {
> > +	orientation-switch;
> This shows now warnings on linux-next.
>=20
> Is this because of unapplied
> https://lore.kernel.org/all/20241206-gs101-phy-lanes-orientation-phy-v4-2=
-f5961268b149@linaro.org/
> ?

Yes, that's the reason

Cheers,
Andre'



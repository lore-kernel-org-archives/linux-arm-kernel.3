Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9385AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=; b=hxlZDVZE73BgDvw5LSBvYDfkJx
	ch2Qhd8Ab0VsGCHEJhQK5bocTtmFX+xU3KaTp32MOC+YIRkU7w//R+G9Sl4d+Qw69E6mU04/qEdvP
	SvY5P7GLsLERFf6NtPt2fGmvT0QtYIadajobIIo8JH/BsRq41KsDe5J/eIqKm2zHRJ8vzsF0+k23y
	UHoghTG1jFGGttcRDDtI1BKWfyTJLl3oTItSdqvEmMZI1+VrWt7FlAm9M4ADfGEskPDtfxDvklEz4
	WgTgF5++M13k8OEDxstgH+w8IexA7KMMQ20mLqu0q5qfruhc88JNt2+G9+hH0XCaaTUrPfejqSrAo
	Sjm+mM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvnH-000000008B4-2L5c;
	Mon, 03 Aug 2026 16:45:39 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvnF-0000000089j-06HG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:45:38 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-96723c7151eso891180241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775535; cv=none;
        d=google.com; s=arc-20260327;
        b=QZRZSuzwkK3RtTvS0xeiKkDnbdS2FMSFoYn7EnaHpqOSurdGQAUn3GxEpcbPIy3Qpu
         D9OAOqKZ43vSv9jn5fDBry7Rf/kS6+vpUvaXrL0GO1uwSI24khpJB5tI7yxN4bFd9TO0
         X7co/Gg4qdVK2Qrd9sylJxvSzA7lFggef10u96O2gNXC4HAvahxysCrooPZkPsd8MVs1
         rmOVd34grHNB4a0deTExVR+cZ74oXbf1V+iHnMSSAXH8e+9/nxeQIhM4Yt9Q7vC73XDF
         tga0YuMsLIH84gfKY+61SjkTH/3fYEzMPB6shf+oKhqjI0KCAv51U9zIGMvW7cA4K6Px
         uFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        fh=0JrOyvHPizOMYF8APdriyTkdIaN3nRwvYkZDfk9TSJY=;
        b=U78GastreaUv+ec0/W12kkqGXiifV6FYt7ykcqtqUO9FaqPhpVWhUzF3sjwWnIIHcZ
         UlkturLWS2zIAL2FuLS+po9Avdg6wAL8saZaut23AoatHJqPnuXkGhyRMwS7UpVTOOad
         4UIS8YqHF9O1KsBeY/CPWp+soLOBSMkFVYRxSuQM+9Uz24qe6Kt1EKj1Jl8rdhAAt4Sf
         /EwY3DAOUKvDesbDQooevOHVvfSs3vf+ku5X8WgdvY+UIPJmumnwO+DXCrKHZ3Nrw3UA
         DKk+M5Z+I5vGU8nD0R3FnxVXjNMeydwUbTCic05LStCk5ghKb7KAFZ7ANeINIHI91KXm
         7ICw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775535; x=1786380335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=oqUJbiEExevkByzM2cZ3YuQQSEM1oWgWj1wy+XjyuP3jWpdoHKU1a3sA/J4gutpJbT
         9BekyGiuOC8P01sooMoP2NQt4qyTGEl7Q3E24xCSazeDQCCNUKFoLkdV4WSnXXQR3bY6
         sHajmhL38XauKxIVzsRI+Cojhhhx4FpvflnxS901InpDSVTBwBB53qO4RhC+wxB46P+7
         Ys0jJbgNJKK6BFKVcT4WXnirXTU+k2wjmxnk2Qpc0mW6px2xnDrdSbi9G8drF4ffm80F
         bOkQJTiMU4VtsVE1MP9kF1NfGUl18sb+pNwZBJAQXgLeYZIlkrDsMWpsONDK2zxZTQHc
         4q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775535; x=1786380335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=lSepz8aBnn5wON6Rg7MD/f+DFgR4JErs7rpkCp+SJfuKKbCA4DS/AIRHdzTNC5FrCC
         Togo10X/tKhqsKd716jRuuoyiwgWAdcMdGsN0x9GhaWMIm2fRgAvC6mR1YUQzlSe1DF+
         LN9ObBNsUCQskom7OLzlspx3MNHxmoJvfQVHZSSS6CmVeF/Kf00EIhUSNakf142wYmTg
         Bf0j7BuQ8/LsC/vSjn/RLbtIPjygAwnqVjv6SNXpSjPOH4EHp23hn4SgyJ4OeTuicghP
         aGXGmbtjcCujL9/VvSPS/Yo5jJ0J5E7ym0sd7nnnAGGtbuKu9I88I1WN/G2eqAI3+JjB
         ic+w==
X-Forwarded-Encrypted: i=1; AHgh+Rpkm0RbAinFAJ0e78CkHCpzg75ML9cOgweOM5Q0JfiQbAdgpHFyx5/AzgbyZJ+kAit1iDd3OsCfAQTYuItsp6a4@lists.infradead.org
X-Gm-Message-State: AOJu0YxfHPVd3fnTYkXrx16qPYFeOZQYEYVkHxxXHjw6E5sg2iqdmzMc
	iHJiSE/0HWgdNQRAzk162/W9iW/GdyeYEPbhYnstGiDtNiXI1C6kh23Kx40rCG+nYvX/QJa0exs
	B+Z7ExXJVn7DhJlRM5F14qPR6b0tEgcY=
X-Gm-Gg: AR+sD12NuZ41tc1Od+JJ2YdKy1BwOpsHbGjkgQDxSyMKZVdWSLZbE8Q9i1KF1mUa748
	iQXaPYLdidquKvFzaMBQad9Kx7UfCQXQ5KnO2rufdwM+8MCRBMVQJWFdUUh4Bgt2ntOeuzXBG7e
	XoVCj4ezXMWJUaqpIjT8QLqaaDvsQhlKcX39d6kZS3nwKTg6eSMi+tsBslLYy5y+J2wIpB8WewF
	q2BRHvCMjelCCsNVyme8Ebnhf4Yub795TJGbErH1m6FXbn9cEWL7ulXgwG88h1Nk45QDGXBJ7wV
	U5cEU3XmcoX/uRPZLvicaCEAC7eS4pJv+uIJ0qDcCjETMBMTRJ1m8z9/8FmmTsQC4oeWwwgm4TK
	V4URdT9iw6ORfID0r5JalCQeK0uH0yNTVaj1e9q+bTABDjBeBKO0mXqrr2df4SiNu2CXPVV9zh2
	4Z8i4rFNopCTIIvBvlmVPIf+OIv1qyVFdwC+7R
X-Received: by 2002:a05:6102:5e82:b0:73a:128c:4e3d with SMTP id
 ada2fe7eead31-75b22b6375cmr7983333137.8.1785775535469; Mon, 03 Aug 2026
 09:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com> <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
In-Reply-To: <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:45:23 -0600
X-Gm-Features: AUfX_myHhqSCOlS18NU3-rnIJB_yJDCs5Z0LNUdIv6o7tNasY8YkhUjPJd2Ilvs
Message-ID: <CADvTj4pfNFVGrQV86T7X+nZQYUamxEYLLWuxVXk=av0da_XocQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_094537_069891_3AAA8902 
X-CRM114-Status: GOOD (  15.00  )
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

On Mon, Aug 3, 2026 at 7:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +            ethernet-phy-control {
> > +                compatible =3D "x-powers,ac200-ephy-ctl";
> > +                nvmem-cells =3D <&ephy_calibration>;
> > +                nvmem-cell-names =3D "calibration";
> > +                phy-mode =3D "rmii";
> > +            };
>
> What do you mean by an ethernet PHY control?
>
> I assume this is not an actual Ethernet PHY, but some control logic
> around it? Where is the ethernet PHY itself?

Correct, this is not the Ethernet PHY itself. It is the package-specific
sideband control block that must be configured before the normal Clause 22
PHY registers become usable. For AC200, this control block is accessed
through the parent AC200 I2C regmap. For AC300, the equivalent control bloc=
k
is accessed through a separate non-PHY Clause 22 address.

The actual Ethernet PHY is a separate device on the MAC's MDIO bus. The
shared PHY driver for that device is added in patch 16:

https://lore.kernel.org/linux-sunxi/20260802-submit-acx00-of-dynamic-v1-v1-=
16-0a53cd9e21cc@gmail.com/

The later board DTS patches instantiate it as an ethernet-phy node beneath
the MAC's MDIO bus and reference the appropriate sideband control provider.

>
>        Andrew


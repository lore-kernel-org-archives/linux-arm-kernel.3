Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E5C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=; b=RYsI3rM/vaF3cGOuOqmrgTIRW4
	aI0JPy6p+UJGWrd6n5CXAuDJx+3L1Yn01LCm6xv1vCeuvqFGvZ7+jj1Us00d9dw0WRdKQKg62ciL4
	J3OS7pIitASdjc05StMyju/IH+0KwsjMgHQDIzW/joi9ED9r+Kky2VS4qhktq4Q0zDA19mNNA+SDQ
	JoOJAzTl1NDMTwmbyWziU3N/zBVegW23x15SaoAD0kZpzVISVt6JZUxXgE7mhgYR7URPL+eCJ36l/
	WFfKtcufvEdwpWC4+EygI5Pkpc98ogdOFw6eY07i2rQ+JWinPJ5hrN5rcnhDkKvcaMR1/OR3GGla4
	iEjzfIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0Ix-00000000YDf-3wY8;
	Mon, 03 Aug 2026 21:34:39 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0Iv-00000000YCt-0W0Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 21:34:38 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-966e7380109so2017427241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 14:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785792876; cv=none;
        d=google.com; s=arc-20260327;
        b=RO7IG2Y/UG+mE6ZWjZHMvZdyyb+czDY8RagWXjX7HxfliN30QwopL1kpGJ4SG88/v1
         Ej1X05OXTpg/+2EwGi62d2vm1lmF2uW7uNdUz3D8Em9DCSFg2TztcLH5u+fiJp57BZxs
         KGVThIA4NeI7ohRSuXWwsbTq6I0YmzH0MsdHzUUjQHurMOHggxjtVIB/NgONOyLNG4sq
         QyKiE7x3+ZVMbhruxO8bZYIV8/sDGLDH3O1S38ik81IQeQMrL9fX/RvinqXMCWNO0+TC
         oxqD0SDfWY14YC+IMjGehhkcPpDegoZgkpUb0JvAepKPacq0EqHBy/h3X4sn6YuvWtvv
         0qmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        fh=4uSo6oUBsDAdgxaPbg1OxEusv2wdIsBaqlPd7vJuIQI=;
        b=ZnRbk03kHukG1wA0W4oI8pzz8OAmzmS0ik5Oar7oNdm+SKQbXY+qLuyMloe8VBjdJf
         pBIF6VhdezgdIJ0LVS1lk7+hbznJc8iqEjgpvLlNyWTFIm7uWPg6ZBO20C5ENyFXqkrK
         o9Ln0HLzhGshmBT2DHxRbwDgOLWJOyHM3FQt+u9qSEDjVg2B9PvxirwFDHiB6K7FGiHv
         IEbzsh55HBDOj+PjGWKzV5soxiA5X7C0qy5OKtoyjWJjfV5dF7BshmL3knVqXbiJCo/S
         Vh50BzVtSl7RdyiI8ryB+Umj3yQtJhRQB52OOQY9FbEbtELuZPnInAQrY+8S66BlBbPV
         0+xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785792876; x=1786397676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=Uwv0dOgH6JtLXftr6XTMdfrrtzdSLFpZPHVC51afVywOcrUTsymUdHMlFRhMmLRGV4
         hoIJRlz1ZX60L7qMc9h/hY7//DU4rFoVOafhwf0As6USpK3ACDFMMh9lfb8FGg1AEK+t
         NWRYVy3Ym/kJ1LBfcymj6E1jydMP5j4ZY1HeJVsdJazCAz4bruqa3J4W1VU9UsN19FTs
         Rv3gWgacW57l45Yz5xc2a0/QA9mqVO4UGyM4NvygcJ9BT7yj/lMjrpp5QSAsZbrwlJGB
         Yzb21XHoVLyvyqeGt0FJbG0zWvqQchM8W8k1/TiQbcMmNQ6qP0T7QUt9Y7iCGnP8z49G
         UtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785792876; x=1786397676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=KYobG/Z0oiLDF5sckNzjexfeJBKI1LLiYcIH0lzvOBZczb4dwXBEyfN31UXqCdZwQR
         XDzjq+wxg8uvqpE31iKypzORRkBoVbzu+dPklfB+qXXfHefpIYPTMEogcb3dsv6y+a76
         Rd/WgbifIVnjBV8rBqiwV7ZRwm5up9BmFBlEURn64QFmMRGLaEwoAtcIZNb+9TdAhopA
         FTipGqkv2tAq4ySoq2l9auYT6SUCx1a8O/VBLrLHWhVVA1q2EOluUjRK42PU3SImUSFh
         DNdTxvY/OpN4z8XIoVSoyKf2z68XYk+8FoyhrWxpdR001mdwSvNwkOaL3ziACgMJqIA5
         gyog==
X-Forwarded-Encrypted: i=1; AHgh+Rp/IpZyPZctMbkTMdkixPV7m5gc4kAw++JeFWMZLJpC5fFiAX4T+32JY2qvqKibroWNhp+oX4R4V5maZahC+CLn@lists.infradead.org
X-Gm-Message-State: AOJu0YxrFmF+YNGdOBBlk8hYT4hnI4tG8lm4TIyOSTgJR+R+4m04Kclb
	bbnE71bO9kKZKR9Dfk8HIxw8XRcxCGWBQC3H/sub52cNh7wtMAZA7/zKvQrYk+SqCUPnEl3rF1M
	nNNQipbk6t+b/bsU290FEufGkjGXX+5A=
X-Gm-Gg: AR+sD13i8jHB/qpMiISFnnKEQQXjkeNSmuZ0bz0/441sNUI2Y9u0lMyvegMRRm5BmeO
	8bNoiQc8yFrlUhvAMYoGid85kvmmZgmnN+qEhjvZgvzE9X8i2seKHvEzKMjXlHadpSvF74om28p
	KEg7f8gt19xm2io7V1m4VMgBfwUzDgVRaMelVGViQkDNqZ93hA/+SGym46Fkwk6Dl/rvYLeem6s
	V/oK0tAxm4ipoZDYlCzLw2Qwh+xVAJi3+JAl6Kddcw9VWfgLHKdJ65bv0LcM4JMH23bcunLWPyk
	SNPoRAWlTDKdKiLlS8OIq/buqPVYdVlM8qsoQqEeZ7FTd9dlyfqeILVRmJiitcsoUqQK86966rz
	lGCnUwHNG6vA6OT3GwbuSYtPFgZLiVzJpDvD/5IB0UvXHFfgg/VFbUVwoJ7A3sJi/IVDvJdeWUl
	lHLtf1OMNSbHo2GQPHZPXXnDz9jIwUxapScl0goE3ObjSyojc=
X-Received: by 2002:a05:6102:c08:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-75b2196451emr9291357137.1.1785792875669; Mon, 03 Aug 2026
 14:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
In-Reply-To: <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 15:34:23 -0600
X-Gm-Features: AUfX_mz0nFlKIv_Mdqu5KdrEqoS_kIvG6t--sSCBfp69bBMk1YT6VypHPp03QP4
Message-ID: <CADvTj4rjXGgF2d9Xm6TmeS2LwaM+O2wFFH=rGLA32y+aMk2KOg@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_143437_213866_1AEB6B33 
X-CRM114-Status: GOOD (  15.55  )
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

On Mon, Aug 3, 2026 at 2:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 09:54, James Hilliard wrote:
> > On Mon, Aug 3, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 03/08/2026 07:14, James Hilliard wrote:
> >>> The AC200 is an I2C-controlled mixed-signal companion IC containing
> >>> audio, video, RTC and Fast Ethernet PHY functions.
> >>
> >> This fails when applied, because you did not explain the
> >> dependencies/merging of this patchset.
> >>
> >> This is THE MOST important information of cover letter. The first thin=
g
> >> to explain.
> >
> > I did mention in the cover letter that the pwm series is a dependency:
> > https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@boot=
lin.com/
>
> Apply this patch and test.
>

How were you applying the series?

I noticed sashiko was also failing to apply the series:
https://sashiko.dev/#/patchset/20260802-submit-acx00-of-dynamic-v1-v1-0-0a5=
3cd9e21cc%40gmail.com

But that appeared to be due to sashiko missing dependency resolution,
I went ahead and created a PR that should hopefully fix that:
https://github.com/sashiko-dev/sashiko/pull/389


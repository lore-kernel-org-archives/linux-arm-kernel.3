Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B29CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=; b=4xPzSC4YKnhkH2iyrXMPX2zGGR
	iNZexxQfvu4d7rB3s5W3rKROHoa9WGUazzjlPrAGQ04O5mybAYsvqgYXb4drdt1OKSndTikKH3G8h
	R3eEzX+JEubPMXmkpU+X5arLUThejkM4aEeH7tn1OdAYrbRNhSnTHnPvNI1H24nL99VdBnJTMFFbS
	Jyj5KHpMg+kY0AQlxaznCcee8L0IwlW17D5ANd3NptiL6gP0aebvMZdfMEzLD7M+YCaPtKOjzaQZf
	PADUMElyjSjpG6C92ojhCOURwNxajsZFxKIy1BYj0kcUih4g8JOOFMtuISEdpG/4AkiYYsFw+yezp
	IGvcKmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuxt-0000000FAPU-3njN;
	Mon, 18 May 2026 10:12:49 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuxr-0000000FAOm-1AEY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:12:48 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0046078so18446605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099165; x=1779703965; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
        b=Rp7Q1X1vOEm2eb63GHJUqr46YYtrdeA4Bv/EAMVOBGmZq6uzAZpyi+pUeo3jNLzUYW
         bpmKe83/31NcywDH4U+AnH418AbgAkSi30f/zTGiWgGJLKAl7liYZ3OA88aP004oi3do
         tOlt6B9VH8l5CNn+fLYl4p8cC/0NBjiyBrRIctIB5Uc3i+L3pGpEIRwh7DAY12Wr58lp
         mYuLgGIeu14GLRnyEvqI8oT6c8mZ34UqT6us0c/ugDlpnBgnVSGRsCclOIivt2xMSYbN
         0l+GqsAzIIIpocsFBauK980dXczCEShWtLTXnr1MNoygAQYJQaROZY1J5w87Z77yAU4n
         XlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099165; x=1779703965;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
        b=X/54d56Bty58tcTCBI5wK3D/utDhUXasbskcEqRwcxZvlwOYEYMDtz12czlzQ4Fkga
         dyCr7mLlgEUOhxfrrTB4k7cBnCHSIzd5/5yRo0VW68yBJp+ZnV0K7goTK7hfNebWQp4J
         IAunIIhZrlDtcvGwx8nv7Wr+ss1dIb1RQoYzIqmhPmRw8C8uPJdyDT8ip1HxAnyyS9h1
         SWp3IJ+n6rUBqe90jOVKBuQBS8zWNr0w929Ne0Z04axt92Cu77D3V8SAEYgIjSlwtz6P
         /RN18NELvSbVtsD/v2C51kWjYbyeahjapWva3HHeysAzk6tF0iN0oO2C82+KbHY+JOJ5
         zntw==
X-Forwarded-Encrypted: i=1; AFNElJ+LlFt5IhzUEu3PGRdIIEiLfwBtVcgV3xvd8GXk5bDglMTeLSYimhifi3c+gGtgNwQTBEQ1PO9ZOv7D8hEbJew8@lists.infradead.org
X-Gm-Message-State: AOJu0YyCoFW2DJza4iS3NeYLYQbtGUOdKt6iCwgCdWcixHohS0ZS/KUY
	NLlijnC4g7lzoVY2xw02Z2Nsv16mkqAQNc+vglirUwJ+RV7b7eRYp4y+
X-Gm-Gg: Acq92OGiwyC0+dytOABtGr1Uph5Hxjg6Aemo0sveoYDnnRwZCW8/rhGu8p0GdX3ATLf
	uWslDo9aFl2rJ0sWAeSbthACDbTXYcZIc6OdW5p3Vy3iYW+kMlaBc5qTIMcii+W5sqhx3nyRb4O
	oL9k4Twg9nItjysum/NPfKkNeANGXKp0ymErLZs2w/pim1cWVjnPJZJGDDGNZh+l/4jGbw6fPmd
	R2fepv8vi25nxFt3xMgjl9H5ddbkMb4TWD5ZhhJih9yAXDOydP+ezUXuLGK/IoUCM4a1U1fngVt
	z8gjy6fkoryAC4a7IuwbEqd01Gqofjk7r+SyaBZ2moGJCqahXVVPIllnXYRxVluvh0Meu0Defam
	C1g/PnyePWytsHMdiHsMnKrwZTqrqP9hCx+TrssxwpCDCk436AtrjGfzoH6hVNRuzkXI9PlAqbL
	wxDujdzqjGClAH8J/Z+dSGmF6eX5xlN2s/bN2aIo/d3EC24oDijvHlHHF+E15Ba9+jrZ4riAdEv
	Xs=
X-Received: by 2002:a05:600c:1d99:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48fe631389bmr204052725e9.26.1779099164795;
        Mon, 18 May 2026 03:12:44 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab52a6sm242649805e9.10.2026.05.18.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:12:44 -0700 (PDT)
Message-ID: <58e882977f7b4297e67d785467ec681c43ce3606.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 12:12:43 +0200
In-Reply-To: <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_031247_404390_6990B742 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Checn-Yu,

thanks for the review!

On Mon, 2026-05-18 at 11:30 +0800, Chen-Yu Tsai wrote:
> > > And you should provide a top level 5V regulator here, to be the root =
of
> > > the regulator tree. Look at reg_vcc5v in the Liontron .dts.
> >=20
> > It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" reg=
ulator.
> > It seems to be only used for reg_usb1_vbus, while HelperBoard A133 does=
n't
> > have USB power control. The second issue with Helper/Core split is that
> > all PMIC story is inside Core board which has 5V input rail, while Help=
erBoard
> > around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
> > putting it in the DT would introduce wierd dependency of the core to th=
e
> > HelperBoard which carries it. Do you think it would make sense?
>=20
> In that case I would probably put a 5v "fake root" regulator in the core
> dtsi. And in combined dts, I'd then add the 12v "real root", and use that
> as the supply for the 5v fake root.
>=20
> Does that make sense?

"core" board has some battery management schematics, switching the 5V,
I'll look into specifying this part in "core" .dtsi, maybe it will result
in some kind of regulator in "core" part. I'll send v4.

--=20
Alexander Sverdlin.


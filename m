Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BFBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzpV9AN34TI6kAQfSgmCAMHhHbvNRBBzplgVftxgPoc=; b=vobWuEPQB3YuxyKnUuy4NPDNJj
	y7Iw3mPNsMrP31S5fEeGzllOOT4DE1DXuBJIvdz4Rw+NryA4QT9vYpi0gW8S3ymF35kPsW4/rATY2
	/XD6YTs2csKJ6Sl91BmwOm3ZvRtNfTtEJDzHZ1BMV4mtKnGbknjtV+L2m3JJTeZq7ofTfosEH/LYb
	atsX4r4JxIBois259HQXZPO6RRAjPDap11ntjQLsKWN3cTLww9tQx/VXMPAJtmp0QfuYZlEvRpP+j
	FhM3C5xWFquolHv9Txr2Ax6YkVJUiKFDuR5+WsPwqIsWO5Ikz+PeOFWumfGxGSKNg0WVaJYxgpR8k
	S1mxxYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfSp-00000009XcZ-082r;
	Mon, 26 May 2025 21:34:31 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfQd-00000009XUW-39O9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 21:32:17 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-528ce9731dbso567755e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748295134; x=1748899934; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzpV9AN34TI6kAQfSgmCAMHhHbvNRBBzplgVftxgPoc=;
        b=NI1SvGG08Mtz7GreCbl7bKf4SyZxJvS2K3nrZgSRpyT2Ul80OwkRmNhboSYCbeiRdq
         0HOYxM4/F+uKge866V4JmmTsjEgvJPNIrRNDeNNc0+/R8uzZcevkVMybdDx0/vFA08IN
         Rfu0bOXdlifaSWfolbcEWQoXM92EZrNnTaOhq1iONwEMVjDZPlPCZ+uO/Vyq9vqoRlFb
         S5tL++RzPNkB35oMaWfHceOmdbAB1qk0YSKKbMefoYUKlUfmav57glzUHxCjXlImbhD9
         f6Fg8Q+UUHgHt/h2V0jnV6N+mWfHthfGn+Bfn1ac6Me2C8pG3wzaU1cXiTYd968x2LCg
         47cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748295134; x=1748899934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzpV9AN34TI6kAQfSgmCAMHhHbvNRBBzplgVftxgPoc=;
        b=ns0PZfUv2u8IatFyDKXurzvyN/7spi5+5ZUxfCb5o++I/DlaCi3eztTzDNAWriWo6R
         PnTz21uogyqLComGBefmKVsIPi7j/3lTTQf8hvlRVJStmhrSWqJ7GSEpMh8ktzA+MwGR
         vUsEcjz+7tFR/fEKY6MzXXWFK0l46bgVPjCjINpk91eSlUP0Mj4BpmXBWfXSRUGAYEIi
         M4h52No3rSTWzl68fIEivocYZGDJ1ev2fHa2RZiz0a0fnCOeSj3qbNl2py8xjX+UZ6Qh
         13ICLpJkTaL0bU9SEyu77AncPxhKHXE5OiX5A6dq3IofS21ogLZnM6TJ6F5TX73oOwfs
         MCRw==
X-Forwarded-Encrypted: i=1; AJvYcCV/KAtEu9/kFmmuOeRUD3v8sIJCLcHCRuK6p7wJDAuUEoBmJnV5wNdgUN9g6Ksj5fYL6tQw9uEdi8NGXRErE5/G@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9RVYKlpXyNiZ+1Vw1Vkhhz+iDZb5zXvgq1Yf5Rzhmd6C0gnrb
	KoPpfkdHAyRaQjZvyRuanpFq6seNiWOlzP7m6/HgIJwC7MH52Y83Dw7V2c8wHrei/cKhVk9U52v
	uHUjRZUnGs35OPi5X8+iKO2HvHV+Te6o=
X-Gm-Gg: ASbGncsNx1NF1CiPFidgiP4dsztgZyspYGPLmJ6TwuyRbMdo6sWdHGPUcFpnC4BZExu
	cQp4PqW9pJru5gMy5cwCK3IZrn2bSnxdZszWKpsc8B23Ldbf+o4Rlnjw3rNdmdJUVJ31kG7DKTN
	/Sd1WzJmp5n/l76R7BBSUc2KqqT/eVUxnFew==
X-Google-Smtp-Source: AGHT+IHtZAC8edhOL+psA4G3fkxBszlG+/mcFK1gxSVp7v4PGsINYvWQPIQCRIQn2+sMGuqIUnNiH1ypKvmk5wpNu3w=
X-Received: by 2002:a05:6122:a23:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-52f2c5ab85emr8028797e0c.11.1748295134606; Mon, 26 May 2025
 14:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com> <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
In-Reply-To: <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:32:03 -0600
X-Gm-Features: AX0GCFv9rmZ8vY8FFbnP0lrSecl40feRLs3yqUdAEeCO8w03J4KjSgCY4nGuva0
Message-ID: <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_143215_793728_69F87BBE 
X-CRM114-Status: GOOD (  11.16  )
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

On Mon, May 26, 2025 at 1:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        phy-mode =3D "rgmii";
>
> Does the PCB have extra long clock lines?

I'm not sure, it's a copackaged(maybe on-die is the wrong terminology)
PHY I think so I assume the clock lines are internal, in the device specifi=
c
dts we set something like this on the emac1 node:
allwinner,rx-delay-ps =3D <3100>;
allwinner,tx-delay-ps =3D <700>;

There's some more info here on the AC300:
https://lore.kernel.org/lkml/20200416185758.1388148-1-jernej.skrabec@siol.n=
et/

>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
>         Andrew


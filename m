Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ECECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Z3/EAlh42f53h+nvTTSlQbYtPl2Q5o0tMOhx+bW3BE=; b=mm6IgzS7fSChe3nD/8z2HCoCv3
	JqKp+YAz4Y+Ak2pZlRfJSd7mWiX5QrCNqvG26ouY2muKCm3k9sRFY4uJh5d/AIPHgd/mO2Kl4H2Wo
	1OOeDtrJpwCfkXMrjo/EcB2f4drelMp2Sv9CX86u7EzdDMDcsrlVq0N9Ycv3mKZMbjKPrhuPFOVDh
	VpqQv9/Tj2VTavIIpmqo4a7tdkSFvDthKALV8dmEkjdn7F2P0CGucN4E5rVAosgZ4ynsSxpNtrB/r
	qWbxzIL6TGQR73Bud54nOSknH+DFFcu1KdZ0ujo1gaD5Rdiyy2F+Z/HNZhC6WkDtqmCiQaXhHMpGy
	ktVMyFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXx0Z-0000000AYm2-40Qb;
	Fri, 12 Jun 2026 08:12:55 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXx0W-0000000AYkj-3hKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:12:54 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3967717c951so7790001fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251970; cv=none;
        d=google.com; s=arc-20240605;
        b=c1EGvD0iGyvIr/OwDF6WuNCnp96yAYu07E4NPW7HGaqsBwpbvtd+FY39Shof269lV6
         dYRIFQInjMUViXWZS95PKUq9pX8llcPnKfSvJf4Lhg//Rb99Z7bM7OdTZ39Uw97+2uWr
         EN6M2ntgTKGiKgpmqoFiXCaBKENAngS3Gnamr9iUmRDAZxOSlgJHRwRqFIQ5iQrGjcdi
         bK5vuzGrMfz+vv6v9ktfZnNN4m55cITVa14J+T+3LlHzi8sVG6scjd4euKT/WqRGY8hk
         b9otIBQsxeBxKgXlGyEDPzudS4MKPZtJNbyzNvysaaydyX9FgkT3JMYybiQEdkixvT/w
         wWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Z3/EAlh42f53h+nvTTSlQbYtPl2Q5o0tMOhx+bW3BE=;
        fh=xtmTwGZAdDlzkaBHzDdxczABpx1jsYl/kE06sdlpQHs=;
        b=bBvXG+bKWYWHHuahsGyjJPhnto+0DbiAItusjm5os85rSdQbQiY+UDu2lLoKPuO8I5
         oRCTVDSXbc/Psgf5Hy+LkbM09z1BC/WpQ8PmYmhzbk/kCkiEuF2/YYHLzkL49sbVw9aK
         UbcRYf0iqk7fyG/skDWGaYZfvS8UtbHua7G52RP9qs48iLCUGKdQpFlkhBn4g4hSIIHI
         7eC8QO2L5ySrDCWITNcjfqk6ediyLXXTTqaj9Ew9b2agN0IUYzbcunQEVlKfgONlthRm
         SthFMvTUUoFea7hdJSUEszgPutL+fATwbffmV+Xy4Wj69IQzu/z1E74l3OCmdLr4UeFO
         /uFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781251970; x=1781856770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z3/EAlh42f53h+nvTTSlQbYtPl2Q5o0tMOhx+bW3BE=;
        b=MG1Qh0v60wQtWFgSFVnsNEltIRAK6ilI9TuVbWTzC6j/trKPP0SpRPJTBxjuw0/jH8
         UVR87crgh5HPNylCPk2V+Ss0ps15i9F8jPOIzBf1c94LX7AG5ecRZIxW8NyVDHCNzON/
         M1U8scdVzoNiraJQTw9+QSm2vJj4EhOAE4nQMkut4A6TOhWt/PwqvSsAYlptrahFUvO/
         yhYrHQSq2pZCHAxxiDMdSvwVELdZwa0m3xMhWiOhhij6lpPsm/v2rC3xlV6ietj4d/gV
         5yfVvElWkAC40VlhDfdT7VhLG1oRQ0M0jr05GbGhZkMoYlnBG449aYK96dK3He/ajDOy
         n52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251970; x=1781856770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Z3/EAlh42f53h+nvTTSlQbYtPl2Q5o0tMOhx+bW3BE=;
        b=EOY4oPHCKa/zkAA6R+1XMIOHFb0GchMIMTV4L3Ie1rKSwqU3nO3hUWqzWpY0amH02h
         KJoCXQc180tnly88As3QYjOG/Jg0r0oNRdYIylzA7AncRp4IKXOJGJm2qK0sZtXPTFd4
         h/W7Em7yoR1b3L9YqWJCmZVDfnXZFJOCjG/wV4wdX6kb4UKEbazuueYQ1QrghtRuJzp8
         GoxSPx0uPzqcsZ9Mgtnubfkdt1DQ7Taim1CAo7FYm7EzALGA9twPQ9a5lTZDuGRr/Ju5
         ctHjaVQWyTTONOuEiK9O25MluT7ccbSl4Jdb70y3T5lkPqqIgfUBQgahqkbZFVxkj8dm
         YrgA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ulf7gaWO0SX9ST0txkQBt4JRBFxUNrH7Mdz8scWkgjo21z3KZJQGHA9uIv5jovLOpJzB8zdyiOq9N+ofPfMwF@lists.infradead.org
X-Gm-Message-State: AOJu0YzXvfkk2recw4jyieysbJOnjL43XkcomcbPhju5RWc4sc6MBlsb
	LTcIExZFNItq2dY8ilr6lK5fM9wuztuUS191xXRaCoZzLSnEWlACoYWPmYhMHVmN8WgSKLDAYly
	rZDFK2GouC2fBxAyPPlU0+cITiB11RpI=
X-Gm-Gg: Acq92OF+fdh+fBGTN5kQk/2t8xObQTdq5N3Ti8RiuODhOS6Vjypp9mqXV2CeHUYT9Ln
	2L8NrgbzgUP6VdivltgCACQIY908/H8EP9Bn8l/qAi+44m2/U2u+iDXLY76oXmoGJoeZ3qJpoDa
	DLQpaiQ69MVH+lHykb7W6mJIxsgJ+5tQRqP5cn5cFyhG/zdP58FjQR7j1+QgXkFnStR1qM7tGOQ
	HWGF2fHAuSSRukctaebFzbOPDcECwZfsFxMIQaTYi/MJNF9B4aHRDYkvSkkSaLp4SpwCiL6ZTHT
	pvsqJzTJc1y3ljYLaUE=
X-Received: by 2002:a05:6512:145c:10b0:5aa:7363:8213 with SMTP id
 2adb3069b0e04-5ad2db76980mr402074e87.37.1781251969978; Fri, 12 Jun 2026
 01:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
 <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com>
 <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch> <CAF7HswOi3fPMFppPoGmh0QELiPz4Po4cyWuDrEHLY2vNMyKE9g@mail.gmail.com>
 <1b10c279-bdb7-4901-aa40-bca36dcec350@lunn.ch>
In-Reply-To: <1b10c279-bdb7-4901-aa40-bca36dcec350@lunn.ch>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 12 Jun 2026 16:14:20 +0800
X-Gm-Features: AVVi8CfBJjMCk5Qo7cQ6I-oJ5T38DlsPXXzlWiBBeogKNoobN5MIJBGZk76FcJY
Message-ID: <CAF7HswNkfwjYwYLGZXnpg_ruzpzzmz9Cb8FMJpOGRPZ=5hgHOw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_011252_967629_8CA82B54 
X-CRM114-Status: GOOD (  13.75  )
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

On Fri, Jun 12, 2026 at 3:04=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The EEPROM is physically isolated by a hardware I2C multiplexer.
> > By default, the mux connects the EEPROM directly to the Marvell switch
> > for its routine operation and configuration loading. The BMC's I2C bus =
is
> > physically disconnected from the EEPROM during this time.
>
> I think some comments would be good. It was not clear to my how this
> works.
>
>         Andrew
Hi Andrew,

Understood. I will add a detailed comment block explaining this hardware I2=
C
isolation and the out-of-band update mechanism above the EEPROM node in v8.

Thanks for the review!

Best regards,
Kyle Hsieh


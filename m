Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE76C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 23:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eC03/XuOWxCMaYoNF0Q5x7guuS3v9+l1Cc12aAtnnkA=; b=KhnZa9RrRLvZjoSoSWJ+TNP8Kg
	3IoKQsQEh6hNh4/O32CQjHOeK79Z2JldBtE3TsdukfAyWz7nOt45/clicULVMyd/Y8pUvQKOqFvMD
	WPuDXjpCOquLAOUwFLpXjIWc2bfw3OAa/9NNgo9Kwe+Os6W/F9TdrbuoBrhJwg2YYeq0vlqsMKOOV
	YgJwjc571yFLchhxwBqJcx2o2ZeVVsGsZR4BGgwuKsdo1Hjnhs8+7MG+HINHgqDga0gB4461kANsH
	eEjHZA1hpkDDz/9Nmrne1dbAhfy5tCtVIXMpTRqtuRMXdZnatDg/4tjP5oPwu4JgSlg5M7rXpx5pq
	wjyuo5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJhBv-00000009dCB-2vJW;
	Mon, 26 May 2025 23:25:11 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJh9o-00000009d5m-2wtx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 23:23:01 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-527a2b89a11so924991e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 16:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748301779; x=1748906579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC03/XuOWxCMaYoNF0Q5x7guuS3v9+l1Cc12aAtnnkA=;
        b=UwTTJVAL3wi2xtY2ux1kse0kFjicbZwsdZdiDDDX/e3JJvE4nkYe0vATggnjFGHe1W
         NtVY7NAcqNViTeQ7N9RcmCLqCHgG6bPmnFInDXmJReNS5JhPH0v73AJ++jZ8GJX9y2FL
         lClAcWPd7R5JrgyzEsutbiO5/0Ep7cRjKC3az08rtO+CwGUFwIP6EsWPgecpUVq/wfJs
         aYFr8n40YkCJG1jdetsJUvuyF/jHGaglcezxnRqQSQe/qET7WeJuR5r3YU5L+el2d9HA
         hCe5+Pl2J1fXD3hfXF0fBBheAOhfs1xSJId49X4hZlJOUJSjrOV1PtdwhmaRJaV18cgj
         mzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748301779; x=1748906579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC03/XuOWxCMaYoNF0Q5x7guuS3v9+l1Cc12aAtnnkA=;
        b=oRwjpe8KJeBUfIPl+Sh9zRjhgxVtbu2e9xbrRFFhKLxVk5PgPkn2t+XaXvvdo71UeD
         Ma8Lgj91M/1ZTdtu8ZTKSNLeKDPuACinKo6XUy8Rm1SSJAAMmFN6+1IUtjwoj7LudKWs
         WQHhjcngFLm90YgXIaiF5cmdjCFXm7SBAl6miptnueYI/H8RhkE+42DYEKjjoQ4dOCTk
         fYGYOnrUmo5tfuL2D326uQVN+e+JUlp/KWZmaHemwbRPaP5jTrcSIDUvDwgqMusBxTX6
         iVp5atsMYnWYn83o1437K6Visd+FgblL1RNEaCgNKPzR3WkmxR2muYnOuYZzG6OGZsRj
         uAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiuEC6ac52/cLAlQBvXrcste/v4Iz8zU6q/t57p+EC0oR+P5lYiIcTETygPKqQ2kxLOPQ606LOldyM/uzY49I/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7FCi+4iIVWQDu2SqH+bNS3tqfuivvePyCpD7ebynVGX56jID+
	nTr4jvifrEIUkDS80ALPOqcX//glhQ4iUq5TNCot+w6gM1zrfFLcvJaCRNRNx1TNGZQCNuZM4eq
	u0Q+oPPyaOrMZ8otticNGyl8k5rRd27A=
X-Gm-Gg: ASbGncs//UqIWqEykicsriTOXSDDFSk0ZcPTDmFpuVz5nVJbbFyUmjIGvw8+rJEGoj0
	/J9vf75/HN3NfooQSR8AhwEbA5e6IBACx9Sx2blov5KI07aounZ/+B95rDlzXCtBoIYVL/W1DQ+
	A026ZLJVQjyYHo9JAU7lnHPfnh4pnFNsMEF3NfGOyz3rki
X-Google-Smtp-Source: AGHT+IFzKvKpSlFrb29A+sbxmD83XHx6KY3PDBx92mB2cK4b03AI554D48rVRv1CSb7aDYfIUCfFLjNZtV9qdmUBqQQ=
X-Received: by 2002:a05:6122:900b:b0:52a:cdda:f2a5 with SMTP id
 71dfb90a1353d-52f2c31882emr7542326e0c.0.1748301779382; Mon, 26 May 2025
 16:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com> <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
 <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com> <d4109cc5-83d5-4acd-b0fb-39a50043060b@lunn.ch>
In-Reply-To: <d4109cc5-83d5-4acd-b0fb-39a50043060b@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 17:22:48 -0600
X-Gm-Features: AX0GCFv3GoYFahfXaX4AD29prOBqSMyyUCB0mQcsqn6ElJfHobjLmo9NhUK-PQA
Message-ID: <CADvTj4qdoD-mo7CxNW8VitZf+wXTiZ7m28R4JPQ9kQJGhUH7bA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250526_162300_744135_4748382B 
X-CRM114-Status: GOOD (  35.02  )
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

On Mon, May 26, 2025 at 4:38=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 03:32:03PM -0600, James Hilliard wrote:
> > On Mon, May 26, 2025 at 1:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > +        phy-mode =3D "rgmii";
> > >
> > > Does the PCB have extra long clock lines?
> >
> > I'm not sure, it's a copackaged(maybe on-die is the wrong terminology)
> > PHY I think so I assume the clock lines are internal, in the device spe=
cific
> > dts we set something like this on the emac1 node:
> > allwinner,rx-delay-ps =3D <3100>;
> > allwinner,tx-delay-ps =3D <700>;
>
> Those values are just weird. The RGMII delay should be 2000ps. 3100 is
> way too big, and 700 is way too small.

I think these may not actually be required when using the internal
EPHY's now that I think about it again.

> I think phy-mode =3D "internal" would be better, and just hard code the
> delays either in the MAC or PHY driver.

Hmm, would that make sense even though the MAC driver also
supports external PHY's?

> Thanks for the link to the old thread, which was 5 years
> ago. Hopefully since then, a bit more has been learnt. Quickly reading
> through that thread, i don't think an MFD is not the correct solution.

Well the current patches I've been playing around with for the AC200
phy are pretty similar to those patches still.

Here's a branch that works on both AC200/AC300 but only if I do
the PHY initialization in u-boot:
https://github.com/jameshilliard/linux-h616/commits/acx00

> In the last 5 years we have had to deal with more chicken/egg problems
> with PHYs. It has now become pretty much standard practice to put the
> ID values in DT, to get the driver probed when the device does not
> respond on the bus.

This is what I'm doing right? I mean I'm putting the phy ID in the
DT for both the AC200 and AC300. When doing the reset driver
for say the AC200 I would wire that up to only the AC200 phy
node and not the AC300 node(since the AC300 reset is MDIO
based while the AC200 is i2c based).

> The DT node can then use phandles to the reset and
> clock controller to configure them as needed, the core will probably
> do that. I2C is a bit messier, you probably want a phandle pointing to
> the i2c_adapter, so you can use i2c_transfer() on it in the probe()
> function.

Without a MFD or some other node that exposes a reset I'm a bit
confused about what driver would actually issue the reset.

Yeah, we need a phandle to the i2c_adapter, but since the resets
would be under the AC200 PHY node I assume there would need
to be some sort of intermediary driver implementing the i2c reset
right?


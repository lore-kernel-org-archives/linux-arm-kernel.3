Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17589EDF150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 10:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+T4GI3Ari/F68CoDGesyTms8wzhDFFZmgjFqbgJPCOE=; b=B23TYpy3z3yZ4ROVcZ8TS7sIhP
	OLfkSvcQ4oEH6RArD5PJMHSOehXEf7RuTsFC7KO5HzBXP02aj/BlhX7Lf5sqEKxuMIzalFmE1P21Q
	BuH+rBnqq0kF2502sLR1cxGlBEcImEcOXjOUAa5fAHB1PoUc92rZAFJKzSFb2AZG/aNbSM7unEWEp
	SwZlsTMSTjrtSwCdbTmuXEc4yodWMO8qiG12wnJWyhlp0p6aa0c8pC+Yc7rdKtMEg8KggBeWewiIx
	ev3QFkMgdLBlHe4kBm/U38qu9bq7wEyRBdxIlD94uerjs9zOj/eeXzAY6nl0UpneN9VkAoYcnIh29
	u9jgS4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqtE-00000003Lvo-2y9H;
	Fri, 13 Feb 2026 10:59:12 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqtC-00000003LvH-0cWw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 10:59:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59de66fda55so855972e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 02:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980348; x=1771585148; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+T4GI3Ari/F68CoDGesyTms8wzhDFFZmgjFqbgJPCOE=;
        b=PQU/wdXE+/HxZH9bS9VKOaaJUM6Fd/1E7PYf0bxeKbQdgYuulspJlgS+TDP7m37Xs5
         Pn70IRAilEHPKq9K92LtSWhIiRJn2wQ7WEX1AxzTUq0gU80vk9svpXPRO7D3+k3WahxI
         pzfomPNZaSViSwR7qCwP3lUeHg0kuoBxQPJD/xatQVuY+ZDZkwM0aVSGgSM+R5hppITE
         2gYYmypi9w+T30kjJDeGNN+XaghO1auT0h8uJEMnoVCIxDLDgweJxhmAXkeC0dgKu9pa
         3eHqp3R1sVOvB6uN8BQ/Li2WUFzpdVmDNrRwImO/zlsl29NPex8Ztd4dsaIw9/135HpZ
         bJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980348; x=1771585148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+T4GI3Ari/F68CoDGesyTms8wzhDFFZmgjFqbgJPCOE=;
        b=eEpcrJIZpOdoy5q1YRGYktdMPeL5WbUpvoin8uKnUDiqmPeJ5z227AboC4zEH3F8I+
         pihaScTNshb1EFbGFgq5cySkWrknoLu7rXf3UvAm8YTkS2egCSHoS7G4oVyIWnNHOSjw
         nl53H8RchiJCFbZc2zBn2odJ29HcfKpA1JIM/nOe5A6YxskRYNw/xITuG3avK43kDx7z
         9LUX3W1mucj1Ee10/MbsghKEQVbmRLu7dp80ZJ68Gs7Lx85k2Qr/RmWNtjdbz7sHYHpf
         nXqexwqC9N6k9cHgxv7lhbwx595tkLb3kFTlvIXpr3HZ31FdSH2h2YDqzPeP7Wy+Y24O
         mhtA==
X-Forwarded-Encrypted: i=1; AJvYcCWRad+GZ5y2BcJTeZmaK+Z6c1S9TswBvBUHTkFXjm55QB8sdSIUN731cy1wTP0bb2t4JA/n2H4/akDrUNb+U3QK@lists.infradead.org
X-Gm-Message-State: AOJu0YyejZN1bnsM1mH94ry5FQXW+/t2r/xtj7MOFmnwC6U4yrbyRKxm
	x3qG5tgF+NqlOzBXgusvpS2cFcO/L4JiMNz4gclrd9eyFbqY5ELclEcs
X-Gm-Gg: AZuq6aL2nKv/ErUs2nAJISeC8M1z58We33a1FmATkv1l1dKKXPnyHriQZ97LJD2uUC2
	UzASzxobqkZgUXwOxtYfJ4M7i2QM3fCVryaDnso7XlGlybUq1aSqHq/GHB0EgX1aSjh+mR/ehSp
	ERcB0ZFSHdVxTCDAz9qhgelpXS3rXNAhe4v9zK0Q6pfN5y82jV/496sC4yDi8JJOggK4EB3+yRa
	jT5a95U+/N/fP863W4Kb0vJhTgFC8dKpkoQvYw0i0jCzua+uVyDLoFhzeH2o/0V3K1zIq9ewN22
	ejcQpM5MTXIpEj7eXpGv54DIVWg3l8O2gHO5U7w6bwMYTPI5d8ARRSEspVMrw3Dg7t3nQdeYCb6
	gv0+m7g1cDx5RR93q8Rx520A6kUELOPN2S0ImtboIfpXIQXSSUezBfbMoNZQGZ5O10bGM6rHKsv
	WeYZG+m3qHoxYNPfJOjNMzticamTBY3xZA58H1HHyF5kIxEsLoDNbGG5QpnxFXW38JJ2nSkEE=
X-Received: by 2002:a05:6512:3a82:b0:59e:44fd:8066 with SMTP id 2adb3069b0e04-59f69c5bb66mr598242e87.33.1770980347610;
        Fri, 13 Feb 2026 02:59:07 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5ad79bsm1495543e87.70.2026.02.13.02.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 02:59:06 -0800 (PST)
Date: Fri, 13 Feb 2026 11:59:05 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aY8D-UJnmmGUl3lr@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
 <20260128-i2c-mux-v4-2-dee49ce276c0@gmail.com>
 <2ecbebd8-0842-34fa-a593-25168c91aa6b@axentia.se>
 <aY5KeH3Z1S3MswHI@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aY5KeH3Z1S3MswHI@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_025910_207278_977B9968 
X-CRM114-Status: GOOD (  25.98  )
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

Hi Peter,

On Thu, Feb 12, 2026 at 10:47:36PM +0100, Marcus Folkesson wrote:
> Hi Peter!
>=20
> Thank you so much for your thoughs!
>=20
> On Thu, Feb 12, 2026 at 04:02:16PM +0100, Peter Rosin wrote:
> > Hi!
> >=20
>=20
> [...]
>=20
> > > +static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
> > > +{
> > > +	struct i2c_mux_priv *priv =3D adap->algo_data;
> > > +	struct i2c_mux_core *muxc =3D priv->muxc;
> > > +	struct i2c_adapter *parent =3D muxc->parent;
> > > +	struct i2c_adapter *root;
> > > +	int ret;
> > > +
> > > +	if (priv->adap.clock_hz && priv->adap.clock_hz !=3D parent->clock_h=
z) {
> > > +		root =3D i2c_root_adapter(&adap->dev);
> > > +
> > > +		/* if we are parent-locked and the root adapter is our parent,
> > > +		 * we already have the lock we need. Otherwise take the bus lock f=
or the root
> > > +		 * adapter before changing bus clock.
> > > +		 */
> >=20
> > The assumptions made for the "otherwise" case is wrong, I think.
>=20
> I think you are right.
>=20
> > Consider e.g. the case where we are parent-locket, our parent is
> > another parent-locked mux and our grand-parent is the root adapter.
> > In that case we also have all the locks we need. Trying to grab
> > them again will be a deadlock.
> >=20
> > The more correct approach is to do the parent walk in search of
> > the first ancestor mux that is not parent-locked and then call
>=20
> Hrm, does it not apply for all mutex-locked ancestors?
>=20
> Consider the following chain:
> Root - P1 - M1 - M2 - P2 - D1
>=20
> P - Parent locked
> M - Mux locked
> D - Device
>=20
> In this case we need to lock both M1 and M2, not just M2 ?
> I'm not completely sure though, I need to refresh myself on the code
> base.

Okay, after a good night's sleep, I think it should lock not the first
but topmost not parent-locked mux only, IOW, M1 in the example above.
Then the locking would be propageted up to the root adapter.

I will send out a v5 for this soon.

Best regards,
Marcus Folkesson


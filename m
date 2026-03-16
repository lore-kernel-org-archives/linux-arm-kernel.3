Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E23F53D81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtNqYoU+2H2cM7UyoKExEBfiqQZsN1aAAmOPkoFbFyg=; b=RybuRgC/li4Lue7mGhtI5E9TWE
	rIsLCbvUQP1ZnyDJq6qr0Pl0KPfr2pMdCPwhxnZZOztAAQNIMXCJZLXYsOzy3CaiO7w0l+qOTbi2F
	MA082t4AvXez68xdZ0yC1ICuFfgXTXccYI5AlPYnrIxAX5qGJXYBYS3MSmkb2+ALfDjC2Tmgq6gAT
	dRfVpfB5YhwNOytDH+5N2n3Rnk6oQNStu/H5j3yI6LYpRxrQsulM5qFoW2k4o5mORK8hfOGT+B6lY
	8XsG0f/46SHRyhGNE43tjqFntfCyfrYc+aGQ/cYpf4EmtyRAwZ7xTVMY8m1n0FNVtDj9C4CmS6qz8
	7PQHtRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BwK-00000004b9R-226J;
	Mon, 16 Mar 2026 17:41:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BwJ-00000004b91-0egt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jtNqYoU+2H2cM7UyoKExEBfiqQZsN1aAAmOPkoFbFyg=; b=l33S42S+jGqU/1lyA8aFtV4chc
	ESwvAC6B3IvbObwbwFHjg4bhh2XZflkeOMfgN670B6gcCGRHktlwTyB3LFkaPE/UmilYHp3LD6Amh
	xYyYBpx012RDsUzf7/gqfyPAcudyTXEcNKTwhmVnbXNpa1TURzfdzWtfr50QKKjCtngjgGUdByvDg
	ky+we1gFZ1g3l0doIIHl2k/OFpb5ftrFKQRUC4gOgYguE7RQanp1rh17z57XRjOUH2IfoxlKqJM+F
	QeDoZy7kFVgCBdiLYqn7xu4Ww50vXsSbR5R4P42nO1w6IilyTMD9eztwM9BpiLpQ7G+rmxP2ICTyz
	YmfJDD8A==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BwG-00000007Mj6-0sHr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:41:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48539d21b76so34578965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773682870; x=1774287670; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jtNqYoU+2H2cM7UyoKExEBfiqQZsN1aAAmOPkoFbFyg=;
        b=YZT3KySf6fwsG3AlrxiTeRDUOZ1wwSBX/vk9Ls3sG+OK4M9Q/9dxSX8lfP8h1zg1aI
         GxqGO860mk+g/nXCaUjmoE2+1w8f0W1+2U3QUIXHrR95JWf9+UsbURV6i8gVOFUmCooL
         hDv9Jyy/+MyJ36D1CKfX9uoRZoq+QY6U9+wwIKZ6tu18rP5dwK6SYYkVvGAJiB1KYv/y
         0PWFfxhRo5EggtUaev6RcaRupKkRhgGHV/qDPNYdEyhUTZg+EJhpE98qrQkG+wS0jQNw
         eVz7sCAqSJ7OTwwcbtWUNSX70TgepczwyJ2mJoA7VgWaRhTpAXDiddo2TIjuBK4LXZJl
         n/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682870; x=1774287670;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtNqYoU+2H2cM7UyoKExEBfiqQZsN1aAAmOPkoFbFyg=;
        b=PMkwaRlJ6CA8zmunhkZhPPlJ/WZDf0/PI1qGEhXBSKVCxWmb48lqGELd6JCLJ8UvhS
         ybNToNNFr08nmDr05B0X7SJ7Eyw0Mia/dHxYrC/o9uJwPZDqRFiYxXvROOrO/WkrzUUc
         0LOD+7K2Yo49xVxwQ/Vy3DzuNIdn4nen1rw8zz+lBVcGT1ho281CDmdtXJ1sggRLxLTl
         gY5p2e+34YJrbmeCAYT27cIt+a4oBE4BEFxoaTq0kjLXDrQph7ZzpWVXSHpsMONgo1Rd
         5mQB7l4/gRCSnfS735uJTG6wRS3H/CUXFnyChGnngCrE/tpJvXy8ISrZMNkVSCOlgA8P
         UNlA==
X-Forwarded-Encrypted: i=1; AJvYcCV8y9MWWt4vRAfhrafxPeV8ZZick8mRuG6EhRcaboAvafJ1X+j+JXu+5xvPRs9TprOJL8cPZEMCfGOnqo1j1arf@lists.infradead.org
X-Gm-Message-State: AOJu0YxGuqAm0WzBSJ6zmCbVtRRVElQGJg8ZGsIRCxPU0FJwBgfxqwcL
	uAMRPPP1idjxfoTwsycs7/Uflkm+9vNrMwpPrtoY4ziLPObSXmlXIUDc
X-Gm-Gg: ATEYQzw/EEaXhFA1X6pCMFgbWvohZ3mJFSaWjgOtBGvJmr3fCwGp9U9NJaK9zK2Kc57
	qup7rFsbOzjow4W6Zmq1HHIVtaS4MjluuVPqLLc2KlsM4oDMZh3iHI3EgBgK8egY24HS2WJdQ7Q
	yNPPoxPo2RoPQ09TJMtEQvRietVpm9fBgJBm9wYay06Ytk9gk2110qUtpNEYmQfbiBA8+c5wNLR
	dkOCbgxJk0JOEmj3h94yVqwABKXSqS2oiT83F1CXCmpAmloau+r7ArLGbgcIeJ9uRFjzaQ62bft
	t8x34uXrRbK2TpRyJvJw0G5LpUPtnhbkcKU+Pe2JCkPk+lmp4Izbn9y8h7pp/nwqcNztiy9sAJm
	U4ERGaEIojiYn/muPyMCJn6E8HggL24i336vKksHyj3Dkljsnj+sUBQccdRSTkhGktuHkrUJhEo
	7iwdBnSR1aEjn2VBwlNStMJQw+MWX1Mb0IkEUaYd2eb4/G13q6n0PzfOK26bUKXgU1pjFUsWrA+
	3A+hkw=
X-Received: by 2002:a05:600c:c0d1:20b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-485570ce1cfmr171983085e9.4.1773682869870;
        Mon, 16 Mar 2026 10:41:09 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856e850634sm14960175e9.0.2026.03.16.10.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:41:09 -0700 (PDT)
Message-ID: <50002e822278e6474dfd1ea37f22aad1c27003cd.camel@gmail.com>
Subject: Re: tps65219/am62p kernel oops
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, Francesco Dolcini
	 <francesco@dolcini.it>
Cc: Andreas Kemnade <andreas@kemnade.info>, Jerome Neanne
 <jneanne@baylibre.com>,  Nishanth Menon	 <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Mar 2026 18:41:31 +0100
In-Reply-To: <d6de7066-a802-41fc-bb10-2f5d248743db@ti.com>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
	 <20250429185240.6a7644bf@akair> <20250430080109.GA65078@francesco-nb>
	 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
	 <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
	 <20251209134343.GA238880@francesco-nb>
	 <d6de7066-a802-41fc-bb10-2f5d248743db@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_174112_303459_777F697F 
X-CRM114-Status: GOOD (  27.20  )
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

Hi Shree,

On Tue, 2025-12-09 at 12:16 -0600, Shree Ramamoorthy wrote:
> > > > > > > while working on adding support in mainline for a new board b=
ased on TI
> > > > > > > AM62P SoC I noticed the following Kernel Oops.
> > > > > > >=20
> > > > > > > This oops was reproduced running current Linux
> > > > > > > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea=
, but I was able
> > > > > > > to reproduce the same with 6.14.4.
> > > > > > >=20
> > > > > > [...]
> > > > > > > [=C2=A0 +0.000022] Call trace:
> > > > > > > [=C2=A0 +0.000011]=C2=A0 regulator_notifier_call_chain+0x20/0=
xa4 (P)
> > > > > > > [=C2=A0 +0.000018]=C2=A0 tps65219_regulator_irq_handler+0x34/=
0x80
> > > > > > wild guessing: maybe because irqdata->rdev is not initalized in
> > > > > > _probe()? At least I do not see where it would be initialized.
> > > > > your wild guess seems correct, I'll send a proper patch with your
> > > > > suggested-by after doing a couple of more tests, thanks.
> > > > so, the bug is clear, however the fix is not an obvious one liner a=
s I was
> > > > wishing.
> > > >=20
> > > > we would need to add a link from each of the interrupts to the spec=
ific
> > > > regulator. as of now such a connection is not existing in the code.
> > > I'll try out implementing and testing the solution, but will get to i=
t early next week. Will email with any updates!
> > What's the status on this? Were you able to do any progress or work on
> > it?
> >=20
> > Thanks
> > Francesco
>=20
> Thanks for following up on this, the task got lost on my end. My apologie=
s!
> The original line deleted `irq_data[i].rdev =3D rdev;` was never replaced=
.
> The correct code should be re-implementing a version of the tps65219_get_=
rdev_by_name() function that was removed in commit 64a6b57
> & add in irq_data.rdev =3D rdev;` where the other irq_data fields are bei=
ng assigned within _probe.
>=20
> Is there anything missing with this solution?

Thanks for looking into this issue!

I would be happy to test your patch, but cannot find it.
Have you published it in the meanwhile?

Regards,
--=20
Alexander Sverdlin.


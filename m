Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60631C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIbXpFTj/4jIXWlkQ6czPnMrtaq4DBoRJvyvQNnOL8U=; b=p5VQ0qhSuZR/9wgNzdtQh8Fdbv
	9cVxLh4ZIkagmGUQUgMGxdbGDVIVrdLpp76bXSILYWFVaW6qY7pUVMidNUrJQSv+kpwjbNXV1I/pT
	kSxY66OEl6bEXLfR7IylNfxkvBvSQZvAGfblfIfeXzIASDfg/CYfK+HiKqFN2yBqKcMp47WrUsbHe
	pYHOZx6WfRdGWvL5jEZTy/6QdWxBCJHm8SeR9WbSpK2qopHq4U1Swe9pnozV35VYYGiBqwDzNXmFG
	NnzIrQhhh01SVr+/CgvtjlPNiWaBdUQJWSdO7R/8ixS6ng8MOohAY44qqrAD7ScGXt9Jx5wEvc2Ib
	nAi9J+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsINq-00000007oKH-44yM;
	Fri, 07 Aug 2026 11:05:02 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsINp-00000007oJh-0Xls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:05:02 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2430500a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 04:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786100700; cv=none;
        d=google.com; s=arc-20260327;
        b=aAngz8CCgKfCjz/mG6/LOqkG4m9Ibm9XD7N+HIg/dg+2Lcf9n26mGIRJPRk+rBy4w/
         P6Y2jnnW3OgmnWAzpn7h6IYHGRfr3mJZ7PM5X7fUGGKiErvA4S31/teOHe06DQWXKksa
         3XoZovUSfvHvJki4nM9tFNzThN1/HowB5L62+zJ+VSou9VOoMPU1nTVkIP99ppmpIaL4
         C+P6wNMaI7q9yPtsWOgwDPp0vZw+S/la3H0MEKaOTAPEp9jtSENt+xqAP3LiWgD/TwEq
         qYzZJtrU4EkGcnMHHQFBkw/9fgmow79FvncroY9D8IxG4a/Gn8kmZ7Hha/A31qu57qpg
         CD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lIbXpFTj/4jIXWlkQ6czPnMrtaq4DBoRJvyvQNnOL8U=;
        fh=xYxKSUHbXDjytJH2P0w6AFXpXOE7BylqRsmbsQHIGts=;
        b=M5eYyQC6cGw5dCZldDT58wSK/EWai3WlVaZ2GVXROCFAv41aOmV9ku6ka8uOBLHDCU
         zng3krPz5OwmPP8EM3IIBZVwDPC7G2Ii1G8PpfY7ASzgUsgvFIqPNcGTNjYHRqClHOlP
         hKeRUtxkoH2eTsskf0WIinh/aswdTn9n49Jt8dZQL/B1ZOUhjkoY7zMHZfiwR4WUHG0i
         daZIn/cnPDFd3buwppZAenYsQq8J2rhpXaSFwqNPgDAeVf7A8z0YPW3dn0hngLCI/znB
         bqWSFD5drzjO7IV/gD3rEKBwGc2mV0cayZAOTiiNBNwixK6FzY0q0av7nnHnvxvr83yT
         LSWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786100700; x=1786705500; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIbXpFTj/4jIXWlkQ6czPnMrtaq4DBoRJvyvQNnOL8U=;
        b=a6Q1tSSbhEZ1eA0ZlyTuGMLL2mOm9+h0LtjzlMF9DuUMhaCLWhjlXHaM77L0zWo+hm
         VJAGgpF979GOIn+57G6YJJiJvnHA7hXSXHJx6+Bru3OqZI9qXegQV/sDuKiQjR6DkbDa
         dZycwzdNBl8KmYMzS0wS+QVaPrLBHQzCTHbTTZaS0uB86dugIuybm6+LbVCpnAmAMS3M
         gy+daUlGaZvz3m3moy0//SxWH1TUwVst1NWfXxrqdNM1Nf2RVF4TkWuwMxKVwsus2UHO
         Rwf8mK1vIIzOA7PphfERSRaUPcJwmBZcF2/gkd87Lrx+epOb6FZa4JtMGtfTF8D7k4lR
         IKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786100700; x=1786705500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIbXpFTj/4jIXWlkQ6czPnMrtaq4DBoRJvyvQNnOL8U=;
        b=hLHFMd+7WLCoaP4Zw+kH3qpXBufqoXBb5ZqeeAiUaCdWu7il8WXmiahfSb0tGtjwO0
         5kLF9DPQsWhqc2Zf9uDLF0mUP1d0ekvWVo82DF0ThHYcmtdzf8f8yMFC+o+hZRxwzDko
         JClsfltNvZqzIRDiHLEVQjNb6VCIZ+apaxWIf0Sm0llinBJrvop9rBFZPs6h+ncNRQuI
         niQJRu6ICW89IphrQRdHlBNjVoi+KEq7B+u5qXvPl7xbGUX1XDExV4zpKd2iaGvxeuDy
         Iu0iMIGYD3VXo+yBDjLbLdDmM1ako7lVVEnwWCuUTcB+i8A5kH44oqnvjZs/TxAPYHfY
         PAWg==
X-Forwarded-Encrypted: i=1; AHgh+RqZJdMKBdxdiYNUg3M7ZBEzb30vrEVbaWhMZiAT91qBYdmhdjUBOMuFe9666UVB4W/p89S7DUunrpxWpbvnDavo@lists.infradead.org
X-Gm-Message-State: AOJu0YzYPd48eq2Lwr/4HNoSmqQs0sdTFqWYIeC7OUzrLmGVEbdVEO/I
	p0N5cmnlaY5q7eiizdFYKMLdDPZCTRZ9j35xVPQ4DFgdHuurmjadJvqQx+RYwSmp2NMAXlO2tBH
	+cPVyJ5i1E502mBul7xxHATxsTdsG+r4=
X-Gm-Gg: AR+sD131GUvlZcXCc6BT7FdY9SdSO9ca8SN+bFGQ3od8K1gbCQ1/1Q2fGh5ALVmV2zi
	EqISCLOlC3VaCeCqYE88FpM9MJMLozHIH6kh+nIIXFgqPTY9VlSFmCrbHOqek/EVu81znROaPZC
	qAzbI07fhwrUUH6imKinhZwFPZLagsmdkiGRrZjBWqYL31uVXTaeprRJLzLN7jrJlSUL7IReYuc
	sbIaK/VUX7GxaIfDgBKX5e9adPsEwfzQxOdariz+nr96PL8i1zEWm0h/bp4w98lc16f7iUYDK53
	5EWnm1EvB/Ud8rsHL0asW/fZoKLvaszEFM0Yv93CouNyWuyO4N/p+T5HbphPkKCuqYDRFUCutrd
	c0pK27oVSRoauTY856aJZ46Y9vSeYtdimuUkmiorThDvoikivtVRwovZc
X-Received: by 2002:a05:6300:670b:b0:3c0:ac0f:6558 with SMTP id
 adf61e73a8af0-3cb85e99259mr26552578637.2.1786100700044; Fri, 07 Aug 2026
 04:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260807093058.42840-1-phucduc.bui@gmail.com> <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
 <CAABR9nF7sAT4C+W_qE8GVKhrtTjdm=DcpJH548RzFaYLuED+3A@mail.gmail.com> <20260807103645.GE1316230@ragnatech.se>
In-Reply-To: <20260807103645.GE1316230@ragnatech.se>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 18:04:48 +0700
X-Gm-Features: AUfX_myqnP9cM0o7YKZHIMOZ9idGY0mI36nu52n1v9bZ-QIC3TPihkA-_6FUpl4
Message-ID: <CAABR9nGAY6BjA2mRsv+2hkB1kv0QDJX6osXyEMw6jsjE+j2+vQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_040501_172462_80B76774 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Niklas S=C3=B6derlund,

Thank you for your feedback .

> > Regarding the caller, I only found rcar_gen3_thermal_request_irqs()
> > being called here:
> > https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesa=
s/rcar_gen3_thermal.c#L530
> > It does not appear to handle the error return there, so I don't think
> > the caller currently handles these failures explicitly.
>
> Yes it does. If it can't get the optional interrupts the driver does not
> support setting trip-points in hardware. No?
>

Yes, for -ENXIO, you're right.
The caller treats it as the absence of optional IRQs and disables
hardware trip-point support.
However, this also means that -EPROBE_DEFER, -EINVAL, and other errors
are currently treated the same way.
The caller does not distinguish these errors from -ENXIO, so the probe
continues instead of propagating the actual error.

I think the caller should distinguish -ENXIO from other errors:
keep the current behavior for -ENXIO, but propagate -EPROBE_DEFER,
-EINVAL, and other errors.

ret =3D rcar_gen3_thermal_request_irqs(priv, pdev);
if (ret =3D=3D -ENXIO) {
        priv->ops.set_trips =3D NULL;
} else if (ret) {
        return ret;
}

Best regards,
Phuc


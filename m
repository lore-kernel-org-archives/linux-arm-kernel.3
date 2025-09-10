Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9362ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=; b=tXmATUs9G5vhGaR/3pQpE4XMil
	drbNycbc1q688eaOi+nUg99JjBL/PNp1qoNGGh+681feQMYYSmxyrwQk9RwoV5FyjqhumT7QCfCiA
	RjxVGta3/rK3O8yUNUo47h3mrBZHpztn6+vvNF5oCOgD7yVUhnddv4i6d/eI9+LIMfcs+OvC9cYMy
	QVzAcK5ZlittPUphrOwgFcU9sJRQeYtWs0ZKM9DojerZL14muOKLqoc2osvyX1G10Ctbr/kXEZVgR
	YL0Cck0KFq1F2yEQcNNq0v9QLYavRY+Dd88ZuVJZZ8kYsOFK7XdME5spugMl0mDeJ9q3ohp9167fq
	ltKlAdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHSu-0000000DLY2-0sc7;
	Wed, 10 Sep 2025 09:50:12 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHSr-0000000DLXG-1qkh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:50:10 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-336badc713dso45945341fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497807; x=1758102607; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=As24Q5YdzOKmeVFwS34FjZ+zgJ0GHsuvMP5tEJeBGQqnMFD3FU4FRAx9Ed1eW/lBwQ
         ul1K9PCS7bCqRd9jzIyLEgCK2Ej9FlMcmaxzjgNUAnpNp3J9GDw7vC+KqncrVfoEtDEQ
         G17Vngm4qSd5YUf2LvE/ZohNOVTHEs+uKI8Notfty4jOHiQF5N7mN8/rhvip0cxx3+vw
         XoFIsGtYSKFSCeb5NUzz+MCQeut1SPmAMCaYqDAPgGTBNMQGM+jwvbJjO5phH4ztInS/
         hniDyeeyhRaJnEQzTJG9YOY+7ipuOQ5oKBEZkUcQFmFnx1kHWCGDd4U94F8yybrC/CK6
         KUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497807; x=1758102607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=SbtnI7LMmGZhaYEl5jpi4uIxy60+uA3wBsUvlhhjIJbn9L+yrmf58SVlS6M/FzkYkr
         KM6bhGUkwm5kWBBmzhJLJShNdYNHJJVb0TUl24PdCkUxLJafLUUyEy1BJITCXhydT6DS
         ADyFxIqMbbSKchvjx06pbAchYmdDqzk7afdxqkoba/YJ/4Cwj/YIRobquHgUvDNBcfhh
         QTCinUFz6SoWtmhTWbe5SiK0gpVTWQvRVDVTxv+d71IeMIXKscklDvK/sxR551yKIa9y
         yChp8jP/UGpIAp54W182F1GVUFkNQCR2nrEDPqwZIHQ5nry8dFoCqMwaPauz7Hvtqat3
         v98g==
X-Forwarded-Encrypted: i=1; AJvYcCXDnb+LbSoO2InQ7Pt7lM5DtBYR4dC5CnyJO8wkwiWKLk7M3ZbD4QGPtK3psF7dFb5xm+SsA03lZU3HAA/a0f72@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9sZIt4o4OOTiDxbSSaUsWiotXUQtcbfUOxvadE1nqWDAwCJSY
	stms/NvM3fMeygt49FdLQe4viGCxaVfUGgSbbQaZKRxTpcr3cv+86mD+fgnF5mitsIMd8839iOn
	4skZxLnhSYuMclDGUPgx/ha1+wSp+ZjptZCeKZhZhd3gdOm3N8l1e0aQ=
X-Gm-Gg: ASbGnctSbnFod1nYQCbsqAySFYp7WIvFDiEjPl++H/mRUlu5ujgDFDGcNfVZseNGniH
	3wkJg9J9YtgPUZ7GDXiEvZi/p5VsWcVN3Wnc2IOslU8p3RqXWQ4IRxXJS9Qk16qdu1dU1E0j/r/
	kCP91cvgbqd2osIlx43sTiX0SRc2gAeNofkPPucfZ2Ie4PpJOClw2tk5ULZaZJ3yj9M73cmYE75
	wgbLoE=
X-Google-Smtp-Source: AGHT+IGq2x91wz7j8DANH/yJwpeO4d/hIy0ABq1WES66C1SeY2aK74/VWAJ5lsiz89NvTXBUTDFt595MC0reZwFBRxA=
X-Received: by 2002:a2e:a009:0:20b0:336:5e1f:b1ec with SMTP id
 38308e7fff4ca-33b536f14b1mr41029971fa.31.1757497807337; Wed, 10 Sep 2025
 02:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <aMDYdp3H-yOHU1Pm@casper.infradead.org>
In-Reply-To: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 11:49:55 +0200
X-Gm-Features: Ac12FXxu2Penmvb-ANhZIzZlxEacPcTMGZ42OzvKFfqr5PHU2ajbCjOLxBc-XSU
Message-ID: <CACRpkdZZZNV5BdNhyXEK__=EJLjDtAEsc2Kv4Tv53+=Mv-8R=w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Matthew Wilcox <willy@infradead.org>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_025009_494663_73CD6294 
X-CRM114-Status: GOOD (  14.17  )
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

On Wed, Sep 10, 2025 at 3:46=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:

> I don't mind that the feature remains ... unless it causes us trouble.
> Which it currently does.  Perhaps we could start by removing HIGHPTE?
> There was a certain amount of complexity introduced into the page fault
> path when support for that was introduced.  x86 removed support for it,
> so it's just ARM left before we can remove the complexity again.

I sent an RFC patch so we can see what Russell has to say about this,
it is currently only enabled by default on the VT8500 machine.

Yours,
Linus Walleij


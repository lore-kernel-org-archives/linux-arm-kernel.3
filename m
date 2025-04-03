Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839EAC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=; b=iyMR8bzIBYFn8tIAJ4kllf6euj
	D8aD9cTckYuQAQJ65XM8Ay7IGIr222kTr/k7yDW5JCSJKlwXj7I8kK1AdAaEgQ0vPjDMK80QLYOda
	24jibqc3Af5tqMVt83Xqw5/l9u+i7uUgHia8jJt4t2iFJqLQWETlD7UCpBjgdeyHTUrJny5f0Ih/d
	dxQ+N2QUpErwgI4aub6T12IY7eahj6LdZhmzpkInBox4JTnehNE4GDzlC+8H9Xa5AuMj49qaDs/5E
	xo4l7di+wcJsZcdevZN4eew0FL1/g4TMG1XiLHWFbgRUoDgeK2IafzzrVSOQ1B31WK59/0eyd4RC7
	ZQ9myPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FBd-0000000899S-1cyS;
	Thu, 03 Apr 2025 07:40:29 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F9o-000000088nr-43zQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:38:38 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30db2c2c609so5500291fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743665915; x=1744270715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=;
        b=JDp9doqs+dYZhKoYlOV2HBzpAY2J57vF+PE+mdPrxQEnk384Gwn4gGmPg2xY8WBL3k
         UaVl5V1mVCfPrz4hrsKf1baAXST1Yk6TYeutQgOGTGGNwjVxJQsgYTzx1RSqctiomXbS
         1jkcCXu44seBuqW73Lx2cVjDgHhC0k9xFNeGHuPBL8QXyCUBelr6PQGABUU6AMSSJMJ+
         UQK5qxjUNwZ8qmXdDLos9a9cpvyVtx/5mRgsi+CPC6QGLh1PQ6ETKfhCv/I4D+JujO0g
         Tnp/yjogTVqL868AQejjxbrNPrcEOFalUYO+h2PhsUJKanf4y/9/uRPDLsbZUwnCFpsr
         m0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665915; x=1744270715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=;
        b=GxDYHlIa/GjsDUvPzTMorKOQVr6agOKEzlrwfxIj7GELPztGA4ldZEbMcfTxHGbAsJ
         NYDu7PtZ3YgTea3RuAoSQ94R07Ay7Qqtm5TzVOsePyxhs4NqxtlRqMuDG5wjcj0jktnJ
         tV5n8w9dZD83cjS9yJ51t+1Ld7uF0cH6p7wJvE4virCIFzFt2nbpuHWsQXZy7jmInTlL
         6riq4ILYg/l5+NjFcRT2yRylp3hJNBGbYdHwTBe8aQkvosluoXPgG1MydimNdQSVAw+k
         XN4HAPN9aUAyjlmVWG29+iJklcz0b4Vc4vyk21Hsi3EAC0dGgrh8fEw7ecsw6u6cKR8j
         GIJw==
X-Forwarded-Encrypted: i=1; AJvYcCV01MWc2k5TsUsp9lrQSTRP15w23aA331cj7gKkEd4GXXpvKxWjVShx7HouwA/GW/HVlEQs7uim/cP7GTryjFrT@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmZ051S2b2gNXcbfd0WcjyJWtEQGIzQdADT2bzXzad0Lm4v0t
	tZU+5Vxd83PtV03rQw1Z/8DI/mDNSVv8hUiNUKNuAp7J/voy6aZoegghWjoPjpGXKObcGLFrDSH
	vJN2ezFEyVekz0Vr/m2dhLoUPyuFm9Q7fSgvpMA==
X-Gm-Gg: ASbGnct9wtZZ8EGDKdATaKnXgy+uU8K9Z6Y1ezaOhRIXQlEF6xTWINmi/nLAaQBlyFU
	el79UcsDa+HQxRvuLzIojp3IwuHitByzDVXiwAulHF+8VPVbxHcRaOS6QPEGeFk5z2KEB7uxfm6
	TTtgI0zVDH5hngPN8XN6/P/8ZFNvqbZ5HtNifBd3BMdrZd39+NUrnagvw/
X-Google-Smtp-Source: AGHT+IE+efI2xX/8yZlFAe4Vm/Cxzz+Nax11lqQy3zdclZUZJJhpwXV7c7fhUqN3JwjPrbPY+ZyZGS0ljljrKBqXCe4=
X-Received: by 2002:a2e:be14:0:b0:30b:8f60:cdb7 with SMTP id
 38308e7fff4ca-30f02b985a2mr4363601fa.24.1743665915290; Thu, 03 Apr 2025
 00:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250402132634.18065-1-johan+linaro@kernel.org>
 <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com> <Z-42nVkEZeWHdwAm@hovoldconsulting.com>
In-Reply-To: <Z-42nVkEZeWHdwAm@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 09:38:24 +0200
X-Gm-Features: AQ5f1JoaECCB4Ig-OQoVaRV_IJbeuDbZtSRj286KtUBGCZkrM4_HeX7c4fhC4-E
Message-ID: <CAMRc=Mf3on3TpiPDhtPnp1-3b0ika2GHy6h-NJqcgvYpWMHpoQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_003837_208589_0000283D 
X-CRM114-Status: GOOD (  18.67  )
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

On Thu, Apr 3, 2025 at 9:19=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Thu, Apr 03, 2025 at 09:11:07AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Johan Hovold <johan+linaro@kerne=
l.org> wrote:
> > >
> > > The PCI pwrctrl framework was renamed after being merged, but the
> > > Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> > >
> > > This leads to people not knowing how to refer to the framework in
> > > writing, inconsistencies in module naming, etc.
> > >
> > > Let's rename also the Kconfig symbols before this gets any worse.
> > >
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I'm re-adding the tag here as otherwise b4 will only pick it up for
> > patch 4/4 on v2 of the series.
>
> I had already added it to the first three patches so it was only
> missing on the last one.
>
> Johan

Indeed, sorry for the noise, I saw b4 only applying it for the last
one and didn't check git log.

Bartosz


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D36C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+pMCHYIBKQlPeyxJ/f+uTZ5/U92w6mRcGd7hTstQlk=; b=DRDLKeZ6lIXziGyI1ZRc2K7B3l
	OhTm98+jHyExyCdYWL2vtmHgQwUGZPUIrn/D4GtJtm+HZ8WvcMlkfOjl/d5400GqipHdVY1iz61ad
	GYIYsnkJEU2QcEzcjs5pR+7cujwg38TZEW9K6wLtOUmUl7M7ZJONkQaImX++VblPNMhbvpm/giANT
	CI+TvtLYY7vmWG09QIg4JVZ1Iq0/wq8Z46kjm3PjSUnEg6lkazLsPK5wFszlx70A1tlJULbufvifE
	HE0MjcPK9mTQOThVxl3LYdCmLK7rcMoxnl4RxKtRCqwQNG4VPo9rPgoaWUobXCeJdhRt6u5CINNr+
	pHpvWlTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTja-0000000BIyp-0Y40;
	Tue, 03 Jun 2025 15:39:26 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMThP-0000000BIop-0qOs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:37:12 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-70e3980757bso48381237b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965030; x=1749569830; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+pMCHYIBKQlPeyxJ/f+uTZ5/U92w6mRcGd7hTstQlk=;
        b=WG6eKajMxHdYhV8nO3el1NH/IPy8Wwu8CtQBpdqGsiM0sxrCinu0iwJrJn0/sad0DJ
         BhGxvzQCA7SC3+oTdIWzw6rXX8HupwHVIRdqMCnFhaZDuxelYHz0jrNORSuqKZTKchvX
         GkV3O7oOc6sEbzaX4FeUve1BTYmI9jxK02GWGL0PNSMqQDl3kx1oVWYmClw8BiIRBZG3
         fWxkTrqP1wa2Y++xbibPLXQgKADySSRXFtRLI/lVqE00IH+aDZwWrbbtDh6mOLppCuKW
         CxcSWpPB+6rO5ZUnHJmFh5b7C4wpsEWxVy9XLYkkmXeY5LzrHA4dPs2oOBSANJq4FtRS
         7AiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965030; x=1749569830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+pMCHYIBKQlPeyxJ/f+uTZ5/U92w6mRcGd7hTstQlk=;
        b=jqeDqRdKpR02d/vNTxPbfyQV7d9BCFFJZgBDRghLGU2wBd6U21KjL4wUqUSxidtO0f
         nPIs4En/U2DRopgTg6wOo3ceMycNh6SKK4LWAKiZHah4vLUorJf5/mrDSnCFCzKvK0M9
         h4Jcahw3lnRsTjsKo35yL+tqe6SrCMWptjHwLpWpLA0tJEGW+/MvHKasaSnc38DiYb5N
         6b4dqcJkmZI42otp1TMYvAawwoL30n4GlA61twFkPFQA7mia3jwMMEhTizVzWnE8jGTq
         C7JYMah7i8IeSNNd5MmKHXecV1CazxkcYWzJgnJE/WpWP8a/E2ZKQ2bopXJSitjK4w9W
         Tb9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkx5Z0d6B6F/1ozbaTmkQleba01XzCXC7HfS1LqHfmKEP9Z4Mryv0NKPEGtpuZHjsqf8eSK9qjZEQ6glq+DMIb@lists.infradead.org
X-Gm-Message-State: AOJu0YwlOD1vvHcEllWHgvdDiGE4m53GyAeVlaEBm5ja11xiNUgHj0Yc
	VjIRhX0mceF3TlcfL4ZtQq9+Zi25jNYXIjj4RKwS0M3JL0FMLUUg+K6h0jVsrqSygTc++KiZ6JH
	n9i7B2DXAozT/c6J/WROWczh3HFZHkot/jnPo99Eq4w==
X-Gm-Gg: ASbGncsyItWx/CczOvvs9YgFmuyRwPxgScbQEGdlUY1I6K3apMSJnWjzFcVCQM1g8xy
	MH3fqo+p+Vdn7KFOJfBPoAWCuin6XiClFJAP+u6crWRPKVvciYlplmIB7o83kXwlPEaYcOuP92Z
	Gy+1MG7ybxyXNlZp64BOVoE/nQTf+ULD9IfpR2Cew60lTF
X-Google-Smtp-Source: AGHT+IHpl+65a6HRSkGvLRf1r7jeLyLNnGo4sF7oK21xHyQD9U7Bn8mpXIZIDnMPRBSl5Rocwg7he9JmFD+OdOd/90s=
X-Received: by 2002:a05:690c:67c4:b0:70e:3e3d:cfe5 with SMTP id
 00721157ae682-710c9c93987mr35904557b3.4.1748965030033; Tue, 03 Jun 2025
 08:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi> <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
In-Reply-To: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jun 2025 16:36:58 +0100
X-Gm-Features: AX0GCFvwPjD5ocl7QOfNaTZVaVH9zG-qYJmIWZHqE7gqRYhb1E9PXLq0OwGv4Ko
Message-ID: <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_083711_244415_ECC56C74 
X-CRM114-Status: GOOD (  17.66  )
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

On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jun 3, 2025 at 2:48=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kern=
el.org> wrote:
> >
> > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > secure.txt says:
> > > # The general principle of the naming scheme for Secure world binding=
s
> > > # is that any property that needs a different value in the Secure wor=
ld
> > > # can be supported by prefixing the property name with "secure-". So =
for
> > > # instance "secure-foo" would override "foo".
>
> Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> it's never been used anyways. But I don't have much visibility into
> what secure world firmware is doing.

QEMU uses it for communicating with the secure firmware if
you run secure firmware on the virt board. It's done that
since we introduced that binding. Indeed that use case is *why*
the binding is there. It works fine for the intended purpose,
which is "most devices are visible in both S and NS, but a few
things are S only (UART, a bit of RAM, secure-only flash").

-- PMM


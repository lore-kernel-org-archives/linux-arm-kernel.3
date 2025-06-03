Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DA0C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtbIHNXJCE6HdiAWFAi8T2FRZkuH6G7Wy6EuLQ2JEc8=; b=xAitl2Ro2AZIkzTGvhdzkylCUD
	aY9HLD2ht7bgJs3V97p42R7kITPuLlpxaCpaIy+3pAw5X+WUbzlZNrI5aTx3yJO3/RWS7Sh8cJLGZ
	rbYq7FJrWPzAa9GA9kmD5ER1MDUZ4tbQar8lVvrKqNTRgsqEcd+bErg9XzAl7Pmf823lFp1wUG3km
	p+80xIIOKldpdVV181v8Zh5RrafkbbteG0r8MsEA5+D8ldW5aHM+4nWj03RGHcn28ojjgOJDQOE04
	XXmqMCXba4GjiM9gD+DWhVAQfPxpC1An6tKdLyohjgkiczPzbeETwRRAo+5RgnFUM3uKFLKgz0h1D
	SNIJzgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMX5a-0000000Bh4A-09Ux;
	Tue, 03 Jun 2025 19:14:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMX37-0000000Bgn8-2GBL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 19:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5207149F6B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Jun 2025 19:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C451C4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Jun 2025 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748977908;
	bh=NtbIHNXJCE6HdiAWFAi8T2FRZkuH6G7Wy6EuLQ2JEc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LvwUxNiVPwYp6mLEbWdTUoZoKksGLZKw7wQxDV1vwfc7hUdUdatMQUbC0aAoB88oO
	 /HWvYGTOo5Nvo7pmnDs07DEJ9ORh3PdFhrUw2LNNA2AFYj8KUbIqA62zmSQwBd7ynR
	 uiIRh5hYPhouGrxol2KhLlL2eBRe/U4Ei6xeV4ffAegT/TTraI9HpY7FUSd0pHNB11
	 2Z4iRhDaz3MawoC+fGhfCgbUoAy7n3RrHdQiBJ0ONBgF8EMYY8NNVrBSotxpq0ykVu
	 QYdwQtbKs4NSQrjMZHxKGwk45psiyr6jU4CyiUW8h2dGxleO6jsyp2JyMVgKHBLLmR
	 9BKjQLxkLdlVw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so11781240a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 12:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyiNxTFZ4irvUBfCEJBmgfXraF0g222B/r5flOE4fFH6WJYfmoZCkBFx8ch6ysoRgNQB417MJkeDNzlGDlFjAP@lists.infradead.org
X-Gm-Message-State: AOJu0YysASiREXIKcD2PuwpD53DrFyCISLlNhbTEXRo6XlvG8c7pQRkP
	NVoAQRc3BCBGg07EWFEkVTnhAf9go9HJ7VL4rf+t7Ewy6iNclpivglnmQqepoDU63tXuFD8Pg2J
	JM6P1aecL31P9CppxHwW2uJHX5xvQqg==
X-Google-Smtp-Source: AGHT+IGDlt4OCveynhrCFXx4DgX8xfm85z6UL0bsAuJVVSY62Mr48Abx9k4B0J9Pz7qcBz3dXFPCas/vNXZvDftBXQw=
X-Received: by 2002:a17:907:d649:b0:ad8:96d2:f38 with SMTP id
 a640c23a62f3a-adb36b23626mr1719607566b.18.1748977906740; Tue, 03 Jun 2025
 12:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi> <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
In-Reply-To: <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Jun 2025 14:11:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
X-Gm-Features: AX0GCFvn1r9Jc_cN-EiFTkdAeiyJWM3OfHLrf6lkihvKvJSq8fFGzvhI_2zyfik
Message-ID: <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Peter Maydell <peter.maydell@linaro.org>
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
X-CRM114-CacheID: sfid-20250603_121149_618545_1545AA4C 
X-CRM114-Status: GOOD (  21.01  )
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

On Tue, Jun 3, 2025 at 10:37=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Jun 3, 2025 at 2:48=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@ke=
rnel.org> wrote:
> > >
> > > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > > secure.txt says:
> > > > # The general principle of the naming scheme for Secure world bindi=
ngs
> > > > # is that any property that needs a different value in the Secure w=
orld
> > > > # can be supported by prefixing the property name with "secure-". S=
o for
> > > > # instance "secure-foo" would override "foo".
> >
> > Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> > it's never been used anyways. But I don't have much visibility into
> > what secure world firmware is doing.
>
> QEMU uses it for communicating with the secure firmware if
> you run secure firmware on the virt board. It's done that
> since we introduced that binding. Indeed that use case is *why*
> the binding is there. It works fine for the intended purpose,
> which is "most devices are visible in both S and NS, but a few
> things are S only (UART, a bit of RAM, secure-only flash").

I meant "secure-" as a prefix allowed on *any* property, not
"secure-status" specifically, which is the only thing QEMU uses
AFAICT. IOW, I don't think we should be creating secure-reg,
secure-interrupts, secure-clocks, etc.

Rob


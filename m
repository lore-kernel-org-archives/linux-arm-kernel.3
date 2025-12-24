Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81632E74AE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 08:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TfuYlLvMaLWTZmZDZsnA49hO+ryorTTCnTkX2pKAFY=; b=pEbTzxQ4PF+WbA3vv+U5y2iFnT
	EeURV/kHtCnxqrlYASjiPTN5X2r8rD48MyFqHCaqhPUAtEG3ksOnpN6o6tqrn9IHqz5RLtmr8efnV
	qdiracSBHz+64ClJW6d+8A8QeIZ71bsMCoMmA2fWrejk0c8TemSEMbrBPzYxOhCG6Db6Mw8DHAq/C
	wbBiLyFvTRd29TSz+lyCoJ1NOaDMhx9HKJKLwFWJv/BTqQg5FLUkOfztkxiePb0PqtvUmrkAGkcHG
	9M/mNufWCTQw0QjAdpawbE2PSV1yqLt7Yh1301TOJtkQPaYZN7zS55RGND0KwTLNzbCYp0DmG4utw
	Y5e2LNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJrT-0000000GZDc-14hI;
	Wed, 24 Dec 2025 08:04:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJrP-0000000GZCj-0x3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 08:04:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so5622387a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 00:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766563481; x=1767168281; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TfuYlLvMaLWTZmZDZsnA49hO+ryorTTCnTkX2pKAFY=;
        b=edqqkvtfTWZgWVWreMyP88uP5q2FwT/CJm1ZqC4UBEHfqwzICKlogtZ0E+mIDyKyJr
         Fa7VEqZg423fUxMp3Htx3eYC1YCPQbS5ERpU+D1pKhm3gTNykNJTtdfzD4TW9UPyB2Xd
         fkH4y9AWyJ2lsJrky9hg779GNZEw60ZanoK9CM3H3lu2q5gfPg3/PG1PgN9lKj3OjGpn
         BZMEQBDnFh16KXS/mlonS3IZhoQPEwa2nfhvtGvNFx0JiLnCCvZEQ04sETcraydfpw9F
         wrEPvQFdoDp8/o9PjvJhBDi05EOpw4EXHWFSzEg/mTTLhx6Cf7YXP9r0Iff9Z43n3GUd
         i0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766563481; x=1767168281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+TfuYlLvMaLWTZmZDZsnA49hO+ryorTTCnTkX2pKAFY=;
        b=XGfOu6oWXN3ZG3DhozAvar8CctrHyOEux4i9PKOoy6n4AwG5CugR62dgxrF9xBg37J
         lCvnN+OO6yxx9kz6wpnSTZuEF1r3SHPZ0GAr7LtE5vDWE3EkMDLkxRLmRkK4Z2eVUIJJ
         hgsC2QfwUcvwT0OOTn/v6hqf1oB+x3OjFZO8bWqtS1aclsqtiMMQczI0CDz6HKo/EEKL
         WciC0ms8eS5g5Pnu6xwyXvK5TXBXbc2wm3i9qLV/YQ+8skX9OXCzCLBdwARdJ1Tz3EeH
         msPknyCREOkwY0uxPm2ARfoXnoCy4EaLt3ksKb1HBoU6fg8vdYweSV8IaOjak6X6naKw
         Varw==
X-Forwarded-Encrypted: i=1; AJvYcCWqNWcHOjec65wE1+durHmTufkMy5aKB7XcIFMW4OmvszqTCcO/x3m89PORvaq//VIw0iaSiGG+jY62P56m/k5B@lists.infradead.org
X-Gm-Message-State: AOJu0YyWbJ7YlQdOV0DxeT+iDtiIsii4CCz512kvUBzp9kDVi2Rv1PM5
	T6hVK9XURv9fWyVllvbYfbqOn/Oay0Kl5BOG/zvH/BvXJnWT6wDpZQXn/REJ3BxTknhd3QysqTK
	3u0TYfstPKJaS9MaxOXiwuUi6V4c+R1A=
X-Gm-Gg: AY/fxX7jeZHlGCrAy+6HTiri75Qe3pe8MUwriDs9rZht6dDxLBLpsOTWefMQRJUGQjP
	qGksnUiXQK+xV7mCoA2SHoX5YlnaGbR+zs5jVFwZmPFTx4qnFRxN2QzA1hAizf3lshjtm0q1kLq
	h4p/4EbiofSOzttdTGlTYnUfUk2Zym4ZytBBYWyPS1/Y1ikxcN1moqxT8yaafct8aJZhWc3LEeI
	im8anDgIEAQf//3HFxQS/b9sKsDq5j6CepRf0DmZ05rKTk1RULQjvgitjWTao/1aP4=
X-Google-Smtp-Source: AGHT+IFNXz2QU01SE+DL2c1ZCqqAJiAT079DS2+XmSlL7nM5RGPoflTCsCJq7MHCePPbrmgdDllZFgH4/zk85C3yl5w=
X-Received: by 2002:a05:6402:50cc:b0:64d:4a01:fc23 with SMTP id
 4fb4d7f45d1cf-64d4a020dfamr9289029a12.10.1766563480975; Wed, 24 Dec 2025
 00:04:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
 <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com> <CAEsQvctSY7-RQEQF2TmJU2qKPZOe9TC5g-7Jat0LQKRHYz_6dQ@mail.gmail.com>
In-Reply-To: <CAEsQvctSY7-RQEQF2TmJU2qKPZOe9TC5g-7Jat0LQKRHYz_6dQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 24 Dec 2025 13:34:23 +0530
X-Gm-Features: AQt7F2qzfCdogAfkIVvQ40sYz72XmKQPz1kBLtv40YPxaEuaYu_edJzXc4ZwP9s
Message-ID: <CANAwSgQPQUBi6VVb+hZNraMt71vnRpki+YK_at=Luo4aPVtOPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Jonker <jbx6244@gmail.com>, Dragan Simic <dsimic@manjaro.org>, 
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_000443_285549_9013B48B 
X-CRM114-Status: GOOD (  19.81  )
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

Hi Geraldo,

On Wed, 24 Dec 2025 at 11:08, Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> On Wed, Dec 24, 2025 at 2:18=E2=80=AFAM Anand Moon <linux.amoon@gmail.com=
> wrote:
> >
> > Hi Geraldo,
> >
> > On Tue, 18 Nov 2025 at 03:17, Geraldo Nascimento
> > <geraldogabriel@gmail.com> wrote:
> > >
> > > Shawn Lin from Rockchip has reiterated that there may be danger in us=
ing
> > > their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT chan=
ge
> > > from the default and drive at 2.5 GT/s only, even if the DT
> > > max-link-speed property is invalid or inexistent.
> > >
> > > This change is corroborated by RK3399 official datasheet [1], which
> > > says maximum link speed for this platform is 2.5 GT/s.
> > >
> > > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Dat=
asheet_V2.1-20200323.pdf
> > >
> > To accurately determine the operating speed, we can leverage the
> > PCIE_CLIENT_BASIC_STATUS0/1 fields.
> > This provides a dynamic mechanism to resolve the issue.
> >
> > [1] https://github.com/torvalds/linux/blob/master/drivers/pci/controlle=
r/pcie-rockchip-ep.c#L533-L595
> >
> > Thanks
> > -Anand
>
> Hi Anand,
>
> not to put you down but I think your approach adds unnecessary complexity=
.
>
> All I care really is that the Kernel Project isn't blamed in the
> future if someone happens to lose their data.
>
Allow the hardware to negotiate the link speed based on the available
number of lanes.
I don=E2=80=99t anticipate any data loss, since PCIe will automatically
configure the device speed
with link training..

> Thanks,
> Geraldo Nascimento

Thanks
-Anand


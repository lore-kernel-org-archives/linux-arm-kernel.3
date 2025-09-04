Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA33CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyHjacdRFot2mfmyY2ZfLE1xBGcP75z/UEgrMYt5OXM=; b=d3i/vJdkIZ4zRjHnFzTpwXVl83
	uVsEKEbADRtbCuBXLkuG9QKOGKz+FMR2cQXH9Rf9/S/7nNB1zuqUoS6OWWz6av8yucTFtuFNQdZqX
	YeWxFCQTssJif8hHsNOqQqvbMOZzz26nm/r9bErqxsZzpss4wwv1X0GGKnPPJ1HV/rQGX1VlEdWWf
	YHNZAuKTm1qNJOhyxIEN7Vd33zPMg0G4Ruj8UP8ttsJvlV4KilvJOcZwLUJkwIVp4HysmsM0W0pKj
	GO7Xjde1V+xLKIiMhKk/CCJzyefn6L8h9b54uvmWPa9y/wxDoB0YLLN9pzOLMT3EnhKrjLTWTDiZe
	MTAzoj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzSS-00000008IBG-0RRk;
	Thu, 04 Sep 2025 02:12:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyHa-000000081o5-2M2p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D20736023D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 00:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8790EC4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 00:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756947417;
	bh=MRjllOB5k7do2Mzpzr9ZI39UjtDZA6LgQG4upFSH1zw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z2gBczkQxuTgSy/fBRuCQFkH+UMlEtNg+/4PPnreNwG18y3Q+5/lG+7XMJuYTgCjH
	 zbq08VeoC8Pw0PBCs77B+E2zDsXyIypZMdfEoRPYsbSS1bE6l/LK6plK5kpJAoyu2s
	 XHmAhU8iKlCEnUIq6rcdv0j9t7KZ7yvSnVMYecWsHVGqBLSuO6vh9FaNIggk+89SYE
	 88JW0g3W6a1G2xTOL5x524Y6LugqbU9uK62Z4jI7avrXUblZ8ys79PCBayPdYD3lv0
	 oRWvfprOfElPnIkn1GjsRNyLIZTrjUtKd1wGtEK9Y9/k4fr9BYWItLQvcO4vP6YNdW
	 xDbfrxXO71JcQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aff0775410eso172090866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 17:56:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNmJkSLlxbL8MlAlocGUCWfyKTo4bSQOwgfEDZH7DEqVFUDIn3NP3w8+k5dRdLOU65GRP3H1+l0tSWKSUjs6nW@lists.infradead.org
X-Gm-Message-State: AOJu0YzXbN4w++aybnE0QmJWE8EtAaU5tUkKMGAbo1fxBG2Po7Hvkd8k
	MhEMDxdlAClU2tFck9324kZfjpe3cmsBZwm32lQJeljE2dwg+7Z0ZeGAb7kZNfI4/U3K1vubYGY
	1wYzYurTGEh8yHc+m+8wkHsuZSj+ESw==
X-Google-Smtp-Source: AGHT+IGCJNx64Dx0GkinXglHRhl6xJWhxZdgTZF8IvPhJvgB/at5VHwcouVaex4sKP/jiu6EM6MdCf4JWwq2jMCZb8k=
X-Received: by 2002:a17:907:7f1f:b0:afe:94d7:7283 with SMTP id
 a640c23a62f3a-b01083377eamr1542634966b.32.1756947416120; Wed, 03 Sep 2025
 17:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250828213028.2266805-1-robh@kernel.org> <769c2a21-15c7-4c6d-84b7-cf1153106dfb@amd.com>
In-Reply-To: <769c2a21-15c7-4c6d-84b7-cf1153106dfb@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Sep 2025 19:56:44 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+N6MvgqRhtoiv7AoP7y0KQr3hkJUEMe1QdsfDrqHVwDg@mail.gmail.com>
X-Gm-Features: Ac12FXwuCcu1Hb0takRvWjUhRdbrcqAmtY4oG2CObO-UzUVulsf6t_4kg0a7Ajw
Message-ID: <CAL_Jsq+N6MvgqRhtoiv7AoP7y0KQr3hkJUEMe1QdsfDrqHVwDg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: xilinx: Drop undocumented "always-on" properties
To: Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mike Looijmans <mike.looijmans@topic.nl>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 29, 2025 at 12:46=E2=80=AFAM Michal Simek <michal.simek@amd.com=
> wrote:
>
> Hi,
>
> On 8/28/25 23:30, Rob Herring (Arm) wrote:
> > The "always-on" properties are not documented for "silabs,si5341"
> > binding nor used by the Linux driver, so drop them.
>
> Binding
> Documentation/devicetree/bindings/clock/silabs,si5341.txt
> doesn't contain it
> but driver drivers/clk/clk-si5341.c is reading it.
>
> 1345                 config[num].always_on =3D
> 1346                         of_property_read_bool(child, "always-on");
>
> It is there from 2019 when driver has been added.

Sigh. I checked and missed that. We should just add it to the binding.

Rob


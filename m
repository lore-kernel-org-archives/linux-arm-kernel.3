Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80422CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 02:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AP4EHyPiENgOeGo6lnIyAQbYkHufakN6exnZUysaUA=; b=txlo+uYA9JQo6ykMUxs9BzF766
	Vsuvcl/Z6TwtLWI2QMDLVvmKzo1kFR+ni83pbBjFnd+1cQU+euhazyCDjAHSFKzAQsBdn5UebXgJi
	L63czE4M2Ue7UwNccdVEze7xqUlEgPvxILaghH8Z9BzQL1Ma5urj88MtDV/OwiV/2UfN7ByloqAQq
	xaeMM5CzDpIydzKpvFomcyey2JS92WRwC0obd5NzLe4mRTj1UTDjcQlMR1LxA2z9BiiQ0zMdihYke
	i5YfXniAgtoCBMLp6A7l6dFgPsa/VyeNFWMxmc/hqxDehUqxfVUpaMYmEllyBFoaj/cPFpeTwoXKc
	yiaxaOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz4HH-0000000G1RV-43m8;
	Thu, 18 Sep 2025 02:21:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz4HG-0000000G1Qm-0WR9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 02:21:43 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77287fb79d3so494293b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 19:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758162101; x=1758766901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AP4EHyPiENgOeGo6lnIyAQbYkHufakN6exnZUysaUA=;
        b=KW9tRFAc4uwhO+2g4E0MpeDahjCOG9Gf5w3gNlKd4djB3nME807XCymWwn1eG9Q5r6
         OSua66TYErdzdfgER//6sNJy/78D6Jw4CEs1l6S0wgAnCGhF8Pc1jUYuUw35zD5Fm0Ya
         Hud0nLZWkCqY5oG3e/BsWialeHsjOwtPzzUYwPIOWGsfstqZaiXzX7GaFheYsGJayFKQ
         tYAOS0XuwUwJLtwBDNKvZWrn99rxFnbcLI1P4BquJlYCMjzRL14qot7gU969kQaY1omK
         gQnL5DDPxJss86/Zgl1tGjfkHDTELgzKYBAT33PWshetWIWx+tyKeJig7IDT8gmJ99s3
         /MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758162101; x=1758766901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AP4EHyPiENgOeGo6lnIyAQbYkHufakN6exnZUysaUA=;
        b=I/EawZhX3P5tXMw5G9ThprTCoQC17ysyx7iWZWQabnApbHMVVaezqY6wJVlalWe7eO
         5RDmMZERdmupz22Qqmf26zNfH31LxB8eq8L9NISwFkDN1YmVIp2reLW8XH8jAzUa//NM
         M5Q+NWvHSX8qGTxaSwINmSgV2LYRNVnPL7HjzUxRU8XbhwKYcBCcWG1H+ZwueIofuuvL
         PdUmQs4Sfq0WzFGRek/xDLoLTQuayG6DvkoMmZu+cjR9/lei0yUyQQHjpATNyF29oUao
         2sXO5S4yfOBk2OOD4mzxl4OkAyYXXR1Rfn+p1NtzQx0umTNTQR5RFdySl7P0G86mtn42
         pqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLgKbSyrYrXDawwJLeI++n6Sci6AyOPZNx07+QJ2It8iy1qSl8dOJSqOotNCiHHgvP3HFTHUffCuYqLx31ro2a@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpv/OVjU69cjLWgSt+Mzr1YvU4+8lezCTLB68UWKGpu/c2oVD2
	rJtu9/eDQAMW29nNWUAGQmgqgGwcNTggQwV8jEab26EUQ80RHOC2+uci8Qk/kqCABZ+par91DnJ
	YV5N2HvQ0ESsJCYNBnuTaOn1NVSabi8s=
X-Gm-Gg: ASbGnctDcavYOxDsSfMmbh+AIktWiE/JNylKnjKiOZY1ecx+GBX2rMA6PeqGt/yAAxu
	5D6zvA3MbVL3jHI0Ptnh+UyEaWcoopBad5k7jWDaS3mjUFlSRVsfUij32vbwS3RUQUPspGkNt1s
	RPUfmApWx5Lrvb0HvFyYQU1Lz11YiiPWZ4VLLt4tLXd86EJuJGMv+VzrNMNsnY7r4FaHMyJyhOv
	KKJl0VTkiEcSdBJleLj40D9Un0=
X-Google-Smtp-Source: AGHT+IFNb+V//PSot2NdNe8uHywPWrpykUBYjIUlGCyD/yVXRRWQERUfDT3CjUAAlpnDFP1yuGL6Iyf8GhGufhzMKhs=
X-Received: by 2002:a05:6a20:2590:b0:24e:c235:d7ea with SMTP id
 adf61e73a8af0-27aa85b47fcmr6198309637.47.1758162101119; Wed, 17 Sep 2025
 19:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com> <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
In-Reply-To: <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 18 Sep 2025 10:21:30 +0800
X-Gm-Features: AS18NWCtilTwOalEuEaTOVX5c4Y78vBcx4wNNE9JzBKwGJPsuMQ80m1HKt2v-vk
Message-ID: <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_192142_166325_7F7D9F19 
X-CRM114-Status: GOOD (  15.31  )
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

On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > Summary:
> > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > based on the AST2600 BMC.
> >
> > The Yosemite5 platform provides monitoring of voltages, power,
> > temperatures, and other critical parameters across the motherboard,
> > CXL board, E1.S expansion board, and NIC components. The BMC also
> > logs relevant events and performs appropriate system actions in
> > response to abnormal conditions.
> >
> > Kevin Tung (2):
> >   dt-bindings: arm: aspeed: add Meta Yosemite5 board
> >   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
>
> The threading between your patches are broken? How did you send them?
> git send-email? b4 send?

Yes, the threading is broken. I initially used git send-email, but for
some reason, only the cover letter was sent. I then sent the remaining
dt-bindings and DTS patches separately as a follow-up.
>
>         Andrew


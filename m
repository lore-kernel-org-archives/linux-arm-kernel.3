Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDBEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAJZSDB7xuKscLHDG+yRyNMB2g3SgALZv2+HI4HLlBw=; b=qv1BcHl0oILmfkYF7EFEKhK0Eg
	GS7CdwuGGJl+zSCv8jiO3X5vsZ2X/Bip1Brp5hMjW49LI7CQMImePE3Huumaapy+ZHCwWPxNLNKGW
	cOb/No6B77OGqj3McP/Fb7J6yXsIsni1YLRUTZdYz3tfwBGAmc6KbgfO4AEFit32Rgl3JkmiiclHZ
	RzLY8nS/I5l1AKnVb8TD3tgyKUZKNrVfAPb1BqjUFSZbDq+3SA4KvcXp4jzNtR/q6idMUOD2l0F0G
	+x1a+I/E50oyx603OrkThw1CUf2RYpCe+py0PMYg+YCMIJ/BN+I3mR9j2jFIR57I4x/6/jhAklDb9
	YDK+ZreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3L-00000000PEI-2M3o;
	Tue, 25 Feb 2025 16:45:03 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxPd-000000009Mj-09bJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:04:02 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30761be8fa7so53888321fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740499439; x=1741104239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAJZSDB7xuKscLHDG+yRyNMB2g3SgALZv2+HI4HLlBw=;
        b=FfjJCFLRDSSNtdW1gl25f3TTfk+3vT5B8ttmaB2dhuN1uYQggMr5VVH5/IRbPnDCxi
         3Tuyxxm35hlP09PwnsYTg+cziEmEDuCb8OXF5OuPSvjsXWFn+vZaIvuSRNb5dp6R/ugd
         RxgJ+D2vDxlmY/HDphOBO526Evk3iooEm2Dupj89Ogasjw1BvLBFVPselXg7olm3I12D
         gVl4ZSnfpjKjqkSNsLDZvEjP5v0r6TshiJS3Jot3NcY+vPYmiQVIgo52d5U8u4Cwts2a
         5fWdnqNKY3GvH9GTOykmh3Dgu2Z760mLAyvESYXwUJL3EmnhL9Nj1KvbKHlS8QaGBynX
         IZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499439; x=1741104239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAJZSDB7xuKscLHDG+yRyNMB2g3SgALZv2+HI4HLlBw=;
        b=fI5pgkRyqhZjIKH4S/HV7Z730pAEm73XvSI6Ohnykz29rKADuGJ0+VbqL7dggsVyo3
         RRj/F+T6NzvqfuZk6Jbh1CbHH6s1+6p8zZ9s3xvWWMNAVUxofaVlewk+bpnfQWvQsvrI
         2GmR4cl/eaD21r+uJGUlhgImuNhnOkHw1LgwQQGJ8PEGKgykJxrZQ5a8pd/c2xJo2bIa
         cCu5FncSs0zlXAYwvuDzh6TA3LWC64/mUwit51J7cDNio53+Bi+Bzp6AbsV41G//Y6Kr
         s4b7q0TYOe82T0ww6oF7hAzGbD6z24nf22D8aF83cl0FTXIFd5EbKupbCKPvubPiL02N
         gTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGOayVW/Lx63CcItvIs1oiO0OAVC+oNd8tp6H8izvewZNu4W1V+x466TpiWP87eMDX6hAMCW+hiBWZF3LHmX4e@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9EBt9/n2cgr7dURFiQhx5SkD2Uu7SZs0fupy0XjuHoSL+9uE
	CRQkOQ/sS/BQCsKvzHBZWH+8t/+GDRrMAmD5/bvB4rKzE+UzD3EbMItDHJG08faJsHWXAf/y0UP
	aBfjieAshxN6EvEDx4GRlrlqHQsvqcFPXr0SDoQ==
X-Gm-Gg: ASbGncv6WUb0WltC6QLjzlqBp3gmVGtRnPVKKzRkLrIKeMyvGYMQVSqM7tJFBz9cUTg
	FWrCE7xdrDFJdZF7uwdGBiiq3j/2FcPPQ30fcKpSANX1N7XCjGHXSStIVbpbBMsz6lSmAcn2Fry
	6d0RK/E8E=
X-Google-Smtp-Source: AGHT+IFwIPTPAN8ZcBc15otKiSGh1Sts3zHIN5YyF4wUrmvTE+Iv+8sCecZDdml+angRjq277rXIbRl6UYAnxPy6Zeo=
X-Received: by 2002:a2e:904e:0:b0:308:e8d3:7564 with SMTP id
 38308e7fff4ca-30b7915f5ccmr985601fa.10.1740499439306; Tue, 25 Feb 2025
 08:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-9-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-9-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:03:48 +0100
X-Gm-Features: AWEUYZn4d45FVOQcQnBxxxqs1Gqo7DdaaspoAnfO8hGKbCHJZAxez0cdfVz437M
Message-ID: <CACRpkdaH_Ajz=604PeYctvUbTOo76YOSvWvrovPF9m=O-VES1A@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] arm64: dts: morello: Add support for soc dts
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_080401_073077_98B8CF94 
X-CRM114-Status: GOOD (  11.18  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
>
> Introduce Morello SoC dts.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


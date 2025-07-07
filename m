Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 03:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGqfk2PaZrj9GeoaoWIiGGCSDwQnLrUvqRYBe5uTXnc=; b=sokBtO4S3GWvd1
	E9Mvb+sdkwh1lQnTGup3n6b/m0/0OemQy5ci1jts3I02VRvKE/V+lo3RROhFZgmOjAqhE0Y7YFdRz
	HqETXD/iyYKr4Qn1GlmZSda6IvBTTGf+/Tcmf6OvsdtqOY+ObWenybqWNDKNibeq6TmvKsF8RKo+1
	Rv6HAmGF48mVZCZc/GSZWj3hOpKbKPe12MQscdxeaLK5MxinnuvDjDEhLLSofwos/6wM4b3g23TLz
	Blz7UJlIKjKxRvD2jFUo4aU6nsI+Q4KCUqpfj3urzyBLcV7gMwJ2H8i2YFy+5FQbsZDNackUDyde8
	Kg/nLATCURxkqOmEWhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcEa-00000001GHP-2dQo;
	Mon, 07 Jul 2025 03:09:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcCF-00000001G2a-3mUx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 03:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5064A5C58AB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 03:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0445CC4CEF3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 03:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751857631;
	bh=v1UftHYhRB8xATjAz1JGnEzRaXydzhrZZxcPW/vtTUE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gPu3+fvMr2YkUv5RMMYP/4O11elB3jPtO1/cV6SnNUbtzSaH+I+9HqQBG1opoginv
	 6I1AEUSUUrsUnhiWWnQljRjzQLFk3LFX48UBxbrxmBFKfdDqdyBXsTteLxTZrEBtf1
	 JZvTpPrDmyigr3Yah/O4o4zltWPjHPih6s71SH1iZORm9h7hl8w8HSRWNNRtp/dHRs
	 alt1Ku5poCl9IQb26oYFK42+UxYn33OsouzPx074d6eg4720yTwACIaxDjE4TKQ81n
	 wTewSc1PU9tNcUMQ52Tu56xrC91xCVUdQLZHNEa2LttzIJqMCv9076LmMYjXJYAOeu
	 csflA8jap0FZQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553bcf41440so2713162e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 20:07:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhJvqL6uK9M2MBWCce9Y8tUifDgfE3ASCBj3wpd0gIcP/wFGtz8TcSkcmSB/PVw2IqVFQtCSrQEgiYQnmTLLwD@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMQghPMKE28climpQoRQPXDBRh2C+mGxLrfqR52yVcXnsJ9ep
	q3sn5xa6VkwMrOMyloDg1Bh5U3JE2KiBtekPWkLR06u1QFSz26yzYtCuH+LiJAMzikHLm9Y414F
	EpLhAej56ALZ28Sp+XIJ9ci2r6b4Ma3g=
X-Google-Smtp-Source: AGHT+IHSPXaz5/NZR5gTdJVLlMOpQ/Or5z58I2fgm2B/VVEk81Iu3g65q4sL0qURMsxxw185/SUJwCyLy824+p47zXI=
X-Received: by 2002:a05:6512:e93:b0:553:2ef3:f73f with SMTP id
 2adb3069b0e04-557e5528af0mr1667783e87.3.1751857629190; Sun, 06 Jul 2025
 20:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250701165756.258356-1-wens@kernel.org> <20250701165756.258356-3-wens@kernel.org>
 <c464d56b-dfd2-4e8c-a77a-4a0d05588768@lunn.ch>
In-Reply-To: <c464d56b-dfd2-4e8c-a77a-4a0d05588768@lunn.ch>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 7 Jul 2025 11:06:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v65rDZ+V6EuZQ5NDrV7n0C-4CpHLXP_M9M2hA-oR4cMJUQ@mail.gmail.com>
X-Gm-Features: Ac12FXzKWK3v5vqREGVst-EvPAuAK4s6ygrf3ghzOCWf6BVBtBER5yoQ2djNvyA
Message-ID: <CAGb2v65rDZ+V6EuZQ5NDrV7n0C-4CpHLXP_M9M2hA-oR4cMJUQ@mail.gmail.com>
Subject: Re: [PATCH RFT net-next 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_200711_979722_C40315BC 
X-CRM114-Status: GOOD (  13.39  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 3, 2025 at 4:19=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +     if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
>
> Please use the standard properties rx-internal-delay-ps and
> tx-internal-delay-ps.

Since they share the same binding, I guess I either need to split the
binding so that the new compatible uses the standard properties, or
introduce them to the existing dwmac-sun8i driver as well?

> Please also ensure that if the property is missing, the default is
> 0ps.

This is already implied in this driver with the initial register value
being zero.

ChenYu


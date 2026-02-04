Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26598E9D407
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogx23gacZZgPrV0U5TFdmtL8gJvQMl3JZYOLmU3rg7k=; b=x651/8xy8WuK9Nr/YQ9MoO2nm3
	yZ3B/XuFptNFHEPQMRyaosdRFnCX7GqUB1ZaCzV/KKuaBSYRTsIIaPYVf9p5hZitogf4y9AqTkrxw
	e+x4vuIw6uYclqx9SDHRX4D+VevLYevKPfgoibA1uobsPjdekehe+cFfQaFGlT1xzYJgs5eA6uA3t
	y4bZTeOnC8xWRMnXHHqHvztI30mIxg2e08WlGqQLqCfRh0fr/XzD3oFPY2GAehfduSHhxFgN1CuLV
	A2zj7oX0o9MNFvqC+raSQk6C6sokn2XqVdlvvg789rD4bQ7pqDTC/xt3JAX6BeHuFK5addkP/nWsE
	RgJn6rBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfJP-00000008ikr-222J;
	Wed, 04 Feb 2026 16:01:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfJN-00000008ikU-3lji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 16:01:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A8D36013B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 16:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00814C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770220861;
	bh=ogx23gacZZgPrV0U5TFdmtL8gJvQMl3JZYOLmU3rg7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YBtEcCfAGopIG1lhZSrlOhX1KOhWKS3Y3rt8QJ2gzfSmDCGiH36nnkeYrrUYPTDaD
	 dgnAnalLYtZi47jTpURFNOLFvWzIkF1lMf0nrcwoACXFmXEND6vDkqAOCKKNBe1B9g
	 I7o6Pnon4TrQIbsDNaRmqYNGL0CpGq3KUrupePv6I/iJkKi9Z9Kg20i5SsRoKUoECW
	 T4vmTc2yBsIAzgNlKEURGoZuYMqkkzIBYjOikufgSoh08ydPv5t5uTcHnajKNGQ/0E
	 Nihx5a8Gu80JYD8KeKoJogmIwYe6CNJpQoTOIpADSKM7kvFa+CgMyTy//oVda3EMCg
	 86Siu7xLe7DDA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-658ad86082dso12017693a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 08:01:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0wvcw4FgwtX9DXhbVadvzLKGOhxMVmvDoIGUVl8cdPmGEZuEcatfOJ0Nx88BOus20fUuO/9dHCS9DTLWAhQm/@lists.infradead.org
X-Gm-Message-State: AOJu0Yys5hgc5ecw9FZWoSCWMXASfcUIFTq9xe94CU+yRjnEo+cDJ5LT
	jsoRRqTJ15S8fT6BRMuh05E9mAOWpnr0SxSHkL/T9YEg1aAwzFsvqTYwAiQOCl74DYbgOxeUAQB
	2dNn+hB2Uy3oYXvL6MmF4NzH3cckH1g==
X-Received: by 2002:a17:907:7fa8:b0:b8a:f29e:307a with SMTP id
 a640c23a62f3a-b8e9f396397mr256996966b.57.1770220859406; Wed, 04 Feb 2026
 08:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20260204091530.624230-1-miquel.raynal@bootlin.com>
In-Reply-To: <20260204091530.624230-1-miquel.raynal@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Feb 2026 10:00:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJC5mn0RW9oT+VK7eis7E1Fb3OrgfJxaFnX9Rq9de-TeQ@mail.gmail.com>
X-Gm-Features: AZwV_QgesdgcB5JYe_mQ7m9VfFfTGajIr0ZwIwKl7g78T8EJ3qG35kb1pnTQmS0
Message-ID: <CAL_JsqJC5mn0RW9oT+VK7eis7E1Fb3OrgfJxaFnX9Rq9de-TeQ@mail.gmail.com>
Subject: Re: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

On Wed, Feb 4, 2026 at 3:15=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Fix the dtbs_check warning introduced when the brcm,brcmnand fallback
> compatible got removed for iProc machines.
>
> Fixes: 4db35366d6dc ("dt-bindings: mtd: brcm,brcmnand: Drop "brcm,brcmnan=
d" compatible for iProc")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Acked-by: Rob Herring (Arm) <robh@kernel.org>


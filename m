Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3DFCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 02:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/sG5Ec7Hlcd6BQNqJwLka5sDq9zcWIANhRNknbwVaY=; b=rSE/Ppgca9rWllEGVLvbNpvVkN
	/a2Ea+sZNOazqkJ39JHEmV289jRueMtSAYluuqtllK1MBeJ646kNhIqXCC49Wtee9RH86UNqOB38G
	ZswhOyZiMLWl0v9dqDQT46evG8oRme+o9oN1JTt+H0+5N9e8Qpoo6CGYbO0spOFLgVXqnFTRWuMAy
	0z7FTcwrgSMFM6zCZ69l+AIaiPSDwjtG/SVGhTR3ofsCWAU0c74GAPGSpbrRdCsIOxbL7IIBVSKMP
	Pj3FJHE4MB+HupgIpMv5UOSxk/EP79QolyAxpMGlGqbUkonuOz16XFsDNCgvu25AimlqmTtWSA/wc
	+Tm1oInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSqt-000000004xz-22xH;
	Thu, 28 Aug 2025 02:59:03 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSo9-000000004Cd-0c7f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 02:56:14 +0000
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so664728a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349771; x=1756954571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/sG5Ec7Hlcd6BQNqJwLka5sDq9zcWIANhRNknbwVaY=;
        b=V8eUz88Kkuv+dSmdLF3J1NZWuqykCLKIo9M76JbMEXm2XHhABNPdVhrHzfvX5Q2pOl
         VpabFEn03TSeBkfzNCKKYlEfCdAduhN1qQYDXNi8xFS/K+aue+Rt7sYwsTRUg/LG3gyo
         RrWzMZuUVjUJrjcMSkPxAiZsM7e6KqZ18Ev3uKfTIQhDEUQYbStGQRRrtJGCJK/tcFMi
         zqk14iTc7aQLT6/MjBk6QYwvt6yqDhGFhOZmRCE7HZfYJv8rkU/k5a3HbVSJV8rbbvqs
         DwzT82rzMkjLdwoIQTHZnA7YRFW25/aOSDto0ZvajVKvZuQjjzsb3UkdSfPRYheyHCJY
         2Fng==
X-Forwarded-Encrypted: i=1; AJvYcCXunHYUR7+SccDtWp0uskvYi/RZZ1Dvc0Lnrvd8XwcYZL+sCIKRU1Plsoe4ffftm8qWL/iB+gDWrTSRUddqr26K@lists.infradead.org
X-Gm-Message-State: AOJu0YylyMuV9hdjO09t/OVO+TWdAcJwhKyEgjdESNFjWB9Hj9NTE2im
	m7i8srgnS6gNkmxR1zDa1DphJlkdel59x4pLklhXKLINnhBxyHAMzuiisy01q0b8oIs=
X-Gm-Gg: ASbGncu0fNbIWE04W7nB5nrqlgMgYXEKeCeCK6bZhTMDs2lTt3tZP3vJLzR45xo9mMn
	PlTnUW6oMbbzf57/wdJtKZXBFHCSZKAitujTwKWwtRzbwNpY8rO9CKiGbJMgA+t2uNPzrBGmj4h
	Luqq40Zqx6sNMaHu3BwVjz4AqyC/eUFetDB14esQSI3uzsE1fZDx35hzt/gAc125fmNEJue9T5j
	WqL2sEmASwn1Vv0rkUQNU0JizYMjiOr6KpbnDXuQoxtEtNvyiXVDIxRdThKDDv3TFYHlmP3au66
	3siwRvJltEArxO3L2oEyti479TNT6oW3w+N1vSx4OYj0u9DwbhY+UMpXbR524SIF0eao1VNDm9I
	5pZF+8rnpCNrWflytHqvyLrh2zYCZi3BBD5Mdn0TAmRGM7WDlaB7X+byUvqFGOXEiSpCu/p4JpN
	QmuMSq/qL+Wjsytj5Qu5o=
X-Google-Smtp-Source: AGHT+IEjsksUWJy7fxj/dQlVBL/FKkIlkfjUK4xUKO9QYJQfaT/NjcqUZWfau0zHh6wbgQTtQx0MEQ==
X-Received: by 2002:a05:6402:35c3:b0:61c:61bb:e836 with SMTP id 4fb4d7f45d1cf-61c61bbec87mr10310103a12.11.1756349770932;
        Wed, 27 Aug 2025 19:56:10 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c90ffd677sm4428923a12.46.2025.08.27.19.56.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:56:10 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7ace3baso74650966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:56:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzVePlRtd3VVRwNljJJ7PcWhAmlywzvfw2UVAIu/zv/4hQfjqFxR4TXA8SSPueqh+T9wPgVt5qFnoCqDUJV+9B@lists.infradead.org
X-Received: by 2002:a17:907:7f26:b0:afe:ea46:e808 with SMTP id
 a640c23a62f3a-afeea4747aemr33407866b.47.1756349770127; Wed, 27 Aug 2025
 19:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 27 Aug 2025 22:55:33 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9WSJ_eyuKfZejCNCdN5g-V-7_VSW=NY=Sxc4jCJfDcJA@mail.gmail.com>
X-Gm-Features: Ac12FXybLNW3dXUB-nTs8fEB4lNe9ODNBHdvueiT250V7fxKSinYXBh99Kd-hDc
Message-ID: <CAEg-Je9WSJ_eyuKfZejCNCdN5g-V-7_VSW=NY=Sxc4jCJfDcJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Apple device tree sync from downstream kernel
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_195613_188453_822C1651 
X-CRM114-Status: GOOD (  20.15  )
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

On Sat, Aug 23, 2025 at 5:49=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> This series pulls changes from the downstream device trees which are
> supported in upstream kernel.
> Most importantly it fixes the PCIe description for a specific iMac model
> (iMac M1, 2 USB-C ports, 2021). This is worked around in the downstream
> kernel by not disabling the port. In preparation for submitting M2
> Pro/Max/Ultra devices trees I investigated the issue on the similarly
> affected M2 Pro Mac mini and fixed it this way.
> It completes the Wlan/BT device nodes for t600x based devices and adds
> the missing 15-inch Macbook Air (M2, 2023).
>
> Checkpatch emits following warnings:
>
> WARNING: DT compatible string vendor "pci14e4" appears un-documented --
> check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
>
> Which I chose to ignore. `vendor-prefixes.yaml` prefixes contains no
> other mapping for PCI vendor code and the list of ignored prefixes
> forbids extending it. Both options feel wrong though. "pci${vendor}" is
> clearly a vendor prefix but duplicating the PCI vendor data base feels
> wrong. `vendor-prefixes.yaml` currently does not contain and PCI vendor
> aliases.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - fixed commit subject of PATCH 2/5
> - correct Macbook Pro (15-inch, M2) to Macbook Air
> - added Neal's and Sven's Rb: tags
> - Link to v1: https://lore.kernel.org/r/20250813-apple-dt-sync-6-17-v1-0-=
209f15d10aa0@jannau.net
>
> ---
> Hector Martin (2):
>       arm64: dts: apple: t600x: Add missing WiFi properties
>       arm64: dts: apple: t600x: Add bluetooth device nodes
>
> Janne Grunau (3):
>       arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
>       dt-bindings: arm: apple: Add t8112 j415 compatible
>       arm64: dts: apple: Add devicetreee for t8112-j415
>
>  Documentation/devicetree/bindings/arm/apple.yaml |  2 +
>  arch/arm64/boot/dts/apple/Makefile               |  1 +
>  arch/arm64/boot/dts/apple/t6000-j314s.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6000-j316s.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j314c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j316c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j375c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6002-j375d.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi   | 10 +++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi        | 10 +++
>  arch/arm64/boot/dts/apple/t8103-j457.dts         | 12 +++-
>  arch/arm64/boot/dts/apple/t8112-j415.dts         | 80 ++++++++++++++++++=
++++++
>  12 files changed, 161 insertions(+), 2 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


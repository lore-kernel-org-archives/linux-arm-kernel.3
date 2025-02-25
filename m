Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48871C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWUvknXfYYLvFqt4wPTgbskSKIiWK+wf2r8m18E1vnc=; b=tWX3JUkKgDZYaV/UhEOpFaphis
	foZCOv2zXjpcMFZ6I+dDunjTiJs/h5DATqaJpxMVt/TgyLG1Rt7rkO1+tSbjtu3hdpqmHETeAzsAM
	zhoJi1EB/aEIWNxhCBA3gWv9f3MEO65HMAWNjfHY7dbY8DcHcJNfH84yoi+bIuYb+b0jJ6NEJgL8u
	VD3H7GQ/ZR8p8FQL+GmTIonFvXBIOdZB/v4FViKgQxat1UZuJQrMq7I5zshxR+SBk7evMfgidRCrm
	DGDpMU1z+oAwzZf59srxDHueFHgYu9W0xciu2t8MFSRBQTbG8yP6jQR7AX3HklAZNPCTHp2Y2q0Wg
	GpaybWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3O-00000000PHs-0tCK;
	Tue, 25 Feb 2025 16:45:06 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxPt-000000009Om-3557
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:04:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5452c29bacfso6267750e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740499456; x=1741104256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWUvknXfYYLvFqt4wPTgbskSKIiWK+wf2r8m18E1vnc=;
        b=srkYl6EeeMq+3K/i+5btqM4hF9MBsbeLfNTPS5gvnOslgjjhs90LziLWQovdaFBPfw
         kBT+TvY3EKz+dIYDLh1Gcn93yPEEmAZaCo4g1bVyIn5rozDxbbXVeWuN0VZicItWxIrr
         YLB2O5u5gfKB3JvOwcRggV66YHx3UcjhSkwr4MUdBm6v6iAUHaG58WnskvyKjjZ6s28N
         mgwaMeh2NyXGmlFzIJZmmGhhj58zYeatONdQWL0hl1sgkJCTCrr0lw67pJhTv9AR5UeL
         yT6Qim6mMiL3FR5JoHwrCEoTU3gh5TNMfNgegCyAXjMNtvV0GLB49e53sBONUT67dJDO
         gpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499456; x=1741104256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWUvknXfYYLvFqt4wPTgbskSKIiWK+wf2r8m18E1vnc=;
        b=mO9pKU3LiLcF1A8ICi8qnXyoBRmktHPTZio9M25OVpcjtoVRxmF99ZVf1JuIDO0oUi
         lIRlYeeFB+QEI7BRjIYuQMaEPFE/rEBMNgxb8M7Lwtccnl7Wv1ynnwPlJGhc5HDLeD++
         hOgl4PYfa4BqkWd3tFbUBjZNZIbkdf00LY8VyL+Tzyy4wuAPP51JvtXYuplGlyxg2Q44
         TGZzTaEvGCpvb3TIOq4m35MSwNg3vqcvj9L+4KoNHtKjyWLl6+6DDZkiznvrYhZvZxNa
         JiJWIc6U3XqCGs3si8002Giqdf9KAgfwYO5ZX+jrRlhi4w/r49zeFSbr4UcKclqgKy0H
         ODIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1Atb9EwXws3jCgqCTGm8NnbI8jWm0VaUBeH9UwUmahj8eDgZtx7pg/bJENYepD88iXgKB7fX+V/RkVwd4qAX6@lists.infradead.org
X-Gm-Message-State: AOJu0YyNUzxYE+X8eiv1SvjeQeQLnbzw4h0c1wVYXJ4ktMPzQiQJjer2
	pQ/uY0yDNU78h6qNgc5yZ49Y5Qr2liewshdqLA7U4de/iAi9eGIjOiLCAkjhT0xcbKBWmirlcpQ
	fAIffjJbkOIw+RomWeD5slDeGVpZ+GrafTLYqZA==
X-Gm-Gg: ASbGncvSteK074r4VGYieosYyEoUyGZT30DPRfVI2fZjqVEqsgoAjD/ZjO5BFt0zgKK
	BcENvqcSE+Ic8wXpU1gRX3hrAyp2eXgiqdxZ5zhPpJEztYZVzlh42TReVf617PSH7TVd9eT2KjH
	X+lvRNZoE=
X-Google-Smtp-Source: AGHT+IHNL/Gah3mevPZy4cnB+3l/3UaI9egw81hpQvTsWfBgPed86olYK84spCPWAgNJnWS+LPsg/bk0GhoKPm/zotM=
X-Received: by 2002:a05:6512:3e1b:b0:545:8cb:218d with SMTP id
 2adb3069b0e04-54839268650mr7339170e87.41.1740499456063; Tue, 25 Feb 2025
 08:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-10-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-10-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:04:05 +0100
X-Gm-Features: AWEUYZmNsEy3fFFOlFl9Mr8FzjBUhEhxzOfrGNxvr7eNpQOWSTLd5B3Z3JZojQY
Message-ID: <CACRpkda2A-3LDM=rbdLO9F=hAnMY02a+_m0hLxp6Rp6dsHWoLQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] arm64: dts: morello: Add support for fvp dts
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
X-CRM114-CacheID: sfid-20250225_080417_769779_0D4C714B 
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
> Introduce Morello fvp dts.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


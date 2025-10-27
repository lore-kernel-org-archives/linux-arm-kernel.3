Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0663CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3ckgEiSkq+y7z9usMTBGQkVGgGdig/5c1NbkqTAlEY=; b=ySZtFVCpJGe83Vzuh17ITgdWzg
	pn1OK54p4LDe6l0Jxcgvh0b+cXqZO6vtlX/nYS8SiIfrZHLGbc/kR+HYP0eOxOFqOKoM34oCsQRdE
	T+nbihlLBZm5V0yBhlIX4nDImcCDhMAsJF72Gj9RJ/sEFQF5jjxB4heXcyAh+Rj/sBsosT+YZtyXo
	ZU9EZjMaEYQlVjekcPV9Bw83tZvIj0u/I48WcS2H9d9DWJdU6Q1LLVAJVxPSKiyHx0Pf/ezRiHY2O
	aLzjgnwkjY0vTwlTshlQHxbm3AEJIRrpC8v9chZkAEqE20qesn+dzDD23CBE3qTTRc84SqXPgCaNw
	kAQ6NJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJJL-0000000DVFY-0Pwv;
	Mon, 27 Oct 2025 09:14:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJJK-0000000DVFD-07kS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 09:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k3ckgEiSkq+y7z9usMTBGQkVGgGdig/5c1NbkqTAlEY=; b=kr4U+T4fYkicTgdBntJQQJcGN4
	aBArk8CNpBLU9uk/521LA784dy3QbhpuRJYQOCHw2or5jJRDv1Jgz18kzFMYWmU57RtB58gWHhPnh
	Ku3e+lkY0xX9exoxgWpzv9uwGKsr0qceqzFuQX1oCoS0hF16/0/JBx50xa7dFDEcGdAAjco5iPmnG
	q/dnGNwYwrUnOWnHOaCWY26eovnYLvsl0k40fCskSGMeTi3xPmR+VjPLLmQXUWjmbDSqTSWgRXchk
	aHvVRZ1Er0LhA8jYTSYoE1LbCy0qBte/mzhhdoouqZlkA8icO61D2fg8hMgZh+kt1RKfboX1SmHPB
	VpkN9+bw==;
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIRW-00000001icL-3AYh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:19:08 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4e8b3b6715bso30823841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761556476; x=1762161276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3ckgEiSkq+y7z9usMTBGQkVGgGdig/5c1NbkqTAlEY=;
        b=c9vED40XQJRS3l1OLjd+tvKKEh/UxLWlfaepZmOX7xPc7BHJK44TKHCiVSHSzAz4px
         HDTyRunes0NmRRVx8E4u8OwX3Zvn2I/woLwy0/8P9PjRL1QdoAy5UE/ZLUYAy9T9zwMl
         2lr0iNjI9CnA92GSMbEkD4CBkpcsRN4vS5y7tlrasEUv57O3hdlE0MYUwvzAPzR4JR1f
         Ej2V98S6xabfQCPgFUmPyVzvr2MF5E4QwZHDhi0POMEsEX4rANFr8FuLm+mz80Lixcv6
         5ispZTbHrXG2fLVSFfGfWp7aneRY66ouUKDpdgwgbRfZ80bGcRDNxHgfbwkH5RSvL5gn
         TMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556476; x=1762161276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3ckgEiSkq+y7z9usMTBGQkVGgGdig/5c1NbkqTAlEY=;
        b=fRSaBdL1F6+ALK2IciAYN7GmFcD4x3OU3RJnUFN4bYvv8LyhOeOKCqjQKIh7zEXPRi
         mFplSrhEWk22K0+zR0tvPssaRXmfHd0YDCptu5LJnagJ5IBKwj9Ek9/3nCJixAscN57C
         citw9KnkXu5rfKFNUQVm87m7WwaLdNiaUkU4/C6K7DubA1RR6CGzVfDfzCpVwuYLboXA
         ahu1kGgXY1YGtQHOE89JOLeCW1nf5h0U8445EaVTLHUahUmPUsuIlVe697U3ywd34TRr
         14noSlkMl+pHSefCPJOwx7aOtGW0wLXQqJSVQE3/mETnjJKH2M1oN1OtbBx71nI82Ps9
         Ch4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZh05s89RHx/W0AAvEc/VE9+3ybf0M0AQsfgeF6iX2OF68OXt+v+w+BMUbZlwoGnhgK+CNSL+h8tRwcU1MQK8E@lists.infradead.org
X-Gm-Message-State: AOJu0YzipD5U1sOEIjzFdQh+cvVPdt84vRaPAt3qp13uctLSHZWn26mi
	fiMpaZcxp84YjzxrxC8BM7febEdsD/XJrbgRyNIoelx9VD/hb3zb1xtpjD18E4EvYY3+A0vQ7ez
	jfyVnii8sYaXbG3Lie9Xv5nbmQADvA+s=
X-Gm-Gg: ASbGncvAiXUebzKLb7kwdtV6LP+PhEmXj8TtOOUfrEDiNrIRTcvBa41tZFstcdXjABh
	Ha/Z7H9z2Kps+QgLioesmm+yn5wX8zoI06s9PX7vv+1ECzf//PMD3S+yTmk9FnUrRdHRtoSZ3jm
	FYAPk9L1Zt4zCHW6Er5IRUzGX0pks8iibXc21Oa3f+V7vrBcpmG1p/mP3wGxmH7blPu7jveL3Vz
	WaLvFDZM4WU2iG2dnM3xeDfub1E4kgKfZXMXeS5RCNUqBaUimcCreTEKm9wgnpvB5iYvkZSGKHi
	SWcCTfznKl47U+QjkTeuY0u4YthY
X-Google-Smtp-Source: AGHT+IF/2QvCzE1TEuKomhBiAScmROMfTstvpHg7L8JdAeBZ1CrC1wuEfqNsUGGYV9Dp9piQXEYqMgRlhzJKaaFXdAc=
X-Received: by 2002:a05:622a:d16:b0:4eb:a2ab:4182 with SMTP id
 d75a77b69052e-4eba2ab4738mr100138481cf.22.1761556476187; Mon, 27 Oct 2025
 02:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251026194858.92461-1-sigmaris@gmail.com>
In-Reply-To: <20251026194858.92461-1-sigmaris@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 27 Oct 2025 13:14:28 +0400
X-Gm-Features: AWmQ_bny2G__jDeyWDUL9Y-J8F57fNDWZftO8M3HOK0HvZdNg6brhmmHAL6LiRE
Message-ID: <CABjd4YxsfxwEbic8QEabX1h9j0B3DBw9LWwctJx7SzdvXZdDhA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: pwm-fan overlay for NanoPC-T6
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_081907_018892_7CEF179C 
X-CRM114-Status: GOOD (  11.85  )
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

Hi Hugh,

On Mon, Oct 27, 2025 at 1:09=E2=80=AFPM Hugh Cole-Baker <sigmaris@gmail.com=
> wrote:
>
> FriendlyELEC offers an optional heatsink and fan addon for the NanoPC-T6
> and T6 LTS. Add an overlay which can be applied if the fan is fitted and
> configures the fan as an active cooling device for the SoC package.
>
> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
> ---
> FriendlyELEC heatsink with fan addon:
> https://www.friendlyelec.com/index.php?route=3Dproduct/product&product_id=
=3D305
> Vendor DT with trip points and PWM duty cycle values:
> https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b62f5aad139=
fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L=
75-L90

Is there any downside to enabling this unconditionally in the board
.dts? Overlays require more user configuration, and not all
bootloaders support them directly (e.g. systemd-boot users would
struggle). Compiling with overlays enabled also makes .dtb's a lot
larger due to added symbols information.

Best regards,
Alexey


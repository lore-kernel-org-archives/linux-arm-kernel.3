Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0C0D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=752Q04PLM4ySoJBMNJIIwMx5SEQI9bfYRIbNwO7mz1o=; b=baibiZLmKVcv/eQg2z11cL8P2i
	pqdIYBhOYsv/mVnHzwtI8Wwe0odQzh8LQIQb4UY3kTd0MZ+ze3B9BbYlAO007xmn4Q0MZnceDCQBJ
	gTIlvlIEi/6zsjMO/UMVXKjMwgP/TtWP1UwYsDWEnFcuuBI2sFiTfNPCgmOuGVIq9rk0STOdFlr7q
	533jb8JXM2KHcoYxZoPfyWh1dFH6mUFShUPNgjCA+PAimDDi99kbmaN1KC6wfkaoIeoITKlfK9HiD
	1E6c3ZiFYvz9wLyyktrnXkEpml3o4+8ZsP3fNpaqJd3zVAcVxsqAeYSsntVfRzuJbstbSC2yyNoB3
	2BW2WjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KX8-00000009oat-1fAP;
	Fri, 08 Nov 2024 08:39:58 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KQQ-00000009mtg-45Ip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:33:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so28462831fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054781; x=1731659581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=752Q04PLM4ySoJBMNJIIwMx5SEQI9bfYRIbNwO7mz1o=;
        b=ZAsrx4J4lcgqAvHYwq+YLb0TJPJtFkE0X6URH9ysKcatlfeP0kJxD0wlGOG8BYb/3U
         5zevsJem/E4TyvzfI9XDbSY3C5qtQkba6SMuxPAoXDuqGcn7QHPVTpYNieybwqjlH3x2
         CDwaB4FcK0VTKeb5KJKP6VYuK7vKa87+gUYZWxynFKZ6ddxwHDjGwA2q9PxTN8H1+xxA
         b5bSBfRbKBKcGBGLEerwoCgi0/ROZD8WxzYAVYjz1qeD+w9a1gl9kOI+AgBD96bqoJSI
         20kKgezmIwh3phjmKsPJA3An1HF5FXTnuhCXrqYrnDQBMB++E/xrRmEXE3RoIA2EMr8H
         0IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054781; x=1731659581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=752Q04PLM4ySoJBMNJIIwMx5SEQI9bfYRIbNwO7mz1o=;
        b=wgO7Elr3LDtyf0NfCZSmnfloT7ase1SgGHeuNuD0s21hVzOmH3adnipKOKB8vFHoMM
         oKLUgB6vJSrVpgzvFIZr4bQPLWGWfQiDtoIpj8OdmLH5f7DadWa4OTMAhtmdZ0ziE3Fv
         TcNb92xoloCxiZfKcwouh7q93Rz7ULjj8Ptg4kT5B/o9fA/NwPkzrVPXi4mf0k7ZL4/3
         ubdYpaorMF3Psj0VS9HaY7ccImUNocZiPdhjCsCFvwYt0IDiMvBfMlgXYKMOyoicw6Uh
         LxbAc7eW3A0HC+0E5y5O0O7UAqR+0cZpowI3/uHp1vZ33Y9CnUFZ2eIZsjR9/uclHQCI
         zNdg==
X-Forwarded-Encrypted: i=1; AJvYcCU08oAfyyb7q1Q8p/5fDY6qtIULpTLLuV27lXLGlTfqB0yfRMGdRIWfAVaEd43Kd/FzAYmt22oQ4H2x+bdQoy0g@lists.infradead.org
X-Gm-Message-State: AOJu0YxDCIa3nRbmX1x+GvufeCiXhRldUQiqyTZqSybYnP380UK3/W4i
	xmLzEnvEdvw7T7lS4ffpkMjBth2tsu1h9GHT7MeC+mqVvO9H2uWBIti8NXnjAQno0FjcuCHV7+M
	eGAnJTUHdP5Q5dPu2wwm0XrtIMvPbmtDp43WFTg==
X-Google-Smtp-Source: AGHT+IGUskTynAw9BMroXZo5yveDcNBcLD4Xp+P+d+67e9FvxhQBmFNOU9SytRx952Jl6I+6VFOyzo/vbqJDUlA53Wc=
X-Received: by 2002:a2e:a808:0:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2ff209de8b7mr5901521fa.16.1731054780928; Fri, 08 Nov 2024
 00:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-3-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-3-e050609b8d6c@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:32:48 +0100
Message-ID: <CACRpkdamE0dGDQ5hY_WRTUFaiJKGEkOZpNLZ-SoXH1u=6YKrxA@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 03/12] pinctrl: single: add marvell,pxa1908-padconf
 compatible
To: duje.mihanovic@skole.hr
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, 
	David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_003303_080256_0430C711 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 4, 2024 at 5:59=E2=80=AFPM Duje Mihanovi=C4=87 via B4 Relay
<devnull+duje.mihanovic.skole.hr@kernel.org> wrote:

> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>
> Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
> separate pinctrl driver later.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Patch applied for v6.13.

Yours,
Linus Walleij


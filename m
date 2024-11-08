Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396F2D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=; b=vgDYJgFmT5QN9qSxU1yTQHVAsZ
	8YlkFyGRsVDrD1/er1Gv30LR6A3s7NmAmlfrkRw5N574h2W9TI1U4aCfbE2i5DhSJUur8znbUIlVK
	lqet660gqOPnsmSZJfdMFeKE/oHy/wfiMkWX7d/3xZh6xwQGNsLFL2uH6Y6CNhV0gB4RiBnsSqWHA
	/ymmYu8MrsKuDMPxiqeli0IWlZasesF8AgvM/Ja/3eqU4K9geR/x73eHdVds+4DKz4OXOJ//8nCpP
	8VloRkyhqTxOCab5Rjpu7fFe8TYocrKYnzmhRTfD/gbh+5iULPDfGbkOJ/ztBwTt/hX4elPZZZd3y
	T2Hnn3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KVL-00000009o6x-3z6n;
	Fri, 08 Nov 2024 08:38:07 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KPR-00000009ma1-3DFS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:32:03 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so18277181fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054720; x=1731659520; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
        b=lc+qNjL30Aa9NZfhzO7d4UTVbH2ImXj8kouvYwpYvuNs1V72JPpViCSLlbuU/qLbnu
         AIe8qesYNOrCDEvzP819UtwjSRQI0icxVDyWuMtYaP1gOl1fKSa2ZvOmSuKsDzNYuhaj
         WpBTaeoGXP7Jk6ZhyIn3MrTv8o0FHhmDfpk6E0CKHfZXWIp8OxIYKO8DpyKQnuSY0BOM
         dyq8STrW4VJcCNjKTpP3LCe0Plclz6IgYGhMsMt/XUq0HTKtw55RSRixuJOrtRl5fx7I
         IgAOIQ0TjAiSuXRbqaMib3WpUtjbWNCQizddWa7vVkH92ZCUCbthrSJvZASKFfPF490O
         ihaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054720; x=1731659520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
        b=MU+7TSDS0WNjuAXn5En3ucC7/ldj33kFicF8jYUlKkk5C3NEJNITzo804bo1eDOHn7
         fu+h58/fZk/7s33MSpRSn3v0A/k2dNEV9vh1F3WXhc0gdxFdloaH7SprNfFR9U9H8occ
         I54kgyJsHTFqZ1K9oG8t++1NbNKALv3yBTB0zMvf6TMjscZtg4B31kB1Kc0Cntq+SLk4
         csCxV8MtLW3MEM+yP7G0HycXV246Sk47EOXIrSDSwkpNmLTDeZP84NArWp07LL2G5att
         JMKYsijV77s/QdfPzXvv+f2ME73RfsdPmReD+Kni4xlxX7y9F2m00d26SSz6e+Znc3/p
         5ghA==
X-Forwarded-Encrypted: i=1; AJvYcCUfcAOXGJYrYRW0kejMAsQV8KDDHWaFkZ10d08AWt5EUJrHn156g2Mv7MBP8XXAiqOoizDI157+hfhIRIhqVJuW@lists.infradead.org
X-Gm-Message-State: AOJu0YxUl+cUuLZqRcjGB1vO8gF0yeCNOYBnuvji+8Rq/9l/27S52lKQ
	ibBSDhETKkwae1WtsyJ3jVU51j0x05tLeuAP19WnCbwysQI4YeffS0yey/2VtvFfg4ZFog6zSE+
	khgxsDJwvL3rSauTcA7Otpc45KTdKCIHn/d2zIw==
X-Google-Smtp-Source: AGHT+IHWAsQqG+y15H2WGwWZPQvCIg2GrPsoE8du8PoiicmJWn/4qgCjO61EIsCAk2BM4YFh3XSjkJBItIutIXE+if4=
X-Received: by 2002:a2e:ab08:0:b0:2fb:597e:28d9 with SMTP id
 38308e7fff4ca-2ff20188093mr8640431fa.14.1731054719602; Fri, 08 Nov 2024
 00:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:31:48 +0100
Message-ID: <CACRpkdZCF5o=1bc=tj7VM=ie-iakmBC_oeJh-LWqtsASw4eRFA@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 02/12] dt-bindings: pinctrl: pinctrl-single:
 add marvell,pxa1908-padconf compatible
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
X-CRM114-CacheID: sfid-20241108_003201_824085_ED00D56F 
X-CRM114-Status: GOOD (  10.44  )
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
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

This patch applied for v6.13 so you don't have to reiterate it
after rebasing on v6.13-rc1.

Yours,
Linus Walleij


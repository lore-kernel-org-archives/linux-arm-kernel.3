Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188CED29F9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 06:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mba6U/dT9znvEMNh8rko7R6epkDmG/m28ZS6cZzb6Nc=; b=qh3fHx3gsoaiivE0kWcVHjlS/W
	1qmSBcYopPhQKl4/Z+Hd05Nu8ALxgkCzvCIzT9ZQp1f5Tg74KJguanp3ANZ6bXifBymznToUiaq4a
	fyUfnYWIx1/eri0pYE6dKZLdb6LtJfdw6JpvUoyfvz+yvZXnPTNAaACLYd0QyqKjYA+t5348zv/x5
	GTY+68TVLFjYMr1bKc889YfnteqHx1qkrDy2h8ZJFGBugaIieCoI42tZ5v92WqVodUOwzb95WnOGn
	N6alSptlCe7xFb6BMr4F16mIQn8cQppMC/YPHJKWIgxkbCqmFUeVfCZ6cXj/Ds0w2Y4O4ik05Mbqy
	O/jOh8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ZbR-000000020Cj-1bWN;
	Wed, 06 Nov 2024 06:33:17 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ZZi-00000001zz5-35hH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 06:31:32 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-84fd01c9defso2334829241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 22:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730874688; x=1731479488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mba6U/dT9znvEMNh8rko7R6epkDmG/m28ZS6cZzb6Nc=;
        b=TGlY4gOJ2nk57UWQ6MxqPlqNX3CUzLpO2UteHUgGtYZ+pq9/zHGB91T532io+Ymsd8
         ZgER4zqGCvbCheRd1u3vNhHePmkzEK8hxc+quM6EEYeNxZftTc6UuZP53qjpXyLaGRBt
         xQiamnKfqUWuMhm2jkpWkk4qgV+a7ZDO2vhG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730874688; x=1731479488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mba6U/dT9znvEMNh8rko7R6epkDmG/m28ZS6cZzb6Nc=;
        b=FaT3FNKd924bj4k0KaTw2AB3my4J5Wj5br8Yn/phM9BLJfBa0oOXiUx+slEml8RU87
         sCvGRVg18rVdJsyWSlYuzxbXdP3YBWFtmSan6c/+f/OCN7HOQm9IU0xrqizdkVXmrdhQ
         pry6x11h1VXDXA8yaUr2c+DtPDOQeEWM9E/CvagIwnS4cIUEi+Gs7/DH9EaOG4q968QI
         hK4Q0brGVaR+XV/aEcwxL1PZ+teKHPzm3fe3r4dnaeALfQDyt77GKVy9OV9rALeOhTjY
         uMgFV6wiFSuFn7lHLSJSBqSdImlJzDM6sTLro9i7GAGt2fgGPkbIKqs8FQD4/17Pqn7D
         CmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBopnAwYq8kDLrvPfTCF6tU7d6W1Gnz5JaudeUITv0XowFHVh9dcf86UXdoXM2fLrH/IBby3FMCwUWENMm94y3@lists.infradead.org
X-Gm-Message-State: AOJu0YxG/AvJlNbKvDmMC7xxxMa4lVoX47ZPWibkzsQmCzIWjN67lfFl
	Q1Hpm+3QoexWlakYkvSjzmpn78TlUS4XaoBjNjK6YYOfafYh9/xh9Deh5yBkT7vqfG4XHR0pF3Y
	OUA==
X-Google-Smtp-Source: AGHT+IFXeVahq0BRMvVICJ28Y+ejOD98PYviJg+f30coO5siA2/uK65gX6+9SqMb8khLDY4vx29l4g==
X-Received: by 2002:a05:6102:32ca:b0:4a4:7609:35f with SMTP id ada2fe7eead31-4a8cfd6d7bemr34492559137.24.1730874688493;
        Tue, 05 Nov 2024 22:31:28 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a978b3c855sm1570370137.25.2024.11.05.22.31.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 22:31:28 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-84fd01c9defso2334824241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 22:31:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoTOas5oWiPFU+OphrxjxafGFWqYJ4fW2wbxXPssERhgA6QEJqfL/uiyFY82L7ZfQF7ydNng1AW0t6dKiatzlG@lists.infradead.org
X-Received: by 2002:a05:6102:6c9:b0:497:6bb5:398a with SMTP id
 ada2fe7eead31-4a8cfb5d0c6mr33880066137.7.1730874687401; Tue, 05 Nov 2024
 22:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20241105093222.4055774-1-fshao@chromium.org> <173081219726.3053098.16931220466079803577.robh@kernel.org>
In-Reply-To: <173081219726.3053098.16931220466079803577.robh@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 6 Nov 2024 14:30:51 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngYUYeZpbjDh1a6ssftMN8rDgrinHJ4NCmzXJRyWx1DgA@mail.gmail.com>
Message-ID: <CAC=S1ngYUYeZpbjDh1a6ssftMN8rDgrinHJ4NCmzXJRyWx1DgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add device tree for MT8188-based Chromebook "Ciri"
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_223130_880082_8AA3232E 
X-CRM114-Status: GOOD (  18.15  )
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

On Tue, Nov 5, 2024 at 9:11=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> On Tue, 05 Nov 2024 17:30:11 +0800, Fei Shao wrote:
[...]
> > Note that there are some known dtbs_check warnings:
> > - sound: Unevaluated 'mediatek,adsp' property
> >     >> see [1] for the fix
> > - amplifier: '#sound-dai-cells' does not match any of the regexes
> >     >> see [2] for the fix
> > - dp-tx: '#sound-dai-cells' does not match any of the regexes
> >     >> see [3] for the fix
> > - audio-codec: 'interrupts-extended' does not match any of the regexes
> >     >> see [4] for the fix
> > - pmic: 'compatible' is a required property; 'adc', 'mt6359codec',
> >   'mt6359rtc' do not match any of the regexes
> >     >> see [5] for the fix
> > - amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
> >     >> ti,tas2781 binding specifies that ti,tas2563 register range is
> >        0x4c-0x4f. The DT follows what the binding literally suggests.
> >        I tried changing the binding locally but didn't help.
> >
> > [1]:
> > https://lore.kernel.org/all/20241105091246.3944946-1-fshao@chromium.org=
/
> > [2]:
> > https://lore.kernel.org/all/20241105091513.3963102-1-fshao@chromium.org=
/
> > [3]:
> > https://lore.kernel.org/all/20241105090207.3892242-1-fshao@chromium.org=
/
> > [4]:
> > https://lore.kernel.org/all/20241105091910.3984381-1-fshao@chromium.org=
/
> > [5]:
> > https://lore.kernel.org/all/20241004030148.13366-2-macpaul.lin@mediatek=
.com/
> >
[...]
> >
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

[...]
As for the following warnings that were not mentioned above:

> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: power-controlle=
r: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevalu=
ated properties are not allowed ('power-domain@31', 'power-domain@32' were =
unexpected)
>         from schema $id: http://devicetree.org/schemas/power/mediatek,pow=
er-controller.yaml#

https://lore.kernel.org/all/20241001113052.3124869-2-fshao@chromium.org/

> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@1032000=
0: 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/mailbox/mediatek,g=
ce-mailbox.yaml#

https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delreg=
no@collabora.com/

> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1a=
040000: iommus: [[141, 685], [141, 686], [141, 690], [141, 691], [141, 692]=
, [141, 693]] is too long
>         from schema $id: http://devicetree.org/schemas/media/mediatek-jpe=
g-decoder.yaml#

https://lore.kernel.org/all/20241001113052.3124869-4-fshao@chromium.org/


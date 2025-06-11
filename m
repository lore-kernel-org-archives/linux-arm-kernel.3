Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161CFC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIkIaaPsxO4m2eJwDcrS1OSphLUaIwh9HxpS06D3sV0=; b=lMVm/otuoUR7vR
	FjGx4LSHBzkFCTnjGHTfguhalrsYtT1YohYo02DDH8xxCU2+eXhAgEvcSZCUKKSEuEbpJHYUBgbxB
	VKco2vtN5H6DDXbS0UcULQUqNmbFjX6CQKxw8T2EbEi2uhpfphpy+LIOtlhCifOYeKHxU93R4HUQA
	r8aP+k0/JqxWSZ24yWbDLUCdnfvkbsrVAVKWSUnylW+UutBDHQiYq01tvO3wbfq6X0KR+feqb4Tgs
	4BnaEDpUfN75PjHfogmSwXpKfynQqGiSAF3sqLAXNfG6MoRihI3i1kj8adGCNjXrJleHKTm4WZSbB
	LeW8WqGYwszSOJ1vScfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMp5-0000000AGbu-0bJd;
	Wed, 11 Jun 2025 14:53:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJGB-00000009hao-36Ln;
	Wed, 11 Jun 2025 11:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=xIkIaaPsxO4m2eJwDcrS1OSphLUaIwh9HxpS06D3sV0=; b=eVTSCCfegmAuTtJeUblBzn0XVY
	vdpb2SeRTIyTODOXlAPE5gFGlAn9xD7wU2fJ3jEpkXJrPJtSt2fUh1f/sV4o1cMNZAwAfe9gp6q+P
	TSm1lTgaQnx0zzat8e79q7nlG0KEIHGuuTJKxb7fucMIJ0ktduU2ln/afwGxv9S/VmGEad3sdAFXv
	PNRe8EvswS6Iru7QipXXe3IAfNSKUT0C9DiPdke6nzhDvFjfr67NqeDJZN8TBYprv8IOaFVegZptJ
	2xAvjyCcVj0UuGB0GQkbK/TZWn4wpUeQxDv29IMUgojta3SornNe2aRE4zuJQOVzWC8WJ21B7KrR0
	lnu8GNnA==;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJG8-00000002JUA-44k1;
	Wed, 11 Jun 2025 11:04:47 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5532f9ac219so7512797e87.1;
        Wed, 11 Jun 2025 04:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749639876; x=1750244676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIkIaaPsxO4m2eJwDcrS1OSphLUaIwh9HxpS06D3sV0=;
        b=aoxX8Q+3lzLXQtSo+d1HZxPDauzghwzKQZTsmTpyo8AURlvpxJgJkunt9yhoDGbEHX
         fHTBuIMy1oGEiimNqBusr/cWAms/eFffTyS++QmM15GW1zeLoM40RTuY6pciLarXgK3/
         hH8ykJl7PMSB+t1TDL1umnWWyRqI4qG0Z0WVonk3DlVojcOSOT5Ww+exbdWcOwjhtnhS
         JS0VrRy1mOTmdFKR3Pf0a0LBQ83W5QCXU3WctvFc23cUsbo0hVAvlRb6cj4UpOysqXJw
         O+wGwsaVZDY8OyOAC9aC9qpOzh+pmJr9KgUZn+5FIR+yXUVzgWFRRw5JAdOJVd55K7YX
         oHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0GeN6T1MgNOZfR4qR7yEuved3r0mi8xeBxOpxbQ05WjR26+XfJwxLykQhIi0WuosiQ4KZom80QhLYusc6KMQ=@lists.infradead.org, AJvYcCVqAYtCrsGfc0/Eh4fQxaijeAjVsFkQRVzKVewoe9xrS/xlXHBjb6VsVrket692+MyxuTcT4lkF61rWNonodB8W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+nWf8zUBQVK91kXt2HlyloIAKby/0opduZy1HWk0MWBeE5C+D
	a+9P5tSVMV5lJ/0q73FCQ/+ulS/Tjf/y8W0pUaT5oGYvjRS0W58uLs74T4kadayL
X-Gm-Gg: ASbGncuuAH1udbrN0LZqZXnmYRFiCOHJ+e3SMEAOlvgUX8CrAxiSEyMHDscfN5sJLo5
	LCmdAEFo3qK2xFYO2RJd4b1g7sQIGV0i2BrFborYxX8dwvoC9e2c5piEDKPDbqOTIvUo9T6jo2C
	SejwHD3Zo6Fk6SXYUim3YySlDzLs9188gx2KhxNSYdqJxnt/n0RJNjldoaV4AOhYnb+pQWP5r8e
	Ed85dsTy3qrgB0NETkl6Q3lvW0ncsg0GJg2R6qXUOA7oR9Brpe+mW1XkCkp3uqr91QesC5a41GA
	6VNYjS/WA/gx78fp4GvxXaHyf0Sae4RfAqCER0wZdw10sLe8e+N8UmbjfgEUtqlwC8vv3KnacO5
	6cj85Kx1Qc/HUdur8F/4=
X-Google-Smtp-Source: AGHT+IFgZrIkRwfnNNWAdRXvTxbqzna162mWsKKSMwKGmp0H+tQT7eIcX7zhr/magEkV3+hfhtgdSw==
X-Received: by 2002:ac2:4e0b:0:b0:553:23bf:bb26 with SMTP id 2adb3069b0e04-5539c0ba6ccmr872448e87.11.1749639875570;
        Wed, 11 Jun 2025 04:04:35 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b55fa0sm17499621fa.48.2025.06.11.04.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 04:04:34 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32a696ff4dcso55168191fa.3;
        Wed, 11 Jun 2025 04:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3pkoUB5iCh1XumLQxlIEo2Ayod76NOCnyg5aQFAB8fEcmLWxYiGF72hxmnQg/27yIouVA48feWq14mNcKao4=@lists.infradead.org, AJvYcCXMolPHoGlj/ZJRry4dazyiQPomOq6wV65SQCja1JEFBYPdJV9nBArjiNWCZRT+VjQukGpnj363vY9IYHr7BKQg@lists.infradead.org
X-Received: by 2002:a05:651c:b0d:b0:32a:648d:5c0f with SMTP id
 38308e7fff4ca-32b21d1135cmr7885761fa.16.1749639873377; Wed, 11 Jun 2025
 04:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 11 Jun 2025 19:04:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64zi_gXQN+6y6W0AiAVBrfn6qO0=Qoy3b1ojEMNFWaBSQ@mail.gmail.com>
X-Gm-Features: AX0GCFtGlMh3Zzni8gRt8ry0nlQX_sI9OVMA75h6YXhmJIEc5H7iod5f7NlW8tI
Message-ID: <CAGb2v64zi_gXQN+6y6W0AiAVBrfn6qO0=Qoy3b1ojEMNFWaBSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_120445_129877_E5ABC50C 
X-CRM114-Status: GOOD (  13.24  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11, 2025 at 6:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kernel=
.org> wrote:
>
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
>
> --
>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c   | 4 ++--
>  drivers/pinctrl/pinctrl-at91-pio4.c   | 6 +++---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-

Acked-by: Chen-Yu Tsai <wens@sie.org>


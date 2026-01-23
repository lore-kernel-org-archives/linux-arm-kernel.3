Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243A0D74ECF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=; b=cJqbycbTtnH5wgTd+847Weo6PQ
	9wnpqvBtFUQJCBHYmO28CTzNIym/ouyTXsNbKmR1HaqbDVATBEGgxvBP9jghW9aR7lMEDOC3R9NSo
	jttAaTtRMCAPOpstnAFUvQbJ6/ekhkS18bQUocu2RQU9qtthD/F1bM2kb1kIBk1Ik8fCjUWZTcvBe
	JH9Txcy6hCXEJEisCnQiYX9zl0e/d/ffUJvOJM6u5k4gnRZvpQtYWR8TEAe63oaElOl1GImk2M/Pz
	b6QRqijjDjVodyFZY9Bw4H2k11p0sgOV//Fvo822fuWqa/hvM0eOdo26l7mZX/MBLgaACT6kd59cm
	W46aoDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHGG-00000008y3y-19mx;
	Fri, 23 Jan 2026 13:31:40 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHG7-00000008y2W-00B5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:31:37 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55ab217bb5eso274483e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175090; x=1769779890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=J8Pvf28IONBKogO03iIqexIuKUfbyVHnp2qOeBg3CMOsQjlhZT9/+FEnu2MRSiFr7i
         GBAX5YYjVjZicyayCOPZWRwPEwArSRTfc6+2FFgl4wVbJ/7bdr7peVERKYNk7PtxMt04
         Ig8jLtGG7c3UPfEuIZVOoWmfq+ptiTbuPz5VWPdQKnJEy6aGFLUHqc9VGYwrRxFokhwL
         JibtyP8e0G/itieGI2R0H8CXTJuqCM248uHO1P43eIQMC/7/eBKruyqP1qfcx070k+vR
         el+lzh+5c7nmVtvg0RcYTUQV/qKpz08q6deP8iQloPn9dRep/XNfZU9IxW7d5hryyyfT
         p1BQ==
X-Gm-Message-State: AOJu0Yz5DmbvFqRC2tlatKqxURT4jT8BPuZEdT4qlflYf0Db7XhRn+Ul
	c6o7U7UsZA+XSkaiFz2/4s5JrkaW/gyy2UzueAmA+ne+p0GbQaK1uobLJVhcjCZU
X-Gm-Gg: AZuq6aIvYoKs0GPFDIDujCkv7aouPI9KK+ZmVTh8Y2IVPXti/DxFwAKsEBdrmUuJ6KG
	Dd+23gJjrao/9Iz80xdaXHFd9K9j+r3SmCZBeakWos92fDArs94rtM9SbWXC5yzvoH4SEN+I0qs
	BtfAfF++L+cSnysLvVbnTCvXPhm0RSfA9ysjS+RyIUxksagaR2YK47bBNcQFke++OhCdidT5hXQ
	a9sYNgFFhALA6lVANxv2yfN8MYohWYTTKck68095mBYcW1FqNgw4hlpEteaMEXf+SLTP5Nq9BXd
	mqUj0sYAYgnUsqUSMiiObFIcjEnUnOXaIsv+LlC6flF6HpENZQtET6/MxIIr4r4vpB6yZylo/R0
	2q3lendYL/NTucaV4bMrtCUQPg9ViT9s6T0/SP4wUYnMH5oj5XO0X5hMMNyzO7Yd3nYuYH/VTgX
	K5SEl/uRbz7849zqZZXpgDALonfxARJ+2LDDErVe4n6jERRwGj0L4qF7A0sFM=
X-Received: by 2002:a05:6122:4b05:b0:54c:da0:f711 with SMTP id 71dfb90a1353d-56645b4162emr273087e0c.7.1769175089552;
        Fri, 23 Jan 2026 05:31:29 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948369daf5esm157953241.14.2026.01.23.05.31.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:31:29 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-941275fece4so439086241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:31:29 -0800 (PST)
X-Received: by 2002:a05:6102:41a9:b0:5e5:5ed7:60b6 with SMTP id
 ada2fe7eead31-5f5587483e4mr261455137.39.1769175088847; Fri, 23 Jan 2026
 05:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:31:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZoJX6P9VEMoFRaPfwQUEtr65f0dE4djfP-SGp3MGEfA@mail.gmail.com>
X-Gm-Features: AZwV_QgVgI8LRuqulRD9turw-2cvtSAPBn2muYug1d2m7BRf781VDBF4OGiC5Ms
Message-ID: <CAMuHMdWZoJX6P9VEMoFRaPfwQUEtr65f0dE4djfP-SGp3MGEfA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] arm64: dts: renesas: r8a77965: Describe PCIe root ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053134_611539_6799A657 
X-CRM114-Status: GOOD (  17.28  )
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

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add nodes which describe the root ports in the PCIe controller DT nodes.
> This can be used together with the pwrctrl driver to control clock and
> power supply to a PCIe slot.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


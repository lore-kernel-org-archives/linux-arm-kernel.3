Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E625109C024
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IR4PMQkuXHgGVHr1fS3zbP4B4tvfpOd5H/w9R44nhs=; b=K7L4rd28HwZ2bNrOaGAWJhA1Tm
	f9UlVJOqewHW00c0bhfX4tqnPdpeJXE3fKaKjye5qCXNTJlEnJoNf3QPiPQ9uO31RqheiPjDpGCN0
	NPv4mdM1wZEIqzM0LrT9KWgHkRzBfo4JAGsiWpTWzH36ab0pwkFI2ZcCjDZOrii3gPimv/HrEmUES
	wYVGAhRE47MneeAj47IrVR+wLR0srFVTARDNeF0gE2HlFIN2/u7j157iEEt/dNzC8PCgn3SLS3jF8
	gFZscvnwlUabY7egNIK9PIHAVGPSBS0qeDc4+LWs9v0KMIH2ETHV05jFechT3BpBSyF6ZcfFjOhIs
	JHXOzffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PHa-00000003cJI-3jMS;
	Wed, 25 Mar 2026 14:32:30 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PHY-00000003cIr-0rEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:32:29 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56ba039eecbso2101431e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449147; x=1775053947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IR4PMQkuXHgGVHr1fS3zbP4B4tvfpOd5H/w9R44nhs=;
        b=BnI8wEQnJLShVYBi0MzmH8/vaw4Vhq707HHRYIWMryXC0yGeyqY3FhS4mL/J1rwNAc
         W8T3ChpeJWz43HiyRaRDMIfS4tisNRjZbkLGMyoAoo2/nCtTVy6wtwyvJrBZhwnv8P69
         b1Ii3XdgHIS0oJDRKawyR1SyNP7Z86uJs/7GEcA7qZ/8/foy6IJyPQp4vGhxoJiyzotX
         0Y29n9j43DaAZvYQ+SJS5dYhEk697PVe4jFLpi1yrnYHjAYDwI/GA+g61NH78OBtNed1
         XC7NVKkoRCSm0Zvpm2TTH581QCjR5DsWsbVUdLD2y5xC/+09vXgbTWIGBh5v0MZ9du8y
         iFvg==
X-Forwarded-Encrypted: i=1; AJvYcCWHKYrOedMDF+3qMf7yeH85sRPxohAeiSpoDuvmy7N011zs1LQQYDTYZmAr8XsJLvBMb+PzxhVroN4tP5omA4rs@lists.infradead.org
X-Gm-Message-State: AOJu0YxF/ymDlkdNJlw5U5ljpO+q21vFY5t223KqU1BWXUvs+gdCCFB/
	5exJ1NVd1G6rf+49CrPe6EvZ4XYJu4zAQjfjVyA/K2eg06mcan/3e7hr5J7a2zRRY2k=
X-Gm-Gg: ATEYQzwcppWy1UWEMwORJxIh4iv+sL5v5oTy4prjs1Kb79fY1DeS8Vj+sHgdxC+cGzn
	n0abvPbQnppkdmJn1H0Ez7HtxUj6bioKT72PlWTcWRQzxs1xLlPW8sC/UJiLQOQJbHJIh36r+3t
	jY6bsG3X5FQiKYQPomX6NPFn0GcEZ9QbkvuUA9IZ5PnqsUAAcXlAOGsUn3M2lhdzQxeXAsaqEFX
	+2GzjXx6qrS4IxePlaE0Mj9L01h+3gKj9fdAWTEY6zRW8dMXW7jVVm6F1XnruekGVonxJwnWOpj
	xN6LYvH6UpjjWGijUKwOVPiVr7b809dcErLWqKIO5WYbDMWXhps1VUsi4S3vaUp0djPScvvonrY
	oBnIEHFdFkBU5P65MiILhJCjHN6CbW8E8cYr7ACx0IzjY4QMuMZDu3kPZhq5MxsD+md60evy7Jn
	LJtNxf8sy61Z99cZPXqP/mLGVNTLbfcNjT3sW7A+Muj4bs2th3sUErMm+ofJKTQ6J2OS9WxxiCz
	LU=
X-Received: by 2002:a05:6123:4c:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-56d220ba657mr1809609e0c.15.1774449146590;
        Wed, 25 Mar 2026 07:32:26 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcc2d60sm20383205e0c.15.2026.03.25.07.32.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:32:24 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56cd71a7630so2198892e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnvQqRLGeN8yLrKb0zDj/QmKycMoA+lCGkRS63QRjN3gbgiP3Bs7SOgAxDn5uY3/1qWojUQSvAL6Je0ocaTiYy@lists.infradead.org
X-Received: by 2002:a05:6122:8b17:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56d220bd240mr1842211e0c.14.1774449143358; Wed, 25 Mar 2026
 07:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
In-Reply-To: <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
X-Gm-Features: AQROBzAmzdL6WbhshCdeY3LBceLPE6ortgojdqfCAR4hO6ROgmFwhIjzLsI-de8
Message-ID: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_073228_247644_F020E41E 
X-CRM114-Status: GOOD (  24.71  )
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

Hi Marek,

On Mon, 16 Mar 2026 at 13:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 3/16/26 10:11 AM, Biju Das wrote:
> >> There is also Marek's older series ([1][2], as Marek doesn't do cover letters ;-).
>
> You seem to be commenting on a 0/4 cover letter here ...

Ha, the exception to the general rule ;-)

> >> [1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all
> >> RZ boards"
> >>      https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
> >> [2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on
> >> all RZ boards"
> >>      https://lore.kernel.org/20240630034649.173229-2-marex@denx.de
> >
> > I haven't seen these patches.
>
> They are deprecated.
>
> > It does not cover all the SoCs/boards. If Marek want to take over, He can send next version
> > covering all Renesas boards + binding change.
> Isn't this series effectively exactly that ?

I believe we still have e.g. the KSZ8041 and KSZ9031 PHY nodes to fix,
for both RZ and R-Car boards? Some of them were covered by [1] and
[2] above.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


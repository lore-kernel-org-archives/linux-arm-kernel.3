Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB3ED30CDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmmfdk/VKZ1fvQfbgF33VHoYwFfmSOZu5CB3CRtPMbs=; b=BIpxAK4LGxXrQv+Nnn1mc6FeIJ
	htLEnmXTCUGnesZWx4F4Z/+ebHUgkq2YweyM0TsYV4D5n4whg6/B0ifk9wccEFbH6Ko4HUGJLn9WX
	WEhmMNGZ+ZpSupVDxGTADE3MZCjVgZK7O6Il5y5BSJPnlHnBVIgggwFr2u6Flls6Q/AMsHpt+apIN
	AdhK0jSnteNQcmoMiJ51SyODj8bSGKkGmAIxrSy3U5UN2DrBGHAg7T8aL9VUwZZ7icMU5nU2uyD6d
	9Ce5JF52si8rHGTtaObsKbgR90yfHTIfFRZZd5G/MqIPFBSaZJd9KL/6UxsXfetPzIbp1yqNbf5bP
	uTc/2dIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmsc-00000007pGv-1rsa;
	Tue, 13 Jan 2026 22:28:50 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmsZ-00000007pGX-3s1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 22:28:49 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-122008d4054so234023c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 14:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343327; x=1768948127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmmfdk/VKZ1fvQfbgF33VHoYwFfmSOZu5CB3CRtPMbs=;
        b=F7OadhJQs7LAJY7tXcTzkyskLvd79NM9B3M5zt/WWDgEjKzo7A54/Be5SV7ljoC42U
         Fs2GsD0rVT/Bk8r7TKH9zUwuI5/24/iLSBHhzrduRxbrkf8vxE7L0hjDcE+1ocvjJvAE
         hB87Btx/B0NK09Zeo5Rcb3UL+av2TbCcuRuJa5GD+MfovgB63MT2vQ5vOuEx4JrOVA3X
         +jTKO5RFjyxHGC9MGIdXH7AuFWVOWmA8dX2UC1B0bQuwqB/8YjHg9JBQ1ApQ8ESnYweG
         iLDAtAsOPIWWQ6H6heT3+FO6+uUnsez6H0TY4xnRwOU50mAuySWiCFrw/bmA6C1+W0Gt
         o8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343327; x=1768948127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmmfdk/VKZ1fvQfbgF33VHoYwFfmSOZu5CB3CRtPMbs=;
        b=FsCtmx6SpSPkxKN0JFCxjRfUS2DyQh2bqv7/J+kGfOvPigfM3kzb3PhdH5MGEkRhRu
         nI8f9qMCbtBXR9UgaK6xtPewTwqUgEIiF6pOxTH4EudDkFhy/fCvPFp8SdBjVbJnXHXD
         FNzur5XcMtt3GzIc/apQ88H04n6b7GJzqW/L1XzY+WzoTNSUoLb2WWAKrUMtkBDy4tFz
         g9iv8oM+VPJT/7lEJf2i0Jl8YqjETiHzhH24317grVYzEo+2K6P17CSFvw3kYy3InSTD
         k6Gs9FRDCxzgU3aU7YhbiHEICD1PMeZLrA7qzAwvWT9wV3HSxeNR5N5TMtkuXWLQbJAS
         vU/g==
X-Forwarded-Encrypted: i=1; AJvYcCUT5IwNsv5CjAIj8p/ehQNl6SjX8Bu/lOTITwo4ELmw3Y1s4aZ49j5+IAKh9igozfQBrKCmLB9P0YLekTirWh/c@lists.infradead.org
X-Gm-Message-State: AOJu0YyzAeBTvUA9YF+zQenF5RNXARlIJWwZAZAz2a7bh5lEGYK58ibs
	Joh1BCteUhaQSBcIPrjcETq7hJO/XA7+kaV520WwHOhbC6oevuGX/usO7bDu3nS9EmP5ZBCh8r/
	XYW5U8LvO0zZjHUVwdF8155y8p/SJeYM=
X-Gm-Gg: AY/fxX4XGJMx0obtDOOMdBj/r4vDokqgRK8wZlf8qtx5Ju3v+5KT2vUL25WQ+965nZ6
	2hUTYfEeM0hGenvIjc2HZejv/UECgdK4v5vSHf5C6ihQQbrd+Y1MiHvl5v6X6o0qBPYJekgxelI
	6AEFHyHurJ/1EuoRkvNpNwCmoFlZ45vy+G92Q+LFRZQ27Ub9rbobPqW4gD6R8PZvrFBK/wB7lv0
	LdiXJhz3sBj2jViCrFGDAEX1TycGALMTTdgcomDGkv+w9zItJb6Z/N9410PrR5LN8UG6cQbYFp2
	c2Hbk6dT
X-Received: by 2002:a05:7022:6284:b0:121:d898:edae with SMTP id
 a92af1059eb24-12336ab1486mr479738c88.24.1768343326543; Tue, 13 Jan 2026
 14:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-2-anirudhsriniv@gmail.com> <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
 <20260112-whimsical-annoying-fulmar-25e4d9@quoll> <CAJ13v3RKydFK+sP_Cm-HnQjsOJSDyX_dsGs_Yy564V=Wc7tQFw@mail.gmail.com>
 <e97b7a193f8bbfca9ec00037808ad80a5baf9f00.camel@codeconstruct.com.au>
In-Reply-To: <e97b7a193f8bbfca9ec00037808ad80a5baf9f00.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Tue, 13 Jan 2026 16:28:34 -0600
X-Gm-Features: AZwV_Qj3tLQCdlXGc4mVCUHplcJiv-ygH2rDEByc1Cc6_E5RuzTQMstHuy-HUGo
Message-ID: <CAJ13v3QYWRfyivrbP=+hreHuMkYWGPkngW3kJyq6xNVL6YdpgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_142847_964725_0B3C7CB0 
X-CRM114-Status: GOOD (  17.80  )
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

Hi Andrew

On Mon, Jan 12, 2026 at 6:57=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Perhaps we could incorporate either of those?
>
>  * asus,e21524-ipmi-expansion-card
>  * asus,ipmi-expansion-card-r1-04
>
> However, they're not without some risk:
>
>    1. It's hard to tell whether E21524 is properly representative
>    2. R1.04 may also problematic as an AST2700-based card will likely
>       restart the numbering and risk a collision
>
> Otherwise, I guess there's:
>
>  * asus,ipmi-expansion-card-ast2600
>

There seem to be multiple revisions of this card. The photos have the
revision number printed on the board and the manuals have the E21XXX
number on them.
R1.01 - E21362 photo [1] manual[2]
R1.04 - E21524 photo [3] manual[4]

Mine is the latter. There seem to be some differences in the layout of
the different headers on the board, but the same set of headers are on
both boards. There is only one fw image on Asus's site, so I guess
they're the same from a sw point of view.

I've linked a screenshot [5] from the webui on the stock fw and it
says that the firmware model is "KOMMANDO". Asus also seems to name
the fw update file for this board KODO1140.ima (KODO is short for
KOMMANDO?, 1140 is the version number).

I looked at other Asus Motherboard onboard BMC fw updates and they
seem to be named <Mobo Model><version>.ima. Example board "Pro WS
W680M" [6], fw update name W680M1121.ima, another example board "Pro
WS W790E" [7], fw update name W7901167.ima

"asus,kommando-ipmi-expansion-card" is a bit long, so maybe we should
go with "asus,kodo-ipmi-expansion-card". SEO for either of the 2 terms
is not very good, but that's not what we're looking for here are we?

[1] https://uk.store.asus.com/media/catalog/product/9/0/90mc0ah0-mvuby0-7.j=
pg
[2] https://manuals.plus/m/8bcc92c2f7a875eda34d546e0e297d339ea55863fea0c6ab=
cf0f338cd26f299d_optim.pdf
[3] https://i.ebayimg.com/images/g/Um8AAeSw27JpOYcU/s-l1600.jpg
[4] https://dlcdnets.asus.com/pub/ASUS/mb/Add-on_card/IPMI_EXPANSION_CARD/E=
21524_IPMI_Card_QSG_V2_WEB.pdf?model=3DIPMI%20EXPANSION%20CARD
[5] https://ibb.co/kg96CsYY
[6] https://www.asus.com/us/motherboards-components/motherboards/workstatio=
n/pro-ws-w680m-ace-se/helpdesk_bios?model2Name=3DPro-WS-W680M-ACE-SE
[7] https://www.asus.com/us/motherboards-components/motherboards/workstatio=
n/pro-ws-w790e-sage-se/helpdesk_bios?model2Name=3DPro-WS-W790E-SAGE-SE

--=20
Regards
Anirudh Srinivasan


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E760CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=; b=lKW7D1KVE7KDhD1WsvkZrNoPZ+
	+I7DNd1vgUrAM90fw3H0DPB+B6U26MoTLtngChZu5Up02wS6cq0U4JUKanLkOa8mLbbdndMkf8r2G
	2t2haSUuik3iNFzpF26xCgJHdzTHSr1Y68vQwm84VKl+SmVlu8Sw8wIyLUo79wp1kq1zXk43UhYtB
	vpT4VmeV+pLZkrxyBL/HjzxOXOtC8u8YT6J7RjvBcyqa2LorJEQs5ev2t+SWWfDWYyc8u7CrtujC5
	Ot3bPj/yU2JA4N1pfBgIxKxtVWbRGHCqwP7teMGZRB3DfdYP34+FI67pmH5eRodB3voZvE/K8oeti
	sUIVbWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBSE-0000000Gy4v-0Qbw;
	Tue, 21 Oct 2025 12:27:06 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBSB-0000000Gy48-2dIG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:27:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-57a960fe78fso7170985e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049622; x=1761654422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=;
        b=YsAunkfk4z0mb1gfia159WNQ5DEsEqPnn0nmTZFGCumnaaK+u1B0fZiUgNzaMC0Fmb
         KBefjqMV7jV+8VFR2HztpvTzih1LT4Ls3JO4Zp7NCw4HODUe7+yDntjOvN8snvQm/oj1
         shzNwBL6CFutHETL11XeDzQm/QA7ExA75iS1K9Zoy/LegOvZ8QWJ7ScFVXpGnGgyLU++
         ImXX7XVfEmohZNN96mPpFDaBuYuLAxHNknOb+3JNrrl5rh7luYtQeo+6FXkSvyiLmIzB
         j/u/Ayottw1mhi3F0z8X86IUA/OwmPNeW7c8b4g624cEmZ/Xfuu1k7D2ijGUTH4TktML
         JcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049622; x=1761654422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRItKHoHeP/Luyk8nQVlzb7QSwUwBxc0c3xCNUrv3pc=;
        b=p/UeKo/5s6eDxrHIYPiWstSmFHN44XqlCd5MH11BUWe6z/Tx6qoK9C4qqdTP3gG0AO
         KKMx28qAR05o/f6UM9ZBInsUaBjwNwgwGapF4/K1IZyPRLbLVQGAOAxytT4zNwcu2a0l
         pbsGsjiQGVXyH/cK7FeAaMaV3vu+onzL0H+f7SJbyasOk3B1Ee3VDn7daOqxwoCKvHlM
         sftwxzALa1IqfUbLnCk79g5ty1qP6rhrfJd1YqmbZE+KskumQzOJouKHTwW12CYPCeee
         7cxixgMuqzMu0T3JI3xD2X3c5Y7XV256aK9LPFnE9mEGKGm91385ShJzOlOJkxzi930O
         iZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNJJUdTXCeSuZ6VV3XJ9rBUM+jqnhlqA157FqwDY1PvSmLG6fOzD7Abz4hwHTO5bzSufQiM9OybwpcMwJz0Y1x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw39C9ymn/rPPKDdJjk5iTNPb67ScsTOZsKfvaVwsBL/Y4ZmVN8
	k/zIRXHt77tcR8AG4vpMmqaEY1y/qNqpAArCfOxZ+OqLtNcHbfGvtj2k/87SsK2sAwffoP1LGi1
	/L89HzIqkHPipbI+8dSQ+CrQyjvtaHk3GeyzD8gY6Vw==
X-Gm-Gg: ASbGnctYBP9rkzMwjZmUS2RFboq86LEZ8cT1PH0BTCfH9lV8AWJo1rFnyJAdepOZyT1
	dOtJtsiIwjLK5ofDPDSyWTgklw356gOYtkcJZhwyp89PBBZu8gwNmd6lgrhQMoAolGpX1YvEZgS
	94qe8933gORoP9iry6+zSEbfWH1dCUSnenOPnx8URekzfmu7Y467G0F0l60E/HqSGoa1Rd8MEyM
	0lu6wjRVoxDE/pTrKZsYzDgpXAS5J+wNySeS/fHkiKtSSenCLOnstkY/euNY5PFsYIAKVyfG1c8
	X3easw==
X-Google-Smtp-Source: AGHT+IGxlVJN2rvaLyj+Brv4icN7nCu4VjMGW+HovXJOGOXiS4L6UUAPV/sCXKFATKrxTJyz9wkyawu1OYIvSs1RR4k=
X-Received: by 2002:a05:6512:ba1:b0:591:c8d7:c03b with SMTP id
 2adb3069b0e04-591d850cf22mr5196408e87.8.1761049621481; Tue, 21 Oct 2025
 05:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com> <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
 <20251015-headstand-impulse-95aa736e7633@spud> <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
 <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com> <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
In-Reply-To: <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 14:26:50 +0200
X-Gm-Features: AS18NWCW8_rg5qtH2LgaZCS86vARi5jbxP9hbx6C1qjmUJ3MwBUVy8SVIqQU3O4
Message-ID: <CACRpkdYRUcQLc07o4epJs41BMkweHp+hKr4KQbBeFW1ZNS3RJw@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052703_705630_E433F02B 
X-CRM114-Status: GOOD (  12.48  )
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

On Tue, Oct 21, 2025 at 1:49=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The issue is that parse_dt_cfg(), called by the above mentioned pinconf_g=
eneric_parse_dt_config(),
> only uses of_property_read_u32() to get the value of the property.
> Conor's proposal for replacing my
> st,io-sync =3D <0>;
> with
> st,io-sync =3D "pass-through";
> doesn't fit in!
>
> For my use case I'm going to extend parse_dt_cfg() with fwnode_property_m=
atch_property_string() to extract the index from an array of strings.
> Then such index would be used for pinconf_to_config_packed().
> Does this approach look reasonable?

Aha I see the issue.

Hard for me to tell how this will play out since you are the first to try t=
his,
but it seems like this could work.

Let's see how the code looks!

Yours,
Linus Walleij


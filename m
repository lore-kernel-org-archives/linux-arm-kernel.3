Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BED0D29FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/r6tXnUuPwmcrOqEYQI7dbDs3qpnado9Q9kI0QYsBk=; b=OiEF7oLZNPSFawTREHDkWiH/ex
	ZLPyree44XKapZToUhC7f0rbsZBr3uJbApIS+fzlaV4h9mJlGHnytwWStZcH5A23Cg51jkMLv0Kyi
	IcH/oSbYVvyJG+WClc8p8dZFWljWl4Z4XAt5mjVtB84qDEeIZdAORAJ/HEdWOkDh1/+GMNkIOVurq
	EXIt//I9NWHhk46gwr8NBoXywxx14tX588V+dQmnSUVEFRpg6+O40ufC7YI+ZbOqsomYNC5imHeEc
	qPQGW5xKhewetU5xOM37C+2TYz6SLYdJMOPCLDRGp3D25/UDSU9kUppKjAuHcl/7HaWR4A9ga3jAR
	AUVker8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aev-000000028tE-3MhU;
	Wed, 06 Nov 2024 07:40:57 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8adC-000000028TS-3sDL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:39:12 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea5f68e17aso63353407b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 23:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730878748; x=1731483548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/r6tXnUuPwmcrOqEYQI7dbDs3qpnado9Q9kI0QYsBk=;
        b=Da/RMikAv7jMTD9YkFnycjdw3+DF6Hag4yUmNtOdnwjKv327JZLS/GErBc+zRyGsoD
         jKBZr7rlkTQUGgorHY/jZtCKDVqLNmPUZ6uk10r+l/2bb+RZYQRchls4jmqgWgN/cF9B
         xJtl8zD81nQCN412hKKgVL/Pz9AZrj7Be19vfZ7k+60+hN6a6MPogeJdL+VxvUUXdNwk
         3FBDcf9L9tGbc9QdrhsWTWCGEY21i2fWouhJjCl9JlD2AjwBmaJV0N/LUJhDD0hNh2fy
         Tn59Y8X9t97tyo3QFdTiSRCygt/xGGAwckIf21yvxOtWYGkKJW31OXYr/uxYWXapWD67
         ephA==
X-Forwarded-Encrypted: i=1; AJvYcCUFc7g5sJrg/rA+YDGdgSI2wamOzBU5L76z+06sHE7tbzT+aGKmGXQ4/VRFceWIGQ6ooCbBpbE4jgsr+VJ8bwrT@lists.infradead.org
X-Gm-Message-State: AOJu0YxyxIDcq9E2MPXnEeMwWsYZ8WP+GZOiy0ioTI1TBZOZqKMqQEA0
	Efv/OhOJscUqd9uxGjlurey7A9dIykmxZqq/huPiCC0PQoR6tUBGRXMdEaJE
X-Google-Smtp-Source: AGHT+IG4EaOkpyepn3+rk4cfugdUjOdaVS2j4rdW+flGzIiuz90GA6fAdaXf+QxWTW3n+co6h+gJrg==
X-Received: by 2002:a05:690c:6e09:b0:6e6:248:37bf with SMTP id 00721157ae682-6e9d8994a47mr403693347b3.22.1730878747896;
        Tue, 05 Nov 2024 23:39:07 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c4b37dsm26574007b3.80.2024.11.05.23.39.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 23:39:06 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e38ebcc0abso72712547b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 23:39:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7Yjq96de3mbB6irK+ypPDYJi/J/wbxEg1FAxI7StfgnbqMx08f4MhEcNAQNubmSOwrE0LW+BDrHbKpeSp7DUO@lists.infradead.org
X-Received: by 2002:a05:690c:6211:b0:6e3:28ec:1a7f with SMTP id
 00721157ae682-6e9d8995185mr433595127b3.23.1730878746661; Tue, 05 Nov 2024
 23:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
 <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com> <8aa04e346f65bc4fcb0efc47a4f0550a.sboyd@kernel.org>
In-Reply-To: <8aa04e346f65bc4fcb0efc47a4f0550a.sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 08:38:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVH3CK7Fvfj-jis5Ja+oOFcXN4ntRDfz3Pf9ZJrfFMk+A@mail.gmail.com>
Message-ID: <CAMuHMdVH3CK7Fvfj-jis5Ja+oOFcXN4ntRDfz3Pf9ZJrfFMk+A@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, 
	conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, 
	robh@kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_233910_983340_5E7A7F73 
X-CRM114-Status: GOOD (  19.22  )
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

Hi Stephen,

On Wed, Nov 6, 2024 at 12:26=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
> Quoting Claudiu (2024-11-01 02:57:13)
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
> > devres managed gate clocks providing struct clk_hw object as parent.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
>
> Please fix the subject line to not have linux/clk-provider.h because
> it's redundant.

OK, I will amend, and respin the PR.

BTW, I had noticed it too, but since you had Acked the patch, I
decided not to change it while applying.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB37CCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Egy2nC9k2RFpcPzSIv9jZ/VwU1PCVKckuVqW7m7bXrc=; b=yKH6QRXISyDqoqfW387bDzIBuZ
	jPN14GTo/Z5sAwjaqziX3FepMZAEopEWkCocespmSlgd3mjcF/PpQB0RHwO7nSG8q70bPkzE207AE
	Ftw61hFLobtqgBpS90/138QdVqZWS2UG4zKuzCK7OsHpZM+dbh+nft0jNkmsesxv+DurDavuIKsch
	Zp3sNK5t6QR7huoH3rodzVslRcsQz/OqJ3KLRN/vd3KxCiDoEyIWd6XBkMPBLknAQm7vAWafjGxQp
	65uYIztS3CwUCxzj0gEdgNi3TrjI4vB8kWXO2YZlz4x6WSLO33gv9x873m5Cxyms3N6xxVawj9VEc
	LP8NSO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtOe-000000033ja-2txb;
	Thu, 07 May 2026 07:43:48 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtOd-000000033jG-3P9s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 07:43:47 +0000
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83537a80ab6so283448b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 00:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139827; x=1778744627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egy2nC9k2RFpcPzSIv9jZ/VwU1PCVKckuVqW7m7bXrc=;
        b=QM69f227sQ7OdWX+naNgbITMtKVmo42fgwZ+Hn0iQup5rKfL580lBqUuRB6gnfUfaL
         n4sMY4BgpZd2OrO1iVxb8bl6mRH4/P+/A3QEoCCnakmZWxUn7ukIyJmLQ0n34317GB3g
         0tJa2JjKxJ8rzJkQBRnkUjH4UqtyFHD+dzN01+hzPzoX0fXiy2WQ/Z7+42lQ8ByaAcVE
         czpscg512a6/J25aZXp0iXpoSjCMThyk7wzumCIYNkina/H3p2q7GLaYAGAeQ0thLFJK
         tt0o+RL4zXTevdu1SlSBZqeZqdlX87gcAv2qH74S4x1hHQyrYxNYaO18iBjSbumbLHOG
         HFwg==
X-Forwarded-Encrypted: i=1; AFNElJ+gEU/UxG+kP5FOm3tr0a0t4YIoTJhcSHQJoOa7e/gruiGaZlgaZzLvb/PEufG2OJHhu03JdE+NT51xp3hXQoVs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoa09fOLOxYnT9D5q4mHPUM3r+DJlXedUqdpyJ7Iwf7xN3Dr3i
	BhXf4Azhknc5HhP2NQPdTT8fvvye4xFunWnE7TqIGEK081ZWoaTlbS3XP46lHx2XsMY=
X-Gm-Gg: AeBDietY9zile/UvCllfrY52vnDwuUGOU/xij1W4yC6X4IhF4nSX3juRuNvd/aiu4tm
	jQv1r9Qni75G1k3ujtNfEWPMgwXNI2MSgPW5YgaLaikabYK858yfU3+RwKO07r+WEcE7aVe6Xpx
	w2t37U0GB/FMR7HwyUea9YZzGBC1EKvoqQZEgEXiR8QptLjElFm83/vTzTLXJqzFFSQufafDExW
	nc6kuvDiGXg/4t79rLlx7xMOFOTvdwZu8xfV9/OBVcADmVQ7nVoHTRwPIF9d37Yzv8MKd5HKv3A
	GzMgTComlkdxH6i2bgVHwAubvJQf2fW1xttR1U0ZLT9vJ3ec+p0caP/H8FhAFcKe1jIHptyFGjv
	p3KVe07eBDdfbILuiwVRANTPuC5WwTLbbP64aadkgz5tVeT/81qSmGG198AABc+n5Px/TlMCHh6
	639qTR8htvr9yCFqPTKqm168H/lYVziHBmU72JDeo6ByB/OSxqKLGRI3/ojzjulNyKKsvDoJ4hk
	j1wgY1AqATmXQ==
X-Received: by 2002:a05:6a00:9083:b0:835:5aa3:2dab with SMTP id d2e1a72fcca58-83a5b9d8257mr6964510b3a.6.1778139826630;
        Thu, 07 May 2026 00:43:46 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm10210018b3a.48.2026.05.07.00.43.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:43:46 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba4a1a0325so3889515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 00:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+uBUmrCBZ+RDJOr6ZTfRP0pciwcbH7ooqz1sf0vtBKvuAkB/XhTBcwq+94EZAfDJMMsahl89jmG/GldYkV09is@lists.infradead.org
X-Received: by 2002:a05:6102:38d3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-630f8e752e6mr3312584137.4.1778139466906; Thu, 07 May 2026
 00:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
In-Reply-To: <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 09:37:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
X-Gm-Features: AVHnY4KGlUYo0uuTDH3tynnil_8H5d8OEIYrlJIco2kr0W3O9LQYd8HP5vniIEg
Message-ID: <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_004347_852174_1702125B 
X-CRM114-Status: GOOD (  35.79  )
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

On Thu, 7 May 2026 at 00:58, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet,
>
> I agree with this part.
>
> > or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>
> I do not understand this part, please see end of this email ...
>
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
>
> I am unsure about this part.
>
> There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC
> block contains multiple Module Power Domain Gating registers (MPDGn) and
> multiple Module System RESet register (MSRES) .
>
> I do understand and agree that the first power-domains-cells cell must
> be the identifier of power domain within the MDLC block.
>
> However, I do not understand the second cell. The MDLC bindings already
> contain reset-cells, which should be used to refer to a reset within the
> MDLC block. Resets within the MDLC block are operated using the MSRES
> registers. Why are resets conflated into power-domain-cells ?

The Module Reset Destination bitfields in the MSRES registers are
2-bit wide, and control both Reset and Module Standby.  Hence the
same register bitfields are referred to in the power-domains and
resets properties, through the module number.

Module Standby controls the clock(s) going into the module,
and is modelled as an SCMI clock (SCP_CLOCK_ID_MDLC_*) by the SCP
firmware. This is very similar to how MSTP (Module Stop) clocks are
handled on earlier R-Car SoCs (except that the SCP_CLOCK_ID_MDLC_*
clocks have a zero rate :-(.

Summarized, the first cell is the power domain part, and the second
cell is the clock domain part.

So perhaps I will clarify like this:

      - The first power domain specifier cell is the power domain part, and
        must be either the Module Power Domain Gating (MPDG) register index
        (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
      - The second power domain specifier cell is the clock domain part, and
        must be the module number (0x00-0xff), composed of the Module System
        Reset (MSRES) register index in the high nibble, and the Module Reset
        Destination bitfield index in the low nibble.

> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
>
> [...]
>
> > +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> > +
> > +/* R-Car X5H MDLC Power Domains */
> > +
> > +#define R8A78000_MDLC_PD_AON                 0x40
> > +#define R8A78000_MDLC_PD_SCP                 0x41
> > +#define R8A78000_MDLC_PD_APL                 0x42
> > +#define R8A78000_MDLC_PD_CMN                 0x43
> > +#define R8A78000_MDLC_PD_ACL                 0x44
> ... what do these numbers represent ? Shouldn't those be register
> offsets from MDLC MPDG00 according to power-domain-cells ?

These are Power Domains that are not backed by any of the 64 Module
Power Domain Gating (MPDG) registers in MDLC blocks.
It is not clear to me if they can be controlled manually, probably
they are just always sequenced automatically on power-up.  As the
documentation does treat them as separate domains (see e.g. Table 14.1
Power Supply Voltage Monitor Functions), I figured they would better be
exposed as separate domains, instead of as a single always-on domain,
like on earlier R-Car SoCs (cfr. R8A779*_PD_ALWAYS_ON domains number
32 or 64).

See also the X5H_Power_domain_structure.xlsx attachment in the R-Car
X5H documentation.

> If those are power domain IDs, then I am unsure why e.g. for SCIF the
> domain ID is R8A78000_MDLC_PD_APL in [PATCH/RFC 13/14] arm64: dts:
> renesas: r8a78000: Add CPG/MDLC nodes . Could you please expand on that ?

See the "Module Standby" attachment X5H_MS.xlsx in the R-Car X5H
documentation. The "PERW" tab shows that all PERW devices are located
in the PD_APL power domain, which is always-on.
This is different from e.g. the UFS controllers: they are located in
their own PD_UFS0 and PD_UFS1 power domains, which are controlled
through the Module Power Domain Gating registers (MPDGn) (cfr. the
"PERE" tab).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0630310BA43D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQ6H4EuAGDMRYfK/6DhwFkTF5tOZGWN8+jPb2MdRLyQ=; b=u/OilY7yKbyRVj5DOu/MwRTNIk
	9gQzJ674niPHnediAxkY9LYvm3c3sV+jFwlOyVfAOPkOQvHTuDv2ZjOvns46XnQeCGMZ7tVJz50Uj
	4OR+VLh6r8eH4ZeLoZ9iGQ0Y4cVNdrQybIedILShmiHl8EtKJck7paSpWEZ2Tx5ao6tY4pND6oFq4
	6iegXnnp73VN+b4gou23gk2YM/dn3oH7MIfzPUqt9j6/RodEQtJ87MZnCAHUj2u21UsuWg6EVHvdp
	bK+srBR3zFwWUb6Rfl7x/QhyLKfniF8hUxEuBorb2/fdWTRJ00qaQVyHrkYzLNk7ZofZy0QhKsH81
	yzuqWAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w631g-000000071Nm-1Y99;
	Fri, 27 Mar 2026 08:58:44 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w631d-000000071ND-39WP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:58:43 +0000
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ff05af29b4so729366137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601920; x=1775206720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ6H4EuAGDMRYfK/6DhwFkTF5tOZGWN8+jPb2MdRLyQ=;
        b=JYiR/w4qOO6Y1OUM1ftKEnWvTLaqyf3yL1N9qJfCOELSvkQ48W9VbS62KHZkCDH5kb
         Gubtv6FFpes2Zh7u/vYOWHzNA12l2K91ahvHjrhuM6XwCu7T6dGlfdsjSPTzVLl5ngRL
         GJVhs5gMjR/ZRZv2WPPfe/syIS7pCY41vxCPBtBgEsxpeWdkITABCt0+j1vY0FrXLx8h
         tqRHHOyG+dVQ9Myx2bvQLGiNWu8Glxm6GI6DtyFa6R9ACd6eiwE4KAQxK7Ua/B1WAKwS
         TKBaK91jf1hbbyZk6mMmRt9HOB5Q+Qd/KxEH+XEMPtv5XyX/02UQEOPGKchN/e35C89J
         FU7w==
X-Forwarded-Encrypted: i=1; AJvYcCV+FbpPvyNr7MuU7MbV6VbeJO24OdVsZhv+Auyp7E7ySglADkgMEXgbf0risrzn50tVRhwdWPcR+CM1dG52Wq40@lists.infradead.org
X-Gm-Message-State: AOJu0YymcSgraklObF9jnOCVzxdH5JT4Ps981Fo4hJMSMWFsci+KZ7iS
	xdGZx5yv7FOVf4ZgTxm8WqHlw+FfubjW4So2yu581EaG4SfxeoIpS5tY3i+c7h5m/so=
X-Gm-Gg: ATEYQzzC+qk2BmskgMRMpjj9bNlDkpnk4k9ehC1YYQO30Rem/ej2As50JQAESkq2Xs4
	ct4m4rniGdDP90WDHhqA/enWEspKW2bebOxuzEmX69W1J33WBsgPdebYd717eLNdP657FFhB60v
	9T11x/bl4qGqW9aWPk1CFKEV/X1+Bnt/xLZJHtSvmReecwMEAI8zsmOL7biT9bJg1ZRTW4/etQ3
	Mxl3m3y8TNTZyuwMBir+VW6f8p8j1mL1C9iuW+MaeRmsrdd9kM9B0LYl80YNOoV7voBYVYidcLm
	b/3OpvS1/kROby94/SC5eyiY8KvEMCaCR6NOYgmEbDPP5Y6Vt5IB2NuGj3u+eQzSyBDxBg8TWHS
	oQZ2bTry/91S2T4P8XCc9rnU72DXth84bg/fdnhmorjlphEBRsPMPeQFtVxrezwWFB0TAQHNJYS
	LBphMSyGGm+ibrOTDaJJMWebxlh7/7KUwImDmh27ght4ffNCXvS6/l2jr7A30K
X-Received: by 2002:a05:6102:5808:b0:5db:fe0d:7fd5 with SMTP id ada2fe7eead31-604f90ccbfbmr626290137.10.1774601919821;
        Fri, 27 Mar 2026 01:58:39 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50649ccsm5813689137.3.2026.03.27.01.58.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:58:39 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff05af29b4so729358137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9W2JOsd5rYnTgKLEeN7bcfIBn5PqS4dXo4Yz8y+OvwyYFVhpJkfgqKsCSHYCXkpq5+rbHaO2sUHOUZiID2b8w@lists.infradead.org
X-Received: by 2002:a05:6102:3c82:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-604f936fc1cmr564249137.35.1774601918808; Fri, 27 Mar 2026
 01:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com> <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
In-Reply-To: <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 09:58:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=7uzaR2Zj==STiHEfqNf02vpEOOdwJuaqpzdxh_Q5-g@mail.gmail.com>
X-Gm-Features: AQROBzCCf0IPvdkdR2ssvnnJ_xpvUSm51aZ4644j2VSJYknbtlruA69dvm0rnxo
Message-ID: <CAMuHMdW=7uzaR2Zj==STiHEfqNf02vpEOOdwJuaqpzdxh_Q5-g@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_015841_791134_4B90B4D6 
X-CRM114-Status: GOOD (  20.52  )
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

On Thu, 26 Mar 2026 at 21:40, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 3/26/26 11:07 AM, Geert Uytterhoeven wrote:
> > On Thu, 26 Mar 2026 at 05:24, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Add missing cells and reg DT property into DTOs to fix warnings like this:
> >>
> >> "
> >> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> >> "
> >
> > All of these are dtc W=1 warnings, right?
>
> Yes, I slowly started linting and validating the various DTs we have to
> remove leftover warnings.

As this is about display and camera, I am pulling in some multimedia guys.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


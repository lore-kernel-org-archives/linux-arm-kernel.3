Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C71DE7E350
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4PkZ6R/mmLwRiMLG8oh7K/G1iaMQnAp/Sqdg+cClo8=; b=rBeGJa3iE6hREOXmlAa6o9TfrI
	a/CjjWnlIcRJUPJfZn226ufCuvgM4xclbw7HGYhHmCIZ96B5hAvVbfOiwuH0PhBTfnjSqBraxhqRO
	rqLGPvljFrMYPbAU+1Hvps9Ai+3sgn3IIG98Ysrwcs5Du7aobU4ALuzAlCYIyHzi4kCmLll4Qg81B
	KSPZIOa4SdqV6XJuMV30zHUuZO5j9L5qs61s2qwcBEvcvdJWXeSEUaYwAM5EhMpoQbm9CmyHR+f2G
	JnFUOdUAgWMRsjsk+NodVYN5g1szL435vzuXn2Mnn8YbHlI8GOAMGWdHUlRRIK7bhbmxregff+RNP
	xKGZgwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aRQ-00000001llb-3OkN;
	Fri, 03 Apr 2026 09:03:48 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aRO-00000001lk8-37eD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:03:47 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso1001417241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207025; x=1775811825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4PkZ6R/mmLwRiMLG8oh7K/G1iaMQnAp/Sqdg+cClo8=;
        b=D/nR4xs3JFlmBZL+E4dilpI+yaH9SBBuYcn9D5x6GzCcdxKDeyGvFZHgSEInmD4vss
         UARkoBNo5isZ3K2RINgFxs1JLoSIGYpX9ff9fc8zrC9d+IxzWMI0x0kFu16HZUncyDtm
         2uPgy2sYaJgTc03oaPfFHJyPBPdzImKkbINEEs+eVzGT43XAFBF2dtXcFRKT0aWW0Li6
         G48Z5yDztJlH+ofDXRWbFAt30BZcTPuIzwppTV+pLNPS7TayaJOIdv3fsDg/ZNUNw928
         hGorZs/sIEUK+RJtSRn24TSBJC5DHy2hFwpWsw0PHwt63Qf+YtklLDs7Mlaa4Kaxf21Q
         WpLg==
X-Gm-Message-State: AOJu0YxN4fWU3IvF1h2Ay74BJOlVQx+tQ3i6d+tPK5D6V33vOTahrnuk
	fPe7r9+aaX3XEC3QZ/vOlkO+ICaNAjfOLiLiPquZiWbV1XfZnLwMrx8s1RCRbgbh
X-Gm-Gg: AeBDieuBqouk7c1oioRepdDxpnr9rPHfIODJwvca8FKFq0j4oqZU2bCM1tPGS+ZS1kp
	xSdabNDOKzdO0eKYGi+cQ/HEWoi5ACIPwfOZzq8lTPS6D1e5zVzaF0uSnU6WO9ZNmVMdki/tzDJ
	3O9Ke4B5tEut0xktsBM4ey+jF80HvJyI9LLejmgUx3E3PwgLjsa2bjysUvgADXF1rwfWPj5Old7
	GettqmRsT+j+bmnqELgEgauU3OaJpjQpNZZEx8QcpM9nufU4Vpre0k+Levv/y7lHyQIDpJ++DsM
	0NnZa6S/mgMm70KwCR2efOwF7Lg6agQ2iW1j86MZ2q/ZX1Nqovu1lsL5F36mVViTwERVWs2Shj/
	ZcBedno/Rgco+s8glgLsd23y/FGYKiTRA6rvz+3AEqyoVxdkDUh0ICaKK09g+rGYeIjjeExMBlJ
	nzWTSgDqLYhtDK/NQQd0yXse8gM69AKA0mXToR9FTKF8DzWQmUG4sM8U6W7n+/
X-Received: by 2002:a05:6102:80aa:b0:5ff:dcb9:9222 with SMTP id ada2fe7eead31-605a4d5bb3emr869295137.7.1775207025325;
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84f2c5sm5754323241.5.2026.04.03.02.03.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:44 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso959804241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:03:44 -0700 (PDT)
X-Received: by 2002:a05:6102:c13:b0:5ff:fd17:d74e with SMTP id
 ada2fe7eead31-605a5172896mr777997137.34.1775207024732; Fri, 03 Apr 2026
 02:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:03:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
X-Gm-Features: AQROBzChiJZliz9l44U0EaEXy40FbPu9KG1qcLT4sL3xvqKa_3byt050paJddGg
Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into DU subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_020346_782945_2DB59246 
X-CRM114-Status: GOOD (  17.39  )
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

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into DU subnode to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


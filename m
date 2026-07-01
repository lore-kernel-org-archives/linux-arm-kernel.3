Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2432C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r08jOnBEbv4+p8s8I+uh058Lu0DJ1DPtCrylSRF2t7o=; b=XChFhwb8Ct7cun1szsJS3yAq0F
	sDpnts1zWNa+D6dywvxF/DMGlY7dH51c7bGWjgcFnQDVRNqFaf8yPaXcH0TZlg1nQj19a7PQkPz3X
	dRleVRFW/TVHiqzUrQ6/wayYGTSzNYBY0J+FeZW0ZpRBsLjqkWELpyPJG1t217vuYaZN1r1fk12+j
	nW7JZcaO1lam0CdMIVn3w99dwPRZQWTxTctWUlSXvJthg/ipaL6TCWmjwUsLTzKkboymlVJgCRDQ4
	7k/ytIlkbnUDaKHfxIugF47oUS8BAPZzDwW/DzwEMrf82CmBPgo62KYTEbplpYc7KUp/bD2Nk0qH0
	WvV/QGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2wQ-000000034rW-35Kg;
	Wed, 01 Jul 2026 21:57:58 +0000
Received: from mail-qv2-x00.google.com ([2607:f8b0:4864:33::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2wO-000000034r4-20FW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:57:57 +0000
Received: by mail-qv2-x00.google.com with SMTP id 6a1803df08f44-8ed50e580d7so2071686d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 14:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782943074; cv=none;
        d=google.com; s=arc-20260327;
        b=Drg/2MzGw7d9phhcqx6Y/7PYmBDHXbyj1QuvQY9bHvaCu2hVZsqE/kj+LJ4s3IFyzH
         EMuhfCAl3ICFziLHrKY53d9CiwOzVhemvchI+xEjF0UV2eu6OjxPHb5JXVJZqhQc978c
         ECMOrQHHB17uFPExKQDIK5yWE7Pgs9s4vfHhGMBGA4rxj1Uo3J5e9ceuEGp14SzTxiQz
         zC13f33B4vXhCBZ5IDu2M03k6yfPyRwXBZxxKBcFzJqATPRdYziVF40eBlOn/tkoDDHg
         xGCfByNNJFAV6XHAUHx8vMDc1t4sEnCAHfLfzeq1PCS+IVHl2igY3H9rVNS9Ri1mVRYs
         P0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r08jOnBEbv4+p8s8I+uh058Lu0DJ1DPtCrylSRF2t7o=;
        fh=1HEoYVEKA3/4GwbvrYTnPadyX3tWB4S4oJHb1j/Y6ig=;
        b=YGLDlMtDVYyS7nQ6Xa0uYDDU9TZxZE6QrPP4XheyjhcgtzeZkgZqLvDlfjXXV1lzHf
         U1OctrMBYww92tAQI6/zd9jHwNGPGkSmjTvaVFRuYtDwHazLIQX02MPgMLL07fE8pdzl
         hcHXvW72lhvTdvo+D7Vpy1fjKJM6E0hs3l+gHkxxKmfdHQ5ERVZ/JzC5F8VTkG8v811p
         AYV3yyUfEkhK7bIhLTz2GlA/cA2GUkJD2hWyiAdgN4NVzN1Mvnqwxi6IwQ8LY7svZcjw
         T5KaDSbOjOnFJFMND65+7vJJJ3cyzrq6Oj5pReD/Mx0RFEoNrXJvDCKQ/SpH39q52FFs
         AuKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782943074; x=1783547874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r08jOnBEbv4+p8s8I+uh058Lu0DJ1DPtCrylSRF2t7o=;
        b=VWFFnDIeD7+56toCpmu7ZtiSjPgdHW3cJWhcifdlveMN26xL5zZ5ehbf76kpFiu8Zl
         JpPKDAnWgfLr0lr290FEYt3IQHUtC4wARPYkgC800vkn8RGLHR93cXr7Hiq87QAwOepB
         oYmDp+xVpAzXDzphuRT102T6A0gb6VHBJvGSyUzWe1+SnlWwrXUH2/3k6o+z6nxRfLGM
         fT5F2xG1jInRczMBxR0J9CNEWgjIpL54fAeSHYIAARXEqj+Fqxcd4+ph2o3B1HUNccJW
         0tafUCFMOPOBfGY9f5as18O+se7es4Qk22nryotMwE1zsMznEkF6Ekgu8gu1ZO/5XF61
         7/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782943074; x=1783547874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r08jOnBEbv4+p8s8I+uh058Lu0DJ1DPtCrylSRF2t7o=;
        b=fCLjQS2DElsl7gsyJoj2fkbsWigluO8Km/K7k7DPa0jngRR90E0DTaJkKidxPhG+h8
         FgxcQPGIxPBkRYefm0Vdrt81FOLFI3gMjy7qFNuxLkcg8BFZXe5mN7teNLoNxCLg3XdP
         QDwfuw6sZnVDpPBifjMVXcyqR2MhA7odiZkERXY0hNnevmGp3eEvBj2FTI+fsji3MOGs
         ZtaNt79lOcd4TfQLxfgkzWCNO70weOsHl9jND5YYDzxAmkBU4AXa2uU35AO/XeIglcAX
         fxbtByWTWcujgEPkxxizlJPzAXecVSAbjeVzoim8gS5G7ROQCYZNcOelzW/VKmcyj7Ow
         EaQQ==
X-Gm-Message-State: AOJu0YyP03D8nXt/0qyMzwZwKU2dGeTQ7juJQS1w1u5xn6C0Wn7lvSHH
	9bYLuTeJrPSHfyRZquZawyTKTavM3aqpxiTYJ57V+dZIGyX6XqVib1jwTIgci4MVnCFy3TwLpaT
	twHX1bxfpt2odwc2sVEmHE2JcJH1MRXk=
X-Gm-Gg: AfdE7cmvNaUBI8ERlvQ1/NYRHux/pZcC5sAjnLWzA0jV7qvQNTFUhvMInurLb1qp54f
	xCjz4YVYCOpYVI8r2XGuAOIe7M1k+ALT8tSXVur8ikHcL47CAsrBF7qbA1IXM3fQVzMp1aJZ0G4
	JuzjAXgS6K9aRKsormRW9mjn0pqKRY3zpZh+vf1onIo3KlNvgjUg8pGvzC+k4rn8OTFJMX8IN6u
	HzOL1Of6Sx+LgvsMdfUU0RKge19H9OjegHznXZU2fQ8ujjx6r614ZnM1z2F40xYlfmH63dm/pEn
	PbWeRE4DTVI53ipfN/3kcXFBnDrdLOIVRocbZGE8/fu2AAK/vl7PnhGrIw==
X-Received: by 2002:a05:6214:3203:b0:8f0:47b2:5736 with SMTP id
 6a1803df08f44-8f3c6ac1b79mr52988016d6.13.1782943074645; Wed, 01 Jul 2026
 14:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-7-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-7-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 14:57:43 -0700
X-Gm-Features: AVVi8Cc5P_ml4W8xRWvnn7RkMv5ON-KwMIB9CujF2NjvtyywyLTQEgj_XJmMKsw
Message-ID: <CADkSEUgm4yX36W6dG-5WOm42Z3iDpHVcz73suWDN3=bsGgq+0g@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_145756_524211_43E3A417 
X-CRM114-Status: GOOD (  19.21  )
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

Hi, Arnd,

On Wed, Jul 1, 2026 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> Following the deprecation of big-endian ARMv8 mode in arch/arm64 in commi=
t
> 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN"),
> this does the same for ARMv7 (and v6), leaving the code around but
> disabled by default: There are no known products that make use of this
> mode any more, and it only hangs around for testing that it still works.

Nice! Getting rid of ARM big-endian support is long overdue in my
opinion. The patch looks good to me, although see below for a couple
minor questions.

> At the moment, there are no known bugs with big-endian ARMv7 mode, but
> it does break occasionally and require someone to fix it.  By marking
> the code as 'depends on BROKEN' now, it will no longer be covered by CI
> testing. If any users remain, they can keep patching out the dependency
> but are more likely to run into regressions.
>
> The big-endian ARMv5 support (CONFIG_CPU_ENDIAN_BE32) in contrast is
> still used on Intel IXP4xx platform, and is the only currently supported
> mode there, so this one can still be enabled.

If IXP4xx is the only known remaining user, would it make sense for
CPU_BIG_ENDIAN to instead depend on ARCH_IXP4XX || BROKEN? Is BE32
mode known to work correctly on any other platforms?

Ethan


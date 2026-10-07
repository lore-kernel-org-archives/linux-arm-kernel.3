Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0C3CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 01:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s8nYi5HbtoA87tSkC1RWmRECsh/ju1fYhQ7RJquM8k=; b=aP3lfcsFDzBIu0J5z74G5eYO/K
	aNQGKLJykC5F5ostMCT8lirVtstWIt0uKMWleYJCXk6DKtg0CQzAmrtkCTHVge4DxoOkQXU9/I+Wf
	AKe/Wzs0Y+u4jHcNq55GBCjN29+ILVcVyQBotE+w7PfiTp1IOLRcwjECruITSOG/zUedxgcrNnTUP
	tpK+vV+uYyMBgVrRrkiNWoeS6zpCd6nL/YEYabugkdIcFQzVlow1JFINbqVTpv2nTA8cZKRGmnsJ9
	6gWhPmROX6579Nwhg4nYci4B2/aYyjhlvJwlmD3rFswYRywZ5+avcE4Oi7RwnmZfqVuA2ZuIIm7nw
	u8OQCDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEGRG-00000001Zyt-3xQG;
	Wed, 07 Oct 2026 01:27:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEGRE-00000001Zxt-2CZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 01:27:22 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a9a20a5e72so1633705a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 18:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791336438; cv=none;
        d=google.com; s=arc-20260327;
        b=IjnEEvgdgabk3u/EBE7dBB4obc26KJeoYm6VV6XUs/4CZO5Z5u2hFbVtQq58Qjrul0
         S5ZT2/mS6jjQa76Dov7xYK4pisSjZzq0vOoWt0/EN/AJpIsM2F+tUok01SuS+4QrymMi
         PjTywwhkWxYghoTOsfcay8wnKVptEbOJkRu0Pi36O3ah6FwhsvS53iHOnaw0IYWlQQ8+
         3QQPkVdpygZpdW7NUcHqms1pa66LSI2pTzxaN5OK8w5KlZ3Ifzf8BG0AATLN79zn7ye0
         r3t6Zq7tNX8aysCFNOLg4EZqQN4/HSrCiArF3rLOmr6ga1bHF0IFlrRJocwYjJcIXqx1
         +eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+s8nYi5HbtoA87tSkC1RWmRECsh/ju1fYhQ7RJquM8k=;
        fh=nVkdeDhj3LrA3v0vO/EtTrSuuTJAYAavAQaeWsHy/h8=;
        b=e7V+lBcy36QqfUPMo3wjYWBW/sbmvurt5ckJolWXp63Nb9xk+xDxf+9fDzYSzlKlST
         UGVmI86Iv1DtbLS7TJhS3Rn2cSgMpQ+IoEHtCBdACto2m+v1raBdB/lXULo9o/gmeO4R
         iDq4ejnHGoS6pqHsk+o4P0gPtT1JVEXPQli3KUjsPv3L2QuU/TsEv++uGXWAnTY+BvR5
         aj49o+5CI+OIaB3PU8OCJiDVdoazFut6hoLd62ydl9Bcrs8ZsVdrFeftACpw1GFkQnTD
         sfT2z1u4E26BZoAuBnJTmAkOrDUWkDHHsEApHVFnR/muOTKeBERpMm7BXF/uNyRClE/U
         K4DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336438; x=1791941238; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+s8nYi5HbtoA87tSkC1RWmRECsh/ju1fYhQ7RJquM8k=;
        b=L1seP/HqOJuUIf11PAlPadVnL3Na9yl3SPuvslCTgoAguA/Rm9HZZs27mha48nFdsr
         tees8kBzTybK5O4A+SmUKdWmwctU9o5xMVF0/YNJpAOer2304QH7Bt4RnC0BJwtbwe55
         TMi4EPfp8JxS7fC2ziAYukUkzpEt03j/ZuH379yNAh+UTEK+tDNb9ZKWaX3CAhJYo7j/
         Il7+r9wqEHernSnt5aPe6QysK1r4GrrYlvq87xiM24AIU5cOyt3jX0i/lg5ZIJ5PzEzL
         mQbodqh/IMI4e1e89rH0sTDapOlvDX/tW6DaNlfUNrZ0YjBJ5N1SUwpcWlv0/ZOgSekr
         i3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336438; x=1791941238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s8nYi5HbtoA87tSkC1RWmRECsh/ju1fYhQ7RJquM8k=;
        b=1/SuH3icJ/fdulo2ktXJ+SYL4owGOm/evbco4F5+JBRaMEYSF/R/Ji84j1bw94Ryji
         QW9SPWKyM7TZQpf4vC62ZCSIKfXhMwMM8Bb65vgyk6zsuu/5YUV58G50O7nIO0ykyKQZ
         cWNwJuXZ5PxSs0hekVuK/FSWguiHxIiyjOPcwnlZC5Xf1A6wb6kc/NGf35TPOT2YJbjv
         87oeiftetfchCshUOn2M6xBYk72UZVnoRui4j1RHEPSygx3Pbxko/oHcWa7bnpxo6u7P
         kBZsZoZFrJBathb2ggcNLn5EXYgrFlOGYo+G5MnVIRXEVrHRZtIL7gPJ7UgHOgKxBDpC
         j50w==
X-Forwarded-Encrypted: i=1; AKwUvBzzVg7DpVFV2m3xMHE9Q3Nn/bK1mzVv5sbj6sqxNsB/98cl/MryWLyIyb2mInOds3AhFLwQU4/Nw5tvsvpcZyDu@lists.infradead.org
X-Gm-Message-State: AFq9FYLh3hBZaMwDd/JyAQ73Zq2oZuoz/sHWWCM5NYkEIV5cu1Z/Ym4z
	VmnC/UwZzCT6LdWfx1CdOzBWNKJhzQ1oj7IcqmYB/enoeSLAuL+S/xGnjT2vOzMqQBjF+Uhe78B
	tddwCXiry9RdXhfEoJY8vvbH42SnuaZc=
X-Gm-Gg: AYBFou10LwlPzOl1n7huPW8IITiURgGcOvDl/7g3zML02h/+aYn2vVrNTo7XOBg8mIG
	zXfwXWAiwwXsFBgdKRNpxu10Zc95TOfTdGbAeziuStAQB4UC2dKWqw3ISZbnfBsMWzHfbsXB2If
	mqD1AQC0e+NQlhaz3wGuBiGX3onzwXgzBPtoQNC+1O8UnoCViQoZKusk7fcX/aDqGnPvLh1cxri
	6hhU9Jg9UTBpYeK4nJozZFfFP2LohUC5BlYwKs+jmzRng5nRKxO+hlKu0whfONuYLNFXE3JAcMN
	10m7j+iRJ6B//rd2pVuzvuF5KolX+VGPBbIV/MIL4uldQeMI15ZJgZJ7cRYv+V5SuGSxtOva0GY
	DMOglgCdTieUA9zQ4Gii82qlRKl/iUnQ5y9eXaeLSGji66uRsvox4DdgvdKXiu7PN+u7RRSP171
	gDbz3GalzF+dIczqKX2SHjdhHobA5d29sxpGnNve66528VrSki5N/5N3jA
X-Received: by 2002:a05:6402:254a:b0:6ab:eb3e:ef50 with SMTP id
 4fb4d7f45d1cf-6aff47a5eb9mr641273a12.36.1791336438162; Tue, 06 Oct 2026
 18:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org> <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch>
In-Reply-To: <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Oct 2026 19:27:05 -0600
X-Gm-Features: AclHuK9lGFJ50frV5XOEspPFhQU0WOI40P-vsRfzEyGW1xtdFw_gLuYmcCzp9Es
Message-ID: <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_182720_618384_AEC76E26 
X-CRM114-Status: GOOD (  28.78  )
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

On Tue, Oct 6, 2026 at 6:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> > On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> > >
> > > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > > Please do not repost the series just to address the above. Instea=
d,
> > > > > reply to this email with the missing information, so that reviewe=
rs
> > > > > can take it into account. If the series needs another revision fo=
r
> > > > > other reasons, please include the information in the commit messa=
ges
> > > > > then.
> > >
> > > Please make sure you read this paragraph, to the end.
> >
> > How much detail should I be including?
>
> We want to decide should the patch go to net, because it is a real
> problem which bothers somebody. Or is it a theoretical problem which
> will never happen, so we might want net-next, or maybe /dev/null.

I mean, it's in an error handling pathway that could be hit if there's
an -ENOMEM error on an IRQ-action allocation. So it's probably
mostly a theoretical issue but I wouldn't go as far as to claim it could
never happen either as there does appear to be a plausible way to
hit it.

>
> Sometimes it is really obvious, things like a:
>
> Reported-by:
> Tested-by:
>
> from the same person, makes it clear it should go to net, and it
> probably is correct.
>
> If not, a statement like:
>
> Tested on real hardware, regression solved, no other regressions
> found.
>
> or
>
> amd64 Compile tested only, probably broken, RFT.
>
> or
>
> New feature tested on real hardware.
>
> Put yourself in our position. You are the Maintainer, what would you
> want to read to know it is going to the correct tree.

Do theoretical but still potentially reachable bug fixes go in net or net-n=
ext
generally when they haven't been reproduced on real hardware without
an artificial test harness?

I had assumed that since the commit message made it clear that this was
a bug fix and not a new feature then that would be sufficient info to know
which branch it would go in, but I guess it's not quite that simple?

>
>      Andrew
>
>


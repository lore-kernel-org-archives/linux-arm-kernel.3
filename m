Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969A0F41995
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXTyVOg75691/SqrnwQ0Y7XVqOHRVyrJmHlOD7bYftw=; b=0pnGNB8lU3wXxmIPa56nui1LcC
	OLWpJZCfP93YX3SghPJifPUXbgj7xnCEv/yP2+TOupurFtPumqnT8Vu166fGAo4vsKLSdeqMl1f1U
	oi2D16Cg1H2YOe+zvTRmlNSwDUZJn5//roOXjUYDKWJgcxuxQh8MUBd8GbTH9ywaUO62T1OuoMw5k
	TcuqxVl3Ra514t4mZHpDBh9jLOdExmHX7QFWbQud14efnzAYWMVI1zs04E4fd9uyKVjV7VK0V79yK
	alSqEhqRRnl+7S3TRrpBkddZy5K6+3HjadrwYT5opdsJ6GuChGCa3LWtgO+uJnokX5MDBmJm/WMnA
	RZ/nxb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4Qc-00000001TYK-2EKY;
	Wed, 15 Apr 2026 17:53:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4Qa-00000001TXx-3NsY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 17:53:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so63850395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 10:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776275607; cv=none;
        d=google.com; s=arc-20240605;
        b=Ar33dI3c+rllrYnnJL8GPfb+b/M8oe0xYPHjknvRfsUDiPT/Kj1Wz7699QQb41/g5h
         Ep+HMR89L+XTvKqG8TSbvps+8ZwOvQE4gtFMrtRn2bYU5MYNC5bTg/eOsswxe/5+Pht0
         fKzUw1XTjGMDFGSBpKZOP2lvJOMsuVtKp3KB7goSOlPaKhS2lTPdszFWnFsTdpsp7SlZ
         t3ytbicFtfGlc5BF1KpAqVmjEfb3oLru2fzTD3DW1ibmlnQ/T55Hi49Aw0+3jyUQt4u0
         UTL5Gr7EtUcLS2t+1zd2V5ef3KAFbPc5B5yLRuP2nKhp0Xh0jwolBnBV0iE+GyC7rcEh
         wJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vXTyVOg75691/SqrnwQ0Y7XVqOHRVyrJmHlOD7bYftw=;
        fh=RtFheEGkzjEwiYi5A4b6xqjXYQWjO1jD/JsXB3n/OJc=;
        b=bHY2tgFplHXaFU/qnqpeN4sgy6K+3Qpnrcsd29pr/jv5+NaXGJ8J62789YPz8c+lME
         UcxLhNvtGvX21H1aFz7LAaJx2SOO52fSr2K7FtGcOPR/W5DQ7AjSoiVmNzQOJRbpjD6B
         sOpNKTMMeVt22t6ETRc72ogYoQ6+CRPjXjF5Wp0sIA//cVMS9qi1+QvS5E4oZo4+zGka
         f8yadSnzSlmZxZ9ELuKPNsT90rEDoYpVIFEtXrFRMBYRnTJz93+LP18dSuzHsUJfOdO2
         e+fa7QjMLZ3vgeGH2R1V7p28wfYSTqSTo2zNFY23diiDkyWlkBUuTYmjjKCIGvAYqUhr
         aooA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776275607; x=1776880407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXTyVOg75691/SqrnwQ0Y7XVqOHRVyrJmHlOD7bYftw=;
        b=SzCG5cVVNsfDffs8vub6N0wO6/meOndjrPb/6yoaa2ksxlS9Y7hlhBppuGdL1bV7V8
         Srczk9P2BKV6dfIXtQh1hO4npR+5RWDv7MtIvTI/gqumxTggi/0UwzS4pVt3eYD5oRcd
         wKWOuHbGEDXO7CyQHgIB/nQeczlnuvXd3E1YXWF5ejIdctOLJBD5N6cTNR6epVyArMd2
         flqX2aRlBA2SAFZnTk4k0aT8JCksQCT1G326sAi9heQyDb+HufzMwPJIxL1W0bJuLCyZ
         //ivV12kxCrlhsBzcjg0aXtKCXlIo66NhVSNsKduTx/oAhVoju1EV88gQtL5qnZddynb
         3jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776275607; x=1776880407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vXTyVOg75691/SqrnwQ0Y7XVqOHRVyrJmHlOD7bYftw=;
        b=TD7n7hLh5xy127KmuOhgZFFg5QLir87EFx52TOPLWEr2DjDvFmUUaRcS+5G8v+loGh
         aE1+wdSwbu3jQ4RKtbifiL/tzA6/rNdX3I81+Ql6872sOFp1uP9T6GgmDG7trcV0VYCI
         AIwUNS4HC3rszZRYIAXE6ckiLRnyhnlYL3LVY5UdY10+Ef6EjsB4nFPi7syVfkCA3unc
         glblZrDXgTvuz5N+ygr4AXbMwLS+pil7eNbdJPmqw7UqFjqPevLEd/GiWrL7u7/gSmEC
         IBrixF01uvvMGqxAJ60nzziAa5XzcT+lBo+SxUsNdtLJD9jFOF80RLMX0KoHA1WD7bvG
         lZ2A==
X-Forwarded-Encrypted: i=1; AFNElJ8S+wUrFIOcYO3w+Ke9ttyhoGOAzbn1cLS7diWlhzIMiOS/m8NONZ28OkEqrVIgsitTkTCvO5rjyMiqKKaglXOs@lists.infradead.org
X-Gm-Message-State: AOJu0YwcDNSvyk3zCuvG9iHZHW0/o4ZThgGJuBJGEDVIFoaqO24IRMPI
	VO7orDZMxTDPTE+xbzuLuatgUj2eaFEJ7+wB9pbWyaQy5+9yhP65T8qPfxfZux3TInxpbNl9FFT
	XKAMQqApjr6NFGf/KskOb2y2gDsKoV10=
X-Gm-Gg: AeBDiet6f1hOcS8JOT0DggAlwemRoMH5FgVvAsnplxv0kolS2fzDYpa3z3M6SxKrnyv
	9mCtLams23us0iCceyp4usEwScehFkE5DXiqN/rjdwNRtHT5wCSoowPsENK0roleAGtiMq1C44/
	JFRYnZ942/leFRsDXFv/USvJkYTXFF94hKGmUDFsYYQ09plHYnjrTf3ksjMSG2AqJXD0VrV98N4
	5e8B0naj3qb1Py06Cycu2uCiXaTumZH4Qgiw3v7zxc8ruolP+uuDS8ca2vgH54OQT9z7tSqAoWt
	42BzWUJWAASGPp3FCueWPZ7zaT9miWFZLQEdze0fV/RZ4CQtAgJm1tWUzZmw6A==
X-Received: by 2002:a05:600c:5d4:b0:488:d6eb:e63c with SMTP id
 5b1f17b1804b1-488d6ebe787mr187773555e9.15.1776275606586; Wed, 15 Apr 2026
 10:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260415023947.7627-1-CFSworks@gmail.com> <ad-LAB08-_rpmMzK@shell.armlinux.org.uk>
 <ad-8q4OrOm-VtGrO@shell.armlinux.org.uk>
In-Reply-To: <ad-8q4OrOm-VtGrO@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Wed, 15 Apr 2026 10:53:15 -0700
X-Gm-Features: AQROBzDx1d-IgIRVj7cWC6Z49XonSYVLruilzmwd4JOrF6rh0MceXKBVK6meuRA
Message-ID: <CAH5Ym4gy6g8d88-vGhe1zxoV7jNH_fXHsDSdDWC4x00H7s-3=w@mail.gmail.com>
Subject: Re: [PATCH net v5] net: stmmac: Prevent NULL deref when RX memory exhausted
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_105328_884570_79F960F3 
X-CRM114-Status: GOOD (  23.05  )
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

On Wed, Apr 15, 2026 at 9:28=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Apr 15, 2026 at 01:56:32PM +0100, Russell King (Oracle) wrote:
> > Locally, while debugging my issues, I used this to prevent cur_rx
> > catching up with dirty_rx:
> >
> >                 status =3D stmmac_rx_status(priv, &priv->xstats, p);
> >                 /* check if managed by the DMA otherwise go ahead */
> >                 if (unlikely(status & dma_own))
> >                         break;
> >
> >                 next_entry =3D STMMAC_NEXT_ENTRY(rx_q->cur_rx,
> >                                                priv->dma_conf.dma_rx_si=
ze);
> >                 if (unlikely(next_entry =3D=3D rx_q->dirty_rx))
> >                         break;
> >
> >                 rx_q->cur_rx =3D next_entry;
> >
> > If we care about the cost of reloading rx_q->dirty_rx on every
> > iteration, then I'd suggest that the cost we already incur reading and
> > writing rx_q->cur_rx is something that should be addressed, and
> > eliminating that would counter the cost of reading rx_q->dirty_rx. I
> > suspect, however, that the cost is minimal, as cur_tx and dirty_rx are
> > likely in the same cache line.

No, no, I like your approach better. :) It also removes the need for
the `limit` clamp at the top of the function, so later code can assume
limit=3D=3Dbudget.

> > It looks like any fix to stmmac_rx() will also need a corresponding
> > fix for stmmac_rx_zc().

I agree that stmmac_rx_zc() is likely also broken (in a similar way,
but not similar enough to permit a "corresponding" fix), but I don't
agree that there's a dependency relationship here. This patch is
addressing #221010, which affects the generic/non-ZC codepath; I'm
afraid the ZC codepath warrants its own investigation.

> I have some further information, but a new curveball has just been
> chucked... and I've no idea what this will mean at this stage. Just
> take it that I won't be responding for a while.

I think I follow your meaning. Good luck getting it straightened out!


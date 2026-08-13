Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33740C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ/+J4iWaSr0QAaImk9CwK8bHeHUTPzax+SIIzoJ1RA=; b=t8Nf6Djvl+/MgeENi/HHM/yTch
	CQxBN/xRi3MHYynW9+fgCHxZziclmeglZJ94uvPvkUXO8emX+5TXcvQ5LTyba2gz1ljx/vmUopU4i
	6BU21+wI+CBiCFmPyl0oF8FVkj32H/I5f9ppc0r7JARZD7V5Tc9bgJE1CFv/S3+t4suCU0zEw6rX+
	OfAAKKg2SGKIoFCBaAjgPd1Ji16PfibuUY532EkoZ7ezC7jBCq3RyORMmY6BBi0tbj2r1hVvZ/I/X
	E5GEoxWE7j+Wmfj+okDZ+bUuKD2eEdvYE+ctCi1Zlkz+42gbLZJoDsQkARC2c+qr8mLCtLtT7cq8b
	w8BcBZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGr-0000000HWjO-2mQ5;
	Thu, 13 Aug 2026 06:50:33 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGl-0000000HWfa-3TpL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:50:30 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so11435586d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 23:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786603826; cv=none;
        d=google.com; s=arc-20260327;
        b=HoO3yvTc26ABwk1Kgbi48Gt9JFHg9y5GtC8P44h4F4lMLFrGvtQVrRWMNK3Felk1Ma
         nHD9NYheh3rgkDu15bTvSlrcCUGUaSaH+CcK4IzEfndnmNrirgvmw3+GVsldGlcdjvvD
         cPXbgYr8OGiaJ3FR1LBEx6Vqc/OyoBOJLXuELrHDhJ1CxaFz4AOftOY2KD6PPM5KUvTy
         OzxvwP2BwJh9JTuPrmLEXaGXISTylwLCZZBWCtNQRiLpv/rye589SmhC116UNbK+3me9
         bSA4Ipo4gTDo42fOJ8a/Y25LG2cZ5XN/qM8sXDPtjWcvFKM2VMRkapx/AkqfzxaT+kED
         jxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vQ/+J4iWaSr0QAaImk9CwK8bHeHUTPzax+SIIzoJ1RA=;
        fh=F7WWLQ+Rkxab55kuvtdM/IQ+Ai5m+XmueaGH0SBZx+M=;
        b=W1YzgQtxSducMaQXYYu6IF5wpeEipnyJ1Y4sPp6qsw+mweX8udhpJHqAhavmE64fpD
         yw1Teokni6WD3bmcPwU+bKO9VOLzhU0Am7qs9XDP1s/FU7lYy1myDXNlU4vYu056YQ1K
         OQOsgiuqUkLSXCSGuSvhfBwlkxEiIlv95A6IUiypaluld7wiUCdWbltblvp/H7GxOv4B
         G+CHkgNHy4DOkhH5jQzbz2NQF7SHzwNIJyp2+GPrjyS+A7d/gZD85Qd4vqtTzpYjR8Oj
         8rnTyFi1s7n/DhmT7uZ15THyPAjE4mkjxCJRNbIEXgSZWrkjpHsMdj8VQ4mItvkGd1tw
         NeFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786603826; x=1787208626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQ/+J4iWaSr0QAaImk9CwK8bHeHUTPzax+SIIzoJ1RA=;
        b=s54pxHrq6RdMajKmzY6/ZAuzuZBJw0xSUW1cium6aNRL7Z8oF5gMe/FLBvqYD1JCPc
         l2LsqHTYiBeEplUju4Mdur7h5mCK+CYQQwvIBc4KJWKO+NwN5DdOruADD9irXSQ6DueC
         ElnkgDMh5q8dmbdkjr0zdF1S6nAhasmw5f0Sp9ixTE9qMxgbBM39HLNY2sELTDyiI6NG
         /0ewvoFlaVUPj9ggT8nyqxIBNxRWrH3iWCMEQD/rcCFNDvSdvNHEn4V7sb9CZGzOugzn
         B9/KD/ptUnDg5N6bRplAI88Kami6g74bDIsDFS/pw/Fg1T1Zpmm5iwOqFzvpoRFvvs46
         SDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786603826; x=1787208626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQ/+J4iWaSr0QAaImk9CwK8bHeHUTPzax+SIIzoJ1RA=;
        b=p7KrF21rxzcoBQwJ+H7GGvxMLHqTA5o1Us2KiEONcyUGdjyP90/AGGdWIR3yE+VnXd
         yHBhCAHaFwm5vQQeNwoBkGbDVUb41+WB4FoPxqFykwmAUexgV1f4Y9EnYwTN9dQWXwnT
         YsDI2MTphCStR9QjU0aXpyg+hLQH4u0YXyS4Pn0jl9ERrzQBnTOc/8xBpU3yxJ1sHtpM
         hbgfEgznQaVopQcm4rEV6aWEv69UCP6+vhJ2xAqnzsYISmHrPwSzZJOZr5mMpHZ2UU6y
         V28JRcHVeGcyUMufNhffDjRjzwS4VlMVJof1oSaM+oBS1m5lhSm4j5ecjOTcHGJ+UTrH
         rdIg==
X-Forwarded-Encrypted: i=1; AHgh+RqQp11flBMXl5U73gra2ewhJGiSxkdTgl8XfO2/yOIdH/d4Qsq16thXh08Ydll1CHGsCHPhVF6LT7HMmdKLegu1@lists.infradead.org
X-Gm-Message-State: AOJu0YwmRwPlv+K0aI0Qf40soNr+69Y1lLD/blppA72wP6Na/6Oq63V1
	UtKsivodZYGRx+po6hcN2WPSKE09+aoV+R8PlpxqsI6FbpOOMxdquNmvDe4DchGn4l9axh1emfs
	4uoouUZiD0AeII3RMQKlIujf41gRh3pfCsUwMnylHrxAf
X-Gm-Gg: AR+sD12tZz5VHxSQ7m+dOE6BmMpn7DLAEOxvJyrKgnnpwqcTTZWJZNp5IfezGjShJWS
	7Jvfc/93S0k33aReXngKKaz92Tqv+iPNTOqw2MGNwH95qJueJnG86Wmnxw6qRkfPxli8v8ihECj
	i10cCAzA8j0xkEyq1jb81IMoWAJwaczZJ+oJMLQSnGPEcjAOYFtofKK84AcRUGmtPz8rsYDctZE
	KqyG9Mb6Y6b39SiUiFUe/Ls2gmIuP6XX5U4yMjKUtsbBn0uFd5SxTsZ7SGAeFMbMwmmsyWPsvQd
	c7LpRrQWoMlOfx37r/bZsR+IL3cJMeIlCMxp87zAK91S
X-Received: by 2002:a05:6214:3019:b0:90a:804c:325a with SMTP id
 6a1803df08f44-90a80a18dd5mr32786616d6.13.1786603826047; Wed, 12 Aug 2026
 23:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260810100221.9166-1-zxyan0222@gmail.com> <b3d90606-781a-4055-8529-e68e22a45ce9@bootlin.com>
 <20260812202027.976@gmail.com> <96146485-03f4-4c82-bb4b-9338b6591b2f@bootlin.com>
In-Reply-To: <96146485-03f4-4c82-bb4b-9338b6591b2f@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 13 Aug 2026 14:50:14 +0800
X-Gm-Features: AUfX_mwuR7TH-SyGnaiEE7b7kMzgyrxcbmtqcBBKgjZW-m2zIUMKpIqkp1nO7UM
Message-ID: <CAP7veT+fufSoBZBOQg+MQoGeedfzQBRtFrRPz8si2DJSJJ7NtQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: add XGMAC timestamp
 interrupt support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Nazle Asmade, Muhammad Nazim Amirul" <muhammad.nazim.amirul.nazle.asmade@altera.com>, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	andrew+netdev@lunn.ch, richardcochran@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_235027_888941_447C7C45 
X-CRM114-Status: GOOD (  30.76  )
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

Hi Maxime,

On Wed, Aug 12, 2026 at 10:08=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> +Nazim
>
> On 8/12/26 14:59, Zxyan Zhu wrote:
> > Hi Maxime,
> >
> > On 8/12/26 5:10 PM, Maxime Chevallier wrote:
> >> If there's an interrupt storm, then this should probably be a fix for =
-net
> >> with a Fixes tag.
> >
> > There is no interrupt storm. XGMAC_TSIE was never enabled before this
> > patch (XGMAC_INT_DEFAULT_EN was LPIIE | PMTIE only), and
> > dwxgmac2_host_irq_status() masks the status with the enable mask, so
> > XGMAC_INT_TSIS could never fire. The actual symptom is that
> > auxiliary-snapshot extts events were never reported -- a feature that
> > was never wired up, not a live interrupt storm.
>
> Ah indeed, quite the opposite then.
>
> >
> > So I'd like to keep this on net-next as a new feature rather than
> > retarget it to net.
>
> Yes makes sense indeed.
>
> Can you take a look at the sashiko-reported issues, it spots that this
> could interfere with the timestamping on agilex5 (another XGMAC platform)=
 :
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260810100221.9166-1=
-zxyan0222%40gmail.com
>
> Maybe there's some stuff that could be made more generic by moving them o=
ut
> of the socfpga code and putting it in the more generic timestamping code =
?

Thanks for the pointer. I looked at the sashiko v2 review and the
Agilex5 concern is real. On Agilex5, smtg_crosststamp() polls
XGMAC_INT_STATUS for TSIS in process context as its only completion
signal. The patch enables XGMAC_TSIE in XGMAC_INT_DEFAULT_EN, so the
new hardirq handler now runs on every timestamp event and clears TSIS
by reading XGMAC_TIMESTAMP_STATUS -- that read can win against the
poll loop, and getcrosststamp() then times out with "Wait for time
sync operation timeout".

On moving socfpga bits to the generic timestamping code: the
crosststamp path splits into a generic half (pick ATSENx, set ATSFC,
poll TSIS, read ATSNS, pop ATNR/ATSR) and an Agilex5-specific half
(GPO0 rising-edge trigger + SMTG MDIO system counter). Only the
generic half is worth lifting, and the platform-specific trigger
belongs in plat->crosststamp. That's a useful cleanup but may be
orthogonal to this race.

For the race itself I'd like your view on the fix below. The simplest
option I found is to mask XGMAC_TSIE around the cross-timestamp so the
hardirq handler cannot steal TSIS while smtg_crosststamp() owns the
snapshot FIFO:

  static int smtg_crosststamp(ktime_t *device,
                              struct system_counterval_t *system,
                              void *ctx)
  {
      ...
      if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
          return -EBUSY;

      /* mask TSIE so the hardirq dwxgmac2_timestamp_interrupt() can't
       * clear TSIS via reading XGMAC_TIMESTAMP_STATUS while we poll it
       */
      stmmac_mac_irq_modify(priv, XGMAC_TSIE, 0);

      ... arm ATSENx, ATSFC, toggle GPO0 ...

      ret =3D readl_poll_timeout(ioaddr + XGMAC_INT_STATUS, v,
                               (v & XGMAC_INT_TSIS), 100, 10000);
      if (ret) {
          ...
          stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
          return ret;
      }

      ... read ATSNS, pop FIFO, get_smtgtime() ...

      stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
      return 0;
  }

  /* every return path, including the -EINVAL default of the
   * int_snapshot_num switch, restores XGMAC_TSIE */

  static void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv)
  {
      u32 ts_status =3D readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);

      if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
          return;
      ...
  }

This keeps the extts handler unchanged and just makes "who owns TSIS"
explicit on the crosststamp side.

An alternative I considered:
  - making socfpga set STMMAC_FLAG_INT_SNAPSHOT_EN and wait on
    tstamp_busy_wait like intel: cleaner long-term, but a bigger
    rewrite than fixing the regression warrants here.

One worry: I'd like to confirm masking TSIE for the ~poll window is
acceptable on this platform -- extts snapshots taken during the window
still latch TSIS (just don't raise an interrupt) and are reported after
TSIE is restored, so they are delayed rather than lost. Does that match
your expectations?

>
> I don't have any xgmac boards to verify sashiko's claim though.
>

I don't have Agilex5 hardware to validate the crosststamp path either,
so I'm relying on the code analysis above. If this approach looks
reasonable I'll send it as a v3 with this as a second patch.

Thanks,
Zxyan


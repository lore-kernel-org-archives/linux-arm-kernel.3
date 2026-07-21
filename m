Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF6CC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=; b=y0EmEo7fwRdrAi3LUhL7iMJVrU
	x2NjDaVzKoz44gsj0EFjBpCui9EyOUz0WI9vX3Gnhk8lw7qY3EVQhKLcpxEaG4nmyj0f1F2iMOIuK
	yOhoNM8LlVJ/bNuTvrii8qr1kcFqPlq6XPnVU+w/YH8Jl8JUOJBAqiIU961cl4vPJ8JOCcxl1OzC/
	qZJDSiBjZTMnxm1ywwHnYEhbNW+1exTcoVe9Hym71KzATm8dW/sF3VbeopKNjEWeDrGardmLJuKfU
	2hoNgSfxNhxT7x/CRR0FOTccGerVrJ/OswX1mxOPBprCb1jYLWynRsA9G0bWS96lt6fC5FKR6IM2q
	+qvXKVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Ir-00000008tk9-3UFg;
	Tue, 21 Jul 2026 08:58:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Ip-00000008tjb-2XcO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:58:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso7503733a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784624294; cv=none;
        d=google.com; s=arc-20260327;
        b=KVm2hGyeVn6vFWNTFAbqdMEj535JUs3JCq8CgLftGHrNPEnluP4G6L3A+ATlQ1brKa
         4g6ENDa4B0fGQuDqsgmCcHXOVBpvCUIkgDWPOnRYHurU4Iz5TyGfKvisQq72YwjqGRZH
         6aXRrStOjsGFh0qo3zpnXDz5S4qvx1NrA0GPJ8gUtlx7hqeUZNjsKI/Rb5xfPv6/SMHB
         An/TfxAFxWq1DWRDufypf8Ct/Ovm2a4VgXbEkX8hHcki+Vqhi4YUpnqK06BPmRk/ShYC
         n7zxFjtATu0GQPUctFjx1juxQItYnIHmaJNYqxUjQdy8UH7fzDBuRYj5SLkoEX/+EHMS
         e/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        fh=kjVUGZuXUamF4yas9HYmCCONuRl/nqga6SezwRDrUDE=;
        b=dFyYy/cX5FW87IwL5F8I6TVckAK4IwU6WRYJl0/VV0Ogzlp94FKAluTv3D+9vBTTr+
         QCNTqCsmaBET5OSIsV4gRYqoPCm/qNeSCJhjYUIAKfEnN3YY+Gsq56iQ04mjkHijbYHD
         INRBEiwJC7q9Emizzyzm3301IxOt9a9DXxLndQMMeWVr68tGDtoPpRu9CmV/Oyt6ZpcP
         jpbyigbd0xp0CPB7W98B+hu1GzGsjBpgsNFwN7FAF8QkpsviLGt0+VN9ee07jt5UvsJP
         egjbjDHBtk15otknTU2XeVa3dM9LTUmyGGwG0Mh8maigorSa4YNGmX3WCRQL1UZB9Ori
         rgJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784624294; x=1785229094; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=PvD7TtQ7LTuNJ87/u1FP3TTZMuwmFbBY8Q3o7zcvl11nycNPlush4NzLzYA3iTGyLA
         DOHsu0QUBECJjkwD2XwxJM4Sy4jllMCybFq2wTEwvJ8s1AYS+6cKD3YxHf3nke0jtlWK
         5VeDFuwA02etatTrC3IwuzJFMJWH9JPCiMS6jzpz11OqA8Ax573nqPaQGGxUrhxfVHlr
         CDvDReSHV8H0Gdl0ss7vdPMOnYQz07rw3c/22OPKZ8Q705GFahboc10m5530Q83H9l0+
         EreJ8qRGNRB/1i0wI37Hi8nqvAlagJgYNRl/CYyfq2X/4Srf7y+mf1Rq88TBzi5rt0ch
         dqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624294; x=1785229094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=WMgH33rDBo2/uXYoK8heH2CnPqQBKTmsFjuVj6V+PfqxoRQ+kudYW420iMs2JUpD8k
         6/qbDfjbXfhxitP4K+kEGm6kPqQRjoqtYqyoPm7aqI8GqcpCej042/ZluVicjeego5c3
         AxOfr+W4EjmSQ/pgqL9gzJJ+GRsI4H9Yrb2/QI4imdRb8dtTLYbteMyDAiKzPxOj0OqI
         srqqzblSAS9GqUwaD3AiheO1ls8NPiRdOmmyzRkf1IYe2IJu5DVCg5gDEDokyxdNttE1
         BR2jN5naL3Ukup9CCMR0uGORW21xlxvYw43Ek4F3VKef5nibftZZWkLmysfy4mmvDhaI
         OBrA==
X-Forwarded-Encrypted: i=1; AHgh+RoAqD1kNTvAX5E30y3zB3xOKamQ6pZQHNF9v0Raf955mNMkGSe0rtqujSd8ejUfGwAh4BjPf81Q9oNpxHxA9pj3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa4k+U+5y7cLGi2MwY331v9Hw0kf22GyT9fwpsqu3u533QAoy2
	V/keBI/4gkDQOr6mdjK1jMeZYOAu4HjuAHy58yEbjY8xan09nlb6pOkL8xwgYTBBYHgUMWPo+2X
	NZvWgJn0USamyv1NQ//J4wY4vv0En9Fk=
X-Gm-Gg: AfdE7clSx68/67sHeXLqEB/J/+YFjYi6VmItogpkt5wHg0Sp5lL+biq7wWAqZcNAmpL
	jc0BfVInY5ap4rmbfD4cT1cmmYVYW2V0wm30L6LhKPtR3QrLmvstqMPQOxxg3HMKMXvFqK15apn
	Du2tFxL34reyrtC8gDj+ypZ84PRbRxZR+M14FsDnl5DfzuKYtdRLYr2GtHX/nlhO3mBhMIYMjmi
	KXKCsa9INg/x1MnLT6ylJxfwiAfLm0fmEjT55tt/74+YQNZdkgDKJXcMrtSGD3cB48WJcY/
X-Received: by 2002:a05:6a20:734f:b0:3c3:6af8:ab24 with SMTP id
 adf61e73a8af0-3c3ad9d5fe8mr19173494637.56.1784624294467; Tue, 21 Jul 2026
 01:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
In-Reply-To: <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Jul 2026 16:58:02 +0800
X-Gm-Features: AUfX_mxyjKglcWDGiHlL7pHojtmA7GYBRqbKLhdnlf4NA0C5KwDC9Zvpc1PZDyM
Message-ID: <CAA+D8ANTBSgzhEQ-fsj9jpKnOBKCQiJeY5pv2-zck0O4DTM04Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_015815_648358_A332F9B1 
X-CRM114-Status: GOOD (  12.92  )
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

On Mon, Jul 20, 2026 at 10:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for pointing this out. There are also some comments from sashiko.dev
I will try to address in the next version.

Best regards
Shengjiu Wang


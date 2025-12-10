Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EEBD3C526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 03:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLoOmL2OINkQVzeV8Rqv6NYJGZqFQ0WjVAMg3gQeW1M=; b=1ekjVstABtdZlsDdEeTU/bpMb+
	oG6Hk59eBzcxFsKX9NI3Z4D+z8daGMJV9y0LQ21M7ONdbje3imO4zcmN0mOm/eBpEzcPlmIFyhuR+
	m7rl9HQ/3TgTR37l1Ga/f7w2XaRXGSlk7jzr+d5KpEB1k1xnFPCexDdgeaJ1QnFipKdHFbLwnBwOI
	KVPfxDQKZWEM9sP5TnIo1lloLaONGziPBuZKBmJlXOxPpFhl9Hi9gz4tLHfB4ATgHDWaU8A2G3w8I
	lFE39mPQqyoRR20S0TdAFUTH5eD2KmLq03255UOrIrde5vJ4Na/SuM4IBBdjQPxMI/6jrdavFkJJg
	GGnvQA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTBLB-0000000F4ma-3oZo;
	Wed, 10 Dec 2025 03:58:13 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTBL8-0000000F4mD-4AMj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 03:58:13 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4f1b1948ffaso2176731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 19:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765339090; x=1765943890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLoOmL2OINkQVzeV8Rqv6NYJGZqFQ0WjVAMg3gQeW1M=;
        b=RbgdNKtfuD6auypu1gD2nfid3HsKcwXkB6BW7Ergj8wRM1LYW2HAwZ8kHvK1T59EzO
         42e5Qex3f+S999f/awq38M7g1dXxLWilkpeOdMfJAl0NWK9QOfmuQGaeSmMpqH50wZqr
         N76nWnrDAhSst1N9dz6j+8AiQqnUAdE/HRk9KPFMTkeBlCyODCfaMibWveopHbw1tloj
         e9q3Wbk7q+lRphFVIzGGdzzC1r0TSubmb51mWSLc2lStLZLXQG0c94y/Az9C51vvt1ck
         dQ4Ez0thfDqzGz7jHRCJ0DzhmFOqpCMUIbzZxe5dcQu3eMFdyxrTQcD/Kf4N1ISeTxWX
         OkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339090; x=1765943890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLoOmL2OINkQVzeV8Rqv6NYJGZqFQ0WjVAMg3gQeW1M=;
        b=dTaWCV+u8aIm1sPb2YptsFNG/ogYDkE6hxUon9iCM3SUsIEOmK0biLO/b0EZPB1IYQ
         SHZseDVJ2bgiNo6DZw4DiU7H4q9e56yqDjkzUE5z14bCJRF8vobZgOTlmvGazbnyYT8o
         Jf5yfzNzZ+v3AJxVlXbtaRsj1aChY2xwgMJS1gBXmFSnJaKMXQvSrEBHWxL1e2h2lK7D
         2cycuBp8ulktTkGRj87kSqyEODPiqZ0LsEcdzMi3LhGllicPgA1olIuItfdX0bKuXe0q
         k7+XmlSaNsHO5iN0ieqsOQyPFXY/gaFGQWusiJ8x5aYG+AYiVLm3XVcXi8rKXQSxmJF1
         3Nmg==
X-Forwarded-Encrypted: i=1; AJvYcCWFW8P5Q9zUCCPdtiHiSKryTmUJSZm4o8nE3wq3q2vflz3m9Vq+MrDOPjytx9OueW/O/MVdUJMZXXKMeoN8nH5r@lists.infradead.org
X-Gm-Message-State: AOJu0YwcSq4SF4pZ7/HE+F+gw5mUIy4Ze0+UiOc2NCaL/WX8+kSNjcsI
	UdhzBJdGRwMytJNI353QXUWQVnYDJ9tAQk79FtXQ8/kOnm9NmEAuBLX30bB64UR+ueXrQ+aY9lF
	pH82B5LBtSbBhWmEhybd7o9sVSsq7K/I=
X-Gm-Gg: ASbGnctJQY2lWuX1/rxh+427dpt6D1ixFn+e+hCwz0JHl7wOIVaKtYPDugcSh4Zhy8p
	ZTMEZy18W/WN5O+zWVkpMit47PL6dngHFMA4LJV9uBEU57Zaq1Ou5YAk3bQRgOdl6Wp7W7uo14j
	f7gcshvWwC62yyNZ5OftJbLE5lU4BLosc1kwk3MnUdE5TvnB4gccQ/vt/xkMUBWMPpfEsWln95D
	TjLnl4yKXRzZoe5Z6y5ml4b91lAdwrbKJBLT7wmfEDpVJBZBg/IwTUllXp+1gTUz881pR43G+dZ
	07CLJLOOoGaF248N4+cphvZQJdBkr/ohR6jm8s/735Cg/LeSYv3gSyDwFLjBzH9Ei7bMQ6DKtpL
	VJ3G4J5vqFjmrcfGDdB63XZEBAeVYbMBpwmE=
X-Google-Smtp-Source: AGHT+IFGSPpDaGsF7GV6bSeqZjzx0wih4VR146dqGL5dRtKu2H9I9xlLneXMcdOPKYcfgnDqQlmhKeVlt3Ia1lJlppw=
X-Received: by 2002:a05:622a:5d3:b0:4ee:1dd0:5a40 with SMTP id
 d75a77b69052e-4f1b1aae5b4mr12728361cf.59.1765339089481; Tue, 09 Dec 2025
 19:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com> <aTjZc3mgu7CQOkDU@sirena.co.uk>
In-Reply-To: <aTjZc3mgu7CQOkDU@sirena.co.uk>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 10 Dec 2025 13:57:50 +1000
X-Gm-Features: AQt7F2peQnceaEJraJhL4gaHZEV1D4IiSKkpSo2-8pS48v4HYxCHrY9kKA6UQpE
Message-ID: <CAHgNfTxmYxNaYOdGK4Eb4ouCqmUCjVuhzGdgTAL=+ybObqrCmw@mail.gmail.com>
Subject: Re: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_195811_044932_720506D7 
X-CRM114-Status: GOOD (  23.71  )
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

Hi Mark,

On Wed, Dec 10, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Dec 09, 2025 at 07:31:17PM +1000, James Calligeros wrote:
>
> > Imagine for example two codecs sharing a bus. When one codec is
> > transmitting, the other must ensure that it is holding its side
> > to 0, or data from the transmitting codec will be corrupted. We
> > can trust the "idle" codec to simply do this itself, however
> > this is undefined behaviour. Some devices may leave the line
> > floating, others still may pull the line high. We need a way to
> > control this behaviour.
>
> I'm finding this explanation quite confusing - you appear to be
> describing the situation where two devices simultaneously drive the same
> signal which would be extremely unusual and I can't see how it would
> work electrically.

We are trying to solve a few of problems here, and one of them is
a bit odd. I've probably jumbled up a bunch of different things here.

We have the use case where a codec enjoys exclusive use of a bus. For
these, the codec can transmit 0 on any unused slots to hold the bus.

We also have the case where multiple codecs share a single bus. One
codec can weakly pull the bus low when it's not being actively driven by
any of the attached codecs.

However, a number of machines split six codecs into groups of three
across two electrical lines and then OR them at the receiving
port such that they appear on a single bus at the SoC. Because the two
data lines are ORed at the receiver, we have to guarantee that line B is
zero while line A is active, and vice versa. To do this, we set a single co=
dec
from each group to zero-fill during the active slots of the other group.

> > Thus, we define five possible bus-keeping modes that a device can
> > be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
> > (actively transmit a 0), PULLDOWN, and HIZ (floating).
>
> What is "explicitly disabled" in ths context?  Why aren't pull up or
> drive high options?

The OFF state was added so that consumers can explicitly disable
any and all bus keeping if necessary and supported by the component.
TAS2764 and 2770 both initialise with some bus keeping features enabled,
hence for this hardware NONE !=3D OFF. I suspect this is the case for other
hardware too.

I neglected to add pull up and drive high simply because none of the
initially implemented hardware uses either. I can them for completeness's
sake, however.

Regards,
James


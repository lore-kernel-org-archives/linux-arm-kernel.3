Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BEDD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLZGxZfGPH+m9Hz1QW1ANR0vUG8mNwWWC1iVjfNrwBw=; b=oe7SGg+divi6mN466CEFRQdCLo
	lnryYMkaIvOSz+V8oZWcpx24PT+xkiIGD/YE2G/P80WqaDHZ8LG8twePhB6wxN8EeEhvpMrf06kvc
	J++P/wrvIyadwVygEKOJYX97/Arg5HO0a2E7vyFQP45AYpERcOMO7LQpIN7WS/cV2JXNyqViAZL6u
	2Ic4HAyHyPTPy4gdalmIw1wPvHNiJSWLQPwLj6EPnNiYfEkX1WOr4rHDEoSnHGC+mzMh5LlSZdqTg
	ZfW/CwqrwrIv7DdTRFwxqBenV0yvBhBOtZAIxL5/eESa72IToQ59dZ50GHlz1un1+JcWfpBTWycD8
	mKaU6pcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy4a-0000000EL46-1erR;
	Tue, 09 Dec 2025 13:48:12 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy4X-0000000EL37-0Ywi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:48:11 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-78a6c7ac3caso53911947b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 05:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765288087; x=1765892887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLZGxZfGPH+m9Hz1QW1ANR0vUG8mNwWWC1iVjfNrwBw=;
        b=bDPB/Qmghsk5o8Ft2dHw0Nj6AqBUDH0sfYuCEJPWRNPOmWTATeXewWqsJG646HD1+N
         rp1h7vv5/QynuNypWVYUsArcMfW1EXcJ6KqPD/noUYTeIRxXlAaVb0ITgeUzEgniAqJv
         V6rAkFWEHDlBQF52MFfcAzXLbCdszHseD5z7JQk0GwV6QLyz5O0bR1tl3b+9RWONYrRA
         gfu13AaXi/lgIGhOBhuDtLXLwHmPRCedta0pYgFPmFILbZBStK55zhLyIfcdqezRDF5W
         9xAfiuuuQmlfb35flP5RYTgADip7NuHUhuAT44yiTkfN2W5EjwZSTaHKZlr9KAbyiIqb
         y7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288087; x=1765892887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PLZGxZfGPH+m9Hz1QW1ANR0vUG8mNwWWC1iVjfNrwBw=;
        b=OUruzPvip2bqbLt0f7DXV796S4f5+MCjD2HUEj8YqYXzNDDUkKiB3NvG4senrIFv8Q
         MH3GOo7/Z4Vb89CPf3EZxZbOqlZ5b+DLZXpGnwSDKHxnAAw+kb+yH0S2wC3wpOMkPv4m
         dL5MPRjJ/tJFlGqZXZMQ8nX6IJXNiIf8lHVbMtbL0AkcxZDTFi/3D59J/8ms+v5qsr6h
         Z8ZaHyn97ND3UcHd6YpFMn0Yev6cyTIIeBjL1f9WnJhFDNYA0t0BfWesqJBUu6+2CrVa
         FNDSLboVnSmvGjXBUIVyVK1MFNuPkdSgO82IRwXRymN23qxykDRZc2tbBIbopYK5VP6Y
         eUjA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Wurzim98HIah3KQVitRQP3qa1MLRXBQwei8JNTwSQeHl60hGAYR9lAMm3uFQJliyDzM9I2bSfzwdXRIcoRXp@lists.infradead.org
X-Gm-Message-State: AOJu0YzJkQQ6G0XUQ1QLpLJCVYbKI4PH7k+FtIDJV8tY5Eshi7+b3Jay
	kSel8tgewfwQXFUll1F9dfl+NDRhUBZSOxJriCBxQZCalgdJMo5d0vGsO2qWNUOBSGKkvrfTGQ4
	lnnZvtWPViMK6qKbAXKogW8kjrID39jRgTdOXWeBpKJxUGQVCyMGI
X-Gm-Gg: AY/fxX57FjGgeIK9468LhLVXzP3RZsYxPeQz9NTNfSr9tMc4xTQKE7SbBKXLbg7nbMg
	DarSKvZLLls2JP8htNmQfS3LMHFscsAfuxjer+hAYd7Z2tArW/aKEZKqfHx8ohqFPZrLgB48Y/W
	b7Xq+ZPj0VCohA+cAD/eHrzUc4Mi2qMTTcyB44nHeibvqe9cO7g9ERMmN9GtQpxDqBisr8eUPA0
	HfwCIwMFG5aAE6LdU7Muoid/PBUQgVxRpaZoF6wvMPUlWnHOJfCupImUoJOWNRvIHR43BVZ
X-Google-Smtp-Source: AGHT+IEhUYw77OAuRxBe3uwIoYgLrjRR2ua77WK+8dBaIDSS/4dMnfDxmkWH5Vf8ObUVvDYmN/ivRcBPoD/iRYvRkdY=
X-Received: by 2002:a05:690c:6307:b0:786:4fd5:e5cb with SMTP id
 00721157ae682-78c33c019bbmr104464077b3.35.1765288087582; Tue, 09 Dec 2025
 05:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20251205071729.83857-1-ziniu.wang_1@nxp.com> <DU0PR04MB94962D103B1A92354CDD1FE690A7A@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94962D103B1A92354CDD1FE690A7A@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Dec 2025 14:47:30 +0100
X-Gm-Features: AQt7F2oaS3uBiOmr3kjDFYVzcu04ROd5j3j8IYFRAzYsQq--q0dUbLCTRNsuSTc
Message-ID: <CAPDyKFpYU3PZs-dSREyGyyyoptY0zCQmHP+mxMMgvYQL-xXQZA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-esdhc-imx: wait for data transfer
 completion before reset
To: Bough Chen <haibo.chen@nxp.com>, Luke Wang <ziniu.wang_1@nxp.com>
Cc: "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, dl-S32 <S32@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_054809_186072_3073EEE2 
X-CRM114-Status: GOOD (  29.70  )
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

On Fri, 5 Dec 2025 at 09:12, Bough Chen <haibo.chen@nxp.com> wrote:
>
> > -----Original Message-----
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> > Sent: 2025=E5=B9=B412=E6=9C=885=E6=97=A5 15:17
> > To: adrian.hunter@intel.com; Bough Chen <haibo.chen@nxp.com>;
> > ulf.hansson@linaro.org
> > Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-mmc@vger.kernel.org; imx@lists.linux.dev; dl-=
S32
> > <S32@nxp.com>; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Subject: [PATCH v2] mmc: sdhci-esdhc-imx: wait for data transfer comple=
tion
> > before reset
> >
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> >
> > On IMX7ULP platforms, certain SD cards (e.g. Kingston Canvas Go! Plus) =
cause
> > system hangs and reboots during manual tuning. These cards exhibit larg=
e gaps
> > (~16us) between tuning command response and data transmission.
> > When cmd CRC errors occur during tuning, the code assumes data errors e=
ven
> > tuning data hasn't been fully received and then reset host data circuit=
.
> >
> > Per IMX7ULP reference manual, reset operations (RESET_DATA/ALL) need to
> > make sure no active data transfers. Previously, resetting while data wa=
s in-flight
> > would clear data circuit, including ADMA/SDMA address, causing data to =
be
> > transmitted to incorrect memory address. This patch adds polling for da=
ta
> > transfer completion before executing resets.
> >
> > Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> > ---
> > v2: amend commit message
> > ---
> >  drivers/mmc/host/sdhci-esdhc-imx.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
> > b/drivers/mmc/host/sdhci-esdhc-imx.c
> > index a7a5df673b0f..affde1936510 100644
> > --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> > +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> > @@ -1453,6 +1453,21 @@ static void esdhc_set_uhs_signaling(struct
> > sdhci_host *host, unsigned timing)
> >
> >  static void esdhc_reset(struct sdhci_host *host, u8 mask)  {
> > +     u32 present_state;
> > +     int ret;
> > +
> > +     /*
> > +      * For data or full reset, ensure any active data transfer comple=
tes
> > +      * before resetting to avoid system hang.
> > +      */
> > +     if (mask & (SDHCI_RESET_DATA | SDHCI_RESET_ALL)) {
> > +             ret =3D readl_poll_timeout_atomic(host->ioaddr + ESDHC_PR=
SSTAT,
> > present_state,
>
> I'm okay with the patch, but I find one thing here:
>
> I notice you use _atomic here, I guess you want to cover the case when th=
e reset function is called in hardware irq handler sdhci_irq().
> I'm not sure whether it is suitable to add delay in hardware iqr handler,=
 I find there is also udelay in sdhci_reset(), sdhci_reset can also be call=
ed in hardware irq handler when there is cmd_crc/data_crc error.
> Adrian/Ulf, do you notice this issue before? Any comments?

You are right. In general it's certainly not preferred to poll/delay
in an atomic context. But if I understand correctly here, polling in
atomic context should not happen that frequently, right?

Moreover, I wonder if we really need to have a polling-timeout of
100ms? Where did that value come from?

In any case, please add a define to specify the timeout and make sure
the define-name has the suffix corresponding to the unit (_US,
_MS,...)

>
> Regards
> Haibo Chen
>
>
> > +                                             !(present_state & SDHCI_D=
ATA_INHIBIT), 2,
> > 100000);
> > +             if (ret =3D=3D -ETIMEDOUT)
> > +                     dev_warn(mmc_dev(host->mmc),
> > +                              "timeout waiting for data transfer compl=
etion\n");
> > +     }
> > +
> >       sdhci_and_cqhci_reset(host, mask);
> >
> >       sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
> > --
> > 2.34.1
>

Kind regards
Uffe


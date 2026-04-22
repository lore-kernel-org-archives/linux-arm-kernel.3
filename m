Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AF0F9B607
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wq8+U2WZxewGPTZ86+kP7pb8whJIc4RPuZ9dCPJUDAo=; b=gt+p4YPoPUQCJeR6Ziu2evz6hn
	uD5cd4MlpickIh/p2AB5IgZd20nYPpZ793ykp2yifORGgbehj5KnfKuIikj3jYt28zgAw7BDUYe9e
	cczqKEBRY07OwltsbPD/rUOcFIy+eDv2BOW7174xS68H7uZJbxFRlLve2Sl0OzdUrnv0kCZhdtKa+
	MAeXNvDPD4vsPAWiZPU0wOFnN9xdWRy3f/+z5jaJwndhhBggmUUsixQDi7pUsuHIK8WwKeS21Nq6h
	iNsUQEMMDOfRdU6vsiyygIZ9mDuz9AwViV6MRUdT8EmO4Toekun2dsGHnhylrZ8VVR58udVhZIc31
	BcF8zDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUmK-00000009wjJ-0QNT;
	Wed, 22 Apr 2026 10:25:56 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUmH-00000009wit-2OUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:25:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a4113ab355so5533915e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 03:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776853551; cv=none;
        d=google.com; s=arc-20240605;
        b=LoxEFcEBvVASQm9uUuJh+44BefCgxnwOaCYxGbDyTCCZdUnQS2zhx6lokaFh0Rocxc
         kvxLnR3lCt9a7ur9MzafPNJ3O4t3hEyWyTdwMtq2LjgtohU6gIo1igOTvKPSOzsvOH8P
         30MGJDQU4XRqIfXrDJ7WMf6jPedtINTYAyZdFM7G0bTsgvmaNfD+Mricof+FSrVqCgbQ
         cEVri5561e/DVObNZVqPCm0Emgy+tc+rmed1lQT9qcVlejQKSL1cRUEdnSUUKZ3BLXjR
         IZKyBCp8O9UVKAeu/TUFIbIK3vXvDnRhzoXn9SLPROAbehwOw2OENGKp+BBHcWV57pdj
         Br/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wq8+U2WZxewGPTZ86+kP7pb8whJIc4RPuZ9dCPJUDAo=;
        fh=vg+ujJ1PF3sHZ8vf9XUkD2YEtJCmWnuOfoJDvESyiRc=;
        b=iYLqOsHd9ZaOzJUUBI6eGdFYfgljiSqa0edGJSD44z2aSMIkj2pKkYO8rVOQua+I7I
         tXWZX2o8556i59PrnhtQyLlJcBUcV/ul8AHQ5km4TH7VPS31cclBaKH3f8gTeQrGSXjK
         KZE8FfDWt0ibCCUxS0bcTyUaZ40z/2tbENlPri7ahRBNIgUGib6mGJ+xglYEMQl78yuM
         hOpd92UTeuf+TYuYIc2W4hrOj41vCKLRTo9oL/TnaRDP7KQDm5FHBSQdHnF91rVx3TLz
         G77i3stGoAJG1bvkuDLifQ8LDmZdFRa9NvV8YDbI7oACjXwmxIMISYPb0Pen0Gq6BU7R
         HfTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776853551; x=1777458351; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq8+U2WZxewGPTZ86+kP7pb8whJIc4RPuZ9dCPJUDAo=;
        b=FWr6VORE7Dl9u4Sn7jk57prhO8OVrFsneG/JzSHQuPSP7oBMjjoMBtga7jbZrUvQ8D
         AumhUwb5XZ/We6diu3ciHbWUcMc0QXxq8KYuE8Q8hAnCSmCw/hvvyHpt3CeCpPj/4wtx
         abhpEBnGnRfCLKpu+1Gv1GlcEmfuMNnjLY4QLPVd63pGHYbl1NFuOVmgkiAHxqUlMnHE
         3i30yTUIqbpsP4IGud8E6MnTYUYy9SOk2j+plhOHv9qL9R+avgn00HPIxbs+DP3iWrfC
         W5qgsvCRpoSJoHI7Wck/D9mZMjawl9dwRKv4Nmxe++QBDGtUKl3kx4sMWMlsnsnxDw37
         l+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853551; x=1777458351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wq8+U2WZxewGPTZ86+kP7pb8whJIc4RPuZ9dCPJUDAo=;
        b=dpuRsow6er9P/0H0NgG+XaSa/8BWCnEJaKOK4W7zS66Gc9Lks2kjn+Fn3ad/ghk7tE
         BSGJCOBgGqL3uubVI/0z0A78RhuqHjgfIjbOvYXxh4iDp2s2e+BU7aFOi60R9LZEHN2/
         2MEH0TnxiQgdrKdrvbNq16OEgm9nZvEytXMdUkUyGc5XTwnmtPPcvM/IntPL5Pobwbho
         oMPFg+NuKNc/xtHpm5Mos4Ir9VNKvRDUVZ249frbFVosKBGRpgmaNp6RLoO2l3qgI1wb
         b6kno7ar4jbQOLtEvLhI0H0bKb28/nlImaXM0/vLJSqSecalphheHo+GAMBJ3SpqsifI
         Q3kg==
X-Forwarded-Encrypted: i=1; AFNElJ9XICXCOavEo8YkfoOKQqrGlxcsGVE/oBFx0gIsxzTUZuzEW741HiGPNNGqjYH8D0lszmARVRB6Qqthx/9sthHY@lists.infradead.org
X-Gm-Message-State: AOJu0YzsrEGfIJjnekj9srfe9E+4Oe/BU0I8ZrBGQ8UwC9B4e9+AqCOQ
	rCUqnZF2w1KD2JLyK9NGAAHHEgGaoX7gqAygSg5ZJ0NhR8jXhh747r9XLJrJXQsHkXMj0hBm2Ky
	sSDDoJYR4GB4CRCDsWAksTvP25uDzegdZ7TpDlhZe/A==
X-Gm-Gg: AeBDiesExyw/uKbqlWeNMSIg43a3FXBKK35kdB0SlW1XXMppz5MmLTgPeYn+A1ipMi2
	lpXBd+ezsdryvduv/E4BwvPNINeR1TzSIIYnLAX7FsL+HhHkwUmrR3vz2/+gFeEkUW8zlGBBmXS
	yLKKEr+lnFFEcnf0j8DNWEDrNUoWsuKevX+kMaypNvb73DFy8xPtHFxpTwvAlepj9aTuJf8XKXj
	t0WLXJpaEUa7YKklQzzpzu9veT5H95gySf4Sinshd4Zi7tLSTRswfjXuxduDcU6FpLMq6QWtfXr
	7BXX1wgU6dDKyndsjfg=
X-Received: by 2002:a05:6512:1094:b0:5a3:ff6c:9df1 with SMTP id
 2adb3069b0e04-5a4172e7f69mr7060238e87.39.1776853551219; Wed, 22 Apr 2026
 03:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-3-ulf.hansson@linaro.org> <DHW8QV8K3CM1.307C6PW2BM5RN@kernel.org>
In-Reply-To: <DHW8QV8K3CM1.307C6PW2BM5RN@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Apr 2026 12:25:15 +0200
X-Gm-Features: AQROBzCHhHSXfjVj8apklmTonwOpiVF9jPJJQpHw-yRBihJtcF-VZQ649rGH3jg
Message-ID: <CAPDyKFpeSv+fg=YKJE_qc=Q5BfiJFn0tR7Ar8SncqrD0UW1P1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] driver core: Add dev_set_drv_queue_sync_state()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_032553_632857_46865765 
X-CRM114-Status: GOOD (  13.44  )
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

On Sat, 18 Apr 2026 at 13:24, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index e65d564f01cd..f812e70bdf22 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -994,6 +994,18 @@ static inline int dev_set_drv_sync_state(struct device *dev,
> >       return 0;
> >  }
> >
> > +static inline int dev_set_drv_queue_sync_state(struct device *dev,
> > +                                            void (*fn)(struct device *dev))
>
> As this is a public function, please add some documentation.

Most of the static inline functions in device.h lacks documentation.
Are you suggesting that we should move towards documenting all of
them?

In this case, dev_set_drv_sync_state() also lacks documentation and to
me, it doesn't make sense to add documentation only for
dev_set_drv_queue_sync_state(). Do you want me to add it for both?

[...]

Kind regards
Uffe


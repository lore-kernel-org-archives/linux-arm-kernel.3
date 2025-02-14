Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=; b=WhuodHRlBVdiAHxl5R7oWyJE9i
	wvyWB+I4X5N4Fh6eEzvHoSam9msD8aAH+IsnwUP0MdmwCfZtdgvvhv0+n3IL3gtOyTxR2r/nD4UjP
	Bwv3Iln/4J2pU8OPXO9QXi5YSejAjs1jWkm/9SEf4mEThPnnLiqZO6LM2+M1a4Fc7AMzK4ywhHnNU
	48eCfYrxwxI5ee+poLKSvE4YTbLZ3deDcBYmNBj8n/9SHuXHNMb5bchKHda+taJLUpeuYxIbeMDyS
	TUtg0dxRrCdt6ZcOXo+0GvWNsqkhZsrGFS8Yh4liZHWba9Vvjj73eKnPp6G88AyGwKyg9gU7t7QJJ
	0f+OHvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixqj-0000000FNEY-1win;
	Fri, 14 Feb 2025 15:43:29 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixh4-0000000FL7I-1Law
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:33:31 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-309191eec90so12327821fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739547208; x=1740152008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=WNvX/AUfw51sD4KJHMXsIiIe1lRHl+1HrsDJt2yggnnk1tCOdmS0HD88SEK6VdcN0I
         jv5oi/qNLE6dBMW0Uo2rk+PUz9SW7tfpwusE6tDUwSti8lIQMLVjguNZm0rS7ZWfEQfr
         CnuhYcWFrbIe4jMjIsICR0bqLYKuapgu6xnfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547208; x=1740152008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=fJWOGS49lnhtBnrl1uIbapOLH/ylcpU2SU55VbgfjcG7nOZt5c/1ENcn5VSDvXUzNr
         4tyLPChfGqHcIYX6FwqYSrv48xNwv2EnFBWOBBRcQxfH2mIwGPjNKz3lAbb9UzrzjUwE
         K+gGsNt3uASIS9R97fHq+y20VfID82e6sEjbIvidyixnyGhW3hhKLpllznqsCWSvGPa+
         lIuqY8JxOCyKM44mLaVm0jqt1U9nQeE4VQzXQew2oxIr4LXL1hgsQczKPEt4JwsPFooL
         U2J+V+nBMrTvU5Jp1ZqFnAGHTVC4TYwKm5pjHsT7BjpLYRKKWPaikFULA/iXlUlxWb3t
         0lhA==
X-Forwarded-Encrypted: i=1; AJvYcCWvSk3QxyCpSYab7JGbrqxoqLbIA/mzUtAuSaJfBui5z3PwQFWDtjY5mCb10/QDZrQmxyho3Ymuz5DlJZ0Zpft4@lists.infradead.org
X-Gm-Message-State: AOJu0YyQOoBzer1rlA6ZccMRgkU5eo81+9J/IAJoCgKFBZbMEM6jQnwN
	ZsjK4jPAb2H6FWr6n+bLK0ZKd74Q0oijZCr6yRFptERJpkHlwoofLpjzql4zR32dLlLm61g1HRH
	1dw==
X-Gm-Gg: ASbGncsgil9q6AzqlU55q1TxrD1MxrB6rcocnfJKtTxn8oo4bFPa2WO0KXyE+NsRkIe
	CNGTHYCAQpRORwFN2m08fzs+pYAq4+1Vq4GKZ+yOoZRT3BgZpOCuCai/Lgr6i9aow0ZEvL3yw+V
	TCTsTFeBS7WawCOWVKwzFEKUhwpfekfJ8YOCLZPKEj2oZizmPiM5MrnNOfowLXXm4xyKRYLgp72
	pkS1OpklUmZC+lhdRkO2gAznIcB64LR8+y3fp/xVwh3Ukg+nWKUI95AjOaW7NYayUjif1kFbTOo
	bJ4hqhvGTTvYui6ir071eS8sCtWi09hZi0/5Eh4zhXKEBjgeivFBKGQ=
X-Google-Smtp-Source: AGHT+IG2H7aQ1ojr9xHCJ6ZESeE51bv6CugUJpUM8sTC3L631A3kVmVy/sTduIGt+Uz1RFnc3gXdgQ==
X-Received: by 2002:a2e:9a04:0:b0:302:1b18:2bfe with SMTP id 38308e7fff4ca-3090ddc035emr34483161fa.25.1739547208164;
        Fri, 14 Feb 2025 07:33:28 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091d7e4fb9sm3304721fa.17.2025.02.14.07.33.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 07:33:28 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so292356e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUq7XdDN9G5vxdSNIxwv7kMGh98TUN2KEb4GpmhjmutE0CKCPbcf/lgvqvzGFXRoesbVX7ANgRcVRCzLIr7dqf4@lists.infradead.org
X-Received: by 2002:a2e:8a97:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30914801891mr14311001fa.0.1739546770563; Fri, 14 Feb 2025
 07:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud> <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 07:25:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5Dl35ky148QOOCnARP_86rg2vhIKgVTUOs7s9KbdYhXOWWeRWr_r9yF0
Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_073330_357860_913198DF 
X-CRM114-Status: GOOD (  18.42  )
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

Hi,

On Fri, Feb 14, 2025 at 12:59=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> > One think that's always felt a bit meh to me is this id number stuff,
> > I just threw in 666 for meme value.
>
> :)
>
> > The whole thing seems super
> > arbitrary, do any of the users of this helper actually put meaningful
> > values into the id parameter?
>
> In example changes I've sent, no.
>
> In other simple usages (those using container_of()) of the auxiliary
> bus, I think there are a few that uses 0 and 1 for 2 instances.
>
> I guess your question is "do we really need this parameter here ?"
>
> We could remove it and still address 90% of the original target.
>
> Keeping it leaves the door open in case the figure above does not hold
> and it is pretty cheap to do. It could also enable drivers requiring an
> IDA to use the helper, possibly.

FWIW, once you resolve the conflicts in drm-misc with ti-sn65dsi86
you'll need the ID value. ;-)

There was a big-ol' discussion here:

https://lore.kernel.org/r/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.17291804=
70.git.geert+renesas@glider.be

I eventually pushed v2 of the patch:

https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.17338400=
89.git.geert+renesas@glider.be


-Doug


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD1EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=; b=ZAMeHWCONrKJCta7gJ2rLqq66Y
	LRp0KV9UipFLZ0165mNMMcQl1OnMC4BDx+r3Y2G1CclC5FrXZKsVhbWtZz+NdsiYyivzExWcVBlRD
	G1bHKjrk8gaLHvJhL7DpjTO0+0XgdOcMOR9usxHqWsPEAvkxXaHc74i8iGVW7487Sy/9MV+BT1VYZ
	T4jE0TAnFUzU6ToGqESSIzu9BsGbguV3GGNre8E5dd7ZyWnCbmSwIqwkW1rJBz2UnNMX3ISm66JDD
	uq1EOSjgX3NblbE2Jg08gB/wih/lxzt7Sg9hJjqMqICjFQGnbF+lTIjKgJ79LTiwMnWTuaGqtRTXc
	QhQTEqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJyP-00000004ThP-1QLP;
	Wed, 26 Feb 2025 16:09:25 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJw3-00000004TBH-29Ci
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:07:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abec8c122e4so418765866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740586018; x=1741190818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
        b=HyNRg3R4p4/9dMJSZNCo3TV+uXxKQ80eJGBtnYcnhU0kGNj+k29YPzFaTvu6Jw1qjq
         QeU51cA/HJxoYetr3lHpV3uPVCRQsOIITTzTdRvuVukA7Cmx3+/Fe056yOhQsCv83PMe
         7wNvCt9EaNNruQrHUhKN/f0WbAVJDFd34yufkSe20AerAYt9+BNAYS5Sk9rmkKaQtku+
         XOCEBXvvbwwZgWDHDigfS1tdTStzUsUeOfISjBrLgnkYz7aROIkt6PccZxGJKdh1/QRx
         2bwvNYMwXzsHhkqC0L5CUiYQErWPG3TSsiHWucFv+Oc6SLj6InhQghmeOgysH5MM8Exq
         8mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586018; x=1741190818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVuX0bpHYTirziy6vX1FkmZQ6Idw9gPtVc4HEBMx30Y=;
        b=C62pkYVOgYWwk5vxsFWnn1HxWC5H9lTITN4kM0855NVHGhp8hK5D0WilQW53GteFSk
         KwdWRp+/zUtkCLo+sknw3Ar9r5TxWXhqknkTASuYl6ZqkEfMNmE+dLGyUSEINoO7o2dh
         bCCUUn7y1TXbsf92IdWut9jRwn6Bc36qOVU4li1oeFs0YS/oou+HQ4SzpCJaGPnZmVbc
         r2PvEA2WFsKXgJ7Z+seS408xAhceekcbZ18xPaMlDz02OkEQ+kX/J5odXPk5VrMkayp7
         1clwC114npcIyH6BJNGpsXSfgKprndcHQtDj8uQYoyOLq6Gr/cZUeCdtOfVKSK5O8/qE
         u5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgQBY2G8cspcICvsd88ovD35hSLsn2dzEI8JXMJrQH/9IajMDxSjxYhtu9INJwvdkOcbVYoKf1nP0aHYmj65R8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr8YjQxv+51cJ2mp/Qri927F7yTYP/B0OToL+Zlfz8EyhW1G3E
	/wQsVlYOC01Q3B6bXEzp4TLSPF0c1pTk/xv+agwPMoYUq2Q/z0z1
X-Gm-Gg: ASbGnctYGre6M4z7iXMNMtFLVeqilIhslREwJjOFGKcv3FXLHuBD2UJNC8chlocdZvn
	KukpwYiF4wCDcAx8vu6ittVX7KJ8GRjmM9KZ990lnsFHu8bcOgxEjamHNDGGBY/AJodppDqbTjD
	N4c/vGEzIr/zuHsBT0v1i9uncwMSpeMtbylGwJyD9G4Vnxp2y24rvD0BpTFdZD8dfPKHZVbDjaB
	qqn9h4NCXZbvG6p2D2ArUbBY4ciTc10DyBUTmU4IDVbY90I9EWW3wPr+UyGmMZwMc4vYNsWJh6V
	qdqcP0VgfsR0psBkE0wwJicOsVjLE2re7Mhjvpnw1W9NU/BSRZ9QCY2EnXtTrpbzAWnA8lLpaee
	GjQ==
X-Google-Smtp-Source: AGHT+IHKSaBNAQxae8uGh3BHw0DdJPoRYYOePYjoHC8k2jlh5nxTseGqTp5afK3YJqsDzF/GYBcwww==
X-Received: by 2002:a17:907:7d8c:b0:ab7:d87f:665a with SMTP id a640c23a62f3a-abeeef36285mr435058266b.46.1740586017406;
        Wed, 26 Feb 2025 08:06:57 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abef7132491sm123062766b.166.2025.02.26.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:06:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
Date: Wed, 26 Feb 2025 17:06:55 +0100
Message-ID: <8494506.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20250226103734.1252013-3-andre.przywara@arm.com>
References: <20250226103734.1252013-1-andre.przywara@arm.com>
 <20250226103734.1252013-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_080659_546777_DF703E29 
X-CRM114-Status: GOOD (  11.18  )
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

Dne sreda, 26. februar 2025 ob 11:37:34 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The D1/R528/T113 SoCs have a hidden divider of 2 in the MMC mod clocks,
> just as other recent SoCs. So far we did not describe that, which led
> to the resulting MMC clock rate to be only half of its intended value.
>=20
> Use a macro that allows to describe a fixed post-divider, to compensate
> for that divisor.
>=20
> This brings the MMC performance on those SoCs to its expected level,
> so about 23 MB/s for SD cards, instead of the 11 MB/s measured so far.
>=20
> Fixes: 35b97bb94111 ("clk: sunxi-ng: Add support for the D1 SoC clocks")
> Reported-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej





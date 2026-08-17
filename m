Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEBEC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJxT22zdZziRjbZwbed7OeV6jhdxmd27WO3H1gy/w60=; b=JmhNCSV+QpsOJhRaLXGZxQBt1A
	hYJF4EFASWWE8BbKlEwUUX0WOJ0K/ttgidTTmJYsxY+makOx2LF0X1McvTrrGy4lVmxRyqqT0FvgK
	KiCL9srJz8NDQoiyDAfQ/VTFkwgVfXov7oO8vIp1D7ETHzd7pWp0MCL6QD0rWUnClmSML6SjeZ1DZ
	NW+DjFDie5/HTsqYd1Ruj3dsbCPHR7oMdalQokg9KqgM1qpRUxX2DrmDGZgtA50DL7LCx6ymfeIVc
	bX6/HAYtM2ie4yvW+76avtKDNH2+NvWK9fz+t/DJBgyxx6rEUAGOAE7+C4vX0K765IJfo6DSp12LM
	FxveX7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtsN-00000005pr4-0th0;
	Mon, 17 Aug 2026 09:43:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtsK-00000005pqC-3nEJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:43:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f502ff678so376806f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786959803; x=1787564603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJxT22zdZziRjbZwbed7OeV6jhdxmd27WO3H1gy/w60=;
        b=dfyotExjc/ttGbgLxTKZMcX0pGCmSHuVsTm4+UvB5muGDjty59izHQ+V7V0Mh1r0e4
         Z2PyaRlObXPt4X3BA9Aj5EtBm6hhk5eqCTvhtWnX5Xj6Dk9ltrU0gErUtgZoPiNPTNjZ
         Lk2dFpbmFa2x8C0i4TOko1kW05Yun3YWlAIDHDVyf6kc89zDM+PK3YANi5f6p+qrI9dW
         uSf7ZKcnEX3T0h8rV4E/TS2pmRVuu/tTCgiY+DWZFCyp/yNxUzvn3gg49UfPzl3kBCGD
         4oefAtWGE2hRQoEFptlIIjjePqt6mXR+piiwaR4GABXXMQVX2Otxl3N6GeWGVJBi5cOa
         ZhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959803; x=1787564603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJxT22zdZziRjbZwbed7OeV6jhdxmd27WO3H1gy/w60=;
        b=oMY1fS1sv1eNf42Ktv5DYrpJRje5kbaKtJ0Cgr2u7lRYq5BqgX+idpBjs/rD8Hftvf
         49jM4A586GVjBaODS0Wb+LGD+nW7fiv9TbEyn2sKbywd+S6TpLmIJk57BxIfIhqJrjBW
         wgcHtUIb763gMydWVeDqUnKwnKa/BPrff6KsQag2wpLUx0tHwj34r9XrULF810tvj6+P
         SlP67kGCDtxEvxBGkY0vws5F4EgMp0DF6vXVwRZcs9kH0FnvB2XCFMbT7A1b3wGGgzcX
         n9pcIGf32rtX/yYr0ICHHKCTTJ6Yrpi2QLaRAvoNV/F8/ALxTUR/WJ/CWrlQHUfNOD0B
         u7MA==
X-Forwarded-Encrypted: i=1; AHgh+RrmY6Tk6sATxE9bS7Il8uxRzPazYKZdG0toB0yijrqZl9HZQfxCE2/FXT1UmjiaPTfuJn1QWWh0Q0nxfeizgj+y@lists.infradead.org
X-Gm-Message-State: AOJu0YzsY4TJh+sebbkZQWppRGPNEietF/pMAuyxQPwlIhFzcciVk6lg
	r2S+wGHJUeXeOIWzKgvy5/ShrJ/5xetHJ9AAWfAwIVS4wa7bRBpLJlL/
X-Gm-Gg: AR+sD13Kg6L1tUWaG3O2K+lrGD+HHn0SlikFH8qaEi4LzE5TRxm96rLKXImDApVOiIW
	J0LpivmvHbA/y8YdeI4028WZLXBZUt0yxO7rW0NpUFtDIf6s4cVcIBciMmgkEpzA890wsHiXiEu
	a3dE5puUkFOk7pt5pLdquMKQsSgHPep/yLEUvjRMSqbnMfFpuKAVRK9sO0rXziyKvG72K2gDMQG
	OeUgh2e+BiUJ/S+yV/6Kj9tCtzRpOfB7wzZnt8JVsBZfu/+yUOpa84uFGfJeDyObEGQMjEfBC6j
	+rcvo/IaxqPWJhbmCbOVTqitQ1K82UFtIKkDGHoX1OjPCvL8gPLhqDRXltQsmG+v+shf5twyMYw
	Y3omzHkehjY/PwpT2Ac4sjuvVbniRu0LAocZqwmKBBCjmcq0DTTo8fuN1YijdstDWBqhhxsly8p
	qITCQ+0B1EpjsvzYzLbwT0V1vTYsfLzNGASFLZAmM29c5YROSbvvxsWTHYQETZBHsFaEPUfU5zW
	uq/7CEpCyuR5jOzRCi7vPEy0VopYgLnE0MJ9K9xvuyWN3VSaNpcpaCpbX5QXoFjxPT1ww==
X-Received: by 2002:a05:600c:8714:b0:498:8e6:d463 with SMTP id 5b1f17b1804b1-4998792fee6mr180593925e9.1.1786959802911;
        Mon, 17 Aug 2026 02:43:22 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8FC50027494B64639367E4.dsl.pool.telekom.hu. [2001:4c4e:1b8f:c500:2749:4b64:6393:67e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783basm2546509f8f.30.2026.08.17.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:43:22 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Muhammed Subair <msubair@hotmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: RK3576: rockchip-pm-domain fw_devlink device-link failures for nested power-domain nodes
Date: Mon, 17 Aug 2026 11:42:53 +0200
Message-ID: <20260817094258.23332-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DU0P190MB244579F0C395F1F41CA729A8BCDC2@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
References: <DU0P190MB244579F0C395F1F41CA729A8BCDC2@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_024324_971932_B5AAA907 
X-CRM114-Status: GOOD (  16.96  )
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

Hi Subair,

Your diagnosis is right, and the answer to your first question is: this
is not RK3576 missing anything. RK3588 does the same thing.

From my Orange Pi 5 Plus on mainline 7.2.0-rc7, one line per boot:

  [    2.215019] rockchip-pm-domain fd8d8000.power-management:power-controller:
      Failed to create device link (0x180) with supplier spi2.0 for
      /power-management@fd8d8000/power-controller/power-domain@12

Same driver, same 0x180, same nested-child path, different SoC. And the
trigger on my board is a different property than yours: power-domain@12
and power-domain@8 here carry `domain-supply`, so the supplier resolves
to the SPI-attached PMIC regulator rather than to `soc` via `clocks`.
Two different properties on two different SoCs producing the same
message is a fairly strong sign the cause is structural rather than a
per-SoC DT omission. So I would drop your option 1.

On the flags, for whoever picks this up: 0x180 is
DL_FLAG_SYNC_STATE_ONLY | DL_FLAG_INFERRED, i.e.
FW_DEVLINK_FLAGS_PERMISSIVE in drivers/base/core.c, and that value is
taken on the branch where the fwnode declaring the dependency is not the
device's own fwnode:

	if (con->fwnode == link->consumer)
		flags = fw_devlink_get_flags(link->flags);
	else
		flags = FW_DEVLINK_FLAGS_PERMISSIVE;

which is exactly the nested-child case you describe. Worth noting that
DL_FLAG_CYCLE is a separate bit, so a cycle-tagged link would print
0x380.

More usefully: this has already been explained on-list. Sebastian
Reichel answered the same message class for RK3588 on 12 June 2026,
replying to Diederik de Haas's reports on nanopc-t6-lts, nanopc-t6-plus
and Rock 5B (identical 0x180, power-domain@8 and @12, suppliers 2-0042
and spi2.0):

  https://lore.kernel.org/all/aixze8zFboY3huSf@venus/

His explanation is a cyclic dependency arising because all domains are
provided by a single power-controller device: to probe the regulator you
need the bus controller, which needs its power domain, which needs the
power-controller, which needs the regulator. I would read that message
before going further, and I would not treat this as cosmetic. He is
explicit that it is "neither super bad, nor completely harmless",
because the kernel ends up missing dependency information and pays for
it in extra -EPROBE_DEFER rounds. He also says fixing it properly needs
substantial restructuring of the Rockchip power-controller driver, which
is a rather bigger answer than any of your three options.

One last thing, and I mean it helpfully: I think you have mailed the
wrong people. Your To: list is get_maintainer.pl output for
drivers/gpu/drm/rockchip, which is why five DRM maintainers were on a
power-domain question while the people who own it were not. For the
subsystems you are actually asking about:

  drivers/pmdomain/rockchip/  ->  Ulf Hansson, linux-pm@vger.kernel.org
  drivers/of/ (fw_devlink)    ->  Saravana Kannan,
                                  devicetree@vger.kernel.org

I have added linux-pm and Ulf here, and dropped the DRM maintainers and
dri-devel since the topic is not DRM. If you follow up, consider adding
Saravana and devicetree as well, and run scripts/get_maintainer.pl
against the files you are asking about rather than reusing a recipient
list from another thread. That is most likely why this went five days
without an answer.

Regards,
Igor


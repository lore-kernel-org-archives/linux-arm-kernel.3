Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7596CAC5B7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojpUE/397K3hT2SeOTA7WD+7AwLIZpK/S+c+xT7IPV8=; b=RAR5OyDI8Utr1sq1mgS9loiidq
	dJwJ9PNksxsLFhm7HziALwyeZGMaUrHcdxzJDP47g+cjY5lUEcvcNhbIzpXl0MmS6p6pOzS4fOxkJ
	uIyQssz1lKQ3YBWbKK7ZFJ5eCHb/VNW4wggGKiCc8yTMeIKXlaXGzjrV7bSSNXc6Mv/Tb8FFIC2QH
	Kydi0AbreDEgpnyfInsz/pntLVkR3lpABuxO+E5PX+JNmm3/sJtiSaySqc1LWOaYffIW7b3t5LyMG
	Lg0AOsmIn5LIQlQcZF7Py7vKCFuZPHCHcHje+K8/SK7o21wgGgmCy7iE8cObzCEOUQHiUHMWW43cP
	vn0gUUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zw1-0000000D1OO-0Uel;
	Tue, 23 Sep 2025 10:07:45 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zvy-0000000D1O0-1CYe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 10:07:43 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-ea5d0e0022cso4385457276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758622061; x=1759226861; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojpUE/397K3hT2SeOTA7WD+7AwLIZpK/S+c+xT7IPV8=;
        b=vt/geFk90mchD1oPShs/5iOFMrPoi0zbFHvBRB6b3o/xj+u7Ib3a6NbhQ+7/5EQQvt
         8aX7FglEBxYBrciSB4O9tpJK5CbN/uFZZ7VNCVqqMMVBcdz/b5guXLlY7JjLIY+0NwrX
         32vhyMt1mecR8UnIfisqYXZLc6r9nNq191ZT7kzbeQPrjUpIUkeB1rfeu5d0bZfRaJAL
         1v/nV//u9u1eqzY2KoaQOTKvqFeEjLk9iE1wRNM5GeMRb2ZmqORYXOHuGB28GQvehk6q
         PtQR9X3XZ/kJhkvr2XWY/Be1UCAC26rHRC2kehqWTky1/Sjr/2dBndoPU7xF/+fcvILE
         d1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758622061; x=1759226861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojpUE/397K3hT2SeOTA7WD+7AwLIZpK/S+c+xT7IPV8=;
        b=Ae+D3VSrucrYWm0g1aPoeekpTuZ6BCUDnoWk0ldfzco0A3N21vY6+xp076jRmoBAZ1
         IxrFdh7O9tfHm1B/5XzNHPvBiuBmZlJwpgJoYPMgdsnjxaGXu+TFwK9rpjVc594rGLAe
         4BRi11HBn8n/nMuU6/WJXkdX4XvtLs3I/sVuSOl0Vrb7nmOvcUQRyHEOCsfY8Re3i72G
         aJULqAjeHEX6sw3cNbSMoEmR5/wvcV8GKCPmOC2/rUPZSrpVSGQTSxXDZsUnOcFFu3nu
         Igfk8NVQUM6oE8jsZy4e1HcEWyw4Bqrk0+oDQvu6EqsXvqqjtBIZYFhqjwbHN1cn7SrQ
         E+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPwr3rQ6kUtrAflTj/MQUQ3OHUVVo9ZQlajOaS/2nQPbosM5DZPEgp6dX2JwLdVcFzNt39RIMDAs0Lxu6yQGMp@lists.infradead.org
X-Gm-Message-State: AOJu0YyyATt97vR2U3sbgRCzuNeXPGLxJa99VJ8AfpgYZ/3UghBPwKiu
	hGt/7oKeo5U7BWwjIBqaA/iajaaCeV6ym9fSAjX1dJj5g9n8U1X3TSCybnC5yiXV3O7udjIooTq
	Xco3yb0RcYwADrveVVjRb61Gsms6uRXJ07kvu+C2E4g==
X-Gm-Gg: ASbGncsHo3jJu7L+3dNv4G32G+qPloBlk610Z2dLPxR8rKkm3PhijXfnlP9f7OeXRsn
	8Kbmx5U08npoLVYtcXo4cEJ/2KVcuI//jmIsrUqYxj3Z8ZY30KDXEXEROvL/XcLB5l4ixXd66ft
	xW/INrlbCDCBQN25yFuds3qIvvHgfjUEH/V4oYLOg9NPPcuFrMk5uAprCEmfld6J2mSl0LXMfY/
	arBH9eWzGimJpjvXwOK+VNO6mE=
X-Google-Smtp-Source: AGHT+IFhxlf86kDMDK+HylKCRC/N5p3zMoJoowC3FVqGT2cdilfpDV8hTWNbOBBgYUOugMrwO5a4530QKfNhuWHjCzs=
X-Received: by 2002:a05:690e:1585:10b0:635:4ecf:bdcd with SMTP id
 956f58d0204a3-6360465937bmr1446230d50.47.1758622060562; Tue, 23 Sep 2025
 03:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
In-Reply-To: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Sep 2025 12:07:02 +0200
X-Gm-Features: AS18NWDUj1MIxdJxsyJdieUpTgmYfT34J9KGqEYqJqgWA33koJyrgJvf8IadiiQ
Message-ID: <CAPDyKFqQgS9j4uGkTL_taPTL96su1tqpyoek1cpZgTiaaBMpCA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pmdomain: core: Introduce device_set_out_band_wakeup
 and use it in usb
To: "Rafael J. Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_030742_482007_55F62C8F 
X-CRM114-Status: GOOD (  27.36  )
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

On Mon, 22 Sept 2025 at 04:21, Peng Fan <peng.fan@nxp.com> wrote:
>
> To i.MX95, USB2 and USB3 are in HSIOMIX domain, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. So when in system-suspend state, USB2/USB3 could wakeup
> the system even the USB2/USB3 HSIOMIX power domain is turned off. This
> means USB2/USB3 has out-of-band wakeup capability to wakeup system from
> suspended state.
>
> Without this patchset, if USB2/USB3 are configured with wakeup enabled,
> the HSIOMIX power domain will not be turned off. This leads to more
> power consumed in system suspend state.
>
> This patchset introduces device_set_out_band_wakeup and
> device_out_band_wakeup two APIs to set out-of-band and query the flag.
> In genpd_finish_suspend, there is a check, if out-of-band is set,
> it will continue to turn off the power domain. In genpd resume flow,
> there is a similar check to turn on the power domain.
>
> Patch 1,2 introduces device_set_out_band_wakeup and
> device_out_band_wakeup
> Patch 3 and 4 are drivers changes to use device_out_band_wakeup
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> This is pick up of [1]
> This V2 patchset
> - includes usb driver changes to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Changes in v4:
> - Split device_set_out_band_wakeup API and pmdomain changes into patch 1
>   and 2 and clear the flag in device_prepare (from Ulf)
> - Add R-b in patch 2
> - Move the call of device_set_out_band_wakeup to system suspend
>   callback in patch 3 and 4. (from Ulf)
> - For patch 3,4, I still keep the Tags, since compared with V3, it is quite
>   small changes.
> - Link to v3: https://lore.kernel.org/r/20250902-pm-v3-0-ffadbb454cdc@nxp.com
>
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       PM: wakeup: Add out-of-band system wakeup support for devices
>       PM: domains: Allow power-off for out-of-band wakeup-capable devices
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/base/power/main.c          |  1 +
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c | 11 ++++++++++-
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  9 +++++++--
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  8 files changed, 44 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
> change-id: 20250919-pm-v4-1879568de500
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

Rafael, I intend to pick up this series via my pmdomain tree shortly,
unless you have some objections, of course.

Kind regards
Uffe


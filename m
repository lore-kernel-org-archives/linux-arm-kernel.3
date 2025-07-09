Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3F4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNiQ1+5y2VFFZCNEkl5wzPIEOOAGrk6ZMXzGD1167g8=; b=AtxktjZKR6qSXsa2DBy3I3bDPv
	w0DmlEuJP8qtZtHkW/8fTxzAZ/kpTFrbRwpl/zdfELjqboKSF4GBBfAjgBBW9zMThaTXfsElsGIX4
	ecaC8EVbkI9ZCv60t1IMynjFodvyKOQPKRe9f73mCMrxMhdD0o79ltCKN771/dnQDv2Ta1J6OV2a8
	6ImkhtTHR1N9ZGXH0Lxf6fc9feFQyjQhGavdoRZuE25YzNd3Rc5ZiaQe5kFD+x/M5iBT584fgUrJw
	lJ42wgNI/5FKxnTUs/KnPrNLaBdsK+HqWBR7K2TuKaKzDuSmWliHxkhjUmByQSu4uM9Yg/dK+KEBQ
	UyC/yGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZW0B-000000091Dw-21cT;
	Wed, 09 Jul 2025 14:42:27 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZT1S-00000008VZZ-0qty
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 11:31:35 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso4077092276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752060693; x=1752665493; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNiQ1+5y2VFFZCNEkl5wzPIEOOAGrk6ZMXzGD1167g8=;
        b=v6eKkhRpsFadUysjaT9U7eoeHZU0H2UCqQvLnnUK4yW2oaK6ODnmvaSs83SWdvYmU9
         nKxsvuBSRqt2Py7MaXiKDza6YJ+cts1CHKzoV9utuqRuj3+JyH3F4kcVidZDpjnVrIeW
         MPh5mWnb7X4M3lxc2qALxGzYHNybMmY6nYGnMOMJC3+2pAf0DrAzfikTVJUUGlGhq4/R
         xvcDwT8GpO/MHnky1BhwnoqFP5ZLvkxhHQvotBidnuQGvS2hKcc4uE9jI+adNn1N+SnE
         wM6ae03InFOYSAwMzHid1Y0+Ugip4dBq8+PbNs3IT8UeVEl4FlNrSBIudL2Uv0qUXN9/
         2AXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060693; x=1752665493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNiQ1+5y2VFFZCNEkl5wzPIEOOAGrk6ZMXzGD1167g8=;
        b=HOL0Dl8KSdkWvLcEbG8KqC6o2xv+WOn9TruO5EuX66msKjqFJ5sjueNjlQN8aKKAQY
         9n2R5HT72S/IvVjVg0WdQDOl/pBkZqjoodOpDyBqVdZLaOW6AIv4lLJx/yRa5R6cDzlx
         qA7p05luma2PZNZ7rfjIDevQYeN3OWH53fYcqj511PGcTMVfyfbSyRdznSZ9r4ms0g1i
         eZyhRYGZV+bgn7Ah/7yfHmErGsgkoRi8qofxA+vtlJlC1RdudSycpRNKwIUSpHTq3nBc
         ik5HGEIA9j4MD/FIQtG6xFjuO0lO1UVijCaqXZxbNkelxL6HHazdCyyJMJB3u7Hn/hXT
         oSlA==
X-Forwarded-Encrypted: i=1; AJvYcCU7aL73CYKuuCitu2cjwFQxW6vXP/kg9CKK4jU77in1waH3AQoiZTPkaVUC99ZOUs2ceYFI1TONRiOUM9d7xG5A@lists.infradead.org
X-Gm-Message-State: AOJu0YxdzBWkmpa5eS5vrTJx0U76qudJ5ddq+JfsVZHVxMG2aBJPSK88
	hPYwKcGH/Hvo4MBEppN7R8o7ZGV0MNV07FrB5lRpKlphK2VUoTl8e/zL+P8sxUBw1rYsCTSIlie
	W8c7idlmBsiGyqgr+zyrpzpzH7Cf6mcA41tsmpRSQig==
X-Gm-Gg: ASbGncv2wlCkPkkLGEWJVeKAv4SbLRJyn7cAn5lB909Ryuro55q7s7dL5SoO6dievFm
	0QmDeFZbaAv6iL3qtBYoImHe/7enMO13fDnY04GvVITJ40oW3XhXg3xzF9QG9tbyQss9FVZmris
	gNA0lFS9hPNFayhMIO3ELy+bqlLRTnyt0BxYOQHk8bc4OD5bPlfB3F32U=
X-Google-Smtp-Source: AGHT+IFsS/ASN7bZj//LEOdFtJiqcKW9aOOwexSDyjzYRjOXer6dnb2P/mGTPna4qIWw/UGl9cHvGrgqRWogtZJ+2Ik=
X-Received: by 2002:a05:690c:6b0e:b0:70f:8884:17af with SMTP id
 00721157ae682-717b16723f0mr33351387b3.6.1752060693143; Wed, 09 Jul 2025
 04:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 13:30:57 +0200
X-Gm-Features: Ac12FXwPPsq7QQFWnJjGj5aeIXDZuRVVIUPoQyxowJKYffEpQh6cBhizErrlUZ0
Message-ID: <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_043134_242440_45243225 
X-CRM114-Status: GOOD (  28.44  )
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

On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Changes in v3:
>         - Added a couple of patches to adress problems on some Renesas
>         platforms. Thanks Geert and Tomi for helping out!
>         - Adressed a few comments from Saravanna and Konrad.
>         - Added some tested-by tags.

I decided it was time to give this a try, so I have queued this up for
v6.17 via the next branch at my pmdomain tree.

If you encounter any issues, please let me know so I can help to fix them.

Kind regards
Uffe


>
> Changes in v2:
>         - Well, quite a lot as I discovered various problems when doing
>         additional testing of corner-case. I suggest re-review from scratch,
>         even if I decided to keep some reviewed-by tags.
>         - Added patches to allow some drivers that needs to align or opt-out
>         from the new common behaviour in genpd.
>
> If a PM domain (genpd) is powered-on during boot, there is probably a good
> reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> powered-off before all of its consumer devices have been probed. This series
> intends to fix this problem.
>
> We have been discussing these issues at LKML and at various Linux-conferences
> in the past. I have therefore tried to include the people I can recall being
> involved, but I may have forgotten some (my apologies), feel free to loop them
> in.
>
> I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
> Let me know if you want me to share this code too.
>
> Please help review and test!
> Finally, a big thanks to Saravana for all the support!
>
> Kind regards
> Ulf Hansson
>
>
> Saravana Kannan (1):
>   driver core: Add dev_set_drv_sync_state()
>
> Ulf Hansson (23):
>   pmdomain: renesas: rcar-sysc: Add genpd OF provider at
>     postcore_initcall
>   pmdomain: renesas: rmobile-sysc: Move init to postcore_initcall
>   pmdomain: renesas: rcar-gen4-sysc: Move init to postcore_initcall
>   pmdomain: core: Prevent registering devices before the bus
>   pmdomain: core: Add a bus and a driver for genpd providers
>   pmdomain: core: Add the genpd->dev to the genpd provider bus
>   pmdomain: core: Export a common ->sync_state() helper for genpd
>     providers
>   pmdomain: core: Prepare to add the common ->sync_state() support
>   soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
>   cpuidle: psci: Opt-out from genpd's common ->sync_state() support
>   cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
>   pmdomain: qcom: rpmpd: Use of_genpd_sync_state()
>   pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
>   firmware/pmdomain: xilinx: Move ->sync_state() support to firmware
>     driver
>   firmware: xilinx: Don't share zynqmp_pm_init_finalize()
>   firmware: xilinx: Use of_genpd_sync_state()
>   driver core: Export get_dev_from_fwnode()
>   pmdomain: core: Add common ->sync_state() support for genpd providers
>   pmdomain: core: Default to use of_genpd_sync_state() for genpd
>     providers
>   pmdomain: core: Leave powered-on genpds on until late_initcall_sync
>   pmdomain: core: Leave powered-on genpds on until sync_state
>   cpuidle: psci: Drop redundant sync_state support
>   cpuidle: riscv-sbi: Drop redundant sync_state support
>
>  drivers/base/core.c                         |   8 +-
>  drivers/cpuidle/cpuidle-psci-domain.c       |  14 --
>  drivers/cpuidle/cpuidle-riscv-sbi.c         |  14 --
>  drivers/firmware/xilinx/zynqmp.c            |  18 +-
>  drivers/pmdomain/core.c                     | 211 ++++++++++++++++++--
>  drivers/pmdomain/qcom/rpmhpd.c              |   2 +
>  drivers/pmdomain/qcom/rpmpd.c               |   2 +
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c   |   2 +-
>  drivers/pmdomain/renesas/rcar-sysc.c        |  19 +-
>  drivers/pmdomain/renesas/rmobile-sysc.c     |   3 +-
>  drivers/pmdomain/xilinx/zynqmp-pm-domains.c |  16 --
>  drivers/soc/tegra/pmc.c                     |  26 ++-
>  include/linux/device.h                      |  13 ++
>  include/linux/firmware/xlnx-zynqmp.h        |   6 -
>  include/linux/pm_domain.h                   |  17 ++
>  15 files changed, 291 insertions(+), 80 deletions(-)
>
> --
> 2.43.0
>


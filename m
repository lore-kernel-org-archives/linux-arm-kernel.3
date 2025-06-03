Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98E2C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dx/bk9ru7EKbU1ykEfllBQeyaqERs6GMpKJf8LWkPkY=; b=Ntz4DKuTp4/8rrk1Nx4V6x+PBn
	0i+dJx6kFPcUqjIRFzUUfOE6TukYvmV8dcPd1kBqRpwcZ1hsf6ccoHKPDKkiLu/4iC61BYc/aDP/2
	SFNFxzO79kIXYD1HsJYLO+KoMMj90WZy5+3kuwATBZWloyr4lWaxyWIOrfg8vjSIvUS+pmNoWiaub
	pXTZktnj8AqWwO4M9p3DuRWPa7FiHKt272JqXKqwR5Nl8TgO8QxbwdcR5J/QcGPqeZU1lKDc1J9mK
	MEfNnV6AQFwlf1PcsPHOOvpY0bvxFv02o9zB2oR9BA6RdrKVB4/ycQDpFuPwey1iqq3PLPKohAvno
	q2mZwLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSaa-0000000BA5u-3G2L;
	Tue, 03 Jun 2025 14:26:04 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSV9-0000000B9Z0-2HTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:20:28 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4e58ef9cb69so1869023137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748960426; x=1749565226; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx/bk9ru7EKbU1ykEfllBQeyaqERs6GMpKJf8LWkPkY=;
        b=DhVnJ39jUJo+HGzG1M0RzHxRo9aA7DeOuB2ZG3l6+Vx8ywEbfHv9rCJD/cagF7NuW9
         ET7wdgBsA2pTq5fgP6+2hg6RG+vG2mUbelSEHEeNW5YYY86zOf9GshBsNP13+GWnUNE6
         MlEyWIp5jQZ/Sfw/BZwoA+J7OivNyUFZagV2XgsDs6isN4Sp3ZbB2jAfzWnbipV4tHph
         ahnH4kZwYqN05gT9sb32nKAy93imf2dSm20egqrS+AS6ZS/1Z9cgfGmOFLuCwVSpai4l
         m5sxscNf3QQVWn/my4MJilYkPplPf1/u+Uqq+TmNaPX+OBZbMnEK5vxX73CQMBVzjoED
         d2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960426; x=1749565226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dx/bk9ru7EKbU1ykEfllBQeyaqERs6GMpKJf8LWkPkY=;
        b=QkuiCPYFYoktdyhJLPq9B24+br8NAM9Qm/eAPxEo/nlIW/lywUxgpksxQFlf8eJRKq
         iCid+H7zOpqG6gEczKOUER8ABCn3Tv903ekwv9k0Ps9KRzslikXQUAm2ueDgaoYytFB8
         RoRWD5lq1gJosXYMl0jYT6BmSnrXHy28GA+i9JIpgQatT9RgFbQR1HZOsRzfsQU15pT7
         aTMuHkm4ldqAhL0VGc2azVTrqda0ur/AgAxBlmCvJWPbE3rlC2cdQ3MCGXvLnti36JY7
         EmmVEfcDY/xg6ysrOPHf70lsKGCp20dnj33nf2vsdpQiwGL1N2EYEC+gz7xhk2EfMmlr
         7qvg==
X-Forwarded-Encrypted: i=1; AJvYcCWsj7q82c36lNkAU2g3ne1sFfCpUsVjQCp7YPNbkxSPrY9POt2djfUTRk4A2ZhyhFdBbZ/2Om5QwrMiyBEUnIcl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwy/JzJsegNWuD1/brLAqnxxkqYVK4LT/39AkFAh6mcXFXSjez
	DbkhfKX3rw+1SWZyH5pD0K7YoFUMRH2lbXMm5tmWYAkZ5h3hXIHESdTmBG6lXQkH
X-Gm-Gg: ASbGncvtEZNsGiufBy3uZ8LA0fPtJVJ+JQi4xC0+4dpmwf1b7ojL2HqOCnpJGG1evEj
	UPQLzjH5IAcUztMHTBvsNszCvNXszkPKEF9h2GlYbj6sgBaxtkwVPktoh6tB643N1eqYFAlDuMZ
	4zTDMrTdfB+cqZfzc/jaPS6fl0YeZQzEUvxnQZtQH9oV41Wl2Wl0mHPhUQ5umUP2gWmQyn10wOS
	aZYhvEubWVkVZ+eEVAVEQlybq66s3mPN5h74DTawpxa1sl9pWYZ+9QFWWukQ+ud/WQGz+yx4GHW
	yjwxYuuK2chDqRMh3ViWS+CD+FM2FD89T/QK/RNI9d0aIUXOVw==
X-Google-Smtp-Source: AGHT+IEKKHGgS071esTvwavLg6yebr4hxGtYaniLmSj088LELmB0xeGF4iugMnsLA9Zd/YeN/VvuJw==
X-Received: by 2002:a05:6102:291f:b0:4e6:d911:dd89 with SMTP id ada2fe7eead31-4e6ece53479mr12894234137.21.1748960425449;
        Tue, 03 Jun 2025 07:20:25 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e64e9f28a2sm8676818137.26.2025.06.03.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:20:24 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:20:18 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to
 genpd
Message-ID: <20250603142018.zrb66ldkal5d5op7@hiago-nb>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_072027_582660_E6ADCECD 
X-CRM114-Status: GOOD (  25.90  )
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

Hi Ulf,

On Fri, May 23, 2025 at 03:39:57PM +0200, Ulf Hansson wrote:
> Changes in v2:
> 	- Well, quite a lot as I discovered various problems when doing
> 	additional testing of corner-case. I suggest re-review from scratch,
> 	even if I decided to keep some reviewed-by tags.
> 	- Added patches to allow some drivers that needs to align or opt-out
> 	from the new common behaviour in genpd.
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
> Ulf Hansson (20):
>   pmdomain: core: Use of_fwnode_handle()
>   pmdomain: core: Add a bus and a driver for genpd providers
>   pmdomain: core: Add the genpd->dev to the genpd provider bus
>   pmdomain: core: Export a common ->sync_state() helper for genpd
>     providers
>   pmdomain: core: Prepare to add the common ->sync_state() support
>   soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
>   cpuidle: psci: Opt-out from genpd's common ->sync_state() support
>   cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
>   pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
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
>  drivers/pmdomain/core.c                     | 239 ++++++++++++++++++--
>  drivers/pmdomain/qcom/rpmhpd.c              |   2 +
>  drivers/pmdomain/qcom/rpmpd.c               |   2 +
>  drivers/pmdomain/xilinx/zynqmp-pm-domains.c |  16 --
>  drivers/soc/tegra/pmc.c                     |  26 ++-
>  include/linux/device.h                      |  13 ++
>  include/linux/firmware/xlnx-zynqmp.h        |   6 -
>  include/linux/pm_domain.h                   |  17 ++
>  12 files changed, 294 insertions(+), 81 deletions(-)
> 
> -- 
> 2.43.0
>

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X

Best Regards,
Hiago.


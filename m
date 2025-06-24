Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58D5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaSirUQP1y7nt53v45U75QfDYbaR7g+CaXyRQ+R4zaQ=; b=UCEHRXqZOgTbGq+sb2+S99VNsR
	I1V98laf6IxEMRVHyK2McI0eU9UFGSqhWQSLnNGqck/qR6fIWooW+nedDn6Rfx60xAVfqPc9gL5KH
	sBwet59FB4JjktQ5NEmqdsFQ2gK29of8LEXEhp8lFQOTivZll3zLOs9Xa7pTL1xl4N5ik6VwnfJj0
	pqrDVzc19m9YBx9sIsZqiyi000ApWMQ/Z60Kpo5s7p731FgmLjEh9+oF7SqYtc2nBLso3y56BkqWb
	cOdsNFGUelqxIhxnMvVH3x+/T65lkoDkAFuMnIWP20r6kBjoI1XxmsooZKr+tqo5ZUe3rT3kaXnYz
	WCs6SXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jR-00000006fmk-3gb4;
	Tue, 24 Jun 2025 19:55:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6Lo-00000006FyB-2HOE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Jun 2025 16:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KaSirUQP1y7nt53v45U75QfDYbaR7g+CaXyRQ+R4zaQ=; b=GS6G8Ef8+MI0emGRCBG0lF5Q9n
	MrELJVnAGeR2LDZI2ZxslBbdZuUif2HW1k1SkzLo44FFQFor6J729Qf8LIV3hhrtupkoCJTfQIusZ
	6gehcrW6GV1uX10jDbXMtPsd0T3ue2xER7w8FSh51p7Dp2PjJUBT/TODzeNejvTu5c1Dr5FMzfZcu
	d0P306x7vkk+4zvwtRwU3Dpa+Cb+uuS61teh2P/tJQW1AFZRtB4uoc4tRbJIjQ10GOd9hURj2vQVj
	HEbBPHU+AoUdTAeeeqh2UvYp+3/APc9efZcTMn4+i+6cHdmKrz9he4eVBehyHX4BrNoaY/iSXcTI2
	we/UtrkA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6Ll-00000005Uil-2FDp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:18:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2350fc2591dso326395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781899; x=1751386699; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaSirUQP1y7nt53v45U75QfDYbaR7g+CaXyRQ+R4zaQ=;
        b=ThG0vEiNzckZgnQTNC0kZXSIJVHcugRvBlGwKc3OPTE8pKGV2oj/W5U5jEXT8lAdA9
         OHaV/mN0SeGy410PGoR9bycb1jeCaconi5uuLaGMskzJh/WET6HHWPk3amKiMzxw9MeQ
         zySvt2f5WpFogm3Fjk+EIqujcCsOeUuJcZVnnr2aUaJg5rPGLhgN/1GsCOPYvipXQp/q
         nLX6ALcu/f0e3l63hGyuH4cKUVcjbo4JQ2bSzJZyZ4GnUe+LarbN/sV4ib69tPe0LRa5
         amTe/dlhyiHnHE8hZ5nt24JNiBP8/rSkBtwYKKSmpkJBQ9CValVigy3yv9D/mP0FIAJX
         wTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781899; x=1751386699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaSirUQP1y7nt53v45U75QfDYbaR7g+CaXyRQ+R4zaQ=;
        b=dyBe6SdXbAHZJvX0H88NWTkXtctsk+AiamSgByymS7b4S2OVV/g92ge8P10J2p7b7B
         pbxdrWpUZhp47ygONbeoagvoY3WWdqp06BHr2HGmsVLc6OwCDwWwKeh/RJavrlsIdYBJ
         zTv21YGtRD7uxfhaBpUH4Bl4sr08hbEGF15N/csLwSxUy55b+V/R/XKTV5caFF5IYJ5R
         GF7insn89j170p1PNT0Gm2guWkcGlONImPKhNopqSRyscTiX1HCoo0zqjeDG3YsRu/Vr
         XM6XNjpMB0EXEifB7nqAZBuxcfYcnweJlgk1E+LeZc8pSJT7i57bPChrm0HGoE5Fg3AF
         zVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCURg26OYwGgbovAR1GqgznQdSkuPzGPN6gH1YW3PNqOaNQPcxG7toG5xQ3kL1pQyv7AbygxihNtbeQOqB7llfCd@lists.infradead.org
X-Gm-Message-State: AOJu0YyQTMTLdjINcUtrkasHmHi43uCxhduYdJjda2xG87ZA/0Gh3ftz
	ZkbinKoFYKNu/YxWvbS2DfkN1bJGFPAdY2ncnJMfrLdDd0wiR/MlTH3hk50yAkmL
X-Gm-Gg: ASbGnctnRxCLBke4jHZTeLRwUHDuKGGlFAGPueOp1vt1VfERkIcBuPry3BMIyUZDipm
	iTQLwSXinfdFE7p46b4Y2ogTZFY21SyXfjeNi79w9y9HwTPDBmiAU/lAK6h3pMhL+IfDCqYx5SU
	pM3g8s1xUD2VqvVegafVuqQfJtgGIAZEg8f2yNnwdH0iAM/ihxPE4Nqozy/ZEF8kgJfIiBObm3R
	YMCbXJE+wOTgR5kd8eh5FIrirNFW0ZE2v7uNPnETLX0GfNqxzqhzE1uLe/Z7g2NHkMY/1d/TCsP
	HcM1Zt2JEp5ARL1EqBSpSZm5/aTlb4/H7uhABm9fV+C9Xcd/7ZP1FpgRawgP7MH/1mGoNw==
X-Google-Smtp-Source: AGHT+IGY9jDpDk2r2dCyM4JVgT9EfvwZiTIAPDobHHlnMbHmIZb819DFvehZFOYNen2Nr3/FdN/vzA==
X-Received: by 2002:a17:902:9a09:b0:232:59b:5923 with SMTP id d9443c01a7336-238024b7fe7mr64735195ad.23.1750781898702;
        Tue, 24 Jun 2025 09:18:18 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83955a3sm110681625ad.36.2025.06.24.09.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:18:17 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:18:12 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250624161812.c4p26zkd37awixpr@hiagonb>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <aFlzpnT1yNGdWWkH@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlzpnT1yNGdWWkH@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_171821_809294_D726D8DB 
X-CRM114-Status: GOOD (  28.89  )
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

On Mon, Jun 23, 2025 at 09:32:54AM -0600, Mathieu Poirier wrote:
> On Tue, Jun 17, 2025 at 04:34:47PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > This patch series depends on Ulf's patches that are currently under
> > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > Without them, this series is not going to work.
> 
> Please resend this patchset when [1] and the work in patch 1/3 have been merged.

All right, I will send the v6 with the corrections you mentioned and
resend it when the other patches have been merged.

Best regards,
Hiago.

> 
> Thanks,
> Mathieu
> 
> > 
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> > 
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > already powered on, the driver will attach to it.
> > 
> > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > return before dev_clk_get() is called, as it currently generates an SCU
> > fault reset if the remote core is already running and the kernel tries
> > to enable the clock again. These changes are a follow up from a v1 sent
> > to imx_rproc [2] and from a reported regression [3].
> > 
> > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> > 
> > v5:
> > - pm_runtime_get_sync() removed in favor of pm_runtime_resume_and_get(),
> >   checking the return value of it.
> > - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove().
> > - Fixed missing "()" in dev_pm_genpd_is_on description.
> > - Updated dev_pm_genpd_is_on() function description to be explicit the
> >   function reflects the current power status of the device and that this
> >   might change after the function returns, especially if the genpd is
> >   shared.
> > 
> > v4:
> > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > 
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > 
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > 
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> > 
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on()
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> > 
> >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> >  include/linux/pm_domain.h      |  6 +++++
> >  3 files changed, 73 insertions(+), 7 deletions(-)
> > 
> > -- 
> > 2.39.5
> > 


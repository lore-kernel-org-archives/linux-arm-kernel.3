Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68E9106B519
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AALyXMvw0je7A53lWrzx1SCKloiiDnfr5zZSndjQGk=; b=KMjpcRFky5VKXRstwW72tDVGRI
	4JLM07pGfCK9dSbblbGY4zvDKu4qzM/2Tc0dNY+E4kF1Xd0d1YVi1x87WKm/k3vCjZ5u99gtmOJwx
	oESfJLfsu5ch1w8ycQDmu0zvoYMYNeu4Uq9ktgx3aYaK8RyDPWYYArCWQ+CLdJoaPUBwGH3sg2Jol
	ZFuDsbdTnIQkcttnlgc2Q3R4L8mO1uuzRhA8kaRAmj26Wane3rDMm2sr2gRxUsaCnPv3bNewFHl1c
	+fknLcdPx2g/Lw8fY90AJJXwUOtVMC2EyNi+l2io4XGWiC0Ac6bx3qiEUIgU4lckFf/RSqs8SCx6V
	qLxZ7xDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NL3-00000003N3q-3Ijx;
	Wed, 25 Mar 2026 12:27:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NL0-00000003N3T-48it
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:27:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E641CDD;
	Wed, 25 Mar 2026 05:27:48 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EFC33F915;
	Wed, 25 Mar 2026 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774441674; bh=r2XgYTZSdCM7G0IZbpb3iOsmIHn+g3Bg7hWAC/Kzi3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpdxeQt2YbXJHkZ26e0AGm4UKPobmeEc8zYHDPIQ7d+3Dp7TGfaxvbUJmQoUNeHt/
	 Ld+hmZJroKy4k9k3GMVoJEcCYtwB2eiAG8IurXt0H2v7nhT1fAfw9AsJyWBI8QHK7E
	 EF+csPDTqlILpKJ9qJAnCjmNTtj5kLbbV6V2sohM=
Date: Wed, 25 Mar 2026 12:27:48 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <acPUxJ3N0QptmtlJ@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CGME20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf@eucas1p1.samsung.com>
 <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_052755_157342_ED9041B7 
X-CRM114-Status: GOOD (  14.40  )
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

On Wed, Mar 25, 2026 at 12:02:41PM +0100, Marek Szyprowski wrote:
> On 10.03.2026 19:40, Cristian Marussi wrote:
> > Add proper error handling on failure to enumerate clocks features or
> > rates.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 

Hi Marek,

> This patch landed yesterday in linux-next as commit 0d8b0c8068a8 
> ("firmware: arm_scmi: Harden clock protocol initialization"). In my 
> tests I found that it causes a regression on RK3568 Odroid-M1 board 
> (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU 
> device are not probed properly:
> 
> # dmesg | grep scmi
> scmi_core: SCMI protocol bus registered
> arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
> arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size: 
> 104bytes / max-msg: 20
> scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
> arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
> arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4  
> (loop_num_ret:1)
> arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware 
> version 0x0
> arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk 
> [quirk_clock_rates_triplet_out_of_spec]
> scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error -22
> 

Yes there are multiple reports of issues on this hardening, the series
is on hold and wont go into v7.1 as of now...it needs some basic fixes
and various quirks probably to address non-compliant firmwares...

It will be pushed to next again with a few more fixes in the coming
days and then we'll need to figure out how many quirks will be needed on
top of that and if it is acceptable at all...

Thanks for the report,
Cristian


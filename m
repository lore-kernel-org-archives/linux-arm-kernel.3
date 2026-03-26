Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D5106F319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHuEV5qmahzZIboidDNqvpY50/0bKhQtLRKVkzJKB/U=; b=XFTDNnizNt91FbeXkxEDuNJQ45
	kV5a8iyt73vHhfTSLx5JN5VzxgYvUp4EAWFZQ4DU+C3s7AjjUaKX3v3yESWAUb02MXtkpb5CHRViQ
	6xIVtXhv/JsZ5oXjRbF0TP6XCmYsCD6HaR/7K+NcAfjcEONqoorofi9PV3IDRT/nEHfU2V0G/UYPw
	Ev4FOlbaVpPj2AQiDcFPLVXwWju1roXL71LX9mkQjKVQtezhoZd7v7qYfPxXxtc4Tl/tPRe5XaLax
	bAEbtjXezauhDbT7c614tsMn0VfXmMpVJgvh1Xsq+tghWZkg1ansuO5uUyfHEKPX8hF4rXmoN/TUC
	oOgFR3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hlR-00000005Fdu-2JUs;
	Thu, 26 Mar 2026 10:16:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hlP-00000005Fce-2UbP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE181437A7;
	Thu, 26 Mar 2026 10:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ED3C116C6;
	Thu, 26 Mar 2026 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520190;
	bh=8pidv6tLBMKGrGGnxMSzOA+pQiMt1DosRVV6l9JsVPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4AbEJO60R4MTJV/FlIwybC66N9IoNBKSDUhU43IaUyGF6f9Td0oOqz1XoWE/KAX1
	 Vip3LJHiPhP0tzyGVYmxMfHjZaSETl4I5sp2gsQw26TIIXSwUfsQO8Lxy4R/D/8hDp
	 uhWnXGs8kP7ZsC385DV04eAEQUVJnCUozXMXZ4TgLvHHmDiIxP9Msyo/FptVHHiXOG
	 xCCSVlVq07S2Q7zXMOtCtdGlAX3fEab3GEpKT+FmbKJq0g6Bjaudo893xEXMUq3s8g
	 7r8FZwz1tBUnAEc/OibVHqwa2K7OxkdFzSaqgTnMIyx3CmPGRnq7y9w72P8KLKgUcp
	 4iFlx9ISuHVnw==
Date: Thu, 26 Mar 2026 10:16:25 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <20260326-amiable-potoo-of-health-ed5c9a@sudeepholla>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
 <acPUxJ3N0QptmtlJ@pluto>
 <5980695.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5980695.DvuYhMxLoT@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_031631_691993_8D2E0AA4 
X-CRM114-Status: GOOD (  29.11  )
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

On Thu, Mar 26, 2026 at 09:55:18AM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 25. März 2026, 13:27:48 CET schrieb Cristian Marussi:
> > On Wed, Mar 25, 2026 at 12:02:41PM +0100, Marek Szyprowski wrote:
> > > On 10.03.2026 19:40, Cristian Marussi wrote:
> > > > Add proper error handling on failure to enumerate clocks features or
> > > > rates.
> > > >
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > 
> > 
> > Hi Marek,
> > 
> > > This patch landed yesterday in linux-next as commit 0d8b0c8068a8 
> > > ("firmware: arm_scmi: Harden clock protocol initialization"). In my 
> > > tests I found that it causes a regression on RK3568 Odroid-M1 board 
> > > (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU 
> > > device are not probed properly:
> > > 
> > > # dmesg | grep scmi
> > > scmi_core: SCMI protocol bus registered
> > > arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
> > > arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size: 
> > > 104bytes / max-msg: 20
> > > scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
> > > arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
> > > arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4  
> > > (loop_num_ret:1)
> > > arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware 
> > > version 0x0
> > > arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk 
> > > [quirk_clock_rates_triplet_out_of_spec]
> > > scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error -22
> > > 
> > 
> > Yes there are multiple reports of issues on this hardening, the series
> > is on hold and wont go into v7.1 as of now...it needs some basic fixes
> > and various quirks probably to address non-compliant firmwares...
> > 
> > It will be pushed to next again with a few more fixes in the coming
> > days and then we'll need to figure out how many quirks will be needed on
> > top of that and if it is acceptable at all...
> 
> Just for the records: imx95 (maybe imx94 as well) is also affected by this.
> My board doesn't boot at all, because all the clocks are provided by SCMI.
> 
> With this diff I can see it's the 'ext' clock
> -->8---
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -1253,8 +1253,11 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -               if (ret)
> +               if (ret) {
> +                       dev_warn(ph->dev, "scmi_clock_attributes_get failed for '%s': %d\n",
> +                                cinfo->clkds->info.name, ret);
>                         return ret;
> +               }
>  
>                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
>                 if (ret)
> -->8---
> > arm-scmi arm-scmi.0.auto: scmi_clock_attributes_get failed for 'ext': -2
> > scmi-clocks scmi_dev.6: probe with driver scmi-clocks failed with error -2
> 
> What's the idea of how to proceeed as apparently several platforms are
> affected?
> 

Not exactly answer to the above question, but more discussion here:

https://lore.kernel.org/all/20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com

-- 
Regards,
Sudeep


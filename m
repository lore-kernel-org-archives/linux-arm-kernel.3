Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAF2FF4946
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 05:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afwAGoeIuqD9LHpOYuSbhahM72VWSVPp05L9wyA1vFQ=; b=rtgkxAPP0kSGh6KVL+iELs2SFm
	b6C8558rt/Lvvns/hho/e4fwNZDgq9VbQpH1kDhKnjB0dZOLsTzxSZcJLi9Q4F1huzAwllHdI4+eB
	VMvgR6URlfsueN/jWCNtGfWDGqWDWrBXnTwiVN3crmXEj+/0JE09stV/TPXyA7z0ZrlyJ/qwmBNFv
	ax/+wSJ5muQ9ppJznW1pVdi+58c/aSx5lA6rPFnJr9ufAi5KiLZe+QfBBPn5MmuiqLdpzitkD2y3o
	GtyUsFh8pCF1Iv3T/fjkIuY9SdNOFCOLs8ElO/0jPnDD2TKjRZtkV+avOgVUMm32gD25M/CjYIQhI
	MBVm911Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75a8-0000000Aem3-3FyM;
	Mon, 30 Mar 2026 05:54:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75a6-0000000AelY-29mD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 05:54:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 703491C2B;
	Sun, 29 Mar 2026 22:54:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0B83F641;
	Sun, 29 Mar 2026 22:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774850072; bh=dFIflD8J6Bfuj9Sl1pB2+4e1A5GxZPMlNoQIe6/wxQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJ7lOtVLOzX2QjKKKD1sjBjhxzV7JBGJOFdMdt7bvVHTOfSMo8+krSsKQYjTce3eO
	 WsZ8LM3Cd0DIMleAXAFayUS4EZlr58dAA/kNnKbuoi0i/fH+sJr9ZzdK2OU3aKOdlo
	 jl2v09wVfkWXczr3J0T/FZED7o3pSNep7NXgikGE=
Date: Mon, 30 Mar 2026 06:54:21 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Message-ID: <acoQDQ_Ytezv8KPC@pluto>
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
X-CRM114-CacheID: sfid-20260329_225434_835009_E2DE98CB 
X-CRM114-Status: GOOD (  34.44  )
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

Hi,

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

Sorry for the late reply, thanks for the report...

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

The series is on hold of course due to some residual bugs and all of
these reports of misbehaving firmwares...as I was saying elsewhere we
dont want of course to break existing boards in the wild that will most
probably never get a FW fix, BUT at the same time we do NOT want to
legalise/normalize this out of spec behaviour by leaving the kernel
code as it is...I mean at least we'd like to try to discourage this
mis-implementations in the future FWs ...

At the end, this could mean some quirks applied to multiple platforms
and vendors and maybe some relaxation in the checks, certainly some noisy
annoying logs on the side :P

Thanks,
Cristian


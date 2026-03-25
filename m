Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8E3FEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TENbPqJiqN8gJ2OLLr9A5N0XRqryi/AdnBno+1Cr8Q=; b=BguDfaTcUSBhyKSixmVS+MpXy8
	na5iEe8tCCZ4J4yQPGCUvK2pI3rLHlSCVq3I672COTZNaTkNct8DjqaBniN06jbzaKjD/psBZ4pa5
	BEac9Rt5vt2kGaQFL5nnzL0m+v8bWxeDYrfdH42cAZbLYBktOrWn2xPpfEdWVk1f0tVZh/N5/KJDQ
	jZWoYG8QoKUMegKk7jc/0Aex/oyu4APKTD/OMyPQAO1QthOxOqOXd0q2CGsUV+uZxtMy+kqiAHr2v
	cyxeVWf52CNqrdviydRV0k5A+vpal1L6CL0M0DY6QKBWA/WPdDWxnUQLvJDlXyZqqExWZ5i4Sh69o
	AcpGfqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M0m-00000003Crv-1Hzu;
	Wed, 25 Mar 2026 11:02:56 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M0h-00000003Cov-1zpl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:02:55 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260325110244euoutp029efc4ffa496ab1feff7efdf98de82f1f~gEKdwpEFC1443014430euoutp024
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 11:02:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260325110244euoutp029efc4ffa496ab1feff7efdf98de82f1f~gEKdwpEFC1443014430euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774436564;
	bh=5TENbPqJiqN8gJ2OLLr9A5N0XRqryi/AdnBno+1Cr8Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jdmNBq0G3l0ac+iBrxQvKk7jBdm8Zev7dgMOfhi+D/7Ej4x5MrWHYigVa0E5wgHsf
	 3TEuafXXl1Ar/TmSWgBIWJIJ1se31P4h18iP/wCue1rLlaaIoU8IJ2XSYEVT3Er/41
	 DqneuAyE259ggexAMCAMBFyomLdnBkMUPNU8FLXE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf~gEKdfMCHg2549225492eucas1p1r;
	Wed, 25 Mar 2026 11:02:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260325110242eusmtip266f05f327a6eb6ca9d92996263e0cba0~gEKbsHQ5z1659816598eusmtip2Y;
	Wed, 25 Mar 2026 11:02:42 +0000 (GMT)
Message-ID: <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
Date: Wed, 25 Mar 2026 12:02:41 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
To: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf
X-EPHeader: CA
X-CMS-RootMailID: 20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
	<20260310184030.3669330-9-cristian.marussi@arm.com>
	<CGME20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040253_705862_23651020 
X-CRM114-Status: GOOD (  16.64  )
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

On 10.03.2026 19:40, Cristian Marussi wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

This patch landed yesterday in linux-next as commit 0d8b0c8068a8 
("firmware: arm_scmi: Harden clock protocol initialization"). In my 
tests I found that it causes a regression on RK3568 Odroid-M1 board 
(arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU 
device are not probed properly:

# dmesg | grep scmi
scmi_core: SCMI protocol bus registered
arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size: 
104bytes / max-msg: 20
scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4  
(loop_num_ret:1)
arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware 
version 0x0
arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk 
[quirk_clock_rates_triplet_out_of_spec]
scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error -22

# cat /sys/kernel/debug/devices_deferred
fde60000.gpu
cpufreq-dt

# dmesg | grep fde60000.gpu
rockchip-pm-domain fdd90000.power-management:power-controller: 
sync_state() pending due to fde60000.gpu
panfrost fde60000.gpu: get clock failed -517
panfrost fde60000.gpu: clk init failed -517
panfrost fde60000.gpu: get clock failed -517
panfrost fde60000.gpu: clk init failed -517

...

> ---
>   drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index c9b62edce4fd..bf956305a8fe 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
>   		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
>   			clk->rate_change_requested_notifications = true;
>   		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> -			if (SUPPORTS_PARENT_CLOCK(attributes))
> -				scmi_clock_possible_parents(ph, clk_id, cinfo);
> -			if (SUPPORTS_GET_PERMISSIONS(attributes))
> -				scmi_clock_get_permissions(ph, clk_id, clk);
> +			if (SUPPORTS_PARENT_CLOCK(attributes)) {
> +				ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> +				if (ret)
> +					return ret;
> +			}
> +			if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> +				ret = scmi_clock_get_permissions(ph, clk_id, clk);
> +				if (ret)
> +					return ret;
> +			}
>   			if (SUPPORTS_EXTENDED_CONFIG(attributes))
>   				clk->extended_config = true;
>   		}
> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>   	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>   		cinfo->clkds[clkid].id = clkid;
>   		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -		if (!ret)
> -			scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
> +
> +		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



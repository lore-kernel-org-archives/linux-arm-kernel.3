Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBA4D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+QeMOJOnfslgDcfNzsZCKnwETDURGiBqjri2tCUFfk=; b=kOdLXipxHsfLYGRUx+I66GWvkP
	eQZJhq+jJG+M8zaVKgiFzQNirxyaMpi1TtN9NsHRLbyEN9B4FpUfhnvTGZDtpZPPmHOUBfoV8IonP
	IVLlQl6y+Xs3ATdIcWkqpmkkEuWAfds8XDS6AW1myLOBqPsqpMc+z/ou4E4td55pGrYH/GKp1Bb3s
	j5tAzApOfVP0b/buc0+OTT4+a8U6+xhZdJWGSGsGZZGBTfhAjnOFZwCTPW+WxsR2y6UBbc9PPiPId
	RUax+2xNLlDABV2B9h8m3xtvCfK94uF5ucCqgYRyZrBNjcDN/MDSHNRmABq8dBJfHBpofvwLyZShF
	Whe7lEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOczJ-0000000GmPf-2aJc;
	Thu, 27 Nov 2025 14:28:49 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOczG-0000000GmPF-2Voo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:28:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251127142840euoutp02db1bdb378563cba69938fc67c3969683~742k7u32y2890528905euoutp02y
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 14:28:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251127142840euoutp02db1bdb378563cba69938fc67c3969683~742k7u32y2890528905euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764253720;
	bh=c+QeMOJOnfslgDcfNzsZCKnwETDURGiBqjri2tCUFfk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=erbwpoODj8qo874optlioim476oOShFTEsV3Ii2jsn23RSu2+ZqD/Byawvhgk9B9y
	 8GKnMWuwLJ8Iga9mkAgXYi8I7oqYCCBi7g0JqpaqvnXzJjhKcm0qtB14Eu9mnTXfmB
	 /fKBWfHcgCCVRO6fXtKiJOBP8NR400dWaL9LnMok=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c~742kOva7m0371103711eucas1p14;
	Thu, 27 Nov 2025 14:28:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251127142836eusmtip20607f11d6d5e39787db9d5c4efbb27f3~742huJECq1704117041eusmtip2Y;
	Thu, 27 Nov 2025 14:28:36 +0000 (GMT)
Message-ID: <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
Date: Thu, 27 Nov 2025 15:28:35 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn
	Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
	Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan
	<peng.fan@nxp.com>, Beleswar Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251124182751.507624-2-robh@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c
X-EPHeader: CA
X-CMS-RootMailID: 20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c
References: <20251124182751.507624-1-robh@kernel.org>
	<20251124182751.507624-2-robh@kernel.org>
	<CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_062847_239792_FD620A78 
X-CRM114-Status: GOOD (  27.54  )
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

Hi Rob,

On 24.11.2025 19:27, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

This patch landed in today's linux-next as commit c70b9d5fdcd7 
("remoteproc: qcom: Use of_reserved_mem_region_* functions for 
"memory-region""). In my tests I found that it breaks booting of 
DragonBoard410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts) by causing 
the NULL pointer dereference. The issue is caused by replacing 
devm_ioremap_wc() with devm_ioremap_resource_wc(), which fails on 
devm_request_mem_region(), see comment in the code below. It looks that 
the error handling is somewhere broken. Here is the the kernel log:

remoteproc remoteproc0: 4080000.remoteproc is available
qcom-wcnss-pil a204000.remoteproc: error -EBUSY: can't request region 
for resource [mem 0x8e200000-0x8e7fffff]
remoteproc remoteproc1: a204000.remoteproc is available
remoteproc remoteproc1: powering up a204000.remoteproc
remoteproc remoteproc1: Booting fw image qcom/apq8016/wcnss.mbn, size 
4111376
Unable to handle kernel paging request at virtual address fffffffffffffff0
Mem abort info:
...
Internal error: Oops: 0000000096000046 [#1]  SMP
Modules linked in: cpufreq_powersave qcom_wcnss_pil cpufreq_conservative 
coresight_stm coresight_replicator coresight_tmc coresight_tpiu stm_core 
coresight_funnel coresight_cpu_debug coresight_cti(+) adv7511 coresight 
nfc rfkill msm snd_soc_lpass_apq8016 snd_soc_apq8016_sbc 
snd_soc_lpass_cpu snd_soc_msm8916_analog snd_soc_msm8916_digital 
snd_soc_qcom_common snd_soc_lpass_platform snd_soc_core qrtr ubwc_config 
snd_compress llcc_qcom snd_pcm_dmaengine qcom_q6v5_mss snd_pcm ocmem 
qcom_pil_info qcom_spmi_vadc qcom_camss drm_gpuvm qcom_pon rtc_pm8xxx 
qcom_q6v5 qcom_spmi_temp_alarm venus_core qcom_vadc_common snd_timer 
drm_exec qcom_sysmon snd qcom_common gpu_sched videobuf2_dma_sg 
v4l2_mem2mem qcom_glink_smem v4l2_fwnode soundcore drm_dp_aux_bus 
qmi_helpers mdt_loader v4l2_async videobuf2_memops videobuf2_v4l2 
videodev qnoc_msm8916 videobuf2_common qcom_rng drm_display_helper mc 
qcom_stats rpmsg_ctrl rpmsg_char display_connector ramoops socinfo 
rmtfs_mem reed_solomon ax88796b asix usbnet phy_qcom_usb_hs ipv6 libsha1
CPU: 2 UID: 0 PID: 28 Comm: kworker/2:0 Tainted: G W           
6.18.0-rc1+ #16209 PREEMPT
Tainted: [W]=WARN
lr : __qcom_mdt_load+0x210/0x304 [mdt_loader]
Call trace:
  __pi_memcpy_generic+0x128/0x22c (P)
  qcom_mdt_load+0x68/0x60c [mdt_loader]
  wcnss_load+0x2c/0x5c [qcom_wcnss_pil]
  rproc_start+0x30/0x1b4
  rproc_boot+0x19c/0x560
  rproc_auto_boot_callback+0x1c/0x34
  request_firmware_work_func+0x4c/0x98
  process_one_work+0x208/0x60c
  worker_thread+0x244/0x388
  kthread+0x150/0x228
  ret_from_fork+0x10/0x20
Code: 927cec03 cb0e0021 8b0e0042 a9411c26 (a900340c)
---[ end trace 0000000000000000 ]---


> ---
> v7:
>   - Split QCom to separate patch
> ---
>   drivers/remoteproc/qcom_q6v5_adsp.c | 24 ++++------
>   drivers/remoteproc/qcom_q6v5_mss.c  | 60 ++++++++-----------------
>   drivers/remoteproc/qcom_q6v5_pas.c  | 69 +++++++++++------------------
>   drivers/remoteproc/qcom_q6v5_wcss.c | 25 +++++------
>   drivers/remoteproc/qcom_wcnss.c     | 23 ++++------
>   5 files changed, 72 insertions(+), 129 deletions(-)
>

> ...

> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 2c7e519a2254..14005fb049a2 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -526,25 +526,20 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
>   
>   static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>   {
> -	struct reserved_mem *rmem = NULL;
> -	struct device_node *node;
> -
> -	node = of_parse_phandle(wcnss->dev->of_node, "memory-region", 0);
> -	if (node)
> -		rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> +	struct resource res;
> +	int ret;
>   
> -	if (!rmem) {
> +	ret = of_reserved_mem_region_to_resource(wcnss->dev->of_node, 0, &res);
> +	if (ret) {
>   		dev_err(wcnss->dev, "unable to resolve memory-region\n");
> -		return -EINVAL;
> +		return ret;
>   	}
>   
> -	wcnss->mem_phys = wcnss->mem_reloc = rmem->base;
> -	wcnss->mem_size = rmem->size;
> -	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
> +	wcnss->mem_phys = wcnss->mem_reloc = res.start;
> +	wcnss->mem_size = resource_size(&res);
> +	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);

The above line causes the failure. After restoring it to:

wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);

the mentioned board boots fine again. I'm not sure about other drivers, 
if they also fail the same way as they might not be used on the tested 
board.

>   	if (!wcnss->mem_region) {
> -		dev_err(wcnss->dev, "unable to map memory region: %pa+%zx\n",
> -			&rmem->base, wcnss->mem_size);
> +		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
>   		return -EBUSY;
>   	}
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



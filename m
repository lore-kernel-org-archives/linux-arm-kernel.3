Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B886D19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hZIidlQwtEAZPDQwy5fCpgn5aYTrltQ0aWsqkrl/MA=; b=L/9A+ctarmH2H/XKdifL63i/pH
	b2HKIUPqpGlt5fkAISDle4D5x5na1zHKYBKuZ7kOeXKu1TgJ5oAkwhUSswh5z9X8TUU0LSkwzge+K
	y7YDOg5N4QWr0VFnp6wacnIZESCOWfuq5P60Spzesk/GVz7Qufx4F2Dc48vgV07IqV52gkBxRMCc3
	fdBkwHHOkmQ244kP8rrv/ct/UZiQCHyT3DawA9xvqp/OrRJHNxXt+W1RGIZCGTnJ+iLJzMxa95tnM
	47c+lrABNMjSFWIUbjH1mQMQX6lCblBq8PjQfoHBb6D5M3NScbGMl4V8iaelwvLR/Eqfe1MvsnjpJ
	EJzcCohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQbT-0000000CzgN-2MqI;
	Mon, 26 Jan 2026 17:42:19 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQbP-0000000Czfe-483M;
	Mon, 26 Jan 2026 17:42:18 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260126174209euoutp01d8845f787646e1ccb38509ae2b34dc63~OWMpImYMh0629706297euoutp01c;
	Mon, 26 Jan 2026 17:42:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260126174209euoutp01d8845f787646e1ccb38509ae2b34dc63~OWMpImYMh0629706297euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769449329;
	bh=0hZIidlQwtEAZPDQwy5fCpgn5aYTrltQ0aWsqkrl/MA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nrz4+E+2t7tfDF869R6ejue7cgak6v9clKDONEvHjbNwmOVc3lAWzNkgauBE0u2G9
	 XMbsdqNGq2ckduW+Y0KXZQ2SyyAKRGJyF+5/57qM+GvUo9tqx+5Nn/CfoE3+5skQXL
	 WK/TBRhZlZKJU4TQI2Z68YhRXQdg6bm54Zd9BN6w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178~OWMo4Zig62641726417eucas1p2J;
	Mon, 26 Jan 2026 17:42:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260126174207eusmtip2c8c9672c51997b866a94fb0a7a1010cb~OWMnUdX7Y2552625526eusmtip2d;
	Mon, 26 Jan 2026 17:42:07 +0000 (GMT)
Message-ID: <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
Date: Mon, 26 Jan 2026 18:42:06 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
	Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
	Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178
X-EPHeader: CA
X-CMS-RootMailID: 20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
	<20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
	<CGME20260126174209eucas1p28e3856ee9f7a841db54dd05e5ea30178@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_094216_599082_FDDADA33 
X-CRM114-Status: GOOD (  21.17  )
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

On 07.01.2026 19:14, Dmitry Baryshkov wrote:
> Implement the clear_infoframe callback, disabling corresponding
> InfoFrame type.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

This patch landed recently in linux-next as commit 3a4ceb89a972 
("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
it causes the following regression on Qualcomm RB5 board:

platform 8300000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to 
iommu group 25
msm_dpu ae01000.display-controller: bound ae90000.displayport-controller 
(ops msm_dp_display_comp_ops [msm])
platform 8300000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to 
iommu group 26
platform 8300000.remoteproc:glink-edge:fastrpc:compute-cb@8: Adding to 
iommu group 27
qcom,fastrpc 17300000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: 
no reserved DMA memory for FASTRPC
platform 17300000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to 
iommu group 28
msm_dpu ae01000.display-controller: bound 3d00000.gpu (ops a3xx_ops [msm])
[drm:dpu_kms_hw_init:1173] dpu hardware revision:0x60000000
platform 17300000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to 
iommu group 29
platform 17300000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to 
iommu group 30
wsa_macro 3240000.codec: using zero-initialized flat cache, this may 
cause unexpected behavior
qcom-soundwire 3250000.soundwire: din-ports (2) mismatch with controller (3)
[drm:msm_dsi_manager_connector_init [msm]] *ERROR* Unable to create 
bridge connector
msm_dpu ae01000.display-controller: [drm:msm_dsi_modeset_init [msm]] 
*ERROR* failed to create dsi connector: -22
[drm:_dpu_kms_initialize_dsi:630] [dpu error]modeset_init failed for 
dsi[0], rc = -22
[drm:_dpu_kms_setup_displays:766] [dpu error]initialize_dsi failed, rc = -22
[drm:dpu_kms_hw_init:1283] [dpu error]modeset init failed: -22
msm_dpu ae01000.display-controller: [drm:msm_drm_kms_init [msm]] *ERROR* 
kms hw init failed: -22
Unable to handle kernel paging request at virtual address dead000000000108
Mem abort info:
   ESR = 0x0000000096000044
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x04: level 0 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[dead000000000108] address between user and kernel address ranges
Internal error: Oops: 0000000096000044 [#1]  SMP
Bluetooth: hci0: QCA Downloading qca/htnv20.bin
Modules linked in: snd_soc_wsa881x ax88179_178a(+) regmap_sdw usbnet 
ath11k_pci(+) ath11k q6asm_dai onboard_usb_dev q6afe_dai q6routing 
q6afe_clocks mac80211 libarc4 q6adm cfg80211 q6asm q6afe 
snd_q6dsp_common mhi q6core venus_enc venus_dec videobuf2_dma_contig 
imx412 apr mcp251xfd pdr_interface qcom_pd_mapper rpmsg_ctrl 
lontium_lt9611uxc(+) can_dev qrtr_smd nb7vpq904m rpmsg_char qcom_pdr_msg 
pci_pwrctrl_pwrseq fastrpc leds_qcom_lpg qcom_pbs snd_soc_sm8250 
snd_soc_qcom_offload_utils qcom_pmic_tcpm qcom_usb_vbus_regulator 
led_class_multicolor snd_soc_qcom_sdw tcpm snd_soc_qcom_common 
aux_hpd_bridge soc_usb qcom_spmi_adc_tm5 qcom_pon msm 
qcom_spmi_temp_alarm snd_usb_audio hci_uart qcom_spmi_adc5 snd_hwdep 
rtc_pm8xxx qcom_vadc_common ubwc_config btqca snd_usbmidi_lib qcom_camss 
venus_core gpio_shared_proxy btbcm snd_rawmidi ocmem videobuf2_dma_sg 
qcom_stats drm_gpuvm v4l2_fwnode drm_exec v4l2_mem2mem v4l2_async 
videobuf2_memops soundwire_qcom gpu_sched videobuf2_v4l2 soundwire_bus 
bluetooth videodev
  snd_soc_lpass_va_macro
mhi mhi0: Requested to power ON
  snd_soc_lpass_wsa_macro slimbus drm_dp_aux_bus videobuf2_common 
ecdh_generic snd_soc_lpass_macro_common ecc drm_display_helper rfkill 
spi_geni_qcom camcc_sm8250
mhi mhi0: Power on setup success
  i2c_qcom_cci mc llcc_qcom phy_qcom_qmp_combo snd_soc_core 
i2c_qcom_geni btrfs aux_bridge qrtr snd_compress typec icc_bwmon 
phy_qcom_qmp_usb qcom_refgen_regulator snd_pcm_dmaengine 
phy_qcom_snps_femto_v2 snd_pcm coresight_stm qcom_rng coresight_tmc 
qcrypto stm_core coresight_replicator coresight_funnel sha256 snd_timer 
pinctrl_sm8250_lpass_lpi coresight sha1 snd qcom_q6v5_pas 
pinctrl_lpass_lpi qcom_pil_info authenc libdes soundcore blake2b 
qcom_q6v5 libblake2b qcom_sysmon qcom_common xor qcom_glink_smem 
xor_neon pwrseq_qcom_wcn mdt_loader socinfo qmi_helpers qcom_wdt 
phy_qcom_qmp_pcie icc_osm_l3 display_connector pwrseq_core raid6_pq 
zstd_compress fuse dm_mod ipv6 libsha1
mhi mhi0: Wait for device to enter SBL or Mission mode
CPU: 5 UID: 0 PID: 271 Comm: (udev-worker) Not tainted 6.19.0-rc1+ 
#16433 PREEMPT
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
Bluetooth: hci0: QCA setup on UART is completed
pc : drm_atomic_private_obj_fini+0x24/0x70
lr : _dpu_kms_hw_destroy+0x4c/0x64 [msm]
...
Call trace:
  drm_atomic_private_obj_fini+0x24/0x70 (P)
  _dpu_kms_hw_destroy+0x4c/0x64 [msm]
  dpu_kms_destroy+0x28/0xb0 [msm]
  msm_drm_kms_uninit+0xb0/0xdc [msm]
  msm_drm_uninit.isra.0+0x54/0xd4 [msm]
  msm_drm_init+0x214/0x284 [msm]
  msm_drm_bind+0x30/0x3c [msm]
  try_to_bring_up_aggregate_device+0x168/0x1d4
  __component_add+0xa8/0x170
  component_add+0x14/0x20
  dsi_dev_attach+0x20/0x2c [msm]
  dsi_host_attach+0x58/0x98 [msm]
  devm_mipi_dsi_attach+0x34/0x90
  lt9611uxc_attach_dsi.isra.0+0x84/0x100 [lontium_lt9611uxc]
  lt9611uxc_probe+0x5ec/0x684 [lontium_lt9611uxc]
  i2c_device_probe+0x154/0x344
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0x40/0x164
  __driver_attach+0x9c/0x1ac
  bus_for_each_dev+0x74/0xd0
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x60/0x128
  i2c_register_driver+0x48/0xd0
  lt9611uxc_driver_init+0x20/0x1000 [lontium_lt9611uxc]
  do_one_initcall+0x64/0x308
  do_init_module+0x58/0x23c
  load_module+0x1b48/0x1dc4
  init_module_from_file+0xd4/0xec
  idempotent_init_module+0x188/0x280
  __arm64_sys_finit_module+0x68/0xac
  invoke_syscall+0x48/0x10c
  el0_svc_common.constprop.0+0xc8/0xe8
  do_el0_svc+0x20/0x2c
  el0_svc+0x50/0x2e8
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x198/0x19c
Code: d2802443 f2fbd5a4 f2fbd5a3 a9408402 (f9000441)
---[ end trace 0000000000000000 ]---



> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 1798d1156d10..4cfb7ebc0c81 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -624,6 +624,30 @@ static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
>   	return ret;
>   }
>   
> +static int vc4_hdmi_clear_infoframe(struct drm_connector *connector,
> +				    enum hdmi_infoframe_type type)
> +{
> +	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> +	struct drm_device *drm = connector->dev;
> +	int ret;
> +	int idx;
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return 0;
> +
> +	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
> +		    VC4_HDMI_RAM_PACKET_ENABLE),
> +		  "Packet RAM has to be on to store the packet.");
> +
> +	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
> +	if (ret)
> +		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
> +
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
>   static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
>   				    enum hdmi_infoframe_type type,
>   				    const u8 *infoframe, size_t len)
> @@ -1660,6 +1684,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
>   
>   static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
>   	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
> +	.clear_infoframe	= vc4_hdmi_clear_infoframe,
>   	.write_infoframe	= vc4_hdmi_write_infoframe,
>   };
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



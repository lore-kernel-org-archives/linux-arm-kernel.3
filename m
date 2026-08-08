Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED720C5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QV75BRbt2CB92kRO16SraDrNN/ZBOwKcH3HzU3OG5Bg=; b=oIQpbKcslO3887NXkXiKSb32xE
	i64M1HjQuJDW7YoduRXZ1wx70MKunIdXjLRgif4l+kneFcPoi4EXgDxxcII+feA4GwYxocm4e/iIo
	CtoHJl7QJDq3woiGW7dwGWEPzx3RKVjQ2LiDP7KNG9OloQPNp1UG43LNkrqapUY7mhlF4McG9dgx8
	nSic9RzjJqUERoHdYTHrpP/p71WgW0sfV3dVODPREdy80fbJZ38mQtPkuCAv4QEhP4k4vLb7dXcl+
	Q8/ZBK+lxcCG5S1d7mAfLyO+OZVvXFM3mNkMKE5NkD4W/H/UjLuaTFHRIA3TeKtYKWEjhWjHEQqpy
	CMhfyJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscfY-00000009B9r-42d4;
	Sat, 08 Aug 2026 08:44:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscfV-00000009B9R-3Kml;
	Sat, 08 Aug 2026 08:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786178664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O6o7PvYQedvv2uZu/FYjSAGqHs9cr5r7uOP0d4fpnDK2VsirmnAGBTPuxeLwV/ZFlEpHoQc78SMfVXEZy/ZqBbemIwdzgZyfpfIwXdZOlEKZpfBJdiG1/+T2EgxWFU6RSM9HaUMugvisETBLb9nyBx3SJ3DvtJMbNeQPVMno0G0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786178664; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QV75BRbt2CB92kRO16SraDrNN/ZBOwKcH3HzU3OG5Bg=; 
	b=NYNm/DURxkB+kI6lL5Dms2AGw+H7q3UR/pNsln03WwLt8VzgMxR+CCGI5dltb0nn2ENJEDt8YUx9qDqPf+kZHx0Mp5c+bx0GZmC0nfoII2/s3o69lRlkQV7NceAmMCJoeiQJLT1YgNi5XHR/FmUKhZvUxcjfelpZhCSe3vbfSXI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786178664;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QV75BRbt2CB92kRO16SraDrNN/ZBOwKcH3HzU3OG5Bg=;
	b=OLWW+BCEJLD5jvXpKNmbCWfxuGclnyFBgzRXyGve9X6bDVHUSNtU9RO7fFfYqH4r
	6nU0xa2rASlwA+YvOPiEb1l50c9I2yfYU198wr1IpcYAwtHGfFnb+qF1TNk+zZ/RRlP
	BoLtN6YeK+0z3R3kDUECkZwKU3pOnnrW22wQJVm0=
Received: by mx.zohomail.com with SMTPS id 1786178662065837.6873440277666;
	Sat, 8 Aug 2026 01:44:22 -0700 (PDT)
Message-ID: <db32b01d-66f5-4ba0-8697-a0bde9e230cf@collabora.com>
Date: Sat, 8 Aug 2026 10:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: defconfig: enable Rockchip Multimedia drivers
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20260808-rockchip-defconfig-additions-v3-1-0ed67877e94d@collabora.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260808-rockchip-defconfig-additions-v3-1-0ed67877e94d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_014437_869689_6EDBC91F 
X-CRM114-Status: GOOD (  18.74  )
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

Hi Sebastian,

Thanks for the patch!

On 8/8/26 02:42, Sebastian Reichel wrote:
> Enable multimedia related drivers used by the Radxa ROCK 5B (used as an
> example, the config options are relevant for most Rockchip RK3588 and
> RK3576 boards), so that all hardware is supported by the default config.
> 
>  * Synopsys MIPI CSI2RX - RK3588 CSI2 Controller
>  * RKVDEC - RK3588/RK3576 video decoder for H.264 and H.265
>  * Sony IMX415 - Sensor used by the Radxa Cam 4K module
>  * Rocket - RK3588 NPU driver
>  * Verisilicon IOMMU - IOMMU used by RK3588 AV1 video decoder
>  * Innosilicon CSI D-PHY - RK3588 CSI PHY (one of them)
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

In particular for the camera/video capture side of it:

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
> Changes in v3:
> - Link to v2: https://patch.msgid.link/20260807-rockchip-defconfig-additions-v2-1-cbb8eef87be6@collabora.com
> - Also add CONFIG_VIDEO_DW_MIPI_CSI2RX=m and update commit message
> 
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com
> - Squash all patches (Krzysztof Kozlowski)
> 
> The Verisilicon IOMMU defconfig change has previously been sent by
> Benjamin as part of the IOMMU series, but did not reach upstream:
> 
> https://lore.kernel.org/all/20260415072349.44237-6-benjamin.gaignard@collabora.com/
> 
> The Synopsys CSI controller defconfig change has previously been sent
> by Michael as part of the driver series, but did not reach upstream:
> 
> https://lore.kernel.org/linux-rockchip/20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com/
> ---
>  arch/arm64/configs/defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 654a102cb5bc..49f836ba67a5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -915,6 +915,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
>  CONFIG_V4L_MEM2MEM_DRIVERS=y
>  CONFIG_VIDEO_AMPHION_VPU=m
>  CONFIG_VIDEO_CADENCE_CSI2RX=m
> +CONFIG_VIDEO_DW_MIPI_CSI2RX=m
>  CONFIG_VIDEO_WAVE_VPU=m
>  CONFIG_VIDEO_E5010_JPEG_ENC=m
>  CONFIG_VIDEO_MEDIATEK_JPEG=m
> @@ -939,6 +940,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
>  CONFIG_VIDEO_RCAR_DRIF=m
>  CONFIG_VIDEO_ROCKCHIP_RGA=m
>  CONFIG_VIDEO_ROCKCHIP_CIF=m
> +CONFIG_VIDEO_ROCKCHIP_VDEC=m
>  CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
>  CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> @@ -949,6 +951,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
>  CONFIG_VIDEO_HANTRO=m
>  CONFIG_VIDEO_IMX219=m
>  CONFIG_VIDEO_IMX412=m
> +CONFIG_VIDEO_IMX415=m
>  CONFIG_VIDEO_OV5640=m
>  CONFIG_VIDEO_OV5645=m
>  CONFIG_VIDEO_S5KJN1=m
> @@ -1063,6 +1066,8 @@ CONFIG_BACKLIGHT_GPIO=m
>  CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_MONO is not set
>  # CONFIG_LOGO_LINUX_VGA16 is not set
> +CONFIG_DRM_ACCEL=y
> +CONFIG_DRM_ACCEL_ROCKET=m
>  CONFIG_SOUND=m
>  CONFIG_SND=m
>  CONFIG_SND_ALOOP=m
> @@ -1611,6 +1616,7 @@ CONFIG_ROCKCHIP_IOMMU=y
>  CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_APPLE_DART=m
>  CONFIG_MTK_IOMMU=y
> +CONFIG_VSI_IOMMU=m
>  CONFIG_REMOTEPROC=y
>  CONFIG_IMX_REMOTEPROC=y
>  CONFIG_MTK_SCP=m
> @@ -1785,6 +1791,7 @@ CONFIG_PHY_RZ_G3E_USB3=m
>  CONFIG_PHY_ROCKCHIP_EMMC=y
>  CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
>  CONFIG_PHY_ROCKCHIP_INNO_USB2=y
> +CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=m
>  CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=m
>  CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m
>  CONFIG_PHY_ROCKCHIP_PCIE=m
> 
> ---
> base-commit: 2d578cd590adc2133aa24496afcd7c3f7f9ba36a
> change-id: 20260806-rockchip-defconfig-additions-3ef855c4d32e
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>
> 



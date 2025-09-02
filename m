Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAADCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9AN+5V0g7vIUCzNGDoPZQbgjwt0oGtbWkVLcxxUCEE=; b=O1GcUGe/3Dt1IX1o9DptNeK8Lg
	Lg+t/pyeTeYlGJJ14JjUYpfc3r/xuthzCKbmaQHsjSEft2BRWZS95t8C5xEc89GvJGrvUnkJFbZIZ
	MhCunxwLmIDSTxwOw4+hkmArdux7MSBenw/NfLF1oP7zEjxIZX92h2eIhejhZsJI900w87WEYW4vE
	d5NZ6R5vflnlyY3kSXNXQzK7X5bFrEOlUZIriqc9PrOfq362VJqoGUI5wqEl6flkALrALCH6miqqJ
	o47/I8xvNsIwQFovf6kmW5FXtJFfc+Qpev1Ftzj5QUiIj6YYFEiMuB6NbXqFnO9XCirGjvxC95Hd8
	N5TcnPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYlv-00000002AIp-16fd;
	Tue, 02 Sep 2025 21:42:35 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQxx-000000000iw-0Orn;
	Tue, 02 Sep 2025 13:22:30 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582D9Gx4024544;
	Tue, 2 Sep 2025 15:22:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	s9AN+5V0g7vIUCzNGDoPZQbgjwt0oGtbWkVLcxxUCEE=; b=u84S6j7vGFoTzNcx
	nujLMQXT3/vtxSG6iDshDSA9qIaiCXruRuPNuPBHboHE+oGEuu4ePIDpbZzZOrKI
	79lKv/JcTr/OATQHaQI56QsHoPfGi5/tiQkO6WxVVIssVDOcundllXj+qwci3sMW
	15gtEvfRf/6Ya1U51nJUeE6fkVC5w1v3er8yz3L+etAttvSApAuLVvCKQ99y27iZ
	qW3lazu3akpqFkxDHL8X36t2XJ/4GkTNO6ddI9uynDt3q2+aW1fFEs9UZeuIDmwm
	n9gtDibUd3tOm2KX0ZK3M7q332RV7QXpuwqzKE322Ywwa92XD48VEOxr6xo4XFi9
	lcBqnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxcaap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 15:22:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4298340045;
	Tue,  2 Sep 2025 15:20:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89B513AD3AF;
	Tue,  2 Sep 2025 15:19:27 +0200 (CEST)
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 15:19:26 +0200
Message-ID: <50e3f25c-f4e1-40f6-8e36-23193863f1ee@foss.st.com>
Date: Tue, 2 Sep 2025 15:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan
	<andy.yan@rock-chips.com>
CC: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        Matt Roper <matthew.d.roper@intel.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062229_414590_2EE0061C 
X-CRM114-Status: GOOD (  28.48  )
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



On 9/2/25 11:27, Cristian Ciocaltea wrote:
> Some display controllers can be hardware-configured to present non-black
> colors for pixels which are not covered by any plane (or are exposed
> through transparent regions of higher planes).
>
> The first patch of the series introduces the BACKGROUND_COLOR DRM
> property that can be attached to a CRTC via a dedicated helper function.
> A 64-bit ARGB color value format is also defined and can be manipulated
> with the help of a few utility macros.

Hi Cristian,

Thanks for this work ! :)

FWIW I sent a series also based on Matt's work four years ago:
https://lore.kernel.org/dri-devel/20210707084557.22443-2-raphael.gallais-pou@foss.st.com/

IIRC at the time there was some questions around the pixel format used for the
property, and non-opaque color vs alpha pre-multiplication.
Mind that on STM32MP platforms alpha channel for the background color is not
supported.

Hope the thread can bring some insights.

Best regards,
Raphaël
>
> Note this is a reworked version of the patch [1] submitted (many) years
> ago by Matt Roper.  The main changes are:
>
> * Dropped drm_arg() in favor of drm_argb64() to get rid of the bpc
>   parameter and the related shifting for more flexibility in operation,
>   e.g. when user-space cannot make use of the helper and/or when it
>   doesn't now the actual precision supported by the HW.  This also
>   simplifies the property verification/validation testing (see below).
>   It works by extracting the specified number of least-significant bits
>   from each color component.
> * Renamed DRM_ARGB_*() to DRM_ARGB64_*_LSB() while providing convenience
>   wrappers to extract all 16 bits of a specific color via DRM_ARGB64_*()
> * Replaced GENMASK_ULL(63, 0) with U64_MAX when calling
>   drm_property_create_range() to create the BACKGROUND_COLOR property
> * Moved crtc_state->bgcolor initialization from
>   __drm_atomic_helper_crtc_reset() to
>   __drm_atomic_helper_crtc_state_reset()
> * Replaced '*bgcolor*' occurrences to '*background_color*' for
>   consistency with the actual property name in both storage field and
>   helper functions names
>
> The second patch adds background color support to the VOP2 display
> controller used in the RK3568, RK3576, and RK3588 Rockchip SoC families.
>
> For the moment this has been validated using a modetest wrapper script
> [2], which is able to execute several tests - see an example of a
> generated report at the end.  Proper support in Weston is currently in
> development, and I will provide a reference once it becomes available.
>
> The tests were performed on the Radxa boards listed below.  Please note
> that as of next-20250901, there are a few known regressions; for each
> case, I mentioned the actual problem and its related fix/workaround
> accordingly:
>
> * ROCK 3A (RK3568)
>  - issue: broken networking
>  - fix: revert commit da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make
>    the clk_phy could be used for external phy")
>
> * ROCK 4D (RK3576)
>  - issue: random freezes right after booting
>  - fix: add regulator_ignore_unused to kernel cmdline
>
> * ROCK 5B (RK3588)
>  - issue: broken networking
>  - fix: apply patch [3]
>
> [1] https://lore.kernel.org/all/20190930224707.14904-2-matthew.d.roper@intel.com/
> [2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/drm-vop2-bgcolor-test
> [3] https://lore.kernel.org/all/20250827230943.17829-1-inochiama@gmail.com/
>
> Validation report on ROCK 5B
> ============================
>
> $ tools/testing/rk-bgcol-test.sh
>
> ---------------------------------------------------------------
>  Available Rockchip display connectors
> ---------------------------------------------------------------
> id	type	status	crtc_id	plane_id
> 85	11	2	0	34
> 88	11	1	83	40
>
> Selected connector: id=88 crtc=83 plane=40
>
> ---------------------------------------------------------------
>  Check initial state
> ---------------------------------------------------------------
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
>     Connector: HDMI-A-2
> 	background color (10bpc): r=0 g=0 b=0
>
> ---------------------------------------------------------------
>  Set/get DRM property
> ---------------------------------------------------------------
> Changing prop value to: 0xffff00000000ffff
> opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
>     Connector: HDMI-A-2
> 	background color (10bpc): r=0 g=0 b=ffff
>
> ---------------------------------------------------------------
>  Plane display test 40@83:960x540+480+270
> ---------------------------------------------------------------
>
> Changing prop value to 0xffffffff00000000
> Press ENTER to continue..
> opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
> testing 960x540@XR24 overlay plane 40
>
> Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
>     Connector: HDMI-A-2
> 	background color (10bpc): r=ffff g=0 b=0
>
> Changing prop value to 0xffff0000ffff0000
> Press ENTER to continue..
> opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
> testing 960x540@XR24 overlay plane 40
>
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
>     Connector: HDMI-A-2
> 	background color (10bpc): r=0 g=ffff b=0
>
> Changing prop value to 0xffff00000000ffff
> Press ENTER to continue..
> opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
> testing 960x540@XR24 overlay plane 40
>
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
>     Connector: HDMI-A-2
> 	background color (10bpc): r=0 g=0 b=ffff
>
> ---------------------------------------------------------------
>  Restoring state
> ---------------------------------------------------------------
> Changing prop value to: 0xffff000000000000
> opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
>     Connector: HDMI-A-2
> 	background color (10bpc): r=0 g=0 b=0
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (2):
>       drm: Add CRTC background color property
>       drm/rockchip: vop2: Support setting custom background color
>
>  drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c            |  4 +++
>  drivers/gpu/drm/drm_blend.c                  | 37 +++++++++++++++++++++++++---
>  drivers/gpu/drm/drm_mode_config.c            |  6 +++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 +++++++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +++
>  include/drm/drm_blend.h                      |  4 ++-
>  include/drm/drm_crtc.h                       | 12 +++++++++
>  include/drm/drm_mode_config.h                |  5 ++++
>  include/uapi/drm/drm_mode.h                  | 30 ++++++++++++++++++++++
>  10 files changed, 110 insertions(+), 6 deletions(-)
> ---
> base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
> change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc
>



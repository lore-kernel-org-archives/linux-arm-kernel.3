Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A2D489BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S49y2L4gD63j6L5j9pyo9jE88T6ardth6Lb6pcKfHeg=; b=geD+Az040INCoyy9HGpqASULpn
	ovTh1oFET7mZpZ4qJrk6ENKIAwMLkJNFsr8y0r6TisV25cXWJxpaAHDKXeCq4JWJwaGmQaQYn2HKo
	Q5nLrEuAB/D2PNR9OAVTDC3CeRs3O8uFNPk9nqZqwIkbYNtWDlmo2Ov8unJJ1gEZbYnb+bNcjBGJL
	VrlMAV7hHkhgrQxrs3vk4A2lhP+/JmV1KuxqRc6H/N6MYrUCXhodU4rl5MyUQyDdgviKShREQyHnK
	UdebX+58Mcv+m9yJK526AZtsUmSxR59MjetjsWIYS9GgQMWlXUvXiTh1lcz8Noea57tzpjX48YRR8
	H0FeDAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikPu-00000006KNo-0Nuo;
	Thu, 22 Jan 2026 02:27:26 +0000
Received: from mail-m82213661.xmail.ntesmail.com ([8.221.36.61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vikPp-00000006KNJ-36MM;
	Thu, 22 Jan 2026 02:27:23 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 318612bcb;
	Thu, 22 Jan 2026 10:27:15 +0800 (GMT+08:00)
Message-ID: <8e770288-f29b-4e72-b5a6-e3cfd77b87fb@rock-chips.com>
Date: Thu, 22 Jan 2026 10:27:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Rockchip DRM use-after-free & null-ptr-deref fixes
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9be387049103abkunm77d59df1bb420
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9OTFZLSRgfSElLGkoaTUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=I92+oDEgnhBj/xd19A1BnS+A6cqHFKTL38BIABnUxSdl1aNhq9t2J9vngMWKoJfjXkmkjLddbyv9G0fUmx2KjJg6a4Gdgq6zqv9BTh9pD64IuRiGOQ+4TdxbGOH5xX6gEvENNT3Vkulj7X1U8UA/rI4huZzfmJ2gIrurHe946ks=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=S49y2L4gD63j6L5j9pyo9jE88T6ardth6Lb6pcKfHeg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_182722_498150_BA6DE2F1 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

Hi Cristian,

On 1/22/2026 7:17 AM, Cristian Ciocaltea wrote:
> The first three patches in the series are fixes for use-after-free &
> null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
> drivers.
> 

Have you tried calling unbind() and bind() multiple times? 
In this case, can DRM still work properly?

> The remaining ones provide a few minor improvements to dw_dp and
> dw_hdmi_qp.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (6):
>       drm/rockchip: inno-hdmi: Switch to drmm_kzalloc()
>       drm/rockchip: dw_dp: Switch to drmm_kzalloc()
>       drm/rockchip: dw_dp: Fix null-ptr-deref in dw_dp_remove()
>       drm/rockchip: dw_dp: Simplify error handling
>       drm/rockchip: dw_dp: Drop unnecessary #include
>       drm/rockchip: dw_hdmi_qp: Switch to drmm_encoder_init()
> 
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c      | 35 ++++++++++----------------
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 +++++-----
>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c  |  3 ++-
>  3 files changed, 21 insertions(+), 30 deletions(-)
> ---
> base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
> change-id: 20260122-drm-rk-fixes-a7622c71553e
> 
> 
> 
> 
-- 
Best, 
Chaoyi


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6604CCD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 17:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KOKsw71E6GZdJzTzoVwlKCoJhLgUSQVcRLLZNcFO5I=; b=wT4Enrk6P4S4BVNRCaMOVmzs2Y
	1tCYGecMUHUiNJHxG6pmUURTcYxEhNQSCKrmnarZJ3tSQkaVbk4mfnZ8+sHPO9nW2le0ps4r8PMVB
	3Z022FK6nWXLu5SAPASd5jTI0LlGzeUfFHzvAnL9n4wDHIbeKIFYHfxLiiW8N80u1HHWDJ3v4v08G
	c5lv7g/0FCWY9owEjwpzKth9XOMwAFIged2LRa/ASI+5VNQVp1HOx7HPNBEx6ttdR8m0X2OUoMx78
	IPYSr/J1YapXDH78z3F4JTnqjCcIqTOcxLuK+kt3vWInsPmwUNIqtMJL/TIfGaiTIW4Iy1wyYL8Iz
	Y/PpV/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWGsG-00000002M69-1k1O;
	Sun, 07 Jun 2026 17:01:24 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWGsD-00000002M5O-0Vbu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 17:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1780851678;
 bh=/KOKsw71E6GZdJzTzoVwlKCoJhLgUSQVcRLLZNcFO5I=;
 b=qtgAhbYINp3UG73MeqbESMFO5oIlJm3U0XowpJpZYoUQCph37W1RKKHijpV+e1dsLd7vf3ecZ
 WJICJLHD6Lewwq6A18CQEfVgLBuLxpCXlSj/RIaUPjIdpnCnFMT0T0oPxq5N2zsUzBPJeIc7W8Q
 UfgKU9FeBM5N+IMf6Iur+A0BMUgbYqJrlybS3pw0otm8nc05LnympCE/OJDfiwOHAndm7dFCwov
 D6QvCFnnvJH/oju6bDt5YiRCUX/SQPLIMgxdVV1fcEbi3L4pzQhneb1zsR/AFzNibnvF7q6RjJZ
 NpiYwWZKpjV4AJsEZ45Ou23kTzG8EbDZCSdqGMyLCdeA==
X-Forward-Email-ID: 6a25a3da9dabeed5113106ce
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.22
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <c8f30973-450e-4995-b6f5-03e7b6afc75b@kwiboo.se>
Date: Sun, 7 Jun 2026 19:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rockchip: dsi: Open-code drm_simple_encoder_init()
To: Diogo Silva <diogompaissilva@gmail.com>, heiko@sntech.de
Cc: airlied@gmail.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
References: <5277524.h16uAIiOU7@phil>
 <20260607123739.393974-2-diogompaissilva@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260607123739.393974-2-diogompaissilva@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_100121_524788_D9240875 
X-CRM114-Status: GOOD (  16.24  )
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

Hi Diogo,

On 6/7/2026 2:37 PM, Diogo Silva wrote:
> Simple KMS helper are deprecated since they only add an intermediate
> layer between drivers and the atomic modesetting.
> This patch removes the dependency on drm_simple_encoder_init from rockchip
> DRM drivers by inlining this helper.
> 
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  | 9 ++++++---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c           | 9 ++++++---
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c  | 9 +++++++--
>  drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 8 ++++++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c      | 8 ++++++--
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c   | 8 ++++++--
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c           | 8 ++++++--
>  drivers/gpu/drm/rockchip/rockchip_lvds.c         | 9 +++++++--
>  drivers/gpu/drm/rockchip/rockchip_rgb.c          | 8 ++++++--
>  9 files changed, 56 insertions(+), 20 deletions(-)

[snip]

> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index 0dc1eb5d2ae3..906264d65db3 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -16,7 +16,6 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  
>  #include "rockchip_drm_drv.h"
>  
> @@ -322,6 +321,10 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
>  	return 0;
>  }
>  
> +static const struct drm_encoder_funcs dw_hdmi_rockchip_encoder_funcs = {
> +	.destroy    = drm_encoder_cleanup,
> +};
> +
>  static const struct drm_encoder_helper_funcs dw_hdmi_rockchip_encoder_helper_funcs = {
>  	.mode_fixup = dw_hdmi_rockchip_encoder_mode_fixup,
>  	.mode_set   = dw_hdmi_rockchip_encoder_mode_set,
> @@ -604,7 +607,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>  	}
>  
>  	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);
> -	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> +	drm_encoder_init(drm, encoder, &dw_hdmi_rockchip_encoder_funcs,
> +			 DRM_MODE_ENCODER_TMDS, NULL);

Please base your work on latest drm-misc tree, this has already been
addressed in commit 3de723684be5 ("drm/rockchip: dw_hdmi: Use drmres
helpers for encoder resources") [1].

Also instead of open-code, maybe a change to use drmm_encoder_init() is
more appropriate for some of the other drivers?

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3de723684be5c13517dea3dba287d06e12678c86

Regards,
Jonas

>  
>  	platform_set_drvdata(pdev, hdmi);
>  

[snip]


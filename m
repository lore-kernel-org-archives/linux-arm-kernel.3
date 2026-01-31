Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67A6D79763
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mARx+b1Q3aoFUp5NQEI2ofWrMi9GfyBXAGYq1ttozEQ=; b=ub1zDiMOjXk+CZqnvrdPpP246L
	gzrQcQIbXOUGWb2NkcblCoEUWV+lEiJQbLjf5Nc6Ue+Y1tv/LGOF8I9d9rA/CVTIrtR/HQ1eGZ2cF
	6LaOy8YlwatLEz/AeHxMyd15yZ22T1G8GeD+WF+fFMwOV6vFr+CSNzsWjrMClZb4bDcyujrMv+XbF
	ouo5+d8hgCke7ys/Db5xMEX0z2B4TmGdiQKvF6R3oOiRnSGK0WCY3gMYNZq6zMR+pp4TyJuaNR72Q
	U+ccZmSkiMDX5x/8G3bt9FEmHWxzill0YpzhdFymX0/AMcVmOmPEe3FZ0ZsZOx0Otmv4b3jOlg6GY
	Z0it70pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm6JF-00000002QWA-1iUg;
	Sat, 31 Jan 2026 08:26:25 +0000
Received: from mail-m32100.qiye.163.com ([220.197.32.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm6JA-00000002QVe-34DH;
	Sat, 31 Jan 2026 08:26:23 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32a4eb17c;
	Sat, 31 Jan 2026 16:26:11 +0800 (GMT+08:00)
Message-ID: <4855e4f6-a5ab-4735-9808-83c4adf306a5@rock-chips.com>
Date: Sat, 31 Jan 2026 16:26:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/rockchip: cdn-dp: add missing check in
 cdn_dp_config_video()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <adf6b313-f7db-4d8f-9000-8c65446ba041@auroraos.dev>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <adf6b313-f7db-4d8f-9000-8c65446ba041@auroraos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9c1328dda603abkunm096245786fd915
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgZSFYeT0IZTxpPHU5PGk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BtCPt0Kpcz5TawjOxWrSNM1ajfmdQduEdCw8S/PIiCtJPzcDdwTNDMRZy61Kh8jK/pjOox4RcthoLIG/zFZbkyhMjlRcnaKFaehbNo8oY3yirP6kr1DP8+9eQuX+zWI+/hhT3G5g1zyTFD0e86rwvLInsy6PfcAFyiXAKinnbNQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=mARx+b1Q3aoFUp5NQEI2ofWrMi9GfyBXAGYq1ttozEQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_002621_297741_746F268E 
X-CRM114-Status: GOOD (  16.60  )
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

On 1/31/2026 4:35 AM, Sergey Shtylyov wrote:
> The result of cdn_dp_reg_write() is checked everywhere (with the error
> being logged by the callers) except one place in cdn_dp_config_video().
> Add the missing result check, bailing out early on error...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 1a0f7ed3abe2 ("drm/rockchip: cdn-dp: add cdn DP support for rk3399")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> Cc: stable@vger.kernel.org
> ---
> Either we need to add the check or drop the assignment to the ret variable
> as the value gets ignored anyway...
> 
> The patch is against the drm-misc-fixes branch of the DRM kernel.git repo
> on gitlab.freedesktop.org.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> index 0dc3804051a9..9b82b27770e5 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> @@ -685,6 +685,8 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
>  	val = div_u64(8 * (symbol + 1), bit_per_pix) - val;
>  	val += 2;
>  	ret = cdn_dp_reg_write(dp, DP_VC_TABLE(15), val);
> +	if (ret)
> +		goto err_config_video;
>  
>  	switch (video->color_depth) {
>  	case 6:

Not sure why this was resent, but it looks good to me :)

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi


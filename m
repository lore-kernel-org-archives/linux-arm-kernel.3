Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC303CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 05:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5V5bu8wkVupwenl9kEt3EBNU8qJQmy9AXZs1gAf63t4=; b=oBgca1d1NBOww1IihOug4qRYh3
	uHYxlwaswB2mb03Wg8ldn11Z2/BIig0jWvZZ4Oynr9x/q3rKkLE9gqMIozxMfoKkkiEZS23JhafDH
	p9Q50Q7E6I+q4P1REvc3zf8bBQV+AasnBwCyqgO/qjg/8bK7TAETHKARH/OJakFys4tPWpda7QTWo
	4ESOeVYVGscVoa56WJmxiIS6Ypw3KOdCi54UDkzcVxWPcRvO/JZoLMnNnFyzUzQdSxbFN/wkorX+c
	S0zaqU/fa29B2SsMowARCIZnTNd8A1L07Ft85AV3IeXLJ6UaiwCXANoQ8NUlKpCyzcQIiCLNJhqEJ
	CdvsyCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLaON-00000008JsV-3bKO;
	Sat, 09 May 2026 05:38:23 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLaOL-00000008Jre-0Pr8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 05:38:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778305095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5V5bu8wkVupwenl9kEt3EBNU8qJQmy9AXZs1gAf63t4=;
	b=XAW7qdfOIy5LLS+BTo7puF2YCVhJIuaCojxqMd05ujk61bqCA0XWrYdz0O3eelGXYByVWr
	wUZVI417lKey6DWb8pW4IgevbJivmj/tvgpoF+Iv2zVwgb4xi0TP7GiytKE0YCzhW+UBpN
	ml8YbgAmM+ybJPAwCOFEHhh3om2uj8U=
From: Fushuai Wang <fushuai.wang@linux.dev>
To: shijiaqi_develop@163.com
Cc: airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	p.zabel@pengutronix.de,
	Fushuai Wang <fushuai.wang@linux.dev>
Subject: Re: [PATCH 3/6 v2] drm/rockchip: Fix vop2_create_crtcs() error path cleanup in vop2_bind()
Date: Sat,  9 May 2026 13:37:37 +0800
Message-Id: <20260509053737.54007-1-fushuai.wang@linux.dev>
In-Reply-To: <177830024278.246051.2541513211000360573@openclaw.local>
References: <177830024278.246051.2541513211000360573@openclaw.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_223821_604960_D52A2033 
X-CRM114-Status: UNSURE (   8.82  )
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

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 8afabe2118a9..1234567890ab 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2735,7 +2735,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  
>  	ret = vop2_create_crtcs(vop2);
>  	if (ret)
> -		return ret;
> +		goto err_crtcs;
>  
>  	ret = vop2_find_rgb_encoder(vop2);
>  	if (ret >= 0) {
> --

Hi, Jiaqi.

Reviewed-by: Fushuai Wang <fushuai.wang@linux.dev>

-- 
Regards,
WANG


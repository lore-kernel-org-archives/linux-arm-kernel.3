Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC899D41D52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 05:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R6RFITEAfd0sEPRCenCrgwW5P/A6psdLfL1diuTzag=; b=ftOJxtq21Wun1DEd/S9ciJ8+nn
	jvUjY6pn01AU50gpbYcuS+auFTPQXZeb9wNpeEDckXdqv3LkYfEm5NB9nRiigT0A+whBXe/iHI2Ba
	o6L3j9TmW2sZ3Z9+LbyNOtWgllthXJN5My+AHY9L6IsO+xbsVYgzXj9s1sFTzUZMgboRGg5UWkooN
	EXjjVwnDaMTBHVpvRhCfA0IwZ7x68o7dzaA4G0jCONfEBrdcyVb/vIhR/teJ7kmskDMTKGS3zuiUs
	BFNZ45NN4JQToV7SCAfhjrGDljLYU0U/BzJzfTGlANvhffNMicmoJZst7RZf6XcfL45QvkUBO0sfo
	i2ORfDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjTS-00000002Fv1-48hO;
	Tue, 12 Nov 2024 05:29:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjRg-00000002FlU-1kBM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 05:28:09 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E50EC512;
	Tue, 12 Nov 2024 06:27:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731389271;
	bh=CB5Mstp2qxKyukg8FzhUAeWs09g1Ok4GO9m7FzDj240=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4UPWU9WZ9q+u5oGMGpQuri/yg8akGIPgpNvz6U3Eb7KkeSnEv4REAk+0wYl23lWR
	 D8bHCCLH+ttHxcfEHWMkMuIMGZEaxlNjVBgqeGO5tl2avZy/NVGSFvW5nYZYzpYReP
	 xq2l8/yixOXh8xtVTM703gzH1n1/RAtR+2BUZWIo=
Date: Tue, 12 Nov 2024 07:27:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
Message-ID: <20241112052754.GB21062@pendragon.ideasonboard.com>
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_212808_606553_46905399 
X-CRM114-Status: GOOD (  15.98  )
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

Hi Dan,

Thank you for the patch.

On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
> We added some locking to this function, but accidentally forgot to unlock
> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
> 
> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
you've added in a7d5eeaa57d7 with guards ?

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 25c5dc61ee88..0bea908b281e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1537,7 +1537,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  	pm_runtime_get_sync(dp->dev);
>  
> -	mutex_lock(&dp->lock);
> +	guard(mutex)(&dp->lock);
>  	zynqmp_dp_disp_enable(dp, old_bridge_state);
>  
>  	/*
> @@ -1598,7 +1598,6 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
>  			ZYNQMP_DP_SOFTWARE_RESET_ALL);
>  	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
> -	mutex_unlock(&dp->lock);
>  }
>  
>  static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,

-- 
Regards,

Laurent Pinchart


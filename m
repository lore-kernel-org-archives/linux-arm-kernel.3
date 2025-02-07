Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E39C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nR7+l5TP9yp3YgFbF/EQuTciZ5yaR2/IiV3265EZ/Pc=; b=zD9wWbos3spsLPTu71tWgDACh7
	wtzC8jAbhUTzG+fc3/8KdmfQQIJlKgwWvF07+/Y10KjYDa4TBJdF40poOoQ+bcL4C4eMC9a9HuCTJ
	uV6kGWsKmhoEtiS7zmkrPdG27lvhKHTh5SiQZkkDAjRyc2aHBTSDyJJQ8vaJcsNOmp1fC7RJ+DKG/
	djSJbmhcs7SLA0AByF9T9bL8DrRHmakctq4Lw+zLIWXC1fy9Il7vW0BnFDbNBeFldNi/MqCCA80g7
	CRhg01CCnoN++x7bWNSrbwgnjwICIELuj/ukxQPvsM1ndSj4isVGPPZrw74UkKzlJW/NxstCC0iHK
	LkvO2s5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRdS-0000000ANJC-2VrG;
	Fri, 07 Feb 2025 16:55:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRIG-0000000AJ9p-18fp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:33:29 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 436442BA;
	Fri,  7 Feb 2025 17:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738945929;
	bh=N2uS9yWPLD4E6ZHEuCHhrIKMkX02v4Rz8ruwE/3Kq40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qs3BCIO9noT5nVvOJY1+N8hSoVlybPDgYi+8fhLhLTLdudUtUI9LGIaNlkX0IfTGI
	 nQE9OAUWaj2ccAfl6PV6vBnjK4pqeYLt4XtjtVj0uTEkrGbhFaCxKP1hNNWUF9mKAM
	 RnQKXWodw5LuGpOKWkH3ffHekxGcesVWrYcf58bQ=
Date: Fri, 7 Feb 2025 18:33:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	"open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] drm: zynqmp_dp: Fix a deadlock in
 zynqmp_dp_ignore_hpd_set()
Message-ID: <20250207163317.GA5869@pendragon.ideasonboard.com>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
 <20250207162528.1651426-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207162528.1651426-2-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_083328_444639_E4AFA80D 
X-CRM114-Status: GOOD (  17.76  )
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

Hi Sean, Bart,

Thank you for the patch.

On Fri, Feb 07, 2025 at 11:25:27AM -0500, Sean Anderson wrote:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> Instead of attempting the same mutex twice, lock and unlock it.
> 
> This bug has been detected by the Clang thread-safety analyzer.
> 
> Cc: Sean Anderson <sean.anderson@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 979f6d3239ba..189a08cdc73c 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2295,7 +2295,7 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
>  
>  	mutex_lock(&dp->lock);
>  	dp->ignore_hpd = val;
> -	mutex_lock(&dp->lock);
> +	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart


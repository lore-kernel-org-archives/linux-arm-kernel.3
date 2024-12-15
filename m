Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F39E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5OOMlKh31D8qg/p6VzUOOKKvtXI2JbyoZbCFo7ynIs=; b=nSOIn32S6/GkZw/W8lk9wkgP0N
	2ymyI5czAenl1EI/klUdZK0oFgJQZtO1CxcYzGM/0SsZWiFzcBJ2+YFliqSkzpHvQ4DY7CiNzHJNp
	DJ8HgQB3EhDXzH1aYsGSAKUdnGbfQulgRSBJuSbveH2ZACxUO/nxK0N/kTRBgoMQPakIuJptUg7LE
	WbKao9pBGFFcQ1F5F1GDq26ZlkiETv1IQ/o++hP6/aLgEi75OJeOo2cq7L+L+elN2d7MEeW4j6Lcg
	DgK2VKk4HePgvrnx29Rl0UHfWwdnl/4po+Zo4XGKzop8qQJ80QBMouY0xjfUbrNYVa9u21AH6zDT2
	eyNUpJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMoS5-00000007x0k-480w;
	Sun, 15 Dec 2024 13:14:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMoQy-00000007wvM-3laM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 13:13:22 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A454A57;
	Sun, 15 Dec 2024 14:12:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734268359;
	bh=oVsaFywUpOuv+msqvVac4ISm2LdrnqEXWubTqo/CYlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgdALH13Od9P2Xwxw2tffH3ewbTXorof9YJ0zEZTayP4/AuuA7GBo9G1Qu/tQ4O9D
	 /4pgzVcnY/NLA+WsSi2IBCkvs/iqRuT/PXRktwTYBncCEVo0yt7+QwCjxx19LQkaGi
	 eGx5eqBzNm7eH10t/R2GXEqEgtcMdu8NG17/3GQA=
Date: Sun, 15 Dec 2024 15:12:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, michal.simek@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCHv3] drm: zynqmp_dp: Fix integer overflow in
 zynqmp_dp_rate_get()
Message-ID: <20241215131258.GC25852@pendragon.ideasonboard.com>
References: <20241215125355.938953-1-karprzy7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241215125355.938953-1-karprzy7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_051321_067041_6801FECE 
X-CRM114-Status: GOOD (  18.33  )
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

Ho Karol,

Thank you for the patch.

On Sun, Dec 15, 2024 at 01:53:55PM +0100, Karol Przybylski wrote:
> This patch fixes a potential integer overflow in the zynqmp_dp_rate_get()
> 
> The issue comes up when the expression
> drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit
> Now the constant is a compatible 64-bit type.
> 
> Resolves coverity issues: CID 1636340 and CID 1635811
> 
> Cc: stable@vger.kernel.org
> Fixes: 28edaacb821c6 ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes from previous versions:
> Added Fixes tag
> Added Cc for stable kernel version
> Fixed formatting
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 25c5dc61ee88..56a261a40ea3 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
>  	struct zynqmp_dp *dp = data;
>  
>  	mutex_lock(&dp->lock);
> -	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
> +	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
>  	mutex_unlock(&dp->lock);
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart


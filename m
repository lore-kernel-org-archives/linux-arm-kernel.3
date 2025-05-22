Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F85C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=; b=w2PHgapePDmVPg2NVHVipFBlH8
	wJgvbad5DN/6cMf65cQnhw5DeEonZrtS+VT32cm9ZgWYMXP6MRknvrn8D+U2/Dj3SnHB45Q2DoiX0
	t2cuAXHcipRG+P2SnOnqcN2mYI0L7463BroxVZzqa3XY1TCJ12VYiLo4wTWVtvkvT2rV/8rFHt7Z5
	yHtULApPVdZiNMaC+R1KJHhSUA5PYlGGqZ5aUdHcIYM04qR8uRj6rs/WSsQ6GtQ8OzrTQy+gMbhOP
	5dVhKgjgZIBMuGJPKAIUrEj4hXX5TRNV/Uypyi6GGIJpBk67J7OkCw/hrV7bWXy4aXihSlqi+l1h+
	pdnW/XCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Vs-00000001Nbl-1XrZ;
	Thu, 22 May 2025 15:07:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7D9-00000001JUC-43Vo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:47:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-30e80f03760so5868475a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925275; x=1748530075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=;
        b=vCnc152j/+1A96V1FfSspDloXCqclZiPLG8morhfKW3FW2Pmz5gdHC4ehieqH9cEVu
         KHmlxJb/lhjWproxHtfA8WRttriv6hZwk/vRZYRTQ7esxSaPFW/OVgvmN8XF83yOCXVI
         HCjO2HSHGedJIIBdSs5crxDWJO9SgLlZ/YZ0d7DJsAtGJ6Rdf0a3dSud8AzwrZst/sFx
         Pn392fUg0lpl6CBsJOSMgkhlCyFg5UPuQSAQCnYUp8oP+Fvmmt1l4UvsjKYkWzHABQtj
         RQSA4iK1hqwMGVgSJGEpOgGuJ++Yc9OFWbc4bM+pdgejIqt88O0WAQXL0g9YsYryrkWf
         QrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925275; x=1748530075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=;
        b=XfTRgw0h9yxEmkbwkbClvlzwnrv4fAAFzt9Xqy49qHGB9X68ndUq9nkESs71yQ8d5U
         ptWVX1cHeKWYdoCry6CTmm/nz5zL0o4B//h9YN5yUdqAOuYyNfjbnNnoGB0utgsnjyBB
         nx+9YCYJhgb1Z/AX8VS969bmMUJl0+uP7h1ybUZ+CxfMUE0nwzMRIg6hCy071WEWGoyC
         Aa5fj+q/qR1dsMff6DISPMR+TDzsDoFMifdynjYtfv4Y3txPvxvMSoDqfpzDuYpVffh+
         ne/CalmIYagUqcwYVtIVaVAk5Z5Eji2GmVn4BzTvXG5O9kPmbqZePRCDZ4O9mq14sitR
         BUdA==
X-Forwarded-Encrypted: i=1; AJvYcCVq/KktmSFaMgpdAtONpbKAUhAGmKd5sanOUSK2p24lzkaOsW85c/XifYtIyUyIkk4ESr+BNnu/yV5SrU4hTwOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwiL/iSDOSzD+pppfEy1hRGcj16SK38kXwupuMwK8p2e//rXAGm
	AHlj7DQ43QtENRpQJK/AyZIEsPeXlCARfEvvGtNHwrl36y/vKAabwHe+Pb6+AQ0Q65s=
X-Gm-Gg: ASbGncvh/EIrgmJyCLmzTSP/YgKRNwrMlCD241CYCpQdCdcSkcWOVTbOZfmIJ+VXx4r
	o2MHlc5DXHSmZEswTvfMT/aPj8AxYPxnLGgBpeZ4WRLRbDkiOhllzvNxChwBUOTZIP3smSXlFK0
	6ckxvby/v+oiTcDNdA2Iz80S9WFRrBew4YbctAGaHF5xfZUW7DR1ZPwP7AYxr9EEBqW9rQ34tNE
	v3XGxnIsVI48OQ+sieqmn7sdfbttZeOXSdBye6z5ndOGb24urjYPBcPQThyLC9CoaA50PtAYLeO
	8SzBsANjwYVkp1OX01RNNg54OUtbQNH7d7RXzTaE0eMUlodqH8TKWMk=
X-Google-Smtp-Source: AGHT+IG5YDZqJMGCNUR1bl3lh55nwJynldcZarNJfaMbRBZQnBUy0qDHzLUmT4VJ7H8G0EhPmNRC+w==
X-Received: by 2002:a17:90b:33c2:b0:2ff:58b8:5c46 with SMTP id 98e67ed59e1d1-30e830f7b18mr38271134a91.8.1747925273816;
        Thu, 22 May 2025 07:47:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adb8:3fc6:e0a3:9f52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36365d9esm5641713a91.7.2025.05.22.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:47:53 -0700 (PDT)
Date: Thu, 22 May 2025 08:47:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mediatek: Add SCP watchdog handler in IRQ
 processing
Message-ID: <aC85F1Rua2dn_qTY@p14s>
References: <20250521142404.1077-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521142404.1077-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_074756_017882_F5B41748 
X-CRM114-Status: GOOD (  21.37  )
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

Good day,

On Wed, May 21, 2025 at 10:24:03PM +0800, Wentao Liang wrote:
> In mt8195_scp_c1_irq_handler(), only the IPC interrupt bit
> (MT8192_SCP_IPC_INT_BIT) was checked., but does not handle
> when this bit is not set. This could lead to unhandled watchdog
> events. This could lead to unhandled watchdog events. A proper
> implementation can be found in mt8183_scp_irq_handler().
>

As pointed out by Markus, this changelog needs work.

> Add a new branch to handle SCP watchdog events when the IPC
> interrupt bit is not set.
> 
> Fixes: 6a1c9aaf04eb ("remoteproc: mediatek: Add MT8195 SCP core 1 operations")
> Cc: stable@vger.kernel.org # v6.7
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/remoteproc/mtk_scp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..316e8c98a503 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -273,6 +273,8 @@ static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
>  
>  	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
>  		scp_ipi_handler(scp);
> +	else
> +		scp_wdt_handler(scp, scp_to_host);

I would much rather see a test for the watchdog bit than just assuming it is
a watchdog interrupt.  And while at it, please refactor the bit definition to be
platform agnostic rather than reusing 8192 definitions on an 8195 platform.

Thanks,
Mathieu

>  
>  	writel(scp_to_host, scp->cluster->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
>  }
> -- 
> 2.42.0.windows.2
> 


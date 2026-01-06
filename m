Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DBFC47BF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B49pmNd1KDtuh0inHrlsNOXqUWWwuksqjb7KZCe6flQ=; b=JVZMH3krGrjRl/HOwVXEOR3ZJa
	H92FK+Nx9mFJFHINWtDKcoEykD+FMUmYUvLO8xuUuBKStb5S/inaf02cWbz9CkiIbIS2jMHlDxd2t
	A+8jUUG21Nvi5QESF847OVSXwGrXZU+y8ilBLiC0fMClP/vhf9s6ENzJ6M5M/0QzLmiZyZdYvMCwl
	kc8A/DX6HmENSl51Txnjjb5RtzA+uHFCAsS+3GywdJgVSF9cGnmlSHAVBg0+1mNyXpnWbfirCctfM
	Bq9F1UFIzzN0DG6yH99dIOozTW17dLF6k1gHqboxwpbMRr5ar8knS+hLBbn0BfXNrNKwblDcnGUpl
	WkyufVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd881-0000000DIHs-0tar;
	Tue, 06 Jan 2026 14:33:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd87y-0000000DIFz-1Vnu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:33:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vd87o-00072m-Kp; Tue, 06 Jan 2026 15:33:32 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vd87m-009MNP-16;
	Tue, 06 Jan 2026 15:33:30 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vd87m-00EKlW-0l;
	Tue, 06 Jan 2026 15:33:30 +0100
Date: Tue, 6 Jan 2026 15:33:30 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rga: Fix possible ERR_PTR dereference
 in rga_buf_init()
Message-ID: <aV0dOj7hf1GCq7BC@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Alper Ak <alperyasinak1@gmail.com>, hverkuil@kernel.org,
	mchehab@kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251227084038.28679-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227084038.28679-1-alperyasinak1@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_063342_396402_BD3AF944 
X-CRM114-Status: GOOD (  18.91  )
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

On Sat, 27 Dec 2025 11:40:37 +0300, Alper Ak wrote:
> rga_get_frame() can return ERR_PTR(-EINVAL) when buffer type is
> unsupported or invalid. rga_buf_init() does not check the return value
> and unconditionally dereferences the pointer when accessing f->size.
> 
> Add proper ERR_PTR checking and return the error to prevent
> dereferencing an invalid pointer.
> 
> Fixes: 6040702ade23 ("media: rockchip: rga: allocate DMA descriptors per buffer")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index 730bdf98565a..bb575873f2b2 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -80,6 +80,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
>  	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
>  	size_t n_desc = 0;
>  
> +	if (IS_ERR(f))
> +		return PTR_ERR(f);
> +
>  	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
>  
>  	rbuf->n_desc = n_desc;
> -- 
> 2.43.0
> 
> 


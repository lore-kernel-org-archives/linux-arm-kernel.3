Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B513E9D403
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZgh5mCK2PnsQ3X8T9/hrxYpMqme7CoK+Dmu0Dekhz8=; b=LhwP+4uXrT196DRoXrUgZ6nx7E
	wHhKtV+b2SFOSO/b+m+Iod+VoP5JfH1z/BVaiTMa/fwPILAb7jDiVOP33hbwoWHS1u3hPuEnefMJy
	kuS4dbVspnl/gpGZ8hdgy3lXuLF1JZE7teUILdND093eM/vd7Gr+jqjr/s9LrJ7R/V294Xsdz9zSS
	fBEKwO98XzRzCNdsCnBPVcSL5u/sOIVbZRqP7uNYq7gwZEszc/AFPann+icSruy2Qasz8xCq9lOpY
	J1024k3423zPPP+3Ol4FcjJUX7LmF5riUCkT/yTcDZbgO8SIdEx76mwDBGO2sSHiifA27FgOZrPZv
	x1hmQHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnezC-00000008gWg-1NXb;
	Wed, 04 Feb 2026 15:40:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnezA-00000008gVl-1EmA;
	Wed, 04 Feb 2026 15:40:09 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AB6EA5B2;
	Wed,  4 Feb 2026 16:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770219563;
	bh=k/NqlQg5q0j9YmWqv6NdYnAWug6KE79uSpKt3AsYqMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWZeAAhP9Sj3M9Mf6WsEu7TsPgU72Mj6rpeR0OighCytzTbtbchisuVFpkx8wDMiN
	 J9Md0fUp+ibtdUR8DFZ5ndSX3s+7gMuO+NOeNxJgfqkc6KN7ya+n6CN78ltq7hPwE2
	 z9MJtZNjqKtEyDbl8LCa1lO5KbpmPgXPlPbdr1/U=
Date: Wed, 4 Feb 2026 17:40:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] media: rkisp1: Give buffers back instead of
 dropping in bypass mode
Message-ID: <20260204154004.GB170964@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
 <20260204112506.3706049-6-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204112506.3706049-6-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_074008_474054_1748AD7E 
X-CRM114-Status: GOOD (  23.38  )
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

On Wed, Feb 04, 2026 at 11:25:05AM +0000, Isaac Scott wrote:
> In the data mode used for YUV passthrough, falling VSYNC events are used
> to determine when a buffer is complete. This means there is no 'Frame
> End' signal.
> 
> Previously, all buffers would be dropped when bypass mode was active.
> Instead of dropping every frame, we should return the buffer to user
> space if it is marked as complete by a falling VSYNC signal.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 867cdddf9f89..2753be39ab33 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -832,6 +832,11 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
>  	for (i = 0; i < dev_count; ++i) {
>  		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
>  
> +		if (rkisp1->in_bypass) {
> +			rkisp1_handle_buffer(cap);
> +			continue;
> +		}
> +

You're completing the buffer if *any* interrupt bit is set, this doesn't
seem right. At the moment we may not enable interrupts other than the
one you expect, but that may change later, and this will misbehave.
You're also not handling the stopping logic, which also seems wrong.

Finally, what interrupt bit do you expect to see ? There's no VSYNC
interrupt in the RKISP1_CIF_MI_MIS register. Are you relying on the fact
that your platform has a single interrupt line for the three interrupt
sources (CSI2, ISP and MI), and react to the VSYNC interrupt from the
ISP interrupt here ? That's not right either, not only will it not work
on platforms that have three separate interrupt lines, but it will also
cause rkisp1_handle_buffer() to be called for *any* ISP interrupt.

I'm surprised that the frame end interrupt doesn't fire. It's part of
the MI, not the ISP, so it shouldn't be affected by bypass mode. You
should investigate that.

>  		if (!(status & RKISP1_CIF_MI_FRAME(cap)))
>  			continue;
>  		if (!cap->is_stopping) {

-- 
Regards,

Laurent Pinchart


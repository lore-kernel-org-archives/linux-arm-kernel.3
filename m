Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5369CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyAmqc74tPeSqmdOneDeQhCxyrBsJsodvaoN1wzTpP0=; b=SMckL3pUN5xZ0RropxgWLALi50
	2741nRRfDhA7uTbO2cxFF0pVjdzpKLeRB6IyL/xywed35fUzt2yMSM0OQZ7LS6VFS5ryvaAYD/Ihn
	84EaDYu5wxVHi0RA2ekYf8ZWCbHHidgHOBJiYs6IrA4KRfAixeNFGlXgv6PcsWYySY7cTUDPCiyPm
	5UXnywBtoBA+4CkFuanbCh2wgmJEQ/GlgeJ7psw9zJEBwmJGSbOWOIZp9CGMnawrECLkoN3IiKRWc
	gJEcNnxj2DwceV/aW34lbRnIPEmoXCICOLWbdGLoq9UXo+m8DJO4VUPidtGtOkcSPNSbmBY1o9upc
	N7Xq1y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiFK-0000000EkBr-3f9h;
	Wed, 03 Jun 2026 09:50:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiFI-0000000EkBI-1i1P;
	Wed, 03 Jun 2026 09:50:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1780480236; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MA70eK+bFGLjjVj+v3J16+vPsqLFjqfRRq7mvnEIWOvMlkieD5d9mLtry1r5V+9nJf2yFmyzIDTXD0HgG4Y8QTZaSj5ARaY3vbpOqw1JDj/x76uSHCtRlwC7MRsf+SIogXl17sWcGJIJjgqm7FiR4qUb17sa2uobOf0aWeaV8iQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780480236; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oyAmqc74tPeSqmdOneDeQhCxyrBsJsodvaoN1wzTpP0=; 
	b=B4/PTzPW//F7DZ1zrNRhqvzwlB4lAH++tCSKPcmsx0G4SB7KFMxca6kvt3bT1L3fioj1+dDDBjA4ft5ruMwtxgj63ssSjQ+4nrgBFbbMIFx5PvKEExGF6Hc4yKPhoporIodJyPmBa5sRG+way0t+MGWUG2zbxu5/AQRpT9jNlds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780480236;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oyAmqc74tPeSqmdOneDeQhCxyrBsJsodvaoN1wzTpP0=;
	b=M8bQZJTIvUTA95lVuo8E4jz5bFadZ5tELZLhHVsPRc8PsAn9uQzw4jyx2/H11jCv
	JAKmCpYK3v0h5nzSpzLaob8pg5aAvYAUoWZwqZsCzW2Ruk/Frv4nsamb+aS124SB0sR
	IVEVk9Yyv4F3/NVXtTBWtqalgajlkNjnAzumY6Bg=
Received: by mx.zohomail.com with SMTPS id 1780480234850793.9722590953027;
	Wed, 3 Jun 2026 02:50:34 -0700 (PDT)
Message-ID: <a80c978f-65e8-436e-a3d6-74cf50b5ea6a@collabora.com>
Date: Wed, 3 Jun 2026 11:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rockchip: rkcif: Fix error handling for
 media_entity_remote_source_pad_unique()
To: Chen Ni <nichen@iscas.ac.cn>, mehdi.djait@linux.intel.com
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil+cisco@kernel.org,
 gerald.loacker@wolfvision.net, bryan.odonoghue@linaro.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260522065548.2438545-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260522065548.2438545-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_025044_512695_3F5000A2 
X-CRM114-Status: GOOD (  13.94  )
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

Hi Chen,

Thanks for the fix!

On 5/22/26 08:55, Chen Ni wrote:
> The media_entity_remote_source_pad_unique() function returns an error
> pointer on failure, not NULL. Fix the check to use IS_ERR() and return
> PTR_ERR() to correctly handle allocation failures.
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..542aa877919d 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
>  	struct rkcif_stream *stream = to_rkcif_stream(vdev);
>  	int ret = -EINVAL;
>  
> -	if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity)))
>  		return -ENOTCONN;
>  
>  	sd = media_entity_to_v4l2_subdev(link->source->entity);



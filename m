Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0516BD2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWDdbJHaCEHHP8Pu1SVNR42Q8CZ1b5xotXRiOfxHQfU=; b=UXJF+ub2wSLxytt7tf2Mg0yWZr
	zcy3VN46pqQfNLBNw7SRrFKOXbBq8n8xdnRbb1K01igWrcIGiCnPCjMCwNy0QFcefcuvWq4VCYcES
	7YVxSooHGjULxnyYZXfSJvPhcJQhloK6Rfs7ve5eW1MvyHSZ+z30jMVKu4F3/vv8HTR9q5155tX3N
	z7+GChVKdvwFx901cbil40y5tKqaJoHpApmNQuHQ7cYt0o1SsGedhDqXEUf6i3M3g9VUk/4ukdKjj
	rcSex17JocHQmKeAyILEiQSsvYeFZpz+urINXeKYNY7A8Klucr/5eBG3xBWmpLDdfBXy8pC69eMwB
	Cq7Uqv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mQH-0000000Eb6Y-2wl2;
	Tue, 29 Oct 2024 13:38:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5m8n-0000000EYS3-0lXs;
	Tue, 29 Oct 2024 13:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EBCBA42DC2;
	Tue, 29 Oct 2024 13:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDD8C4CEE6;
	Tue, 29 Oct 2024 13:20:05 +0000 (UTC)
Message-ID: <95d99dfa-d054-4bea-83c9-b4f228d38431@xs4all.nl>
Date: Tue, 29 Oct 2024 14:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: raspberrypi: cfe: Fix min_reqbufs_allocation
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241029-rp1-cfe-fixes-v1-1-49f04cc271f5@ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20241029-rp1-cfe-fixes-v1-1-49f04cc271f5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_062009_394689_3561112C 
X-CRM114-Status: GOOD (  18.47  )
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

On 10/29/24 13:47, Tomi Valkeinen wrote:
> The driver checks if "vq->max_num_buffers + *nbuffers < 3", but
> vq->max_num_buffers is (by default) 32, so the check is never true. Nor
> does the check make sense.
> 
> The original code in the BSP kernel was "vq->num_buffers + *nbuffers <
> 3", but got mangled along the way to upstream. The intention was to make
> sure that at least 3 buffers are allocated.
> 
> Fix this by removing the bad lines and setting q->min_reqbufs_allocation
> to three.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 045910de6c57..65e9c6d23416 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1025,9 +1025,6 @@ static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  	cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
>  		node->buffer_queue.type);
>  
> -	if (vq->max_num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->max_num_buffers;
> -
>  	if (*nplanes) {
>  		if (sizes[0] < size) {
>  			cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
> @@ -1999,6 +1996,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	q->lock = &node->lock;
>  	q->min_queued_buffers = 1;
> +	q->min_reqbufs_allocation = 3;
>  	q->dev = &cfe->pdev->dev;
>  
>  	ret = vb2_queue_init(q);
> 
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20241029-rp1-cfe-fixes-0270923a2f94
> 
> Best regards,



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD4C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsNgKLbJLb9DwPD9hkfdr6aYypQHtyGtr4Bb4ouAYKo=; b=ttZjvwIKBK/wo4JddtKzwo08aB
	QHLQMvgBzxXJV1m7jbzCI+kv/acoXIPIyyHG+7N4NCdTqLPfIBQntiYvp6z2ZUJWXkgEwWlhX7BQF
	24yjdYbowFBbe9q9UZy3YXiAOZZuz3IC44zkQvEj1oFa3bhz5KkzlzXTLgzUxKDOK8MeY9uRPQjRz
	Ouuq3EsNllFnKyANDlI/PKV57jEi6/bx86k81c3BGLneafzsiZq8/rcabXESrBpAeSHNSIOs8zj7d
	yDa2L0c/vP3psMXJVdSGGiqGg97fzz2aiZZco0wpYVuyiaJy1g7iDiU06B7EnPsWPPi14/dtE3tEr
	ANmgu0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kyw-0000000BSVx-32TD;
	Tue, 01 Sep 2026 09:40:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kyu-0000000BSVd-3OMy;
	Tue, 01 Sep 2026 09:40:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5EEA601DE;
	Tue,  1 Sep 2026 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1746A1F000E9;
	Tue,  1 Sep 2026 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255639;
	bh=SsNgKLbJLb9DwPD9hkfdr6aYypQHtyGtr4Bb4ouAYKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3HiFpI+Yu6DFwGPpNzz81xBw0iRGkU0Y3akZQ/5ye9c1DrL0ztgjhkx6AKsyKcJM
	 APvcSqdz1oaYgI3YWVoPIVh9qliEyXPc4ofqGUZ4Mq17Addg/DtmhG99WqgfHvBdg3
	 Z45diSo+CLy+YGFfs1c+Vn8+0CVjux7DueoE1QWw=
Date: Tue, 1 Sep 2026 11:40:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lucas Jeffrey <luquijeffrey@gmail.com>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: preserve bcm2835_audio_write
 errors
Message-ID: <2026090127-unafraid-vantage-966f@gregkh>
References: <20260803040928.12453-1-luquijeffrey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803040928.12453-1-luquijeffrey@gmail.com>
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

On Mon, Aug 03, 2026 at 01:09:28AM -0300, Lucas Jeffrey wrote:
> When sending audio data in multiple packets, a successful later packet
> could overwrite an earlier failure in status. This caused the function
> to report success even if one packet was not queued.
> 
> Stop sending packets after the first failure to preserve the error.
> 
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
> ---
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> index 3156cb8392f4..5ac23cfa7983 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> +++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> @@ -365,6 +365,9 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
>  
>  			status = vchiq_queue_kernel_message(vchiq_instance,
>  							    instance->service_handle, src, bytes);
> +			if (status)
> +				break;
> +
>  			src += bytes;
>  			count -= bytes;
>  		}
> -- 
> 2.43.0
> 
> 

Was this tested on the real hardware?

thanks,

greg k-h


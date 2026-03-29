Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28C8F3D5EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMIyHpVJd3xCjFfsnxU46AaividzEzahPzJcFFHzLng=; b=p3YWT3jIWTXjxwN6VgtJph8HNr
	M8oDdUh32/3jBMdDkodC6MF0NdpsGXWyWSRzi23VEszl7GEUMCMeAI7WI/Vnavp4yY34trPKJACNh
	jNGu0XXKre5dFUwkvWMc6ghWUYH5gxtEgM/xcL+2LhXc569VVMrSQG/i44ExAetWTzWZgIdjKSoNy
	nw9OTbjqaDi4oubrVvItgVTCdKMKQFOHBRKm2NKaV5M4EF5c1dM3lVJMvjQh1VVtP1G1d7/bRDKtT
	HqT6l6dDEtmBLb/yn7yxFZJElqtuER2ZBNmFWOOp7YmlqrGKeWmv4QF5BK9SBvo/L+p7VG30Xci2L
	ghc8QuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jkL-00000009eaF-0Vq9;
	Sun, 29 Mar 2026 06:35:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jkK-00000009ea6-0rEH;
	Sun, 29 Mar 2026 06:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EFD4600AC;
	Sun, 29 Mar 2026 06:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BDAC116C6;
	Sun, 29 Mar 2026 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774766139;
	bh=rW+ND+3JbUkWM3lXVcAkjV7CsU2FDSrrp5aDczXqKFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWCPNX1njz1LpAyMDmFTGlpVYZD5kkGOkpzjLQZnvwJfjUxlSjhr+v44XoREwNiZQ
	 T9hoJbIVjnEApr1ysxFKuBGU+qr+ZXI4OzU7QH372Qzesk7KsK2t3h+2iw3FR+Ddi/
	 /SYwUt0FnLRASMLAOgrrcmFgKrNdrwz4BXW1MhG4=
Date: Sun, 29 Mar 2026 08:35:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array
 access in event_to_host_cb()
Message-ID: <2026032936-deniable-visa-2459@gregkh>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329062229.493430-2-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329062229.493430-2-sebasjosue84@gmail.com>
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

On Sun, Mar 29, 2026 at 12:21:11AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> event_to_host_cb() uses msg->u.event_to_host.client_component as an
> index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
> = 64) without any bounds validation. The client_component value comes
> from the VideoCore GPU firmware via VCHIQ message passing.
> 
> A malicious or buggy GPU firmware could send a crafted
> MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >= 64 (or
> negative), causing an out-of-bounds array access in kernel memory. This
> results in reading/dereferencing a bogus vchiq_mmal_component structure
> from memory beyond the array, which can lead to kernel crashes or
> potentially arbitrary kernel memory access.

The kernel trusts the hardware the driver is bound to, so this shouldn't
be happening ever, right?

> 
> Add a bounds check on comp_idx before using it as an array index.
> Move the component pointer assignment after the validation.
> 
> Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
> Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>

No cc: stable?

> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index d36ad71cc..4772126d7 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
>  			     struct mmal_msg *msg, u32 msg_len)
>  {
>  	int comp_idx = msg->u.event_to_host.client_component;
> -	struct vchiq_mmal_component *component =
> -					&instance->component[comp_idx];
> +	struct vchiq_mmal_component *component;
>  	struct vchiq_mmal_port *port = NULL;
>  	struct mmal_msg_context *msg_context;
>  	u32 port_num = msg->u.event_to_host.port_num;
>  
> +	if (comp_idx < 0 || comp_idx >= VCHIQ_MMAL_MAX_COMPONENTS) {
> +		pr_err("%s: component index %d out of range\n",
> +		       __func__, comp_idx);

dev_err() is best, right?

And are you going to allow a malicious hardware device to spam the
kernel log?  :)

thanks,

greg k-h


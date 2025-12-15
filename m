Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5A1D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6x3jIjbhqBRcFQl/eWTIMr2xsgqGgCzJjyic7AkrX4k=; b=qH431gFXtZN6pudIxbWXEKrd67
	bINSo0GPYzcYVwDtYqTdI3DkyJbfPJWjuDBav+YHmQfCfm4Xh7sj/HV4AknnbyUg7Eus1F7QXk3Gl
	OUKiZIH0+rcav2f2TV5I76mLgk4bpqfZkZSqMyE5QK6ff4w4T7L4217MP5fUMPmJ5LiFqd879jBd3
	Dv5rsfo5w9pY7xvpqz8zgDHfR0NQnw6Z4h9f8KV/FQZcrc2YoGwF2ENE+ED7JlW2q6cqCeCt4HDJJ
	Iy3w6Jd1KnSdDvvlz2v9Ce72LhBzbwJ5CxvirXDCKoG8wsc2qXNpcv+GCi2VTuNTvG98unrJ+MaT5
	TiWXb12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV34q-00000003CrV-1Nn0;
	Mon, 15 Dec 2025 07:33:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV34o-00000003CrM-2xVy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 07:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27B0D60127;
	Mon, 15 Dec 2025 07:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C51C4CEF5;
	Mon, 15 Dec 2025 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765783981;
	bh=BA6xeU5bsb5CEAuSg7p2q3xijPwECww0M/yOXMPnGRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8Z3NaTaapjPXXOknD7a6ed7PNFUNruwaceXiDABCUWBOPYY86MVGVfghoXYhtEnK
	 nG6cX6w2tYV84SRnuAr/kVxjqZfh4GuLXDkQs+VUSRJ1/yFY5T6gqhLUrz9mkiIpD2
	 5paRRwHe6Gc/9bkWhd70Aldnu+830DoJzm+KY9CLMrod+26ypQmfMeF1gipronNxbg
	 EkP1UNDJgzrWdhSaK5nfa00j1oe13U1i//iKiQrVjjF615EpcIzoaHeveeQ5Yxom47
	 i34Jb1nQ2WE/8MlzUScV5WkkYVKzU5in6og5SUieZSvy1dOTADm5Cp25S+B16yMkIF
	 A4oE0uIJQzEQQ==
Date: Mon, 15 Dec 2025 16:32:55 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/17] firmware: arm_scmi: Make use of tee bus methods
Message-ID: <aT-5p7FTvNU8jcLU@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
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

On Thu, Dec 11, 2025 at 06:15:05PM +0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods. Note that the return value of .remove()
> was already ignored before, so there is no problem introduced by dropping
> the error returns.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/transports/optee.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
> index 8fdb80d3fabd..07ae18d5279d 100644
> --- a/drivers/firmware/arm_scmi/transports/optee.c
> +++ b/drivers/firmware/arm_scmi/transports/optee.c
> @@ -529,8 +529,9 @@ static const struct of_device_id scmi_of_match[] = {
>  DEFINE_SCMI_TRANSPORT_DRIVER(scmi_optee, scmi_optee_driver, scmi_optee_desc,
>  			     scmi_of_match, core);
>  
> -static int scmi_optee_service_probe(struct device *dev)
> +static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
>  {
> +	struct device *dev = &scmi_pta->dev;
>  	struct scmi_optee_agent *agent;
>  	struct tee_context *tee_ctx;
>  	int ret;
> @@ -578,24 +579,22 @@ static int scmi_optee_service_probe(struct device *dev)
>  	return ret;
>  }
>  
> -static int scmi_optee_service_remove(struct device *dev)
> +static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
>  {
>  	struct scmi_optee_agent *agent = scmi_optee_private;
>  
>  	if (!scmi_optee_private)
> -		return -EINVAL;
> +		return;
>  
>  	platform_driver_unregister(&scmi_optee_driver);
>  
>  	if (!list_empty(&scmi_optee_private->channel_list))
> -		return -EBUSY;
> +		return;
>  
>  	/* Ensure cleared reference is visible before resources are released */
>  	smp_store_mb(scmi_optee_private, NULL);
>  
>  	tee_client_close_context(agent->tee_ctx);
> -
> -	return 0;
>  }
>  
>  static const struct tee_client_device_id scmi_optee_service_id[] = {
> @@ -609,11 +608,11 @@ static const struct tee_client_device_id scmi_optee_service_id[] = {
>  MODULE_DEVICE_TABLE(tee, scmi_optee_service_id);
>  
>  static struct tee_client_driver scmi_optee_service_driver = {
> -	.id_table	= scmi_optee_service_id,
> -	.driver		= {
> +	.probe = scmi_optee_service_probe,
> +	.remove = scmi_optee_service_remove,
> +	.id_table = scmi_optee_service_id,
> +	.driver = {
>  		.name = "scmi-optee",
> -		.probe = scmi_optee_service_probe,
> -		.remove = scmi_optee_service_remove,
>  	},
>  };
>  
> -- 
> 2.47.3
> 
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06BD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F38fZPVgwivG5kbkZbVVXL+miY0wFG/7FpRQ01Jq0wE=; b=gxmwHIjhfQnlc0TgQ+s+v56BV2
	ZyRkQ860wZ7bZ06/joc+WSXFVUTr5geSUUWNk8dyJMfvmnICHzwbGOHoJymZRZkSM9K8A3G4ojL38
	xfg1Do5I1VEooFacjUor3WN7LTMps8p8XThVHpy8RDEFAbUPyngnXw9ToNU2MfcEmdNyKAsZgTqa+
	uslBkvq9lcRnANt2OmqJ7rm/FbkbxwqTw/awUT+VkCum8uvxQrPRO8sWpIEzms70Jdf9evRs11Y1U
	poVGWS6nYavo3JtSOPpOT+s096uVh6rUe6a9cQv41t2HNwQHTYNz+VhgiRs7rBqsicLRPAWv5SKJe
	xsrQeMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV335-00000003Cdx-3qeV;
	Mon, 15 Dec 2025 07:31:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV32r-00000003Ccv-2L5a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 07:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EEAE60140;
	Mon, 15 Dec 2025 07:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B64C4CEF5;
	Mon, 15 Dec 2025 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765783860;
	bh=cqq1WygF8ip5+I3ALGpTWCHJxLIkscoD9iWmQBjY6nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrA4UstOic+82ZQ4QSHC9C0T1gI6cYX954HpmrwHKcD0bjXFaQ07vWKYx87oWaieZ
	 RygMFS8ccA2HDovmZSHXRxNsXf3CVsgXBaJdf/nbljauPpORCr9teJSXj9d78KMwC9
	 hX3hnGk0a5hQFzURbc0FWdxluJ8GOYjBK0IigLzJgOV5TwSAOoUGce12h/lCjpdwzF
	 kYBAM8040hIzCpZdlZVgmAFhqNVQRd8b3xeIvCX3deUBhU2YEmM9looCLG+qKm8X85
	 ywxgFZsHpxfQrXL9Z2W6T255EE10AptzXxi5eZWqgkfLMG9flkuypf0fpbjCh/wS8d
	 wCBwm21PClo1w==
Date: Mon, 15 Dec 2025 16:30:54 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Cristian Marussi <cristian.marussi@arm.com>,
	op-tee@lists.trustedfirmware.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/17] firmware: arm_scmi: optee: Make use of
 module_tee_client_driver()
Message-ID: <aT-5LtYnLSF_MwW4@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
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

On Thu, Dec 11, 2025 at 06:15:04PM +0100, Uwe Kleine-König wrote:
> Reduce boilerplate by using the newly introduced module_tee_client_driver().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/transports/optee.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
> index dc0f46340153..8fdb80d3fabd 100644
> --- a/drivers/firmware/arm_scmi/transports/optee.c
> +++ b/drivers/firmware/arm_scmi/transports/optee.c
> @@ -612,23 +612,12 @@ static struct tee_client_driver scmi_optee_service_driver = {
>  	.id_table	= scmi_optee_service_id,
>  	.driver		= {
>  		.name = "scmi-optee",
> -		.bus = &tee_bus_type,
>  		.probe = scmi_optee_service_probe,
>  		.remove = scmi_optee_service_remove,
>  	},
>  };
>  
> -static int __init scmi_transport_optee_init(void)
> -{
> -	return driver_register(&scmi_optee_service_driver.driver);
> -}
> -module_init(scmi_transport_optee_init);
> -
> -static void __exit scmi_transport_optee_exit(void)
> -{
> -	driver_unregister(&scmi_optee_service_driver.driver);
> -}
> -module_exit(scmi_transport_optee_exit);
> +module_tee_client_driver(scmi_optee_service_driver);
>  
>  MODULE_AUTHOR("Etienne Carriere <etienne.carriere@foss.st.com>");
>  MODULE_DESCRIPTION("SCMI OPTEE Transport driver");
> -- 
> 2.47.3
> 


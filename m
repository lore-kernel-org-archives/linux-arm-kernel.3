Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DB8CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 00:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvldM1V+Az2AKV9IbjG57WusE9ASW5z1Pk2ymvnChfo=; b=B/B+gHgbCIuNDnKljA8sDBWbkq
	Xs2KKl6nLhLBXOeemeMrILt6/T7EdDHUnuBjr2e0b0jCEd/oQB48/cNV+L18SY7NVQrJt9JA7UeCq
	w0Q9OrNw1uNWL8SuwKQiQwFzHr8Y/1r+/opTXPioazNkTrRRUyOqZvY928s5rmEgWMUo7F87FRjE6
	ejn9uYcRHlcbZZ/4rbI4X8mMm619VKac+1h5NqABjyXCp+PDVcd2eOUb7BnRKKsvo7F+yVkmiRn1M
	KGYLTNO/gW+ZaBJCuOJJN1u2erAzmTjk9YWkeI35I5c4USZ3a6qN+ls/8JrfC7VCCSM0Ax+HLSPMp
	Zb52cPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBK6-0000000CuDL-2O18;
	Mon, 27 Oct 2025 00:42:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBK3-0000000CuD0-3fIk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 00:42:57 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 50D9F177B;
	Mon, 27 Oct 2025 01:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761525666;
	bh=ql+9l2OIUe012ZMtNpJEMb1HFYAsPP+D4QtZAHzeetA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6xa5BwVhhNpPPy76K2KrkE0H4OMjorlFTUcqeMi17nbo7fdC4ihgfpkRkCteqi/a
	 HH01nziHav5NKjZT+Ap0VGM0KoCh40OV9KUxZfoSNAexvnf+ceNeoi/kj4hLKBh/Vt
	 wq8SVBvvCprQS5fK8uFfj24V2wL/n3ME6tpFgJ5Q=
Date: Mon, 27 Oct 2025 02:42:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 3/5] media: imx8mq-mipi-csi2: Explicitly release reset
Message-ID: <20251027004239.GO13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-3-5ecb081ce79b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-3-5ecb081ce79b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_174256_055262_60F3C9B1 
X-CRM114-Status: GOOD (  17.36  )
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

On Thu, Oct 23, 2025 at 05:19:44PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Call reset_control_deassert() to explicitly release reset to make sure
> reset bits are cleared since platform like i.MX8ULP can't clear reset
> bits automatically.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index fd202601d401145da8be23df4451f6af660642c5..fd788a7f48e5feeff658e3d2347db6fefca5d0cf 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
>  {
>  	int ret;
>  
> -	/*
> -	 * these are most likely self-clearing reset bits. to make it
> -	 * more clear, the reset-imx7 driver should implement the
> -	 * .reset() operation.
> -	 */
>  	ret = reset_control_assert(state->rst);
>  	if (ret < 0) {
>  		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
>  		return ret;
>  	}
>  
> -	return 0;
> +	/* Explicitly release reset to make sure reset bits are cleared. */
> +	return reset_control_deassert(state->rst);
>  }
>  
>  static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
Regards,

Laurent Pinchart


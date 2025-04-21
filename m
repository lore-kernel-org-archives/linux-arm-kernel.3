Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7ADC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6i2z16WSp6O8aCVh9xZV3uZV+y4ocvdMo0pNWRvYtIk=; b=Gn0ap7DP8QVA2doEEC1E7Iv98m
	m/+mXuq+evZukrblOK6MXgTA9qyuVUH1cMU/enF1XvEcrKWypHvum46+lQlO55IrnM1fm8t6jSY5u
	+Lw694gftzo2IESDCKDaaBo+BOJ+e7hNFEVrbCV1b9uvGwmOa4fZNf7lTAS1qMlIpmEMUxLkznL6q
	SMqKQG6vWbPEyCc51RuEXIJpXKA1OCW847nuBm4XWq/QYAoSkRrDMtpRvQHEtKJESTape6SiAwloz
	s7EKWv+14bLG4giwOzwpuXJtZgNP8xZpWs59PZ3JrDp4lYskT9wqxl3edZ3q6vlAnsIVLfxCZrgeJ
	JZMdA3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ym9-00000005Bi8-2Rcj;
	Mon, 21 Apr 2025 21:34:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ykG-00000005BMz-2zAy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:32:06 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96C3E6D6;
	Mon, 21 Apr 2025 23:29:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745270996;
	bh=gbZw1+Qy3rOQrfujzuWryb33g5KcKZZ4PqGqFMtj5Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIMlVJbgh48eecoUzpYKj+mljhk2DG6DOcgOWMChPLmZa4jGHcRlh5Bmfpc30IHBI
	 1O41wXr748Gy+K2+Y5m0mKTB0wWtXx0ypL5vhjymIlfBeK9qqAsypMyH3kkTVGttYo
	 ZD+bzySXN3lQhwqphxEWjnY+jpWOJHJGGjleAOds=
Date: Tue, 22 Apr 2025 00:32:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 07/13] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Message-ID: <20250421213201.GQ17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-7-ef695f1b47c4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-7-ef695f1b47c4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_143204_920738_20CAC1D6 
X-CRM114-Status: GOOD (  21.12  )
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

Hi Frank,

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:05PM -0400, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
> i.MX8QM's IER register layout is difference with i.MX8QXP.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Change from v3 to v4
> - fix i.MX8QMP ier register layout
> - Remove clk-names array
> - Change 8QXP channel number to 6
> 
> change from v2 to v3
> - none
> 
> change from v1 to v2
> - remove intenal review tags
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 43 +++++++++++++++++++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 398cc03443be3..568d7b24466aa 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -246,7 +246,7 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
>  
>  /* Panic will assert when the buffers are 50% full */
>  
> -/* For i.MX8QXP C0 and i.MX8MN ISI IER version */
> +/* For i.MX8MN ISI IER version */
>  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
>  	.oflw_y_buf_en = { .mask = BIT(19) },
>  	.oflw_u_buf_en = { .mask = BIT(21) },
> @@ -257,7 +257,7 @@ static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
>  	.panic_v_buf_en = { .mask = BIT(24) },
>  };
>  
> -/* For i.MX8MP ISI IER version */
> +/* For i.MX8QXP C0 and i.MX8MP ISI IER version */
>  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
>  	.oflw_y_buf_en = { .mask = BIT(18) },
>  	.oflw_u_buf_en = { .mask = BIT(20) },
> @@ -268,6 +268,21 @@ static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
>  	.panic_v_buf_en = { .mask = BIT(23) },
>  };
>  
> +/* For i.MX8QM ISI IER version */
> +static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_qm = {
> +	.oflw_y_buf_en = { .mask = BIT(16) },
> +	.oflw_u_buf_en = { .mask = BIT(19) },
> +	.oflw_v_buf_en = { .mask = BIT(22) },
> +
> +	.excs_oflw_y_buf_en = { .mask = BIT(17) },
> +	.excs_oflw_u_buf_en = { .mask = BIT(20) },
> +	.excs_oflw_v_buf_en = { .mask = BIT(23) },
> +
> +	.panic_y_buf_en = { .mask = BIT(18) },
> +	.panic_u_buf_en = { .mask = BIT(21) },
> +	.panic_v_buf_en = { .mask = BIT(24) },
> +};
> +
>  /* Panic will assert when the buffers are 50% full */
>  static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  	.panic_set_thd_y = { .mask = 0x0000f, .offset = 0,  .threshold = 0x7 },
> @@ -322,6 +337,28 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> +	.model			= MXC_ISI_IMX8QM,
> +	.num_ports		= 5,
> +	.num_channels		= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_qm,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
> +static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> +	.model			= MXC_ISI_IMX8QXP,
> +	.num_ports		= 5,
> +	.num_channels		= 6,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -497,6 +534,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
> +	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
>  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index bd3cfe5fbe063..206995bedca4a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -157,6 +157,8 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX8QM,
> +	MXC_ISI_IMX8QXP,
>  	MXC_ISI_IMX8ULP,
>  	MXC_ISI_IMX93,
>  };

-- 
Regards,

Laurent Pinchart


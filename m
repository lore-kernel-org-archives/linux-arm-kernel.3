Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6D2CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hjjEBOSkqmJPVfW3xGLQ4StMoP98ZoZnBqbZYvDp4M=; b=TkU76xYGl71USxyqjizMc7nj15
	uQtcalkNw+G/66Na78b9euxT7J8tUjN9/iDwfOxyiCgsjyAKEJL41NJe8hhEjGo2m6NoSFJh6eBW5
	70HR18n3RO1cFSPVz1D5DfJFoDHHcf+NnRcOUzW5SYr2lo2gRMO1RLzzuObDK6ja75vixfPRfUfpk
	BWVucYddBb7ht64gKcMVj6TExYFo0+nKxrOvDtXxtZQVDDEh2PRws4Xn8SmRMbmciOW/v+2FwK0Jy
	dCa33hjD4bh46p2PmKTGZuN+vmnI02ttCUHhTHgY3W+uGK8ojsMswm73trRLQpO4OTlgnaikszQLp
	/2cHTxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNab2-0000000C7bN-3qhs;
	Mon, 24 Nov 2025 17:43:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNab1-0000000C7ax-0iTf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 17:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4hjjEBOSkqmJPVfW3xGLQ4StMoP98ZoZnBqbZYvDp4M=; b=QLJPpbjLF5JzYT/I8jpft7F+sV
	nxprM+AieOXlzWu20HeehjrDOo/bF28Ku7YicIj/fgg1YZDj8Kwvffj0XksCsezc+xIzZ6zNsmRp5
	Fx+D3BxnZUs/Xr8EX45RRNuNMfmAwUIqF6Mz3BZKhJGlrrCIWG5D2Ze99YzBbJxurfgFYnT4z4Nwg
	C6ZDLJzjHIHxL3C1V6J4vEdf37px5ws5JNUoKFrLXtdPif2VehisZAqd95sKnz5BRDZ7K16FZqCxb
	utd5vVrFOPV+IVzO8LpOan+UBoRV9q6EJGYzhQkihRRr+EaCzhkicobGhqwzI24vKhONBH59/zymU
	yNfqHoPA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZjN-00000004Epv-07BC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:48:02 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1vNaaZ-0000Ib-4x; Mon, 24 Nov 2025 18:42:59 +0100
Message-ID: <53cb1a8e87f80d8bb1a9b6463077a99b2268e46c.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Lucas Stach <l.stach@pengutronix.de>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
 benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
 sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com,  linux-imx@nxp.com, peng.fan@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev,  linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Mon, 24 Nov 2025 18:42:57 +0100
In-Reply-To: <20251121081911.1682-2-ming.qian@oss.nxp.com>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
	 <20251121081911.1682-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_164801_115510_D66C23BB 
X-CRM114-Status: GOOD (  20.53  )
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

Hi Ming,

Am Freitag, dem 21.11.2025 um 16:19 +0800 schrieb
ming.qian@oss.nxp.com:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> For the i.MX8MQ platform, there is a hardware limitation: the g1 VPU and
> g2 VPU cannot decode simultaneously; otherwise, it will cause below bus
> error and produce corrupted pictures, even led to system hang.
>=20
> [  110.527986] hantro-vpu 38310000.video-codec: frame decode timed out.
> [  110.583517] hantro-vpu 38310000.video-codec: bus error detected.
>=20
> Therefore, it is necessary to ensure that g1 and g2 operate alternately.
> Then this allows for successful multi-instance decoding of H.264 and HEVC=
.
>=20
Is there any more info available on what's actually causing the hang?
Is there some kind of overflow of the interconnect request capacity?

I'm asking to understand the issue a bit better, as locking both
decoder instances against each other seems like a pretty big hammer.

Regards,
Lucas

> Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  drivers/media/platform/verisilicon/hantro.h   |  1 +
>  .../media/platform/verisilicon/hantro_drv.c   | 26 +++++++++++++++++++
>  .../media/platform/verisilicon/imx8m_vpu_hw.c |  4 +++
>  3 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index e0fdc4535b2d..8baebf767d26 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -101,6 +101,7 @@ struct hantro_variant {
>  	unsigned int double_buffer : 1;
>  	unsigned int legacy_regs : 1;
>  	unsigned int late_postproc : 1;
> +	atomic_t *shared_resource;
>  };
> =20
>  /**
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 60b95b5d8565..036ce43c9359 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>  #include <linux/workqueue.h>
> +#include <linux/iopoll.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-core.h>
> @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev *vpu,
> =20
>  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> =20
> +	if (vpu->variant->shared_resource)
> +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> +
>  	hantro_job_finish_no_pm(vpu, ctx, result);
>  }
> =20
> @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  			      msecs_to_jiffies(2000));
>  }
> =20
> +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> +{
> +	u32 data;
> +	int ret;
> +
> +	if (!vpu->variant->shared_resource)
> +		return 0;
> +
> +	ret =3D read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 * NSEC_PE=
R_MSEC, false,
> +				vpu->variant->shared_resource, 1, 0);
> +	if (ret) {
> +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static void device_run(void *priv)
>  {
>  	struct hantro_ctx *ctx =3D priv;
>  	struct vb2_v4l2_buffer *src, *dst;
>  	int ret;
> =20
> +	ret =3D hantro_wait_shared_resource(ctx->dev);
> +	if (ret < 0)
> +		goto err_cancel_job;
> +
>  	src =3D hantro_get_src_buf(ctx);
>  	dst =3D hantro_get_dst_buf(ctx);
> =20
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index 5be0e2e76882..1b3a0bfbf890 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -324,6 +324,8 @@ static const char * const imx8mq_reg_names[] =3D { "g=
1", "g2", "ctrl" };
>  static const char * const imx8mq_g1_clk_names[] =3D { "g1" };
>  static const char * const imx8mq_g2_clk_names[] =3D { "g2" };
> =20
> +static atomic_t imx8mq_shared_resource =3D ATOMIC_INIT(1);
> +
>  const struct hantro_variant imx8mq_vpu_variant =3D {
>  	.dec_fmts =3D imx8m_vpu_dec_fmts,
>  	.num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_dec_fmts),
> @@ -356,6 +358,7 @@ const struct hantro_variant imx8mq_vpu_g1_variant =3D=
 {
>  	.num_irqs =3D ARRAY_SIZE(imx8mq_irqs),
>  	.clk_names =3D imx8mq_g1_clk_names,
>  	.num_clocks =3D ARRAY_SIZE(imx8mq_g1_clk_names),
> +	.shared_resource =3D &imx8mq_shared_resource,
>  };
> =20
>  const struct hantro_variant imx8mq_vpu_g2_variant =3D {
> @@ -371,6 +374,7 @@ const struct hantro_variant imx8mq_vpu_g2_variant =3D=
 {
>  	.num_irqs =3D ARRAY_SIZE(imx8mq_g2_irqs),
>  	.clk_names =3D imx8mq_g2_clk_names,
>  	.num_clocks =3D ARRAY_SIZE(imx8mq_g2_clk_names),
> +	.shared_resource =3D &imx8mq_shared_resource,
>  };
> =20
>  const struct hantro_variant imx8mm_vpu_g1_variant =3D {



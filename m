Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ltzTi+I6kPPm3F0lLcLlkqmygrdjRSVDeW/ROJ50BY=; b=qC6iB4jKg6HX1YbBmh8eakRw/V
	zS3ypK5zRUabGagx6OaOkdpRZ5rjKVxk8wT02mG8gDZTqqLTHu5omJU1UDimk0L6vXunpl3S4DPJN
	awdnz2Vn6fwyFCp37hWN4yG067pF+mKYqJInUUWEoVoSSRtjwWrZr0Llyhywg8n+au8PuYuBWVZzp
	kkj+hQAJ0sUOE0esjkNxsBHoOK5HDAB1nHGCZOo2bprEEyco8y+3mqpPU+9YWxZaHeqDaBcIw9kl3
	ckwjKwR6VbkRH13AiTOe+JBDRUWXcq/YdcZtCVWgkLMheETacTgsvuFFymsmX2xCJ1LzycTU3y2fT
	k/riF6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5s-00000003h0m-0W09;
	Tue, 09 Sep 2025 02:28:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgfl-00000001a8M-1T0w;
	Mon, 08 Sep 2025 18:33:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757356371; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mP1gqjkdiUExNbEz/+ZLOQQRp/VIvy2jg6mCgwuNQvpld/C57PjRbvmWiRJhWc0OyzbbB65Ymt4tCkSYA9iTx0hgW3c/zRMmuSUC8zl97O1/jjklh4OHqQJDJoHNK0R4ACGeg0kxbnkIhx2Ma0ccXKkD73BObWmkSZFEX9n5L0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757356371; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6ltzTi+I6kPPm3F0lLcLlkqmygrdjRSVDeW/ROJ50BY=; 
	b=nEU6mm47QxW+KIhbYWdgDGNME8hkZ19fI0B+ngC/O/wyYyU6MvQ6q8A5rSx+wdNH7x7gCh1pnpcl9yY5tshNPPawa23W+z7SELy+UOrDk/G6efLfRRUpodfHJjrxVXAeQ06p6gXjZKl5wvWqmx6ZPos7dCZh4RPSv1mo6ah+cjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757356371;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6ltzTi+I6kPPm3F0lLcLlkqmygrdjRSVDeW/ROJ50BY=;
	b=gmdHZEpjqx+Qs0N9zbN7Mgz3VYtN9gkYEaDT2OQegj86gUyG0C+igfYzxfo69760
	P6q8Y0ULhZPp/AskthsyD20oYxulxBHfDGLyTvGcNu83D/XLEiWWVN98eEW489zYcYs
	uLSd90pCQs2vD5VVk7y3fPyi/DeL9IgdV7qMC430=
Received: by mx.zohomail.com with SMTPS id 1757356367793396.9789493803712;
	Mon, 8 Sep 2025 11:32:47 -0700 (PDT)
Message-ID: <c05ea992-b0d8-4ea4-8a11-660b9cae4820@collabora.com>
Date: Mon, 8 Sep 2025 14:32:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: rkvdec: Add variants support
To: Jonas Karlman <jonas@kwiboo.se>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250905161942.3759717-1-jonas@kwiboo.se>
 <20250905161942.3759717-3-jonas@kwiboo.se>
Content-Language: en-US, fr-CA
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20250905161942.3759717-3-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_113301_456734_986B3B5E 
X-CRM114-Status: GOOD (  25.88  )
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

Hi Jonas,

On 9/5/25 12:19, Jonas Karlman wrote:
> From: Alex Bee <knaerzche@gmail.com>
>
> Different versions of the Rockchip VDEC IP exists and one way they can
> differ is what decoding formats are supported.
>
> Add a variant implementation in order to support flagging different
> capabilities.
>
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v3:
> - Use a reference to rkvdec_variant
> - Add num_regs field

Why are you adding this field ? I don't see it being used in a later patch.

Would that be useful for writing the right amount of registers later 
when switching to structs and memcpy ?

I haven't checked how different the register maps are between those 
different variants.

> - Collect r-b tag
>
> Changes in v2:
> - No change
> ---
>   .../media/platform/rockchip/rkvdec/rkvdec.c   | 22 ++++++++++++++++++-
>   .../media/platform/rockchip/rkvdec/rkvdec.h   | 11 ++++++++++
>   2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index c15fc238d6af..daf6d9ab2d1d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -14,6 +14,7 @@
>   #include <linux/iommu.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm.h>
>   #include <linux/pm_runtime.h>
> @@ -327,6 +328,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>   		.ops = &rkvdec_hevc_fmt_ops,
>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>   		.decoded_fmts = rkvdec_hevc_decoded_fmts,
> +		.capability = RKVDEC_CAPABILITY_HEVC,
>   	},
>   	{
>   		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> @@ -343,6 +345,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>   		.decoded_fmts = rkvdec_h264_decoded_fmts,
>   		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability = RKVDEC_CAPABILITY_H264,
>   	},
>   	{
>   		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
> @@ -358,6 +361,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>   		.ops = &rkvdec_vp9_fmt_ops,
>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
>   		.decoded_fmts = rkvdec_vp9_decoded_fmts,
> +		.capability = RKVDEC_CAPABILITY_VP9,
>   	}
>   };
>   
> @@ -1186,8 +1190,18 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>   	}
>   }
>   
> +static const struct rkvdec_variant rk3399_rkvdec_variant = {
> +	.num_regs = 78,
> +	.capabilities = RKVDEC_CAPABILITY_HEVC |
> +			RKVDEC_CAPABILITY_H264 |
> +			RKVDEC_CAPABILITY_VP9,
> +};
> +
>   static const struct of_device_id of_rkvdec_match[] = {
> -	{ .compatible = "rockchip,rk3399-vdec" },
> +	{
> +		.compatible = "rockchip,rk3399-vdec",
> +		.data = &rk3399_rkvdec_variant,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1198,16 +1212,22 @@ static const char * const rkvdec_clk_names[] = {
>   
>   static int rkvdec_probe(struct platform_device *pdev)
>   {
> +	const struct rkvdec_variant *variant;
>   	struct rkvdec_dev *rkvdec;
>   	unsigned int i;
>   	int ret, irq;
>   
> +	variant = of_device_get_match_data(&pdev->dev);
> +	if (!variant)
> +		return -EINVAL;
> +
>   	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
>   	if (!rkvdec)
>   		return -ENOMEM;
>   
>   	platform_set_drvdata(pdev, rkvdec);
>   	rkvdec->dev = &pdev->dev;
> +	rkvdec->variant = variant;
>   	mutex_init(&rkvdec->vdev_lock);
>   	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
>   
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 209dd79ce9bd..c47457c954e5 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -22,6 +22,10 @@
>   #include <media/videobuf2-core.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> +#define RKVDEC_CAPABILITY_HEVC		BIT(0)
> +#define RKVDEC_CAPABILITY_H264		BIT(1)
> +#define RKVDEC_CAPABILITY_VP9		BIT(2)
> +
>   struct rkvdec_ctx;
>   
>   struct rkvdec_ctrl_desc {
> @@ -63,6 +67,11 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>   			    base.vb.vb2_buf);
>   }
>   
> +struct rkvdec_variant {
> +	unsigned int num_regs;
> +	unsigned int capabilities;
> +};
> +
>   struct rkvdec_coded_fmt_ops {
>   	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
>   			  struct v4l2_format *f);
> @@ -98,6 +107,7 @@ struct rkvdec_coded_fmt_desc {
>   	unsigned int num_decoded_fmts;
>   	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
>   	u32 subsystem_flags;
> +	unsigned int capability;
>   };
>   
>   struct rkvdec_dev {
> @@ -111,6 +121,7 @@ struct rkvdec_dev {
>   	struct mutex vdev_lock; /* serializes ioctls */
>   	struct delayed_work watchdog_work;
>   	struct iommu_domain *empty_domain;
> +	const struct rkvdec_variant *variant;
>   };
>   
>   struct rkvdec_ctx {

Regards,

Detlev



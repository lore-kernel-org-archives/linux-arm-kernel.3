Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA03ECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wJ6fM461GuUVWJE0wPtIm49SjkCTBDb1nzHMw41KBI=; b=CLZVmSeNwU8fP9TmnF7LmxUu2N
	jgLUBefXiJGJfww3YVfCKz+xm84D1kUzny0ziI2tNshE4BzZRlxgRl8DbwMFyFdffFhFL5YNRhlDE
	guQjzVLcl0Nase3KHc05H+cW1XQyhBlzaxb9KDlnvPaEDMcwHm3DXe6YZROroEKKklLahLsaxPnEf
	H7kpza7hX8qUy+iyiH7mTPYAO0v01MEzEreZH94V0fKfj7NEgkcYiBNMszNqhpXBwZobld1NF88aw
	EVxektOGcHXqxctbIGgvSapCJwSVPYJAkv1yWY2GJNGL6ni6HQJHqUc2ePxySoALLqG4Smk24OHZe
	igVfbUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78kb-000000084MK-3jwX;
	Fri, 10 Oct 2025 08:45:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78kZ-000000084Kj-0MYt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:45:20 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v78kK-0003BM-Eg; Fri, 10 Oct 2025 10:45:04 +0200
Message-ID: <bdebed9c-2980-4d5d-9eb3-1cb5e5e8e226@pengutronix.de>
Date: Fri, 10 Oct 2025 10:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] media: rockchip: rga: add iommu restore function
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
 <20251007-spu-rga3-v1-11-36ad85570402@pengutronix.de>
 <97879b9b078055fb130edfd126d253320ce616a1.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <97879b9b078055fb130edfd126d253320ce616a1.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014519_122958_848428B3 
X-CRM114-Status: GOOD (  24.36  )
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


On 10/7/25 20:30, Nicolas Dufresne wrote:
> Hi,
>
> Le mardi 07 octobre 2025 à 10:32 +0200, Sven Püschel a écrit :
>> Add an iommu restore function in preparation for the rga3 addition.
>> This is necessary for a soft reset, as the rga3 will also reset
>> it's iommu paging table to 0 and disable paging.
>>
>> The empty domain attach/detach to restore the iommu is copied
>> from the rkvdec driver.
> We did receive negative feedback after the fact on this one. We will likely
> upset further the iommu subsystem maintainers with that. Have you considered
> adding a restore function in the rkiommu driver, similar to TI mmu and Benjamin
> VSI MMU proposal ?
>
> I have no precise objection, I know it works, but adding a restore function
> seems also pretty straight forward.

I haven't considered adding an restore function. I've implemented this 
to handle potential command stream failures like scaling beyond the 
supported 8x factor. I'll probably drop this for now to keep it simple 
and instead correctly announce the constraints to avoid creating invalid 
commands in the first place.

>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/rga.c | 24 ++++++++++++++++++++++++
>>   drivers/media/platform/rockchip/rga/rga.h |  7 +++++++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c
>> b/drivers/media/platform/rockchip/rga/rga.c
>> index
>> cd4da01645611e5fb51ed94e09b5f1463dad72c5..0a725841b0cfa41bbc5b861b8f5ceac2452f
>> c2b5 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/fs.h>
>>   #include <linux/interrupt.h>
>> +#include <linux/iommu.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/pm_runtime.h>
>> @@ -560,6 +561,19 @@ static const struct video_device rga_videodev = {
>>   	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
>>   };
>>   
>> +void rga_iommu_restore(struct rockchip_rga *rga)
>> +{
>> +	if (rga->empty_domain) {
>> +		/*
>> +		 * To rewrite mapping into the attached IOMMU core, attach a
>> new empty domain that
>> +		 * will program an empty table, then detach it to restore the
>> default domain and
>> +		 * all cached mappings.
>> +		 */
>> +		iommu_attach_device(rga->empty_domain, rga->dev);
>> +		iommu_detach_device(rga->empty_domain, rga->dev);
>> +	}
>> +}
>> +
>>   static int rga_parse_dt(struct rockchip_rga *rga)
>>   {
>>   	struct reset_control *core_rst, *axi_rst, *ahb_rst;
>> @@ -657,6 +671,13 @@ static int rga_probe(struct platform_device *pdev)
>>   		goto err_put_clk;
>>   	}
>>   
>> +	if (iommu_get_domain_for_dev(rga->dev)) {
>> +		rga->empty_domain = iommu_paging_domain_alloc(rga->dev);
>> +
>> +		if (!rga->empty_domain)
> Its an error pointer, see:
>
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/6347dc7fb967521a77f9ff0774d25ef0cca4c6cd
>
>> +			dev_warn(rga->dev, "cannot alloc new empty
>> domain\n");
>> +	}
>> +
>>   	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
>>   	if (ret)
>>   		goto err_put_clk;
>> @@ -741,6 +762,9 @@ static void rga_remove(struct platform_device *pdev)
>>   	v4l2_device_unregister(&rga->v4l2_dev);
>>   
>>   	pm_runtime_disable(rga->dev);
>> +
>> +	if (rga->empty_domain)
>> +		iommu_domain_free(rga->empty_domain);
>>   }
>>   
>>   static int __maybe_unused rga_runtime_suspend(struct device *dev)
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h
>> b/drivers/media/platform/rockchip/rga/rga.h
>> index
>> fc4805ba4e8ef7fb311f780a198ba6ba4d3aff17..e19c4c82aca5ae2056f52d525138093fbbb8
>> 1af8 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -75,6 +75,7 @@ struct rockchip_rga {
>>   	void __iomem *regs;
>>   	struct clk_bulk_data clks[3];
>>   	struct rockchip_rga_version version;
>> +	struct iommu_domain *empty_domain;
>>   
>>   	/* vfd lock */
>>   	struct mutex mutex;
>> @@ -114,6 +115,12 @@ static inline struct rga_vb_buffer *vb_to_rga(struct
>> vb2_v4l2_buffer *vb)
>>   
>>   struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type
>> type);
>>   
>> +/*
>> + * This should be called in an interrupt handler to make sure no memory
>> + * is mapped through the IOMMU while the empty domain is attached.
>> + */
>> +void rga_iommu_restore(struct rockchip_rga *rga);
>> +
>>   /* RGA Buffers Manage */
>>   extern const struct vb2_ops rga_qops;
>>   


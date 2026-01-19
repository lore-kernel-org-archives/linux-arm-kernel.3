Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EB5D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seixLJfaVSdo0IZhUY82q8JMpY8jnRRiQJ4L3ZQrJhk=; b=QGbRdWSaM/yHc2MlNGZDMRHLQ4
	OWEvzKpRTzynfzQpTHpp/9dmXHOk93uZlm533QQOe2+un3m80T0or/sxXbsnly+lbLloxK0sfNkyp
	DRi2KFkW7+vOmuo4R145qLiLGFXKoOXS20wqOCv0/ZF3zDgyV8N4JXH/XvCbNxkLd/yOexrgPRIvz
	/c6didESyaA7yCCVIQOHYPf2utyLduZp/EXpPtgaM6WxGg1/AZxMa7bW0poEluL6uyRuGaMMJL7B6
	kJs9dICOOzBQ8nij4J8JSSO4zMpokN6qJUpRadoCIf0hiXT+EriMj2uwsXAlTxNCmu+7NOaDSsniB
	Whh2obTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrNc-00000002NEO-1MpL;
	Mon, 19 Jan 2026 15:41:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrNI-00000002ND5-2cYC;
	Mon, 19 Jan 2026 15:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768837261;
	bh=WGje4+ey1jXaVxohpYLHfCxVK7LiezHtVRN34MEwaUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmCyE4EsGHuEGsVCgS3ZHCNmr1HZ0JgHB/6ULTjwJ4rtZ/iB2vMXCTTsmDK9leCcc
	 xxfkjlbe9cBdTp/mN+roDs4MyBW9Yok/DOrprw+6g8XsvoI/6YaMrxs+2vlMr+uyel
	 tCks0ibnW/FqNOtlPF7KITC+elSm3taLy9cuMJ5vI+zIk2zRUtZy0MmPTB7f1ID48g
	 TZ0u9BEknq+EOVXxIcw6BKjiSrTtfOkCrlhRD9KYG4zkhvivuCug9nTK7U8UqEuLHS
	 UbaM831YPK/V0dK5TWIc+KWwTYN548YcDrs1KMPeQcLcuaL/W1gPVKbI1yNhkrqE/L
	 udOQRo9lCLG4g==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2340F17E0FFA;
	Mon, 19 Jan 2026 16:41:00 +0100 (CET)
Message-ID: <37c83a9a-088a-4a96-b6f6-343fa6cdddc6@collabora.com>
Date: Mon, 19 Jan 2026 16:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
To: Frank Li <Frank.li@nxp.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
 <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
 <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
 <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
 <aW5PLIv2w+OY7xJD@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aW5PLIv2w+OY7xJD@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074104_981045_555CE057 
X-CRM114-Status: GOOD (  23.71  )
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

On 1/19/26 16:35, Frank Li wrote:
> On Mon, Jan 19, 2026 at 10:49:20AM +0100, Michael Riesch wrote:
>> Hi Frank,
>>
>> Thanks for your review.
>>
>> On 1/16/26 17:08, Frank Li wrote:
>>> On Fri, Jan 16, 2026 at 02:02:47PM +0100, Michael Riesch wrote:
>>>> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
>>>> one input port and one output port. It receives the data with the
>>>> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
>>>> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>>>>
>>>> Add a V4L2 subdevice driver for this unit.
>>>>
>>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>>> ---
>>> ...
>>>> +
>>>> +static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
>>>> +{
>>>> +	return container_of(sd, struct dw_mipi_csi2_device, sd);
>>>> +}
>>>> +
>>>> +static inline __maybe_unused void
>>>
>>> why need '__maybe_unused', needn't inline. compiler can auto decide and
>>> report unused function if no 'inline'.
>>
>> The __maybe_unused was helpful during development and is not really
>> required now. It doesn't hurt either, so I left it in. I can remove it
>> if you wish.
>>
>>>
>>>> +
>>>> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
>>>
>>> use  struct fwnode_handle *ep __free(fwnode_handle) can simplify err
>>> handler.
>>
>> Sorry, I don't see the benefit of that.
>>
> 
> I remember reduce one goto

Since Sakari requested this variant as well, I changed it to as you
suggested in v7.

> 
>>>
>>>> +	if (!ep)
>>>> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
>>>> +
>>> ...
>>>> +{
>>>> +	struct media_pad *pads = csi2->pads;
>>>> +	struct v4l2_subdev *sd = &csi2->sd;
>>>> +	int ret;
>>>> +
>>>> +	ret = dw_mipi_csi2_register_notifier(csi2);
>>>> +	if (ret)
>>>> +		goto err;
>>>> +
>>>> +	v4l2_subdev_init(sd, &dw_mipi_csi2_ops);
>>>> +	sd->dev = csi2->dev;
>>>> +	sd->entity.ops = &dw_mipi_csi2_media_ops;
>>>> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>>>> +
>>>> +static int dw_mipi_csi2_runtime_resume(struct device *dev)
>>>> +{
>>>> +	struct dw_mipi_csi2_device *csi2 = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	reset_control_assert(csi2->reset);
>>>> +	udelay(5);
>>>
>>> Now prefer use fsleep(), which auto choose difference sleep function
>>> according to delay number.
>>
>> I'll keep that in mind, but here the first thing that fsleep does is to
>> check whether the parameter is <= 10 and (since this is true) call
>> udelay. So here I don't see the point really.
> 
> Thank.
> 
>>
>>>
>>>> +	reset_control_deassert(csi2->reset);
>>>> +
>>>> +	ret = clk_bulk_prepare_enable(csi2->clks_num, csi2->clks);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to enable clocks\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2_pm_ops,
>>>> +				 dw_mipi_csi2_runtime_suspend,
>>>> +				 dw_mipi_csi2_runtime_resume, NULL);
>>>> +
>>>> +static struct platform_driver dw_mipi_csi2_drv = {
>>>> +	.driver = {
>>>> +		.name = "dw-mipi-csi2",
>>>> +		.of_match_table = dw_mipi_csi2_of_match,
>>>> +		.pm = &dw_mipi_csi2_pm_ops,
>>>
>>> pm_ptr( &dw_mipi_csi2_pm_ops)
>>
>> Shouldn't make a difference here since this driver depends on CONFIG_PM.
>>
> 
> Avoid some static scan tools to report the problem, no harmful to add
> pm_ptr().

Interesting. Which tools to you use?

I hope v7 is accepted as sent earlier today, and this should not be a
blocker. We can add pm_ptr() easily in a follow-up patch.

Thanks and regards,
Michael

> 
> Frank
> 
>> Best regards,
>> Michael
>>
>>>
>>> Frank
>>>> +	},
>>>> +	.probe = dw_mipi_csi2_probe,
>>>> +	.remove = dw_mipi_csi2_remove,
>>>> +};
>>>> +module_platform_driver(dw_mipi_csi2_drv);
>>>> +
>>>> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
>>>> +MODULE_LICENSE("GPL");
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>



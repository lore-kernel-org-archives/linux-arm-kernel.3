Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAB0C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smeJXW9cU9+dKFV1jIxhMhGZGNaUAZU2qdMN4VFIzBk=; b=WzK9fq461G3D46I4QRrdGwODp5
	51wGYnDmEpVWDmSVlACfd6cKWwGqiuEiJgHmbp1LH6fgxi4KwFVl7YPL0PMHSt0wIqaP6tKBLRBh6
	A6Z9iFXdBnQAMmXGIWxg/vbxtnhzHZ8dwEhHxpRcrlG5XelrBAV7HQeb4PgA7M2JzVANsmifxGxHY
	URW1Gn+sI4w3n1u1XflvjHfqmg83CS8IHIFA4fZ4M+bK5g/2fhuVsAVLDtRo/Gc/0L8H9w/dOqV5u
	9IpkvCfrVOjDXkrwuGpMe+qz4GLtTTDGDMb9vb5wgFCdLw8jDrFMONW234bY/RvonEdiH67092aQ+
	53gxTYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiOB-0000000EpRW-3vyT;
	Fri, 04 Jul 2025 15:31:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiIm-0000000EolE-2dy8;
	Fri, 04 Jul 2025 15:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751642770;
	bh=ohRy4gcoGuEcRKZpJdSU1G0sKmqubXx68E7KSC1A01I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IQpuTJ46xB7t9TZsLEqdQUqcaUBAf7UcGR9KeXm5AbW+VdHtVw9PDpxe3+Zx8pk1A
	 2tofxiaQsxOsBqI1Xoko5rRmH1K5bu7qQfSPpuDh9FHDevntD6KW1HNq8gawLU7HWj
	 QN/lN+G1R0r+Nw79biJPjRdmz1WYurJMekV6zpmEDl6scwasEp6xsbqmNTSljPz6J6
	 pDCt8GB71tdiXMdZ++n5SpjvzRnxX7/0eOzOnA9yMMhfpHs04vvBc2wV18ZLD0P/6T
	 hvRxPGgcRDfX0NNfaE6a/UgspTX3s/2td2/OaNlIvJoPeuPYsoHL9B+Vb1799nm2kj
	 uNYYV5pFL+w3w==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDC8517E07C9;
	Fri,  4 Jul 2025 17:26:09 +0200 (CEST)
Message-ID: <c08e55bb-fb93-44d6-bcb2-f1a1b78a5fb7@collabora.com>
Date: Fri, 4 Jul 2025 18:26:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
To: Maxime Ripard <mripard@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-3-2bd8de8700cd@collabora.com>
 <20250704-granite-piculet-of-elevation-f01e08@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250704-granite-piculet-of-elevation-f01e08@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_082612_825315_D78B3029 
X-CRM114-Status: GOOD (  20.31  )
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

Hi Maxime,

On 7/4/25 6:07 PM, Maxime Ripard wrote:
> On Fri, Jul 04, 2025 at 05:23:24PM +0300, Cristian Ciocaltea wrote:
>> In order to support correct initialization of the timer base in the HDMI
>> QP IP block, extend the platform data to provide the necessary reference
>> clock rate.
>>
>> While at it, ensure plat_data is zero-initialized in
>> dw_hdmi_qp_rockchip_bind().
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++++++++++++-
>>  include/drm/bridge/dw_hdmi_qp.h                |  1 +
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> index 126e556025961e8645f3567b4d7a1c73cc2f2e7f..8c1185490009c5f1bc658998a868f8b18dc479a3 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> @@ -431,8 +431,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>  				    void *data)
>>  {
>>  	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dw_hdmi_qp_plat_data plat_data = {};
>>  	const struct rockchip_hdmi_qp_cfg *cfg;
>> -	struct dw_hdmi_qp_plat_data plat_data;
>>  	struct drm_device *drm = data;
>>  	struct drm_connector *connector;
>>  	struct drm_encoder *encoder;
>> @@ -515,6 +515,17 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>  		return ret;
>>  	}
>>  
>> +	for (i = 0; i < ret; i++) {
>> +		if (!strcmp(clks[i].id, "ref")) {
>> +			plat_data.ref_clk_rate = clk_get_rate(clks[i].clk);
>> +			break;
>> +		}
>> +	}
>> +	if (!plat_data.ref_clk_rate) {
>> +		dev_err(hdmi->dev, "Missing ref clock\n");
>> +		return -EINVAL;
>> +	}
>> +
> 
> You'd be better off not using clk_bulk, or calling an additional clk_get
> for the ref clock only.

I'd keep clk_bulk as there are 5 more clocks in the list.  But replacing the
loop with just an extra clk_get would be a simpler approach, indeed, so
thanks for the hint!

Regards,
Cristian


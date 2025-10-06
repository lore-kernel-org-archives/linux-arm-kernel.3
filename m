Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D02CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpLnTrIyfmcBJQCv1eixCBr77QsXMkUMJBTEdd0fTlc=; b=k+i1nMx+N0hW1DKt81Q1HYnOCL
	QhW3Httt8EkQ62bDyrEYC650CnFLBDS+o4nl9HLWmjDS/N8KsDsqo59eIEExx67dlqrz5wl9arJtD
	721vZFcCqbGuvQjnbukEmewNkFa+kht+UdfHMvv7MF45zH3pCwsqQ1hBrpvCFYcrXUQgM0h6FUbDq
	Dfw9NUpdIh3ZuO+GhYt7PXAOJ+1WQ5TSgOr/oX8r/wTlCgq/UNze7HcBJXHG0PV7ZwQ8KKyI0Wa/O
	5mgraXs1QWFPZQlpQG2U+i2mcDdPA1oHgK4vdy5mrPOjyg8hctQdxh6PQXd/Z5JkhjP8XkqIudLGs
	KvEwz0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mLE-00000000Bbd-2ZcC;
	Mon, 06 Oct 2025 14:37:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mLB-00000000BYr-32OZ;
	Mon, 06 Oct 2025 14:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759761445;
	bh=965fpdMNqDc9qXsdodgIbDetPm9hiNy6hU7M65rSIJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dZVVz3OSKmAE5sdoGjfFSiOTeg7BWjiUgxQZBhyf/GNNpdrsD7fyzR8yLkKWtp0zK
	 ghkYY8i7GYULu+kG4MGNuhLQF6C/nXVgbSs94NqK03l/yapUVtBt/rDY1JJ6xyVAeZ
	 eqnVo1JWSY1w7RwaJiP8AMKo+rdGj9YNAclznRUXYAAk3aAF8U80sloao+sI/ZEDGh
	 7kZ0xAXh72punO72ZKcZBF6blWtt57wnFv1W4PVO1xDpBC25u0lXCavxIEkAI1i6eY
	 x2teTu+o9MPCAcQIfAOM3E3F9GOu84ZMPKClQXD6pbPknZgAEkr/tXC4CQyHW2jP4M
	 ojq45MdM4z35Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54EB117E0AC3;
	Mon,  6 Oct 2025 16:37:24 +0200 (CEST)
Message-ID: <8706f168-5598-4f91-9ad0-fdbd04b410b7@collabora.com>
Date: Mon, 6 Oct 2025 17:37:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jimmy Hon <honyuenkwun@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Muhammed Efe Cetin <efectn@6tel.net>,
 Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-3-laurent.pinchart@ideasonboard.com>
 <gai5hfvu6xbbqpk4mu3i6nejolijeokjy3mkzca5xwzb4xwic7@jmee36svmwnb>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <gai5hfvu6xbbqpk4mu3i6nejolijeokjy3mkzca5xwzb4xwic7@jmee36svmwnb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_073729_907286_FDDE63D2 
X-CRM114-Status: GOOD (  15.29  )
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

Hi Dmitry,

On 10/6/25 3:02 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 02:55:38AM +0300, Laurent Pinchart wrote:
>> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>
>> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
>> i.e. in some cases the error code is not included in the message, while
>> in some other cases there is no check for -EPROBE_DEFER.
>>
>> Since this is part of the probe path, address the aforementioned issues
>> by switching to dev_err_probe(), which also reduces the code a bit.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 62 +++++++------------
>>  1 file changed, 24 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> index 7d531b6f4c09..4e7794aa2dde 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> @@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>  		return -ENODEV;
>>  
>>  	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
>> -	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
>> -		dev_err(dev, "Missing platform ctrl ops\n");
>> -		return -ENODEV;
>> -	}
>> +	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
>> +		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
> 
> This only makes sense for the purpose of unification.

Right, as mentioned in the commit description, the intention was to ensure
consistent error handling across the probe path rather than limiting the scope
to -EPROBE_DEFER exclusively.

Thanks,
Cristian


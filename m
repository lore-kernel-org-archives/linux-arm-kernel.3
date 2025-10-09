Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C91ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ewrfFQfhgogVGbZxv784qGhAeLIsIFaFN+ESCQ9ywk=; b=yg7HmWaZbmp2neYRItKMpTN+nL
	1+VQZJAMBL7MI9n/7yyLeZFhSfXpF4cOz5gaNpjmGJukv6iuJDXJfArNSk/dvLHcfeRqpIBYGvIiQ
	e7ehwLu59mfzAfLutDHy+xkuoIHqZQWX2wol05yBODQJUMEyf4ZasQ/x+++K6ztQJfy4wTNYqrUNu
	9sYBZSFXV/RwcwtkqBBwwI0ZPmkrXThA/qiMmPmYI1iOguoSdFBfX5yx70ek1HIKxnjejiEweequb
	4seSyMOnwNbe7DUOInAFcMNRBdL162LgyqRBfJ5dVUAAbkeUofULs7AwzMRWEIphBTE1fnXTgmiTY
	8PzifuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l0p-00000005MgZ-0Ka2;
	Thu, 09 Oct 2025 07:24:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l0m-00000005Mg8-3RwD;
	Thu, 09 Oct 2025 07:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759994666;
	bh=SZTeonF4D7wa7CnlmXUx/9cIUWtW40SMGZWYRcsw+qU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UQf22LZE6wT8E8eisCIK4JaZSOmu+V/vPG5Y0I6YS5BgLJzvV7v6HTVsmUgpk3T50
	 pzj6kPYViehSf/BaQtWYQ5s9qMgq2LrQqZzlcjTVS8V0IQhlhgiSIhaBJcIsQE3QVL
	 PKsLlXRFdMl5vlC/VgTCOhVze9tyYhf/maGVOtdtUscvLdQZivjSJoNedFRpmEP/QL
	 iChhvyA21+FGs2vuM4uDi8QLwby2xaDyGMuhiTI2xNzl7svpIicnR/wzKwzhtud4Ff
	 Cq/iLWkSvaWZKVgks5vnr9col8ZoNGqnuiNVFZx0hnjnQS1QWMv3Ly4q5x7xcit/cF
	 PAI7HGKqQ93uQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F98117E1256;
	Thu,  9 Oct 2025 09:24:25 +0200 (CEST)
Message-ID: <bfb68ced-e6ec-4636-816e-9b8fe8aa10b4@collabora.com>
Date: Thu, 9 Oct 2025 10:24:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
 <8706f168-5598-4f91-9ad0-fdbd04b410b7@collabora.com>
 <20251006162631.GK5944@pendragon.ideasonboard.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251006162631.GK5944@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_002429_040237_6053216E 
X-CRM114-Status: GOOD (  18.71  )
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

On 10/6/25 7:26 PM, Laurent Pinchart wrote:
> On Mon, Oct 06, 2025 at 05:37:23PM +0300, Cristian Ciocaltea wrote:
>> On 10/6/25 3:02 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 06, 2025 at 02:55:38AM +0300, Laurent Pinchart wrote:
>>>> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>>
>>>> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
>>>> i.e. in some cases the error code is not included in the message, while
>>>> in some other cases there is no check for -EPROBE_DEFER.
>>>>
>>>> Since this is part of the probe path, address the aforementioned issues
>>>> by switching to dev_err_probe(), which also reduces the code a bit.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> ---
>>>>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 62 +++++++------------
>>>>  1 file changed, 24 insertions(+), 38 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>> index 7d531b6f4c09..4e7794aa2dde 100644
>>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>>>> @@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>>>  		return -ENODEV;
>>>>  
>>>>  	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
>>>> -	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
>>>> -		dev_err(dev, "Missing platform ctrl ops\n");
>>>> -		return -ENODEV;
>>>> -	}
>>>> +	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
>>>> +		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
>>>
>>> This only makes sense for the purpose of unification.
>>
>> Right, as mentioned in the commit description, the intention was to ensure
>> consistent error handling across the probe path rather than limiting the scope
>> to -EPROBE_DEFER exclusively.
> 
> Should I revert this change in v3 or keep it ? I see value in
> unification, but I don't mind either way. Dmitry, what's your preference
> ?

I missed to point out this patch has been also sent a while ago as part of
another series [1] which should be ready for merging.  It'd be great if there's
no need to revert any changes, otherwise we need to keep those in sync.

Regardless, I'll let you know if that gets applied first, allowing us to drop
this one after rebasing.

[1] https://lore.kernel.org/all/20250903-rk3588-hdmi-cec-v4-3-fa25163c4b08@collabora.com/

Regards,
Cristian


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5239ED767D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6O/3GBw63p0l5BBCUi73LPu6bFx6muuGDbHydYXVPs=; b=A3XBQ0AaIGjdG2cDaWWXUuavq4
	kzTUgbRmupPDUZ3IBeIUhD3rlZotDH/t2NYNx4pUnPyNcy3hgKkt73cUzEqqqdyxCpKEavYZAIhEI
	MufkpYhTr5A9sebxts3ova54g8QMKFgFdoNFao7zrvDR70u4Zi09EzZPqIpJzkRRW2eJ1Rqc70Wgl
	MIFTy7KtFLFNciiNwVB8lLTKKilMPs5dBQvdSBsxjeZ/NYnIvKpb8T+/IVETNMV3fEzdcVQ9eVc+6
	qqOwrIsq9V3bDzrPYPeNQFcoGnFsZgE1JMEkUdDmOqGPzdzO3UmKapFRxbWItrmQnwn3nMkHkVovs
	sxzB62/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WS0-00000003rSM-0kb5;
	Thu, 31 Oct 2024 14:47:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WIV-00000003pqg-41qx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730385433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X6O/3GBw63p0l5BBCUi73LPu6bFx6muuGDbHydYXVPs=;
	b=OfO/HoO+VRKOlzWQ6/BhFh3h6zTgDfZsNm6VPUAPc1RG8bw+TrZyXXoLj+kphbU7LiZ90x
	2r0n+8XsRhfL46ndWBvocyp6V+I5Ud3rXXPJAMI9tL9ujrtKM+xHTdd540g/D4tzPM+SDP
	3h/3KYc4gM9ULvuClCM/aAnjWf8su7w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-TUilnuO-P5OXOqAiSLIhVQ-1; Thu, 31 Oct 2024 10:37:09 -0400
X-MC-Unique: TUilnuO-P5OXOqAiSLIhVQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4317391101aso6200835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385428; x=1730990228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6O/3GBw63p0l5BBCUi73LPu6bFx6muuGDbHydYXVPs=;
        b=vk1fRIt2IufIBhksGy1pq67//OGKrB68AP+IphH46yOKzjivfT1evTH/5uc9xbiFfV
         t5MbRw2jCNdohv4gHLy3Dy7P2UZPem8XAKbtqykPHmxR/YvgYgDUESA4RY2yfR7NAgwL
         A45VgtYf5h5DzUpLR6m9pOMZ89sUxwBgZMiwJH79L6YbfATo006kaT1o0EjevaSyzYnY
         YK+fDA/x2ue+tdziUxOCFqyCXRQbAlZc9NBEbaJd8pwptfq4ROpXUOE1hKmFHnpo+ABw
         wTfX0voNrprH4IHrqNnC2uTS+mwlh7YsmaZSAGlszxg/5Ru8SWEZMfCglkgVVn2fPvxR
         YmeA==
X-Forwarded-Encrypted: i=1; AJvYcCWh69Gqax/Gn78VO9nlIuFohiNghjoYeYogfGVxQKrcpZ1IfFHirVElNXxZM55fllb6/qSbXug5Kc8kPyli/8Lk@lists.infradead.org
X-Gm-Message-State: AOJu0YwP4FJ2V0q68Dqt2v31oun810msTdsxmKFJhWDmRN+CZ0AXecKq
	Zft6jI7l+tga5G8ybGT6nK6dC65FOVPKhp8lrUkLgDPn0lyCI2vbKV1/qOXEaaYdX0lOKgsH6tM
	lFU9WHNOOChKdM+RmDdSSjak/eU61LRY6LJqsVFBIdDaGxsMR/DXiJyX9Zm9+A1UQCTZPTMs/
X-Received: by 2002:a05:600c:1ca9:b0:431:50cb:2398 with SMTP id 5b1f17b1804b1-4328323f576mr839905e9.2.1730385428448;
        Thu, 31 Oct 2024 07:37:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF4O9nwX/ru8zq05nFqcPwDY9v0i5+K7TjXF+z12dzOML3szYJAwB82EVvIHl/2zaVGkEuAw==
X-Received: by 2002:a05:600c:1ca9:b0:431:50cb:2398 with SMTP id 5b1f17b1804b1-4328323f576mr839685e9.2.1730385428000;
        Thu, 31 Oct 2024 07:37:08 -0700 (PDT)
Received: from [192.168.88.248] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7387sm2268534f8f.51.2024.10.31.07.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 07:37:07 -0700 (PDT)
Message-ID: <96516e40-5b1b-4bce-a041-7618c03c5de3@redhat.com>
Date: Thu, 31 Oct 2024 15:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/4] net: hsr: Add VLAN CTAG filter support
To: MD Danish Anwar <danishanwar@ti.com>, geliang@kernel.org,
 liuhangbin@gmail.com, dan.carpenter@linaro.org, jiri@resnulli.us,
 n.zhandarovich@fintech.ru, aleksander.lobakin@intel.com, lukma@denx.de,
 horms@kernel.org, jan.kiszka@siemens.com, diogo.ivo@siemens.com,
 shuah@kernel.org, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 m-malladi@ti.com
References: <20241024103056.3201071-1-danishanwar@ti.com>
 <20241024103056.3201071-3-danishanwar@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241024103056.3201071-3-danishanwar@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_073716_106979_C986E716 
X-CRM114-Status: GOOD (  26.88  )
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



On 10/24/24 12:30, MD Danish Anwar wrote:
> From: Murali Karicheri <m-karicheri2@ti.com>
> 
> This patch adds support for VLAN ctag based filtering at slave devices.
> The slave ethernet device may be capable of filtering ethernet packets
> based on VLAN ID. This requires that when the VLAN interface is created
> over an HSR/PRP interface, it passes the VID information to the
> associated slave ethernet devices so that it updates the hardware
> filters to filter ethernet frames based on VID. This patch adds the
> required functions to propagate the vid information to the slave
> devices.
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  net/hsr/hsr_device.c | 71 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
> index 0ca47ebb01d3..ff586bdc2bde 100644
> --- a/net/hsr/hsr_device.c
> +++ b/net/hsr/hsr_device.c
> @@ -515,6 +515,68 @@ static void hsr_change_rx_flags(struct net_device *dev, int change)
>  	}
>  }
>  
> +static int hsr_ndo_vlan_rx_add_vid(struct net_device *dev,
> +				   __be16 proto, u16 vid)
> +{
> +	struct hsr_port *port;
> +	struct hsr_priv *hsr;
> +	int ret = 0;
> +
> +	hsr = netdev_priv(dev);
> +
> +	hsr_for_each_port(hsr, port) {
> +		if (port->type == HSR_PT_MASTER)
> +			continue;

If the desired behavior is to ignore INTERLINK port, I think you should
explicitly skip them here, otherwise you will end-up in a
nondeterministic state.

> +		ret = vlan_vid_add(port->dev, proto, vid);
> +		switch (port->type) {
> +		case HSR_PT_SLAVE_A:
> +			if (ret) {
> +				netdev_err(dev, "add vid failed for Slave-A\n");
> +				return ret;
> +			}
> +			break;
> +
> +		case HSR_PT_SLAVE_B:
> +			if (ret) {
> +				/* clean up Slave-A */
> +				netdev_err(dev, "add vid failed for Slave-B\n");
> +				vlan_vid_del(port->dev, proto, vid);

This code relies on a specific port_list order - which is actually
respected at list creation time. Still such assumption looks fragile and
may lead to long term bugs.

I think would be better to refactor the above loop handling arbitrary
HSR_PT_SLAVE_A, HSR_PT_SLAVE_B order. Guestimate is that the complexity
will not increase measurably.

> +				return ret;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int hsr_ndo_vlan_rx_kill_vid(struct net_device *dev,
> +				    __be16 proto, u16 vid)
> +{
> +	struct hsr_port *port;
> +	struct hsr_priv *hsr;
> +
> +	hsr = netdev_priv(dev);
> +
> +	hsr_for_each_port(hsr, port) {
> +		if (port->type == HSR_PT_MASTER)
> +			continue;

I think it would be more consistent just removing the above statement...

> +		switch (port->type) {
> +		case HSR_PT_SLAVE_A:
> +		case HSR_PT_SLAVE_B:
> +			vlan_vid_del(port->dev, proto, vid);
> +			break;
> +		default:> +			break;

... MASTER and INTERLINK port will be ignored anyway.

> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct net_device_ops hsr_device_ops = {
>  	.ndo_change_mtu = hsr_dev_change_mtu,
>  	.ndo_open = hsr_dev_open,

Cheers,

Paolo



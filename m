Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D48CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=; b=p2nypFGT7HcwJBmwjTDzw+wc8X
	2eqskHCIHo+xbXqZungE4ydwDDUBAugEROSROeuTVdCQ+W6muJYvdQJJF1DzuLlsfFh5STA+0qB7j
	cJXulj2UJAonb+U+haY02Zws5JYMYa6cgV+xDH1uYgsEFIQQFBAql8WfqmKJ7lM3hQA1H/qV/521E
	Ejuw0PHVogj2FmitjljqwonL/qbJGOl5W4fNLpltJj0TBXuK+sW/e/lHZzrJoMQQztMWSiY/oPXQN
	olLmpIjOhurxAbJokCn0D59xPTE/ZpspFbZteHGpNyzNyJu70mahhlVPfxzC0GIE9Iv8Feu01u1DE
	IYheQUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNth3-00000008b0F-2tl4;
	Fri, 15 May 2026 14:39:13 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNth0-00000008azD-2EE7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 14:39:12 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-631466587e9so5150380137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778855949; x=1779460749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=imaVH3T7dY+23c2W+ANkWrSJBMknaW8AKgJiAuN0mDAgnv8L6XRZCHwiigsBykHAWR
         DjfgRi430mv5APc9vPT3DZuX+0rlhqZNcW2y7d2ZylexrnpHulH2gV1SACuw3PrXbBVi
         JpQUw+eHRJdPy9PJ/M1Ka37h57bjQpSijT0l19wl4HuyqaQIWJ2GGQW/pZbvplzMfjLe
         CCkXXviJ4gxbfn0F5LdzJr9kgtCTbTjpphDS8WO0ezkyxm3vEmmHNqjVFmfXUd0AUVqR
         OBdeQmmmS91ctEtaZpQI5kTgxTaTy9g5ly7EG41Q9dcDI9E0u2SKwWIEEScc9778zi4b
         itJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855949; x=1779460749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=nMO8vr8SNFoBwPRse0MZMGDiooeihuaxbaBVkLW8/A++3Yi52o2Jc9kWnUw1FBNOyo
         ErjXRbQnBj60PBUfKldDWNEU0EbKE59ZXxHc3E1gzvGC+1wCC/mEIlefAcjS8IVcMvNt
         h0eVgp0zUG9qBErVMxLRz7X7SvCGzxkHcCXVaDrZGixIb4ZxHVwdAWIzSQOqSNx77Y79
         liOXUfXLDy8kNPq/8hTSMciWxaCPK4qUPnep3XrsS3/Ya8VaoxtcO7vlSr2aAwMrTJ9V
         c36GxrRB0qvo6vz+SE5QUnA6U263ih/xCb/6rtfFsfOTUsuZgNX9VbryA+d1d6loZBl/
         2Hng==
X-Forwarded-Encrypted: i=1; AFNElJ8D69ZOqocQ3jV0PJ+Q0sPUHE1xC0dCgsPe5g4apeAo0o1hUMfhnk7nHwZ22TYkLoVybZ3txtI30upNyON0yHOC@lists.infradead.org
X-Gm-Message-State: AOJu0YyqREg5vR29Ofs1NggNSt7mVWolDwhq9XvkAl9luJZOIRKakvrv
	2qz3/ei7q8EeUg3ejrrub6sUdKgJpJyJeqbs8L/pxAGhb5SRrPxsQ1+GHx4gZ+1ZvQ==
X-Gm-Gg: Acq92OFb+KFNVJ8gcTyT8OLcMJh4YnjB+qgJT+D+Y1t7JdnjZDFn99P79z+kjgDc8Bv
	e7KPlkfhmbmCNbfsWw7yLeGx5m9X5sNG1XjODRsvxlWqtlq/WgBkbgMmb8yxnzuRzcPQwzoH/j9
	uZsNzDlCYYiKcL1WZClC8TELdP7KzY5wUGEeCsdgLVSDzT2/xN4Rdr60rMCQT8w7v5Uv6BJR3i+
	GygmiFR8sKWV/qoMtE/6byalqFfh32NyQ1Imr3iHEoCLyGcv539k7b8bjlMDWV6poJZDXcSKDQr
	QM4a//NrRgIDBGxAWxahX+M4xZ4tx9WHt52mLRgPRU4zE0Zh/6a0ihQY1EqCQBIsAyFIpZ4cKlN
	SUvVqjbLZadMjmSFQlnAOVuzdbPjzt9llUO3CQhWEGGtpSFn/EoqQU3C27zbZtpuiHq5fTIlRSp
	Hb3V4Q+pIUZRKHP4twfxoUa/hRXWZsQ/JBqBm1b+m99i8=
X-Received: by 2002:a05:6102:e14:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-63a3f597eb4mr2246407137.23.1778855948736;
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b3d0bdbsm51850896d6.24.2026.05.15.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Date: Fri, 15 May 2026 10:39:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key
 connectors
Message-ID: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
References: <20260515090149.3169406-1-wenst@chromium.org>
 <20260515090149.3169406-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515090149.3169406-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_073910_975944_DCD71F0B 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 90ea597d42ae..4165f71e212b 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -31,7 +31,9 @@
>  #include <linux/minmax.h>
>  #include <linux/mutex.h>
>  #include <linux/random.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/kobject.h>
>  
>  #include <linux/bitfield.h>
> @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  {
>  	int ret;
>  
> +	if (set)
> +		ret = pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> +	else
> +		ret = pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +	if (ret)
> +		return ret;
> +
>  	if (set)
>  		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  	else
>  		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  
> -	if (ret)
> +	if (ret) {
> +		if (set)
> +			pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +		else
> +			pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
>  		return ret;
> +	}
>  
>  	if (set)
>  		set_bit(port1, hub->power_bits);
> @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	struct usb_host_interface *desc;
>  	struct usb_device *hdev;
>  	struct usb_hub *hub;
> +	int ret;
>  
>  	desc = intf->cur_altsetting;
>  	hdev = interface_to_usbdev(intf);

This change is totally useless.  Didn't you get a warning from the 
compiler when you built it?

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 9ebc5ef54a32..6039e5f5dcd7 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -85,6 +85,7 @@ struct usb_hub {
>   * @port_owner: port's owner
>   * @peer: related usb2 and usb3 ports (share the same connector)
>   * @connector: USB Type-C connector
> + * @pwrseq: power sequencing descriptor for the port
>   * @req: default pm qos request for hubs without port power control
>   * @connect_type: port's connect type
>   * @state: device state of the usb device attached to the port
> @@ -104,6 +105,7 @@ struct usb_port {
>  	struct usb_dev_state *port_owner;
>  	struct usb_port *peer;
>  	struct typec_connector *connector;
> +	struct pwrseq_desc *pwrseq;
>  	struct dev_pm_qos_request *req;
>  	enum usb_port_connect_type connect_type;
>  	enum usb_device_state state;

The fact that hub.h uses struct pwrseq_desc indicates that it ought to 
#include <linux/pwrseq/consumer.h>, instead of making the .c files do 
so themselves.  Then you wouldn't have to add the #include lines to 
hub.c and port.c.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384c..2d09037fee93 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,11 +7,14 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>  
> +#include <linux/cleanup.h>

Why is this needed?

>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/component.h>
>  #include <linux/usb/of.h>
>  

Alan Stern


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F8EE83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmP87Dxran5/1UxGC1xq8Fh2q7bON67JLudsohWgZgY=; b=aQWqVQqNi8aKlLI7s7GdDdytsY
	l4S/s66WTmcWSgh8PSAFfWmwjVNYvJmpXcwlLx4pu+W1ERAkAJk+q7leUxQShvlkGhP18LqExFcrr
	GuT+GHRTFyEbTP5f2HxBofFGU0luak8n7P4P9HPuutPqJGcSKkcKO4oLk3eDLOc31cG6vXfgOOzu3
	SvrPsTa2HWe7WiWUtLJcYnbLA47fiM8xeseupbfXqHa3hJkDney9FgZoIYw7iK3s85ArtZWCJ5V3E
	mzfo1fj/jAFtxe5vM9nmlY5pgd1Vow/DqS5O0Icsov87Dawp1LCvlIdFzEs5qzYAB47DjfDj2mYqi
	IBXKFxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qH-00000006BHQ-0KSF;
	Tue, 03 Feb 2026 06:24:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qE-00000006BGW-2Bxo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 06:24:51 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59b76844f89so4984125e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 22:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770099888; x=1770704688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmP87Dxran5/1UxGC1xq8Fh2q7bON67JLudsohWgZgY=;
        b=DPJbP2LixR1Omxs4gBCwJUkfeJyn8JJH7Lm9IcemAxMW6vTqJlcVK2ZzeOyRd4CmAN
         uFFbuq9v5m/nE2zHMhOwHYEKWIUKfWTd6fENMxCzdLu9dhFNoIBMBgQyP85uHl/lDhp2
         WCEWpflq5y3e7yBp6TFQWvTushcNInsboZl5/hU7W68n5+TenqSfiUELW5NzXRkIQAmD
         W+V+vcx+q/VJ81aePVIcsur3sYIXab9K0hhYgIAuis2rpxckHQFMvGCWc9H/3z0BgOMv
         JCYmKULa59KXmu4VNZGl9CXraRWuo/ctwVyLfQAg+ty+xkUB/fSUdqYVdB4PLYZAP0PS
         VjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770099888; x=1770704688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmP87Dxran5/1UxGC1xq8Fh2q7bON67JLudsohWgZgY=;
        b=rs7oAvV7zl2Iv/klwMHFk7aUSdWnr2AxyvdDymVhdPz2Rq4HFWpj0FbRt1eGhiSqAx
         zuPwBg6fcBFvjwtQaTJND2b8zMEPNrpnQ7SVW2qc7QkEV+qI7XT5opYHhOa4pbq7vwhz
         gHmVbOxgGe8aBAcysoa5XQsRr3+pjGxOhzt2Ro445FM5IIHSg4fJocYo68kE0L9+9EIA
         WOmCzJGDQzd4lAYSRVXFOa28RFh50tBbuWG5j7HbPufxfRsUqnANiFdMK8tqnzkTRp1A
         +3ICxITbzHNQr8zHvs92M/3M0dLOYszPAGc+mw9mPhsNDWbShPM+5WWKPrnZLcztMcFJ
         tLhg==
X-Forwarded-Encrypted: i=1; AJvYcCXSFuzyetYZfHI+MqKdP20KJ9LrKPKA3uMIynJ8LqZ8npGtRj66zCCWhtggr9vICZHFM11CuUrVh3rz2LR6vqu6@lists.infradead.org
X-Gm-Message-State: AOJu0YyEwwtb6efswikpALBlhR479N9w1khBKunWyLvFRpUWCGm1RMKq
	OZ9sDftpUxh8nKEJGHmRM8vzGripklebChlW0l58/Qip5DbwrpZiQ7zR
X-Gm-Gg: AZuq6aLxzryjhNMYkR62ZPsTTVXUXuQ9e1ggo15FnPwWXJ8Ssn5RSow8LJN8vdyUIXN
	aOvdJe44vt3Y5C9zwq7Ey9i4gA0ZMzy2ULl3D8XWqdcQmYB7CU8akGIl0HaBPfkRRzIyK5rW/oJ
	eQP74H24329fR2F8DYTqARiO10+8Vo3+SqaYeLwsahNCJ1tVJV1dedmU4gLG9d8hBExyWFxXDKS
	+rZnWy9r9LD/UE3FrqDAOCVZB1pYVE3Sj1FvcvwVW2it4N4X53E5oOSuvhQmVrFPGDiglA6DSyj
	yDfBkdDuPeSej/I6Hir6kzkOj3VOkROyU5WsVPyaQ2IQ3j9cCIW8Y8kRvUDckvxCV3VW51wHDjN
	poj9utvS5Y6sIRZSuj8BBwRZmVr/pJZXZ/ixePgzOAcTx3yOXCnkTFwMfBlijax6YThmU0yPABb
	aW10J3PTyFgsoB8R4tQicQWyB7zDQsLkRB4MdVVFx/fWc48JV/0rVMmjl2NfanYtWTDU0uqA==
X-Received: by 2002:ac2:4e01:0:b0:599:11a5:54fd with SMTP id 2adb3069b0e04-59e163f57c7mr4754837e87.4.1770099888139;
        Mon, 02 Feb 2026 22:24:48 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b6fcfsm4002019e87.69.2026.02.02.22.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:24:47 -0800 (PST)
Message-ID: <bb476db0-1421-4fdd-9415-85839425f9b9@gmail.com>
Date: Tue, 3 Feb 2026 08:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Cc: r-sharma3@ti.com, gehariprasath@ti.com
References: <20260130110159.359501-1-s-adivi@ti.com>
 <20260130110159.359501-17-s-adivi@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20260130110159.359501-17-s-adivi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_222450_618174_A4D4B8CE 
X-CRM114-Status: GOOD (  19.61  )
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



On 30/01/2026 13:01, Sai Sree Kartheek Adivi wrote:
> The PKTDMA V2 is different than the existing PKTDMA supported by the
> k3-udma driver.
> 
> The changes in PKTDMA V2 are:
> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>   needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single
>   peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to
>   PEER registers to START / STOP / PAUSE / TEARDOWN.

Plus I suppose..

> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/dma/ti/k3-udma-common.c |  29 ++++-
>  drivers/dma/ti/k3-udma-v2.c     | 219 ++++++++++++++++++++++++++++++--
>  drivers/dma/ti/k3-udma.h        |   3 +
>  3 files changed, 232 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
> index ba0fc048234ac..d6459bcc17599 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -2461,12 +2461,21 @@ int pktdma_setup_resources(struct udma_dev *ud)
>  
>  	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
>  					   sizeof(unsigned long), GFP_KERNEL);
> +	bitmap_zero(ud->tchan_map, ud->tchan_cnt);
>  	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
>  				  GFP_KERNEL);
> -	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
> -					   sizeof(unsigned long), GFP_KERNEL);
> -	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> -				  GFP_KERNEL);
> +	if (ud->match_data->type == DMA_TYPE_PKTDMA_V2) {
> +		ud->rchan_map = ud->tchan_map;
> +		ud->rchans = ud->tchans;
> +		ud->chan_map = ud->tchan_map;
> +		ud->chans = ud->tchans;

It has single channel space and the TX/RX functionality alternates
within the space?
chX: TX, chX+1: TX, chX+2: RX, chX+3: TX, etc?

> +	} else {
> +		ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
> +						   sizeof(unsigned long), GFP_KERNEL);
> +		bitmap_zero(ud->rchan_map, ud->rchan_cnt);
> +		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> +					  GFP_KERNEL);
> +	}

...

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> index af06d25fd598b..6761a079025ba 100644
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c
> @@ -744,6 +744,146 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
>  	return ret;
>  }
>  
> +static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc = to_udma_chan(chan);
> +	struct udma_dev *ud = to_udma_dev(chan->device);
> +	u32 irq_ring_idx;
> +	__be32 addr[2] = {0, 0};
> +	struct of_phandle_args out_irq;
> +	int ret;

Nitpick: revers christmas tree declaration order.

-- 
Péter



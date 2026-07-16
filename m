Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74D5C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 02:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YZoRqw4V646mfHPwBC40d1B2IIwaKjX06C/hegVfHI=; b=zne0JGC9FEjuxn8QRfDOvv9ywL
	tHwLueXN0W4X+9d7ZVHoCc4vNtvKc/iDwyaQ0BR+wpy+aRKch54bXgIMeIY5YH9ipJWal7nUlEg++
	YHbqNms8uACNheHUafSjHPEdCXaru0hCBeHo0VTZyUFUg2lpH7o92sFvQIp4gtYLn8Ix1VKexGIva
	nIVK+wskf4aFD703PCib0ib7D40tfLFt1ID8Hdz6lbK8FoId3SUlE3VTDT7+DLUHf5TqU+By2TC9K
	X2ylLLi2XH3sjpc2a1QNEA/K7c4mu0Y048umDpk0b32uZN/u6o2o0BxbqL2G70FxKnYogLNE5QZw6
	Z0HxQJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCBz-0000000GIf9-13Un;
	Thu, 16 Jul 2026 02:51:19 +0000
Received: from mail-m2457.xmail.ntesmail.com ([45.195.24.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCBv-0000000GIeF-0U5W;
	Thu, 16 Jul 2026 02:51:17 +0000
Received: from [172.16.12.33] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 465f3be24;
	Thu, 16 Jul 2026 10:51:03 +0800 (GMT+08:00)
Message-ID: <ae33b62b-a207-4f4d-991a-08e003b36abe@rock-chips.com>
Date: Thu, 16 Jul 2026 10:50:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/35] phy: rockchip: usbdp: Clean up the mess
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, William Wu <william.wu@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@flipper.net>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, wmc@rock-chips.com
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <alfM6dFBovHMaYn2@venus>
From: Frank Wang <frank.wang@rock-chips.com>
In-Reply-To: <alfM6dFBovHMaYn2@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f68d5b30109d8kunmfd1a7f0d1e28fa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQhpKQlZPHh1MHUhCSU
	5KS0JWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FDMJI7YMtrsEAYHSUTOBUg7CbM/exOlB4gdt+De0hvJiq4tmKbIdtfxYHzM36rbp/zvX9TjlLDNJVEkQggt6bEkamKvD97Qn4aLDazDqIr4DvOZLOQxoz1FqxrS9Ce1o6EcU5I9VLqD0LodEemf0s/JMzUCUa9IRYckKajsUUtY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=6YZoRqw4V646mfHPwBC40d1B2IIwaKjX06C/hegVfHI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_195115_690109_50589E90 
X-CRM114-Status: GOOD (  15.58  )
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

Hi Sebastian,

On 2026/7/16 2:24, Sebastian Reichel wrote:
> Hi,
> 
> I've gone through the Sashiko feedback for v13 and I do not plan
> to submit a v14 for Sashiko feedback at this point. The issues
> it reported in v13 are either fixed in later patches - especially
> all those "pre-existing problems" - or do not apply.
> 
> The series fixes a massive amount of problems in the USBDP driver
> and unblocks USB-C DP AltMode at the same point. It would be good if
> we get this into 7.3, so that the DRM series is unblocked for 7.4
> allowing users to have USB-C DP AltMode in 2027.
> 

One thought I had was whether you've considered splitting this patch series into several smaller, targeted series, for
instance, one covering code optimizations, and separate series for distinct groups of bug fixes. This would keep each
series lean and easier for maintainers to review.


> My proposed merge strategy is to route everything through the PHY
> subsystem as the changes in the DWC3 driver are not very complex
> (purely additions), so a merge conflict should be easy to solve.
> 

On the dwc3 core changes, based on Rockchip's internal testing and experience, runtime suspend does not kick in as
intended during hotplug events. The dwc3 core uses a default autosuspend delay of 5 seconds (defined as
DWC3_DEFAULT_AUTOSUSPEND_DELAY). I think we can try to make this parameter configurable via device tree properties, as
this approach would result in a smaller, less invasive change overall.


Best regards,
Frank

> Greetings,
> 
> -- Sebastian


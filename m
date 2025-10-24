Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B233CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1oUD+BICHOTQ/+ohzJOid/WRrQzOP6u0erXNB3l774=; b=Nh0QgIMuQ50a+CdYWNP1CnLvlh
	keW8gpEjKYwb//IUyB04p6osteu4WjPd1ULyOtLVXje+31Xr6c7OD8ZXd0hP0GEx4pkiGpDYemlBL
	jnjeSd7qA54qDutaUJ4FcsIZ1xsbAGolZXlIW4yxqW7qkjDfFYzgDvrPkXwi1Qvu/aUPKiC+kHzIt
	eHKSvOJ03YP4owz+Wfjp9Hy3jCb1GEZFG/IZ2PduMT5MrOC9DD3LChtOh5t6DYrf58ERW/KqpppCG
	ZgDlpaNEjEFl/+Ck39fulnE87+n3X9r48SpzU3psqN7AXaazALukPmV4066cgGOcdLAnT8CZlKH+I
	r8i/b/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCiO-00000008bKO-3pUD;
	Fri, 24 Oct 2025 08:00:00 +0000
Received: from mail-m15597.qiye.163.com ([101.71.155.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCiL-00000008bIn-0mab;
	Fri, 24 Oct 2025 07:59:59 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 270e97439;
	Fri, 24 Oct 2025 15:59:51 +0800 (GMT+08:00)
Message-ID: <4fddba9a-b073-4bca-bd13-64a415f4bc47@rock-chips.com>
Date: Fri, 24 Oct 2025 15:59:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com> <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com> <aPn4-S7upPOOtenr@kuha.fi.intel.com>
 <3a24bd7f-c247-4541-8cf5-c1e66e2af5a0@rock-chips.com>
 <aPsuLREPS_FEV3DS@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPsuLREPS_FEV3DS@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a153b2e3e03abkunm42a5cff32ee4f7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQksYGlZCGUJPHU1DSEpNThhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QaYS+xGWbmlxS3kZEJm0a+NYYxT+z5Us5JjdoYYrwKfwWRwLPdNdoBqojU08LMSVNkW2NIt3ivjahLd1DVJdesdRGPkSC4FCyheMfrC+mvLZrgdXQB4BixWM4KY9vnwKKHrM7/OMtoXWLyQqUwV1fQRklY7nO+ZKaFuWNKD3re8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=A1oUD+BICHOTQ/+ohzJOid/WRrQzOP6u0erXNB3l774=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_005957_725304_CD838985 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Heikki,

On 10/24/2025 3:43 PM, Heikki Krogerus wrote:
>> I noticed the following statement in typec_register_altmode():
>>
>> ```
>>
>>      /* The partners are bind to drivers */
>>      if (is_typec_partner(parent))
>>          alt->adev.dev.bus = &typec_bus;
>>
>> ```
>>
>> If the condition is not met, the bus will not be set, which means bus_notify()
>> won't be able to take effect. Did I miss something?
> Right, that would be the condition that I was talking about. Only
> partner altmodes are used in the bus.
>
> Hold on! Do you need the port altmode instead of the partner altmode?
> If that's the case, then we can't use the bus notifier. So we'll need
> the separate notifier chain after all.

Yes, we need port altmode.  The partner altmode device appears too late for DRM device, as it only shows up after the corresponding DP device is inserted.


>
> Let me take a closer look at patch 2/9. Sorry about the hassle.
>
-- 
Best,
Chaoyi



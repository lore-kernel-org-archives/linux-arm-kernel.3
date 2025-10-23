Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA2ECCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFc/n1ZidqlGM2CN2Wf5PWZP2e2sySqLHIg26HxghvA=; b=UwwN76tdWgwWZjG+YV2wi3s2Qe
	ppqEH/dKta4aBKwdD09oJtlWG11iv6upEvmeO2/ScLAJwKmwwuXWG/Oj3UXDPp1kLsmP4QfEzg4bB
	bakrBmlqGfxCTRqXIuReFaSw7QZNzqUTO0qzUDA1spYrZPHLpe42rC5hNKGnFQHR7nPfow3a4AyqF
	43nG4BgTqaAhfKPpnVnP11J9NXzVJpyPOdOsOg4uIjhaS+2Sue0241i5MBt/iHSxoM3x2Wi2p0PK0
	CMxA4nR2bDAVEN5vjk4ZkkalUgISbPdK6LQrYJVFoqEwhLzI8QJ8cPz23H+iH12bG1T7G1wxn877M
	wbySqT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBthK-000000067TQ-0wDu;
	Thu, 23 Oct 2025 11:41:38 +0000
Received: from mail-m15567.qiye.163.com ([101.71.155.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBthG-000000067RJ-0EDM;
	Thu, 23 Oct 2025 11:41:35 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26f21c1b7;
	Thu, 23 Oct 2025 19:41:26 +0800 (GMT+08:00)
Message-ID: <7cd2ab42-a6b4-41d2-bd3b-be043d69ffff@rock-chips.com>
Date: Thu, 23 Oct 2025 19:41:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <9c52db41-14f3-41a8-9423-3efe604361aa@rock-chips.com>
 <aPoTPr28cBzwbH0T@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPoTPr28cBzwbH0T@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a10dfb1f003abkunm0c62c8eb19a689
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk4aTFZOQkNJHx9NSE4YThpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SoUA3p169i9C2R9xYPpzMMb2wlTBicrWBqmmeb8PWtTWXOJ1Np5Y6qFfKqeOHa46VgTrfuBvLckGkoioNw3yDj+IfLac18AkGybJz/XY5R4Z48242QSNSxNaxINNHlY8e9H864GFVJcme5maz7B7CxO9lrKNW3BBjdMZ7HrvA20=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=rFc/n1ZidqlGM2CN2Wf5PWZP2e2sySqLHIg26HxghvA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_044134_268100_724AA3DA 
X-CRM114-Status: GOOD (  15.13  )
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

On 10/23/2025 7:36 PM, Heikki Krogerus wrote:
>> Thank you for your detailed explanation. I noticed that there is a
>> device_register() action in typec_register_altmode(), so we can just take
>> advantage of this.
>>
>> Another thing is that we need to distinguish between different devices in the
>> notifier callback, as
>> typec_register_altmode()/typec_register_partner()/typec_register_plug()/typec_register_cable()
>> may all register devices. Since the data passed in bus_notify() is struct
>> device *dev, I think we can distinguish them through `dev->type.name`? We may
>> already have such names, "typec_alternate_mode", "typec_partner", "typec_plug"
>> in class.c . And then extract these names as macros and put them in the typec
>> header file.
> You don't need to worry about that. Only partner altmodes are bind to
> the bus. The device you see in the notifier will always be an altmode.
>
> But in general, if you need to identify the device type, then
> you use the device type itself, not the name of the type. It would
> require that the device types are exported, but as said, you don't
> need to worry about that in this case.

Very insightful! I will try to do this in v8 :)


>
> thanks,
>
-- 
Best,
Chaoyi



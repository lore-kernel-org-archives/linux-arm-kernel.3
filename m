Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DCDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 01:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rX64/yu/OhWoqaAPGRmOa806yP0CYEXLXKtENt1Bg4=; b=pFDgxg+xyhz7CC01a3g1riT63a
	Aqj1f5FWO1BNGPw7xrM/gpt1/vrMxNQEbikCWlocH/B0/VJe1hz15IIgTZNFF7lC9vlEupSrLXz60
	lMv6Ar7ZwVNMrpd9Fx6Nm58AbAtNrSuoncVONHJZ7aqBOAc1Hl6knXEKQtjPVszQs00BNU/mc9wI0
	qwpZh94U0ayb3vNNlpRBODGngNyWllx4l3GpqI78OKvMs9n2xvNaAwDHuOi1a0UBWjP97vR/RJ4JT
	lNi/6P9xHnUGIwye6s/4whteOL0IbWtVU9DhtPAn5O5xfybSAwyOnQv8xYh0KPoGxZDlZFbHqpNNy
	ZCCzSxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we0oU-0000000DXh8-3lhB;
	Mon, 29 Jun 2026 01:29:30 +0000
Received: from mail-m1085.netease.com ([154.81.10.85])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we0oR-0000000DXgH-0UmT;
	Mon, 29 Jun 2026 01:29:29 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4413e3e2e;
	Mon, 29 Jun 2026 09:29:10 +0800 (GMT+08:00)
Message-ID: <56c6abb8-c127-449f-9368-12f94620c2bc@rock-chips.com>
Date: Mon, 29 Jun 2026 09:29:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Xu Yang <xu.yang_2@oss.nxp.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-2-kernel@airkyi.com>
 <erx73m2ueuvbzjteadjli6aki5by4pr3hyertkkqqoqwhaa4v3@5cstmshcercx>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <erx73m2ueuvbzjteadjli6aki5by4pr3hyertkkqqoqwhaa4v3@5cstmshcercx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f10fea08b03a7kunmf966b99e214af0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBgaVhpDH0kaHhhKTh4ZTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bc5KtQ7UrGKUA1rijDG/0B4GnAe4Tbk7iG+1XzHoKWSacIyQrLgRn/wZx/UCpNfTXWV4YMlY+zS699AajY0KFrqU8mPgVl3OdvBTceFp8y15yVHWma3EgFqkkQYhFlnRAVXl6lg8VchEaO+B6yHrFQ3CnqvDkdKPMtnFtZ92LDI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=7rX64/yu/OhWoqaAPGRmOa806yP0CYEXLXKtENt1Bg4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_182927_753149_0C378CA8 
X-CRM114-Status: GOOD (  19.99  )
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

Hello Xu Yang,

On 6/26/2026 7:15 PM, Xu Yang wrote:
> On Wed, Mar 04, 2026 at 05:41:44PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The HPD function of Type-C DP is implemented through
>> drm_connector_oob_hotplug_event(). For embedded DP, it is required
>> that the DRM connector fwnode corresponds to the Type-C port fwnode.
>>
>> To describe the relationship between the DP controller and the Type-C
>> port device, we usually using drm_bridge to build a bridge chain.
>>
>> Now several USB-C controller drivers have already implemented the DP
>> HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
>> HPD bridge on USB-C connector port device.
>>
>> But this requires the USB-C controller driver to manually register the
>> HPD bridge. If the driver does not implement this feature, the bridge
>> will not be create.
>>
>> So this patch implements a generic DP HPD bridge based on
>> aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
>> Type-C port device containing the DP svid is registered, it will
>> create an HPD bridge for it without the need for the USB-C controller
>> driver to implement it.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
>>
>> (no changes since v14)
>>
>> Changes in v13:
>> - Only register drm dp hpd bridge for typec port altmode device.
>>
>> (no changes since v12)
>>
>> Changes in v11:
>> - Switch to using typec bus notifiers.
>>
>> (no changes since v10)
>>
>> Changes in v9:
>> - Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
>> DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
>> - Add more commit comment about problem background.
>>
>> Changes in v8:
>> - Merge generic DP HPD bridge into one module.
>> ---
>>
>>  drivers/gpu/drm/bridge/Kconfig                | 10 ++++
>>  drivers/gpu/drm/bridge/Makefile               |  1 +
>>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 49 +++++++++++++++++++
>>  3 files changed, 60 insertions(+)
>>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index a250afd8d662..559487aa09a9 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -30,6 +30,16 @@ config DRM_AUX_HPD_BRIDGE
>>  	  Simple bridge that terminates the bridge chain and provides HPD
>>  	  support.
>>  
>> +if DRM_AUX_HPD_BRIDGE
>> +config DRM_AUX_HPD_TYPEC_BRIDGE
>> +	tristate
>> +	depends on TYPEC || !TYPEC
>> +	default TYPEC
>> +	help
>> +	  Simple bridge that terminates the bridge chain and provides HPD
>> +	  support. It build bridge on each USB-C connector device node.
>> +endif
>> +
> 
> Should CONFIG_TYPEC_DP_ALTMODE select this one? Otherwise, we need to do it
> manually.
> 
> $ grep -nr --include=Kconfig "select DRM_AUX_HPD_BRIDGE" .
> ./drivers/soc/qcom/Kconfig:118: select DRM_AUX_HPD_BRIDGE
> ./drivers/usb/typec/ucsi/Kconfig:88:    select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> ./drivers/usb/typec/ucsi/Kconfig:99:    select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> ./drivers/usb/typec/tcpm/Kconfig:62:    select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> ./drivers/usb/typec/tcpm/Kconfig:85:    select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> 

That's a fair point. But based on the previous discussion, Heikki
point out that configurations in the TYPEC subsystem should not
select configurations from DRM.

-- 
Best, 
Chaoyi


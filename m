Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD6CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB5/oLgZQyjNeula29g1R0qnMwKqvTtythdvgE1DMgw=; b=OxykyMxLZQNwHZcBTEBvkvmHjS
	qXxxNgxixfBoT+5X4MOzR4pFk0f8N+o0KduyQp6C78EomFgr4hzBfTCmuX476HNTnTleKgOI4zcwM
	X9lZXSixCqrJgSbje5QQXDfifel2pEB/3TsSu/kLtaCc+Fd8JLuyZVc90DIl2fktfiha5IG1s9oSz
	ukcKkkdjIpyyWo/mtPE38OcH7dW6z4Zov79vOjaJR6cwkwCZVjfIP5klufBtlCpEPFDi8F5OZZw0R
	ivGmX87lEuTEBwpui2fJLKuO2VS0cyvdkQBkg3pF/EBpOkR+3PhKmGW9XNlg+as/N3HT/y6XXioAi
	G2SYthXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKunY-0000000FhjD-0yq2;
	Mon, 17 Nov 2025 08:41:20 +0000
Received: from mail-m3268.qiye.163.com ([220.197.32.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKunU-0000000Fhhf-0uel;
	Mon, 17 Nov 2025 08:41:18 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29d41b62c;
	Mon, 17 Nov 2025 16:41:08 +0800 (GMT+08:00)
Message-ID: <a3d80b63-761c-4a15-b7fb-c8a3bba8a5bd@rock-chips.com>
Date: Mon, 17 Nov 2025 16:41:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
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
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-2-kernel@airkyi.com> <aRrd48unDVdtKYH3@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aRrd48unDVdtKYH3@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a90f9990e03abkunm4cb37f2e8ef5d7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh9LGVZMTEpKSElOTUgeQhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hOFtIT19tQHGKm/AjIrU3dl9n7oTP30e+3028Vz/xpPVYhiRb5DY+GdzDQAke2B4uTj9X52JMiN7m3Q5PbecpuNBUkv1arKOXPCcGAo1RbjOs6PsLqyySe5MADqb96G35VF9Hr2XNq1Fuhgo/zOfm3gqq8ppid45A8xGVpVncIk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tB5/oLgZQyjNeula29g1R0qnMwKqvTtythdvgE1DMgw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_004116_775114_D7BF70C7 
X-CRM114-Status: GOOD (  13.79  )
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

On 11/17/2025 4:33 PM, Heikki Krogerus wrote:

> Tue, Nov 11, 2025 at 06:50:31PM +0800, Chaoyi Chen kirjoitti:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Some other part of kernel may want to know the event of typec bus.
>>
>> This patch add common notifier function to notify these event.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v9:
>> - Remove redundant header files.
>>
>> Changes in v8:
>> - Fix coding style.
>>
>>   drivers/usb/typec/Makefile        |  2 +-
>>   drivers/usb/typec/bus.h           |  2 ++
>>   drivers/usb/typec/class.c         |  2 ++
>>   drivers/usb/typec/notify.c        | 23 +++++++++++++++++++++++
>>   include/linux/usb/typec_altmode.h |  9 +++++++++
>>   5 files changed, 37 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/usb/typec/notify.c
>>
>> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
>> index 7a368fea61bc..20d09c5314d7 100644
>> --- a/drivers/usb/typec/Makefile
>> +++ b/drivers/usb/typec/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   obj-$(CONFIG_TYPEC)		+= typec.o
>> -typec-y				:= class.o mux.o bus.o pd.o retimer.o
>> +typec-y				:= class.o mux.o notify.o bus.o pd.o retimer.o
>>   typec-$(CONFIG_ACPI)		+= port-mapper.o
>>   obj-$(CONFIG_TYPEC)		+= altmodes/
>>   obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
>> index 643b8c81786d..820b59b6d434 100644
>> --- a/drivers/usb/typec/bus.h
>> +++ b/drivers/usb/typec/bus.h
>> @@ -26,6 +26,8 @@ struct altmode {
>>   	struct altmode			*plug[2];
>>   };
>>   
>> +void typec_notify_event(unsigned long event, void *data);
>> +
>>   #define to_altmode(d) container_of(d, struct altmode, adev)
>>   
>>   extern const struct bus_type typec_bus;
>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
>> index 9b2647cb199b..9d2aa3dd3f56 100644
>> --- a/drivers/usb/typec/class.c
>> +++ b/drivers/usb/typec/class.c
>> @@ -600,6 +600,8 @@ typec_register_altmode(struct device *parent,
>>   		return ERR_PTR(ret);
>>   	}
>>   
>> +	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
>> +
>>   	return &alt->adev;
>>   }
> You need to also send TYPEC_ALTMODE_UNREGISTERED notification in
> typec_unregister_altmode().
>
Sorry, I left that out. I will fix this in v10. Thank you.

-- 
Best,
Chaoyi



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88705D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7ZJhr+0x5ygBrBW8UPFMD6T08Tpdt0hEWVktbHPqtg=; b=1aasOALQlHi2TJMU2z53nPg3NC
	G5F/HHJsCRhnm7qpmzejR4GYXxl5NahZShLAkegfbg1jUUcK877cz9URSYWCWwIYSbUzI5YVjWGrN
	reaqARMaXeWUuvFj16L7ddynnqc6jvXKP6CgU5Un/AsJ0sffMPZYuvykPaAJ18fx7iM+hdro8h0At
	WB3w2U2E3A76lrurA3PcAIel86TbSfkD5V/OTiPeERHaRH/3NC8WAxmQXTMb4joDV7GLoBrqylP8u
	9QJZang+kMbLIQaMjTm3qCi4sKFQHtNt/IcPR1Ag1oogfK312b42SxNHgiFDoPP8HVOElJnYrSHg+
	7JrTrikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE3p-0000000Ew6p-34VA;
	Wed, 26 Nov 2025 11:51:49 +0000
Received: from mail-m49213.qiye.163.com ([45.254.49.213])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE3k-0000000Ew5q-2dqU;
	Wed, 26 Nov 2025 11:51:46 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2afc8ccb9;
	Wed, 26 Nov 2025 19:51:34 +0800 (GMT+08:00)
Message-ID: <e48e1918-8ee0-4ffe-93d5-e096af241f77@rock-chips.com>
Date: Wed, 26 Nov 2025 19:51:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
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
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com> <aSV_lQYJPxN7oBM-@kuha>
 <2025112554-uncaring-curator-642a@gregkh>
 <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com> <aSbLkwPG0dUzZvql@kuha>
 <2025112656-dreamland-retreat-2a65@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112656-dreamland-retreat-2a65@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ac001308e03abkunmdaa20eca5ea8c5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk4dHVZIHUIeGBhNTRlNQh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jBANWdfCXUE5gDGcQIlQs4pqUaqXDsXzhdChC4iwSgqp3kPQUaUPgNli4XbRKmNmCnFKOqtpFUnKe9D+Kt7p8xXmLhuiJ9Cw18Swcx5cYBTi/Gz5LHMm7Y0xygV99pjgLmQ02+Ajw3beBLk0/GiLF/nG8ov6UkJaZYaaBF/MbrY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=h7ZJhr+0x5ygBrBW8UPFMD6T08Tpdt0hEWVktbHPqtg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_035145_552628_141D03D8 
X-CRM114-Status: GOOD (  19.56  )
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

On 11/26/2025 7:44 PM, Greg Kroah-Hartman wrote:
> On Wed, Nov 26, 2025 at 11:42:43AM +0200, Heikki Krogerus wrote:
>> Wed, Nov 26, 2025 at 09:46:19AM +0800, Chaoyi Chen kirjoitti:
>>> On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
>>>>> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
>>>>> +{
>>>>> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
>>>>
>>>> Why look at the parent?  Doesn't the device have a type that should show
>>>> this?
>>>>
>>>> Otherwise, looks good to me.
>>>
>>> They have same deivce type "typec_altmode_dev_type".
>>> The parent device has a different device type to distinguish between
>>> port device and partner device.
>>
>> I was already wondering would it make sense to provide separate device
>> types for the port, and also plug, alternate modes, but I'm not sure
>> if that's the right thing to do.
>>
>> There is a plan to register an "altmode" also for the USB4 mode,
>> which of course is not an alternate mode. So USB4 will definitely need a
>> separate device type.
>>
>> So if we supply separate device types for the port, plug and partner
>> alternate modes, we need to supply separate device types for port, plug
>> and partner USB4 mode as well.
>>
>> We certainly can still do that, but I'm just not sure if it makes
>> sense?
>>
>> I'll prepare a new version for this and include a separate patch where
>> instead of defining separate device types for the port and plug
>> alternate modes I'll just supply helpers is_port_alternate_mode() and
>> is_plug_alternate_mode().
> 
> That feels like it would be better in the long run as it would be
> easier to "match" on the device type.
>

It make sense. But now can we first use the current "match" device type
operation and then modify them later?

> thanks,
> 
> greg k-h
> 
> 

-- 
Best, 
Chaoyi


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25C6CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbJ61tTmug1JcWEYVwCZO9erg1Aurz+LDUFUiiNDiT4=; b=yvR2IciPhUXWJtcTLBTYwNUk9O
	CTqXoMyduKS9ixmr2+saluuo/C0pcOAI2sdNZP0mDs7qy4GxcD9uGJUG6Sfa5BvICGB5UQegER/V5
	F7PN/ov6IQ63OlCCYNKhipRKuqyTloi6p7bUPONTqZYmce+nu2wd6qMx7BmbPN6lvDwH4FAJf2t19
	jRbqHIkFLWVgOvrwH+v7yIWUyKY6RNVDM0SK4Ty/4W3uoJd9LORt8Ve+/H2TxWkFsQfuQ0Ly7BPg+
	GJDtSZOY7aq4CwzsaMCglmwvkHzBw9OwJmJ5X5gCQ74vR6TzevyK5lhXMhaj/fhoD+Za5N7q/ZVu7
	ikEYi5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87U7-0000000C3hA-2e74;
	Mon, 13 Oct 2025 01:36:23 +0000
Received: from mail-m49203.qiye.163.com ([45.254.49.203])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87U3-0000000C3g5-3Cq5;
	Mon, 13 Oct 2025 01:36:21 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25a425d33;
	Mon, 13 Oct 2025 09:31:09 +0800 (GMT+08:00)
Message-ID: <b0a41372-f28a-4e2f-9590-94fe2a86f7d8@rock-chips.com>
Date: Mon, 13 Oct 2025 09:31:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-2-kernel@airkyi.com>
 <4eizpzejw43gqt5jauvkeij65rracols2voa2osflwyjrwbvun@sovgqfuhg6mc>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <4eizpzejw43gqt5jauvkeij65rracols2voa2osflwyjrwbvun@sovgqfuhg6mc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99db315d3303abkunmf2c18e8ff96737
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkgYS1ZIQh9LSU1ITEJJH0lWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BtDpGjChpSP48XE1NKo9jcl4Ni8DKvg9gZwmx1ejEbB52Pfa+kRYrhK7oEn5aQ5AakDYb/7RggtO5dn567l+twFPbz45HrVLLzoOI81hMA76pKtG8j7aBsmYKJIDji/YO4B/Lud3EvzLmEHni0K6Bgrj0VWBL7P9W8ve4ol9ntw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FbJ61tTmug1JcWEYVwCZO9erg1Aurz+LDUFUiiNDiT4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_183620_286837_95964FA5 
X-CRM114-Status: GOOD (  12.40  )
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

On 10/12/2025 12:51 AM, Dmitry Baryshkov wrote:

> On Sat, Oct 11, 2025 at 11:32:26AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Add default DRM AUX HPD bridge device when register DisplayPort
>> altmode. That makes it redundant for each Type-C driver to implement
>> a similar registration process in embedded scenarios.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v5:
>> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
>> - Place the helper functions in the same compilation unit.
>> - Add more comments about parent device.
>>
>>   drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
>>   include/linux/usb/typec_altmode.h |  2 ++
>>   2 files changed, 28 insertions(+)
>>
>>   
>> +static void dp_altmode_hpd_device_register(struct typec_altmode *alt)
>> +{
>> +	if (alt->svid != USB_TYPEC_DP_SID)
>> +		return;
>> +
>> +	/*
>> +	 * alt->dev.parent->parent : USB-C controller device
>> +	 * alt->dev.parent         : USB-C connector device
>> +	 */
>> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>> +						  to_of_node(alt->dev.parent->fwnode));
> You can not do this, unless you make TYPEC core:
>
> depends on DRM || DRM=n
> select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

You are right, Kconfig should be configured by the actual caller. Will fix in v6.


>
>> +	if (IS_ERR(alt->hpd_dev))
>> +		alt->hpd_dev = NULL;
>> +}
>> +
>>   static struct typec_altmode *
>>   typec_register_altmode(struct device *parent,
>>   		       const struct typec_altmode_desc *desc)

-- 
Best,
Chaoyi



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E51FCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 01:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGpL6uycvY2W1UtRJCq/id+/GMXz5vHEcP9JtnFabFA=; b=32dzJuKu+Z+QEV9FGl6MYwcvBI
	GtzuQp4INS9Eb22j8MRRwZ9Ga3dnHpJ6KP+S0MPyHfdHGAdD5r066MAsBKsZz8ze0X2cb3ySb14KG
	rgwqBKtVzd98/oFQEg/BzcKxuaw7qtzkpUjOz2Mtj+mNZJ4MdfS8PysrYVf44J1gYN8qv6ipS+ikw
	1G9Bjb8eM3MNbx4jFoWXh29MCq/zmkdAVjJz1W3r1IaBO2k1bOp2N2I5XrM5En5w/2pVig3i7zLYc
	/FpJdgza3eE6bqpV/Bq1Iy53eNe4EyeTcqpfOOoXWzpo5dMpEik4jBp0igVpuZ/9HTTTtJgN1hPk/
	iUZEBhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFj7I-00000008zvp-0KRk;
	Mon, 03 Nov 2025 01:12:16 +0000
Received: from mail-m12889.netease.com ([103.209.128.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFj7D-00000008zux-1zS5;
	Mon, 03 Nov 2025 01:12:13 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2818c2243;
	Mon, 3 Nov 2025 09:11:59 +0800 (GMT+08:00)
Message-ID: <39c21e9f-4958-4007-bb09-3ef40ff30d2a@rock-chips.com>
Date: Mon, 3 Nov 2025 09:11:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <kernel@airkyi.com>
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
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-2-kernel@airkyi.com> <aQS8IatWiAUzBUxd@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aQS8IatWiAUzBUxd@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a47455e0103abkunm8b2c313f943871
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5MTVYYQk0YGR1KQ0kfTx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Xf2GCOogE5JU9VFai8bfqqPO4EwB1WJ7U798BYDMShF5yADbVIRdoEeXupnhnUlWCWamERfBB8hOvuY9KC55ljPx2XdO0aSSZ4aN/YVRrfNdwUmKid0Rkhyi8liJDc6hPFcv+WVwWCoRwFPiFILAWI0NSARBI9pcgXmLDxUm+VA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=kGpL6uycvY2W1UtRJCq/id+/GMXz5vHEcP9JtnFabFA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_171212_057277_67CED759 
X-CRM114-Status: GOOD (  10.47  )
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

On 10/31/2025 9:39 PM, Heikki Krogerus wrote:

> Hi,
>
>> diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
>> new file mode 100644
>> index 000000000000..f3a7b5f5b05b
>> --- /dev/null
>> +++ b/include/linux/usb/typec_notify.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __USB_TYPEC_NOTIFY
>> +#define __USB_TYPEC_NOTIFY
>> +
>> +#include <linux/notifier.h>
> Replace that include with a forward declaration:
>
> struct notifier_block;
>
>> +enum usb_typec_event {
>> +	TYPEC_ALTMODE_REGISTERED,
>> +	TYPEC_ALTMODE_UNREGISTERED,
>> +};
>> +
>> +int typec_altmode_register_notify(struct notifier_block *nb);
>> +int typec_altmode_unregister_notify(struct notifier_block *nb);
>> +
>> +#endif /* __USB_TYPEC_NOTIFY */
> I don't see any need for a separate header file for this. Intoduce
> those in typec_altmode.h.

Will fix these in v9. Thank you.


>
> thanks,
>
-- 
Best,
Chaoyi



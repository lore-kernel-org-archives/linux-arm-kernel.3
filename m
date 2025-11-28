Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A26D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzMR4kh8D+qHm/CH7X1zLsU1wQXss4anvJFfayQtBy4=; b=mDiBlF2Iy6NftIXpYIsAsJe7sK
	sE9uYKlAd3dV8EHaGWlwIOTTsseeMzLoUfhZfHjHGHKeVAp8USpk+vyhQjYXsV8o4HMAENzfRy3nc
	85vaq4ikFBlMHNuVU07BaQKzttYVGcoEk2tCLV7OLOI0BhFwo3KyBZ8KcTnKWatSNctOqBFyTiagP
	ZvvBHu2bQ/UDCVX7mHTtSriMWX48+bEFjwm3rvFZ0cK1VFcA5380dnxdYq92EgBNXV93Wd9SOpY2p
	rx+06F4ZB8I02CLUkNrJeCLxSQOx5mSMrm4LyfL/YIMsL43ZwAl+etIFUs3VFBNICZWrMJYg8MKkJ
	wvbp88IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrlL-000000001rK-495a;
	Fri, 28 Nov 2025 06:15:23 +0000
Received: from mail-m15581.qiye.163.com ([101.71.155.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrlH-000000001qG-2Sye;
	Fri, 28 Nov 2025 06:15:21 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b39a5a25;
	Fri, 28 Nov 2025 14:15:08 +0800 (GMT+08:00)
Message-ID: <5520827b-bd13-4b32-8266-83a4eaa233c3@rock-chips.com>
Date: Fri, 28 Nov 2025 14:15:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/11] usb: typec: Set the bus also for the port and
 plug altmodes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
References: <20251128020405.90-1-kernel@airkyi.com>
 <20251128020405.90-2-kernel@airkyi.com>
 <2025112846-italicize-handled-84ff@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112846-italicize-handled-84ff@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ac919e25d03abkunm620e070778961a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNKSFZDTB5PH0MfS0hPQk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=epBLNkdbptb9cHtQ3AJCdjD21s5e//NrMhZ4LYQDQDZbqbyIEeKSKuXV6MlTHYxDLxLUS7vdWxJHsBY8X1bhIQLB4RecIM+hZIQY8C/r7BdQhoU6OKecoXikDVnuSw+ExyzNoqJiD0bVwvgDiAD2VnV3OvKJXYXaY52duX1B1n4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tzMR4kh8D+qHm/CH7X1zLsU1wQXss4anvJFfayQtBy4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_221520_119768_C77BF205 
X-CRM114-Status: GOOD (  11.86  )
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

On 11/28/2025 1:51 PM, Greg Kroah-Hartman wrote:
> On Fri, Nov 28, 2025 at 10:03:55AM +0800, Chaoyi Chen wrote:
>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>> The port and plug altmodes can't be bound to the altmode
>> drivers because the altmode drivers are meant for partner
>> communication using the VDM (vendor defined messages), but
>> they can still be part of the bus. The bus will make sure
>> that the normal bus notifications are available also with
>> the port altmodes.
>>
>> The previously used common device type for all alternate
>> modes is replaced with separate dedicated device types for
>> port, plug, and partner alternate modes.
>>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
> 
> You forgot to sign off on this :(
> 

Sorry for that. If there are no further problem on this series,
I will resend it.

-- 
Best, 
Chaoyi


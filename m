Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66DBCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJrpc/0Rjq2d5GXNAElO4nk+xNGZj/e71nP8ybvwuOs=; b=jVrIYkodqlaM81F5z7bZdgWtmP
	P/7rdgz79tEGyw57pNl1JO+RmosPbhVg0lGD192/WedB6nmWS68g1ujqptmD+QvoYxfQVtXHWS9GR
	eh9O8aK8apnSzn6OpiFDOCqTBKjn0Dgs4ZhXtnK0A1068qTdlijgPDEY4teVi/kBOr6gV42uqarQe
	gPytPK6WIvStzdcdt4qX6b+6Nb9erzdVproJ5cX2vEjRMtMiCrXBAifPllmAOHzsweE+pG8pqfk3j
	/EoyA4Ero7OCTbDwYfL13+lN01AqKCo+xlD1DrtVsVdHnBvpbhX6TdZwnho5GF7pA1qLrKu/qpgY3
	vHo0lbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSynS-00000007dZM-2ZdG;
	Fri, 29 May 2026 15:06:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSynR-00000007dZ1-1Nwm;
	Fri, 29 May 2026 15:06:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 755DB605D6;
	Fri, 29 May 2026 15:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4BA1F00893;
	Fri, 29 May 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780067208;
	bh=pJrpc/0Rjq2d5GXNAElO4nk+xNGZj/e71nP8ybvwuOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JsDy7Hxe98Rqfov8re5K/ZlPuX8sR7l1ggC434/5ZyrVJhwqp07y6MQ5doTXRyyrq
	 W26TCUfDfaPaRaX3O8KoODIC7Rpgmv/Hjp3Jy8GokNNvdmkB3EHM6OZCS01uXRlYpO
	 gKoek43VCbp8NKdOXuaQ8GVR+03XJ6zyxEvZEHm0A1WlLajFmVfC3hm03pLAD1Cud5
	 bd7jegDMNa9e44Ia9E/21BK9571tJK2oK5t/lHAwiigVE4d/kxGOi4UkiM2SjhS6Jw
	 f4yQBlUfOqdBS3CHHGaJykyR/YxmfDpgsStxDdCXcfvzhWeqJ0zd5ZqjzQyMhZceTu
	 WHjS5vLjWl7iQ==
Message-ID: <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org>
Date: Fri, 29 May 2026 18:06:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
 <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 5/29/26 08:12, Jean-Michel Hautbois wrote:
> Hi Eugen,
> 
> Le 22/05/2026 à 17:28, Eugen Hristev a écrit :
>> When requesting log status, the block might be powered off, but registers
>> are being read.
>> Avoid reading the registers if the device is not resumed, thus also avoid
>> powering up the device just for log status.
>>
>> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>> Changes in v2:
>> - changed to use pm_runtime_get_if_active()
>> - add corresponding put()
>> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
>>
>> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>> To: Mauro Carvalho Chehab <mchehab@kernel.org>
>> To: Florian Fainelli <florian.fainelli@broadcom.com>
>> To: Ray Jui <rjui@broadcom.com>
>> To: Scott Branden <sbranden@broadcom.com>
>> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>> To: Sakari Ailus <sakari.ailus@linux.intel.com>
>> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> To: Hans Verkuil <hverkuil@kernel.org>
>> To: Naushir Patuck <naush@raspberrypi.com>
>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linux-rpi-kernel@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..93815b8ab930 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
>>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>>   		 node->fmt.fmt.pix.pixelformat);
>> +
>> +	if (!pm_runtime_get_if_active(unicam->dev)) {
> 
> Well, if I am picky I would say that pm_runtime_get_if_active() can 
> return -EINVAL if runtime PM is disabled for the device. It should then 
> be tested against '<= 0' ?
> 
> I suppose this should not happen really often, as very few drivers 
> actually test this case...

I saw that. Some do. This driver enables runtime pm in probe though. So
I guess it cannot happen, unless runtime pm would not selected in kernel
config, but the driver depends on PM.

Ultimately I guess it's up to Sakari or Hans to decide whether it's
worth checking for error code, but I picked the simpler path (and
considering <depends on PM> in Kconfig) .
> 
> With or without this small change:
> Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Thanks,
> JM
> 
>> +		dev_info(unicam->dev,
>> +			 "Live data N/A due to device inactive\n");
>> +		return 0;
>> +	}
>> +
>>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
>> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
>>   	dev_info(unicam->dev, "Write pointer:       %08x\n",
>>   		 unicam_reg_read(unicam, UNICAM_IBWP));
>>   
>> +	pm_runtime_put(unicam->dev);
>> +
>>   	return 0;
>>   }
>>   
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260521-bcmpipm-6c578e73239c
>>
>> Best regards,
>> --
>> Eugen Hristev <ehristev@kernel.org>
>>
> 



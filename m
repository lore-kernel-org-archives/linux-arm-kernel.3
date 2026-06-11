Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE95CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krrZepLc8L7ZdyxdLXZXSmqgc/kvpvrj4NOD+d/PTXc=; b=Dm+xI1dzYKCKCbVFoy9vnyv0yT
	p6YjP/ufOU1o7wdg4m59Ym5yYQ2DP65TF906sLuDF6HOgy7/7MN0fQdmSNf5ubXAGK+a3t6vxZ+p0
	MSgb9Zef2PttYSC1vZd9WU5HQ3AUxnSj7E3zLdkJVurdOZKUOshcotmVDe2iEUQtb3LW8W61J9LLp
	xso3t3ev9a9Ns91oAiK7TptKtSZDeM6twRg2/Sra7Mj3oSipLq+V39I2XCwbqVxLe3NuFttsAqBjO
	IDqAi2ou71OpIlpUTNjyRpSA+U2OH21SR8BtipB4tzsDzi3Sc8M20YUUYorkCg4SpFSWZb9F6PtF9
	KadjesTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXj2o-00000009oqr-3fdN;
	Thu, 11 Jun 2026 17:18:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXj2n-00000009oqe-2Y7G;
	Thu, 11 Jun 2026 17:18:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FECD43FB4;
	Thu, 11 Jun 2026 17:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6C11F00898;
	Thu, 11 Jun 2026 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198297;
	bh=krrZepLc8L7ZdyxdLXZXSmqgc/kvpvrj4NOD+d/PTXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OdfJ7bGYPX64RxmmsVIl1+tkwn78iJVoKmBzkS5qlTv3UiEOzS1GG4O3YkTXkvZk1
	 Z+euSJS6Dyh9CBXpnD9Yzm0pfydLLx2S5T4jbXFoZc4yTIoU9ZZ5MekhWCK6S4bP41
	 qrCbAvT/h+WyLlfSxnTiE88IRqqcyz3S0tXyYQSJdJCO9KVpW4d5ilokDLv17h2QDH
	 ZEYOXylH8dGleQGm0p8uHKd1YPIJLi8hrx+8MDx/vdMhHtHE2DmoRxMnxR0sDo01J0
	 wXKTUAGBR64vbzYtIHTYeFcaZrprC7G4/Ycig1q8Frw/W4aftAQnVL79HddCVZIh+/
	 X1NhF3sJDVYMA==
Message-ID: <3b142d52-53d1-4942-bb45-1cb9645c164b@kernel.org>
Date: Thu, 11 Jun 2026 20:18:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: bcm2835-unicam: Fix log status runtime access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260611-bcmpipm-v3-1-c609dacb029f@kernel.org>
 <20260611080348.GC1758601@killaraus.ideasonboard.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260611080348.GC1758601@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 6/11/26 11:03, Laurent Pinchart wrote:
> On Thu, Jun 11, 2026 at 08:29:55AM +0300, Eugen Hristev wrote:
>> When requesting log status, the block might be powered off, but registers
>> are being read.
>> Avoid reading the registers if the device is not resumed, thus also avoid
>> powering up the device just for log status.
>>
>> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>> Changes in v3:
>> - Changed to check return value of pm_runtime_get_if_active() and only call
>>   pm_runtime_put() if the device is active.
>> - Link to v2: https://patch.msgid.link/20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org
>>
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
>>  drivers/media/platform/broadcom/bcm2835-unicam.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..96b51e29bba4 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -2043,6 +2043,7 @@ static int unicam_log_status(struct file *file, void *fh)
>>  	struct unicam_node *node = video_drvdata(file);
>>  	struct unicam_device *unicam = node->dev;
>>  	u32 reg;
>> +	int pm_active;
>>  
>>  	/* status for sub devices */
>>  	v4l2_device_call_all(&unicam->v4l2_dev, 0, core, log_status);
>> @@ -2052,6 +2053,14 @@ static int unicam_log_status(struct file *file, void *fh)
>>  		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>>  	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>>  		 node->fmt.fmt.pix.pixelformat);
>> +
>> +	pm_active = pm_runtime_get_if_active(unicam->dev);
>> +	if (!pm_active) {
>> +		dev_info(unicam->dev,
>> +			 "Live data N/A due to device inactive\n");
>> +		return 0;
>> +	}
>> +
>>  	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>>  	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>>  		 unicam_get_field(reg, UNICAM_PUM_MASK),
>> @@ -2065,6 +2074,9 @@ static int unicam_log_status(struct file *file, void *fh)
>>  	dev_info(unicam->dev, "Write pointer:       %08x\n",
>>  		 unicam_reg_read(unicam, UNICAM_IBWP));
>>  
>> +	if (pm_active == 1)
>> +		pm_runtime_put(unicam->dev);
> 
> As far as I understand, the discussion on v2 concluded there was no need
> to test pm_active here. Did I miss anything ?

Sorry, I saw the message from Sakari and he was pretty confident on the
right way, he even mentioned that all sensors should be fixed, and has
not come up with a follow up since.
If v2 is the right way, please disregard this v3

Eugen

> 
>> +
>>  	return 0;
>>  }
>>  
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260521-bcmpipm-6c578e73239c
> 



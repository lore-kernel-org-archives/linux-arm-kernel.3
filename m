Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBC9D2168D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEE0L6Gu5l6EH/93lf0qbZxWP+dxC4iioVD3I4H9awg=; b=rojle2KoOVzWLgRQXEshS2BhvF
	2C7gSLpwn6O8ex4yl+X4fM36UmFaCEa3RKcxEA8boIn7vfkNWVlwuaao8FsAP9Y/fASeBAnn0YP9T
	MXpzCCODdM0qBhNSrQ58BIwwHXuZdikJaP8WUyltzTbpztbiCOfAchb6b6cHZibY+QHgSll/X/PUd
	iI+iuPWQQsdRvxyWvFo9waxAxNUaMWaoXsNUp0cE1j3nuDC0LUqZkZdgtwDy8jEGMfhuekcHyrU5x
	uNZEyqtIbLf/7Ur4IfOtsPDrtd4fMX90gcBbA9ksFhO90XiWBgDZCTpM3drd2D5szKA+sYoIoZaRD
	1Ctk7n+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAw3-00000008BRN-2tMY;
	Thu, 04 Dec 2025 15:07:59 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAvz-00000008BQF-43VD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 15:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764860876; x=1796396876;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=urTFeoWVXYP1UTfnvMJ4zX48iZOPpLh61uW/on3qHz8=;
  b=Wx7rG9RbI8MGnZ79ky1Bhf7kBvxni3ZcfrGYX8Zv3DwJQ1iNTKunkZI+
   7BDHGDltPU4a7Uxulp26Vd1ZBQRhprxoro8R2MXvC3oQyXR8+G8TAOKVW
   Y70Tygspgk5BOp+S26vXjPloM0jU3rfIaSyt2VYP57VIIgKLmyQnkh1oc
   HPUolhpFC7sk8X8/+6DpW5M7+lwxl51s7HPeR8CbJJjjhwsPOVsUhQYXF
   THEaQvIcH6bkcqR56P7WCdekRW5doQJfXfaurQpFfKTPRC7nbNMKMZkws
   YduPxF7sirzlKAP7+qhkraor4xctUiy8Xugk3sqZVHqS0KjaKe6HzUmrH
   w==;
X-CSE-ConnectionGUID: JkXnrwqtQpu0Y6AeU4Ux4g==
X-CSE-MsgGUID: d9s/fc/FSISdCZBNLCdz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84280112"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="84280112"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:07:55 -0800
X-CSE-ConnectionGUID: umuhlK09QZSlWjUQcvTnGg==
X-CSE-MsgGUID: c3jQ5apMR2yDCSI9T6vksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194072801"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.95]) ([10.125.108.95])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:07:54 -0800
Message-ID: <77ff15d7-cdb9-46f7-9f05-97aff2dc8ee9@intel.com>
Date: Thu, 4 Dec 2025 08:07:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 carlos.song@nxp.com
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
 <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
 <aTDkODHZg0JfrZJC@lizhi-Precision-Tower-5810>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <aTDkODHZg0JfrZJC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_070756_081548_AA563C96 
X-CRM114-Status: GOOD (  12.05  )
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



On 12/3/25 6:30 PM, Frank Li wrote:
> On Wed, Dec 03, 2025 at 03:48:41PM -0700, Dave Jiang wrote:
>>
>>
>> On 10/3/25 9:26 AM, Frank Li wrote:
>>> Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
>>> cleanup and simplify error handling.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> Check patch report exceed 100 chars, but it's still better put into one
>>> line to keep consistent with other DEFINE_FREE and better readablity
>>>
>>> change in v2
>>> - remove surpoiouse remove empty line
>>> ---
>>>  include/linux/dmaengine.h | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
>>> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
>>> --- a/include/linux/dmaengine.h
>>> +++ b/include/linux/dmaengine.h
>>> @@ -5,6 +5,7 @@
>>>  #ifndef LINUX_DMAENGINE_H
>>>  #define LINUX_DMAENGINE_H
>>>
>>> +#include <linux/cleanup.h>
>>>  #include <linux/device.h>
>>>  #include <linux/err.h>
>>>  #include <linux/uio.h>
>>> @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
>>>  	return desc->desc_free(desc);
>>>  }
>>>
>>> +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
>>
>> maybe free_dma_async_tx may be clearer as the name vs dma_async_tx_descriptor.
> 
> If that, 'dmaengine_desc_free' is better because avoid create new name for
> it.

That works too.

> 
> Frank
>>
>> DJ
>>
>>> +
>>>  /* --- DMA device --- */
>>>
>>>  int dma_async_device_register(struct dma_device *device);
>>>
>>
> 



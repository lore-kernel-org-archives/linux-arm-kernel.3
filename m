Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C92AC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFjmYyF5VPe289BlZka42WgXUPRX6vAouN/83LGa2YM=; b=wmMCh5sMFq8Zb3U8QL6A+XcF0e
	EjrX7BG1LXoYIE3T6jw3uEBZioBgpMav4f0aXmoPrhY9sIsDdTNumwzeAwmQoSCWOHzo1qV89/PRf
	fTV81ghPNV6Y0ilqdu2sJG9vh+l3v27kpy+8pYEfglXIFpoGX3OusJLgvKmuiMlTY2VSO8EJyxAKD
	RAuKsAJNevjvLxYZgVEyJb17XQHoH1xhQszGWI1W5/NL/3Q9M2ciGEkUm15ydqEDRcR1VfDAutrZF
	5Yv+Y1BOs8fMXVVXvT4W5GVmIg8dDqERQSAbiJ94E430PqHh8AD6tytE2g+xnxfdgLJ2YiR/1y8wK
	0v1I8CTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmRa-0000000DVnL-0pcP;
	Thu, 23 Jul 2026 05:58:06 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmRX-0000000DVmW-1o9R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:58:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38C6F11AAAF;
	Thu, 23 Jul 2026 07:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784786280;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VFjmYyF5VPe289BlZka42WgXUPRX6vAouN/83LGa2YM=;
	b=hh68P83tVlCq+MrKUy8gJALRL7rhCyDkN1Pi00vwD2s2jdwSYHIP4Ve3cfVprbVHBiqxet
	8UgeJeTtmTYSfG5ovBt9o7mZz6YnkVe5OMuYlD+RMSfcphEJxAGXCBybdiUUTKlSk5BDPv
	IqePL5a4HrB9rNFRNhX1qhFVeD2UY4VTf3UtUce55koGDX1OANBSfjC6c5OVbfSHQA2bEA
	o+lmLwYQhS+jYBQCU0bYck+UOPDGT+3ixUj676dz8g3GaIpbjRda1OV/zYJHahn4lcbWqI
	DiredCqBq3i9rLsZWRB/d2pfqWETwWIN3JFqoO4uUcrIwsWk+BAyashW0vedlg==
Message-ID: <e1bb20f0-0cfa-b932-6817-dabbc28fe11d@nabladev.com>
Date: Thu, 23 Jul 2026 07:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Content-Language: en-US
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org
Cc: linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Xu Yilun <yilun.xu@intel.com>
References: <20260721114258.3324794-1-hs@nabladev.com>
 <2758c5dc-91fa-44a0-986e-1258afc3dbd5@amd.com>
 <855f458a-60d7-931f-9ef9-5dba2b2d916d@nabladev.com>
 <98e8e7d4-38d9-4587-bf11-0e862f87928c@amd.com>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <98e8e7d4-38d9-4587-bf11-0e862f87928c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_225803_695423_955B61FD 
X-CRM114-Status: GOOD (  16.89  )
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

Hello Michal,

On 23.07.26 07:44, Michal Simek wrote:
> 
> 
> On 7/22/26 16:45, Heiko Schocher wrote:
>> Hello Michal,
>>
>> On 22.07.26 08:55, Michal Simek wrote:
>>>
>>>
>>> On 7/21/26 13:42, Heiko Schocher wrote:
>>>> Add csi_b and rdwr pin support for the xilinx,selectmap driver.
>>>>
>>>> In current driver the pins are configured from DTS and set to
>>>> GPIOD_OUT_HIGH. This works in case you have one FPGA.
>>>>
>>>> Extend this to really implement csi_b and rdwr pin function in
>>>> driver, so it works with more than one FPGA.
>>>>
>>>> Tested on AM625 based board with 2 FPGAs connected to GPMC.
>>>>
>>>> Signed-off-by: Heiko Schocher <hs@nabladev.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - add comments from Michal
>>>>    - skip check if gpio descriptor variables csi_b/rdwr_b are valid,
>>>>      as validate_desc() checks this in gpiod_set_value() call.
>>>>    - initialize the gpio variables csi_b/rdwr_b immediately with
>>>>      the return value from devm_gpiod_get_optional(), so we can
>>>>      drop local gpio variable at all
>>>>
>>>>   drivers/fpga/xilinx-selectmap.c | 23 ++++++++++++++++-------
>>>>   1 file changed, 16 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
>>>> index d0cbb5fdfe3a..d5175f9430e4 100644
>>>> --- a/drivers/fpga/xilinx-selectmap.c
>>>> +++ b/drivers/fpga/xilinx-selectmap.c
>>>> @@ -19,6 +19,8 @@
>>>>   struct xilinx_selectmap_conf {
>>>>       struct xilinx_fpga_core core;
>>>>       void __iomem *base;
>>>> +    struct gpio_desc *csi_b;
>>>> +    struct gpio_desc *rdwr_b;
>>>>   };
>>>>   #define to_xilinx_selectmap_conf(obj) \
>>>> @@ -30,16 +32,21 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
>>>>       struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
>>>>       size_t i;
>>>> +    gpiod_set_value(conf->csi_b, GPIOD_OUT_HIGH);
>>>> +    gpiod_set_value(conf->rdwr_b, GPIOD_OUT_HIGH);
>>>
>>> I think GPIOD_OUT_HIGH/LOW is wrong in this context.
>>> If you do "git grep gpiod_set_value" you will see that values are 0/1
>> I will change it!
>>
>> Hmm.. while thinking about it... CSI_B and RDWR_B signals
>> are defined as active low...
> 
> I have never worked with this driver but values here should be 0 or 1. And if that means active 
> low/high is said via DT.
> 
> GPIOD_OUT_LOW below should mean that you are starting in deassert state (if it is low/high is coming 
> from DT). And before write you assert that line and deassert after it.

Fine for me, I rework it, thanks!

bye,
Heiko
> 
> Thanks,
> Michal
> 
> 

-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47A1C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuTN5NwqlLDJZEVsZBh6ckJC4co05P9l82YrCxQa3Ak=; b=dpzqKm01XxpP5Wodq6hQ6rVTjQ
	xYND3qtUyme+imL/doV3nsSP6PgqOCqkmx/EOZArPKQ6+RYtgFFlTW7z8sYohL+wx6RoTL4Wlsum4
	AOM1kyweHCmX9pts2xebkXHsTAp2L5kIHRKFLWJi43owA8XU+6DDHz1poa6Hx1oNqt2pjvc2HuAuR
	t2SQjqXECkz28Wd7RnB5ZhUW7+/GsKLkBIKMbg1zLjsnpYNDbktnEjqUkpbYHk3BrWRYoMl80RnEq
	Zvv9PEAFSsk2GsTHiobuYCkLUg7DASTIQ5JTc36SRVexCJXBT2DJVc9OwGRYq5Dnv4z3ysL5Dast0
	/KeolH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYCm-0000000C4Dg-3gAf;
	Wed, 22 Jul 2026 14:45:52 +0000
Received: from [2a00:f820:417:0:178:251:229:89] (helo=mx.nabladev.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYCk-0000000C4D5-2nxu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:45:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 786B711AE51;
	Wed, 22 Jul 2026 16:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784731544;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RuTN5NwqlLDJZEVsZBh6ckJC4co05P9l82YrCxQa3Ak=;
	b=C2izVZphIHqNPQJQGjpRt7TDWjO/l9yYvw5GxSQbnrzsSkFBnv5w73Sr+Ya6jUD/plKgPK
	7e3MQQIAxN378Oa9C2zluK/r0EetyjX4ZpVJlYJD4tSVq5HWfjHbxUHtpeIfXX1rl4DI8k
	ebhpRz57SxHPsv+gY63hb0MLQJW+Xm+sfE51inizy8AhSTDOC/77nK9ZEpzMP4yQrJGFqp
	CvJLfzSY0FUUU8LTFUeCudFUF+aN42lsvTckWe2OgOMBQSBiZS1m8yh4Tl4TVvcUvwbw0Y
	TbI1jShlZv+tlEODeElkWR7Itfz1GFzigP91FxOkE/jHOYJxOUXVYkbnVLDLVQ==
Message-ID: <855f458a-60d7-931f-9ef9-5dba2b2d916d@nabladev.com>
Date: Wed, 22 Jul 2026 16:45:12 +0200
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
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <2758c5dc-91fa-44a0-986e-1258afc3dbd5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_074550_930380_381F41C6 
X-CRM114-Status: GOOD (  18.70  )
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

On 22.07.26 08:55, Michal Simek wrote:
> 
> 
> On 7/21/26 13:42, Heiko Schocher wrote:
>> Add csi_b and rdwr pin support for the xilinx,selectmap driver.
>>
>> In current driver the pins are configured from DTS and set to
>> GPIOD_OUT_HIGH. This works in case you have one FPGA.
>>
>> Extend this to really implement csi_b and rdwr pin function in
>> driver, so it works with more than one FPGA.
>>
>> Tested on AM625 based board with 2 FPGAs connected to GPMC.
>>
>> Signed-off-by: Heiko Schocher <hs@nabladev.com>
>> ---
>>
>> Changes in v2:
>> - add comments from Michal
>>    - skip check if gpio descriptor variables csi_b/rdwr_b are valid,
>>      as validate_desc() checks this in gpiod_set_value() call.
>>    - initialize the gpio variables csi_b/rdwr_b immediately with
>>      the return value from devm_gpiod_get_optional(), so we can
>>      drop local gpio variable at all
>>
>>   drivers/fpga/xilinx-selectmap.c | 23 ++++++++++++++++-------
>>   1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
>> index d0cbb5fdfe3a..d5175f9430e4 100644
>> --- a/drivers/fpga/xilinx-selectmap.c
>> +++ b/drivers/fpga/xilinx-selectmap.c
>> @@ -19,6 +19,8 @@
>>   struct xilinx_selectmap_conf {
>>       struct xilinx_fpga_core core;
>>       void __iomem *base;
>> +    struct gpio_desc *csi_b;
>> +    struct gpio_desc *rdwr_b;
>>   };
>>   #define to_xilinx_selectmap_conf(obj) \
>> @@ -30,16 +32,21 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
>>       struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
>>       size_t i;
>> +    gpiod_set_value(conf->csi_b, GPIOD_OUT_HIGH);
>> +    gpiod_set_value(conf->rdwr_b, GPIOD_OUT_HIGH);
> 
> I think GPIOD_OUT_HIGH/LOW is wrong in this context.
> If you do "git grep gpiod_set_value" you will see that values are 0/1
I will change it!

Hmm.. while thinking about it... CSI_B and RDWR_B signals
are defined as active low...

Doesn't it make more sense to use here

gpiod_set_raw_value()

instead, which sets the physical levels?

Thanks!

bye,
Heiko
> 
> Thanks,
> Michal

-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A19E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyFPqMKZRrKIg1oWIoiS8WyOAY1Z2VQsk+vK4yB1cIk=; b=M6sZGUEjVH/t3wgK25v+DirCCm
	0G93NftZe6FOQqCPUqHn7i9sVkbQj2CPU7dMJ7hwiuee7dBEoyV6d3IAOhy8Lzt4auCQgQowY8B7+
	OH3+aEFZ66CF9BjlLAiT4zg99y0fgCQ7MxWBzAbdedpUSmyVqha2ybWNPyfG/7mSWZMlbXp6cd3/q
	siTA4XoAYsmph62qS1rlkbaPpuLdWt1Xqq5JGGt8YSdmBAq47wjieU9x4z84D7SWqvCHGQaOmKUnK
	8b2QJSp6AbreHGMq3etE8F2f1sF3lV1VUqqB0nu1f8SGV35XXAU2a+OwRFw6uOaBKBSpJ0ubqMLgH
	T++6VcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4iD-00000003hFo-0AJK;
	Fri, 13 Dec 2024 12:24:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4h8-00000003h4S-0krR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Dec 2024 12:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YyFPqMKZRrKIg1oWIoiS8WyOAY1Z2VQsk+vK4yB1cIk=; b=YyQep+WJrj60oO6SQ4U/bqFBGe
	o8nvcSMI4rvHYho7I7EaYFjspEpMOyu1/RdOazl5IK1n7Tvhj0JMtdSAPAECV+WhtS7O/k/QL+plq
	xDP8zpq5juOOIblpTLPk49YIGs22vvcZaAN8S59yREySW1DbJLYvO85d6U49PBsna940JBFpoZOJM
	082EC1TZ4rzhum7WjsqF0KA7krteBDSCjc6CFfuDpTryDND9K0R0urp3ubxjFe6/zuoPohKl+aU86
	Jmfs5pM+dcRWOLYS49RbTckKyvY/avXZn7Ud0ICb8Tac+5Z5NNN/9mCgAFwi40c7+JZr7ZaEgH/81
	X7+V7rAw==;
Received: from [198.47.23.249] (helo=lelv0142.ext.ti.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4h3-00000004H7f-43Fp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 12:22:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BDCMZDU004162;
	Fri, 13 Dec 2024 06:22:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734092555;
	bh=YyFPqMKZRrKIg1oWIoiS8WyOAY1Z2VQsk+vK4yB1cIk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=go8+nm+SJ92VSD84e0sq5VN9fQCbHCChomk0DxqbNfRHclTZY0zXIYon6IhXtY/qD
	 nNgfOuFrWwXFSFApUFR/uo3s9vcBvvcJmSh8+350xgKwjmzMOD+bwE5l7UgKshnQHU
	 W4fhQycDw48c+zaBQHpAWKXnmfEBvl8aHKDgcJWE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDCMZ2N106743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Dec 2024 06:22:35 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 06:22:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 06:22:35 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDCMTFB118902;
	Fri, 13 Dec 2024 06:22:30 -0600
Message-ID: <57545831-836c-4105-be59-212d01965110@ti.com>
Date: Fri, 13 Dec 2024 17:52:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net v4 2/2] net: ti: icssg-prueth: Fix
 clearing of IEP_CMP_CFG registers during iep_init
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <vigneshr@ti.com>, <matthias.schiffer@ew.tq-group.com>, <robh@kernel.org>,
        <u.kleine-koenig@baylibre.com>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20241211135941.1800240-1-m-malladi@ti.com>
 <20241211135941.1800240-3-m-malladi@ti.com>
 <3b0b84f9-d51b-4075-9d1a-5c2042ee6c4e@stanley.mountain>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <3b0b84f9-d51b-4075-9d1a-5c2042ee6c4e@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_122254_519667_ABB28CC8 
X-CRM114-Status: GOOD (  18.97  )
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



On 11/12/24 20:13, Dan Carpenter wrote:
> On Wed, Dec 11, 2024 at 07: 29: 41PM +0530, Meghana Malladi wrote: > 
> drivers/net/ethernet/ti/icssg/icss_iep. c | 9 +++++++++ > 1 file 
> changed, 9 insertions(+) > > diff --git 
> a/drivers/net/ethernet/ti/icssg/icss_iep. c 
> b/drivers/net/ethernet/ti/icssg/icss_iep. c
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uldqd1eFN22R6yXOvHOpn5WAo9_VFQH5-v8XYKsQLuIl9SMCOgfm9hmv8Rr9Y_bMWd5wpdH9mAXBiUbw5VhHCnva7cOtZgfLcnsXKK4$>
> ZjQcmQRYFpfptBannerEnd
> 
> On Wed, Dec 11, 2024 at 07:29:41PM +0530, Meghana Malladi wrote:
>>  drivers/net/ethernet/ti/icssg/icss_iep.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> index 5d6d1cf78e93..a96861debbe3 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> @@ -215,6 +215,10 @@ static void icss_iep_enable_shadow_mode(struct icss_iep *iep)
>>  	for (cmp = IEP_MIN_CMP; cmp < IEP_MAX_CMP; cmp++) {
>>  		regmap_update_bits(iep->map, ICSS_IEP_CMP_STAT_REG,
>>  				   IEP_CMP_STATUS(cmp), IEP_CMP_STATUS(cmp));
>> +
>> +		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
>> +				   IEP_CMP_CFG_CMP_EN(cmp), 0);
>> +
> 
> Don't add this blank line.
> 
> You won't detect this by running checkpatch on the patch, but if you
> apply the patch and re-run checkpatch on the file then it will complain
> about this.
> 

I see, I will remove the blank line then.

>>  	}
>>  
>>  	/* enable reset counter on CMP0 event */
>> @@ -780,6 +784,11 @@ int icss_iep_exit(struct icss_iep *iep)
>>  	}
>>  	icss_iep_disable(iep);
>>  
>> +	if (iep->pps_enabled)
>> +		icss_iep_pps_enable(iep, false);
>> +	else if (iep->perout_enabled)
>> +		icss_iep_perout_enable(iep, NULL, false);
> 
> 
> Do we need the else?  Could be written as:
> 
> 	if (iep->pps_enabled)
> 		icss_iep_pps_enable(iep, false);
> 	if (iep->perout_enabled)
> 		icss_iep_perout_enable(iep, NULL, false);
> 

pps and perout and mutually exclusive, hence used if and else if.

> regards,
> dan carpenter
> 
> 


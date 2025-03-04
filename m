Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AEBC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9Y4JwuClarjXzxVWt1JrUj/6OJyXCE1bCRokMfQHlc=; b=sGqErAdr9kFthBgv27WGGxf3Ah
	j+Y4LXAoXg3ssP/h6M/Jtu4PMel/KXVsp2bWMZ3OJ8g7d9tdpW1+pr1TwOihUOKqW56FTfOl40jnH
	MlKGcOh3dQjgxuuUTnjk4fA6aRvkkPfyBzPSSJzauI1C9hxEsTTjK5Z8JQh7m+R4zKC6OE/BCccVb
	sg52QmNDaRXXCqBjpD31hmDLhFwNka08NRviI/ZHMRRADg+qg6hK4Qve0R7AYmypRLcK9DjNvLMen
	UlR0cnqL7Zn6WeWX9+EW0McWD3gL5w6DI2+SsTPCKYuRwkTL/UK1I6gNzd5gfo58XoBX8WOK2p2Ue
	IVVr/m8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLfa-00000003FRO-0gae;
	Tue, 04 Mar 2025 06:22:22 +0000
Received: from [198.47.19.246] (helo=fllvem-ot04.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLbI-00000003EDr-2TSx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:17:58 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5246HgYw3517465
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Mar 2025 00:17:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741069062;
	bh=N9Y4JwuClarjXzxVWt1JrUj/6OJyXCE1bCRokMfQHlc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EKt6CdS/C6CBn25rAj78txKmE0D06kNV72m3EPZ0rkROu3/m+3MS2njKqxjDcCxFp
	 3BAEkq6O2IUL85Ul1fEM0yqTwL8R0voELQIKt5j+5y6awTG3jQA3Qge4sKuIkF6eKj
	 TU2XwMcBgqIWPYlYb/6W/O8bDqKjv9Suamshx1PA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5246HgB8028403;
	Tue, 4 Mar 2025 00:17:42 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 00:17:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 00:17:42 -0600
Received: from [172.24.31.59] (lt9560gk3.dhcp.ti.com [172.24.31.59])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5246HZvQ106977;
	Tue, 4 Mar 2025 00:17:36 -0600
Message-ID: <5cad21ef-a97b-4412-a399-7ace69b85356@ti.com>
Date: Tue, 4 Mar 2025 11:47:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next v3 1/2] net: ti: icss-iep: Add
 pwidth configuration for perout signal
To: Kory Maincent <kory.maincent@bootlin.com>
CC: <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <horms@kernel.org>, <jacob.e.keller@intel.com>,
        <richardcochran@gmail.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250303135124.632845-1-m-malladi@ti.com>
 <20250303135124.632845-2-m-malladi@ti.com>
 <20250303180323.1d9b51de@kmaincent-XPS-13-7390>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250303180323.1d9b51de@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_221756_785887_E077CA70 
X-CRM114-Status: GOOD (  24.18  )
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



On 3/3/2025 10:33 PM, Kory Maincent wrote:
> On Mon, 3 Mar 2025 19: 21: 23 +0530 Meghana Malladi <m-malladi@ ti. com> 
> wrote: > icss_iep_perout_enable_hw() is a common function for generating 
>  > both pps and perout signals. When enabling pps, the application needs 
>  > to only pass
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> uVdqXRfP1m17KmZFPNPjnPB9kIuFmkbGwUjWeOt4PhpPuyUdhbWQXCWjPIg3CE7zH4vA7aR5lJOdoby6lh8SIqLqdFhb$>
> ZjQcmQRYFpfptBannerEnd
> 
> On Mon, 3 Mar 2025 19:21:23 +0530
> Meghana Malladi <m-malladi@ti.com> wrote:
> 
>> icss_iep_perout_enable_hw() is a common function for generating
>> both pps and perout signals. When enabling pps, the application needs
>> to only pass enable/disable argument, whereas for perout it supports
>> different flags to configure the signal.
>> 
>> But icss_iep_perout_enable_hw() function is missing to hook the
>> configuration params passed by the app, causing perout to behave
>> same a pps (except being able to configure the period). As duty cycle
>> is also one feature which can configured for perout, incorporate this
>> in the function to get the expected signal.
> 
> ...
> 
>> IEP_SYNC_CTRL_SYNC_EN); @@ -474,7 +484,38 @@ static int
>> icss_iep_perout_enable_hw(struct icss_iep *iep, static int
>> icss_iep_perout_enable(struct icss_iep *iep, struct ptp_perout_request *req,
>> int on) {
>> -	return -EOPNOTSUPP;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&iep->ptp_clk_mutex);
>> +
>> +	/* Reject requests with unsupported flags */
>> +	if (req->flags & ~PTP_PEROUT_DUTY_CYCLE) {
>> +		ret = -EOPNOTSUPP;
>> +		goto exit;
>> +	}
> 
> The flags check does not need to be in the mutex lock.
> With this change:
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> 

Yes agreed, will move it outside the mutex lock. Thanks.

>> +	if (iep->pps_enabled) {
>> +		ret = -EBUSY;
>> +		goto exit;
>> +	}
>> +
>> +	if (iep->perout_enabled == !!on)
>> +		goto exit;
>> +
>> +	/* Set default "on" time (1ms) for the signal if not passed by the
>> app */
>> +	if (!(req->flags & PTP_PEROUT_DUTY_CYCLE)) {
>> +		req->on.sec = 0;
>> +		req->on.nsec = NSEC_PER_MSEC;
>> +	}
>> +
>> +	ret = icss_iep_perout_enable_hw(iep, req, on);
>> +	if (!ret)
>> +		iep->perout_enabled = !!on;
>> +
>> +exit:
>> +	mutex_unlock(&iep->ptp_clk_mutex);
>> +
>> +	return ret;
>>  }
>>  
>>  static void icss_iep_cap_cmp_work(struct work_struct *work)
>> @@ -553,6 +594,8 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int
>> on) rq.perout.period.nsec = 0;
>>  		rq.perout.start.sec = ts.tv_sec + 2;
>>  		rq.perout.start.nsec = 0;
>> +		rq.perout.on.sec = 0;
>> +		rq.perout.on.nsec = NSEC_PER_MSEC;
>>  		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
>>  	} else {
>>  		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
> 
> 
> 
> -- 
> Köry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://urldefense.com/v3/__https://bootlin.com__;!!G3vK! 
> TJ19I0FAUivlehxg6fb4ka96Q2RiJDOZNyHXmEeRdYIPu4Cthp- 
> iiGCHOwcUnPvn8Ek_htiuIef9PMEWGUfBEA$ <https://urldefense.com/v3/__https://bootlin.com__;!!G3vK!TJ19I0FAUivlehxg6fb4ka96Q2RiJDOZNyHXmEeRdYIPu4Cthp-iiGCHOwcUnPvn8Ek_htiuIef9PMEWGUfBEA$>
> 



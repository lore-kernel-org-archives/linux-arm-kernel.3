Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E77BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r3rjhSZYe9kTQKj1A2IGsaMEllubj0HxqoQkvuRJWA=; b=QnKkAa4bQkRIG8LPpmIRcJX6c9
	27Yq3ZStk2WYpz1FqkI8scF2T4IxaTfYDSxoacpoKhiPmaB6anjzviHXizwjya+TgFdmQdQmVjaUq
	/OKVaytljJFmxdidBtKy8vkANbLWu3ptdyFF3c6gg3k7V4UTAuUBStoNp8rdOwWn6gRVbt5CZgiQ3
	ez5UElLE/RA8EuSSFBUKetGK9vmAW/gcxjbZDo04y4mftD/+QvwQLcIvbtjquvmkII1R4W2toJs44
	hjx6qYnkTdJElBWkYQvuT3IpLD67/Rsg7+pYa6l7rfSEem2Iz8fcocBZ4+X0YLujhh+STZi+YlgIG
	/rhvr+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0czA-0000000BETp-0zXf;
	Fri, 04 Apr 2025 09:05:12 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cxL-0000000BEDF-0Tfb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:03:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53492efm3905742
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 04:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743757360;
	bh=9r3rjhSZYe9kTQKj1A2IGsaMEllubj0HxqoQkvuRJWA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=a1xOuNoTOoGYlZq8rwTVaFTaCB9vZW/Pr91RqeQ5DLIC7EI/3kJgwJYpt/m3CcAF2
	 8tNw1JqKIhy9HKS2uItCSiGMsnqUxO23c9kCfumfDatr/a2sBfu91H1vlwu+RKXZFJ
	 5shN6Sh448Drw63Gu7dCbf87KyHnkZj0lEPv/X3g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53492enC068812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 04:02:40 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 04:02:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 04:02:39 -0500
Received: from [172.24.23.235] (lt9560gk3.dhcp.ti.com [172.24.23.235])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53492XVJ083733;
	Fri, 4 Apr 2025 04:02:34 -0500
Message-ID: <fccd824b-58dc-4ab1-91c0-77c2436914c9@ti.com>
Date: Fri, 4 Apr 2025 14:32:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: ti: icss-iep: Fix possible NULL pointer
 dereference for perout request
To: Roger Quadros <rogerq@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        <dan.carpenter@linaro.org>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <namcao@linutronix.de>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <danishanwar@ti.com>
References: <20250328102403.2626974-1-m-malladi@ti.com>
 <20250328102403.2626974-4-m-malladi@ti.com>
 <0fb67fc2-4915-49af-aa20-8bdc9bed4226@kernel.org>
 <b0a099a6-33b2-49f9-9af7-580c60b98f55@ti.com>
 <469fd8d0-c72e-4ca6-87a9-2f42b180276b@redhat.com>
 <58d26423-04da-4491-9318-d4a7a1f12005@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <58d26423-04da-4491-9318-d4a7a1f12005@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_020319_260931_99D6F02E 
X-CRM114-Status: GOOD (  22.92  )
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

Hi Roger,

On 4/4/2025 1:17 PM, Roger Quadros wrote:
> 
> 
> On 03/04/2025 14:25, Paolo Abeni wrote:
>> On 4/2/25 2:37 PM, Malladi, Meghana wrote:
>>> On 4/2/2025 5:58 PM, Roger Quadros wrote:
>>>> On 28/03/2025 12:24, Meghana Malladi wrote:
>>>>> ICSS IEP driver has flags to check if perout or pps has been enabled
>>>>> at any given point of time. Whenever there is request to enable or
>>>>> disable the signal, the driver first checks its enabled or disabled
>>>>> and acts accordingly.
>>>>>
>>>>> After bringing the interface down and up, calling PPS/perout enable
>>>>> doesn't work as the driver believes PPS is already enabled,
>>>>
>>>> How? aren't we calling icss_iep_pps_enable(iep, false)?
>>>> wouldn't this disable the IEP and clear the iep->pps_enabled flag?
>>>>
>>>
>>> The whole purpose of calling icss_iep_pps_enable(iep, false) is to clear
>>> iep->pps_enabled flag, because if this flag is not cleared it hinders
>>> generating new pps signal (with the newly loaded firmware) once any of
>>> the interfaces are up (check icss_iep_perout_enable()), so instead of
>>> calling icss_iep_pps_enable(iep, false) I am just clearing the
>>> iep->pps_enabled flag.
>>
>> IDK what Roger thinks, but the above is not clear to me. I read it as
>> you are stating that icss_iep_pps_enable() indeed clears the flag, so i
>> don't see/follow the reasoning behind this change.
>>
>> Skimmir over the code, icss_iep_pps_enable() could indeed avoid clearing
>> the flag under some circumstances is that the reason?
>>
>> Possibly a more describing commit message would help.
> 
> I would expect that modifying the xxx_enabled flag should be done only
> in the icss_iep_xxx_enable() function. Doing it anywhere else will be difficult
> to track/debug in the long term.
> 

There is no problem with calling icss_iep_pps_enable() for clearing the 
pps_enable flag. Problem comes with icss_iep_perout_enable(), causing 
null pointer dereference for the NULL perout request argument we are 
passing just for clearing the perout_enable flag.

> I don't see why the flag needs to be set anywhere else. Maye better to
> improve logic inside icss_iep_pps_enable() like Paolo suggests.
> 

Ok, one thing I can do is create a ptp_perout_request to disable perout 
instead of passing NULL to icss_iep_perout_enable(). What are your 
thoughts on this ?

>>
>>>> And, what if you brought 2 interfaces of the same ICSS instances up
>>>> but put only 1 interface down and up?
>>>>
>>>
>>> Then the flag need not be disabled if only one interface is brought down
>>> because the IEP is still alive and all the IEP configuration (including
>>> pps/perout) is still valid.
>>
>> I read the above as stating this fix is not correct in such scenario,
>> leading to the wrong final state.
>>
>> I think it would be better to either give a better reasoning about this
>> change in the commit message or refactor it to handle even such scenario,
>>
>> Thanks,
>>
>> Paolo
>>
> 



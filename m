Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF2FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYUW+JoyF/G12mMwzahnbc23eTPvuYAy1EdgeaJckFw=; b=GeECY8axkZ1buT/M9HZuOhXEzA
	mK+g98JVHSJTpjMjgAs+O2Fj9EPHghQ+ONccdzuTSa/2MAuXCAEZn/Pe2gVtVpL9I2jZlUK4N3u2y
	j1HO42IpNIMWvxlHmoqVHTMnAgrmLTaQ1gYiNFOlWSivKfooxV8L9f03Kl4PQqie5Z89E+36fhBn8
	6pvnyoj9CPyDRwQ8z1m3VZDrJLGei3ZzBJvLgEFE2r/fQOt8I865qK3OaKY14VmFLH/d8yIMUmqlb
	fwHqiKAazwODH2z0WacLRM0Hzrvy1h9fvkSwHaGbNfezDJHhLxLAcfAvf6hPhot7mPc2AeypZNh1z
	fMNJXsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0crl-0000000BDQv-0nGE;
	Fri, 04 Apr 2025 08:57:33 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cpw-0000000BDCL-1NLp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 08:55:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5348sv783766828
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 03:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743756897;
	bh=CYUW+JoyF/G12mMwzahnbc23eTPvuYAy1EdgeaJckFw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fIwd/wjv9tNPGAqWuceipoxKdjUosBvrfZmw8J6brluxUGRxZXWtDFLp9q2ZJ/L65
	 7/l11pcAprXbl2tvlbAGCi1BnOCF7vdiOReLao8ExUXRmO8ncRWKyTJNaTGCH91PXP
	 qpunLiWN3HI6KJ/zWz+0USFzErUZnqPkxQjp+Sjc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5348svC1091374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Apr 2025 03:54:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Apr 2025 03:54:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 03:54:57 -0500
Received: from [172.24.23.235] (lt9560gk3.dhcp.ti.com [172.24.23.235])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5348sonl071093;
	Fri, 4 Apr 2025 03:54:51 -0500
Message-ID: <d54d6d16-8422-4506-8f9a-24628dd95471@ti.com>
Date: Fri, 4 Apr 2025 14:24:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net v3 3/3] net: ti: icss-iep: Fix possible
 NULL pointer dereference for perout request
To: Paolo Abeni <pabeni@redhat.com>, Roger Quadros <rogerq@kernel.org>,
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
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <469fd8d0-c72e-4ca6-87a9-2f42b180276b@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_015540_621006_C79AE36F 
X-CRM114-Status: GOOD (  27.74  )
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



On 4/3/2025 4:55 PM, Paolo Abeni wrote:
> On 4/2/25 2: 37 PM, Malladi, Meghana wrote: > On 4/2/2025 5: 58 PM, 
> Roger Quadros wrote: >> On 28/03/2025 12: 24, Meghana Malladi wrote: >>> 
> ICSS IEP driver has flags to check if perout or pps has been enabled >>> at
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updqndalvOwRqgXOXDPJf9wy4vKojW68gavBCIsz5DlBLvSeawwT53qgFGcvIm0ULRBQkJv028AcR194Ei9ZDPp5ily-uAw$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 4/2/25 2:37 PM, Malladi, Meghana wrote:
>> On 4/2/2025 5:58 PM, Roger Quadros wrote:
>>> On 28/03/2025 12:24, Meghana Malladi wrote:
>>>> ICSS IEP driver has flags to check if perout or pps has been enabled
>>>> at any given point of time. Whenever there is request to enable or
>>>> disable the signal, the driver first checks its enabled or disabled
>>>> and acts accordingly.
>>>>
>>>> After bringing the interface down and up, calling PPS/perout enable
>>>> doesn't work as the driver believes PPS is already enabled,
>>>
>>> How? aren't we calling icss_iep_pps_enable(iep, false)?
>>> wouldn't this disable the IEP and clear the iep->pps_enabled flag?
>>>
>> 
>> The whole purpose of calling icss_iep_pps_enable(iep, false) is to clear 
>> iep->pps_enabled flag, because if this flag is not cleared it hinders 
>> generating new pps signal (with the newly loaded firmware) once any of 
>> the interfaces are up (check icss_iep_perout_enable()), so instead of 
>> calling icss_iep_pps_enable(iep, false) I am just clearing the 
>> iep->pps_enabled flag.
> 
> IDK what Roger thinks, but the above is not clear to me. I read it as
> you are stating that icss_iep_pps_enable() indeed clears the flag, so i
> don't see/follow the reasoning behind this change.
> 

The reason behind this change is to fix the possible null pointer 
dereference which will occur when icss_iep_perout_enable(iep, NULL, 
false) is called during icss_iep_exit(), my bad for not mentioning it 
clearly in the commit message.

> Skimmir over the code, icss_iep_pps_enable() could indeed avoid clearing
> the flag under some circumstances is that the reason?
> 

icss_iep_pps_enable() does indeed clear the flag, but 
icss_iep_perout_enable() doesn't due to the null pointer dereference. So 
instead of calling these functions for clearing the flag, we can simply 
just clear the flag directly.

> Possibly a more describing commit message would help.
> 

Yes agreed. I will update it for v4.

>>> And, what if you brought 2 interfaces of the same ICSS instances up
>>> but put only 1 interface down and up?
>>>
>> 
>> Then the flag need not be disabled if only one interface is brought down 
>> because the IEP is still alive and all the IEP configuration (including 
>> pps/perout) is still valid.
> 
> I read the above as stating this fix is not correct in such scenario,
> leading to the wrong final state.
> 

No it is the correct scenario. When you bring down all the existing 
interfaces (be it one or two, when whatever is up goes down) you unload 
the existing firmware and clear the all the driver configuration (this 
flag also needs to be cleared) to ensure everything starts with a clean 
state.

> I think it would be better to either give a better reasoning about this
> change in the commit message or refactor it to handle even such scenario,
> 
> Thanks,
> 
> Paolo
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ACAC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmlvYthI9rLnavogJy8VmVfruK+HaZBcgG26Wf6LOSA=; b=XYUwzfeeoUDk3b
	h9ghBYRxQWpyO1JPbIhW4eXAGdt2F/PESukdDuallpSE6N6LNEwSucVCWQSVgyvaQruXy8y501In4
	C7okf+x8008+4CGO/AfYFHqEmDxQyFnKGjiUgqZYMM8FUwSGRPYAASV+J3azntUpbt2xTxMiUVWNM
	WUcfRa4C4dY0lqy1/DzXQUmKTAPc61w20gbTyp7ehgc6B1gR1sZThSvMn3BuVQuZIXtBppC3rbALE
	ds7MjASRBV8QUQIFws7qE6Ywd5IfKWnUeAovJz8LW7JT5ZZOYR2YYX+CsppiIHW1/tEFHcTYh+yXx
	rYvVl/DK3Jg/yZBEHXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSSC-0000000CUy3-39ZK;
	Mon, 24 Feb 2025 07:00:36 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSQe-0000000CUsk-2q8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 06:59:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51O6uT1D1418694
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 00:56:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740380189;
	bh=wmlvYthI9rLnavogJy8VmVfruK+HaZBcgG26Wf6LOSA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DLwDeCPa3O6HTmUb9JBKR3z6VaKYR6jMfbFoqSjWIeircUdFxtLnybEY6gqLcrXf8
	 Eg0IwKxxxZ84x2nDRvekpknOJTweIHy8fWY5uarrUQ6TUvY1gCz1I57of+EeIt5bJL
	 X8BiqRKkCOdfgQJgt+Rzyajr0d8REHIulOYCtdQA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51O6uSao088291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 00:56:29 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 00:56:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 00:56:27 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51O6uH5Q099717;
	Mon, 24 Feb 2025 00:56:18 -0600
Message-ID: <af1d819a-4782-4b56-9e60-20263930bf19@ti.com>
Date: Mon, 24 Feb 2025 12:26:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
To: Parvathi Pudi <parvathi@couthit.com>, Jakub Kicinski <kuba@kernel.org>
References: <20250214054702.1073139-1-parvathi@couthit.com>
 <20250214170219.22730c3b@kernel.org>
 <1348929889.600853.1739873180072.JavaMail.zimbra@couthit.local>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <1348929889.600853.1739873180072.JavaMail.zimbra@couthit.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_225900_886151_468B58EE 
X-CRM114-Status: GOOD (  19.78  )
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
Cc: nm@ti.com, Vignesh Raghavendra <vigneshr@ti.com>, praneeth@ti.com, edumazet@google.com, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh@kernel.org, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2@ti.com, basharath <basharath@couthit.com>, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan <mohan@couthit.com>, richardcochran@gmail.com, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e
 keller <jacob.e.keller@intel.com>, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh <pratheesh@ti.com>, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Parvathi,

On 18/02/25 3:36 pm, Parvathi Pudi wrote:
> 
> Hi,
> 
>> On Fri, 14 Feb 2025 11:16:52 +0530 parvathi wrote:
>>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>>> Megabit ICSS (ICSSM).
>>
>> Every individual patch must build cleanly with W=1.
>> Otherwise doing git bisections is a miserable experience.
>> --
> 
> As we mentioned in cover letter we have dependency with SOC patch.
> 
> "These patches have a dependency on an SOC patch, which we are including at the
> end of this series for reference. The SOC patch has been submitted in a separate
> thread [2] and we are awaiting for it to be merged."
> 
> SOC patch need to be applied prior applying the "net" patches. We have changed the 
> order and appended the SOC patch at the end, because SOC changes need to go into 
> linux-next but not into net-next. 
> 
> We have make sure every individual patch has compiled successfully with W=1 if we 
> apply SOC patch prior to the "net" patches.
> 

If there is any dependency in the series, the pre-requisite patch should
come before the dependent patch. In this series, SoC Patch should have
been the patch 1/10 and the warnings could have been avoided.

> 
> Thanks and Regards,
> Parvathi.

-- 
Thanks and Regards,
Danish


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8A7C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 21:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INlto//K/UEad13JFyWgRQjApVIpfNkOGuuB7xJWi2k=; b=Gn+TgavvTHvoIGJkHbNenxHFpB
	ODk65fbRfKht5JtYxrWfm9VZjc/3ZBUMs+dGhZiPDm3+O+Tm6hJOA1/5HHkOPkSwISGtGU5RxYE6E
	OJ/9fF73vRlBJ8HNmRUSR7iByKiTEh7NZ9SMGrpf9B0aDyESmsHSe9Qa6y6GD75G/xOI/hX/R8qeU
	feR1O9y235aIXkcMMnO2cBxMEjbTSaUmrIirIYsGwP4Wgy7qWaIjgQAiHIzlnU8KH7GTZssmfeMPg
	SriKOkPIBKCnYXaL++7yMCIMtz1uvpaxeH4kCaFlg8qbbTEl29GfrIya5HiFlk1kTiYCcTzwV9KYg
	Bv6wD4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxgF-000000033Mo-3mzn;
	Fri, 02 May 2025 21:12:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxdn-0000000334A-3Ety
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 21:09:53 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542L9iWX3947136
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 16:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746220184;
	bh=INlto//K/UEad13JFyWgRQjApVIpfNkOGuuB7xJWi2k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ekFpuuvjkK9kVSa25fmfD8jwUUVRzmvQKepvbRwtHKX9eL36xQMdxJWRzwERFIGGm
	 iMDmjM6dlYpkCF7ck222jwzlyK5PQokXqhgs0MhFL85/MlZifU6H0skXsiSzk7wMQo
	 aWHyDtbNuPBoLiOf/Mlbit+dKEHQpaX1lFz+GzK8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542L9ilU017320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 16:09:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 16:09:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 16:09:44 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542L9i8R035073;
	Fri, 2 May 2025 16:09:44 -0500
Message-ID: <61b0ef12-8ec6-4a9b-85dc-0fe650bd00c2@ti.com>
Date: Fri, 2 May 2025 16:09:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Beleswar Prasad <b-padhi@ti.com>, Andrew Davis
	<afd@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar
	<devarsht@lewv0571a.ent.ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-7-jm@ti.com>
 <20250502115328.mcwtslklr7m4sih7@demotion>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250502115328.mcwtslklr7m4sih7@demotion>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_140951_900326_E953E5F4 
X-CRM114-Status: GOOD (  11.14  )
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

Hi Nishanth,

On 5/2/25 6:53 AM, Nishanth Menon wrote:
> On 10:31-20250415, Judith Mendez wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> For each remote proc, reserve memory for IPC and bind the mailbox
>> assignments. Two memory regions are reserved for each remote processor.
>> The first region of 1MB of memory is used for Vring shared buffers
>> and the second region is used as external memory to the remote processor
>> for the resource table and for tracebuffer allocations.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> Acked-by: Andrew Davis <afd@ti.com>
>> Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
>> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> Could you rebase the series on latest linux-next? it looks like we
> picked up a conflict with this series.

Ok, will rebase and respin, thanks.

~ Judith

> 
> ---
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D





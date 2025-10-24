Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C517CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvFR30qFwvZDHVGLed7EJCdp64TbpYruso0PUk2iDPA=; b=3U4DAdifN9xnUK701DLKpUDGXt
	3YtDyshkuJJ/KxDq+ZN1ocVxLlcxHQUseIsyhoVHUNvFYpgsJwsEnScuND5z6TAr0XnULKmSrO6oG
	arAlAZPjb5+7jyqcruE89wFTcYpi4o3Qdw52/bneRsj7dM5IiPsZoJZJRip276sN7K0BEZo6zXbsV
	Wg82Ork83mGQjgVvxQcDWv3gQl2gzKdvRGqdkThLKm0iS7WKL6NX8ig4RDv8UwNaefWzmrEuW12/j
	Vf2ESDyja8A5YPQQeT/PA8cHgCPYJOpDVDtWcwhUtF6MRj5iQrPIH9iA8awkV6Sy3oeB+A8GOp7aM
	Z9u7y7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDPa-00000008lNT-0abj;
	Fri, 24 Oct 2025 08:44:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDPX-00000008lMK-0EHp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 08:44:36 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59O8hquH723152;
	Fri, 24 Oct 2025 03:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761295432;
	bh=ZvFR30qFwvZDHVGLed7EJCdp64TbpYruso0PUk2iDPA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PIAWQ+3ks1HLabNDuXtiE78yWF1Uy6I+QQ2OkdKTByw0Uee5iZvpFkK5lpy/M/Srk
	 sfQiJnsMDw0SokScbRv4/s79+iin2u0XXE3AYVHEMwHjQn1aIbysLrxcOh/9OT+7UR
	 eJKocEi9lwikTjSAbuD3jH+NKsbwJPuRqrYR5Hi0=
Received: from DFLE201.ent.ti.com (dfle201.ent.ti.com [10.64.6.59])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59O8hq7m3046177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 03:43:52 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 03:43:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 03:43:51 -0500
Received: from [172.24.18.185] (lt9560gk3.dhcp.ti.com [172.24.18.185])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59O8hipM077707;
	Fri, 24 Oct 2025 03:43:45 -0500
Message-ID: <dc82e53c-c565-460d-b268-26d0d5a9ed68@ti.com>
Date: Fri, 24 Oct 2025 14:13:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/6] Add AF_XDP zero copy support
To: Jacob Keller <jacob.e.keller@intel.com>, <horms@kernel.org>,
        <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
        <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
        <sdf@fomichev.me>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
        <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20251023093927.1878411-1-m-malladi@ti.com>
 <def1cb92-c0cd-440f-933a-55a5be71251b@intel.com>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <def1cb92-c0cd-440f-933a-55a5be71251b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_014435_327545_1E2E86EE 
X-CRM114-Status: GOOD (  14.63  )
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

Hi Jacob,

On 10/24/2025 6:26 AM, Jacob Keller wrote:
> 
> 
> On 10/23/2025 2:39 AM, Meghana Malladi wrote:
>> This series adds AF_XDP zero coppy support to icssg driver.
>>
>> Tests were performed on AM64x-EVM with xdpsock application [1].
>>
>> A clear improvement is seen Transmit (txonly) and receive (rxdrop)
>> for 64 byte packets. 1500 byte test seems to be limited by line
>> rate (1G link) so no improvement seen there in packet rate
>>
>> Having some issue with l2fwd as the benchmarking numbers show 0
>> for 64 byte packets after forwading first batch packets and I am
>> currently looking into it.
>>
> 
> Do you think this means there is an issue with the patches or your test
> setup?
> 
> I didn't see anything stand out as a problem to me when reading the series:
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> 

The setup is quite simple. I send broadcast traffic to the dut on which 
I run l2fwd (with xdpsock) and expect the stats to increase. But after 
4096 packets, the stats stop incrementing. And I see this issue only 
with 64 byte packet and not with 1500 byte packets. I am suspecting 
could be some race condition or some bug in our dma controller. I am 
tracking this issue and post a fix for this separately.

-- 
Thanks,
Meghana Malladi



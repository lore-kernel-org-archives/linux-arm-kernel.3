Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79404CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BZ/Pw5p7gUSP7C6Gq7z9L0Pemml3h4TZLYNOzw8Qhc=; b=M+yNGqFoJnIRZDnj+Q30s6ksZD
	BmSGpDaRyYhkHKfk1lpMU0xfLFWl03vKzePJZERvNl78G0AnGlwmarHHO1t51kW7QP6ZK/1Kktdqf
	O/HkKxZ4VM18k8pfQoeFpNWE4XP+eJ/2T0C6MxgllktLnkvEtumzo7CKT/eIDsOQamt2bALZxtjDU
	MCAwfPbaPuKmx7hBWf5+QIB/zl8DBvU2Im6GYgbAS5F4WeRLjPNtkx/VACJUvQWBLVsc0aBfq3fnk
	G1xlVJiz4gfbRWFVE6CFFLEetIl+1g55AXYCK5qEBnH2rgRY4tQL7kQFsJU6zj03VjIqwqc1vqr+M
	9i0FA5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrjh-00000005jWu-0xjZ;
	Thu, 23 Oct 2025 09:35:57 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrjf-00000005jVn-0I2e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:35:56 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59N9Z46O495866;
	Thu, 23 Oct 2025 04:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761212104;
	bh=3BZ/Pw5p7gUSP7C6Gq7z9L0Pemml3h4TZLYNOzw8Qhc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ycYUtHe89cFtfiNd7ey6DVVPRMDmkAs6MWCSrsgUsC95kjqQ1Khj/QoZYRMzlQWYe
	 OWBSfTgF9r5QvQwXvviTsfqfLg7U6o6gw+owt9LvLNNdtcr+oQrgQbBkA7RijWbS4d
	 aCGVdMICWD7lKZblaBDoxtFInUJUIgiRNwUB+1Uc=
Received: from DFLE203.ent.ti.com (dfle203.ent.ti.com [10.64.6.61])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59N9Z3XD2614512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 04:35:03 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 04:35:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 04:35:03 -0500
Received: from [172.24.18.185] (lt9560gk3.dhcp.ti.com [172.24.18.185])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59N9Yua52645085;
	Thu, 23 Oct 2025 04:34:56 -0500
Message-ID: <f8285b3a-fe38-4f7b-aada-abbae105ab98@ti.com>
Date: Thu, 23 Oct 2025 15:04:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/6] Add AF_XDP zero copy support
To: Jakub Kicinski <kuba@kernel.org>
CC: <horms@kernel.org>, <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
        <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
        <sdf@fomichev.me>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
        <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20251014105613.2808674-1-m-malladi@ti.com>
 <20251020174308.59b87130@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20251020174308.59b87130@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_023555_144071_B9A7D041 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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



On 10/21/2025 6:13 AM, Jakub Kicinski wrote:
> On Tue, 14 Oct 2025 16:26:06 +0530 Meghana Malladi wrote:
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
> 
> This series stopped applying, could you please respin?

Yes, Thanks for the heads up.

-- 
Thanks,
Meghana Malladi



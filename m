Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328CCCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSrPRCtXJQEhqr1BuGJ8W84oGetUB7hhLQoAxDn9OAw=; b=sVP4MlPYKSchFp
	n7UC/U6+L/Knoa9bwsha6asSspfS/SyzrLjWqojEY0xXCO6KdlEy8GqaCtlGUTWGvlSZrO6/A2BJp
	f91b015ahvgRN09QIWCVB/q8nay1HXzLXDCfC/gXtGH1Y7LU71R82QrNY4TV1O5/M1U3oFXmmtcGw
	lBDnZpVGe5ert4EEfIG4/YLMtafRg0ydD00fGQKwNOR9dmYhPIETS465cBLv5oWWyCUMlOyzuYs7B
	HIY2pDZ5LmEdApzgZbL2I385c6x/R2Zi61bpqvEFj/L24n/fi5NEU5q8EBmWctHDTUeRfYK8b1Pst
	FqId+sGf+9LJgR5lZ0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUQ-00000002JGo-2ZnA;
	Fri, 05 Sep 2025 14:32:34 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSGL-00000000Xwt-127x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:57:42 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5858v61n3285442;
	Fri, 5 Sep 2025 03:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757062626;
	bh=kSrPRCtXJQEhqr1BuGJ8W84oGetUB7hhLQoAxDn9OAw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L65rLMzogaTqWulEtRUm5v8L8NOgoTpdl2VCs2AYrRKilQ72FPlbbS3GQIILuT79Y
	 +HhowBCxGclATIIb9zEmJzwbs4cL2wRCCANm+r1OxHHSE0YlUSiFdVsxieBdIpN/ND
	 O2BGuMl/W6VM0yVHTMS7DjnOidnPad+rtM6mWf88=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5858v6k2251546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 03:57:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 03:57:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 03:57:06 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5858uuZp196351;
	Fri, 5 Sep 2025 03:56:57 -0500
Message-ID: <ebcf48cb-a988-423c-b6bb-9bdee75dcdae@ti.com>
Date: Fri, 5 Sep 2025 14:26:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 rpmsg-eth subnode
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        "Anwar, Md Danish" <a0501179@ti.com>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-3-danishanwar@ti.com>
 <20250903-peculiar-hot-monkey-4e7c36@kuoka>
 <d994594f-7055-47c8-842f-938cf862ffb0@ti.com>
 <f2550076-57b5-46f2-a90a-414e5f2cb8d7@kernel.org>
 <38c054a3-1835-4f91-9f89-fbe90ddba4a9@ti.com>
 <6e56f36f-70fd-4635-b83f-a221780237ba@lunn.ch>
 <9c2a863c-0c8a-4563-a58d-d59112ac45a8@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <9c2a863c-0c8a-4563-a58d-d59112ac45a8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_015741_444388_B3D01D31 
X-CRM114-Status: GOOD (  21.73  )
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 03/09/25 7:53 pm, Krzysztof Kozlowski wrote:
> On 03/09/2025 16:06, Andrew Lunn wrote:
>>>>>  	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
>>>>>  	memory-region = <&main_r5fss0_core0_dma_memory_region>,
>>>>>  			<&main_r5fss0_core0_memory_region>;
>>>>> +	rpmsg-eth-region = <&main_r5fss0_core0_memory_region_shm>;
>>>>
>>>> You already have here memory-region, so use that one.
>>>>
>>>
>>> There is a problem with using memory-region. If I add
>>> `main_r5fss0_core0_memory_region_shm` to memory region, to get this
>>> phandle from driver I would have to use
>>> 	
>>> 	of_parse_phandle(np, "memory-region", 2)
>>>
>>> Where 2 is the index for this region. But the problem is how would the
>>> driver know this index. This index can vary for different vendors and
>>> their rproc device.
>>>
>>> If some other vendor tries to use this driver but their memory-region
>>> has 3 existing entries. so this this entry will be the 4th one.
>>
>> Just adding to this, there is nothing really TI specific in this
>> system. We want the design so that any vendor can use it, just by
>> adding the needed nodes to their rpmsg node, indicating there is a
>> compatible implementation on the other end, and an indication of where
>> the shared memory is.
> 
> I don't know your drivers, but I still do not see here a problem with
> 'memory-region'. You just need to tell this common code which
> memory-region phandle by index or name is the one for rpmsg.
> 

I am able to pass this index as driver_data in the `rpmsg_device_id`.

I can work with just adding this reserved memory region to the
'memory-region'. No need to create additional node in dt.

This will be the code,

static const struct rpmsg_eth_data ti_rpmsg_eth_data = {
	.shm_region_index = 2,
};

static struct rpmsg_device_id rpmsg_eth_rpmsg_id_table[] = {
	{ .name = "ti.shm-eth", .driver_data =
(kernel_ulong_t)&ti_rpmsg_eth_data },
	{},
};

Other vendors can add separate entry to rpmsg_eth_rpmsg_id_table with
their index based on their device tree.

I am keeping the data name `ti_rpmsg_eth_data` vendor specific so that
other vendors can create their data filed and add entry to
`rpmsg_eth_rpmsg_id_table` with driver_data pointing to their data
structure.

Andrew, does this sound ok to you. I will send out a v3 once you confirm.

Krzysztof, Andrew thanks for the feedback.

-- 
Thanks and Regards,
Danish



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31C6C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxZPMPRqc2YVU3nXWwH2+2obTCBbW0fH/0Zd2nYlJcY=; b=ie10z9IKo65vU+lwMJyywvcicH
	7oALHr3gS7t/wtCw3ANdrEWYMliiIrXUQlaW+5ls+Tq6QIvsx8VLqWMHYWrYD5J2niciQ+Mmf//o+
	y7e65tDPapWA+R0hhZqRj4T3hb3ee7Ez4BsFxjfdAORV6thpL+qa3r9VB1jXdWNC/px2GAP66cFLl
	8xcvzob0rKL17+e4K3KA4wGtgdXZXqC93XbcpfzWiX1PZbhyUq4OiRxQJWeccb4DfReUZpYTbhoHx
	jPLIesB3WFgGHGhIAfHK2TYgrIqAITxTWjWMSGv4fXs8+HiLPg7fPGM3WzMyxZeAT27kx1OXleH4E
	rhf2qTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRrN-00000009FuD-1i4H;
	Tue, 18 Feb 2025 17:58:17 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRpX-00000009FV2-1XXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:56:24 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IHtwWL052717
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 18 Feb 2025 11:55:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739901358;
	bh=ZxZPMPRqc2YVU3nXWwH2+2obTCBbW0fH/0Zd2nYlJcY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vo1/Dqic6aBhdbEUDoG5pV4dOv9AL6C/o6819Wdi9txicvAyU07Afyk9eE2quGkWQ
	 sIDl04TcV4U+4liBmvLPb5rJUOQAb9CzUmHF3wUjQIu4qyVT+5TaJfhrPXitz6OhAE
	 6VCXzDUQtTXxl3OGhwHpb9Fd8R87iD1VNYu7ZSNY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IHtwW1031510;
	Tue, 18 Feb 2025 11:55:58 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 11:55:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 11:55:57 -0600
Received: from [10.249.140.156] ([10.249.140.156])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IHtn69060469;
	Tue, 18 Feb 2025 11:55:50 -0600
Message-ID: <e1800e66-9043-4add-bbc9-19a8121de2f2@ti.com>
Date: Tue, 18 Feb 2025 23:25:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/3] Add native mode XDP support
To: Jesper Dangaard Brouer <hawk@kernel.org>, <rogerq@kernel.org>,
        <danishanwar@ti.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <u.kleine-koenig@baylibre.com>, <krzysztof.kozlowski@linaro.org>,
        <dan.carpenter@linaro.org>, <schnelle@linux.ibm.com>,
        <glaroque@baylibre.com>, <rdunlap@infradead.org>,
        <diogo.ivo@siemens.com>, <jan.kiszka@siemens.com>,
        <john.fastabend@gmail.com>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250210103352.541052-1-m-malladi@ti.com>
 <285d1541-6af4-4dc3-bdcd-720bfc1f9aa4@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <285d1541-6af4-4dc3-bdcd-720bfc1f9aa4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_095623_444090_5FEEDEF3 
X-CRM114-Status: GOOD (  11.51  )
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



On 2/18/2025 9:32 PM, Jesper Dangaard Brouer wrote:
> 
> On 10/02/2025 11.33, Meghana Malladi wrote:
>> This series adds native XDP support using page_pool.
> 
> Please also describe *what driver* to adds XDP support for.
> 
> This cover letter will (by netdev maintainers) be part of the merge
> commit text.  Thus, please mention the driver name in the text.
> 
> This also applies for the Subject line.  It should either be prefix with
> "net: ti: icssg-prueth:" like you did for other patches, or be renamed
> to e.g.: "Add native mode XDP support for driver ti/icssg-prueth".
> 

Oh ok got it. Will update the subject line accordingly in v3 and follow 
the same for my upcoming patches. Thanks.

> Thanks,
> --Jesper



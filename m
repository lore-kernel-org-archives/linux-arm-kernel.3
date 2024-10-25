Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA19D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 05:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC0AZObzS5wq+HeZuDHGnanURF/3iC1yxkVC6FEekQw=; b=UKbrh8biiVqKEtjiGqf5K9isjq
	MD1cRFL7QX0bw8QoZ8TI2z/3KNxG/yXKg5ZUpQU6B3+wvT6HxXf0JZULidAqXcwMJRLG/Vj8EmPOL
	iIRNkXam9EUA6kLNgXEq2gTNeP5DmKKImRSLPC05Rqy1Y02zYcZtvmvpcBbhD2LfvecSF9+siCLwQ
	ZFJW1KC9v3jT1+RYx9z9kt8rsmzRDbXuAMhCAz+U1B97Z5Dsl7Gb32BcQgDILyif4Kb/iyMYH9qna
	KipreeBuIr7NbziQp2P72e2yIWQrZoDYU7JkYwj+sCbeyJvUfjXAkUs0CBYwA44JJ8C8p+nHOGy9m
	bXzopGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DDh-00000002bdj-2ha0;
	Fri, 25 Oct 2024 05:50:45 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DBA-00000002bI2-2WLE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 05:48:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49P5lovC086446;
	Fri, 25 Oct 2024 00:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729835270;
	bh=sC0AZObzS5wq+HeZuDHGnanURF/3iC1yxkVC6FEekQw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mvH+6nSStuBl/YUJotLEAfWJeMmrS22V2XN7PwIM84oxAIkoyjCPrtgwIUWLpEhV+
	 X3f8idDYM4OlBLzu/LugkKXoPVcOKuUgYbBQDylkDnXFoON6Cf61Kwm7xagQ3VJH7X
	 bZ9zYRiCrdBEhIMckVIEuN5o/IayUlNQ6kWWiTeQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49P5lowk020548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Oct 2024 00:47:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Oct 2024 00:47:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Oct 2024 00:47:50 -0500
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49P5ljGw087759;
	Fri, 25 Oct 2024 00:47:46 -0500
Message-ID: <060c298c-5961-467a-80dd-947c85207eea@ti.com>
Date: Fri, 25 Oct 2024 11:17:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix 1 PPS sync
To: Andrew Lunn <andrew@lunn.ch>
CC: <vigneshr@ti.com>, <horms@kernel.org>, <jan.kiszka@siemens.com>,
        <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <vadim.fedorenko@linux.dev>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20241024113140.973928-1-m-malladi@ti.com>
 <1a0a632e-0b3c-4192-8d00-51d23c15c97e@lunn.ch>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <1a0a632e-0b3c-4192-8d00-51d23c15c97e@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_224808_803202_D7F43365 
X-CRM114-Status: UNSURE (   7.31  )
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



On 25/10/24 01:25, Andrew Lunn wrote:
>> +static inline u64 icssg_readq(const void __iomem *addr)
>> +{
>> +	return readl(addr) + ((u64)readl(addr + 4) << 32);
>> +}
>> +
>> +static inline void icssg_writeq(u64 val, void __iomem *addr)
>> +{
>> +	writel(lower_32_bits(val), addr);
>> +	writel(upper_32_bits(val), addr + 4);
>> +}
> 
> Could readq() and writeq() be used, rather than your own helpers?
> 
> 	Andrew
> 
The addresses we are trying to read here are not 64-bit aligned, hence 
using our own helpers to read the 64-bit value.

Regards,
Meghana


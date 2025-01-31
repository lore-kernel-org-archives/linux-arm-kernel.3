Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C45EC02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txeCRAIdPO+e/D/1UYE1ijdvN/A7W6E+9Zh15YwDDNA=; b=A7CU84hEY8Sntj7mHpyxEPV7VN
	Ppnl0duvMmwwJFiDtSNiqM9cDIQpVcD6Z0gFkqUmN1Bq/6uMdE1tEBwNRMm5t7tbz/pA+17G1KPeT
	8Hs0mT99iAg1xvfOOdY5BcUat0nTFt35gwIGIAkUlSoDP3BAp5Ey7bM4wYfNiGsQRVRkgB81XlOU2
	608n8nHnEq2qJDywrAAmhEc8URUmj4YmzFXRFri2PkQUlOhvpEYU7zv7aZQa9KH/DVCLXajgh1zDE
	kSXawzcpi0EnReykYzRxzaFjxiJ7Fdb9rzQF1kbiDNCTV4hynUK5g7COYaYrb5w7pK00Xf/ipEleW
	ZsxTCrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tds6j-0000000AmZy-15H9;
	Fri, 31 Jan 2025 14:34:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tds5O-0000000AmUI-3JR2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 14:33:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB58497;
	Fri, 31 Jan 2025 06:33:59 -0800 (PST)
Received: from [10.1.32.52] (e122027.cambridge.arm.com [10.1.32.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6109E3F63F;
	Fri, 31 Jan 2025 06:33:30 -0800 (PST)
Message-ID: <f343c126-fed9-4209-a18d-61a4e604db2f@arm.com>
Date: Fri, 31 Jan 2025 14:33:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability value
 when FIFO size isn't specified
To: Andrew Lunn <andrew@lunn.ch>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Yanteng Si <si.yanteng@linux.dev>,
 Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <07af1102-0fa7-45ad-bcbc-aef0295ceb63@arm.com>
 <fc08926d-b9af-428f-8811-4bfe08acc5b7@lunn.ch>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <fc08926d-b9af-428f-8811-4bfe08acc5b7@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_063334_880504_78E83337 
X-CRM114-Status: GOOD (  23.00  )
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

On 31/01/2025 14:15, Andrew Lunn wrote:
> On Fri, Jan 31, 2025 at 09:46:41AM +0000, Steven Price wrote:
>> On 27/01/2025 01:38, Kunihiko Hayashi wrote:
>>> When Tx/Rx FIFO size is not specified in advance, the driver checks if
>>> the value is zero and sets the hardware capability value in functions
>>> where that value is used.
>>>
>>> Consolidate the check and settings into function stmmac_hw_init() and
>>> remove redundant other statements.
>>>
>>> If FIFO size is zero and the hardware capability also doesn't have upper
>>> limit values, return with an error message.
>>
>> This patch breaks my Firefly RK3288 board. It appears that all of the 
>> following are true:
>>
>>  * priv->plat->rx_fifo_size == 0
>>  * priv->dma_cap.rx_fifo_size == 0
>>  * priv->plat->tx_fifo_size == 0
>>  * priv->dma_cap.tx_fifo_size == 0
>>
>> Simply removing the "return -ENODEV" lines gets this platform working 
>> again (and AFAICT matches the behaviour before this patch was applied).
>> I'm not sure whether this points to another bug causing these to 
>> all be zero or if this is just an oversight. The below patch gets my 
>> board working:
> 
> Thanks for the quick report of the problem.
> 
> Your 'fix' basically just reverts the patch. Let first try to
> understand what is going on, and fix the patch. We can do a revert
> later if we cannot find a better solution.

Sure thing - I wasn't entirely sure if the patch was just to 'tidy up'
the code (in which case my code keeps the consolidation). I'm not
familiar with this area so I'll let you figure out if there's a better
solution.

> I'm guessing, but in your setup, i assume the value is never written
> to a register, hence 0 is O.K. e.g. dwmac1000_dma_operation_mode_rx(),
> the fifosz value is used to determine if flow control can be used, but
> is otherwise ignored.

I haven't traced the code, but that fits my assumptions too.

> We should determine which versions of stmmac actually need values, and
> limit the test to those versions.

If you want me to try out a patch or do any more investigations then
just let me know.

Thanks,

Steve



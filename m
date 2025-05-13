Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB4DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mE88zcY2X1p4mvw+nTu0FWHvQdAVxVuWNqjWxk7qu9I=; b=up3iQ2hQbjL2+SOu8tlth8p1hv
	R+x6KnPsqZKu8cUfkPJb/K0MFUmWKgoU0WKlMO0d5jlw/yspj5msBtLAgo2zWUmTLJZqbRs6WaApX
	Eb5rYJFcoyKyQwyV0mWxfXlabiIVlNz11kqzmFkFuDb7P8GdlgUJOFil/amLpBE8lVQeQVfzRgISX
	Cz/NgEPGOzdj4J5svwKr4kykGiLuwEdgWuGM6no8L1VvWBUZerixN1zY0AvBDSVdZrcBhpqW25zMK
	EL285sLLRazRN0vgmG0NS5b3Qa5H8LSt5vd7ko+C3Vdak9vajXtn10rsEN/T7hX/EtwWMjh6r0OeG
	gjIyWr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErAJ-0000000ChqL-3dPX;
	Tue, 13 May 2025 15:03:32 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr7w-0000000ChN8-1uKC;
	Tue, 13 May 2025 15:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=mE88zcY2X1p4mvw+nTu0FWHvQdAVxVuWNqjWxk7qu9I=;
	b=AsCqCO8UJkR9X5Ckmm1k+1vNpSX7uQnwpbi/9IgvOJZE5n9bZ/L5IgYffmkDVt
	YCkvcnDZq9b0G4/3XNnA1R8iuEpItnXEeo/Ikp/n5VgqXenRjLXmnjZ4zmJKsZqk
	bhD2VKhJb9vqEMVxKpE+8Bh8qMmhiUFCAhqYmPeQCc2II=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wBHsFiBXiNovmmgBA--.7222S2;
	Tue, 13 May 2025 23:00:18 +0800 (CST)
Message-ID: <3cf413ee-b70f-4bd1-8a43-3e64fdd5bff9@163.com>
Date: Tue, 13 May 2025 23:00:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] PCI: rockchip-host: Refactor IRQ handling with info
 arrays
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250509155402.377923-1-18255117159@163.com>
 <20250509155402.377923-4-18255117159@163.com>
 <20250513104020.GC2003346@rocinante>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250513104020.GC2003346@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHsFiBXiNovmmgBA--.7222S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jw1rKr4fAw1DGr1fJFykAFb_yoWxJw4xpw
	48tFnrAr4UXr1xZ3sIyF98J3WrJrnI9aykCw15G3y7A3Wvvwn0gF1jvF9xGw1IgFWDXw4I
	9w47WFn7CF4UCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIiihUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwRMo2gjWgSfUwAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_080105_351660_38338138 
X-CRM114-Status: GOOD (  18.99  )
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



On 2025/5/13 18:40, Krzysztof Wilczyński wrote:
> Hello,
> 
> Thank you for the patch and the proposed changes.
> 
>> Replace repetitive if-conditions for IRQ status checks with structured
>> arrays (`pcie_subsys_irq_info` and `pcie_client_irq_info`) and loop-based
>> logging. This simplifies maintenance and reduces code duplication.
> [...]
>> +static const struct rockchip_irq_info pcie_subsys_irq_info[] = {
>> +	{ PCIE_CORE_INT_PRFPE,
>> +	  "parity error detected while reading from the PNP receive FIFO RAM" },
>> +	{ PCIE_CORE_INT_CRFPE,
>> +	  "parity error detected while reading from the Completion Receive FIFO RAM" },
>> +	{ PCIE_CORE_INT_RRPE,
>> +	  "parity error detected while reading from replay buffer RAM" },
>> +	{ PCIE_CORE_INT_PRFO, "overflow occurred in the PNP receive FIFO" },
>> +	{ PCIE_CORE_INT_CRFO,
>> +	  "overflow occurred in the completion receive FIFO" },
>> +	{ PCIE_CORE_INT_RT, "replay timer timed out" },
>> +	{ PCIE_CORE_INT_RTR,
>> +	  "replay timer rolled over after 4 transmissions of the same TLP" },
>> +	{ PCIE_CORE_INT_PE, "phy error detected on receive side" },
>> +	{ PCIE_CORE_INT_MTR, "malformed TLP received from the link" },
>> +	{ PCIE_CORE_INT_UCR, "Unexpected Completion received from the link" },
>> +	{ PCIE_CORE_INT_FCE,
>> +	  "an error was observed in the flow control advertisements from the other side" },
>> +	{ PCIE_CORE_INT_CT, "a request timed out waiting for completion" },
>> +	{ PCIE_CORE_INT_UTC, "unmapped TC error" },
>> +	{ PCIE_CORE_INT_MMVC, "MSI mask register changes" },
>> +};
>> +
>> +static const struct rockchip_irq_info pcie_client_irq_info[] = {
>> +	{ PCIE_CLIENT_INT_LEGACY_DONE, "legacy done" },
>> +	{ PCIE_CLIENT_INT_MSG, "message done" },
>> +	{ PCIE_CLIENT_INT_HOT_RST, "hot reset" },
>> +	{ PCIE_CLIENT_INT_DPA, "dpa" },
>> +	{ PCIE_CLIENT_INT_FATAL_ERR, "fatal error" },
>> +	{ PCIE_CLIENT_INT_NFATAL_ERR, "Non fatal error" },
>> +	{ PCIE_CLIENT_INT_CORR_ERR, "correctable error" },
>> +	{ PCIE_CLIENT_INT_PHY, "phy" },
>> +};
>> +
>>   static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
>>   {
>>   	u32 status;
>> @@ -411,47 +450,11 @@ static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *arg)
>>   	if (reg & PCIE_CLIENT_INT_LOCAL) {
>>   		dev_dbg(dev, "local interrupt received\n");
>>   		sub_reg = rockchip_pcie_read(rockchip, PCIE_CORE_INT_STATUS);
>> -		if (sub_reg & PCIE_CORE_INT_PRFPE)
>> -			dev_dbg(dev, "parity error detected while reading from the PNP receive FIFO RAM\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_CRFPE)
>> -			dev_dbg(dev, "parity error detected while reading from the Completion Receive FIFO RAM\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_RRPE)
>> -			dev_dbg(dev, "parity error detected while reading from replay buffer RAM\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_PRFO)
>> -			dev_dbg(dev, "overflow occurred in the PNP receive FIFO\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_CRFO)
>> -			dev_dbg(dev, "overflow occurred in the completion receive FIFO\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_RT)
>> -			dev_dbg(dev, "replay timer timed out\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_RTR)
>> -			dev_dbg(dev, "replay timer rolled over after 4 transmissions of the same TLP\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_PE)
>> -			dev_dbg(dev, "phy error detected on receive side\n");
>>   
>> -		if (sub_reg & PCIE_CORE_INT_MTR)
>> -			dev_dbg(dev, "malformed TLP received from the link\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_UCR)
>> -			dev_dbg(dev, "Unexpected Completion received from the link\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_FCE)
>> -			dev_dbg(dev, "an error was observed in the flow control advertisements from the other side\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_CT)
>> -			dev_dbg(dev, "a request timed out waiting for completion\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_UTC)
>> -			dev_dbg(dev, "unmapped TC error\n");
>> -
>> -		if (sub_reg & PCIE_CORE_INT_MMVC)
>> -			dev_dbg(dev, "MSI mask register changes\n");
>> +		for (int i = 0; i < ARRAY_SIZE(pcie_subsys_irq_info); i++) {
>> +			if (sub_reg & pcie_subsys_irq_info[i].bit)
>> +				dev_dbg(dev, "%s\n", pcie_subsys_irq_info[i].msg);
>> +		}
>>   
>>   		rockchip_pcie_write(rockchip, sub_reg, PCIE_CORE_INT_STATUS);
>>   	} else if (reg & PCIE_CLIENT_INT_PHY) {
>> @@ -473,29 +476,12 @@ static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *arg)
>>   	u32 reg;
>>   
>>   	reg = rockchip_pcie_read(rockchip, PCIE_CLIENT_INT_STATUS);
>> -	if (reg & PCIE_CLIENT_INT_LEGACY_DONE)
>> -		dev_dbg(dev, "legacy done interrupt received\n");
>> -
>> -	if (reg & PCIE_CLIENT_INT_MSG)
>> -		dev_dbg(dev, "message done interrupt received\n");
>>   
>> -	if (reg & PCIE_CLIENT_INT_HOT_RST)
>> -		dev_dbg(dev, "hot reset interrupt received\n");
>> -
>> -	if (reg & PCIE_CLIENT_INT_DPA)
>> -		dev_dbg(dev, "dpa interrupt received\n");
>> -
>> -	if (reg & PCIE_CLIENT_INT_FATAL_ERR)
>> -		dev_dbg(dev, "fatal error interrupt received\n");
>> -
>> -	if (reg & PCIE_CLIENT_INT_NFATAL_ERR)
>> -		dev_dbg(dev, "non fatal error interrupt received\n");
>> -
>> -	if (reg & PCIE_CLIENT_INT_CORR_ERR)
>> -		dev_dbg(dev, "correctable error interrupt received\n");
>> -
>> -	if (reg & PCIE_CLIENT_INT_PHY)
>> -		dev_dbg(dev, "phy interrupt received\n");
>> +	for (int i = 0; i < ARRAY_SIZE(pcie_client_irq_info); i++) {
>> +		if (reg & pcie_client_irq_info[i].bit)
>> +			dev_dbg(dev, "%s interrupt received\n",
>> +				pcie_client_irq_info[i].msg);
> 
> Why do you think that this is better?
> 
> Other patches in this series seem sensible, but this one does not stands
> out as something that needs to be changed.
> 

Dear Krzysztof

Thank you very much for your reply.

In the interrupt handling function: rockchip_pcie_subsys_irq_handler, 
personally, I think the amount of code can be simplified and it looks 
more concise.

There are many repetitive "interrupt received" print messages in the 
interrupt handling function: rockchip_pcie_client_irq_handler. My 
original intention was to simplify it.

If you think it's not necessary, I will drop this patch.

Best regards,
Hans



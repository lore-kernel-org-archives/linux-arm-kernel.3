Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59D0CCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLpgKGQp8T1NzqmFrpLhW5VkyIVBtZn3g2ShHAUV1fI=; b=h6bZcL81R6YXsNQPJtmmnxwNY3
	r0QAMOOm1h3o3yKR/8eU6NIFesAfSQF68keIxZdWVBtFcVQzaXPyim29kr3nMYw2RpBFf/Y8Rw+G3
	X7/Y5jM7Oy/ObPqlkhZw4UHHHZFKXiorNTXYGvGxxrzmosuYsz8ae4JDlbiPOcPk5TdoGkWAgEV+Q
	T6eK/GkI1lcBJ7mrC5kebl02t7fqLieDOBjNd7TJviMGr3DYWS3PFG24Vh1U1zzELDmdEhFAR4gTu
	kLuuf/ey1m2mPANQZDQfTkwVgPjKp0dDHmdWgGu9Axl6cIMG8SwGBwb5GH8HWJbzcoFZG5ushcgdn
	n11I+1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoGG-00000003xge-1CbQ;
	Fri, 16 Oct 2026 20:10:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoGB-00000003xgQ-32Zx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 20:10:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA8B36022E;
	Fri, 16 Oct 2026 20:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E201F000C4;
	Fri, 16 Oct 2026 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792181434;
	bh=DLpgKGQp8T1NzqmFrpLhW5VkyIVBtZn3g2ShHAUV1fI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RZquliao9IYErFXqpqzk1toqYSIFPmUqm1YM0Q48SUPs9yzVnHoFlDYr8MR0IwAKg
	 alm9gnRYCIMw/iN0zc96XfDXEeC6QDlo7SCSksBG80kVx4C+l+6t2E7FEUZqgG/LPu
	 VNwZYIy6109R40bV4jhCN4GnxX0tuAFPF/ogy3gbF6oaJu1k72Dh2Kxu15cuDpntOB
	 beZ+gnaVsxLwRDqYroiYGFFEm/gpHQf7mAwQii7d7InI5VN/p65MirzptuuEOKHAtU
	 6z2Shb7ibcfSBkEGhPrrzV1Hmc5WLG335KF/JiAMBg7r+zNoWlL0pvrXEpsn1A0pE3
	 KrkzfqBF/wMbg==
Message-ID: <309f6f13-b010-4818-936d-4b7b4b389239@kernel.org>
Date: Fri, 16 Oct 2026 23:10:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: iproc-msi: Bound events handled per IRQ
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261016182124.GA1884550@bhelgaas>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20261016182124.GA1884550@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/16/26 21:21, Bjorn Helgaas wrote:
> On Fri, Oct 16, 2026 at 03:18:53PM +0300, Eugen Hristev wrote:
>> Limit each iProc MSI parent IRQ to 16 event-queue entries.
>>
>> A continuously fed queue could otherwise keep the chained handler running
>> and starve other work. The budget still drains pending events and lets the
>> next parent interrupt continue processing, improving fairness and bounding
>> interrupt-handler latency.
>>
>> Without this starvation avoidance, one CPU can stall indefinitely
>> in the loop and not serve other interrupts, timers, etc.
>>
>> While testing it with an Ethernet NIC,  when too many MSI interrupts
>> come in, CPU might get starved:
>>
>> Connecting to host 192.168.30.1, port 5201
>> [  5] local 192.168.30.2 port 52586 connected to 192.168.30.1 port 5201
>> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
>> [  5]   0.00-1.00   sec   240 MBytes  2.01 Gbits/sec    2    334 KBytes
>> [  5]   1.00-2.00   sec  63.2 MBytes   531 Mbits/sec    1   1.41 KBytes
>> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>> [  177.568497] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>> [  177.568913] rcu:     0-...!: (1 GPs behind) idle=28ac/1/0x4000000000000002 softirq=28922/28930 fqs=1
>> [  177.569457] rcu:     (detected by 1, t=5256 jiffies, g=21629, q=819 ncpus=4)
>> [  177.569870] Sending NMI from CPU 1 to CPUs 0:
>>
>> With this bounded approach, IRQ handler will complete and continue
>> to serve MSI events on the next handler invocation.
> 
> Is there something unique about iproc that makes this an issue, or do
> we need to worry about this in every MSI interrupt handler?
> 
This is not specific to iPROC, so in theory it can happen to any other
MSI interrupt handler. If the handler has no way to break the loop, and
the condition that generates the MSI IRQ happens continuously, the same
situation will happen.
Some other drivers e.g. take the IRQ state into a local variable, do the
task, clear it up, and don't care to read it again, like the iPROC is
doing, unless another MSI fires.


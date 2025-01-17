Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417B6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAf0cQEhbeq9uQn2HgBxJwToemXIDO+RTwUH+VMF7LE=; b=CbfL8xz/SyteROB6QHEPmksXuW
	cvoGI7IpdRX8EgcC5lu6+wvdCSddXLYkEwRYPCMzYxa86A8rSKVN1YuiKEMLYbR/3tYHYwNXQfGjH
	yKyWwPkJNsx4s0P0mX6tbPTI+JVmZ8WQtm5LWldjVr8aRyj6TO2FGMDu/TarE70aVXBd+7MZPFMlw
	NBIS2tMfBvYsrVyuJFJ356fMjjo3UYYq0K2PkKn3ZWRYBcEn18fYwzk8pANBVplSw1is6+2uIq8dR
	qmTwGOHpaTTnkvjOFAmUM1495ux8j7WgSfd6Pr5dLrWnbfn7H3y4BHTwTadAROAkjwK5RcK8NORLQ
	6vcXgcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYuBz-00000001QQv-3B2e;
	Fri, 17 Jan 2025 21:47:51 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYuAi-00000001QLJ-3TeJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 21:46:34 +0000
Message-ID: <8c9e6a12-e64f-4658-94e8-77469f393a0e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737150389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAf0cQEhbeq9uQn2HgBxJwToemXIDO+RTwUH+VMF7LE=;
	b=uK1wSFOoJ9c+9g/m/XG1HVsnP6alX8ieCy4PrcuxpIKWs5YnuxnT64mQ2qBUqvi8DkmqyD
	VK0P2Nl5SczZOcYUF+vTT93a/jtrPPypdcz/ErkE/9hf6uPZpCakuUJWwx2xi6yIDmbM/q
	zwu8IHvKLes80K/irnBdxtm32rStltU=
Date: Fri, 17 Jan 2025 16:46:23 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by
 resetting
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
 <87h65xi977.fsf@bootlin.com>
 <1026d44b-0907-4835-bc95-32f9bbcf4831@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <1026d44b-0907-4835-bc95-32f9bbcf4831@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_134633_156681_0C6CE6B9 
X-CRM114-Status: GOOD (  14.38  )
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

On 1/17/25 13:41, Mark Brown wrote:
> On Fri, Jan 17, 2025 at 07:31:08PM +0100, Miquel Raynal wrote:
>> On 17/01/2025 at 13:21:58 GMT, Mark Brown <broonie@kernel.org> wrote:
> 
>> > If you're hitting a timeout that tends to indicate there's already a
>> > serious stability problem...
> 
>> Yes, unless the timeout is reached for "good reasons", ie. you request
>> substantial amounts of data (typically from a memory device) and the
>> timeout is too short compared to the theoretical time spent in the
>> transfer. A loaded machine can also increase the number of false
>> positives I guess.
> 
> I'd argue that all of those are bad reasons, I'd only expect us to time
> out when there's a bug - choosing too low a timeout or doing things in a
> way that generates timeouts under load is a problem.

There's no transmit DMA for this device. So if you are under high load
and make a long transfer, it's possible to time out. I don't know if
it's possible to fix that very easily. The timeout calculation assumes
that data is being transferred at the SPI bus rate.

That said, in the common case (NOR flash) writes don't work like that.
To write a flash, we make a short transfer (such as an eraseblock) and
then poll the status register before making another transfer. With short
transfers there is less probability of timing out because the extra time
makes up more of the duration.

--Sean


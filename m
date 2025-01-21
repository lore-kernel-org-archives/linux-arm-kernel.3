Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77011C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 16:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrH1RqYlZPnCONVlyYdJjbHopCl+UukhIId4ykP7g4I=; b=L31dN+hQrOOjKMQqySqhIlkcPr
	HSskyA3VVIcZeMDb0rhtHGFyS39o1YERDphJ3ebJlmK50Rty5S3oYKJLVYdBkjJwGJaxy6MKZNcW5
	hCZzLKA1LmGATo0GoyrwqKVnevsJJcLiBbr2FyVxVhFzaxZ5scV92agcKeSmLJQfrjdHnCyVFoYOM
	FO+6Wc4hlMxpdThjX9uFT5u8H5nYFX1AoJZ2zUzBkbKY+dWSGEcP9RkG0FZQpk67u96kVp1ui8emN
	xus96OK6mcB6Csqmvx1GOWOz/TFLIpcpuLL0An5X9KNb7luV27P3+YEr665t4LoshUCMYXWjIHw12
	L9tIE0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHUb-00000008PI6-2Fgv;
	Tue, 21 Jan 2025 16:52:45 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHTJ-00000008PA6-2wo1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 16:51:26 +0000
Message-ID: <39ad89bf-880e-4ae9-bbdb-4d388dd14a7d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737478283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrH1RqYlZPnCONVlyYdJjbHopCl+UukhIId4ykP7g4I=;
	b=BF0W4vLBBIhkOrkCGaWLvh1V9EBK5k05jB3Q5mlXWZUPzl7dB780k3OMzrc6xPWJnhYBAG
	hoTFfqwOgkhlX6rAjDM9FXJCLYK6iNfCkptx52WTh07TvNxurSEqJ5t9unx2zbAPpz3H06
	Za1T6Scpqg2MiECbO3yTeJY6jxTY3kk=
Date: Tue, 21 Jan 2025 11:51:18 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by
 resetting
To: Mark Brown <broonie@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
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
 <8c9e6a12-e64f-4658-94e8-77469f393a0e@linux.dev>
 <c1a3f172-700e-4079-a501-b3f3f08b41aa@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <c1a3f172-700e-4079-a501-b3f3f08b41aa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_085125_888194_2F212F3F 
X-CRM114-Status: GOOD (  15.86  )
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

On 1/20/25 08:49, Mark Brown wrote:
> On Fri, Jan 17, 2025 at 04:46:23PM -0500, Sean Anderson wrote:
>> On 1/17/25 13:41, Mark Brown wrote:
>> > On Fri, Jan 17, 2025 at 07:31:08PM +0100, Miquel Raynal wrote:
> 
>> >> Yes, unless the timeout is reached for "good reasons", ie. you request
>> >> substantial amounts of data (typically from a memory device) and the
>> >> timeout is too short compared to the theoretical time spent in the
>> >> transfer. A loaded machine can also increase the number of false
>> >> positives I guess.
> 
>> > I'd argue that all of those are bad reasons, I'd only expect us to time
>> > out when there's a bug - choosing too low a timeout or doing things in a
>> > way that generates timeouts under load is a problem.
> 
>> There's no transmit DMA for this device. So if you are under high load
>> and make a long transfer, it's possible to time out. I don't know if
>> it's possible to fix that very easily. The timeout calculation assumes
>> that data is being transferred at the SPI bus rate.
> 
> In that case I wouldn't expect the timeout to apply to the whole
> operation, or I'd expect a timeout applied waiting for something
> interrupt driven to not to be fired unless we stop making forward
> progress.  

I don't know if there are any helpers we can use for this. To implement
this we'd need something like schedule_timeout() but where the interrupt
handler calls mod_timer() whenever it does work.

--Sean


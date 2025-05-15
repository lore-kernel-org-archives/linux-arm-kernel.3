Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B1AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqELylo+1x+Ji/2E4BhWBaCKgU1m0gtE541IdTwDmWQ=; b=RM7vVIZl+2ruFpZHBotfw6RYXl
	jBS6IFVVBpq5vXBV3w/tl32yYduKk6BCkcOkWSlwot3JwpYEqHgDvld7yCuh1mLjZTfidmMSteYuW
	A1aI9Sb8qWVhzZAso541zKr4vvJAykQ9pS5MIqQ2TGRQKINsnUheWv5wF1pbai8WijunhEC52VebN
	UU64JKIW9FcaNqLdBPCmrwQd7RjQDEQ0VHaQnrAR7r2tRCyYO6VrDgUlUvMcwRd8nAEL1409k/+WY
	jHTha+pdY8n/MlH1QUlFZuJN4dM4FW0p00FI9M9YZgtyXnChpLciEHVGL4DYKV+9PvYaJUP4wK9tT
	DYdLDUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUld-000000008XC-1yPj;
	Thu, 15 May 2025 09:20:41 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUfi-0000000079N-1fKq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:14:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 1F6D2A0149;
	Thu, 15 May 2025 11:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=BqELylo+1x+Ji/2E4BhW
	BaCKgU1m0gtE541IdTwDmWQ=; b=DXhlJFfsBzh3PItI+RaXb17IizvM2dqy7JUe
	FjbOv6zgjMSrtE9vEdkagaGnPqqSlIa7B2S8BcH39SRHH0jErj6hlN49qvadjC+r
	ebahbAtnNnBFIngf3HZOL6jq2Yjgh8hTfoPNynGV1Nq+A6HoIQAy0T6OoG/kAAvJ
	fHFABQIprJL4mpidvPrjfUug8QEHNrmIxfxh0RzNOnem8Cj0yARlt1iXp3ekda5G
	6tTKmC7JI/VrrfZobjMQjBmSbplSN8q5l3ySM7zrI5LWzGAmrfD5kr/LQzx2FtuZ
	rQQfSdJnImPpaILVFaVlLjkDywcIibj38cYtDKkAaFqvFaUkhQB97kJMf5sdfUJ7
	SNzMZowJEq4XyylXEQlRqimOU/xyMOA80Qx5BYJl0AFvZYWPbVLg8qkEkXH5qqWY
	CK1kY5m+ACdcPwSgYbLD826D1AJjv4gePz+4LNeGeEY/o7z/StxRz9EKGOJOun7D
	3eTgKlF1wq71Pe/rYvTvlmkvf/tjHrvQaRFDMMtZ1yQNeDXY0ja/1f4Ca2Aw0mZY
	4a303i3GrPao0hwqKn9hy9kgu4zjeTzdFSCytHFCPZFAD1tOG+D9LpMY8Dr+PxDa
	CdVXbhpa2ovLWb0RfleqZtSDAB3ipA3Nd9G8ET838hr4KS28+usFZueNYYtsBVKk
	aXu+Mp8=
Message-ID: <e4e6c7a9-9b7a-4012-8bda-75804229ec95@prolan.hu>
Date: Thu, 15 May 2025 11:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v6 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
To: Mark Brown <broonie@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Vinod
 Koul" <vkoul@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>
References: <20250515083132.255410-1-csokas.bence@prolan.hu>
 <aCWpjplhAXUvr9fj@finisterre.sirena.org.uk>
Content-Language: en-US
In-Reply-To: <aCWpjplhAXUvr9fj@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D617062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_021434_587416_6A1B6FDF 
X-CRM114-Status: GOOD (  13.82  )
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

Hi,

On 2025. 05. 15. 10:45, Mark Brown wrote:
> On Thu, May 15, 2025 at 10:31:28AM +0200, Bence Csókás wrote:
> 
>> Change in v4:
>> * split PM imbalance fix (now merged) and DMA cleanup (this series)
>> Change in v6:
>> * rebase to spi/for-next, see note below:
>>
>> There is currently no difference in drivers/dma/dmaengine.c between it and
>> dma/next [1], therefore PATCH 1/2 should be safe for Vinod to apply. But
>> this way PATCH 2/2 is trivial to apply. I didn't want to pull the whole
>> linux-next tree, but if any ofyou run into problems, let me know, and I'll
>> rebase the series on it instead.
> 
> I can't tell what the plan is here, or what the status is for the first
> patch (since I'm not CCed).  The second patch depends on a new API
> introduced in the first patch so it can't be merged independently.

Yes, the situation is a bit convoluted. Obviously 2/2 will be applied 
after 1/2, in a similar vein than the former PM series.

So what I was trying to say: Vinod should be able to apply 1/2 to his 
branch (dma/next) right now, which can then be merged to spi/for-next. 
This merged branch should be able to then cleanly apply 2/2.

Bence



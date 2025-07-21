Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A175BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apcXxEnb0qJg1v9Cl7JQ6npH3CzfQYbUnRtZrZ2JRQo=; b=jtpGssAEodPGAXayyoe8xWo/2B
	AJ/QmUK+Cx5zhb6tVIZ8Zg30DBuk5cumkEyqfJCRD9MPWyl2yh+ktxxnLH7J1zzKThicE6WAFjLF0
	qrQKmaZ3QbUU9jgT4hDBX0I0wUdDm2tDtQ1vRnGAeifl3E0U/rtO9Icx6UWqTfXM5gDT8Casuzabd
	h2RfmHqbVKIlJZsQRNDNy5uOkuLt+3L8gAn0OKVWcMXHsnVA/z6VJwZgwuHW2lpjmvMdIL4xp7pSR
	hKmdAOQC9NhLjposKFdjvt9kKF5aFwh6MlX+74xiq1lf11BJaCHs10aIO+4OBMOJfu6q1dY9xOUQQ
	+xDhtTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq5C-0000000HJWM-0gJ1;
	Mon, 21 Jul 2025 12:57:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoTg-0000000H3Nm-0C4K;
	Mon, 21 Jul 2025 11:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753096461; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jYDbMhT8vW1zZ55sI4R7g1B58Oih9oqWj6/OHCkN7i3soW0oBjrysLGZCIOIwKpbi/S4R9R6I9DzaB3/a/jfCHc0jge426lJOeXddipzWya2vUv9BJR51q/V5Ym2hd6Xn9XhbIccR0vCC1hhPJZp8pixppyUATKFwpUQMuTxQx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753096461; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=apcXxEnb0qJg1v9Cl7JQ6npH3CzfQYbUnRtZrZ2JRQo=; 
	b=DtIObIS9tuE0ada0VjeUzVrB6+WAlE06f1oeU6I4KkV87vFL40WUPjQkWn0Qvkk+z/tZ+6ikJFy0J8KzcQ5xIFLHApyCEqyFnQQKMzI3t6NyqUtKahukCqEiCOiFghfwduWM2LKZhq6e47wNS9VpVwcFtxfkHF+Am+V/Z49XFrg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753096461;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=apcXxEnb0qJg1v9Cl7JQ6npH3CzfQYbUnRtZrZ2JRQo=;
	b=Ng8qHnwKp0kseIgsBGNF47L3UKdRF5Gn/rEgrTYuEvTl8P3sWznvC3DDRjddwmj/
	MrPA+UxXE8ZA3+nMRDuFpZDlOLPlg8RZ57XhLM8Pjv+PN+NFaBihL/2tuYAEDBCTEsB
	N3aDH1R05bBv2dMGMnp79lTpx9sLG7SNaiWUlAz4=
Received: by mx.zohomail.com with SMTPS id 1753096458959568.7003735740404;
	Mon, 21 Jul 2025 04:14:18 -0700 (PDT)
Message-ID: <e96b1d2f-bff8-4b79-9995-6929648a810b@collabora.com>
Date: Mon, 21 Jul 2025 13:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] iommu: Add verisilicon IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20250710082450.125585-1-benjamin.gaignard@collabora.com>
 <20250710082450.125585-4-benjamin.gaignard@collabora.com>
 <aHTzPwTob8_5rtBS@willie-the-truck>
 <baa1fcde-f167-4a1b-afca-0a2957a688cc@collabora.com>
 <aHozv0NG1OBlAH6c@willie-the-truck>
 <b4169471-fcd0-4415-8281-c5bd722e5f2b@arm.com>
 <aHpQXy-bnwW56rCn@willie-the-truck> <20250718141401.GD2206214@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250718141401.GD2206214@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_041440_157791_366C40EA 
X-CRM114-Status: GOOD (  19.63  )
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


Le 18/07/2025 à 16:14, Jason Gunthorpe a écrit :
> On Fri, Jul 18, 2025 at 02:47:11PM +0100, Will Deacon wrote:
>
>> Just because the existing drivers are a mess doesn't mean we should
>> proliferate it!
> If you want to insist on something here it should be for this driver
> to use the new generic page table code I've written.
>
> Otherwise I don't see the point in trying to improve this in some
> lesser way.
>
> If this had come in a years time I would probably insist on that, but
> right now it isn't merged yet and it will still be a little bit before
> people have time to review it.
>
> Perhaps a compromise where Benjamin comes with an iommupt format
> header that works for this and we can progress this series and be
> ready to swap it out down the road?

I have take some time to try to understand this new framework and I have
to admit it isn't super clear in my mind how to use it right now.
I don't have catch the benefit behind the macro and the nested structures.

Anyway, if VSI driver need to be updated I could, at least, validate the
changes on my board or make the fix make self (but I will need to see
more example of drivers using this new feature.

Benjamin

>
> Jason


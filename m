Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A73BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQDhEvXvj0vskWG5Nod+8TONy/NcJUoddZ5fD+XBrmU=; b=hBnk5WLTv2xB4anXmxh5+hMVHy
	Fr7UHUi1Y491aQ6uKSovPo/svGOh6476uhp0gJLG0NdkSVdD+qPgsP5gQGn7qnyN6AqWk6LfjiK6G
	sQ1Oa6NKueylsdMrrZBZgClDCCzSvTQsI9VcRq54Kn7m6m1NeKToT8uOi4Vg9o8efc7VAGdaqjNLO
	niRzVEceTmeS6ywpKEAjXdV5/yK0EakXSCZLSAIQe3LRqruOx7qHKH3yXnuWGwHvaXQcFG9goyu9N
	grJ5nVr6Q1IKqUCsfzoDrS4mE/d5m9C/FuRxHfUIu/rLBXK5PDqdbiqHWCEer9SoI/14xfKD+B76A
	UzSmihzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpxD-00000004rfo-1vCP;
	Tue, 09 Jun 2026 06:28:51 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpx8-00000004re8-2SDx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:28:50 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260609062840euoutp0166e4bd48148a38525bece214221c063d~3Vc3wD9Ba1705417054euoutp01w
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 06:28:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260609062840euoutp0166e4bd48148a38525bece214221c063d~3Vc3wD9Ba1705417054euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780986520;
	bh=sQDhEvXvj0vskWG5Nod+8TONy/NcJUoddZ5fD+XBrmU=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=L71YJc2PSiiRY1n+YPatJVjODV3Te89KEOTZimaueovjODrs9pyp0pdbH67JiyEmb
	 wCUwBCsxT9/ecX7Nz8TuuKZuUCBE8zVB1UGNkFc3cWAa9XWukALnBxMuvL1JCRzJEL
	 shJ6fMw0Ilby9yFLoZKS/Rtr8A02ChpckDYrgCqw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0~3Vc3M9lZT1760217602eucas1p1O;
	Tue,  9 Jun 2026 06:28:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260609062837eusmtip165b8ffd20070283bf8a1cc3770a61ba5~3Vc0aQZiY2875428754eusmtip1_;
	Tue,  9 Jun 2026 06:28:36 +0000 (GMT)
Message-ID: <6a9c0f55-fe98-4063-864b-8f7e1f4fefd7@samsung.com>
Date: Tue, 9 Jun 2026 08:28:35 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 15/15] arm64: mm: Unmap kernel data/bss entirely from
 the linear map
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts
	<ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Kevin
	Brodsky <kevin.brodsky@arm.com>, Liz Prucka <lizprucka@google.com>, Seth
	Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, David Hildenbrand <david@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
	linux-mm@kvack.org, linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Content-Language: en-US
In-Reply-To: <a1b27e97-182c-485d-a448-56c19c5de2c2@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0
X-EPHeader: CA
X-CMS-RootMailID: 20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0
References: <20260529150150.1670604-17-ardb+git@google.com>
	<20260529150150.1670604-32-ardb+git@google.com>
	<a1b27e97-182c-485d-a448-56c19c5de2c2@samsung.com>
	<CGME20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_232848_014626_4031B9AC 
X-CRM114-Status: GOOD (  14.49  )
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

On 09.06.2026 08:22, Marek Szyprowski wrote:
> On 29.05.2026 17:02, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> The linear aliases of the kernel text and rodata are also mapped
>> read-only in the linear map. Given that the contents of these regions
>> are mostly identical to the version in the loadable image, mapping them
>> read-only and leaving their contents visible is a reasonable hardening
>> measure.
>>
>> Data and bss, however, are now also mapped read-only but the contents of
>> these regions are more likely to contain data that we'd rather not leak.
>> So let's unmap these entirely in the linear map when the kernel is
>> running normally.
>>
>> When going into hibernation or waking up from it, these regions need to
>> be mapped, so map the region initially, and toggle the valid bit so
>> map/unmap the region as needed.
>>
>> Doing so is required because pages covering the kernel image are marked
>> as PageReserved, and therefore disregarded for snapshotting by the
>> hibernate logic unless they are mapped.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> This commit landed in yesterday's linux-next as commit 63e0b6a5b693
> ("arm64: mm: Unmap kernel data/bss entirely from the linear map").
> In my tests I found that it breaks booting of RaspberryPi3 and
> RaspberryPi4 boards with the following kernel panic:
One more comment - reverting 63e0b6a5b693 and 53205d56212c (dependent
change) on top of next-20260608 fixes this issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



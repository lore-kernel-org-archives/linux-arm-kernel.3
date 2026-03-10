Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D46FD4F2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kafwu2dgrb1DyjbyRl19d7gZA/agfWMZFG+k2/IJewA=; b=zADqTEP8SnRm8gPLNPZKiS4KzP
	HDq1GFUeYLfxtMAxvqA+YRx9VxCHs4LHCXEYsOtAhCnAR7LDqp/lg/4IAFETxwrkMngJ1ljJ+n2wJ
	gZ/uYmbFB3KT5cE5FhqScIw3Rg3+gbei0SBapHq7KLSW2tk/1mNVkNiNl+dluIrHCxjyO3Aapkz0G
	sUli0gHbg0Zju5G54d4mImnUAUpHjDbv9elxoD6egVqvt8+MWt9DDRq8wf9pMgmdir5t5kH484vs4
	rUGBBXA3fbTExD3phhqBJ3iUy9Y8b1SxGXyuUuPWs+5B/aEgRcLMwmcg1jP4akk5QhzcS73u77gbd
	v7cL8+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02kb-0000000AAzB-2Vtn;
	Tue, 10 Mar 2026 19:28:17 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02kZ-0000000AAyl-0YiJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:28:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5110AEC0B0C;
	Tue, 10 Mar 2026 15:28:11 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 10 Mar 2026 15:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773170891;
	 x=1773257291; bh=Kafwu2dgrb1DyjbyRl19d7gZA/agfWMZFG+k2/IJewA=; b=
	sYLbKdA5Ux6mBzH3DzXVndi3T48J5DXNXD1qyxQ73g+bAwttJwoEaoXqqT6m2+lf
	zKMLQ4XG9+k9MgHc0CO8E3eMDIpb7iSuffg4By1bcXQxRDUrsOAActN8gb3EbWzs
	xBayN0KmMMaDFcPLE8DViimrYNJJR8aL7BiV/z/6U5gT94oqm3/edDphDn9jTSPM
	61IcOcKrctsaliFgNZgls8C7FLX2riAh8cX5+2rNQJaO9ID0f6CRCdKeqgtKHpfi
	byDI3PtFVbrvtp/EgF8RCxSAaf1VVkGDeQwm6sojJSo5N2QagC9zENVKRuz3k5Bs
	kfkeXKgorq756Fz3q14hfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773170891; x=
	1773257291; bh=Kafwu2dgrb1DyjbyRl19d7gZA/agfWMZFG+k2/IJewA=; b=p
	Hq0wLSeoaglWw3Jk4HqQUEMMiJ2gi6ESs5KkRMuv5CF/wznDq7ZteRlj6QEw0cZC
	H2k5KyFBRXMVJ/m4eXfxeaijloBuPQUEOuA3D1NgGSVUQv1JLfSb8Kfr65QxOdHO
	+HRU31x57hT10acAl1h4TgfJAldS87d9OPnfHw7AaqAiNHgQ+2oVHJWh1XzoroMq
	8IgTZouFSZdB2MIBlE1oCjCHLu0AwFmgwueFC0r4CqCWzR1lAPegMPYxyATAipk5
	T89zZaotfHd/nJe7DQHqLtOzI+v480+BxyU0aBFai7zyvGwwLLz6A65kV4IP28VY
	PCJu9tJv2p+W4Pdbxi1PQ==
X-ME-Sender: <xms:ynCwaSBZEJKJuhli4t9TXpk3bBdrMThNORfSdln8xXp2eZVwaaDKfA>
    <xme:ynCwaXWGF6aOPZs14gVkbbkBqriFCRARZ6nJF8x3_ggKMBpGwo3Up9gQ7N3nKoNID
    I1WZc6BsIys53wKQxTKbv360M8oOFDeBkRYxmqTaDVbWsBqDoY9OUM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkedukeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhrtghpthhtoheprhhosg
    hinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhmohhsthgrfhgrsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehiohhmmhhusehlihhsthhsrd
    hlihhnuhigrdguvghv
X-ME-Proxy: <xmx:ynCwaVmrHTCA9Lx-SPYooGuaRN2wigd1-Dc0KMm-oHCFuKMGe8e44A>
    <xmx:ynCwaZD7EQt6vFhy2cyXaFzVHwpNwzxq3t8E2Pk-f0aGhFvJGVcN3Q>
    <xmx:ynCwaXM-5jB3QILN4qr9x5liGuxec88obwfVA2PVML8iKyD9LsiCiQ>
    <xmx:ynCwaQNvoFzQeQ-QNDEbaIIC9bBmF6WC9gqqpgMahyovfE3YeuWkZQ>
    <xmx:y3CwaWuPUM9M1zmV_z5xJGL0m2cefZbo1TrjBzG5ms1vWZYO-HPSp75v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 74C24700065; Tue, 10 Mar 2026 15:28:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AVHaR-kDAB-J
Date: Tue, 10 Mar 2026 20:26:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Thomas Gleixner" <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Mostafa Saleh" <smostafa@google.com>
Message-Id: <3eab12fd-31d3-4a41-a0d9-61b0f6c8ada3@app.fastmail.com>
In-Reply-To: <abBJj72kLQb0LRJB@willie-the-truck>
References: <20260203162406.2215716-1-arnd@kernel.org>
 <20260203162406.2215716-2-arnd@kernel.org>
 <abBJj72kLQb0LRJB@willie-the-truck>
Subject: Re: [PATCH 2/2] [RFC] iommu: io-pgtable-arm-v7s: avoid gcc-16.0.1 section
 mismatch
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_122815_509384_D3FD4AE0 
X-CRM114-Status: GOOD (  14.92  )
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

On Tue, Mar 10, 2026, at 17:40, Will Deacon wrote:
> On Tue, Feb 03, 2026 at 05:24:00PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> gcc-16 has gained some more advanced inlining techniques that enable
>> it to inline the dummy_tlb_add_page() and dummy_tlb_flush() function
>> pointers into a specialized version of __arm_v7s_unmap:
>> 
>> WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
>> 
>> From what I can tell, the transformation is correct, as this
>> is only called when __arm_v7s_unmap() is called from
>> arm_v7s_do_selftests(), which is also __init.
>> 
>> I have not come up with a good workaround, so this simply marks
>> dummy_tlb_add_page() as not __init. Since there are currently only two
>> files where this happens, that may be an easy way out.
>> 
>> If anyone has a better idea for how to deal with that, let me know!
>
> Can we mark the dummy_* functions as 'noinline' instead? We shouldn't
> have to keep the selftest code kicking around in memory after boot.

I think that would work as well, but I'd have to test it properly,
as the gcc behavior was already not what I had expected.

Another option may be to take this a bit further and do the
same for the arm_v7s selftest that Mostafa did in the lpae
selftest with 7e06063a43d3 ("iommu/io-pgtable-arm-selftests:
Use KUnit") and a3c24b6d7cd6 ("iommu/io-pgtable-arm-selftests:
Modularize the test").

I think that would be the most logical step, but it's also
beyond what I can do as a simple build fix.

     Arnd


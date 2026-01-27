Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBCAD2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8DAQ61OS3c7iglhTfU3Mablouz2+HPpWAYSwOSGdrk=; b=q+/sWU1XX33Tb6L6oUxhJ5oWT6
	q2vN/NYBr78ZLNrga99fyRqB0bqgj3Apldt854mjNbPCQzlBjiCBX6ZtUOt21tl4Z0XxPvR227s1C
	KLYGjnFi93L+2ONxxOM/QTkrOdSOWWj5FM/Ga/wJHR8d4wS8+/O12NZ+xxzSydMtIeMEzI4wlBP3u
	o9an8jAwYhpc8hqjGRQQxQhkXpLSw7iCdglATJrS/fM9EHs1UgDHTPnUv5469P1/O6Yq7/36osUn1
	cFG8PDWFvRfIoIiJVDgKv50ae9IqL+sU9eFiU3nLkXbu0dmj1Le4elQw9e3czk31/5kFFf+1Lbyk2
	aLCr1BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhpq-0000000EC0l-1vH1;
	Tue, 27 Jan 2026 12:06:18 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhpo-0000000EBzp-0USB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:06:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=s8DAQ61OS3c7iglhTfU3Mablouz2+HPpWAYSwOSGdrk=;
	b=OxN3MsDGOABCGn8wiFeH2PuIz5IxpUFsa3nKjfW2vpHxJCzf5sYOSie1sZzyuOZSsK4yg+akg
	gg2NkraQ18mUDMBW/MxBfXYZh4B1rzChKPusChTGOBlpx70pZGI07TbV4sRYQR3e+ni4pUiyKux
	0ySwit5hDhz0Z2Xmfu5MAdU=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f0kZf3g1Wz1P6nS;
	Tue, 27 Jan 2026 20:03:38 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0kcn1wR1zJ46CD;
	Tue, 27 Jan 2026 20:05:29 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 252E040539;
	Tue, 27 Jan 2026 20:06:05 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 12:06:04 +0000
Date: Tue, 27 Jan 2026 12:06:02 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/13] arm64: mm: Re-implement the
 __flush_tlb_range_op macro in C
Message-ID: <20260127120602.00007d65@huawei.com>
In-Reply-To: <20260119172202.1681510-7-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-7-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040616_713440_F3877625 
X-CRM114-Status: UNSURE (   8.54  )
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

On Mon, 19 Jan 2026 17:21:53 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> The __flush_tlb_range_op() macro is horrible and has been a previous
> source of bugs thanks to multiple expansions of its arguments (see
> commit f7edb07ad7c6 ("Fix mmu notifiers for range-based invalidates")).
> 
> Rewrite the thing in C.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Co-developed-by: Will Deacon <will@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9919FEC0480
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XrMK7viYh/cii+6p8BcVtBGjQGuMnafZa3dwqHYEDg=; b=3rld8fogGNeV9dDgJZrS6whEjt
	lyWX0EcBLmh3TFyGtxPSGPAdXGdom9LmHNwJpLSwxmc5q/qvdKwfXVBheynwJ0PuAhYbdx7Yt2gJT
	zKCmUpeqaLJxgdBaZO8c9QL7Sj9gCZ1QNZ+7QN0Qet8fUTpMNksnlPOy1PaDjI2cF7KRoK5mWlRb9
	76INvgvef8mQmf+LVbG1JAf8Ztwg4fFFUdLWMqEYBAXEevj3WobeI1vBCGsxNYRRDxgYcBwbUTUH2
	TREZV5+5uPsCRKHvWbhG9OQ7qmaIVFOwsYt0aysDZapwymCihKSfnfaolICeoku11Lw0llqTtXaSv
	HTNzPKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMXP-0000000EvGY-1qYG;
	Tue, 03 Mar 2026 09:59:35 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMXM-0000000EvG8-0SET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:59:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7XrMK7viYh/cii+6p8BcVtBGjQGuMnafZa3dwqHYEDg=;
	b=Y8rzHPYPG+7GcZ6lLbPv++D3p/Cq6GBeb/6TC9zYildLajCIKFmOba1eZbf4QGV7BXlT8yS8P
	tYXWKquXuR6svMiQJjrExI5+kDxU67i+EqXPDpXJoJ5uXScHSoXNXVmK/DfTbLKzEnopCjAszYL
	lo4pPVn9sGExgmGjcT/P54s=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fQB4y0dkWz1P7Qt;
	Tue,  3 Mar 2026 17:55:45 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fQB8S4wnnzJ46nT;
	Tue,  3 Mar 2026 17:58:48 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 8DDA94056E;
	Tue,  3 Mar 2026 17:59:21 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Mar
 2026 09:59:14 +0000
Date: Tue, 3 Mar 2026 09:59:13 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 12/13] arm64: mm: Wrap flush_tlb_page() around
 __do_flush_tlb_range()
Message-ID: <20260303095913.0000684c@huawei.com>
In-Reply-To: <20260302135602.3716920-13-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
	<20260302135602.3716920-13-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_015932_332896_2F590E80 
X-CRM114-Status: GOOD (  11.35  )
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

On Mon, 2 Mar 2026 13:55:59 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Flushing a page from the tlb is just a special case of flushing a range.
> So let's rework flush_tlb_page() so that it simply wraps
> __do_flush_tlb_range(). While at it, let's also update the API to take
> the same flags that we use when flushing a range. This allows us to
> delete all the ugly "_nosync", "_local" and "_nonotify" variants.
> 
> Thanks to constant folding, all of the complex looping and tlbi-by-range
> options get eliminated so that the generated code for flush_tlb_page()
> looks very similar to the previous version.
> 
> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>




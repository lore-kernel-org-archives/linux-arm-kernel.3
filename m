Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1328D2F004
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVFgSV7v+SVxBSQItEHv5QPlcPUOP4v95/hMA3BXYYo=; b=UjcsiWGobw7u+CxSJ0bKD1u3GU
	82VTDIE4NAX5ezYydWMVhniwKgrYsnj7K1KVMOsUj473kek/aBeNi2iUY/T7eZK7QOa3LE7cVU2+s
	bcciPgm0ARMnV6z5k2KZSqJmr1xix2UlRwWEtDPLDBx6YOZu76kZ/Z/ESU4KST7pcbCRNjTA+M3QO
	qrPDCT/6IeGMPhYnHjKxoJSWzzt5emUOw5DrVrEqiQ8ysReqcbJfs9jluBTp0OaVeIzMmB0zjXwpq
	V7yDBhTEygSiamd50Ryl7iZ7reYGaakJy5PYprlAlr1mzWcTuECS8YfWdV6idNY8DlQ8zkddesiiU
	Z38YnhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhz1-0000000EDlI-1YtN;
	Tue, 27 Jan 2026 12:15:47 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhyu-0000000EDkw-3JAE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:15:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZVFgSV7v+SVxBSQItEHv5QPlcPUOP4v95/hMA3BXYYo=;
	b=sXFDwjWkDvCx3Bu2OPcTs3wFL8Q5bNgjSk7iZy6+zLdfWCgi1IGe2KL+WNSXaf1bGkhPzuDTJ
	DvPD/I3CPWEXKu3dlXlMWS70ydMyngsDpsEGPG4BRvJ6FCcRUTVtKzEBLu+DJBopgNoJr5lvb8P
	73z5FSu7wAmfptnJC4zU7zM=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f0knR58ZZzMyXm;
	Tue, 27 Jan 2026 20:12:59 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0kqf0cnWzJ4678;
	Tue, 27 Jan 2026 20:14:54 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id EEA0B40570;
	Tue, 27 Jan 2026 20:15:29 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 12:15:29 +0000
Date: Tue, 27 Jan 2026 12:15:27 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/13] arm64: mm: Simplify
 __flush_tlb_range_limit_excess()
Message-ID: <20260127121527.0000227e@huawei.com>
In-Reply-To: <20260119172202.1681510-9-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-9-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_041544_717643_4A238629 
X-CRM114-Status: GOOD (  11.60  )
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

On Mon, 19 Jan 2026 17:21:55 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> From: Will Deacon <will@kernel.org>
> 
> __flush_tlb_range_limit_excess() is unnecessarily complicated:
> 
>   - It takes a 'start', 'end' and 'pages' argument, whereas it only
>     needs 'pages' (which the caller has computed from the other two
>     arguments!).
> 
>   - It erroneously compares 'pages' with MAX_TLBI_RANGE_PAGES when
>     the system doesn't support range-based invalidation but the range to
>     be invalidated would result in fewer than MAX_DVM_OPS invalidations.
> 
> Simplify the function so that it no longer takes the 'start' and 'end'
> arguments and only considers the MAX_TLBI_RANGE_PAGES threshold on
> systems that implement range-based invalidation.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



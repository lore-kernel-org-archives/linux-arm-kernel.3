Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C30CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ5K9M91kQ+AkSUeti/+IQh4gtRy8jNlzNE635XCeGU=; b=ms8e9YXgX+vSHfZNGz58ZlC5Jr
	qsYdiDuV41TklZL9Ou8gqbKIk+NBQg3p3u+gFUGi0YLBqzlSXvwgykh+VpefCYIsOq+MfhQKqIjD+
	RraSCq2RZlxFPOx38P3aocKBASu3+uJECO8D3CgJHTGQKUnfOmo4E48zSGn20UwrUmjO9z5D1w3Bl
	uMGqK9ZaFBWOYkhVTFlN5KIhvG6AUGsUGyOwgSND0jKqzepUbvmxIv5peyYxuWnRiBA8pWSziOEHs
	SLh1SkWoV4FhcV55SXKaG57XrfLD4CdxO5r0XC9ukrKbW/AQ8IUOyythKhbJVlbfjSushRMCLkYxD
	3NnwWLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSZP-0000000DXcv-3mCj;
	Tue, 02 Jun 2026 17:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSZN-0000000DXc3-3GBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:06:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB0A443899;
	Tue,  2 Jun 2026 17:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752A71F00893;
	Tue,  2 Jun 2026 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780419984;
	bh=LZ5K9M91kQ+AkSUeti/+IQh4gtRy8jNlzNE635XCeGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XeASP5J0XDs1YevH+fi0aOVQ1MIU/R7ReCO3KBfrw0EjKQoWcSCuUTe+TFZd2QYJY
	 GKn83c51+jpr5JLmvuXOmhxB2hOaB2EBU8lwH3RGLhERAO95WuVtvYA9WQiOd1312v
	 B35AdenzRdSgQJxcy0NmgOeepVriM/v1PA8+h02Q=
Date: Tue, 2 Jun 2026 10:06:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Alistair Popple
 <apopple@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org,
 kevin.brodsky@arm.com
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-Id: <20260602100624.b458286887fe9a7c44d3bf22@linux-foundation.org>
In-Reply-To: <ah7WsY02cNAN1LCS@willie-the-truck>
References: <20260521032730.2104017-1-apopple@nvidia.com>
	<20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
	<ahACfQ6kCfONqz5h@arm.com>
	<20260601212225.11f277a85d5ed15083b08cc2@linux-foundation.org>
	<ah7WsY02cNAN1LCS@willie-the-truck>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100625_842017_F66F8788 
X-CRM114-Status: GOOD (  14.90  )
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

On Tue, 2 Jun 2026 14:12:17 +0100 Will Deacon <will@kernel.org> wrote:

> > This patch is still floating around in mm.git awaiting some
> > finalization.  What to do?
> 
> >From what I can tell (assuming I've been following along correctly!):
> 
> 1. This patch improves the situation, so makes sense in its own right
> 2. There is additional work to be more consistent with the constructors
>    for page-table pages, which Kevin is going to look at but is probably
>    a little more long-term.
> 3. I'm happy to take this via arm64 but also have no issues with you taking
>    it via mm (so please shout if you want me to pick it up).

OK, thanks, no probs, just checking.  I'll include this in the next
hotfixes batch for Linus.



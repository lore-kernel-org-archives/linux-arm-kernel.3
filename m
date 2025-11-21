Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAD9CFC281
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNTyimO871Xt4NO/18w82UlZYwpwaAQDmJMcKdNIrJI=; b=fiZyEAgOLXYEvIaaN/VsuFG9co
	V6KuPCCaWhnw+nUbaq4wuH8suqcVOdAUacoXD4uaCBG7R4KQpkk/TFHcTJ7VGTTNNBiwZ6LlkOZX9
	428nGqFV8lfw0RG51Rdo9kt0Rfp3mOg2gJGZwxoQFXqgYiUlUUXLK7FoWtYe0qvvTPZhL0fRia8i6
	AclCryVoY+BdSNZ3Wid9ZQj5PFW5SjdqCiMzbSCcV0KhGYxlMOcHiCD0ZviKlKtf1xYwVLcqvqgas
	+ATOP7Ye8Iqzn+15ouUKoKD8Ex6SjafcDfsyiW5VZxKfWriMFxujfj/VTJXPIBzpp1khD4n5l6EJs
	OchP8YIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZ5P-000000090xE-32Sa;
	Fri, 21 Nov 2025 21:54:35 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZ5N-000000090wp-0j2Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 21:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1763762071;
	bh=oNTyimO871Xt4NO/18w82UlZYwpwaAQDmJMcKdNIrJI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=baHE14DnqToLTpcWLV46ykovAGTwpYPj3FZvzSllhHkUJgKI1zSX15TUWTNKHXcfd
	 1PjSVeabs3ddZLW+xnka3d2clFeKZq1e2szriin2SISK9xkx6Twx8OOM+pp3CVaIUG
	 vbGCZ2FSIOa5R/qx+zQW39Xd2nZk1jf90UtgG3rY=
Received: by gentwo.org (Postfix, from userid 1003)
	id 6E057402BA; Fri, 21 Nov 2025 13:54:31 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 6CEDD402B9;
	Fri, 21 Nov 2025 13:54:31 -0800 (PST)
Date: Fri, 21 Nov 2025 13:54:31 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
In-Reply-To: <20251121193437.2147939-1-yang@os.amperecomputing.com>
Message-ID: <7a1ac262-c992-6ef3-421d-b4419a0c4e19@gentwo.org>
References: <20251121193437.2147939-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_135433_249848_E9AF4481 
X-CRM114-Status: UNSURE (   8.78  )
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

On Fri, 21 Nov 2025, Yang Shi wrote:

> Although ptdump also can tell the direct map use, but it needs to dump
> the whole kernel page table. It is costly and overkilling. It is also
> in debugfs which may not be enabled by all distros. So showing direct
> map use in /proc/meminfo seems more convenient and has less overhead.

Also done the same way on x86, parisc, powerpc and s390.

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>



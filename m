Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FDECA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S03AA61nXFsZMLYNERt4O+f+sZ+Hfb/npgpP3my8yz4=; b=IJVNIzGC6ag0qnl9OlpPWLYuRI
	k9UrCCIEbsaEBJ9HroSyiHE9Y93R+aL/6SjDTt3CNqNZIIZ7OXn37OJPTm4yUO5K/43VInqOnAKSI
	h6gnqjG2vg2VwTYbALCZkljzsLsUBkA0WSbECE/FMACzkfUEpqwkFA9l13t3rdBLdKTFsu/wkJSJB
	bNyamAu3CNRcdMCNcRD6GmJc6UT7+v5y9AZjpbWa/LjIjtlaxb/oAi2Cvmo366OroyMT/TluYeouY
	mmTBjMUCxfmSnEjg7mQg7ScdGyi4CNOFjpWNeOsLH8BdSszgrLXTLPJg/ON46B3JiFV1nuHh01WG9
	qdoRga2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturl-00000007dUq-1kyC;
	Wed, 03 Sep 2025 21:18:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqII-000000073Z6-31M9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:25:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFAD060248;
	Wed,  3 Sep 2025 16:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23600C4CEE7;
	Wed,  3 Sep 2025 16:25:04 +0000 (UTC)
Date: Wed, 3 Sep 2025 17:25:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: james.morse@arm.com, linux-cxl@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
	Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v3 3/8] lib: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <aLhr3v4z_YIYaq9Z@arm.com>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
 <20250820102950.175065-4-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820102950.175065-4-Jonathan.Cameron@huawei.com>
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

On Wed, Aug 20, 2025 at 11:29:45AM +0100, Jonathan Cameron wrote:
> diff --git a/lib/Kconfig b/lib/Kconfig
> index c483951b624f..cd8e5844f9bb 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -543,6 +543,9 @@ config MEMREGION
>  config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
>  	bool
>  
> +config GENERIC_CPU_CACHE_MAINTENANCE
> +	bool

Nit: you could select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION here since
the interface is now provided by the generic implementation.

-- 
Catalin


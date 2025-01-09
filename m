Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C859E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 01:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOpwEm3vc64U9el0o8BXgtUsBUXlhU3xwaCjuDgOqVM=; b=jW0ImvpfUmkFGBTnQCBmrEv1Pd
	kM+AlaG3V52xzamhidS2k4FvYOJpvXptThepPxwStezR9yCA8holgGiFLI7lYNYgv0S4A9EhWuSeV
	0RUIxBJ3gdOO59qUBIZRvHsCh6PaLh2i4e1DDMIMZk6V/gbSyUOWAF6/TwlpKWd5FMcuU5couGdwE
	hcQIPb7t1bxM0kxFP/SPGWwU2MU8jdNStAJvIvzujbqygWjKLlzLijNlkRXYqvyvGSkYruIEar6yt
	fvwntwriNIRoG1oM7xU6NI894xqyQIz0pv/ThMZqv9FVg345W5FUu9mDhD/Bvkyvar/30wuXoGjwj
	63noDP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVhV7-0000000AKom-3ZuL;
	Thu, 09 Jan 2025 01:38:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVhRX-0000000AKBP-2PTD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 01:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736386480; x=1767922480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RER8xEkbtZJunXd1DrZR4xiCOceE1iPmaLstar6K/Ws=;
  b=lh4gXUJcTrkOMoDTBQjW8r3pzjQpAoByelOSCmCUzKNUmaT+EC/AtyCQ
   s9Syr1xevr+tM+zHSh6HipdqbARcfbZzqv4R0HPe2fGriTNsDZtpYcInV
   lkT6Agdb8fCkoY7BlXED1wAbpFAIv7dPlFAHG6IQe4Ou5CbJTaBXwgFUV
   IzigUaKvamNLgYYPh7Z+h+63AivJmNKzVxBp2uk4UuFLySwL4wbJQwCBX
   FOBYxNEhVbrVbc3ZIwQdwHLFZcxRFel2XEAPUQtVO2UiL3y2V6VRKnJBO
   F3+yeEjHTByDH3SrzTB3FsbD+1xGA4l7jiO40FD/wzC9ZPKxEK7FkRJCg
   Q==;
X-CSE-ConnectionGUID: fXK6AU1NQOSgixXgaVB/+Q==
X-CSE-MsgGUID: w31ja5LLRkGh3RYE6pueGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40314011"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="40314011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:34:35 -0800
X-CSE-ConnectionGUID: Hc5lWmCDRcOCp4HuSUdhaQ==
X-CSE-MsgGUID: 8EZhG4KIQciXTPEzWMApnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107305857"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2.lan) ([10.125.111.65])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:34:32 -0800
Date: Wed, 8 Jan 2025 17:34:30 -0800
From: Alison Schofield <alison.schofield@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	lina@asahilina.net, zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com
Subject: Re: [PATCH v5 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-ID: <Z38npigJajz_gm-5@aschofie-mobl2.lan>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_173439_654844_76F099FB 
X-CRM114-Status: UNSURE (   6.35  )
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

On Tue, Jan 07, 2025 at 02:42:16PM +1100, Alistair Popple wrote:
> Main updates since v4:
> 
>  - Removed most of the devdax/fsdax checks in fs/proc/task_mmu.c. This
>    means smaps/pagemap may contain DAX pages.
> 
>  - Fixed rmap accounting of PUD mapped pages.
> 
>  - Minor code clean-ups.
> 
> Main updates since v3:
> 
>  - Rebased onto next-20241216.

Hi Alistair-

This set passes the ndctl/dax unit tests when applied to next-20241216

Tested-by: Alison Schofield <alison.schofield@intel.com>

-- snip




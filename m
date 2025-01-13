Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF6EE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWVdo7t8rphzdeT9Sky2TrL8Ps2VcXtjuE4ADaxgGpw=; b=5Eu7dm/FJf/0qe1xJ0IsdxDVCm
	wKTQ9ca36QbFOi4OkQHcMapGIVlhQCD57H4pwqYBZ+pTdDbC0UheDhhVqm++WsECgpE1KrCNeNqOZ
	VugLsOJGSsTzIpf9aBS0PrCJUd/aCvwBcf8EoZl8W0+u0iyAkGl/hOsHoTxadsZoS5tCV6j2xlGp6
	BrwXRADSCld/LSWnsexoaFgdsUIvWlhTKVJnqX3ZsoFW/HwhyeyY5lcXhGg8+Xr5ZFzdQBswJ68RP
	2dgSMN0m/TcEfmMNClwNpPTbyLse5gjtKdESh5dzAgLMzcJqjlCFHCwlKL/6GDSueFoGQYaUJGu9C
	9HjP9AUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHKV-00000004jUV-00I8;
	Mon, 13 Jan 2025 10:05:55 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHIB-00000004ix2-3sEm;
	Mon, 13 Jan 2025 10:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736762612; x=1768298612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yOi1Bdox+5zsBF06a/0GQ4AAYxWD4N4tKTWcnJAm4ZQ=;
  b=kby3sNRCE8JqI2wvO5I5R2eT+jDIAFiSvdRRfQf/1eMrBtoVR73ttDLa
   BxrFqez4NFZ2X/sRDDQzcw1J8K+JxXz/t+5g8b4V6xLlpwtTwZ9CuTXRq
   W1yBoTvzWLpXAIl6DXueeSC55oyFkJSf9/GrMWBXkK3WPodTUvztuj1w6
   FmMn2zcB9QlwYiSyg1G2wvPPnWMKBjSbT3FhJE2APcnEpBI23U2gGdLec
   Icz0ua7gtCphZHaHcA4GzYlDNc+CugAp45BIodxMsiv9QV9odCq5a6MkE
   1NacL8sYBnQk/QYojnzfTuQ9oThlO1ZrltmTjmkLXtgElnJqcwP2x8HYv
   Q==;
X-CSE-ConnectionGUID: NV5bOUh7Sgaf1fqEX+eOgw==
X-CSE-MsgGUID: kwJLhPRPQuK17ISYP3GjiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="47589798"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="47589798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 02:03:30 -0800
X-CSE-ConnectionGUID: vZ8ms0C0RmiJpI0bTAU8lg==
X-CSE-MsgGUID: y1Gp6sg0SE2iX8qgnePkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104382079"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2025 02:03:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E22CD331; Mon, 13 Jan 2025 12:03:22 +0200 (EET)
Date: Mon, 13 Jan 2025 12:03:22 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by defaultk
Message-ID: <ejh2llcaxahkgz3k2ji3b35dfdss3bfgztyhsfgtu6adejasr7@ajehr7ac3bp3>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
 <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
 <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
 <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_020331_994221_A4635868 
X-CRM114-Status: UNSURE (   5.89  )
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

Borislav,

Is there anything I need to do to get this patchset merged?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov


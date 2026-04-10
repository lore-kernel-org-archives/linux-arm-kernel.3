Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F005F44868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UO23niezElZIPksvH1GF8l70Cs5yLVefVLzmUuVpdSQ=; b=0eJF5/3ihspeRuuEKvJhetnSCD
	i8DTM49FgBVsBX3rRWyeTR+dBzsaa/NWSb4enTB6HQRg7SCPlA3Tx08ubcXbZsh1m64yvQaiR3xd+
	/tD142jk/f2aC5624XAM6C2dy4UjmrvHQLg0kLwMbRi8iZ/oPdokU83yHRTnETEq4RiRVH2wN7tW4
	4tjNc7SBWshtVfIIZUxmx4fRHkls2K4OYtFNIwb9hCLcSf1aji+N3beXUG1lrc/8tN1+9r9eJa6dU
	p6NAVbYe67M/zf/XJUyqaQMapKNVfGAsyDeLSon4OYf+Q8mP3C2XOA+2cCcPMz9rXzIqhcnYC4fiG
	Pm3KqOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCBO-0000000CKxU-3oit;
	Fri, 10 Apr 2026 13:46:02 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCBL-0000000CKx0-2sMM;
	Fri, 10 Apr 2026 13:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775828760; x=1807364760;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XhwVNk7AmxnQFYYbofWW0xn2GGcCMLifpnTZm0hI0iw=;
  b=ng0mvvabzgIKdiXmSpfXr7k5tsoj43SGqf+x8LYkaWRuBYTDYqpW4cDR
   VT3YcsqUG+Bzwv8y2ONbrEYbqVUUBwB9rq3IF9V0+ei0jt51PUYHzJ0Rc
   IQfjkET84Db29mSO9aVWzh+0OvrM7wSp1avz7/D6kjTUwyOnnV3XbV+pg
   UrNtUAGkhShG5b33OECHbJUO89NZU1UOcFLc9LOCGE5G84W9y1VTS4+Tr
   UjAvZTRV4v5PYeb+bAs+NJkgvs7U7Pc6c1fdj1hXO0d3A9zT9ZjzFWdh3
   D0bF03Y3eiliB9hKiz07tLE+cAklfAsAjOYZXPZqNNl6sujilfw20myq1
   w==;
X-CSE-ConnectionGUID: pK1RlR6hQp2jzjJq+oUZBQ==
X-CSE-MsgGUID: COnKp1voS262Do7FYT8QUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88229152"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="88229152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:45:56 -0700
X-CSE-ConnectionGUID: 5EGNTPxSQP+GmiqHTb7hcA==
X-CSE-MsgGUID: poU0WXXBR3aVBOf3UOJDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="225932507"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.248.249]) ([10.124.248.249])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:45:46 -0700
Message-ID: <9db9515b-08e8-47bd-aced-206ac183195a@linux.intel.com>
Date: Fri, 10 Apr 2026 21:45:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, x86@kernel.org, iommu@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: Re: [patch 09/38] iommu/vt-d: Use sched_clock() instead of
 get_cycles()
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.187521447@kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260410120318.187521447@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_064559_773845_FEC2D0D7 
X-CRM114-Status: GOOD (  10.48  )
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

On 4/10/2026 8:19 PM, Thomas Gleixner wrote:
> Calculating the timeout from get_cycles() is a historical leftover without
> any functional requirement.
> 
> Use ktime_get() instead.

The subject line says "Use sched_clock() ...", but the implementation
actually uses ktime_get(). Is it a typo or anything I misunderstood?

Other parts look good to me,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

> 
> Signed-off-by: Thomas Gleixner<tglx@kernel.org>
> Cc:x86@kernel.org
> Cc: Lu Baolu<baolu.lu@linux.intel.com>
> Cc:iommu@lists.linux.dev
> ---
>   arch/x86/include/asm/iommu.h |    3 ---
>   drivers/iommu/intel/dmar.c   |    4 ++--
>   drivers/iommu/intel/iommu.h  |    8 ++++++--
>   3 files changed, 8 insertions(+), 7 deletions(-)

Thanks,
baolu


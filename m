Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2518ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOXXYg1NukWIx/zlQCPDzIFeJGiay2wbUo04Q9XqD9g=; b=Tq9h2V572u90lTiQ02T9qGNLxi
	W/ycNAdA44UCIKSJA6yMQUzg0hZYUNkuIv8kfwyKnGh5iyyksf6IY/tgFRKHN2v8c6hwGazPx5fmy
	pwRpdAIS492XcimOFeDesFYAX6DgXoXt0IlpH74MUKEJbcpAQlEfPcAEi8yWsW3jnB9O2GlQxmFvB
	peUfJDODNMjygMVqpbhIuiRMCKX1TuaMdog64i11rTArsv4cnDQHiKDhUKUK0byZG5eDIReaNfdt8
	VDDhYSINrpvJarMWS8se91E99FyIYReVxIsYd+z6Tby6tbSDY2BGhyeW6/T3iILAU2SYTLSsVTaAB
	SbKvRWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquF1-0000000CBVQ-3Dse;
	Tue, 26 Aug 2025 14:01:39 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtjS-0000000C6QL-0HH6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756214942; x=1787750942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WONqwahE1t7tG5WMekP4ROtP2MyOMiDAgeptG1B8c8o=;
  b=O1UNRZ3GyLduNWTUh2VNNDsL/t8ugLRojJh9ACrB5lSAFx1pUoaG5Bdw
   VoNOQRVJgcUDYvB977oUiGgUbI2wA4TQF+i3F5QmGhNi2ofvglaXVaU7u
   wLiBLd5RtnuwwzpIW0QuAl+42QE1pSIuDNV6TcczeBvFHVjjmjVegW7ve
   +y0/iSZguAR8RLqsPUBh9YOVqpMqI0vZkeNkSCBMf/A6wDOZ+N9Bhefm6
   x8/4X/qdYVE+Fb8FDzj7POlu0gJZLmhezVRJvmIufgcg3M+0GQnw7umgf
   QRGSGuJNReK/zTmUPZuPBFV1k7yvY5DFuX0MllCBoq6/4f4zUm5PkXSCy
   Q==;
X-CSE-ConnectionGUID: y+HDhfycQKKp1qQflIG71g==
X-CSE-MsgGUID: 1nxQgHtBTH2GZQ0dWWE1og==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57649662"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57649662"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:29:01 -0700
X-CSE-ConnectionGUID: yZ/HNeJPSH+ByFL3yfAtLw==
X-CSE-MsgGUID: 3/+Gz3kfTi6VujhV0pZ9kw==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:28:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uqtjF-00000008mqQ-2YXp;
	Tue, 26 Aug 2025 16:28:49 +0300
Date: Tue, 26 Aug 2025 16:28:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-ID: <aK22kUhlxlyvVLax@smile.fi.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_062902_119351_682DDB16 
X-CRM114-Status: GOOD (  15.77  )
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

On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> > There are a few places in architecture code for the floppy driver
> > that may be cleaned up. Do it so.
> > 
> > Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> > 
> > Changelog v2:
> > - combined separate patches sent earlier into a series
> > - added tags (Helge, Geert)
> > - fixed typo in the commit message (Geert)

[...]

> Applied, thanks!

Ah, thanks! It's good to know you can take (and actually did that) them.

> [1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
>       commit: d74968780bf287958e2815be5f088dd6c7b7aa19
> [2/3] floppy: Replace custom SZ_64K constant
>       commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
> [3/3] floppy: Sort headers alphabetically
>       commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

-- 
With Best Regards,
Andy Shevchenko




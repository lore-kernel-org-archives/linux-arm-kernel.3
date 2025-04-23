Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB18BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obJNFWl0swUBY+1+HXSQ6Sb8m0V4MltJwnJuhib9c4k=; b=FrB7+ZRnbnzPfueK7Qurg8M4bh
	jGIjSwJ4sSmedcUrYQvVCIBbX6+16r53s1dSfuW4bnUZPh3Bbn4fVZ/jMXROvbN+ePHBL57JlGfHn
	EAJDOc/qVx+5F+Voyg0OGldc2IDK1MGrU+zjburHxNWGq39S4QFFaWLjHMCuHnSIP0fuxOK6Bp67S
	n9u3XrZPL3ahWOGwdGZDaUQ+Nq75ZtEWpqGuh9Vqr2UKJ957SOkNmI7+b2gUwJ5+dxffQpMI2b624
	NZVuSty6QxDanl/wVGB0iqfAWzQeiw1pGoEsvJEslg0sbnyyktYzWOvDdCg5a9rsAeGXEV1dH8C4N
	zjtsrUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7elr-0000000BY8e-19oc;
	Wed, 23 Apr 2025 18:24:31 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eC7-0000000BPYe-3U2h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745430456; x=1776966456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VsBgMm6ql9X21OmCeVGgqkwDam+RgQHacHaxh9tzAfE=;
  b=ZyEosRz/H+lFDgyvyUru3ropDaZ/kFqoEH/PNfZzDqITYV8HEV7qCQKs
   nHrposnzADtsQBs2t01I/EszMVZV8lMhkKrT/p2aZtYyIRNbZhKGxr9Z5
   4pWjCb+TpzhtJhdHv3psmQ1i4v+xiPWLV2bVYj/DCA2wUn5kx6ZbejTBv
   Wq0ppMoORN8AUK4sr2SyLPa2I7FF1rvCdEVIfxMrUQ0+70lGmaQOGbLcc
   3hNcBWbKPQuIadIN/jd52kaKWsFL1wKjoiXs6KIm+kl9GdLMqepc/a806
   bhgf9QzoIsjMgSzQlfssvq9rTBij47hCklmzgo4w8NwXgj3+Df67Eh2Im
   g==;
X-CSE-ConnectionGUID: XUQLqTnnQSyxC/q/clJB5A==
X-CSE-MsgGUID: PlJwnYf/QM2uX1BLOWdwJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47168745"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47168745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:47:35 -0700
X-CSE-ConnectionGUID: ASiuKRo8Syau7sjtBnrOLw==
X-CSE-MsgGUID: mYd/xEnCTYCPxLKRG3eVuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137173333"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Apr 2025 10:47:31 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7eC1-0003Vv-1W;
	Wed, 23 Apr 2025 17:47:29 +0000
Date: Thu, 24 Apr 2025 01:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Message-ID: <202504240137.4mJaj0GN-lkp@intel.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_104735_892122_AC3D5B1B 
X-CRM114-Status: GOOD (  10.77  )
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

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on aff301f37e220970c2f301b5c65a8bfedf52058e]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-introduce-IIO_DECLARE_BUFFER_WITH_TS-macros/20250423-061049
base:   aff301f37e220970c2f301b5c65a8bfedf52058e
patch link:    https://lore.kernel.org/r/20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706%40baylibre.com
patch subject: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
config: riscv-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240137.4mJaj0GN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240137.4mJaj0GN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240137.4mJaj0GN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/industrialio-buffer.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-buffer.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-buffer.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-buffer.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-buffer.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-buffer.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-buffer.c:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-buffer.c:29:
>> include/linux/iio/iio.h:813:16: error: static assertion failed due to requirement 'sizeof (__alignof(unsigned long long)) % sizeof(long long) == 0': macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment
     813 | _Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iio/iio.h:813:55: note: expression evaluates to '4 == 0'
     813 | _Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   7 warnings and 1 error generated.
--
   In file included from drivers/iio/industrialio-sw-device.c:14:
   In file included from include/linux/iio/sw_device.h:13:
>> include/linux/iio/iio.h:813:16: error: static assertion failed due to requirement 'sizeof (__alignof(unsigned long long)) % sizeof(long long) == 0': macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment
     813 | _Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iio/iio.h:813:55: note: expression evaluates to '4 == 0'
     813 | _Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   1 error generated.
--
   In file included from drivers/iio/industrialio-triggered-event.c:9:
>> include/linux/iio/iio.h:813:16: error: static assertion failed due to requirement 'sizeof (__alignof(unsigned long long)) % sizeof(long long) == 0': macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment
     813 | _Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iio/iio.h:813:55: note: expression evaluates to '4 == 0'
     813 | _Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from drivers/iio/industrialio-triggered-event.c:10:
   In file included from include/linux/iio/triggered_event.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-triggered-event.c:10:
   In file included from include/linux/iio/triggered_event.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-triggered-event.c:10:
   In file included from include/linux/iio/triggered_event.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-triggered-event.c:10:
   In file included from include/linux/iio/triggered_event.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-triggered-event.c:10:
   In file included from include/linux/iio/triggered_event.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-triggered-event.c:10:
   In file included from include/linux/iio/triggered_event.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/iio/industrialio-triggered-event.c:10:
   In file included from include/linux/iio/triggered_event.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:


vim +813 include/linux/iio/iio.h

   781	
   782	#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
   783		type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
   784	
   785	/**
   786	 * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
   787	 * @type: element type of the buffer
   788	 * @name: identifier name of the buffer
   789	 * @count: number of elements in the buffer
   790	 *
   791	 * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
   792	 * addition to allocating enough space for @count elements of @type, it also
   793	 * allocates space for a s64 timestamp at the end of the buffer and ensures
   794	 * proper alignment of the timestamp.
   795	 */
   796	#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
   797		_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
   798	
   799	/**
   800	 * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
   801	 * @type: element type of the buffer
   802	 * @name: identifier name of the buffer
   803	 * @count: number of elements in the buffer
   804	 *
   805	 * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
   806	 * to ensure that the buffer doesn't share cachelines with anything that comes
   807	 * before it in a struct. This should not be used for stack-allocated buffers
   808	 * as stack memory cannot generally be used for DMA.
   809	 */
   810	#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
   811		_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
   812	
 > 813	_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
   814		"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
   815	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


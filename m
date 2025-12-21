Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE630E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8KubohRsho3VqSDncD7kfclGNc+12HXc+ripJT2XBI=; b=ZJP+6Kkz6e0PgYAfg9gw/vXuzc
	9IogYgOaot7FwCrQX6Ly4Rp/wZjZ469ZCHHt0P8JxocRycsuYEvQ4DNtT/zcksFP08D4/LNHgwARu
	wGVCaWOJDoVawwI1wXk5OrvUw+t3dcIyCP+HBVBHapVhNang5gCQvVRqXpGoge+9rqhzBHSCKsplx
	BO2SqFh5KIJX5pyAXUgXxeu83ZTkyO1m/GggHqYa/XEs8B4Od+XcDrocPDn4Ij5snr9hMHCMm5xUY
	p86S2DcxeIhUPZzFh7IoSTlxUAUCSk5uUvnQ67mBC7iWIN7WIGDhlMMYf/Lt6wMUpAhWr/i/Br0qz
	BknM0/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXPA7-0000000Cgpu-2cUL;
	Sun, 21 Dec 2025 19:32:15 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXPA4-0000000CgpQ-3Y5q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 19:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766345533; x=1797881533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b9Nwd9sXKSYEQNfuaVJPScUfQ1fvQxMuXpR46Wa/4LM=;
  b=AjWNE27/rvz+U/gah9w4cXEvjwgNOmZnvvLRJYyOXSHHTuivYwCZyh86
   PDZxkoLv+pOeZhRsCHTn8GNnmbNfjz2nx2aE23BxsRHXOjZ3yXDs/39n/
   3M27I4mRpaRdB6K45avoYpa0yH96YCiuhznqQaIditZSBaRO6njnQW2Tm
   9vifrq0YIFV+fScXxwuI9Pi0IGrmYBsJVJouiscPErkOLwt/CHw7Ntgm9
   rpJTTfcJ6XWXZdifynOfeDC0EnsF2C6v1WhbdDhoonNFzxCeT6SILzr3n
   dtuIgbn4LqjN8vfIIQI/Wxzn31dqqpx0QSTLQ8k6kVgROesNQ5jMacn4n
   w==;
X-CSE-ConnectionGUID: efeHF+0hS3uK7rF4r6h55g==
X-CSE-MsgGUID: 3V/onbQgR6uYoqfeLX4wmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79582781"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79582781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 11:32:11 -0800
X-CSE-ConnectionGUID: ZAYyN8XSTVSW1Pl8TDrcXg==
X-CSE-MsgGUID: k5+MMjNURX+fVBoDoahJDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="236766300"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 11:32:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXP9w-000000005DA-2giu;
	Sun, 21 Dec 2025 19:32:04 +0000
Date: Sun, 21 Dec 2025 20:31:25 +0100
From: kernel test robot <lkp@intel.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>, linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tony.luck@intel.com, bp@alien8.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com, ahmed.tiba@arm.com
Subject: Re: [PATCH 02/12] ras: add estatus core implementation
Message-ID: <202512212012.arq4zqYv-lkp@intel.com>
References: <20251217112845.1814119-3-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217112845.1814119-3-ahmed.tiba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_113212_935167_2B74E5D3 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Ahmed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on efi/next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge robh/for-next linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ras-add-estatus-core-interfaces/20251217-200718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251217112845.1814119-3-ahmed.tiba%40arm.com
patch subject: [PATCH 02/12] ras: add estatus core implementation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512212012.arq4zqYv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212012.arq4zqYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212012.arq4zqYv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/estatus.c:505:13: warning: 'estatus_cache_add' defined but not used [-Wunused-function]
     505 | static void estatus_cache_add(struct estatus_source *source,
         |             ^~~~~~~~~~~~~~~~~
   drivers/firmware/efi/estatus.c:435:12: warning: 'estatus_cached' defined but not used [-Wunused-function]
     435 | static int estatus_cached(struct acpi_hest_generic_status *estatus)
         |            ^~~~~~~~~~~~~~
   drivers/firmware/efi/estatus.c:411:12: warning: 'estatus_print_estatus' defined but not used [-Wunused-function]
     411 | static int estatus_print_estatus(const char *pfx,
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/estatus.c:340:13: warning: 'estatus_clear_estatus' defined but not used [-Wunused-function]
     340 | static void estatus_clear_estatus(struct estatus_source *source,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/estatus.c:321:12: warning: 'estatus_read_estatus' defined but not used [-Wunused-function]
     321 | static int estatus_read_estatus(struct estatus_source *source,
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/efi/estatus.c:117:12: warning: 'estatus_panic_timeout' defined but not used [-Wunused-variable]
     117 | static int estatus_panic_timeout __read_mostly = 30;
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/uprobes.h:13,
                    from include/linux/uprobes.h:66,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/seq_file.h:11,
                    from include/linux/seq_buf.h:7,
                    from include/linux/trace_seq.h:5,
                    from include/linux/cper.h:13,
                    from drivers/firmware/efi/estatus.c:10:
   drivers/firmware/efi/estatus.c:106:29: warning: 'estatus_report_chain' defined but not used [-Wunused-variable]
     106 | static ATOMIC_NOTIFIER_HEAD(estatus_report_chain);
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/notifier.h:116:37: note: in definition of macro 'ATOMIC_NOTIFIER_HEAD'
     116 |         struct atomic_notifier_head name =                      \
         |                                     ^~~~


vim +/estatus_panic_timeout +117 drivers/firmware/efi/estatus.c

   116	
 > 117	static int estatus_panic_timeout __read_mostly = 30;
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


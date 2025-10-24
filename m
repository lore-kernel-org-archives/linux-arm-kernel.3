Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12E6CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 02:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zusOc2ByHXPI5/AMyXickr+y8fs5/EFbaniQERKaFOo=; b=d+/igl3pvXQTQpSNkUNFIzq8Vu
	k8W72rpQ1gMb2mPASXFE1Hndz3UrPu7gBrIQR0hp1NUDp/h6/cuQ8sq2Yu95qvAIG97HXXEJCMetj
	LJmGBqhTheORsttwBBRF6CD/fDrzDiK29+gwhpWdir5WCaNL07BSLSwZm+ksQ+JLD1siw4LxlF9jP
	Fb8vCW7d26gUQKkdFVI56y4BXBEaF5Vuizgdqh68ZweLJxSz6woyGdM/O9xfC20/BNDFcBffa8Yla
	sOk+ytw7zs25gRxboPnIsQ2//5zR6JrtyOkY4BCgsjxMT4Ev9c49jbUmRNP/dTFUFuamIS3n2lAyX
	L2hXpD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC77W-0000000802C-448i;
	Fri, 24 Oct 2025 02:01:34 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC77U-0000000801j-3hrT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 02:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761271292; x=1792807292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5pwkoiBgdK2A6PK3Fa1FU55/2aVLhOmwvVBgWWXu0Ec=;
  b=WI0/Hv9LJqhNmnU6Rmp5FigC4LA8dvBeGj3vLlvnmjqyBkdQtG1vxAGr
   9jUJG95kxbPdszmmEs1peKCh0ZqHo5sf7bHqR4uf1TsyA8XU7c3vWmJ1H
   g2SzX6tFknX09HMeFqGUNwyhoIzFzVcMpc/CpGeFqMw732ka5les8/4WL
   gdSHsA04dRR4dDqPvr2+PBOEmsgDaPETLHCICP7ggIABRq1rvo/M+vcyY
   +04tvrMkDAVqxwdk3jBzQXwKYtzxz/19fd4w3HdHdc9lPATtGJXo0dH8I
   j5QIFSfJ7J8yWtmADkC4KM/E9X6UbOuhu9eUb0aJxTWhSJGIP88NTlkfM
   g==;
X-CSE-ConnectionGUID: ejHtMXMwTBiXGOhyhqMBrQ==
X-CSE-MsgGUID: dAYOzge5SrOTMsfXOkxwBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74122851"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="74122851"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 19:01:31 -0700
X-CSE-ConnectionGUID: zmw9kKYaQUyvy5/SdWeQwA==
X-CSE-MsgGUID: IZTmjtlYQNu3Pkpb2yJCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="189439272"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2025 19:01:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC77O-000E5J-2l;
	Fri, 24 Oct 2025 02:01:26 +0000
Date: Fri, 24 Oct 2025 10:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: Qiang Ma <maqianga@uniontech.com>, ardb@kernel.org,
	linux@armlinux.org.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: Re: [PATCH 2/2] efi/arm*: Remove the useless failure return message
 print
Message-ID: <202510240949.NKb4ca96-lkp@intel.com>
References: <20251023082129.75612-2-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023082129.75612-2-maqianga@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_190132_962794_9CF8F6B1 
X-CRM114-Status: GOOD (  11.00  )
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

Hi Qiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on efi/next]
[also build test WARNING on linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiang-Ma/efi-arm-Remove-the-useless-failure-return-message-print/20251023-162558
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251023082129.75612-2-maqianga%40uniontech.com
patch subject: [PATCH 2/2] efi/arm*: Remove the useless failure return message print
config: arm64-randconfig-001-20251024 (https://download.01.org/0day-ci/archive/20251024/202510240949.NKb4ca96-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240949.NKb4ca96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240949.NKb4ca96-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/arm-runtime.c: In function 'efi_virtmap_init':
>> drivers/firmware/efi/arm-runtime.c:62:7: warning: unused variable 'ret' [-Wunused-variable]
      int ret;
          ^~~
>> drivers/firmware/efi/arm-runtime.c:61:15: warning: unused variable 'phys' [-Wunused-variable]
      phys_addr_t phys = md->phys_addr;
                  ^~~~


vim +/ret +62 drivers/firmware/efi/arm-runtime.c

9d80448ac92b720 Ard Biesheuvel 2016-08-16  51  
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  52  static bool __init efi_virtmap_init(void)
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  53  {
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  54  	efi_memory_desc_t *md;
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  55  
f7d924894265794 Ard Biesheuvel 2015-11-30  56  	efi_mm.pgd = pgd_alloc(&efi_mm);
d1eb98143c56f24 Ard Biesheuvel 2017-03-01  57  	mm_init_cpumask(&efi_mm);
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  58  	init_new_context(NULL, &efi_mm);
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  59  
78ce248faa3c46e Matt Fleming   2016-04-25  60  	for_each_efi_memory_desc(md) {
f7d924894265794 Ard Biesheuvel 2015-11-30 @61  		phys_addr_t phys = md->phys_addr;
f7d924894265794 Ard Biesheuvel 2015-11-30 @62  		int ret;
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  63  
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  64  		if (!(md->attribute & EFI_MEMORY_RUNTIME))
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  65  			continue;
37926f96302d8b6 Ard Biesheuvel 2022-10-20  66  		if (md->virt_addr == U64_MAX)
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  67  			return false;
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  68  
73fefd7f81521c6 Qiang Ma       2025-10-23  69  		efi_create_mapping(&efi_mm, md);
789957ef72f976c Ard Biesheuvel 2016-04-25  70  	}
789957ef72f976c Ard Biesheuvel 2016-04-25  71  
789957ef72f976c Ard Biesheuvel 2016-04-25  72  	if (efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions))
789957ef72f976c Ard Biesheuvel 2016-04-25  73  		return false;
789957ef72f976c Ard Biesheuvel 2016-04-25  74  
789957ef72f976c Ard Biesheuvel 2016-04-25  75  	return true;
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  76  }
e5bc22a42e4d46c Ard Biesheuvel 2015-11-30  77  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


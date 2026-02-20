Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76FCC5AD57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vK7MrwacWPuEuh/yVGsJqsZG9yiT+9v85io8eJu+/IA=; b=xlY98C/SCBEBtFauKtx7C97GUD
	qoEafXWo293RU3x39LLe2w/tpNpWIZblBPiDNEQnT+EwTkjFvKtWPVe9HcBmcOlNYfSwVMRRZ0or8
	IA79m/1VDA8vbdndEHZrAZHQSxd+8rGbwWCtPD4ZIoEXt5IbTC3MdUtR2SwYSbkAaWwt4Abglewse
	oIMq75guTMDcakTpBSxr42PaxjuNwditeUODK29ZuFJ+hIXvfaOEsUjQg75QL28AzO4Qq5tkWbkGp
	Qy0eI3/UqTcNnfXehvvPwSM+OPhgule2eXp/nh6msiJEVEeQOMXc8Kd8sDy+3ni4Z98igLX2ROpCz
	JfpI0+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtW7b-0000000FVZn-0M9k;
	Fri, 20 Feb 2026 19:25:03 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtW7Y-0000000FVZ6-3jyV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 19:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771615501; x=1803151501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CxGHMCvKqrgIEL1ZXttyxDNzGSQqXIwzxJ1W6l9MfYk=;
  b=V4xyKBN2Fzd1MJBrHuOf2BwxNl9WAUl5X5jI7KQtfibLJU2bP4qvJw1e
   Vw/KAuqo6aBE2WNZsfO4QhwEy72nu9d0CLYTkjPRDX6X5ifiTcKF990R6
   uBQ7hfFROyDsZYhRYDPlC/sXhoA/pCgRCV4XulEC70VtoUSbbS8fHN21j
   8pGqYnpqaCeYaXwy8IMN0ne6fkVdHQ5PU415He6j5FLPcJjj+vG80S5z/
   IhdcHMeShA98rHNQyRHG/96gtGBBjzmN2Gwf319sNBBv+ByTHq6ZGNacF
   5O0WIrbjmub5qCGAUVRt0eI+3K4YdBwj+d4LhJ229J/popc+sa2ztiRz8
   w==;
X-CSE-ConnectionGUID: DNPrmHzjQLaol31acAWefQ==
X-CSE-MsgGUID: DfT4B0TCTwmsd86Sw2Ra8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="71918913"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="71918913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 11:24:57 -0800
X-CSE-ConnectionGUID: avG6jDm0RIq8wolc3qY8Dg==
X-CSE-MsgGUID: QL4BNvEpQw6lhkniQ2HCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213960545"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2026 11:24:53 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtW7P-000000004Gb-1NH8;
	Fri, 20 Feb 2026 19:24:51 +0000
Date: Fri, 20 Feb 2026 20:24:15 +0100
From: kernel test robot <lkp@intel.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ahmed Tiba <ahmed.tiba@arm.com>, Dmitry.Lamerov@arm.com,
	catalin.marinas@arm.com, bp@alien8.de, robh@kernel.org,
	rafael@kernel.org, will@kernel.org, conor@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Subject: Re: [PATCH v2 09/11] ACPI: APEI: share GHES CPER helpers
Message-ID: <202602202042.cliczLhi-lkp@intel.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-9-347fa2d7351b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-9-347fa2d7351b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_112500_948226_9A41E76F 
X-CRM114-Status: GOOD (  11.91  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 8bf22c33e7a172fbc72464f4cc484d23a6b412ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260220-214812
base:   8bf22c33e7a172fbc72464f4cc484d23a6b412ba
patch link:    https://lore.kernel.org/r/20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-9-347fa2d7351b%40arm.com
patch subject: [PATCH v2 09/11] ACPI: APEI: share GHES CPER helpers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260220/202602202042.cliczLhi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602202042.cliczLhi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602202042.cliczLhi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/apei/ghes_cper.c:261:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     261 |                                  FIELD_GET(CPER_ARM_ERR_TYPE_MASK, err_info->type),
         |                                  ^
   1 error generated.


vim +/FIELD_GET +261 drivers/acpi/apei/ghes_cper.c

   202	
   203	bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
   204					     int sev, bool sync)
   205	{
   206		struct cper_sec_proc_arm *err = acpi_hest_get_payload(gdata);
   207		int flags = sync ? MF_ACTION_REQUIRED : 0;
   208		int length = gdata->error_data_length;
   209		char error_type[120];
   210		bool queued = false;
   211		int sec_sev, i;
   212		char *p;
   213	
   214		sec_sev = ghes_severity(gdata->error_severity);
   215		if (length >= sizeof(*err)) {
   216			log_arm_hw_error(err, sec_sev);
   217		} else {
   218			pr_warn(FW_BUG "arm error length: %d\n", length);
   219			pr_warn(FW_BUG "length is too small\n");
   220			pr_warn(FW_BUG "firmware-generated error record is incorrect\n");
   221			return false;
   222		}
   223	
   224		if (sev != GHES_SEV_RECOVERABLE || sec_sev != GHES_SEV_RECOVERABLE)
   225			return false;
   226	
   227		p = (char *)(err + 1);
   228		length -= sizeof(err);
   229	
   230		for (i = 0; i < err->err_info_num; i++) {
   231			struct cper_arm_err_info *err_info;
   232			bool is_cache, has_pa;
   233	
   234			/* Ensure we have enough data for the error info header */
   235			if (length < sizeof(*err_info))
   236				break;
   237	
   238			err_info = (struct cper_arm_err_info *)p;
   239	
   240			/* Validate the claimed length before using it */
   241			length -= err_info->length;
   242			if (length < 0)
   243				break;
   244	
   245			is_cache = err_info->type & CPER_ARM_CACHE_ERROR;
   246			has_pa = (err_info->validation_bits & CPER_ARM_INFO_VALID_PHYSICAL_ADDR);
   247	
   248			/*
   249			 * The field (err_info->error_info & BIT(26)) is fixed to set to
   250			 * 1 in some old firmware of HiSilicon Kunpeng920. We assume that
   251			 * firmware won't mix corrected errors in an uncorrected section,
   252			 * and don't filter out 'corrected' error here.
   253			 */
   254			if (is_cache && has_pa) {
   255				queued = ghes_do_memory_failure(err_info->physical_fault_addr, flags);
   256				p += err_info->length;
   257				continue;
   258			}
   259	
   260			cper_bits_to_str(error_type, sizeof(error_type),
 > 261					 FIELD_GET(CPER_ARM_ERR_TYPE_MASK, err_info->type),
   262					 cper_proc_error_type_strs,
   263					 ARRAY_SIZE(cper_proc_error_type_strs));
   264	
   265			pr_warn_ratelimited(FW_WARN GHES_PFX
   266					    "Unhandled processor error type 0x%02x: %s%s\n",
   267					    err_info->type, error_type,
   268					    (err_info->type & ~CPER_ARM_ERR_TYPE_MASK) ? " with reserved bit(s)" : "");
   269			p += err_info->length;
   270		}
   271	
   272		return queued;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


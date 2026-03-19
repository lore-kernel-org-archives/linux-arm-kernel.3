Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D272F1091912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vppvdPcUtQEfLppmfZbFVXzeM17q5cE6TCGT2wA5NQs=; b=Vm6NGNEG52obVHTGEzRsIyx4zo
	xZr9DcL8y89owTIeBm6M0eldbTpYRy8ydlBD5Y1lVYjbeh6rrQkUR3Z0psIf8wnRWPHS+h376k73S
	NsvhrjNGBiPWJVUjzhJiyT3hEBbhjbBsSVq9Af084rCj7Pht88NTuMpkVZaUpRIhOGIO9eErxQQ5O
	hdtTyx3sEwadRihq+Pwk7yBybrIdTUoCGEz/qbyDVs9XZMq4zaHHnqB98Q1GmXQrS7UHnfh5BobKM
	vBkZDbMGKEW1nKE4caNN0QRGDGeB//AstAyHyFTyAp0ZDAG3A1U+yef0ZQmk05K8Ke2sDbl9P10qj
	GR0oevkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JPb-0000000BTFk-1qmn;
	Thu, 19 Mar 2026 19:52:07 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JPY-0000000BTFP-2kdO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773949925; x=1805485925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qs3MDYOmJNxqPiaOylmC/7JTWLNZLoYJUn+b+IyOadk=;
  b=Y9KSTumrgfq6u7VmuAudz45Bml0AGR/yORRvhHhfQxVI743khCIbgImk
   uPYx+sW7qV8Ml/6aotWQ+7fkz6jRJh+oU7yiOdSPCLxMVbEQYtnk4rhx5
   ON9VcZnZrMas8pNWGTxnYtrFqT3n0tEz1RqsbRDYBUredOElcubpiuZWQ
   3eHdoexXR3wklkvMcx5mFl4VnwVuDeaimVkiigDc5PJdL73A4BFLIF05r
   soCz3PwidKg9+3Yu27iQ8R3cMnN1t6FKm7/HVy0wbD6f0gjCQY3/J3u1T
   iTXHoSNZWFuOO6EtDNt1DPUAI3zcya+Pz89pyZtfby2uVXDekLwuuDomq
   Q==;
X-CSE-ConnectionGUID: xn6flIs4T1eYw/AfFjRLmQ==
X-CSE-MsgGUID: Bcs3xZH5R5KhI8N77jymbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86111597"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86111597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 12:52:04 -0700
X-CSE-ConnectionGUID: X5xofAJnQ96x7XBDvhbv4Q==
X-CSE-MsgGUID: ZkI01nfTTJW3PFJ/3lUbJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="218488427"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2026 12:51:59 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3JPN-000000001bV-35vz;
	Thu, 19 Mar 2026 19:51:53 +0000
Date: Fri, 20 Mar 2026 03:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>, linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ahmed Tiba <ahmed.tiba@arm.com>,
	Michael.Zhao2@arm.com, robh@kernel.org,
	linux-arm-kernel@lists.infradead.org, Dmitry.Lamerov@arm.com,
	rafael@kernel.org, conor@kernel.org, will@kernel.org, bp@alien8.de,
	catalin.marinas@arm.com, krzk+dt@kernel.org,
	linux-doc@vger.kernel.org, mchehab+huawei@kernel.org,
	tony.luck@intel.com
Subject: Re: [PATCH v3 10/10] RAS: add firmware-first CPER provider
Message-ID: <202603200337.hRVhVYpU-lkp@intel.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-10-48e6a1c249ef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-10-48e6a1c249ef@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_125204_736729_FD0B21A1 
X-CRM114-Status: GOOD (  11.73  )
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

[auto build test WARNING on 2d1373e4246da3b58e1df058374ed6b101804e07]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260319-115432
base:   2d1373e4246da3b58e1df058374ed6b101804e07
patch link:    https://lore.kernel.org/r/20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-10-48e6a1c249ef%40arm.com
patch subject: [PATCH v3 10/10] RAS: add firmware-first CPER provider
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603200337.hRVhVYpU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200337.hRVhVYpU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200337.hRVhVYpU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ras/cper-esource.c:26:
>> include/acpi/ghes_cper.h:105:44: warning: 'enum fixed_addresses' declared inside parameter list will not be visible outside of this definition or declaration
     105 |                       u64 *buf_paddr, enum fixed_addresses fixmap_idx);
         |                                            ^~~~~~~~~~~~~~~
   include/acpi/ghes_cper.h:108:45: warning: 'enum fixed_addresses' declared inside parameter list will not be visible outside of this definition or declaration
     108 |                         u64 buf_paddr, enum fixed_addresses fixmap_idx);
         |                                             ^~~~~~~~~~~~~~~
   include/acpi/ghes_cper.h:111:46: warning: 'enum fixed_addresses' declared inside parameter list will not be visible outside of this definition or declaration
     111 |                         u64 *buf_paddr, enum fixed_addresses fixmap_idx);
         |                                              ^~~~~~~~~~~~~~~
   include/acpi/ghes_cper.h:115:45: warning: 'enum fixed_addresses' declared inside parameter list will not be visible outside of this definition or declaration
     115 |                         u64 buf_paddr, enum fixed_addresses fixmap_idx,
         |                                             ^~~~~~~~~~~~~~~
   drivers/ras/cper-esource.c: In function 'cper_esource_ack':
   drivers/ras/cper-esource.c:84:23: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
      84 |                 val = readq(ctx->ack.addr);
         |                       ^~~~~
         |                       readl
   drivers/ras/cper-esource.c:87:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      87 |                 writeq(val, ctx->ack.addr);
         |                 ^~~~~~
         |                 writel
   cc1: some warnings being treated as errors


vim +105 include/acpi/ghes_cper.h

7f6d32e88c31e2 Ahmed Tiba 2026-03-18  102  
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  103  int ghes_read_estatus(struct ghes *ghes,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  104  		      struct acpi_hest_generic_status *estatus,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18 @105  		      u64 *buf_paddr, enum fixed_addresses fixmap_idx);
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  106  void ghes_clear_estatus(struct ghes *ghes,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  107  			struct acpi_hest_generic_status *estatus,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  108  			u64 buf_paddr, enum fixed_addresses fixmap_idx);
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  109  int __ghes_peek_estatus(struct ghes *ghes,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  110  			struct acpi_hest_generic_status *estatus,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  111  			u64 *buf_paddr, enum fixed_addresses fixmap_idx);
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  112  int __ghes_check_estatus(struct ghes *ghes,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  113  			 struct acpi_hest_generic_status *estatus);
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  114  int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  115  			u64 buf_paddr, enum fixed_addresses fixmap_idx,
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  116  			size_t buf_len);
dacb62d12abb41 Ahmed Tiba 2026-03-18  117  int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
dacb62d12abb41 Ahmed Tiba 2026-03-18  118  void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
dacb62d12abb41 Ahmed Tiba 2026-03-18  119  			    struct acpi_hest_generic_status *estatus);
40686d3c8f0a4d Ahmed Tiba 2026-03-18  120  int ghes_register_vendor_record_notifier(struct notifier_block *nb);
40686d3c8f0a4d Ahmed Tiba 2026-03-18  121  void ghes_unregister_vendor_record_notifier(struct notifier_block *nb);
648c11f76ec605 Ahmed Tiba 2026-03-18  122  void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
648c11f76ec605 Ahmed Tiba 2026-03-18  123  				   int sev);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  124  int ghes_severity(int severity);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  125  bool ghes_handle_memory_failure(struct acpi_hest_generic_data *gdata,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  126  				int sev, bool sync);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  127  bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  128  			      int sev, bool sync);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  129  void ghes_handle_aer(struct acpi_hest_generic_data *gdata);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  130  void ghes_log_hwerr(int sev, guid_t *sec_type);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  131  void __ghes_print_estatus(const char *pfx,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  132  			  const struct acpi_hest_generic *generic,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  133  			  const struct acpi_hest_generic_status *estatus);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  134  int ghes_print_estatus(const char *pfx,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  135  		       const struct acpi_hest_generic *generic,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  136  		       const struct acpi_hest_generic_status *estatus);
0eb637ae58ed14 Ahmed Tiba 2026-03-18  137  void ghes_cper_handle_status(struct device *dev,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  138  			     const struct acpi_hest_generic *generic,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  139  			     const struct acpi_hest_generic_status *estatus,
0eb637ae58ed14 Ahmed Tiba 2026-03-18  140  			     bool sync);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  141  void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
baccdf38fe1b81 Ahmed Tiba 2026-03-18  142  			    int severity);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  143  int cxl_cper_register_prot_err_work(struct work_struct *work);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  144  int cxl_cper_unregister_prot_err_work(struct work_struct *work);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  145  int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data *wd);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  146  void cxl_cper_post_event(enum cxl_event_type event_type,
baccdf38fe1b81 Ahmed Tiba 2026-03-18  147  			 struct cxl_cper_event_rec *rec);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  148  int cxl_cper_register_work(struct work_struct *work);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  149  int cxl_cper_unregister_work(struct work_struct *work);
baccdf38fe1b81 Ahmed Tiba 2026-03-18  150  int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd);
7f6d32e88c31e2 Ahmed Tiba 2026-03-18  151  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


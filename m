Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB50D1093177
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0aEFjmO68x0AQyUqXMqLJQg16Xp9sae1YCC3c5dfiQ=; b=Ke2Dxx3U4mJ8bKoE6zWcSWjwXa
	O4QtKujsS5RbA42Okh2NNNqk3a/oFWM7ZAj9tlIPctwksS75UIUIUj/iaTR+nxwdhh8AkuVWCdbIP
	NMFVlD9SXxQi2jWd2SFYq32hnC+9/P5XhIJ97YnO9NVqSXoHAFNuM0RPYiLrzIaICETBeegPK0chb
	bAiKiHg4nnXAiq/eXyT2nwaKJPGviUcw6uvcFdAhot8Vp8jWkIPjO3/cwj7n2JPY3qJLMLBTTru+7
	4q0rGGYmUtZbU2y7yONH6jZe7L4TWfGM6QEeEXtkXHNPiTxk57tKKABogBAQkONm0WsBI/sM30vJo
	njyyDvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TI0-0000000CAgy-26e7;
	Fri, 20 Mar 2026 06:24:57 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3THx-0000000CAgP-0mMH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 06:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773987893; x=1805523893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vgzhEI33fyynNHIHp2T6/dOm22GR1qOZib6VKCjuRc=;
  b=RdU8U0U/9oaZlKvAixDZxMGz4KjlgaIjXW3zHmc0R2fL2433aG8BwvvK
   f7EPjwaaXKuRqnOkcUJEM7cn7SLRb/v4h1G/qy2w3vM/6d7n78RUdOa60
   tzO/Wi6kpEViqF1AyeFTVkAX2fKS9gDBb90xfjvK5dNmQUpsxIIy+FSyN
   NyfA44dtJUozOGAyI98UAG7Raumas3GT77wSoVxqzZEzoaBzGAGNSqLCL
   FbvIwmvjHlOZ6r8WIuBdrmphF0FlGQo3v7rI43r59l4InoU/pIpPuPnHn
   f3O3Fuvthufepyf89N4DFJO5v85duy5+OjTx5W0sbIBdclrb2PHgQ/CGR
   g==;
X-CSE-ConnectionGUID: fHQk0ZlRSNGFSqwfvVmhYA==
X-CSE-MsgGUID: B6cVq5dUSJm4XMd5jNoxMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="100526659"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="100526659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 23:24:53 -0700
X-CSE-ConnectionGUID: z+0j/YTkRES49580rEmOGw==
X-CSE-MsgGUID: XEtK4EqCQnGlCLqXZqzRTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="219032758"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Mar 2026 23:24:48 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3THX-0000000023j-2m3T;
	Fri, 20 Mar 2026 06:24:31 +0000
Date: Fri, 20 Mar 2026 14:23:52 +0800
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
Subject: Re: [PATCH v3 06/10] ACPI: APEI: GHES: move CXL CPER helpers
Message-ID: <202603201429.rbHMPOvC-lkp@intel.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-6-48e6a1c249ef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-6-48e6a1c249ef@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_232453_258109_5AF3DEE9 
X-CRM114-Status: UNSURE (   9.18  )
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

Hi Ahmed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2d1373e4246da3b58e1df058374ed6b101804e07]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260319-115432
base:   2d1373e4246da3b58e1df058374ed6b101804e07
patch link:    https://lore.kernel.org/r/20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-6-48e6a1c249ef%40arm.com
patch subject: [PATCH v3 06/10] ACPI: APEI: GHES: move CXL CPER helpers
config: x86_64-randconfig-122-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201429.rbHMPOvC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201429.rbHMPOvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201429.rbHMPOvC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/apei/ghes_cper.c:391:1: sparse: sparse: symbol 'cxl_cper_fifo' was not declared. Should it be static?

vim +/cxl_cper_fifo +391 drivers/acpi/apei/ghes_cper.c

   388	
   389	/* Room for 8 entries for each of the 4 event log queues */
   390	#define CXL_CPER_FIFO_DEPTH 32
 > 391	DEFINE_KFIFO(cxl_cper_fifo, struct cxl_cper_work_data, CXL_CPER_FIFO_DEPTH);
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


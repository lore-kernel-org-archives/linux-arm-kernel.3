Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ABFC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ+QbE2SGjdrxarwEbi7lvcPGvz/5NMYU71bCP9sffE=; b=3mQzpk9QFRhiUEDrRc+iurs8FF
	WByPjYzjcSM14wf4HwOf9qADI2jt89YKwai9ob0kxYUmeh0/UvTlmfbE9iFwcp83V/2JL9dme+w7e
	K+h/IW736RLHYYhgMMymhk2WbGvAmhMnO/Evi3P2KcNX8+g5mC/MP5FqwuoViWWkwBjOMZ3pgFIhG
	6bi7vxGJsdd8V4x+gcmj6STkcEtSLulMdBUkCl4ycO24jnvIPM1/P8nb7rrZbqkQTU03ZNL6Eg7WK
	jONtMmMtV+pKhkBk0O5pyY+Xd59HXznWnTqenVMxWsXMV1sPhtBy0dxeZy9gPoSKgibzrGL6xWDQe
	Gdn2AfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhU-00000008UNu-08J6;
	Thu, 27 Feb 2025 19:37:40 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfge-00000007t5j-19XG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740669632; x=1772205632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O2RSGihEUeZucdzzlTWlLZ5f5Ojwj25KIj+Cw9BroWs=;
  b=FKLV04MRYYb7b6aXwpHrfElsZjmra+KifLCD9npobdPcD6XJ+PTnz8f8
   BRO0ec2GprKE4W+RlWeca1D1GXHrG+Mb1pwyqk8LQr694wRmx+VPzISLD
   A/CHUEwzfLQWIx7jZH59NOq3+pEME+lINtvK9p6WV3mvkSaFDt2UedETM
   iNL9zLs3oJ8AO2e4NHxSuAnozxtNelGgeqATD9UOcg87aqtrTGZWOui+0
   t1C1+zxPB2j5gqAEnywl962TNVD+upBjEuAr3d2KAoDiMcIfc7j63A9zw
   HGYQxK3OQ5gr2IG5noLmRg9N61wc4V9WrBfeUvzRGocDyx6ZWz+mpNW+9
   g==;
X-CSE-ConnectionGUID: TNw1JEf3SJysws7SHavkEA==
X-CSE-MsgGUID: 0CvShEytQVe5emBGocyZRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59100831"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="59100831"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 07:20:31 -0800
X-CSE-ConnectionGUID: tghChrLAT3uZcFB1OG6MDw==
X-CSE-MsgGUID: fJ23NbXIRqK8v79NrO9hEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121177193"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 07:20:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnfgR-000DYs-2D;
	Thu, 27 Feb 2025 15:20:23 +0000
Date: Thu, 27 Feb 2025 23:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>, rostedt@goodmis.org,
	mark.rutland@arm.com, alexei.starovoitov@gmail.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, catalin.marinas@arm.com,
	will@kernel.org, mhiramat@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, mathieu.desnoyers@efficios.com,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, dongml2@chinatelecom.cn,
	akpm@linux-foundation.org, rppt@kernel.org, graf@amazon.com,
	dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2] add function metadata support
Message-ID: <202502272339.DtueAali-lkp@intel.com>
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226121537.752241-1-dongml2@chinatelecom.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_072032_327334_54204941 
X-CRM114-Status: UNSURE (   9.07  )
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

Hi Menglong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/add-function-metadata-support/20250226-202312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250226121537.752241-1-dongml2%40chinatelecom.cn
patch subject: [PATCH bpf-next v2] add function metadata support
config: i386-kismet-CONFIG_CALL_PADDING-CONFIG_FUNCTION_METADATA-0-0 (https://download.01.org/0day-ci/archive/20250227/202502272339.DtueAali-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250227/202502272339.DtueAali-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272339.DtueAali-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CALL_PADDING when selected by FUNCTION_METADATA
   WARNING: unmet direct dependencies detected for CALL_PADDING
     Depends on [n]: CC_HAS_ENTRY_PADDING [=y] && OBJTOOL [=n]
     Selected by [y]:
     - FUNCTION_METADATA [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


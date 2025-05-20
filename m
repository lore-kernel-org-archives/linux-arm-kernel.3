Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFED1C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8DP2WifJvHrkxNPwHLHMbyEt3jyUnu8/m3juZmiS7Q=; b=afTjt00RErab8yi1+d6mASScC1
	KeVMvpp/6kBPG7MFzWJzKliDo7s2inYyl8Iy87S1fW5oO3dDF1o8LdxHBGFysjU6CXl/X9hVPiE+R
	EcCCAIa2nlzJ7C3shSrqLmI+z2hVdeImV9XLKek2ia4FPtpMZp5UT+AWO0YzCuBKS4vCQe79JiuhB
	pxyJQDIwYx69hUZQd2S3ElT944s4QheIjj3DQRYcCu0tdE9oNtpcv0Kze6q3VfuadPnoIlQaXdAq3
	8+2bLU2ZkyMJAbndoL9XU8oEffQemdIj5JtyU4eulC+IHsW3k91KxB5+Q1/bBCm1YVaSJlKX2eYnb
	EM0GXeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOUn-0000000DGFO-3qZw;
	Tue, 20 May 2025 15:03:09 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOQq-0000000DFdY-3CMi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747753145; x=1779289145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NMcXrGiaHFIGp+RChjQ02m4fBETUs2vLqyJ+mE9TY4M=;
  b=mrxWJ0qmBdLwJr7iMj6NsX7Cs0fjFsSzHpcscZ5JxzBlYtOfgK7WnTSU
   MrcOzfrRsmTQx1fMPkoqLltAZCI3aE4wj3HmciTCae8kYVLrO817PU2TR
   BV74nIU8gxsJgw5MPMmxgIRm/qSrdJ+QZxpT4B52ZM70C0azrtaNspRbn
   kIBO/PCDU4tCB5nRvai7LyF9Uua/Kwv2wRb3QCzQ8ZmDJySBQz9JyNEtJ
   gUuqHVD4yV9fPHYBcZ7giWdr7u07jHtz0WjQRiLS0YWfccvsnufsG7bCe
   VaFDuFx1Dzb1tfNonPeWkPXGdZ3SY4D0/tuWNcXonGrDuaj5eRqA9KmTz
   w==;
X-CSE-ConnectionGUID: HhVZ4YDUSz6KAEO0SCtIeQ==
X-CSE-MsgGUID: CwG0LCB2SM6Tg4rfZ2uplg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37307932"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="37307932"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:59:02 -0700
X-CSE-ConnectionGUID: fUeKVMhKTbK/YjJugARfoQ==
X-CSE-MsgGUID: ya/vDu2FQ12wCIQKRoqBmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140232739"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2025 07:59:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHOQj-000NGi-2X;
	Tue, 20 May 2025 14:58:57 +0000
Date: Tue, 20 May 2025 22:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>, linux-crypto@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	ebiggers@kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: arm64 - Drop asm fallback macros for older
 binutils
Message-ID: <202505202250.zpqKFIYE-lkp@intel.com>
References: <20250515142702.2592942-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515142702.2592942-2-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_075904_824552_BA27F229 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master soc/for-next linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/crypto-arm64-Drop-asm-fallback-macros-for-older-binutils/20250515-222813
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250515142702.2592942-2-ardb%2Bgit%40google.com
patch subject: [PATCH] crypto: arm64 - Drop asm fallback macros for older binutils
config: arm64-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202250.zpqKFIYE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202250.zpqKFIYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202250.zpqKFIYE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/crypto/sha3-ce-core.S: Assembler messages:
>> arch/arm64/crypto/sha3-ce-core.S:87: Error: selected processor does not support `eor3 v29.16b,v4.16b,v9.16b,v14.16b'
>> arch/arm64/crypto/sha3-ce-core.S:88: Error: selected processor does not support `eor3 v26.16b,v1.16b,v6.16b,v11.16b'
>> arch/arm64/crypto/sha3-ce-core.S:89: Error: selected processor does not support `eor3 v28.16b,v3.16b,v8.16b,v13.16b'
>> arch/arm64/crypto/sha3-ce-core.S:90: Error: selected processor does not support `eor3 v25.16b,v0.16b,v5.16b,v10.16b'
>> arch/arm64/crypto/sha3-ce-core.S:91: Error: selected processor does not support `eor3 v27.16b,v2.16b,v7.16b,v12.16b'
>> arch/arm64/crypto/sha3-ce-core.S:92: Error: selected processor does not support `eor3 v29.16b,v29.16b,v19.16b,v24.16b'
>> arch/arm64/crypto/sha3-ce-core.S:93: Error: selected processor does not support `eor3 v26.16b,v26.16b,v16.16b,v21.16b'
>> arch/arm64/crypto/sha3-ce-core.S:94: Error: selected processor does not support `eor3 v28.16b,v28.16b,v18.16b,v23.16b'
>> arch/arm64/crypto/sha3-ce-core.S:95: Error: selected processor does not support `eor3 v25.16b,v25.16b,v15.16b,v20.16b'
>> arch/arm64/crypto/sha3-ce-core.S:96: Error: selected processor does not support `eor3 v27.16b,v27.16b,v17.16b,v22.16b'
>> arch/arm64/crypto/sha3-ce-core.S:98: Error: selected processor does not support `rax1 v30.2d,v29.2d,v26.2d'
>> arch/arm64/crypto/sha3-ce-core.S:99: Error: selected processor does not support `rax1 v26.2d,v26.2d,v28.2d'
>> arch/arm64/crypto/sha3-ce-core.S:100: Error: selected processor does not support `rax1 v28.2d,v28.2d,v25.2d'
>> arch/arm64/crypto/sha3-ce-core.S:101: Error: selected processor does not support `rax1 v25.2d,v25.2d,v27.2d'
>> arch/arm64/crypto/sha3-ce-core.S:102: Error: selected processor does not support `rax1 v27.2d,v27.2d,v29.2d'
>> arch/arm64/crypto/sha3-ce-core.S:105: Error: selected processor does not support `xar v29.2d,v1.2d,v25.2d,(64-1)'
>> arch/arm64/crypto/sha3-ce-core.S:106: Error: selected processor does not support `xar v1.2d,v6.2d,v25.2d,(64-44)'
>> arch/arm64/crypto/sha3-ce-core.S:107: Error: selected processor does not support `xar v6.2d,v9.2d,v28.2d,(64-20)'
>> arch/arm64/crypto/sha3-ce-core.S:108: Error: selected processor does not support `xar v9.2d,v22.2d,v26.2d,(64-61)'
>> arch/arm64/crypto/sha3-ce-core.S:109: Error: selected processor does not support `xar v22.2d,v14.2d,v28.2d,(64-39)'
   arch/arm64/crypto/sha3-ce-core.S:110: Error: selected processor does not support `xar v14.2d,v20.2d,v30.2d,(64-18)'
   arch/arm64/crypto/sha3-ce-core.S:111: Error: selected processor does not support `xar v31.2d,v2.2d,v26.2d,(64-62)'
   arch/arm64/crypto/sha3-ce-core.S:112: Error: selected processor does not support `xar v2.2d,v12.2d,v26.2d,(64-43)'
   arch/arm64/crypto/sha3-ce-core.S:113: Error: selected processor does not support `xar v12.2d,v13.2d,v27.2d,(64-25)'
   arch/arm64/crypto/sha3-ce-core.S:114: Error: selected processor does not support `xar v13.2d,v19.2d,v28.2d,(64-8)'
   arch/arm64/crypto/sha3-ce-core.S:115: Error: selected processor does not support `xar v19.2d,v23.2d,v27.2d,(64-56)'
   arch/arm64/crypto/sha3-ce-core.S:116: Error: selected processor does not support `xar v23.2d,v15.2d,v30.2d,(64-41)'
   arch/arm64/crypto/sha3-ce-core.S:117: Error: selected processor does not support `xar v15.2d,v4.2d,v28.2d,(64-27)'
   arch/arm64/crypto/sha3-ce-core.S:118: Error: selected processor does not support `xar v28.2d,v24.2d,v28.2d,(64-14)'
   arch/arm64/crypto/sha3-ce-core.S:119: Error: selected processor does not support `xar v24.2d,v21.2d,v25.2d,(64-2)'
   arch/arm64/crypto/sha3-ce-core.S:120: Error: selected processor does not support `xar v8.2d,v8.2d,v27.2d,(64-55)'
   arch/arm64/crypto/sha3-ce-core.S:121: Error: selected processor does not support `xar v4.2d,v16.2d,v25.2d,(64-45)'
   arch/arm64/crypto/sha3-ce-core.S:122: Error: selected processor does not support `xar v16.2d,v5.2d,v30.2d,(64-36)'
   arch/arm64/crypto/sha3-ce-core.S:123: Error: selected processor does not support `xar v5.2d,v3.2d,v27.2d,(64-28)'
   arch/arm64/crypto/sha3-ce-core.S:124: Error: selected processor does not support `xar v27.2d,v18.2d,v27.2d,(64-21)'
   arch/arm64/crypto/sha3-ce-core.S:125: Error: selected processor does not support `xar v3.2d,v17.2d,v26.2d,(64-15)'
   arch/arm64/crypto/sha3-ce-core.S:126: Error: selected processor does not support `xar v25.2d,v11.2d,v25.2d,(64-10)'
   arch/arm64/crypto/sha3-ce-core.S:127: Error: selected processor does not support `xar v26.2d,v7.2d,v26.2d,(64-6)'
   arch/arm64/crypto/sha3-ce-core.S:128: Error: selected processor does not support `xar v30.2d,v10.2d,v30.2d,(64-3)'
   arch/arm64/crypto/sha3-ce-core.S:130: Error: selected processor does not support `bcax v20.16b,v31.16b,v22.16b,v8.16b'
   arch/arm64/crypto/sha3-ce-core.S:131: Error: selected processor does not support `bcax v21.16b,v8.16b,v23.16b,v22.16b'
   arch/arm64/crypto/sha3-ce-core.S:132: Error: selected processor does not support `bcax v22.16b,v22.16b,v24.16b,v23.16b'
   arch/arm64/crypto/sha3-ce-core.S:133: Error: selected processor does not support `bcax v23.16b,v23.16b,v31.16b,v24.16b'
   arch/arm64/crypto/sha3-ce-core.S:134: Error: selected processor does not support `bcax v24.16b,v24.16b,v8.16b,v31.16b'
   arch/arm64/crypto/sha3-ce-core.S:138: Error: selected processor does not support `bcax v17.16b,v25.16b,v19.16b,v3.16b'
   arch/arm64/crypto/sha3-ce-core.S:139: Error: selected processor does not support `bcax v18.16b,v3.16b,v15.16b,v19.16b'
   arch/arm64/crypto/sha3-ce-core.S:140: Error: selected processor does not support `bcax v19.16b,v19.16b,v16.16b,v15.16b'
   arch/arm64/crypto/sha3-ce-core.S:141: Error: selected processor does not support `bcax v15.16b,v15.16b,v25.16b,v16.16b'
   arch/arm64/crypto/sha3-ce-core.S:142: Error: selected processor does not support `bcax v16.16b,v16.16b,v3.16b,v25.16b'
   arch/arm64/crypto/sha3-ce-core.S:144: Error: selected processor does not support `bcax v10.16b,v29.16b,v12.16b,v26.16b'
   arch/arm64/crypto/sha3-ce-core.S:145: Error: selected processor does not support `bcax v11.16b,v26.16b,v13.16b,v12.16b'
   arch/arm64/crypto/sha3-ce-core.S:146: Error: selected processor does not support `bcax v12.16b,v12.16b,v14.16b,v13.16b'
   arch/arm64/crypto/sha3-ce-core.S:147: Error: selected processor does not support `bcax v13.16b,v13.16b,v29.16b,v14.16b'
   arch/arm64/crypto/sha3-ce-core.S:148: Error: selected processor does not support `bcax v14.16b,v14.16b,v26.16b,v29.16b'
   arch/arm64/crypto/sha3-ce-core.S:150: Error: selected processor does not support `bcax v7.16b,v30.16b,v9.16b,v4.16b'
   arch/arm64/crypto/sha3-ce-core.S:151: Error: selected processor does not support `bcax v8.16b,v4.16b,v5.16b,v9.16b'
   arch/arm64/crypto/sha3-ce-core.S:152: Error: selected processor does not support `bcax v9.16b,v9.16b,v6.16b,v5.16b'
   arch/arm64/crypto/sha3-ce-core.S:153: Error: selected processor does not support `bcax v5.16b,v5.16b,v30.16b,v6.16b'
   arch/arm64/crypto/sha3-ce-core.S:154: Error: selected processor does not support `bcax v6.16b,v6.16b,v4.16b,v30.16b'
   arch/arm64/crypto/sha3-ce-core.S:156: Error: selected processor does not support `bcax v3.16b,v27.16b,v0.16b,v28.16b'
   arch/arm64/crypto/sha3-ce-core.S:157: Error: selected processor does not support `bcax v4.16b,v28.16b,v1.16b,v0.16b'
   arch/arm64/crypto/sha3-ce-core.S:158: Error: selected processor does not support `bcax v0.16b,v0.16b,v2.16b,v1.16b'
   arch/arm64/crypto/sha3-ce-core.S:159: Error: selected processor does not support `bcax v1.16b,v1.16b,v27.16b,v2.16b'
   arch/arm64/crypto/sha3-ce-core.S:160: Error: selected processor does not support `bcax v2.16b,v2.16b,v28.16b,v27.16b'


vim +87 arch/arm64/crypto/sha3-ce-core.S

15d5910e92614e Ard Biesheuvel 2018-01-19   86  
15d5910e92614e Ard Biesheuvel 2018-01-19  @87  	eor3	v29.16b,  v4.16b,  v9.16b, v14.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @88  	eor3	v26.16b,  v1.16b,  v6.16b, v11.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @89  	eor3	v28.16b,  v3.16b,  v8.16b, v13.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @90  	eor3	v25.16b,  v0.16b,  v5.16b, v10.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @91  	eor3	v27.16b,  v2.16b,  v7.16b, v12.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @92  	eor3	v29.16b, v29.16b, v19.16b, v24.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @93  	eor3	v26.16b, v26.16b, v16.16b, v21.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @94  	eor3	v28.16b, v28.16b, v18.16b, v23.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @95  	eor3	v25.16b, v25.16b, v15.16b, v20.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  @96  	eor3	v27.16b, v27.16b, v17.16b, v22.16b
15d5910e92614e Ard Biesheuvel 2018-01-19   97  
15d5910e92614e Ard Biesheuvel 2018-01-19  @98  	rax1	v30.2d, v29.2d, v26.2d	// bc[0]
15d5910e92614e Ard Biesheuvel 2018-01-19  @99  	rax1	v26.2d, v26.2d, v28.2d	// bc[2]
15d5910e92614e Ard Biesheuvel 2018-01-19 @100  	rax1	v28.2d, v28.2d, v25.2d	// bc[4]
15d5910e92614e Ard Biesheuvel 2018-01-19 @101  	rax1	v25.2d, v25.2d, v27.2d	// bc[1]
15d5910e92614e Ard Biesheuvel 2018-01-19 @102  	rax1	v27.2d, v27.2d, v29.2d	// bc[3]
15d5910e92614e Ard Biesheuvel 2018-01-19  103  
15d5910e92614e Ard Biesheuvel 2018-01-19  104  	eor	 v0.16b,  v0.16b, v30.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @105  	xar	 v29.2d,   v1.2d,  v25.2d, (64 - 1)
15d5910e92614e Ard Biesheuvel 2018-01-19 @106  	xar	  v1.2d,   v6.2d,  v25.2d, (64 - 44)
15d5910e92614e Ard Biesheuvel 2018-01-19 @107  	xar	  v6.2d,   v9.2d,  v28.2d, (64 - 20)
15d5910e92614e Ard Biesheuvel 2018-01-19 @108  	xar	  v9.2d,  v22.2d,  v26.2d, (64 - 61)
15d5910e92614e Ard Biesheuvel 2018-01-19 @109  	xar	 v22.2d,  v14.2d,  v28.2d, (64 - 39)
15d5910e92614e Ard Biesheuvel 2018-01-19 @110  	xar	 v14.2d,  v20.2d,  v30.2d, (64 - 18)
15d5910e92614e Ard Biesheuvel 2018-01-19 @111  	xar	 v31.2d,   v2.2d,  v26.2d, (64 - 62)
15d5910e92614e Ard Biesheuvel 2018-01-19 @112  	xar	  v2.2d,  v12.2d,  v26.2d, (64 - 43)
15d5910e92614e Ard Biesheuvel 2018-01-19 @113  	xar	 v12.2d,  v13.2d,  v27.2d, (64 - 25)
15d5910e92614e Ard Biesheuvel 2018-01-19 @114  	xar	 v13.2d,  v19.2d,  v28.2d, (64 - 8)
15d5910e92614e Ard Biesheuvel 2018-01-19 @115  	xar	 v19.2d,  v23.2d,  v27.2d, (64 - 56)
15d5910e92614e Ard Biesheuvel 2018-01-19 @116  	xar	 v23.2d,  v15.2d,  v30.2d, (64 - 41)
15d5910e92614e Ard Biesheuvel 2018-01-19 @117  	xar	 v15.2d,   v4.2d,  v28.2d, (64 - 27)
15d5910e92614e Ard Biesheuvel 2018-01-19 @118  	xar	 v28.2d,  v24.2d,  v28.2d, (64 - 14)
15d5910e92614e Ard Biesheuvel 2018-01-19 @119  	xar	 v24.2d,  v21.2d,  v25.2d, (64 - 2)
15d5910e92614e Ard Biesheuvel 2018-01-19 @120  	xar	  v8.2d,   v8.2d,  v27.2d, (64 - 55)
15d5910e92614e Ard Biesheuvel 2018-01-19 @121  	xar	  v4.2d,  v16.2d,  v25.2d, (64 - 45)
15d5910e92614e Ard Biesheuvel 2018-01-19 @122  	xar	 v16.2d,   v5.2d,  v30.2d, (64 - 36)
15d5910e92614e Ard Biesheuvel 2018-01-19 @123  	xar	  v5.2d,   v3.2d,  v27.2d, (64 - 28)
15d5910e92614e Ard Biesheuvel 2018-01-19 @124  	xar	 v27.2d,  v18.2d,  v27.2d, (64 - 21)
15d5910e92614e Ard Biesheuvel 2018-01-19 @125  	xar	  v3.2d,  v17.2d,  v26.2d, (64 - 15)
15d5910e92614e Ard Biesheuvel 2018-01-19 @126  	xar	 v25.2d,  v11.2d,  v25.2d, (64 - 10)
15d5910e92614e Ard Biesheuvel 2018-01-19 @127  	xar	 v26.2d,   v7.2d,  v26.2d, (64 - 6)
15d5910e92614e Ard Biesheuvel 2018-01-19 @128  	xar	 v30.2d,  v10.2d,  v30.2d, (64 - 3)
15d5910e92614e Ard Biesheuvel 2018-01-19  129  
15d5910e92614e Ard Biesheuvel 2018-01-19 @130  	bcax	v20.16b, v31.16b, v22.16b,  v8.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @131  	bcax	v21.16b,  v8.16b, v23.16b, v22.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @132  	bcax	v22.16b, v22.16b, v24.16b, v23.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @133  	bcax	v23.16b, v23.16b, v31.16b, v24.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @134  	bcax	v24.16b, v24.16b,  v8.16b, v31.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  135  
15d5910e92614e Ard Biesheuvel 2018-01-19  136  	ld1r	{v31.2d}, [x9], #8
15d5910e92614e Ard Biesheuvel 2018-01-19  137  
15d5910e92614e Ard Biesheuvel 2018-01-19 @138  	bcax	v17.16b, v25.16b, v19.16b,  v3.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @139  	bcax	v18.16b,  v3.16b, v15.16b, v19.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @140  	bcax	v19.16b, v19.16b, v16.16b, v15.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @141  	bcax	v15.16b, v15.16b, v25.16b, v16.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @142  	bcax	v16.16b, v16.16b,  v3.16b, v25.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  143  
15d5910e92614e Ard Biesheuvel 2018-01-19 @144  	bcax	v10.16b, v29.16b, v12.16b, v26.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @145  	bcax	v11.16b, v26.16b, v13.16b, v12.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @146  	bcax	v12.16b, v12.16b, v14.16b, v13.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @147  	bcax	v13.16b, v13.16b, v29.16b, v14.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @148  	bcax	v14.16b, v14.16b, v26.16b, v29.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  149  
15d5910e92614e Ard Biesheuvel 2018-01-19 @150  	bcax	 v7.16b, v30.16b,  v9.16b,  v4.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @151  	bcax	 v8.16b,  v4.16b,  v5.16b,  v9.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @152  	bcax	 v9.16b,  v9.16b,  v6.16b,  v5.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @153  	bcax	 v5.16b,  v5.16b, v30.16b,  v6.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @154  	bcax	 v6.16b,  v6.16b,  v4.16b, v30.16b
15d5910e92614e Ard Biesheuvel 2018-01-19  155  
15d5910e92614e Ard Biesheuvel 2018-01-19 @156  	bcax	 v3.16b, v27.16b,  v0.16b, v28.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @157  	bcax	 v4.16b, v28.16b,  v1.16b,  v0.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @158  	bcax	 v0.16b,  v0.16b,  v2.16b,  v1.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @159  	bcax	 v1.16b,  v1.16b, v27.16b,  v2.16b
15d5910e92614e Ard Biesheuvel 2018-01-19 @160  	bcax	 v2.16b,  v2.16b, v28.16b, v27.16b

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


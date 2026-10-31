Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F284606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rHJ3WzkA;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRbMZZft
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XubOAWkhExxo+qfeaROgeq3zjEYzyFqzOx50lSyRWZ8=; b=rHJ3WzkAVVjC/eJ9S10plbHzJS
	K+1WPyOBpDGERhEYq5MJzdWhfeAA76qHSngQkmrsu+KLLzknOW6ffztDvgSPH/7iO/KSTx0dS+Eqj
	QKX4AKeQrQnL6uIc/pTUZpsiEEgACMV27Oc+mOU4S8Rb1OMvMK9A83ASG25T15wMAVtpzfy4HXQ0k
	TNpw3aByXdqLNmJWlg/rkfU4MZgBFIoYjgAdy5cKtCmM7QfyOHqiCakrngBvY1Y3/4acJs9Tp+mr2
	7b5OEQiWd5R+KzppEVP68gmINnkJTgrP19WGpqhstvgRvLQgoTmpp08EC9RrNRBEjtXOJi41Po3ne
	SYuIRx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFJI-0000000DeLy-3hVM;
	Sat, 31 Oct 2026 20:04:16 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFJG-0000000DeLX-1Iik;
	Sat, 31 Oct 2026 20:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793477055; x=1825013055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzUMYd+APfGaeHuT1aeH6UCv83u73Qae+OUu837zd2Y=;
  b=TRbMZZftxgdvtfjDwpnDWedSTyAQ6aSY5W1ycb5n0CIOVkyZljaLDxYT
   1HIw92iHbp01KVL9MNUkp1nwGxTtkpN6KhoKPd5OvT6Q8d1d+lDmAruhV
   Gx6eceI403NfH+4R8YZnyjQnxk7FcZuSQV/El2wZb7c+/X1GlLV4tmmM7
   nMB61vPj6LtNzZ8NGUyRkIWzviXtyo8MoRiRDPHo5y1J2EiZ9gMZNLgBr
   mhRAbKIoQPW8yVZOY4eAg0jdO8KoCa2b0fWpSLIu0cwZsdqcUbiAr5tw8
   hBlHfra0My1BrXs4pYWOKkphEsgUACG4pNUhGk7z8ROlJF97rBOH80UPL
   g==;
X-CSE-ConnectionGUID: J0EcgRu0TYO58B7XxoeykA==
X-CSE-MsgGUID: xsbCyWq6QkKV640XIwyh/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2111281"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2111281"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 13:04:13 -0700
X-CSE-ConnectionGUID: wqV4wtYUTm+3PBSF9WNvNw==
X-CSE-MsgGUID: tmPcoAeNRvmA/qsY12kUGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5610746"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2026 13:04:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNFJ9-00000000d8S-1vTm;
	Sat, 31 Oct 2026 20:04:07 +0000
Date: Sun, 1 Nov 2026 04:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mika Westerberg <westeri@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Message-ID: <202611010318.CB1ceS4i-lkp@intel.com>
References: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_130414_415602_4D5B3C2C 
X-CRM114-Status: GOOD (  10.48  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chunfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on westeri-thunderbolt/next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunfeng-Yun/thunderbolt-add-platform-nhi-driver/20261030-162536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20261030082539.1208733-2-chunfeng.yun%40mediatek.com
patch subject: [PATCH 1/4] thunderbolt: add platform nhi driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261101/202611010318.CB1ceS4i-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010318.CB1ceS4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010318.CB1ceS4i-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_init':
>> (.init.text+0x10): multiple definition of `init_module'; drivers/thunderbolt/pci.o:(.init.text+0x10): first defined here
   hppa-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:(.exit.text+0x0): first defined here
   hppa-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_init':
>> (.init.text+0x10): multiple definition of `init_module'; drivers/thunderbolt/pci.o:(.init.text+0x10): first defined here
   hppa-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:(.exit.text+0x0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


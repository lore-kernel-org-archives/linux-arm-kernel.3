Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93FBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4swbWpcLbK+AHGIVD/5KqvL65+6xD6kgXdMDQfd5tM=; b=gp8qKFqxDIVqI8rmYWGfgCZTDZ
	bR0vkO8/fhuFxZ48GzYSuJnErtebmDRaqkrKtA65MrhgbhprKMJeG7wSO+9k/SdPuJqBhk81lFWpZ
	M5Ananx2rDEJ0kxwr+mPr7p5gRpylsg7xcwxbDzRK1mMe/+314j8p8be8SCvfA/9tIxt2evK2kJXe
	bA5M8i6264+SDxSgchiTbWHsFr7Wsu8QlOiGrvNJoT5cEHV5CMATosbHqk8Y1TpjDym5B+NXEXxaO
	imAl/a/jJs6osXG3PutjaKfSDIyiPeGWU9rcl5MvHlz0hNts2aua2zOj//a4GBpKpAed1kneJNuxb
	Bq3No1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTK5E-0000000AKaf-0QFQ;
	Thu, 02 Jan 2025 12:13:48 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTK44-0000000AKPR-1I9f;
	Thu, 02 Jan 2025 12:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735819956; x=1767355956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XM7fKrVvkO92waHy3V3qQx/hqHJdwWyUKnuOdjW9YTA=;
  b=NZUe/GDWQkUVTsY0OaQeqKqhxmDTB76CcVFf+E2Qtn8RukzcDhRme/K+
   IVpl7L2bUS+pLENl7tElSkNvMkxkMKAJxClnZtZe4rvB3xEoQ4uTezDVq
   tKS2Zaf1i2VuVgzkKsrLAr71k49NNGoUpb65dzxj5ZMAnj3BtBmafIO/v
   hGJIennOR3fuY/u8MC8DgQS4zGKbSE8JWNMIqHQFZ/MJk4/eNNiTHRjWt
   LyVHdBFiqO0wRrui+t9ARkU6wz1Uwd/qUqeB+jGQ7OZJwQTg1dcfLjRCG
   EwPI1eTvZQXyME/i8mDDTEOyE3ebg2IdDNA5FoRe9PsDdwdiXywcmF+Zu
   w==;
X-CSE-ConnectionGUID: 4NW6LpHTQbSdU/y+DviQOQ==
X-CSE-MsgGUID: 9kgYLhwCSaaln39ZnFdn8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47467311"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="47467311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 04:12:33 -0800
X-CSE-ConnectionGUID: gdqhT1dXSfGBOKsyCDUT7Q==
X-CSE-MsgGUID: jVY8ZuGMS4mbgz5T/QdHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101328025"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jan 2025 04:12:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTK3v-0008UF-13;
	Thu, 02 Jan 2025 12:12:27 +0000
Date: Thu, 2 Jan 2025 20:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: shiming cheng <shiming.cheng@mediatek.com>,
	willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	lena.wang@mediatek.com, shiming cheng <shiming.cheng@mediatek.com>
Subject: Re: [PATCH]  ipv6: socket SO_BINDTODEVICE lookup routing fail
 without IPv6 rule.
Message-ID: <202501021940.ecvmrJJb-lkp@intel.com>
References: <20250102095114.25860-1-shiming.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102095114.25860-1-shiming.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_041236_357071_88276860 
X-CRM114-Status: GOOD (  13.89  )
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

Hi shiming,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shiming-cheng/ipv6-socket-SO_BINDTODEVICE-lookup-routing-fail-without-IPv6-rule/20250102-174939
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250102095114.25860-1-shiming.cheng%40mediatek.com
patch subject: [PATCH]  ipv6: socket SO_BINDTODEVICE lookup routing fail without IPv6 rule.
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250102/202501021940.ecvmrJJb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021940.ecvmrJJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021940.ecvmrJJb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from net/ipv6/ip6_output.c:26:
   net/ipv6/ip6_output.c:1307:19: error: non-static declaration of 'ip6_sk_dst_lookup_flow' follows static declaration
    1307 | EXPORT_SYMBOL_GPL(ip6_sk_dst_lookup_flow);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1307:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1307 | EXPORT_SYMBOL_GPL(ip6_sk_dst_lookup_flow);
         | ^~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1291:19: note: previous definition of 'ip6_sk_dst_lookup_flow' with type 'struct dst_entry *(struct sock *, struct flowi6 *, const struct in6_addr *, bool)' {aka 'struct dst_entry *(struct sock *, struct flowi6 *, const struct in6_addr *, _Bool)'}
    1291 | struct dst_entry *ip6_sk_dst_lookup_flow(struct sock *sk, struct flowi6 *fl6,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1309:36: error: invalid storage class for function 'ip6_opt_dup'
    1309 | static inline struct ipv6_opt_hdr *ip6_opt_dup(struct ipv6_opt_hdr *src,
         |                                    ^~~~~~~~~~~
   net/ipv6/ip6_output.c:1315:35: error: invalid storage class for function 'ip6_rthdr_dup'
    1315 | static inline struct ipv6_rt_hdr *ip6_rthdr_dup(struct ipv6_rt_hdr *src,
         |                                   ^~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1321:13: error: invalid storage class for function 'ip6_append_data_mtu'
    1321 | static void ip6_append_data_mtu(unsigned int *mtu,
         |             ^~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1345:12: error: invalid storage class for function 'ip6_setup_cork'
    1345 | static int ip6_setup_cork(struct sock *sk, struct inet_cork_full *cork,
         |            ^~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1420:12: error: invalid storage class for function '__ip6_append_data'
    1420 | static int __ip6_append_data(struct sock *sk,
         |            ^~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from net/ipv6/ip6_output.c:26:
   net/ipv6/ip6_output.c:1864:19: error: non-static declaration of 'ip6_append_data' follows static declaration
    1864 | EXPORT_SYMBOL_GPL(ip6_append_data);
         |                   ^~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1864:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    1864 | EXPORT_SYMBOL_GPL(ip6_append_data);
         | ^~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1828:5: note: previous definition of 'ip6_append_data' with type 'int(struct sock *, int (*)(void *, char *, int,  int,  int,  struct sk_buff *), void *, size_t,  int,  struct ipcm6_cookie *, struct flowi6 *, struct rt6_info *, unsigned int)' {aka 'int(struct sock *, int (*)(void *, char *, int,  int,  int,  struct sk_buff *), void *, long unsigned int,  int,  struct ipcm6_cookie *, struct flowi6 *, struct rt6_info *, unsigned int)'}
    1828 | int ip6_append_data(struct sock *sk,
         |     ^~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1866:13: error: invalid storage class for function 'ip6_cork_steal_dst'
    1866 | static void ip6_cork_steal_dst(struct sk_buff *skb, struct inet_cork_full *cork)
         |             ^~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1874:13: error: invalid storage class for function 'ip6_cork_release'
    1874 | static void ip6_cork_release(struct inet_cork_full *cork,
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from net/ipv6/ip6_output.c:26:
   net/ipv6/ip6_output.c:2007:19: error: non-static declaration of 'ip6_push_pending_frames' follows static declaration
    2007 | EXPORT_SYMBOL_GPL(ip6_push_pending_frames);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:2007:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2007 | EXPORT_SYMBOL_GPL(ip6_push_pending_frames);
         | ^~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:1997:5: note: previous definition of 'ip6_push_pending_frames' with type 'int(struct sock *)'
    1997 | int ip6_push_pending_frames(struct sock *sk)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:2009:13: error: invalid storage class for function '__ip6_flush_pending_frames'
    2009 | static void __ip6_flush_pending_frames(struct sock *sk,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from net/ipv6/ip6_output.c:26:
   net/ipv6/ip6_output.c:2031:19: error: non-static declaration of 'ip6_flush_pending_frames' follows static declaration
    2031 | EXPORT_SYMBOL_GPL(ip6_flush_pending_frames);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:2031:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2031 | EXPORT_SYMBOL_GPL(ip6_flush_pending_frames);
         | ^~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:2026:6: note: previous definition of 'ip6_flush_pending_frames' with type 'void(struct sock *)'
    2026 | void ip6_flush_pending_frames(struct sock *sk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_output.c:2074:1: error: expected declaration or statement at end of input
    2074 | }
         | ^
   At top level:
>> net/ipv6/ip6_output.c:2033:17: warning: 'ip6_make_skb' defined but not used [-Wunused-function]
    2033 | struct sk_buff *ip6_make_skb(struct sock *sk,
         |                 ^~~~~~~~~~~~


vim +/ip6_make_skb +2033 net/ipv6/ip6_output.c

0bbe84a67b0b54 Vlad Yasevich 2015-01-31  2025  
0bbe84a67b0b54 Vlad Yasevich 2015-01-31 @2026  void ip6_flush_pending_frames(struct sock *sk)
0bbe84a67b0b54 Vlad Yasevich 2015-01-31  2027  {
6422398c2ab092 Vlad Yasevich 2015-01-31  2028  	__ip6_flush_pending_frames(sk, &sk->sk_write_queue,
6422398c2ab092 Vlad Yasevich 2015-01-31  2029  				   &inet_sk(sk)->cork, &inet6_sk(sk)->cork);
0bbe84a67b0b54 Vlad Yasevich 2015-01-31  2030  }
a495f8364efe11 Chris Elston  2012-04-29  2031  EXPORT_SYMBOL_GPL(ip6_flush_pending_frames);
6422398c2ab092 Vlad Yasevich 2015-01-31  2032  
6422398c2ab092 Vlad Yasevich 2015-01-31 @2033  struct sk_buff *ip6_make_skb(struct sock *sk,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


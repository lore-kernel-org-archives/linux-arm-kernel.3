Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7057E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 13:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daEGGOGvnX/ycQ/j/brvURaB8scAuSEWMXRIiOnHgnA=; b=SfOB87ETossGsCre1ye6awg/r0
	rjolHwUqMxva3Z64JXJHi0Rc2r+B7NitLF2jADl5USjCPE5D7vbbAcT5oy9j37ATsCkaQ87Mt2iZC
	hWejDkrLlTeyv8A5PQSTs512cq4t4NJar8CSCMFi3PPC0uX7G+vHoJxzVkJZPUHdDuktPd79Dubdt
	YXn3DpEZYUtz0flrlmfrny9deyWnUjsiorvk+P/OIHJkAo2l2ux56LZgcEvNKkdcSWMr5+pxNSKbC
	b96Tsdqb4Wx+c6dcIDHk7Ils58A/zPnqj/rj4hBayem3WLEnKmpmua6l7YotrNjaOQFkpa/ajcOwM
	l1LGJYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKtu-0000000AQkL-1krL;
	Thu, 02 Jan 2025 13:06:10 +0000
Received: from [192.198.163.19] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKsk-0000000AQYA-0rqw;
	Thu, 02 Jan 2025 13:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735823098; x=1767359098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MyiQ5rs7irBI2s5zak+5MNpRwo9hfZpRiM0mF8/K27c=;
  b=Id283T79DJYXrBvUWFheuqqjhKbS8D07YDBXgH6uTAFBhZzvi3IzCTOG
   jAT0KJpw5F/2T/K00ynuiEnV3VChbyz5IbJdFVPNwo5YWZ41VgdCvx6Hj
   dGz4utMn8jQpZnR6fAGlq4gPmPhxKKk3NHHwCHDcvY7Jdx50v7oM+HW6V
   CB3oWsA2Xfi3ajj5YXIRbFc/9rPaiphNVocX4ev4HMoD/unvOf2ZOJeUF
   9aJEgh8bduj++/7p7NNHcGQVAPeQVLUwn60XjyMVmY7hThZjHnk42mAWv
   j8l3zgERXhr2kZYJ72y8w/D9YUsHvKlGcmbKJ6OBK4OP8DuwinnU8lN1R
   Q==;
X-CSE-ConnectionGUID: ktjG9gvfRb206ubqbX9iPA==
X-CSE-MsgGUID: ZoHkx7eEQMaiYFcD+EJBgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35301554"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="35301554"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 05:04:39 -0800
X-CSE-ConnectionGUID: suJd/1WaRES5LC6uzuojLA==
X-CSE-MsgGUID: VgInYyNqSV6V66l5vbyMRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124775510"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jan 2025 05:04:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTKsJ-0008Vj-1k;
	Thu, 02 Jan 2025 13:04:31 +0000
Date: Thu, 2 Jan 2025 21:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: shiming cheng <shiming.cheng@mediatek.com>,
	willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, lena.wang@mediatek.com,
	shiming cheng <shiming.cheng@mediatek.com>
Subject: Re: [PATCH]  ipv6: socket SO_BINDTODEVICE lookup routing fail
 without IPv6 rule.
Message-ID: <202501022057.YOhf05jy-lkp@intel.com>
References: <20250102095114.25860-1-shiming.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102095114.25860-1-shiming.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_050458_293880_D14ED045 
X-CRM114-Status: GOOD (  12.99  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main soc/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shiming-cheng/ipv6-socket-SO_BINDTODEVICE-lookup-routing-fail-without-IPv6-rule/20250102-174939
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250102095114.25860-1-shiming.cheng%40mediatek.com
patch subject: [PATCH]  ipv6: socket SO_BINDTODEVICE lookup routing fail without IPv6 rule.
config: riscv-randconfig-001-20250102 (https://download.01.org/0day-ci/archive/20250102/202501022057.YOhf05jy-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022057.YOhf05jy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022057.YOhf05jy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv6/ip6_output.c:1239:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1259:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1294:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1311:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1317:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1327:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1348:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1429:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1834:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1867:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1876:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1898:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1978:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:1998:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:2013:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:2027:1: error: function definition is not allowed here
   {
   ^
   net/ipv6/ip6_output.c:2039:1: error: function definition is not allowed here
   {
   ^
>> net/ipv6/ip6_output.c:2074:2: error: expected '}'
   }
    ^
   net/ipv6/ip6_output.c:1107:1: note: to match this '{'
   {
   ^
   18 errors generated.


vim +1239 net/ipv6/ip6_output.c

34a0b3cdc07874 Adrian Bunk              2005-11-29  1225  
497c615abad7ee Herbert Xu               2006-07-30  1226  /**
497c615abad7ee Herbert Xu               2006-07-30  1227   *	ip6_dst_lookup - perform route lookup on flow
b51cd7c834dba0 Andrew Lunn              2020-07-13  1228   *	@net: Network namespace to perform lookup in
497c615abad7ee Herbert Xu               2006-07-30  1229   *	@sk: socket which provides route info
497c615abad7ee Herbert Xu               2006-07-30  1230   *	@dst: pointer to dst_entry * for result
4c9483b2fb5d25 David S. Miller          2011-03-12  1231   *	@fl6: flow to lookup
497c615abad7ee Herbert Xu               2006-07-30  1232   *
497c615abad7ee Herbert Xu               2006-07-30  1233   *	This function performs a route lookup on the given flow.
497c615abad7ee Herbert Xu               2006-07-30  1234   *
497c615abad7ee Herbert Xu               2006-07-30  1235   *	It returns zero on success, or a standard errno code on error.
497c615abad7ee Herbert Xu               2006-07-30  1236   */
343d60aada5a35 Roopa Prabhu             2015-07-30  1237  int ip6_dst_lookup(struct net *net, struct sock *sk, struct dst_entry **dst,
343d60aada5a35 Roopa Prabhu             2015-07-30  1238  		   struct flowi6 *fl6)
497c615abad7ee Herbert Xu               2006-07-30 @1239  {
497c615abad7ee Herbert Xu               2006-07-30  1240  	*dst = NULL;
343d60aada5a35 Roopa Prabhu             2015-07-30  1241  	return ip6_dst_lookup_tail(net, sk, dst, fl6);
497c615abad7ee Herbert Xu               2006-07-30  1242  }
3cf3dc6c2e05e6 Arnaldo Carvalho de Melo 2005-12-13  1243  EXPORT_SYMBOL_GPL(ip6_dst_lookup);
3cf3dc6c2e05e6 Arnaldo Carvalho de Melo 2005-12-13  1244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


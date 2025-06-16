Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37530C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEkUmAlrU3Ij75G0J4YK0UFr/TZuGkykmvlXbTuEixU=; b=371eqtqLj52ZFXJMMWDsQs4jUX
	dVfaaHmwjHBeRD9bnkkAtTEAjBBY8TmUFZJ7by/4R9lPToM57N8awV9pGfpE6MYr+l71ZusMZNcHZ
	48T0WrFWVKRR8mm2Mvim3tywvDGMipemUJJ/fxglhDDOlvPua1+wHqkCI2CC2tt/UdCB9ckW/sZA3
	qDuf35kLd7bkkCwAnt8LkK8ZADMUslNcXra6fgOPLSKfvWytAnN5tRxmwguL7UDJqDjDr7AFMzxDx
	hVJSPl0YDdRZWXECQkMak2nwlkBZBExJ0ICAsyRrAMmbJikEQDBYxyoKwoEpvVJwI69MZ1swN6iS0
	5Qm8eqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3Hf-00000003VIg-2VXL;
	Mon, 16 Jun 2025 06:25:31 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3Bp-00000003Uqo-3ikH;
	Mon, 16 Jun 2025 06:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750054769; x=1781590769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K8IQ3inhhwcVlDH/GVeLQStlboqAYJS91qtzQftORFk=;
  b=GRxhQkRDVZy7qoMPNR1xqKnn3fDtCNfyOssBMp9fs/zQ57KESdjGD6Fa
   hUTLKDR24lGHqzizJGZGIoDqbqbQCpY7CfujIt1/pof1868/N5jQZnSTq
   r6dWFm7cf4QtY0KFpMoCpFaeqdr44DdM0iqsVV+MTJq3dhAc4jE4SAwqh
   6sqy6OfaQAJfo702WnBpn2Qd5+ew3YstsSNkurPu2Ze/RG8hqezyfRZHa
   LVYnOVVknVT+OLSWrgYDJ6Vwkv2o9nuYNkzT/l4aUsAgGCEEEG2XMUGyl
   5Gp3j+GtDfz7JVUN0LNDCzGizxKUWu65+Ak9JI3nclaNjbLoUzizKr3F4
   w==;
X-CSE-ConnectionGUID: TB7FlmrlRGu57JpyPdCUDA==
X-CSE-MsgGUID: NOfhrtRTTzanZDb9fNRp6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62461099"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62461099"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:19:26 -0700
X-CSE-ConnectionGUID: utMW0UdyTROqSUp873fbVg==
X-CSE-MsgGUID: vM9rNMYRQLeQ2OCKX13K5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148372684"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jun 2025 23:19:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR3Bh-000Emu-15;
	Mon, 16 Jun 2025 06:19:21 +0000
Date: Mon, 16 Jun 2025 14:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH net-next 2/2] net: airoha: Differentiate hwfd buffer size
 for QDMA0 and QDMA1
Message-ID: <202506161459.ENhGD33a-lkp@intel.com>
References: <20250615-airoha-hw-num-desc-v1-2-8f88daa4abd7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615-airoha-hw-num-desc-v1-2-8f88daa4abd7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_231929_971128_A90737DF 
X-CRM114-Status: UNSURE (   9.03  )
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

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8909f5f4ecd551c2299b28e05254b77424c8c7dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/net-airoha-Compute-number-of-descriptors-according-to-reserved-memory-size/20250615-163827
base:   8909f5f4ecd551c2299b28e05254b77424c8c7dc
patch link:    https://lore.kernel.org/r/20250615-airoha-hw-num-desc-v1-2-8f88daa4abd7%40kernel.org
patch subject: [PATCH net-next 2/2] net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250616/202506161459.ENhGD33a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161459.ENhGD33a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161459.ENhGD33a-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/net/ethernet/airoha/airoha-eth.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


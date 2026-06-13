Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990D8CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2/UFn3//unKPxU1xUH4EJSVP4IZTomnoT6CQvkNf04=; b=bS9NgagUX7Is4IiSxMyr2XdYBv
	WftcJDgJRC2olHyddNtjFSVhS3uWdbMDRhw34Sg8K0dTEyeXXjmLjieHHKeN3BnWbPBS7ajgPChmA
	yLAJipAcx5H5XlCrQ21YvPYwnge9i0fjHDE8CyLuLf6E5dIv5TupNmfCSFTfZwTafnaalxPNRVEQ3
	poUkaf4iGawO5N5XXlVuqclRU9sIcyqPYl0+EEMjL8h9UHgwUp7RD1BugjEIQyUG34DIfYHnB3ZKr
	UKKDHKactoMWLTM8csy5h4g4/SskAw00zGUipDC/RUgOMyWqujmLyUDna3Ewdiv5oSP/9gNi/pd9V
	7Q2l1pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJNu-0000000C4Uj-0M8a;
	Sat, 13 Jun 2026 08:06:30 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJNq-0000000C4Tm-1sWb;
	Sat, 13 Jun 2026 08:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781337987; x=1812873987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o0LWqic+72nuI6gnGf1tCPfCLx4sFK1P3umA/isHRZM=;
  b=OqHo3jJMmzTFaYWmOOTIJf2Bv5IPi7L5r1ZPjypYjhmF1wL5spgqPEMF
   mHDgF/okdwqYoTbe0xhuRCJ2uszVrAiS6Aj2ebAleHVYah5F4Doit5vIj
   6nHdGQv0RPHAjH8uIDY9TCP07rLsmMJ+wcwERW7nVDHJ/4ijtXCLr8i3k
   6nrWG8yuoNAB+Ss06j6Rb3eBTxiLY8Xb5cP+gTeHSox045XzcottdHOG3
   jZX2uM40Oa2dlZEb5KKLZGcBrJeQMkARCIsQZRnt2qqUoXrPRY5l8IdFg
   yLkdMsxQzrkAm9wV67NsThpt4jNdAtoWc5V4ZrLJvKGN8v1YGrXwOx8fy
   A==;
X-CSE-ConnectionGUID: 4ON23yw5T9e0huBFdTXCeQ==
X-CSE-MsgGUID: GZoYLjb3QYqy2Hco7EFr4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93274262"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="93274262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 01:06:25 -0700
X-CSE-ConnectionGUID: zxpGxI25SySLHMo9tIS3hA==
X-CSE-MsgGUID: Sr4z/Zy3Rm6hJaKZSqoWsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="271070754"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2026 01:06:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYJNg-000000004Sb-1EtN;
	Sat, 13 Jun 2026 08:06:16 +0000
Date: Sat, 13 Jun 2026 10:05:56 +0200
From: kernel test robot <lkp@intel.com>
To: xur@google.com, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	Jeff Layton <jlayton@kernel.org>, Kees Cook <kees@kernel.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH] net: correcting section tags for .init and .exit
 data/functions
Message-ID: <202606131033.U9FHCI7B-lkp@intel.com>
References: <20260612162257.896792-1-xur@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612162257.896792-1-xur@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_010626_556328_053F6A4C 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/net-correcting-section-tags-for-init-and-exit-data-functions/20260613-002737
base:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
patch link:    https://lore.kernel.org/r/20260612162257.896792-1-xur%40google.com
patch subject: [PATCH] net: correcting section tags for .init and .exit data/functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260613/202606131033.U9FHCI7B-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131033.U9FHCI7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131033.U9FHCI7B-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tcpv6_init+0x68 (section: .text) -> mptcpv6_init (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


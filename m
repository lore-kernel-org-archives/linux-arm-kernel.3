Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C73CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 04:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgJxgDfxtiiqi/FsQFYpZ6qKTbL9WkPhvK4NoW0R+Hk=; b=frGLIPtdlKQlqQiRK6xg6j7E+w
	eicBaI7sKxAVZoYL0zQttBmbvbHUINm5zfrBTrEWcoe7DwMs7kmXnes8CuOn+N6XO95wzP2PvU2eR
	5+7PsQ5UsmM8Ib8vYdrOlG44r7yjLYrpl7HnjkY4ALnn2sK0iOCIjxWVKidNrJ06HdyUxSFDqLVSk
	sW+qngTWsYPO4wFTB+C5SfWgjdeoPRK6MBxXju0yNCqE8y/YsdRogiYklfHVyZRw5UD0mhI1Fhgka
	9ayL2+riIEjClhZOJvM/0UX8A5rZ1vk5mG8YiY84heMJKcgGEddZNpuxOrpaX7t7zJUAqUoBdoeSa
	HitiMJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGS4-0000000BxDH-1zzh;
	Sat, 13 Jun 2026 04:58:36 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGS2-0000000BxCs-0UMs;
	Sat, 13 Jun 2026 04:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781326715; x=1812862715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xfdQAk8hOZeTRbB7qMzLFBHQ7VdAyRpAfubRo8KlAVk=;
  b=Zsrd6aw7x68TLOfo+rL5+deHjzPMqP86a3Dp/hnWhNHjHQQpg/+MCWNb
   W0gl7Lc3NxMMNgbajmMKShUeQGfzQKGNVoT2OIWG8jpYJZQqSLA159gyO
   koIWQb8EDXklvMWT2TAcjo2Ld30L07IwCueFSXS+7PMYb334Ks2pznUqp
   Tmmdt9qW+tS+jT4HKpZrri9lrE+FUYQPmfWzYW5+PTL+Bho7Z+H1rMeJa
   9ipLCF+/D7JcCYBPbZnnlh09JPhk5QzcjGpoMQS3Im8XR8+GuB6TU81th
   WvPQ4cqX44BG75aYmaz/sb5CM/8mVXNA6IpEN6AbsnS6KV/5xLnpTR1qq
   Q==;
X-CSE-ConnectionGUID: xgdQ4+3RQ7mYV5KHWGKjxw==
X-CSE-MsgGUID: DKcsBgWgSzabDRCEHvfFJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92478528"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="92478528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 21:58:33 -0700
X-CSE-ConnectionGUID: LX0Rr/buTFmdbXqybCsI5g==
X-CSE-MsgGUID: DzJi5M1fRy6mhLkkAqA6BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="252091779"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2026 21:58:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYGRq-00000000Pgc-2uT7;
	Sat, 13 Jun 2026 04:58:22 +0000
Date: Sat, 13 Jun 2026 12:57:30 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH] net: correcting section tags for .init and .exit
 data/functions
Message-ID: <202606131254.r0pBxDPY-lkp@intel.com>
References: <20260612162257.896792-1-xur@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612162257.896792-1-xur@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_215834_329572_798D5E23 
X-CRM114-Status: UNSURE (   8.49  )
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
config: csky-defconfig (https://download.01.org/0day-ci/archive/20260613/202606131254.r0pBxDPY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131254.r0pBxDPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131254.r0pBxDPY-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: tcpv6_init+0x66 (section: .text) -> mptcpv6_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: tcpv6_exit+0x58 (section: .text) -> mptcpv6_init (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


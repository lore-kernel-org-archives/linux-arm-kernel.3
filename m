Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D15C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA55SpUUCkqGCW+jWzjwXST2QX9l/baInc/R9Ty9Qn0=; b=wR6Y80bzIbqfGJ2dVKSEMzQVjH
	2rQQStTrzPThR4PvFI7jOdX2l4jOKP1RkHm3FKPOpsA8ZQxW7LOrWIiDOrFUvONReGJUUdu0XG6SD
	XhsieBR7ak/yVgWoPXXcANN31EdS7GRUBp8MHhqoaKZUI4Iug5EPrMop+EGaAeXC1cCjKdnBgMWX3
	Vk2Lasuuma+fGvA4zyBdCurLIawZvcTY4mal4kCSRsWVzDp+xvH91fYTU2pWQQCIBq/oLGTtxCGl1
	zmnvyYxzDjYlP33iZ5OG2Z7Hi/+XcdhDT6cZywJCiDGoGiyvpo4mQKRsfZiurnSd4+I7n17NvOiJA
	IFlbPkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHqk-00000009GYV-0TzL;
	Thu, 17 Jul 2025 06:12:10 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHoI-00000009GJU-1rZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 06:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752732578; x=1784268578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=06sfEwPwapl7HSwBzGHEiTcJjFqV4RXxkshBTqEhmwM=;
  b=c8mupa7H9PuA6RfQyftp5tLXPiHVZzBK4jKfOUcvOS7xcHkC3g1qPdXk
   ANeMzGm6U65aW0EldONUrTYS8B/c3O935WTVkMbNJfwDRikiOZv1ugRcl
   881GU3+uRFHojr9CJj1KaaZU3B0NOABsFX7+l6M54WkeQX0e0tRw6zSGp
   fYH6Xd2oz8eKOAe5jRFJeJRHD23TGMOFyD/KPk71neCvW4uysiAP0fv/q
   GpEiKKp8mss/9qUauvFeXp3MJOA+3oUvoKyN4xtZJNY5AlXfTR2iQZoC4
   yqHG692sRJf+PCfUnFIIQLe46RXLCkYqWOmUBrQ44lYNeTsKWqru3IcF6
   g==;
X-CSE-ConnectionGUID: J9i+ITzmSuKGG6O6fk02ZQ==
X-CSE-MsgGUID: mjthxtpkTSqEE8LejpnmJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54711584"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="54711584"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 23:09:37 -0700
X-CSE-ConnectionGUID: 8o1ZTcU5T068tA/m6Rj96Q==
X-CSE-MsgGUID: GNfgJmtrTmaUQvJelTDqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="163340836"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2025 23:09:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucHoB-000DCr-26;
	Thu, 17 Jul 2025 06:09:31 +0000
Date: Thu, 17 Jul 2025 14:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202507171313.1yaQJ9Tl-lkp@intel.com>
References: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_230938_560380_A2E9CE5D 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Yassine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 155a3c003e555a7300d156a5252c004c392ec6b0]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa-via-B4-Relay/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250716-225824
base:   155a3c003e555a7300d156a5252c004c392ec6b0
patch link:    https://lore.kernel.org/r/20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5%40allegrodvt.com
patch subject: [PATCH v4 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171313.1yaQJ9Tl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171313.1yaQJ9Tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171313.1yaQJ9Tl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_cleanup':
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c:149:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     149 |         kfree(cmd->reply);
         |         ^~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_create':
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |               ^~~~~~~
         |               mm_alloc
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:13: warning: assignment to 'struct al_codec_cmd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |             ^
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:169:20: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     169 |         cmd->reply = kmalloc(reply_size, GFP_KERNEL);
         |                    ^
   cc1: some warnings being treated as errors


vim +165 drivers/media/platform/allegro-dvt/al300/al_codec_util.c

   160	
   161	struct al_codec_cmd *al_codec_cmd_create(int reply_size)
   162	{
   163		struct al_codec_cmd *cmd;
   164	
 > 165		cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
   166		if (!cmd)
   167			return NULL;
   168	
 > 169		cmd->reply = kmalloc(reply_size, GFP_KERNEL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


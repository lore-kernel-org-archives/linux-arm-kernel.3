Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB1FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 04:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RkO/FiptvNcnImODz0dg3TOItds46aHSk4kZBgr/T4=; b=Tqpto5sZ5RBPsZ7GRnNCoI3DXR
	aTb1qMgH396q8/aMCE5TzUMPZgt/HitDGYYkjIEGY8Y7dBWs/FBUML15GPukeQyqXOwdLUTRPkl69
	lyf4bPiVW7YSOWiSf4QKwjYD22WwGEiCqqv7vPbsa54R5jD2CqRCFhMZGALsXAVvkzjZmkGjKiHpy
	l983DqvmaFbrJ2agv89K/nHmX2W86vCgwXAP3eXoPhwe6xJ7eG0fd6XHPKxo7JupAzpsM/a4P6SPT
	Kn6PuJUYLYTJp0H0oxdMgvYdCVzOuFmjJ0qRXEw8PDc/uaMf2Oa6HZa0SxvDPqTZuPYuHj/iNYHgg
	b5exGXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucFse-000000099dJ-2UpT;
	Thu, 17 Jul 2025 04:06:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucFqD-000000099Xg-2Vzq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 04:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752725009; x=1784261009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tnwJ0nfGdmO4kzHiCdsk8siEsbxTWszsH8I6n93yCl4=;
  b=VM+SQTqzOlg35V64kTuLt0OWEJdpcsI9irobbR8xI1pmFAtIYYWPjz/E
   mW94LcVhBYb/53hkcApnCkWlMDIk/Xqtp0vfB8KXaVxwf1KFJDhoFR9m7
   Dc4QTcQdAg1ze5WOsK4EzO7gk4mP4GoKkatEMgg3tcvpR1zONoFOmeZYj
   qJ4Cy2vcxzwL/wcy6PVwLVY2/SuPfuBCJCcfjlQ0A57b9+3pobzm0ufsu
   nlwRFX50wH1C5VIWKWRWmV+skOK4yYLKmcgoHFcr5Gggkemc4IBsEZWzA
   AmGyrT6yjCkbaRAIPrf9/3SJYQbAgvE3zAOmhlhDbiEgvtBl6rVPsQrcb
   w==;
X-CSE-ConnectionGUID: acAOQBzlR/eS0+1FjgTyqQ==
X-CSE-MsgGUID: LTSABNT2QvG/lyjs7ld23w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57596034"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="57596034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 21:03:24 -0700
X-CSE-ConnectionGUID: ADtF+glrTbmoNNNluCCIyQ==
X-CSE-MsgGUID: NlxNpl7gStqD4fOCL/DkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="194810445"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jul 2025 21:03:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucFq1-000D7z-2t;
	Thu, 17 Jul 2025 04:03:17 +0000
Date: Thu, 17 Jul 2025 12:03:01 +0800
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
Message-ID: <202507171125.Cy8G5dte-lkp@intel.com>
References: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_210329_654717_051FE868 
X-CRM114-Status: GOOD (  10.96  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 155a3c003e555a7300d156a5252c004c392ec6b0]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa-via-B4-Relay/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250716-225824
base:   155a3c003e555a7300d156a5252c004c392ec6b0
patch link:    https://lore.kernel.org/r/20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5%40allegrodvt.com
patch subject: [PATCH v4 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171125.Cy8G5dte-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171125.Cy8G5dte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171125.Cy8G5dte-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_cleanup':
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:149:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     149 |         kfree(cmd->reply);
         |         ^~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_create':
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |               ^~~~~~~
         |               mm_alloc
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:13: error: assignment to 'struct al_codec_cmd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |             ^
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:169:20: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     169 |         cmd->reply = kmalloc(reply_size, GFP_KERNEL);
         |                    ^


vim +/kfree +149 drivers/media/platform/allegro-dvt/al300/al_codec_util.c

   144	
   145	static void al_codec_cmd_cleanup(struct kref *ref)
   146	{
   147		struct al_codec_cmd *cmd = container_of(ref, typeof(*cmd), refcount);
   148	
 > 149		kfree(cmd->reply);
   150		kfree(cmd);
   151	}
   152	
   153	void al_codec_cmd_put(struct al_codec_cmd *cmd)
   154	{
   155		if (WARN_ON(!cmd))
   156			return;
   157	
   158		kref_put(&cmd->refcount, al_codec_cmd_cleanup);
   159	}
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


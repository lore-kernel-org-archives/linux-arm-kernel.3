Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3318AC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 00:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gv5NSJgNtnmp8kiZaN5Fngb2j5uD28SoTOv69NlCEQU=; b=gejmTcyT5pR3UPq2gdsi4dTh1U
	puN879TMpN3fBcAEiqx3NGQ1YPj+qXYLhtR6Ad0GG80TaawDMTMHKoBEZgw7N1NI6Fb8G8zwOxlEK
	CWWHL27TsbVOyTy7u9scrbZCe2qaKxC6uf8eigROYSUpuQ1BT8RQi9xf7UzUTCOk5yWWMX740l7rj
	d81LkLWTUzLUFTMlTWN+9Z5oiTExx2l++dnzJqLKCh1AH32bc4p8rtKqysu+zvKKPwf4BaW/TwvTF
	W2ML6YCEwG4w7VoY7hk0+itM23IGHDqK8kZ59PddgDOeoLY+G1WLx/8RIL/9nO7aJ7n7ZPGWJ3NWb
	UW+EK80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIcsY-0000000586L-2oEh;
	Sat, 24 May 2025 00:36:46 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIcns-000000057mQ-2Hc3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 00:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748046716; x=1779582716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8B9ms8skaqPcUFNLJygoW8B0+g4QerMXzcmxHo4OEu4=;
  b=T+nDhL9kNOU4l3aubFZ63937MltCtcSSjjKH+yadosSTPrCJmdhWuGlF
   BIevsLivVpgODXSprC1KyiIXNwQKFxsKWQpDGQgDMT+y2rf0OD2X+386U
   ZxugS48sxCBW2rupirmuZSeNUei665m8QFybKyy6Q8qlVAfuxjIRKHrPL
   s7Z1JomazkI8e/7YPEoy4fwSZtPElN28H4RgJ763VAZZp8QPDBHHO1LAa
   2oZ3ZAcgMXAzk7sS9ClM2f46y8bDZ+g8sTLU+v+4Z5p84La7Clr1KxHGi
   uDwAtuELtwDT5K/D9mIJMf4u4QGhGu8PmLlm1SEsSdqNBLxCI8zSsiNx7
   Q==;
X-CSE-ConnectionGUID: JtttoqNbSMy0ckEhjg+jKg==
X-CSE-MsgGUID: on71eRzIQNmyjs1IlAtBJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61461810"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61461810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 17:31:54 -0700
X-CSE-ConnectionGUID: 9h/MQO37R5W9JlftX8/ReQ==
X-CSE-MsgGUID: wPol45gnQbWLbG9ApDYacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146554279"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2025 17:31:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIcnh-000Qpc-1q;
	Sat, 24 May 2025 00:31:45 +0000
Date: Sat, 24 May 2025 08:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <monstr@monstr.eu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 5/5] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202505240808.VaN58jYa-lkp@intel.com>
References: <20250523134207.68481-6-yassine.ouaissa@allegrodvt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523134207.68481-6-yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_173156_598922_918C9E4C 
X-CRM114-Status: GOOD (  15.11  )
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

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master linus/master v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250523-214946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250523134207.68481-6-yassine.ouaissa%40allegrodvt.com
patch subject: [PATCH 5/5] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: i386-randconfig-014-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240808.VaN58jYa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240808.VaN58jYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240808.VaN58jYa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/allegro-dvt/al300/al_codec_common.c:251:9: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     250 |                 al_codec_err(dev, "mem check failed for 0x%16llx of size %zu",
         |                                                           ~~~~~~
         |                                                           %16x
     251 |                              *paddr, size);
         |                              ^~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.h:82:25: note: expanded from macro 'al_codec_err'
      81 |         dev_err(&(al_dev)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n",  \
         |                                                                      ~~~
      82 |                 __func__, __LINE__, ##args)
         |                                       ^~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_common.c:249:22: warning: result of comparison of constant 549755813887 with expression of type 'unsigned int' is always false [-Wtautological-constant-out-of-range-compare]
     249 |         if ((*paddr + size) > AL_CODEC_MAX_ADDR) {
         |             ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_common.c:508:50: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     508 |         al_codec_dbg(dev, "periph address = 0x%016llx", dev->apb);
         |                                               ~~~~~~~   ^~~~~~~~
         |                                               %016x
   drivers/media/platform/allegro-dvt/al300/al_codec_util.h:120:60: note: expanded from macro 'al_codec_dbg'
     120 |         dev_dbg(&(al_dev)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
         |                                                       ~~~         ^~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/media/platform/allegro-dvt/al300/al_codec_common.c:712:8: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     711 |         al_codec_dbg(dev, "Send req to mcu %d : %ld ", req->req_type,
         |                                                 ~~~
         |                                                 %zu
     712 |                      req->req_size);
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.h:120:60: note: expanded from macro 'al_codec_dbg'
     120 |         dev_dbg(&(al_dev)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
         |                                                       ~~~         ^~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   4 warnings generated.


vim +712 drivers/media/platform/allegro-dvt/al300/al_codec_common.c

   680	
   681	int al_common_send_req_reply(struct al_codec_dev *dev,
   682				     struct list_head *cmd_list,
   683				     struct msg_itf_header *hdr,
   684				     struct al_common_mcu_req *req)
   685	{
   686		struct al_codec_cmd *cmd = NULL;
   687		int ret;
   688	
   689		hdr->drv_cmd_hdl = 0;
   690	
   691		if (req->reply_size && req->reply) {
   692			cmd = al_codec_cmd_create(req->reply_size);
   693			if (!cmd)
   694				return -ENOMEM;
   695	
   696			hdr->drv_cmd_hdl = al_virt_to_phys(cmd);
   697		}
   698	
   699		hdr->drv_ctx_hdl = req->pCtx;
   700		hdr->type = req->req_type;
   701		hdr->payload_len = req->req_size;
   702	
   703		/* Add the list to the cmd list */
   704		if (cmd)
   705			list_add(&cmd->list, cmd_list);
   706	
   707		ret = al_common_send(dev, hdr);
   708		if (ret)
   709			goto remove_cmd;
   710	
   711		al_codec_dbg(dev, "Send req to mcu %d : %ld ", req->req_type,
 > 712			     req->req_size);
   713	
   714		if (!cmd)
   715			return 0;
   716	
   717		ret = wait_for_completion_timeout(&cmd->done, 5 * HZ);
   718		if (ret <= 0) {
   719			al_codec_err(dev, "cmd %p has %d (%s)", cmd, ret,
   720				     (ret == 0) ? "failed" : "timedout");
   721			ret = -ETIMEDOUT;
   722			goto remove_cmd;
   723		}
   724	
   725		ret = 0;
   726		memcpy(req->reply, cmd->reply, req->reply_size);
   727	
   728	remove_cmd:
   729	
   730		if (cmd) {
   731			list_del(&cmd->list);
   732			al_codec_cmd_put(cmd);
   733		}
   734		return ret;
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEA0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 21:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmFKYtKIhPGGss7r36g8BEc9NbTZVHjLZFfxHw98v3Y=; b=3rpkClj1Lmpt1Gah4Xg9DdF7f4
	5ezjWx7+rJbbU4cEFLrMOgGy1cFHL6feHQKg6XwXBDDyeiTPVByyfikYWYiOSxqJuh+X05pbPWcx7
	tfgSnUwcKmEfK5LPYlkAQJlrb9o7gTOm2trtzKCbTvdeK6tdet0rRfwuQtxQmHSXL6wbIXpxX1XJM
	TU3duUsfZjcR6Nm/fZ8m+FXnLYiTQ05c7X44K+lMc4gfaDoezQPh1lr/m57WJo/jtkeqqmOZqlFIG
	QmcxKzDhveCSHla0iDD33Ufgcr5q2Sw+vatlmFjgaUvN/OwaAuUOvTKVO2iawWcoZ3b5qse+sP70o
	jwgtXv2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tor6J-0000000GiY9-2Sh5;
	Sun, 02 Mar 2025 21:43:55 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tor4j-0000000GiTv-2wPF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 21:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740951737; x=1772487737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/owQeef8/mE5carj3xBdBe6w8LTQcNKNkp7SRvPV2Q=;
  b=LQnuhb4Y3Dm/75snRedzvhkw5k8Dra2pRXy0058WBGRcMIWylreXG95Y
   9KqDBfxfAwcA0r1HwI23jXi9r7DlLN0OuE9MZugSK8sKcJsiqzNVDWb3M
   Zf+e+0WIQfT/+CtZr4Z39HTp62HHAALv6YAaTuBi/jRSGqft4za6a2lgY
   O/yeMKg48a0I8oWJrpILtCZwiz05Cqr62eROlvc9Zo+eI4j0pJEvRSzAn
   jRS6btLV2VltxsWYfKBU4jDNFLv1+iHsQ8RcSI2ug9MrBUUOv/cZIe5dT
   Ps46yCO1nB4G0IoCv/9W+NptuTDSgQ9nfo+i5BsT/1D3vVhEGvnYDbXZK
   Q==;
X-CSE-ConnectionGUID: tAvbDBkKQuK4U59/4HGEOg==
X-CSE-MsgGUID: fJ93Z9zzRa2Al3Cre6lSwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44635256"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="44635256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 13:42:08 -0800
X-CSE-ConnectionGUID: 0gt7opgCTXa/4+gP2U28LQ==
X-CSE-MsgGUID: qmuQWeQaR0mgSJtWt/kOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="118321297"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2025 13:42:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tor4R-000Hes-1e;
	Sun, 02 Mar 2025 21:42:00 +0000
Date: Mon, 3 Mar 2025 05:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: Re: [PATCH] media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL
 interrupt
Message-ID: <202503030529.ccd21udL-lkp@intel.com>
References: <20250228065952.14375-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228065952.14375-1-aakarsh.jain@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_134217_748351_104C4E86 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Aakarsh,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linuxtv-media-pending/master linus/master sailus-media-tree/streams sailus-media-tree/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aakarsh-Jain/media-s5p-mfc-Support-for-handling-RET_ENC_BUFFER_FULL-interrupt/20250228-175738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250228065952.14375-1-aakarsh.jain%40samsung.com
patch subject: [PATCH] media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL interrupt
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250303/202503030529.ccd21udL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030529.ccd21udL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030529.ccd21udL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c: In function 's5p_mfc_irq':
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:742:14: error: 'S5P_MFC_R2H_CMD_ENC_BUFFER_FULL_RET' undeclared (first use in this function); did you mean 'S5P_MFC_R2H_CMD_ENC_BUFFER_FUL_RET'?
     742 |         case S5P_MFC_R2H_CMD_ENC_BUFFER_FULL_RET:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              S5P_MFC_R2H_CMD_ENC_BUFFER_FUL_RET
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:742:14: note: each undeclared identifier is reported only once for each function it appears in


vim +742 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c

   645	
   646	/* Interrupt processing */
   647	static irqreturn_t s5p_mfc_irq(int irq, void *priv)
   648	{
   649		struct s5p_mfc_dev *dev = priv;
   650		struct s5p_mfc_ctx *ctx;
   651		unsigned int reason;
   652		unsigned int err;
   653	
   654		mfc_debug_enter();
   655		/* Reset the timeout watchdog */
   656		atomic_set(&dev->watchdog_cnt, 0);
   657		spin_lock(&dev->irqlock);
   658		ctx = dev->ctx[dev->curr_ctx];
   659		/* Get the reason of interrupt and the error code */
   660		reason = s5p_mfc_hw_call(dev->mfc_ops, get_int_reason, dev);
   661		err = s5p_mfc_hw_call(dev->mfc_ops, get_int_err, dev);
   662		mfc_debug(1, "Int reason: %d (err: %08x)\n", reason, err);
   663		switch (reason) {
   664		case S5P_MFC_R2H_CMD_ERR_RET:
   665			/* An error has occurred */
   666			if (ctx->state == MFCINST_RUNNING &&
   667				(s5p_mfc_hw_call(dev->mfc_ops, err_dec, err) >=
   668					dev->warn_start ||
   669					err == S5P_FIMV_ERR_NO_VALID_SEQ_HDR ||
   670					err == S5P_FIMV_ERR_INCOMPLETE_FRAME ||
   671					err == S5P_FIMV_ERR_TIMEOUT))
   672				s5p_mfc_handle_frame(ctx, reason, err);
   673			else
   674				s5p_mfc_handle_error(dev, ctx, reason, err);
   675			clear_bit(0, &dev->enter_suspend);
   676			break;
   677	
   678		case S5P_MFC_R2H_CMD_SLICE_DONE_RET:
   679		case S5P_MFC_R2H_CMD_FIELD_DONE_RET:
   680		case S5P_MFC_R2H_CMD_FRAME_DONE_RET:
   681			if (ctx->c_ops->post_frame_start) {
   682				if (ctx->c_ops->post_frame_start(ctx))
   683					mfc_err("post_frame_start() failed\n");
   684	
   685				if (ctx->state == MFCINST_FINISHING &&
   686							list_empty(&ctx->ref_queue)) {
   687					s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   688					s5p_mfc_handle_stream_complete(ctx);
   689					break;
   690				}
   691				s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   692				WARN_ON(test_and_clear_bit(0, &dev->hw_lock) == 0);
   693				s5p_mfc_clock_off(dev);
   694				wake_up_ctx(ctx, reason, err);
   695				s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
   696			} else {
   697				s5p_mfc_handle_frame(ctx, reason, err);
   698			}
   699			break;
   700	
   701		case S5P_MFC_R2H_CMD_SEQ_DONE_RET:
   702			s5p_mfc_handle_seq_done(ctx, reason, err);
   703			break;
   704	
   705		case S5P_MFC_R2H_CMD_OPEN_INSTANCE_RET:
   706			ctx->inst_no = s5p_mfc_hw_call(dev->mfc_ops, get_inst_no, dev);
   707			ctx->state = MFCINST_GOT_INST;
   708			goto irq_cleanup_hw;
   709	
   710		case S5P_MFC_R2H_CMD_CLOSE_INSTANCE_RET:
   711			ctx->inst_no = MFC_NO_INSTANCE_SET;
   712			ctx->state = MFCINST_FREE;
   713			goto irq_cleanup_hw;
   714	
   715		case S5P_MFC_R2H_CMD_SYS_INIT_RET:
   716		case S5P_MFC_R2H_CMD_FW_STATUS_RET:
   717		case S5P_MFC_R2H_CMD_SLEEP_RET:
   718		case S5P_MFC_R2H_CMD_WAKEUP_RET:
   719			if (ctx)
   720				clear_work_bit(ctx);
   721			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   722			clear_bit(0, &dev->hw_lock);
   723			clear_bit(0, &dev->enter_suspend);
   724			wake_up_dev(dev, reason, err);
   725			break;
   726	
   727		case S5P_MFC_R2H_CMD_INIT_BUFFERS_RET:
   728			s5p_mfc_handle_init_buffers(ctx, reason, err);
   729			break;
   730	
   731		case S5P_MFC_R2H_CMD_COMPLETE_SEQ_RET:
   732			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   733			ctx->int_type = reason;
   734			ctx->int_err = err;
   735			s5p_mfc_handle_stream_complete(ctx);
   736			break;
   737	
   738		case S5P_MFC_R2H_CMD_DPB_FLUSH_RET:
   739			ctx->state = MFCINST_RUNNING;
   740			goto irq_cleanup_hw;
   741	
 > 742		case S5P_MFC_R2H_CMD_ENC_BUFFER_FULL_RET:
   743			ctx->state = MFCINST_NAL_ABORT;
   744			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   745			set_work_bit(ctx);
   746			WARN_ON(test_and_clear_bit(0, &dev->hw_lock) == 0);
   747			s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
   748			break;
   749	
   750		case S5P_MFC_R2H_CMD_NAL_ABORT_RET:
   751			ctx->state = MFCINST_ERROR;
   752			s5p_mfc_cleanup_queue(&ctx->dst_queue, &ctx->vq_dst);
   753			s5p_mfc_cleanup_queue(&ctx->src_queue, &ctx->vq_src);
   754			goto irq_cleanup_hw;
   755	
   756		default:
   757			mfc_debug(2, "Unknown int reason\n");
   758			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   759		}
   760		spin_unlock(&dev->irqlock);
   761		mfc_debug_leave();
   762		return IRQ_HANDLED;
   763	irq_cleanup_hw:
   764		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   765		ctx->int_type = reason;
   766		ctx->int_err = err;
   767		ctx->int_cond = 1;
   768		if (test_and_clear_bit(0, &dev->hw_lock) == 0)
   769			mfc_err("Failed to unlock hw\n");
   770	
   771		s5p_mfc_clock_off(dev);
   772		clear_work_bit(ctx);
   773		wake_up(&ctx->queue);
   774	
   775		s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
   776		spin_unlock(&dev->irqlock);
   777		mfc_debug(2, "Exit via irq_cleanup_hw\n");
   778		return IRQ_HANDLED;
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


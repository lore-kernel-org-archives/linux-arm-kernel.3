Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595D0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GABaOc71Xtnu7Elr/pwfMAyDgvJyuUsgRF+6nr0esik=; b=TQZkNuMfK3vNZtXmyFjsLTTuRb
	LF6crRtQjaxm/UsiZDO4HdFBDc1NkJ0gzRu9I+Twp94DZnvaUCCKRMTRXdPvxfJF/GX1PaywAC1hh
	/hSEQHrjLoGLn7hXyD9ZktHYqEO9DSWsCN8Es/vYL46jQtBzfXjC8yMbESrKEvyoY/plDMz1GXKGp
	OJJs9fMOvSt/jIOXGks26IW1CHCPIM82fDOPQvcAOf/xHbBTLKxMMosPlhMR8w+8n3I9hTTRK8AlP
	hf7yoZdeRrr5h/ZXLSM9HMZ/ki+kW+xbsQVSl7leqxteDUxLQShqJ10N7kZphxC5B22H2WW3rBoYQ
	WK45BQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx42-00000002wSX-49YU;
	Fri, 15 Aug 2025 16:13:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umv95-00000002gM9-3aCU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62AF15C4923;
	Fri, 15 Aug 2025 14:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCFDC4CEEB;
	Fri, 15 Aug 2025 14:10:58 +0000 (UTC)
Date: Fri, 15 Aug 2025 15:10:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	linux-trace-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org,
	oleg@redhat.com, peterz@infradead.org, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Steve Capper <steve.capper@arm.com>
Subject: Re: [PATCH v5 5/7] arm64: uprobes: Add GCS support to uretprobes
Message-ID: <aJ8_8HO37UjH1U0d@arm.com>
References: <20250811141010.741989-6-jeremy.linton@arm.com>
 <202508131334.FfoZQ27h-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508131334.FfoZQ27h-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_071103_936075_0D153E36 
X-CRM114-Status: GOOD (  16.92  )
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

On Wed, Aug 13, 2025 at 02:12:30PM +0800, kernel test robot wrote:
> Hi Jeremy,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.17-rc1 next-20250812]
> [cannot apply to acme/perf/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-probes-Break-ret-out-from-bl-blr/20250811-221529
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20250811141010.741989-6-jeremy.linton%40arm.com
> patch subject: [PATCH v5 5/7] arm64: uprobes: Add GCS support to uretprobes
> config: arm64-randconfig-r111-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131334.FfoZQ27h-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.4.0
> reproduce: (https://download.01.org/0day-ci/archive/20250813/202508131334.FfoZQ27h-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508131334.FfoZQ27h-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/arm64/kernel/probes/uprobes.c: In function 'arch_uretprobe_hijack_return_addr':
> >> arch/arm64/kernel/probes/uprobes.c:171:33: error: implicit declaration of function 'get_user_gcs'; did you mean 'put_user_gcs'? [-Werror=implicit-function-declaration]
>      171 |                 gcs_ret_vaddr = get_user_gcs((unsigned long __user *)gcspr, &err);
>          |                                 ^~~~~~~~~~~~
>          |                                 put_user_gcs
>    cc1: some warnings being treated as errors

I guess that's explained by patch 3 not being updated.

-- 
Catalin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D6AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/K5WXZ/+mfrvqe9hVtTmnvb197useqCpMM5h1OdD+Q=; b=eKozrpxoNlKUfSAWlXpma7JLzL
	6efMiF8tFlwG5Nk4XjbySVNsxTgEQQ2lEpcyQnTEl2H4zSq/kOAYrbjBtdUTE7nTVFz6xSs1/qmeX
	ptzgXnpe1ZIPMKMQ7FZXvNS9jDucABalrN4EjqLHbQSGHsEebrumol8siDbEQya2gL7Ts/d9bvIFr
	iMlAMmvy4cc0L7d0UtYKbiowwq++mXm4l2myBahdok8DdzpzsB6XVAdjpjc9eYqedDNhlNMWK3nK2
	Xo9OTf0Y9Jzn81Xkf25DI0AsxjRHTjqh1yJKum9VSdUMeIu22WtgdVXT1h0qtkPsB9RbMDei5Wvzh
	qSPVhM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvgY-0000000Cjs6-3ULs;
	Thu, 09 Jan 2025 16:47:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvfM-0000000CjfD-1LqH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jan 2025 16:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9/K5WXZ/+mfrvqe9hVtTmnvb197useqCpMM5h1OdD+Q=; b=qP/A9evfsazk18bsd3ziChLNAN
	ojRhpnj2W8yG7WLVWfW8fW9616mEw2C92yY64tV0wg5ejOuRAEAan32mbp2tpfApucCK94EMUO95Y
	MdEMQzqOx68L4gP955cEjrqkMBT96HWZPXtmxWtU4cGp5wfgzNQ1pmGttObS+0Wcu45qgzce+195H
	8YosPuYuS+1E/7b8glHL1dyez2yVeo8cjdmaN+vJNIU6LAXX/wNhOgg1ZsWJy3V1vFmtaXOZA8kuy
	XAS36VDyJ5GLEml7xZif0hOtMCW0H+0MRy+IfDld4Pcs/WlCLoSscGt0WWlMmuJuoujjzV/rxhbw/
	2HxROCvQ==;
Received: from mgamail.intel.com ([192.198.163.8])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvfH-00000009bmQ-3q25
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736441148; x=1767977148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dthvaoFmVx6ekANWfNCrbEN7/AW4ltSxGAfXIHK7Mao=;
  b=n3f9nnBwwNwNxW3aR2GGGtWR1Wfxl8NxBNS5es4sIe44xM7wlkx6p2aP
   /IJEMdJUAmjvywfrKyUBjwgSRIYuXJINPp5OElQcypoZx2C7NiOxj1jJ3
   HoPba8OtvqBgEtyEUEb4FQxuEpvFzkcOASymuZhRMcTvy6kLZO/mYpjQX
   hNr8DReB8LhZ34dlmm7Kmygrli5oQkT6Ii2o2WCb6EBM+Nt1Tfp2Tzjl2
   xV29XaFXiIVdBXDe4+TQH4Y9gbRS7BtL63Ee9ErzpKGcxKCLgg5DVgsI2
   WGG21S3iKxFuaKVfC3T/UB/XKsmDY4J8/K4+QIcik1u99dFQ73o1Oa8zi
   g==;
X-CSE-ConnectionGUID: VH7FeafPT+6Z7I4SS0kLwg==
X-CSE-MsgGUID: 6Z+bRS+KQ9O17uxo3pt92Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54259043"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="54259043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:45:41 -0800
X-CSE-ConnectionGUID: vM2BVWakT9eb+szAJCcFHg==
X-CSE-MsgGUID: fnYt+aC4RcSjiy9r1+zr/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103983305"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2025 08:45:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVvf3-000Hsl-1X;
	Thu, 09 Jan 2025 16:45:33 +0000
Date: Fri, 10 Jan 2025 00:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>, rostedt@goodmis.org,
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: oe-kbuild-all@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v2 02/12] ring-buffer: Introducing ring-buffer remote
Message-ID: <202501100025.WNnMyW13-lkp@intel.com>
References: <20250108114536.627715-3-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108114536.627715-3-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_164548_653930_632FE2CE 
X-CRM114-Status: GOOD (  10.54  )
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

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Check-for-empty-ring-buffer-with-rb_num_of_entries/20250108-200217
base:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
patch link:    https://lore.kernel.org/r/20250108114536.627715-3-vdonnefort%40google.com
patch subject: [PATCH v2 02/12] ring-buffer: Introducing ring-buffer remote
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250110/202501100025.WNnMyW13-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100025.WNnMyW13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100025.WNnMyW13-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:2535: warning: Function parameter or struct member 'remote' not described in '__ring_buffer_alloc_remote'
>> kernel/trace/ring_buffer.c:2535: warning: Function parameter or struct member 'key' not described in '__ring_buffer_alloc_remote'


vim +2535 kernel/trace/ring_buffer.c

  2528	
  2529	/**
  2530	 * __ring_buffer_alloc_remote
  2531	 *
  2532	 */
  2533	struct trace_buffer *__ring_buffer_alloc_remote(struct ring_buffer_remote *remote,
  2534							struct lock_class_key *key)
> 2535	{
  2536		return alloc_buffer(0, 0, 0, 0, 0, key, remote);
  2537	}
  2538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


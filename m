Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539D5D2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsGUjczFIrfEMnSuXAgJOXCgNHZXlKfvS0IIfU/vt0c=; b=HMF9nX7CDchmvoA7Hvi1UeKAvA
	b4pPwFNKx872AFfEdaAghQkhCz6WiQj9OQxDiecq4qMTYB6KozE2MV6Pi2FT4GtMz/3YgVR3bx9lL
	bvKx6n/36c1uMM1Ci0NpHlRm5thhq3LoSLiUCJRUWzzuD+q+e3amkq1Vd1lY4OuTHIrqRCiTgZSly
	Zxzqjpw0pnLpurrpJFIf2IQtZWFbgY/IopxARO58e+PrifygbFZFeucqFBGZVqyOx45K2phNrHX+/
	U1BXCLOeBY1FbYYntRAXtOCeemaPiUHPqEEkoxXUjZzClzRZwfCsPVduXcbRbqWUYpdQ+fIrXv7JQ
	C6yR+qfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoFQ-0000000Erln-0EaB;
	Tue, 27 Jan 2026 18:57:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoFL-0000000ErkN-1SZV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 18:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RsGUjczFIrfEMnSuXAgJOXCgNHZXlKfvS0IIfU/vt0c=; b=fhak59ZG4ndGukElt8pEYOvNxj
	gICn+heB9uHVFqpwpT8ol9nZ7QWJRvuuVqiH3vD6jY0GD7PUbbViFNIIVEg9uFKm63YeYjipIG5bi
	8WdDHF2ee2Dlo6/WfOaGgRp0k59okV/uB+YTG95PFxQXXXaVj8k3oQU86Pf4QOfiTSPS+NCoHeJNb
	901WoxVKxPx15ek60BxF7RJ3uPf3jNsCAiWMpy1jqtgDe/HXAPLYQ/qSDHv5vVBezLkClGWL3QB0J
	pJ4lZs/n+JviToV1ZjaWPAuADFl3+nBohCIaDy2+acCKdXvwpC7qsLTlC82/hFjlcDresCnFkDSgG
	AvVnscww==;
Received: from mgamail.intel.com ([192.198.163.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoFH-00000007Rqd-1ODM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769540219; x=1801076219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ch0LIB4X3I+61DsXgHOBKVGaZxOxxpivi8bEXcVQRqI=;
  b=Lws9/+FhgSjMshRl+//igsDnBwAKOcewdyTOweF+6raPigyvb4KGXUXa
   0XwrEo4ax/IjKl5P2RXsYP0Qao0pN6ERP48ZlNqi55I7ECKZhhkvF0bWM
   KOHojldkQOVskYiXDhqXayWLUmXzASgCEyv79bfOqSLa6fPMZYzj5mW9d
   E3SYEHm7F3e99FMQd3KdtLR7FJrtFR+IypjI1d/GuEEyLpogINqbWXk6H
   uxvnxCIC6gg5w6S8e/vesDb76c5Km+j35ARef71RYskMOp9r/zUGyroim
   eCGyHol4kzsCmmVrYf0gwaSCoUMFueyIDMMIf1RXRgqsmLYUZ3D8GM8m5
   w==;
X-CSE-ConnectionGUID: TKfPzgEnQiSxWGiHal5c3g==
X-CSE-MsgGUID: zU/9M11+TMW/zrHRO4xSEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81377736"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81377736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:56:56 -0800
X-CSE-ConnectionGUID: 943+XywOTBeCmu+rfv8XIg==
X-CSE-MsgGUID: 27YhhHwpQZ6G6ZLX+E50Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208409714"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jan 2026 10:56:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkoF6-00000000YrA-2dUf;
	Tue, 27 Jan 2026 18:56:48 +0000
Date: Wed, 28 Jan 2026 02:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@arm.com, rafael@kernel.org, robin.murphy@arm.com,
	mark.rutland@arm.com, tony.luck@intel.com, bp@alien8.de,
	tglx@linutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lenb@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org, mchehab@kernel.org,
	xueshuai@linux.alibaba.com, zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: Re: [PATCH v6 15/16] ras: AEST: support vendor node CMN700
Message-ID: <202601280228.CbJgYMRG-lkp@intel.com>
References: <20260122094656.73399-16-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122094656.73399-16-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_185659_769387_AF2BE4EB 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Ruidong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.19-rc7 next-20260126]
[cannot apply to tip/smp/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/ACPI-AEST-Parse-the-AEST-table/20260122-180219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260122094656.73399-16-tianruidong%40linux.alibaba.com
patch subject: [PATCH v6 15/16] ras: AEST: support vendor node CMN700
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601280228.CbJgYMRG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280228.CbJgYMRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280228.CbJgYMRG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ras/aest/aest-cmn.c:209:19: warning: variable 'hnd_base' set but not used [-Wunused-but-set-variable]
     209 |         u64 errgsr_addr, hnd_base;
         |                          ^
   1 warning generated.


vim +/hnd_base +209 drivers/ras/aest/aest-cmn.c

   203	
   204	static int aest_cmn_reorgnize_node(struct aest_device *adev,
   205					   struct acpi_aest_node *anode, u64 base)
   206	{
   207		struct aest_node *cmn_node;
   208		u64 hnd_offset, cmn_node_offset, reg, logic_id, type, node_id;
 > 209		u64 errgsr_addr, hnd_base;
   210		struct aest_record *record;
   211		int ret, node_index;
   212		struct cmn_vendor_data *vendor_data;
   213	
   214		if (anode->interface_hdr->type !=
   215		    ACPI_AEST_NODE_SINGLE_RECORD_MEMORY_MAPPED) {
   216			aest_dev_err(adev, "CMN just use single memory mapping\n");
   217			return -ENODEV;
   218		}
   219	
   220		hnd_offset = *((u64 *)anode->vendor->vendor_specific_data);
   221		cmn_node_offset = *((u64 *)&anode->vendor->vendor_specific_data[8]);
   222	
   223		reg = readq_relaxed((void *)base + cmn_node_offset + CMN_NODE_INFO);
   224	
   225		logic_id = FIELD_GET(CMN_NI_LOGICAL_ID, reg);
   226		type = FIELD_GET(CMN_NI_NODE_TYPE, reg);
   227		node_id = FIELD_GET(CMN_NI_NODE_ID, reg);
   228	
   229		hnd_base = base + hnd_offset;
   230		node_index = cmn_config->node_id_map[type];
   231		errgsr_addr = base + cmn_config->errgsr_offset(hnd_offset, node_index);
   232	
   233		// node not register, create it
   234		cmn_node = &adev->nodes[node_index];
   235		if (!cmn_node->errgsr) {
   236			ret = aest_cmn_init_node(adev, cmn_node, anode, type,
   237						 errgsr_addr);
   238			if (ret)
   239				return -ENOMEM;
   240		}
   241	
   242		aest_dev_dbg(adev, "node type %llx, id %llx, offset %llx\n", type,
   243			     logic_id, cmn_node_offset);
   244	
   245		if (!test_bit(0, anode->record_implemented))
   246			clear_bit(logic_id, cmn_node->record_implemented);
   247	
   248		if (!test_bit(0, anode->status_reporting))
   249			clear_bit(logic_id, cmn_node->status_reporting);
   250	
   251		record = &cmn_node->records[logic_id];
   252		record->name =
   253			devm_kasprintf(adev->dev, GFP_KERNEL, "record%lld", logic_id);
   254		if (!record->name)
   255			return -ENOMEM;
   256		record->regs_base = devm_ioremap(
   257			adev->dev, (resource_size_t)anode->interface_hdr->address,
   258			sizeof(struct ras_ext_regs));
   259		if (!record->regs_base)
   260			return -ENOMEM;
   261		record->addressing_mode = test_bit(0, anode->addressing_mode);
   262		record->node = cmn_node;
   263		record->index = logic_id;
   264		record->access = &aest_access[anode->interface_hdr->type];
   265	
   266		vendor_data = devm_kzalloc(adev->dev, sizeof(struct cmn_vendor_data),
   267					   GFP_KERNEL);
   268		vendor_data->node_type = type;
   269		vendor_data->node_id = node_id;
   270		vendor_data->logic_id = logic_id;
   271	
   272		record->vendor_data = vendor_data;
   273		record->vendor_data_size = sizeof(struct cmn_vendor_data);
   274	
   275		aest_record_dbg(record, "base %llx\n", anode->interface_hdr->address);
   276	
   277		return 0;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


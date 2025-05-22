Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3604CC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 06:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QwRI3MV18hctS5DE0xr19AziYCnY0iP43zo2tQBcXiI=; b=qM+PWcg0YBsDOncciisVjokb2g
	eXt9r+Y5Pms5S25R1quoTgpcwv0UoaYjD1tc7TCXJVjhTZzaNvY3RBJeggKLkU/fRYJVUPB4EM+iB
	gKUdAWJ06780OIUZdWuHeFnu2pyzWfMcUIVEWeopNmt2SJyIS9eDfa2Gqo7eTyx74a0BJ7aaGyonx
	xFrixnCTEhZLQabZ/zvrpxjok4XPr+XE+fWNckTfZI5aTOpLor8QO4EK4Q23wb9Sj63mJCCoEfRlZ
	MqSNIRCywdycUqpg6AiaJq+0qrUgVAMJ3AkPyavPQpaQOE8gfugSpYaXlQGSlVhfv3ojTBe4ztdOV
	+tVBn0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzkC-000000002Xh-1a41;
	Thu, 22 May 2025 06:49:32 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHzf6-0000000021M-0SrN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 06:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747896256; x=1779432256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Davt7Hyek2LzSD7/JdDXR8h0dqVL4Z3QWGPYALsTdc8=;
  b=Tnj0T+e5C1dSZEFfGiMcCIGKd/GQVqK3p1+cYFhSmFebfFET/yHDi7h8
   2JKYJDkxOzOLTcs4j//D7AW7bIcdpDVRYphe2I5twJV0njkM/QqcgcX4L
   vazkBFjlUxcb8WvswrWhXDm8TUQa4GJjzEQcbv92o+xpmFYvddQCb9EqD
   34Za1C0s1qk6iHrEqiLIc4jjYfSjRqeibtpKN/kDnJ+06v0/eiaAM6E/a
   BZzU+u6UpqNZEXDrHkmLcSXqwLOs4ILG155JmFy9dvbIYjsK6ecAYNwcK
   h27uBEBu3bVIPJhq/1HRFHGPX28EvwciYhjL3gUkWVxzod50fqVHL4SDP
   Q==;
X-CSE-ConnectionGUID: 4LuyLCu4SMuYTHY0naCfCw==
X-CSE-MsgGUID: TwPlMrKXR5G+66cfPrYD5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49780497"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49780497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 23:44:13 -0700
X-CSE-ConnectionGUID: TSWLVWevR2mD48USna+n0g==
X-CSE-MsgGUID: s4xGg8cOThOvRPaLYg2t8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="177605983"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2025 23:44:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHzey-000P0O-2e;
	Thu, 22 May 2025 06:44:08 +0000
Date: Thu, 22 May 2025 14:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jing Zhang <jingzhangos@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/misc-6.16 7/7]
 arch/arm64/kvm/vgic/vgic-debug.c:365: warning: expecting prototype for
 vigc_its_iter_next(). Prototype was for vgic_its_iter_next() instead
Message-ID: <202505221421.KAuWlmSr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_234416_187627_0BB85243 
X-CRM114-Status: GOOD (  13.37  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/misc-6.16
head:   30deb51a677b96f0faf20373995fe0fb4a78b8b8
commit: 30deb51a677b96f0faf20373995fe0fb4a78b8b8 [7/7] KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables
config: arm64-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221421.KAuWlmSr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221421.KAuWlmSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221421.KAuWlmSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-debug.c:365: warning: expecting prototype for vigc_its_iter_next(). Prototype was for vgic_its_iter_next() instead


vim +365 arch/arm64/kvm/vgic/vgic-debug.c

   353	
   354	/**
   355	 * vigc_its_iter_next - Advances the iterator to the next entry in the ITS tables.
   356	 * @its: The VGIC ITS structure.
   357	 * @iter: The iterator to advance.
   358	 *
   359	 * This function moves the iterator to the next ITE within the current device,
   360	 * or to the first ITE of the next device if the current ITE is the last in
   361	 * the device. If the current device is the last device, the iterator is set
   362	 * to indicate the end of iteration.
   363	 */
   364	static void vgic_its_iter_next(struct vgic_its *its, struct vgic_its_iter *iter)
 > 365	{
   366		struct its_device *dev = iter->dev;
   367		struct its_ite *ite = iter->ite;
   368	
   369		if (!ite || list_is_last(&ite->ite_list, &dev->itt_head)) {
   370			if (list_is_last(&dev->dev_list, &its->device_list)) {
   371				dev = NULL;
   372				ite = NULL;
   373			} else {
   374				dev = list_next_entry(dev, dev_list);
   375				ite = list_first_entry_or_null(&dev->itt_head,
   376							       struct its_ite,
   377							       ite_list);
   378			}
   379		} else {
   380			ite = list_next_entry(ite, ite_list);
   381		}
   382	
   383		iter->dev = dev;
   384		iter->ite = ite;
   385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


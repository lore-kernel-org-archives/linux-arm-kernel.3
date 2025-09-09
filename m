Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA872CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5bF0oNvOpxAh3zpYOzz+wo91Rc/vOF5BzcnL1dMZ3s=; b=0oaTba3O6g5+/nPMileHmez233
	N5I+AZIqRPLs6bEdAzmfIrTpaalLfhnE+e7mLSWwkgg/1Bs7sIxZm50InTMNqjWYobJ3PFbs183bl
	6WhTSFGRAWMfxzYZB8DQBw+ISYkXDiKnUtQTAstScgkQschTVx4sM616IYZZCkHjTdiALE5qFwjXM
	PUxUngKyFrfGCHONKRwHcZT1R+h0LVnpRNH7me6WohGRj5ct8KLTIFPc76jKj+s8s5gO607kgZ57x
	LMB63tUfaJHnoj8k+lBJKYI/UXTdaX62cTC+tihFhV52lcjuyjgtOliYsIZaQjNQ3PKz5VlaaIWmP
	TbS6eNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yh-00000008sAf-3EsU;
	Tue, 09 Sep 2025 17:17:59 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxz7-00000007FRH-2T5F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757422929; x=1788958929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IMA0hrozi89cCMAFa8tayuZ0jLgUEdMU2u5d1AcjFdE=;
  b=KM4p3yVy9Sx5BydH5UTmwwvFFcsogPgjEpPo9Cn9FLtLvfgG3iDZycbq
   YG3Uh9pi2bjIFdlT3oCa1TUqgRmeC5yOWVpA8/CvqiPotWUEevO+cMRQY
   g89Nj3cKS/Bq/gSm/hPeHbawMz1zqZHu44M9akVDihCbact4WBgvMQ0tC
   Mu6lzR2w610ELD0WAH0uhHxLdxOPOEdaLmVZcw1YihZ3mqI7peYq9faQj
   NdnPm4+5z0lmnu2gBMB35j4Eq4MS4miB5mCiDxxvM6JCAZurPPI+rCQgU
   vuFrhXJsXW5q8/UR3M+OwSnsrLSCtVR392f0o+/fFvjIUG4DPByhcphaI
   g==;
X-CSE-ConnectionGUID: +f/xlSRxQE+nVUgDYqKI5g==
X-CSE-MsgGUID: y+XC5Gp+RJGRMbeMCj0AYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62332708"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="62332708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:02:06 -0700
X-CSE-ConnectionGUID: xEPoSo38S5S/y6YfQS7UgQ==
X-CSE-MsgGUID: DxGAStGNTjuqZlrDaEzHWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172250957"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2025 06:02:00 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvxyw-0004rz-1o;
	Tue, 09 Sep 2025 13:01:58 +0000
Date: Tue, 9 Sep 2025 21:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
	robin.murphy@arm.com
Cc: oe-kbuild-all@lists.linux.dev, joro@8bytes.org,
	jean-philippe@linaro.org, miko.lenczewski@arm.com,
	balbirs@nvidia.com, peterz@infradead.org, smostafa@google.com,
	kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH rfcv2 4/8] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <202509092020.mxUyqGcN-lkp@intel.com>
References: <80310b98efa4bd7e95d7b3ca302f40d4d69e59c5.1757373449.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80310b98efa4bd7e95d7b3ca302f40d4d69e59c5.1757373449.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_060209_663344_1CEB4C4F 
X-CRM114-Status: GOOD (  21.38  )
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

Hi Nicolin,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-arm-smmu-v3-Clear-cmds-num-after-arm_smmu_cmdq_batch_submit/20250909-073052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/80310b98efa4bd7e95d7b3ca302f40d4d69e59c5.1757373449.git.nicolinc%40nvidia.com
patch subject: [PATCH rfcv2 4/8] iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array
config: arm64-randconfig-003-20250909 (https://download.01.org/0day-ci/archive/20250909/202509092020.mxUyqGcN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092020.mxUyqGcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092020.mxUyqGcN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1082:23: error: static declaration of 'arm_smmu_invs_merge' follows non-static declaration
    1082 | struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
         |                       ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:34:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:721:23: note: previous declaration of 'arm_smmu_invs_merge' with type 'struct arm_smmu_invs *(struct arm_smmu_invs *, struct arm_smmu_invs *)'
     721 | struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
         |                       ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1165:8: error: static declaration of 'arm_smmu_invs_unref' follows non-static declaration
    1165 | size_t arm_smmu_invs_unref(struct arm_smmu_invs *invs,
         |        ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:34:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:723:8: note: previous declaration of 'arm_smmu_invs_unref' with type 'size_t(struct arm_smmu_invs *, struct arm_smmu_invs *)' {aka 'long unsigned int(struct arm_smmu_invs *, struct arm_smmu_invs *)'}
     723 | size_t arm_smmu_invs_unref(struct arm_smmu_invs *invs,
         |        ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1215:23: error: static declaration of 'arm_smmu_invs_purge' follows non-static declaration
    1215 | struct arm_smmu_invs *arm_smmu_invs_purge(struct arm_smmu_invs *invs,
         |                       ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:34:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:725:23: note: previous declaration of 'arm_smmu_invs_purge' with type 'struct arm_smmu_invs *(struct arm_smmu_invs *, size_t)' {aka 'struct arm_smmu_invs *(struct arm_smmu_invs *, long unsigned int)'}
     725 | struct arm_smmu_invs *arm_smmu_invs_purge(struct arm_smmu_invs *invs,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1215:23: warning: 'arm_smmu_invs_purge' defined but not used [-Wunused-function]
    1215 | struct arm_smmu_invs *arm_smmu_invs_purge(struct arm_smmu_invs *invs,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1165:8: warning: 'arm_smmu_invs_unref' defined but not used [-Wunused-function]
    1165 | size_t arm_smmu_invs_unref(struct arm_smmu_invs *invs,
         |        ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1082:23: warning: 'arm_smmu_invs_merge' defined but not used [-Wunused-function]
    1082 | struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
         |                       ^~~~~~~~~~~~~~~~~~~


vim +/arm_smmu_invs_merge +1082 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1063	
  1064	/**
  1065	 * arm_smmu_invs_merge() - Merge @to_merge into @invs and generate a new array
  1066	 * @invs: the base invalidation array
  1067	 * @to_merge: an array of invlidations to merge
  1068	 *
  1069	 * Return: a newly allocated array on success, or ERR_PTR
  1070	 *
  1071	 * This function must be locked and serialized with arm_smmu_invs_unref() and
  1072	 * arm_smmu_invs_purge(), but do not lockdep on any lock for KUNIT test.
  1073	 *
  1074	 * Either @invs or @to_merge must be sorted itself. This ensures the returned
  1075	 * array will be sorted as well.
  1076	 *
  1077	 * Caller is resposible for freeing the @invs and the returned new one.
  1078	 *
  1079	 * Entries marked as trash will be purged in the returned array.
  1080	 */
  1081	VISIBLE_IF_KUNIT
> 1082	struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
  1083						  struct arm_smmu_invs *to_merge)
  1084	{
  1085		struct arm_smmu_invs *new_invs;
  1086		struct arm_smmu_inv *new;
  1087		size_t num_adds = 0;
  1088		size_t num_dels = 0;
  1089		size_t i, j;
  1090	
  1091		for (i = j = 0; i != invs->num_invs || j != to_merge->num_invs;) {
  1092			int cmp = arm_smmu_invs_merge_cmp(invs, i, to_merge, j);
  1093	
  1094			if (cmp < 0) {
  1095				/* no found in to_merge, leave alone but delete trash */
  1096				if (!refcount_read(&invs->inv[i].users))
  1097					num_dels++;
  1098				i++;
  1099			} else if (cmp == 0) {
  1100				/* same item */
  1101				i++;
  1102				j++;
  1103			} else {
  1104				/* unique to to_merge */
  1105				num_adds++;
  1106				j++;
  1107			}
  1108		}
  1109	
  1110		new_invs = arm_smmu_invs_alloc(invs->num_invs - num_dels + num_adds);
  1111		if (IS_ERR(new_invs))
  1112			return new_invs;
  1113	
  1114		new = new_invs->inv;
  1115		for (i = j = 0; i != invs->num_invs || j != to_merge->num_invs;) {
  1116			int cmp = arm_smmu_invs_merge_cmp(invs, i, to_merge, j);
  1117	
  1118			if (cmp <= 0 && !refcount_read(&invs->inv[i].users)) {
  1119				i++;
  1120				continue;
  1121			}
  1122	
  1123			if (cmp < 0) {
  1124				*new = invs->inv[i];
  1125				i++;
  1126			} else if (cmp == 0) {
  1127				*new = invs->inv[i];
  1128				refcount_inc(&new->users);
  1129				i++;
  1130				j++;
  1131			} else {
  1132				*new = to_merge->inv[j];
  1133				refcount_set(&new->users, 1);
  1134				j++;
  1135			}
  1136			new++;
  1137		}
  1138	
  1139		WARN_ON(new != new_invs->inv + new_invs->num_invs);
  1140	
  1141		return new_invs;
  1142	}
  1143	EXPORT_SYMBOL_IF_KUNIT(arm_smmu_invs_merge);
  1144	
  1145	/**
  1146	 * arm_smmu_invs_unref() - Find in @invs for all entries in @to_unref, decrease
  1147	 *                         the user counts without deletions
  1148	 * @invs: the base invalidation array
  1149	 * @to_unref: an array of invlidations to decrease their user counts
  1150	 *
  1151	 * Return: the number of trash entries in the array, for arm_smmu_invs_purge()
  1152	 *
  1153	 * This function will not fail. Any entry with users=0 will be marked as trash.
  1154	 * All trash entries will remain in the @invs until being completely deleted by
  1155	 * the next arm_smmu_invs_merge() or an arm_smmu_invs_purge() function call.
  1156	 *
  1157	 * This function must be locked and serialized with arm_smmu_invs_merge() and
  1158	 * arm_smmu_invs_purge(), but do not lockdep on any lock for KUNIT test.
  1159	 *
  1160	 * Note that the @invs->num_invs will not be updated, even if the actual number
  1161	 * of invalidations are decreased. Readers should take the read lock to iterate
  1162	 * each entry and check its users counter until @inv->num_invs.
  1163	 */
  1164	VISIBLE_IF_KUNIT
> 1165	size_t arm_smmu_invs_unref(struct arm_smmu_invs *invs,
  1166				   struct arm_smmu_invs *to_unref)
  1167	{
  1168		size_t num_dels = 0;
  1169		size_t i, j;
  1170	
  1171		for (i = j = 0; i != invs->num_invs || j != to_unref->num_invs;) {
  1172			int cmp;
  1173	
  1174			if (!refcount_read(&invs->inv[i].users)) {
  1175				num_dels++;
  1176				i++;
  1177				continue;
  1178			}
  1179	
  1180			cmp = arm_smmu_invs_merge_cmp(invs, i, to_unref, j);
  1181			if (cmp < 0) {
  1182				/* not found in to_unref, leave alone */
  1183				i++;
  1184			} else if (cmp == 0) {
  1185				/* same item */
  1186				if (refcount_dec_and_test(&invs->inv[i].users))
  1187					num_dels++;
  1188				i++;
  1189				j++;
  1190			} else {
  1191				/* item in to_unref is not in invs or already a trash */
  1192				WARN_ON(true);
  1193				j++;
  1194			}
  1195		}
  1196		return num_dels;
  1197	}
  1198	EXPORT_SYMBOL_IF_KUNIT(arm_smmu_invs_unref);
  1199	
  1200	/**
  1201	 * arm_smmu_invs_purge() - Purge all the trash entries in the @invs
  1202	 * @invs: the base invalidation array
  1203	 * @num_dels: expected number of trash entries, typically the return value from
  1204	 *            a prior arm_smmu_invs_unref() call
  1205	 *
  1206	 * Return: a newly allocated array on success removing all the trash entries, or
  1207	 *         NULL on failure
  1208	 *
  1209	 * This function must be locked and serialized with arm_smmu_invs_merge() and
  1210	 * arm_smmu_invs_unref(), but do not lockdep on any lock for KUNIT test.
  1211	 *
  1212	 * Caller is resposible for freeing the @invs and the returned new one.
  1213	 */
  1214	VISIBLE_IF_KUNIT
> 1215	struct arm_smmu_invs *arm_smmu_invs_purge(struct arm_smmu_invs *invs,
  1216						  size_t num_dels)
  1217	{
  1218		struct arm_smmu_invs *new_invs;
  1219		size_t i, j;
  1220	
  1221		if (WARN_ON(invs->num_invs < num_dels))
  1222			return NULL;
  1223	
  1224		new_invs = arm_smmu_invs_alloc(invs->num_invs - num_dels);
  1225		if (IS_ERR(new_invs))
  1226			return NULL;
  1227	
  1228		for (i = j = 0; i != invs->num_invs; i++) {
  1229			if (!refcount_read(&invs->inv[i].users))
  1230				continue;
  1231			new_invs->inv[j] = invs->inv[i];
  1232			j++;
  1233		}
  1234	
  1235		WARN_ON(j != new_invs->num_invs);
  1236		return new_invs;
  1237	}
  1238	EXPORT_SYMBOL_IF_KUNIT(arm_smmu_invs_purge);
  1239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


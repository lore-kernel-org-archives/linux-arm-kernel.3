Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED69C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpuM2ARp02JlzruHfSuxHGNmc4Kvmn64IFO3arSh4C4=; b=Jpl9uBkOpkglO1+cz242ECQPtH
	5QsAb1WHexrdzE6BOtKElF6SCb7+58Xok/9lRpJyGGeHXXFIhcmFyNeaiGTnGm/rkCjh2anI2dpeU
	8qNHrNFVPWOSTfLIodE5jCmChPddO9tJe5Fbi+3p1lejZMm7y/6r7zmJrS067cWHJDz0Z03Kffc+G
	ZtdhB+AUVINfqAZtnYsmQNpiMTwyKTyFuu2ZesMqRuGAsNF4jE/MbVNj29/qKMVGsdtmQjbyUpl//
	K3pYH++1gPhq2wLUEH7wPpyiYFJAk+sXsZRpejN0Lla8H/3KI8oRlsPXGxx2+PKaTdCg8i/976adO
	gX9ux7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4Pg-0000000DxE7-3DhL;
	Fri, 27 Jun 2025 08:26:24 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4K3-0000000DwLZ-2WVx;
	Fri, 27 Jun 2025 08:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751012436; x=1782548436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yuC7k6cF0wA5MnmjFf3S9KT8LlqwWT+D/GT0d4USMJ8=;
  b=ZSMJ60XchBjvM10AUwH8GnFX8TAcFbGdi1L/PGtOvR59mMgCduSu2BGw
   X50/g4PoyDqQdeKuKDwMTkIK6M6MORhPLEQreZYsxR6L6hFSJYh0O3qSr
   UC0ViMU3eChetoRxSSr5dkPVcna56YvYZBu9Mbo6eY9AdRvcE0a23YG4C
   qtvZjAVK5r9TWq9SMa7X0IvdpUUED0gZje087zpG7aogwkUR9TKKlg4tD
   jbDYRY8CuqCmmZW+sspv3qvJwTx8cKNCKFBTpf6+h3hkOFXkQ7S/b5dIb
   AxkD1shoFsaZFL6DyCkPNCvUA+DJrX/nsf2Ub8Kd4gK4scHuxEjcgz/cA
   w==;
X-CSE-ConnectionGUID: vm25iBh6TSCTJ+b+V0EO9A==
X-CSE-MsgGUID: 55yzbNNXTjuWdYcZa+Ei9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57000646"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57000646"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:20:35 -0700
X-CSE-ConnectionGUID: kWpL54/ASvOu6jA+eC5J+A==
X-CSE-MsgGUID: Sllb12buTvCCfu7SMuNXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153455951"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 01:20:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV4Jx-000VyY-1M;
	Fri, 27 Jun 2025 08:20:29 +0000
Date: Fri, 27 Jun 2025 16:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	robh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	sudeep.holla@arm.com, cristian.marussi@arm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 2/2] firmware: arm_scmi: Add MediaTek TinySYS SCMI
 Protocol support
Message-ID: <202506271642.aFdjzjw7-lkp@intel.com>
References: <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_012035_681913_948DCDBD 
X-CRM114-Status: GOOD (  14.37  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-firmware-Add-MediaTek-TinySYS-SCMI-Extension-protocol/20250623-201014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250623120136.109311-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/2] firmware: arm_scmi: Add MediaTek TinySYS SCMI Protocol support
config: csky-randconfig-r111-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271642.aFdjzjw7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271642.aFdjzjw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271642.aFdjzjw7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:83:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] attributes @@     got unsigned int @@
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:83:34: sparse:     expected restricted __le32 [usertype] attributes
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:83:34: sparse:     got unsigned int
>> drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:84:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected int num_domains @@     got restricted __le32 [usertype] attributes @@
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:84:36: sparse:     expected int num_domains
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:84:36: sparse:     got restricted __le32 [usertype] attributes
>> drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:119:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] fid @@     got unsigned int [usertype] src_id @@
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:119:27: sparse:     expected restricted __le32 [usertype] fid
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:119:27: sparse:     got unsigned int [usertype] src_id
>> drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:145:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 const [usertype] fid @@
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:145:33: sparse:     expected unsigned int [usertype]
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:145:33: sparse:     got restricted __le32 const [usertype] fid
>> drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:176:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] ctrl_id @@
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:176:21: sparse:     expected restricted __le32
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:176:21: sparse:     got unsigned int [usertype] ctrl_id
>> drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:177:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int [usertype] cmd @@
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:177:21: sparse:     expected restricted __le32
   drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c:177:21: sparse:     got unsigned int [usertype] cmd

vim +83 drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c

    67	
    68	static int scmi_mtk_tinysys_attributes_get(const struct scmi_protocol_handle *ph,
    69						   struct scmi_mtk_tinysys_info *tinfo)
    70	{
    71		struct scmi_mtk_tinysys_protocol_attributes *attr;
    72		struct scmi_xfer *t;
    73		int ret;
    74	
    75		ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
    76		if (ret)
    77			return ret;
    78	
    79		attr = t->rx.buf;
    80	
    81		ret = ph->xops->do_xfer(ph, t);
    82		if (!ret) {
  > 83			attr->attributes = get_unaligned_le32(t->rx.buf);
  > 84			tinfo->num_domains = attr->attributes;
    85		}
    86	
    87		ph->xops->xfer_put(ph, t);
    88	
    89		return ret;
    90	}
    91	
    92	static int scmi_mtk_tinysys_get_num_sources(const struct scmi_protocol_handle *ph)
    93	{
    94		struct scmi_mtk_tinysys_info *tinfo = ph->get_priv(ph);
    95	
    96		if (!tinfo)
    97			return -EINVAL;
    98	
    99		return tinfo->num_domains;
   100	}
   101	
   102	static int scmi_mtk_tinysys_set_notify_enabled(const struct scmi_protocol_handle *ph,
   103						       u8 evt_id, u32 src_id, bool enable)
   104	{
   105		struct scmi_mtk_tinysys_pwrst_notify *pwrst_notify;
   106		struct scmi_xfer *t;
   107		int ret;
   108	
   109		/* There's only one possible event for now */
   110		if (evt_id != 0)
   111			return -EINVAL;
   112	
   113		ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_POWER_STATE_NOTIFY,
   114					      sizeof(*pwrst_notify), 0, &t);
   115		if (ret)
   116			return ret;
   117	
   118		pwrst_notify = t->tx.buf;
 > 119		pwrst_notify->fid = src_id;
   120		pwrst_notify->enable = cpu_to_le32(enable);
   121	
   122		ret = ph->xops->do_xfer(ph, t);
   123		ph->xops->xfer_put(ph, t);
   124		return ret;
   125	}
   126	
   127	static void *scmi_mtk_tinysys_fill_custom_report(const struct scmi_protocol_handle *ph,
   128							 u8 evt_id, ktime_t timestamp,
   129							 const void *payld, size_t payld_sz,
   130							 void *report, u32 *src_id)
   131	{
   132		const struct scmi_mtk_tinysys_notify_payld *p = payld;
   133		struct scmi_mtk_tinysys_notif_report *r = report;
   134		int i;
   135	
   136		if (sizeof(*p) != payld_sz)
   137			return NULL;
   138	
   139		if (evt_id == SCMI_EVENT_MTK_TINYSYS_NOTIFIER) {
   140			r->timestamp = timestamp;
   141			r->fid = le32_to_cpu(p->fid);
   142			for (i = 0; i < SCMI_MTK_MSG_NOTIF_ST_BYTES; i++)
   143				r->status[i] = le32_to_cpu(p->param[i]);
   144			if (src_id)
 > 145				*src_id = p->fid;
   146		} else {
   147			WARN_ON_ONCE(1);
   148			return NULL;
   149		}
   150	
   151		return r;
   152	}
   153	
   154	static const struct scmi_event scmi_mtk_tinysys_events[] = {
   155		{
   156			.id = SCMI_EVENT_MTK_TINYSYS_NOTIFIER,
   157			.max_payld_sz =	sizeof(struct scmi_mtk_tinysys_notify_payld),
   158			.max_report_sz = sizeof(struct scmi_mtk_tinysys_notif_report),
   159		},
   160	};
   161	
   162	static int scmi_mtk_tinysys_common_get(const struct scmi_protocol_handle *ph,
   163					       u32 ctrl_id, u32 cmd,
   164					       struct scmi_mtk_tinysys_status *retval)
   165	{
   166		struct scmi_mtk_tinysys_common_get_payld *p;
   167		struct scmi_xfer *t;
   168		int ret;
   169	
   170		ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_COMMON_GET,
   171					      sizeof(*p), sizeof(*retval), &t);
   172		if (ret)
   173			return ret;
   174	
   175		p = t->tx.buf;
 > 176		p->param[0] = ctrl_id;
 > 177		p->param[1] = cmd;
   178	
   179		ret = ph->xops->do_xfer(ph, t);
   180		if (!ret) {
   181			if (t->rx.len == sizeof(*retval))
   182				memcpy(retval, t->rx.buf, sizeof(*retval));
   183			else
   184				ret = -EINVAL;
   185		}
   186	
   187		ph->xops->xfer_put(ph, t);
   188		return ret;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


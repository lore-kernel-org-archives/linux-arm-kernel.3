Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BC9CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcwbHYiAIGZIzvSTp0iJ89Hg66PnZT/SibdHL8lPVQ0=; b=UM5CnX0enSvJ7H0zK0Y86+/n0R
	zAWi2QoSfBjpfmyLCukgfnDDQ5aNh7YDituGCL+oRvagbHtT3w8gLrAqnSL2VKZ/AretN+RAW51lP
	78cAgeL9NjNhBfDtJgwUKQwEOt4WdvhSQZVCdo9CJpydam9rjDezhebRlt427V5aaemzKMOZVOx0O
	qsgi26Q24wAJBfv7COJUa+TkJpaTPj4xPvzBegwaSIx7TgVG4jV2s03eIrdHS43jkakwbwjvLECIK
	FVuDYEVJ1aSPEGZ3bdiui2DJuYadVw/vCEEBfZh+oyPIQDBOmJDEf7ZjMxOxzxyeU5I34ycJ9Ex7v
	IMGNX6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBs68-00000005oEO-3EyB;
	Thu, 23 Oct 2025 09:59:09 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBs66-00000005oDz-1GqE;
	Thu, 23 Oct 2025 09:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761213546; x=1792749546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/1vXsibgr0QCdKMz0q52WspRgykJNsKRvxsy7+LuE3Q=;
  b=YHSiU6tS+Ik7KjEsX1hOy9GluHe7lhCe3vW50CSvY3IPGg8jPfuiBl62
   S7ZnTV1wBnqbZHRZtI6joU6j1q7CvTdbmOg9OmoefKw8aqGrjXY4V9qty
   5t2zhcM5txUvJ7n3gYmQQvDkCuxxxNdiT9fODFnaeL+7Nql4MaltF2Fre
   stsMbUwK92Yyx28yFlaX/nCNZwVjCBUZvrrwBwa+u9pRPUpEiaIK5yVpa
   5mwwf0cISu+tYWgK4pLj6vDqFRLh/C1oWU+k6OhcWqURh9Jbe+ktCfKIK
   faDtOUl3yMZxw3AWTceN3gdGXtTU5Nc83VR5Hm6LbpMpZjWUQzbP1Ap3f
   g==;
X-CSE-ConnectionGUID: UdOrSeDdSW6cU7v4ymwXlg==
X-CSE-MsgGUID: U65TqGeNTEaE+Zo/pjVXmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65994421"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="65994421"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:59:05 -0700
X-CSE-ConnectionGUID: pe5qV8bDShWuRejZV4mvYw==
X-CSE-MsgGUID: 9f8M9NSnQFetHxslRmvHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="221308724"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2025 02:59:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBs5s-000DKh-1R;
	Thu, 23 Oct 2025 09:58:55 +0000
Date: Thu, 23 Oct 2025 17:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
Message-ID: <202510231714.dlrsh9El-lkp@intel.com>
References: <aPi6eBlFLH43A4C0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPi6eBlFLH43A4C0@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_025906_353653_317B9F73 
X-CRM114-Status: GOOD (  12.17  )
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

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on next-20251023]
[cannot apply to linus/master v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/remoteproc-mtk_scp-remove-unnecessary-checking/20251022-200619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/aPi6eBlFLH43A4C0%40stanley.mountain
patch subject: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
config: arm-randconfig-003-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231714.dlrsh9El-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231714.dlrsh9El-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231714.dlrsh9El-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/mtk_scp.c: In function 'scp_rproc_init':
>> drivers/remoteproc/mtk_scp.c:1130:56: warning: '%1d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
                                                           ^~~
   drivers/remoteproc/mtk_scp.c:1130:50: note: directive argument in the range [0, 1073741824]
      snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
                                                     ^~~~~~~~~~
   drivers/remoteproc/mtk_scp.c:1130:3: note: 'snprintf' output between 7 and 16 bytes into a destination of size 7
      snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1130 drivers/remoteproc/mtk_scp.c

  1096	
  1097	/**
  1098	 * scp_get_default_fw_path() - Get default SCP firmware path
  1099	 * @dev:     SCP Device
  1100	 * @core_id: SCP Core number
  1101	 *
  1102	 * This function generates a path based on the following format:
  1103	 *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
  1104	 *     mediatek/(soc_model)/scp.img for single core SCP HW
  1105	 *
  1106	 * Return: A devm allocated string containing the full path to
  1107	 *         a SCP firmware or an error pointer
  1108	 */
  1109	static const char *scp_get_default_fw_path(struct device *dev, int core_id)
  1110	{
  1111		struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
  1112		const char *compatible, *soc;
  1113		char scp_fw_file[7];
  1114		int ret;
  1115	
  1116		/* Use only the first compatible string */
  1117		ret = of_property_read_string_index(np, "compatible", 0, &compatible);
  1118		if (ret)
  1119			return ERR_PTR(ret);
  1120	
  1121		/* If the compatible string's length is implausible bail out early */
  1122		if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))
  1123			return ERR_PTR(-EINVAL);
  1124	
  1125		/* If the compatible string starts with "mediatek,mt" assume that it's ok */
  1126		if (!str_has_prefix(compatible, "mediatek,mt"))
  1127			return ERR_PTR(-EINVAL);
  1128	
  1129		if (core_id >= 0)
> 1130			snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
  1131		else
  1132			snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
  1133	
  1134		/* Not using strchr here, as strlen of a const gets optimized by compiler */
  1135		soc = &compatible[strlen("mediatek,")];
  1136	
  1137		return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
  1138				      (int)strlen("mtXXXX"), soc, scp_fw_file);
  1139	}
  1140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


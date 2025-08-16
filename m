Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C12DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tG4qpQkSsCbr7ygDzgBin3Os/yMJotcOdzxE1PeyUE=; b=WiHgjUju8eEr1wMZP2GmvEzQR8
	XZjUBaAM+lH7KsgRdqrPORG75Fl8CPck5hPSfmEQ1Bbcl8KZei02ufkwV/vfX9Qk1ImYbWbDNdIUJ
	6FsRl+zXl41qiFucnwlfn2Aa1bKopA8U+9TjzXC8kJV5Rkn1OpLUy/wt7BmVBejq5Wtl7+f3zJZmv
	dvvmVHM7Ep42h6RilWFqvKBUD3TthAVsFkP7hMTMHaYrzfaBtvPkWYFUt0WcHymSVja40ET8wmrHw
	AxbSXT96Qg+W+IRZTS36CvTK/QHCMpIcWZBwi2w3R7XxaPCEAvtNRZt8rUf/DoI86NK+RiEfcnv52
	UI1/brgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un4ww-00000003o9w-2yqT;
	Sat, 16 Aug 2025 00:39:10 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un4uJ-00000003nyx-3OwP;
	Sat, 16 Aug 2025 00:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755304587; x=1786840587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=benNazeuPaouG/+e8wLXd4fxOv6Us5y+9Sh2v9/dsfc=;
  b=JNICjgIDXKhuNxfoEQtuPdkMTdJmkVigKNEjxIC5AYOSl+gDzbqexa+e
   pZXh732hScm9uKMkUecinh4vRaHSV28cbYQMi2omVruKjaRYCTxVqt/tO
   UkxIMb9k3yEmenh4qt7Aq6KCJ/HceBIQx66l9nDLLMcsdlMEJqn1PeDKO
   MyhiGGsMiu9nDMXf0tmnlzMG0xOek9N38Vz7vsGRusSrcmBSF+Gi06viB
   cOl77rnukQucl3xaoAX8SkwlH2DIBv68bnFeBIyCc8h4zWxKYsjQg9km2
   AG5LdGQhcArN49/iVkLXBcxagJgbd2IJPrkvcVMja1bAdOmAaOzBiwyML
   Q==;
X-CSE-ConnectionGUID: zgR6TpEsRTOTMphK0WoG+w==
X-CSE-MsgGUID: 7YpZHa7ITtyGUNfk2xdo3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61465025"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61465025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 17:36:25 -0700
X-CSE-ConnectionGUID: XsfJWJHDRiucVH5KSe51BA==
X-CSE-MsgGUID: NSRhkyfJQCqWWqVNaOYoEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166309080"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2025 17:36:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un4u8-000CSI-05;
	Sat, 16 Aug 2025 00:36:16 +0000
Date: Sat, 16 Aug 2025 08:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 08/13] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
Message-ID: <202508160857.yC3oMucJ-lkp@intel.com>
References: <20250814104753.195255-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-9-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_173627_891951_A86C3F47 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on rockchip/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250814-185009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250814104753.195255-9-damon.ding%40rock-chips.com
patch subject: [PATCH v4 08/13] drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
config: x86_64-randconfig-001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160857.yC3oMucJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160857.yC3oMucJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160857.yC3oMucJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `analogix_dp_finish_probe':
>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1700: undefined reference to `devm_of_dp_aux_populate_bus'


vim +1700 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

  1695	
  1696	int analogix_dp_finish_probe(struct analogix_dp_device *dp)
  1697	{
  1698		int ret;
  1699	
> 1700		ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
  1701		if (ret) {
  1702			/*
  1703			 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
  1704			 * not be called because there are no EP devices. Then the callback function
  1705			 * analogix_dp_aux_done_probing() will be called directly in order to support
  1706			 * the other valid DT configurations.
  1707			 *
  1708			 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
  1709			 */
  1710			if (ret != -ENODEV) {
  1711				dev_err(dp->dev, "failed to populate aux bus\n");
  1712				return ret;
  1713			}
  1714	
  1715			return analogix_dp_aux_done_probing(&dp->aux);
  1716		}
  1717	
  1718		return 0;
  1719	}
  1720	EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
  1721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


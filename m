Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A2C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kasisej81KkzWHm3wFNnfYGY+dKQ1ERgdjtP9jRSmWk=; b=351OfS356KWwC9wSkClg4JeOm2
	XGFKS0I1N3XciaZH40FyD+n3Gy+8lXDzT69w6An0wsRC4wZKGyF+HsWEgnHY3DUkV3g75Wcx13Nt9
	r0DOEj720tLIUrfwnP+xIub07RATWzjLgLcnTAQSIDZ1mhlpJlOkdUY7+DpmuyPQIsOInXbS03mwJ
	VZ9F7FdabqG45SbXUxVf13/E2uZiDRRwFHVm9ri0SY4KYpU/23dk89OL91dCq5TJO8hYwp3n4MKaz
	9fUQaDeUO+foqL03tqy9/uiwOUjkwV+59L/dOnon1C9CU7qHtNMIjl8NlL9OHzK1lN1dKvlSrda7p
	6ZRDrfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxP9-0000000BBdL-33Dd;
	Tue, 27 May 2025 16:43:55 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxN1-0000000BBNK-11Jj;
	Tue, 27 May 2025 16:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364103; x=1779900103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ukJPA0XtU32Ecq35Tu9JsOdKWxywwRz0NHZNFe5yJx8=;
  b=YLNRGUHsMdsaxoiRmYhlwPdKY1HoVJcX0vKdFFbwvyP8NbdGwQRjcfns
   AKmx+2+/dTLhWPoVlbYRAeAWj5tBSGVODeKwsXZRKOVMoBky8VmxKS0zi
   z1RLNq00qfl7J2sTXdUHol3lb5W6MNf7ZvCzJx5mi/5NViS9uSjDKQlR0
   xJInb7Cd+Qwml8b4jiWn1pOv66zCC4nNoMN259i74lgWZmM80uhduBYtk
   0x8DWX3Ifbdc4AbJruPZagviv9D8c+DvnY8v+gnKZJBKTupRzE+Ub1tMW
   /FGog5DbQWiOR9+8IFaPIuK3CXPyv1CKxju5H2HlTse26ClGHw7FE4A87
   Q==;
X-CSE-ConnectionGUID: rb71bvJmTGmUWMkDdJb6HQ==
X-CSE-MsgGUID: YPHnP+3aStCGRzDoSeDQgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="75753542"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="75753542"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:41:40 -0700
X-CSE-ConnectionGUID: DUtYUoYfTRmWnZZqVBzNsA==
X-CSE-MsgGUID: J7RjXSH3Qi+n5+GKbPS0xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="148028416"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2025 09:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxMs-000TLs-2K;
	Tue, 27 May 2025 16:41:34 +0000
Date: Wed, 28 May 2025 00:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
Message-ID: <202505280026.8VDl0TWN-lkp@intel.com>
References: <20250527081447.304-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527081447.304-1-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_094143_329596_9DE03EB3 
X-CRM114-Status: GOOD (  14.67  )
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

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.15 next-20250527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/drm-rockchip-cdn-dp-Convert-to-drm-bridge/20250527-161941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250527081447.304-1-kernel%40airkyi.com
patch subject: [PATCH v3] drm/rockchip: cdn-dp: Convert to drm bridge
config: i386-buildonly-randconfig-002-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280026.8VDl0TWN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280026.8VDl0TWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280026.8VDl0TWN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/cdn-dp-core.c:783:17: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
     783 |                 DRM_DEV_ERROR(bridge->dev, "Invalid format %d\n", daifmt->fmt);
         |                               ^~~~~~~~~~~
   include/drm/drm_print.h:504:17: note: expanded from macro 'DRM_DEV_ERROR'
     504 |         drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
         |                        ^~~
   include/drm/drm_print.h:488:42: note: passing argument to parameter 'dev' here
     488 | void drm_dev_printk(const struct device *dev, const char *level,
         |                                          ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:844:3: error: field designator 'dp_audio_prepare' does not refer to any field in type 'const struct drm_bridge_funcs'; did you mean 'hdmi_audio_prepare'?
     844 |         .dp_audio_prepare = cdn_dp_audio_prepare,
         |          ^~~~~~~~~~~~~~~~
         |          hdmi_audio_prepare
   include/drm/drm_bridge.h:702:8: note: 'hdmi_audio_prepare' declared here
     702 |         int (*hdmi_audio_prepare)(struct drm_connector *connector,
         |               ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:845:3: error: field designator 'dp_audio_mute_stream' does not refer to any field in type 'const struct drm_bridge_funcs'; did you mean 'hdmi_audio_mute_stream'?
     845 |         .dp_audio_mute_stream = cdn_dp_audio_mute_stream,
         |          ^~~~~~~~~~~~~~~~~~~~
         |          hdmi_audio_mute_stream
   include/drm/drm_bridge.h:728:8: note: 'hdmi_audio_mute_stream' declared here
     728 |         int (*hdmi_audio_mute_stream)(struct drm_connector *connector,
         |               ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:846:3: error: field designator 'dp_audio_shutdown' does not refer to any field in type 'const struct drm_bridge_funcs'; did you mean 'hdmi_audio_shutdown'?
     846 |         .dp_audio_shutdown = cdn_dp_audio_shutdown,
         |          ^~~~~~~~~~~~~~~~~
         |          hdmi_audio_shutdown
   include/drm/drm_bridge.h:716:9: note: 'hdmi_audio_shutdown' declared here
     716 |         void (*hdmi_audio_shutdown)(struct drm_connector *connector,
         |                ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:1011:4: error: use of undeclared identifier 'DRM_BRIDGE_OP_DP_AUDIO'
    1011 |                         DRM_BRIDGE_OP_DP_AUDIO;
         |                         ^
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:1046:9: error: use of undeclared label 'err_free_connector'
    1046 |                         goto err_free_connector;
         |                              ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:7: error: call to undeclared function 'devm_drm_bridge_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1114 |         dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
         |              ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:7: note: did you mean 'devm_drm_bridge_add'?
   include/drm/drm_bridge.h:945:5: note: 'devm_drm_bridge_add' declared here
     945 | int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
         |     ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:34: error: expected expression
    1114 |         dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
         |                                         ^
   drivers/gpu/drm/rockchip/cdn-dp-core.c:1114:56: error: use of undeclared identifier 'bridge'
    1114 |         dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
         |                                                               ^
   9 errors generated.


vim +783 drivers/gpu/drm/rockchip/cdn-dp-core.c

   755	
   756	static int cdn_dp_audio_prepare(struct drm_connector *connector,
   757					struct drm_bridge *bridge,
   758					struct hdmi_codec_daifmt *daifmt,
   759					struct hdmi_codec_params *params)
   760	{
   761		struct cdn_dp_device *dp = bridge_to_dp(bridge);
   762		struct audio_info audio = {
   763			.sample_width = params->sample_width,
   764			.sample_rate = params->sample_rate,
   765			.channels = params->channels,
   766		};
   767		int ret;
   768	
   769		mutex_lock(&dp->lock);
   770		if (!dp->active) {
   771			ret = -ENODEV;
   772			goto out;
   773		}
   774	
   775		switch (daifmt->fmt) {
   776		case HDMI_I2S:
   777			audio.format = AFMT_I2S;
   778			break;
   779		case HDMI_SPDIF:
   780			audio.format = AFMT_SPDIF;
   781			break;
   782		default:
 > 783			DRM_DEV_ERROR(bridge->dev, "Invalid format %d\n", daifmt->fmt);
   784			ret = -EINVAL;
   785			goto out;
   786		}
   787	
   788		ret = cdn_dp_audio_config(dp, &audio);
   789		if (!ret)
   790			dp->audio_info = audio;
   791	
   792	out:
   793		mutex_unlock(&dp->lock);
   794		return ret;
   795	}
   796	
   797	static void cdn_dp_audio_shutdown(struct drm_connector *connector,
   798					  struct drm_bridge *bridge)
   799	{
   800		struct cdn_dp_device *dp = bridge_to_dp(bridge);
   801		int ret;
   802	
   803		mutex_lock(&dp->lock);
   804		if (!dp->active)
   805			goto out;
   806	
   807		ret = cdn_dp_audio_stop(dp, &dp->audio_info);
   808		if (!ret)
   809			dp->audio_info.format = AFMT_UNUSED;
   810	out:
   811		mutex_unlock(&dp->lock);
   812	}
   813	
   814	static int cdn_dp_audio_mute_stream(struct drm_connector *connector,
   815					    struct drm_bridge *bridge,
   816					    bool enable, int direction)
   817	{
   818		struct cdn_dp_device *dp = bridge_to_dp(bridge);
   819		int ret;
   820	
   821		mutex_lock(&dp->lock);
   822		if (!dp->active) {
   823			ret = -ENODEV;
   824			goto out;
   825		}
   826	
   827		ret = cdn_dp_audio_mute(dp, enable);
   828	
   829	out:
   830		mutex_unlock(&dp->lock);
   831		return ret;
   832	}
   833	
   834	static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
   835		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
   836		.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
   837		.atomic_reset = drm_atomic_helper_bridge_reset,
   838		.detect = cdn_dp_bridge_detect,
   839		.edid_read = cdn_dp_bridge_edid_read,
   840		.atomic_enable = cdn_dp_bridge_atomic_enable,
   841		.atomic_disable = cdn_dp_bridge_atomic_disable,
   842		.mode_valid = cdn_dp_bridge_mode_valid,
   843	
 > 844		.dp_audio_prepare = cdn_dp_audio_prepare,
 > 845		.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
 > 846		.dp_audio_shutdown = cdn_dp_audio_shutdown,
   847	};
   848	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236B3E6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/LBeeXpiJz4k6rWEF7GVX1EIc7MSLD6GgpAiOGDSEw=; b=H7bii3c/yvsAzlp8k7x1a3xfyM
	V4h1EhMJJI4EMGSCc69+CNkcwXhGdeP27RGxH0RTdjPmvjG1ctjXPbBdGtS2heISstKO1o2IzSdfD
	BkXTflStzSWwx0nUWQRb08BR2GgUkX77IbPPLpqmfEmkuZaoZn2K516ZUuyYE9oVJRF1X3UPw14o1
	grXH35zPHqBRXVlMncMy4GQa/o4XyoQDkUbCvGV6mJYoVs0XEFxBxxyFpGpztr1GKZpa/bn7Edgb3
	TiKeZiaPSDY68sijX7ckyoc4RHo+vqnqvl5C3y1dV13PIvS6l++p3D0dzBXp2BGuK2KkjGdMCcbZj
	XSyYWyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOD-00000007TSP-3CnN;
	Fri, 01 Nov 2024 15:16:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tMY-00000007T9D-3L8M;
	Fri, 01 Nov 2024 15:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c/LBeeXpiJz4k6rWEF7GVX1EIc7MSLD6GgpAiOGDSEw=; b=MPWmIxtSuU1c1riNwDz53gUCmD
	MX61EH2Cn7+VWaEVjhK0iJGI0LV9c32TMoChNUhMstL6EXjp6U0nkAEhXkVtzBiLTY0Tgcu4LI5kY
	OoOA9vzMP8Q2i5mUeDZq4+3aa3qZUSKNJ5jtV5tiLWSfWo9oR3gtVWRu2+pz/sL0Cwj4JN2XBGUtf
	tPEVBMa/p06550nxG1qocBurctqBW5U5zIATJWYuOplFNpKqWYdoNpQP7qQxOUaMNcA2InNaQhe76
	ziwX1Dq11BNhIbfx5mxatVZmrxaC3JIzvWybSx3mjAncvPXeFL6vcm6AZqLwymdbA9j8jqmbE68G5
	i5XfVqBA==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tMV-0000000AkuS-0WUj;
	Fri, 01 Nov 2024 15:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730474095; x=1762010095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HDf6jYleLt1dL9i7iCeHfUfUY0TTmgcO8vabuye36qY=;
  b=HkuGNEG+HDj5fdH+PXpEbHvasRQobmOMKQXIih6I5hYCM9ZtmNft61pT
   3haKUXwkvApwmoBxVAn5r92GdQ0fi7LjOp4wekGNzXr2BNwXs/HiUqfZz
   fVbX72aje8V6RoR7tSPCdTsieZ1yD9bUCzj9Nc7hABgWlhT+YWlXBKgOb
   utbrPULArwbERWmMkVquSYxAMHY9Qg1op8wAza0t2llM3OVCciMvpGUXu
   bpdW/f4YJN6VNyM7FgKx+6mh85usf3LllGfW0/b5EyaG+1D9MXehG87yH
   qxiiJNdY+QhPyOBTkA2rz0zC+grILcGapjW9x/Ow+W2ANHNiG77JbomDW
   g==;
X-CSE-ConnectionGUID: 212lU1nRSumVC1LrD6s4Kg==
X-CSE-MsgGUID: 4rABBGQuRnWj1OXjdVHUJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30454127"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="30454127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 08:14:49 -0700
X-CSE-ConnectionGUID: UBQEuVPYQoW0mbS4mKno7w==
X-CSE-MsgGUID: 6Ri9NZEUQHKCbwSfXmY+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="82914858"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2024 08:14:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6tMI-000hgx-0S;
	Fri, 01 Nov 2024 15:14:42 +0000
Date: Fri, 1 Nov 2024 23:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH net-next 4/5] net: phy: mediatek: Integrate read/write
 page helper functions
Message-ID: <202411012322.1xALQkaN-lkp@intel.com>
References: <20241030103554.29218-5-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103554.29218-5-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_151455_575301_B4E722AD 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

Hi Sky,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20241030-184043
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241030103554.29218-5-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next 4/5] net: phy: mediatek: Integrate read/write page helper functions
config: s390-randconfig-002-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012322.1xALQkaN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012322.1xALQkaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012322.1xALQkaN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
>> ERROR: modpost: "mtk_phy_read_page" [drivers/net/phy/mediatek/mtk-ge.ko] undefined!
>> ERROR: modpost: "mtk_phy_write_page" [drivers/net/phy/mediatek/mtk-ge.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


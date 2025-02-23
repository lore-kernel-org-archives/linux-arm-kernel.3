Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54010C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53H7uDSkBtXAo9MHEP9x3/4U30uqaP2kMs5+ExlSJ2o=; b=2XKNxiv068Stb4PoskxcSvfeZ4
	jsHf2Y543JKWCRRKZGJZPxfURoPnjk1LV0ic+v+lrmj9Jn8Engci0Nq1PUpSORF0wM61kMci2jAGS
	mGy8nvg9tb/iHyTZlkLCKVu6q1htbP2Hd2jk4VflUNJEKBJggIKFVd/Oypeb9Q/SDs49rAQqCLnB+
	SbiU8WsQ5v9wGmtmY3WLiT8J1icCAs3ky3eagboRUx85C6rBewjCH1kws0TboOS9xTnUTXKdKP7Ax
	1DvxEhLyV1cd/3Ffo/agXry3s2yaeta4+kfOU3p0KzlmJ41vXnUEbwtWvil+EmEpKkaM/AkCfeqv7
	8wUP+0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFNR-0000000BSzE-1vBB;
	Sun, 23 Feb 2025 17:02:49 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmFLs-0000000BSrz-2ljb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 17:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740330073; x=1771866073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hce+YrPGmrSFkOORUi3xYv5tzmbWodZaL3ZsXnTZWtQ=;
  b=XiXDHEr3d3JvkDEa9sPwmjhHqJYLWWSHCOLIRMuAJY03WNHoHS8/Khw9
   KQRew84sb/xj4cehG4ED+XOYX0yRbODsdHx4KPCqyR6Iy6qKcPh4l0W12
   1RWkdwRL5o/18qMIt2G+PQtuVMlqdz1bDgF1QpC8lfOofSyji7pVGlH4M
   7dXvuU9dHGii+ZwzKt/HXoEGmWcvRkZyPVSHKDDYiZ4JFSJ8LAggJ14I7
   ZtswQFz6SxQKfLx8MLkTfXxRxJCu4eREo0hKQ5P1ECr8K53JGvyFsHp+Z
   OMCZ7WJ5AQu4ZnhdgPMuQDP7NXOSA2ENtAgoA8DK81D4oIZVLiVT1z0WL
   w==;
X-CSE-ConnectionGUID: tliMIqvkQxmhhQegC+NgSg==
X-CSE-MsgGUID: GSg/sRPaTXKYlnvhtE2m8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="63557683"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63557683"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 09:01:11 -0800
X-CSE-ConnectionGUID: pt1LIXu7QMCp6BV5jQiC4w==
X-CSE-MsgGUID: dtvLSN++Sc+fPbZlSCdwpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116360702"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2025 09:01:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmFLk-0007T1-38;
	Sun, 23 Feb 2025 17:01:04 +0000
Date: Mon, 24 Feb 2025 01:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Message-ID: <202502240019.JZE1rcyX-lkp@intel.com>
References: <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_090112_773139_E06EFE4A 
X-CRM114-Status: GOOD (  12.05  )
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

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-arm-samsung-document-g0s-board-binding/20250223-203243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223123044.725493-5-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
reproduce: (https://download.01.org/0day-ci/archive/20250224/202502240019.JZE1rcyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502240019.JZE1rcyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


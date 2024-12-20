Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A51E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7662jaCyBd2axS9jg71An2ylmV5apsvO3w5wOxiMw0=; b=o2j9eFKvj2FYukQeJOznodMftc
	9C63G+XULwHMzqV6rUiGp79Icqlgob5RZGv2H0W2sghoz0S4nz/IAVGz5HWdq3HzPGPa8VK3k/cfu
	5siBuDYfvvyINwz/JfpMHD0YmgCjPnovUfWtgWBwdUA6txZ8JCbwqAquxCjlKFuGI0D/A7K4iyqVP
	F3nI9tSp/5XiE40u9SsxoJzgRi7Q7R5lqbOslw00iUXW7pe/xgXtzLwjTcMCkxGEeTo/AqTMJf7XM
	qHb5fbILqRegPmLIbRbEAwKrSZjpZG5EEn+5sIbXQo8N+lRJDoTh02r459mvE25KPUIFnLctD0fPS
	SBwkl7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiEW-00000005rhn-1TkY;
	Fri, 20 Dec 2024 19:00:20 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiDM-00000005rZc-0DEy;
	Fri, 20 Dec 2024 18:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734721148; x=1766257148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STeUxUhBa15XpzjqHXj7grCaqugfSBd2WtpSvp8CpCQ=;
  b=Bg01dOhv4fVJ4thJO8a5o76DMMrhreuIprdLRZsdxBYC7MpTmCj+F+vb
   8uOUfBH/TKt5UhIOd4WssN0VPWCi2Rd6RdX5JmXPEMZVU4NJ3ClPL4ry+
   1/+qyXWur+NE9JdB4GB3oK3vwz2/HGKWXIjCp0K4P1olDAfwmcYrC4pPi
   +LYZ4vwdxNHlXU8alRNkGVQstPOd4EAFJKlDEbj9ePkvcvoD4hgV4bGve
   6w/HCDIxmwhaDJ7yXo3IAeks6FMR9OEYr7E64uXofJgmUpFzKEoJn0sZF
   8R9aYCSygNekVp6qg/Hd3gktBtBhquBVqZpO7y+I/frGrAxuesHoqVB9s
   Q==;
X-CSE-ConnectionGUID: PWzF9R9TTNudsmJpsF3CXg==
X-CSE-MsgGUID: rt+g4kZwSYaQOrkCqN7BeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34598307"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34598307"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:59:07 -0800
X-CSE-ConnectionGUID: gnoJoCBASKqYI3VJPFmTtQ==
X-CSE-MsgGUID: 2EZ86WctQ+uAiZGIqJCN0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="99110429"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 10:59:03 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOiDF-0001aZ-0g;
	Fri, 20 Dec 2024 18:59:01 +0000
Date: Sat, 21 Dec 2024 02:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
Message-ID: <202412210220.jZ2hzj8t-lkp@intel.com>
References: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_105908_131261_AFE9C7F0 
X-CRM114-Status: UNSURE (   9.72  )
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

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e90c9612ac3969cb8206029a26bcd2b6f5d4a942]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/RFC-media-Add-media_request_-pin-unpin-API/20241221-002633
base:   e90c9612ac3969cb8206029a26bcd2b6f5d4a942
patch link:    https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e%40raspberrypi.com
patch subject: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
reproduce: (https://download.01.org/0day-ci/archive/20241221/202412210220.jZ2hzj8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210220.jZ2hzj8t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/raspberrypi,rpi_hevc_dec.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


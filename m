Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3227C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 03:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKKfZgyXekmntpSkkrJKwi0wVhl/TBO7K5z8gTfVQGo=; b=i94crGyn7BhWae+Cn/j0r4dfTp
	JNDxlqpUAY5atd+j9y9VHEoNLd4bpBvx/bGDWMdWXwlz4V02ohKx+SiKtFUJnWEY/Q+oKgXl8U5jb
	2LL8Emgeya1VexNyGNUcVI9Yss1RCgTPZ2TrBz/7+fjtpY0OQsFnL2NnLfbx70oBlP5KqocxKpHrp
	Z3kvR5FRKO1ywGGFmqzv/FHisvGzpeiMiVkMYLAnW8BkvrZbhi617jVe9CyRhMmz8rqZTOfX7xy1G
	TD0uCrs40XVFLWqEGr8sIbjIHkU4qB13Pgy0KrLKux9GTjGzFhR1KM5z96GzHTGMjjVy3i/yJi6l1
	3v929zUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYzuH-00000001oRX-08tE;
	Sat, 18 Jan 2025 03:53:57 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYzrk-00000001oAM-158w;
	Sat, 18 Jan 2025 03:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737172281; x=1768708281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yeq4IXBcBZnTsUE8pk6nO8SgpaKvxASMp+nrzb3hWhY=;
  b=jBDmhEs/bsqOJ7I+XMuwkZ0qN+znmN+qnaELW6cx9mkaSbCYttTFdE84
   Bk8bA6xNjKbi+Lw9oBHanfN9oSmc0OoyyqbSrOHPdm5laB3o0R1ARGMmK
   GW5YgiWjW3sZnOwDfsY40dVcFC+hWv7RjQJWtax8nLFydID7gbWIMiw33
   cc8TqvPqdYh2lO6PIwX2E8yaRAdhcp/L+JRZVXQUvkKLwqsqV8rpN6vpv
   wzKWmPHx3L1ToiAT7eZYB4AGI9tgUsYLNZL/bmHZw0Ckxq8mbgQvqlG6K
   YjDV03EjA5nEBDY/RkHt+7N1fHJiDjRQx7vNqMB816w+P+CQUjGJV8O3N
   w==;
X-CSE-ConnectionGUID: fTHcpsNqSXGf92wYYK3BrQ==
X-CSE-MsgGUID: AmwoB2AdTvKRHnwWoRfloQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48113106"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="48113106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 19:51:20 -0800
X-CSE-ConnectionGUID: 8dmvt1VHSwqcx8wVnA9J8A==
X-CSE-MsgGUID: TP+sh+qYTWCb0l5GsEVfAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106444005"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 19:51:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYzrd-000U3v-34;
	Sat, 18 Jan 2025 03:51:13 +0000
Date: Sat, 18 Jan 2025 11:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	herbert1_wu@pegatron.corp-partner.google.com,
	Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8186: Add MT8186 Krabby platform based
 Skitty
Message-ID: <202501181109.qPUuOK1v-lkp@intel.com>
References: <20250115-skitty_kernel-v1-2-6ef2086858ba@pegatron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-skitty_kernel-v1-2-6ef2086858ba@pegatron.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_195120_334375_DAA10B68 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Geoffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 619f0b6fad524f08d493a98d55bac9ab8895e3a6]

url:    https://github.com/intel-lab-lkp/linux/commits/Geoffrey-Chien/dt-bindings-arm-mediatek-Add-MT8186-Skitty-Chromebooks/20250115-154648
base:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
patch link:    https://lore.kernel.org/r/20250115-skitty_kernel-v1-2-6ef2086858ba%40pegatron.corp-partner.google.com
patch subject: [PATCH 2/2] arm64: dts: mt8186: Add MT8186 Krabby platform based Skitty
config: arm64-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250118/202501181109.qPUuOK1v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181109.qPUuOK1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181109.qPUuOK1v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts:49.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree
--
>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts:48.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree
--
>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts:48.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree
--
>> Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts:49.1-8 Label or path target not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


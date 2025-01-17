Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F52C02188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrf2Xa5xJOGUeO6KsphcOxhHf/jvR2i99qlGeNx6RJw=; b=DP0ClR6feoqprodDId6Xt0cTFr
	RuKGgCalZ8LWAqkBJ3qCHer3p2JhJRRDv1Ny0Fzfs3a9kgpq9ScbnIo2biQUEIHlye7uiCzwEkdQU
	nZDratogAH0LNQPF7ucR6u7T886VgT2v5EhPy00xgVaMgSvhrwJajmZPydKXYO6+fqs1tzrDKu8WC
	hxoTAQT/NlVGQPwiu1hY+4WvpdQhUmUOY4pKERvSdEhpEr49qzgalYKLS1iXM0sV9zJyCWFcInsh+
	9P5tx8Kt5fi3+s9a6mvqkZfZ/Su2r8PTZmJZjkVlVCFS88zV1lhXb7IUdpyal4TjDBDTDg3XLiDLE
	ppbrsOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYl8m-00000000DBx-1dVk;
	Fri, 17 Jan 2025 12:07:56 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYl7V-00000000Cz5-11zS;
	Fri, 17 Jan 2025 12:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737115598; x=1768651598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DLRrKOUp9u7sPT49SGdZaxl1UKYfCm8vrUFE1vSBPIE=;
  b=Fp9AaJ3R/KtddLRgbxWnJ7q00OQloJXzi6gzbAdeps+H9Jq5r14rCvTU
   BcPAwWz29kPl917qrexGdgqpUdNvnUx6NhEEYB8JiT8FlGDtfWnpFGYnt
   N3Z2I2HXSHYy1hXOHDajKahmMemClZzTId1bsn7vnnJVIoDJaNkLTlsGi
   akR0t7IH3znbxbc0aqlU4ptXK7aMdnk6xTAPSGKCHbkXXXGqXnY5DTFQ1
   hRLmAAs0OIp33EFuQ8fovTsnEduAl2Tf0/vehnStz3/OkubbMYx4p4lbE
   7IwYNUZgbg5ACHR8n8q38sRUVwtOzR3cHuxWbkz9d85gMETWImb7Be7D8
   g==;
X-CSE-ConnectionGUID: wkv47j6xQNeBJvqlHGwykA==
X-CSE-MsgGUID: HYuBTJqgSIyNBDDi6DtFhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37567408"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37567408"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 04:06:37 -0800
X-CSE-ConnectionGUID: 4BtuMSxaQoKOP0bxr8WgHQ==
X-CSE-MsgGUID: a1W/BoZAS6G9ipHiyWRDpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106263069"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 04:06:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYl7P-000TAC-15;
	Fri, 17 Jan 2025 12:06:31 +0000
Date: Fri, 17 Jan 2025 20:06:17 +0800
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
Message-ID: <202501171915.sG65nBFc-lkp@intel.com>
References: <20250115-skitty_kernel-v1-2-6ef2086858ba@pegatron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-skitty_kernel-v1-2-6ef2086858ba@pegatron.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_040637_336478_1D3D9C1E 
X-CRM114-Status: UNSURE (   9.90  )
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

Hi Geoffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 619f0b6fad524f08d493a98d55bac9ab8895e3a6]

url:    https://github.com/intel-lab-lkp/linux/commits/Geoffrey-Chien/dt-bindings-arm-mediatek-Add-MT8186-Skitty-Chromebooks/20250115-154648
base:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
patch link:    https://lore.kernel.org/r/20250115-skitty_kernel-v1-2-6ef2086858ba%40pegatron.corp-partner.google.com
patch subject: [PATCH 2/2] arm64: dts: mt8186: Add MT8186 Krabby platform based Skitty
config: arm64-randconfig-r051-20250116 (https://download.01.org/0day-ci/archive/20250117/202501171915.sG65nBFc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171915.sG65nBFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171915.sG65nBFc-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts:48.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts:48.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts:49.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree
--
   Error: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts:49.1-8 Label or path target not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


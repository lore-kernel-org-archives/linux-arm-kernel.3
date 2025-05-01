Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9716EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNeUd4CqTV2/5t/EsYXVanpcYa9ssYK5ryBxjw2F9xc=; b=P+EyxJ/eR0dPXid3PSPllcTCAo
	WV4S2is7TLXONgOYnyOrWktMT5ANesWuUXqq7A4t9pPm5XOY7GjjZWIxexOhUMyaKUURGykdHoNVA
	FMbj1lU3dpGVCzJKrXd32FgVLn+hCcqLXQ9BqEayOaDOjcHGHPnNnRG7nUlHzjKCaBkw4jSyNzXts
	PQKvbPF2G6b2Gk4dH2ap25BVfTmE8TxTcR5TIlW/SW7YjHGbgS4r5J1l6XqTTvjK4sLwMazqB2ygs
	4AfuB7TPReXwAaBkuchik8Aui74xubLODq79LDF3ES+UiK0m9Fje3dO4F5hjJyyQvBeqKOztMV54R
	JZ0ysh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQNw-0000000F8D0-34uh;
	Thu, 01 May 2025 09:39:16 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQM1-0000000F7w3-2EqZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 09:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746092236; x=1777628236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7HkpmBy4uOXtgP/kfZ+4ul+zjnVdkK+uvMav1IDO7GE=;
  b=aK1Q1Mcdw884lCDiNc5dnvs39bceZSH/pIXSeAX5EjYBX8TJ04i7nVqp
   45FfuQ99lBBoPiPZPITb4a7mHskWyY+YeA0Rbrk6ddPMuWUc+EWX6lSnX
   dLIFxmbxoFEn+on6nJd8L5uMhN44miPaXAofKI+pQl48OCA8LXEAip4PP
   QiqQcVHrtxkmB4tk0vlSIPjzOkb+m+/pN7T8shpVAou4zpl78ff6qufJY
   19/10b5pFl75JpxJjX/iloPT4ylGuiudFx/sK/Yc/URbBKxRDSCOat7SG
   p/B1TonittlYSln2Lvw7WHrDtKJAJoK4fMlqn7oEkL3M+uOAnIOAxV2/9
   w==;
X-CSE-ConnectionGUID: WaL3bb0VRr25u0Wk9LChWw==
X-CSE-MsgGUID: fwzZqJYtRT+NwKu6zITbBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47672300"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47672300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 02:37:15 -0700
X-CSE-ConnectionGUID: +oETbooFSmyuPuIsABmWhA==
X-CSE-MsgGUID: A8hsURclRcGMFwsZ1uWTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="171577908"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2025 02:37:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAQLv-00045B-1z;
	Thu, 01 May 2025 09:37:11 +0000
Date: Thu, 1 May 2025 17:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <202505011756.SZDFqCew-lkp@intel.com>
References: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_023717_608982_EFD47051 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-i2c-i2c-wmt-Convert-to-YAML/20250430-183538
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42%40gmail.com
patch subject: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
reproduce: (https://download.01.org/0day-ci/archive/20250501/202505011756.SZDFqCew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011756.SZDFqCew-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-wmt.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


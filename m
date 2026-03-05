Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81EDEEF310
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBFJoZIoKO/hOU88XojwQWvF9+QKmIlbSNhxVmBqdnU=; b=EIZsezAOjXCnc3jxLBoCNWV/B4
	0/16VAU83Ll53nkPoneHVOfOdzag6JZ/ZSBuNi/QosaHSO+IuIq6Ocz7pmlKznP78YTAzRgiHEw++
	kdMj5nMRJEerUmhxoy+JR5u8TJSF+dDX068wmgCnuR0/QZWHPgciapAI2LuzCLERYtmiVkqBSfsHQ
	BHb5p02kyNbqBdhbuPUBp7wluAdXXhEE8KiOCRGVvHHh1xcV0fwQFFNHNfyCQgNBUW1J6qC40er/D
	ADRwaVFdAuOzUqEAoBSSghCWD+XxGH5DKlqeoAUdggCrmmP/dfj20VCqe3q7G8nUxV7iPAk9dYYGJ
	svbOneIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2sB-0000000143w-1O97;
	Thu, 05 Mar 2026 07:11:51 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2s8-0000000143a-20SO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772694709; x=1804230709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mh7TqYGtwyz8BNhFD30DS+eTl5ENs1RwMsa8SpKQyfA=;
  b=RjQr23vrZx5oGOhPZHtjADoVy9KcPw7ufeW8CqRsz4DCwwdTyLEO3iHi
   SJGP8Sqv1pJiZVuegyx7OmudIXdSPAJE1WnTAHjcAcMB6QAzsKgc+FVbF
   Ku0ex1RzCtt8ernSn8LSo0LEkiLYddql2vZ/wyb/D5IeMTqVb/qPj/6uO
   fIg2IJFEFfFltiEc23ST7E6wke+egylAiN04NRinyzo3/5MBXYf/cAlKl
   u4p7eYav01cO0CwDpq9UcTQCqnpG+MIvYuTbe7+A+EQg/dtShE70/Cply
   EFFITH4Nk6gemrf2tv4lr/Ms3HXiogaTxDpkFuQDFfFlFRYYd94kxL5fP
   Q==;
X-CSE-ConnectionGUID: Jm42UsjDQiOoZOYS/SMG6w==
X-CSE-MsgGUID: n5fidc/tS0WgvUOtQ+TbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73687286"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73687286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:11:47 -0800
X-CSE-ConnectionGUID: 4I7EZlacT7CX44ivW2zzbA==
X-CSE-MsgGUID: tDPbyxNBSTmeAN8d90KA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241600936"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 23:11:41 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy2rz-000000001y1-2aM6;
	Thu, 05 Mar 2026 07:11:39 +0000
Date: Thu, 5 Mar 2026 08:11:29 +0100
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: oe-kbuild-all@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <202603050819.478UbJ2l-lkp@intel.com>
References: <20260304211808.1437846-2-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304211808.1437846-2-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_231148_531399_5F92C279 
X-CRM114-Status: GOOD (  12.24  )
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

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on remoteproc/rproc-next robh/for-next next-20260304]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/docs-driver-api-gpio-rpmsg-gpio-driver-over-rpmsg-bus/20260305-052440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260304211808.1437846-2-shenwei.wang%40nxp.com
patch subject: [PATCH v9 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050819.478UbJ2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050819.478UbJ2l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .. code-block:: none
   +-----+-----+-----+-----+-----+----+
   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
   | 1   | 2   |port |line | err | dir|
   +-----+-----+-----+-----+-----+----+ [docutils]
>> Documentation/driver-api/gpio/gpio-rpmsg.rst:115: WARNING: Title underline too short.


vim +115 Documentation/driver-api/gpio/gpio-rpmsg.rst

   112	
   113	
   114	GET_VALUE (Cmd=4)
 > 115	~~~~~~~~~~~~~~~~
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


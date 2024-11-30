Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60F6D7360D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynl4HPJVQX7TJPoDXWLI2joHh4yX9GdAxmhXe1H9Oes=; b=r4NP3SlOZ4Y4reuk9uLUm7gTg4
	lMy7iV8pf/y5RbbfaEW3zjbJhKNKxXGfPX+xp9nll4bZdcDl99sQ1sZ62KuNwyHqfxizlcXurPh2B
	Zj62xpAyxKK8yqam7SEbDaUMAdaCSil1fvtsff56v9koPAst4iRRduzoXqxABcmg/wEwy31yK9GEi
	6XnGHdUSZuN6HrKjZhnUb2dgvH68DcUqn5K3fVw5tu+5uZTaLzMSJBcD4XcD3+lNatjebLNdUfHeE
	h6wS885JVvAZqHD162dpN95/JWu+mh5/InctKVPKQhdUAAH8ozzX6Nz3LBnV2KwXE26zvuWLZzOcl
	6cAzcKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHTls-00000002VUw-0RiZ;
	Sat, 30 Nov 2024 20:08:52 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHTks-00000002VPM-14lY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 20:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732997270; x=1764533270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gA6EPb72gVsgpMXnMkReyXmS2VCY76gjR1DkpggEPOY=;
  b=fqD03A5D7FJI5ysR3HF63+EJr0TNblr8Qko78WOAViigHjsfXXPVM7dx
   egnM60fWTKroesYgzXnGHeA/aMwQt0rp+MvbZ0DBeqOphJkEZdsc6/oHS
   71YOkj/OwPZWcclZ7sTbPt0u5mnAn4/MttBSWvvouahnfbXrqKs6stCqj
   u6D1znt3fHPZna8dE+n+8Hzk4MLYDIAz9jx++ykuysQ03/KfXaSrqsPvK
   W/1jAZ9HX2uzLts+0cqZz1rptGI4VYmsHIN7tNkHD9m8xYtctXBRU0fSP
   IuArJeOAFGo848xtE10uJVLWSA4DGUVuAg2rk3By5dsl+ZgeG26r1I9Si
   A==;
X-CSE-ConnectionGUID: jCR0Z3LlTnWhTj533EvLXA==
X-CSE-MsgGUID: ECdAAxmPTjCkWDaOicjIaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32549630"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="32549630"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 12:07:49 -0800
X-CSE-ConnectionGUID: cWDN9k1hSDi9IvGF9R1afw==
X-CSE-MsgGUID: r9FfSjUUTEqQ24qj4fNIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="123688168"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2024 12:07:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHTkh-0000wn-3D;
	Sat, 30 Nov 2024 20:07:41 +0000
Date: Sun, 1 Dec 2024 04:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202412010328.kJoRexZK-lkp@intel.com>
References: <20241126114414.419469-4-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126114414.419469-4-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_120750_461238_6CEE3022 
X-CRM114-Status: GOOD (  11.61  )
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

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core linus/master v6.12]
[cannot apply to abelloni/rtc-next next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/rtc-s32g-add-NXP-S32G2-S32G3-SoC-support/20241128-095523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241126114414.419469-4-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20241201/202412010328.kJoRexZK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010328.kJoRexZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010328.kJoRexZK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/rtc/rtc-s32g.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


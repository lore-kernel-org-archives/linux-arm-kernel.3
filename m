Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1829ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fwDxiYfMdN2nLz2ZuEX+Y4mrEUZVapu4NUeLLR1y3c=; b=cWPJ+Cr0SCuA8KmK5IQht5eyeH
	rpq+1P5oSQwNGg1ZnumuuzZxKkdubqpo2YZZV7T4eAomzW9aQ59BvMfyIw3n8DeW6yFwpmyv42KVr
	YfxGhGh0+0VD0a93hA0ON0c55C8PNb7Q+r1GW2xFHhSj1JJSqhQQwfEjbijdUrOSjPKmc36vjG9de
	TFyajQzzsx0EYo8X9zjJiVgzAOa8bU6yp8+GCUKnitIkWEXR7y9d3DOFwOWq424zRu28sO4W8tsAe
	1pOmvR0qejjWv/Y95itne9HMEDGXIHVipyiheA8dSLzsVME1lUIo6/1tUejIPQDLYa4vm1RFynRBI
	fzsjrjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkhJ-00000004Y5N-0EAg;
	Sat, 23 Aug 2025 09:38:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upiQ0-00000004HFl-0BP7
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 07:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2fwDxiYfMdN2nLz2ZuEX+Y4mrEUZVapu4NUeLLR1y3c=; b=nSLYQD6BYx4VDwx60qexuAFbIJ
	XGiIZj0TTp6PH28cfAv8zsZ5JJuymLB08/iHMEx8BJ7lyJg9hNVgyLFr+XdAPZgwPxmwgthDCchLV
	j07OrWNVSbqjWQklP6p12SA9oRwcuj0Q7oc2wHphwFCJXw/6A5ZOuVigzAdvAHv31NYNa3OlhjW4R
	+HaKPnA7vT4bh5b2idOymUwK+ukc9vgYVzjt7n3tTYuFQMUbbqH++FS+hSrkLDQRROLKsWMcFvLlK
	jarH2Uc8M1a4OTz5rNo5AejOf3onsd54aPICNuoYJ7Ha9D04wyVRgaHqsNST6BOIIDKDmHKWv9opd
	UBDPEy5A==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upiPw-00000001JnO-0Lxr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 07:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755933120; x=1787469120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jGVpPERW5NP1rnaGTAcvIEIQaG44vKcBtYOfI1JBcS8=;
  b=cwKF9I5R4f0AVKzcpECgS2uRHgjGzgvSEea708qMoUz8k/3gA+MFqUkt
   /+GrD1TwbKU0t2VC214ZCaUIAJ43aQPc0IoKzPJnzUeAiptMUsQlOazr5
   oghzlFItikW6cPwHPHkv+UfKtogoa6Y6TysoZ7uRUlelp/nVdiydx92DV
   hTrBhMS46LIfMNA1uKTrdnFKbOEZpg1ISYfsPDG9qrfdrwCIFHMpavxB9
   i7qg9AuscAP5OeVXH5zSADI9c9SriCtvX8/tN5D30Ssn0j+l59qajTxoO
   7HRYrzH60GsMRV1evTV+0HTZuDrCRz4JmxKTwpiVY2FUjbw5oZxIN/ABI
   w==;
X-CSE-ConnectionGUID: TqiQ/OUYQvCIvVaTy00gQg==
X-CSE-MsgGUID: +3jSLvc1RziZcQvsgCIMEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60858176"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60858176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 00:11:49 -0700
X-CSE-ConnectionGUID: Jubo2rtVTOGHdEnsPCW6Yg==
X-CSE-MsgGUID: BWV5dKzARCmUx6HMiM7IWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199755162"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2025 00:11:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upiPe-000M9n-32;
	Sat, 23 Aug 2025 07:11:42 +0000
Date: Sat, 23 Aug 2025 15:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
	Tao Zhang <quic_taozha@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
Message-ID: <202508231400.bELUAEeq-lkp@intel.com>
References: <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_081200_663324_3A2CF452 
X-CRM114-Status: GOOD (  11.85  )
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

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250822]
[also build test ERROR on v6.17-rc2]
[cannot apply to robh/for-next linus/master v6.17-rc2 v6.17-rc1 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/dt-bindings-arm-document-the-static-TPDM-compatible/20250822-183421
base:   next-20250822
patch link:    https://lore.kernel.org/r/20250822103008.1029-3-jie.gan%40oss.qualcomm.com
patch subject: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
config: arm-randconfig-002-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231400.bELUAEeq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231400.bELUAEeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231400.bELUAEeq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-tpda.c: In function 'tpdm_read_element_size':
>> drivers/hwtracing/coresight/coresight-tpda.c:77:17: error: label 'out' used but not defined
      77 |                 goto out;
         |                 ^~~~


vim +/out +77 drivers/hwtracing/coresight/coresight-tpda.c

    57	
    58	/*
    59	 * Read the element size from the TPDM device. One TPDM must have at least one of the
    60	 * element size property.
    61	 * Returns
    62	 *    0 - The element size property is read
    63	 *    Others - Cannot read the property of the element size
    64	 */
    65	static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
    66					  struct coresight_device *csdev)
    67	{
    68		int rc = -EINVAL;
    69		struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
    70	
    71		if (coresight_is_static_tpdm(csdev)) {
    72			rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    73						      "qcom,dsb-element-bits", &drvdata->dsb_esize);
    74			rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    75						       "qcom,cmb-element-bits", &drvdata->cmb_esize);
    76	
  > 77			goto out;
    78		}
    79	
    80		if (tpdm_data->dsb) {
    81			rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    82					"qcom,dsb-element-bits", &drvdata->dsb_esize);
    83		}
    84	
    85		if (tpdm_data->cmb) {
    86			rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
    87					"qcom,cmb-element-bits", &drvdata->cmb_esize);
    88		}
    89	
    90		if (rc)
    91			dev_warn_once(&csdev->dev,
    92				"Failed to read TPDM Element size: %d\n", rc);
    93	
    94		return rc;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


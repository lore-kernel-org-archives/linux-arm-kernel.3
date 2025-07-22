Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59B9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ex9FmglyVKBQIa3cLqGvOXxHA97cbemSf3f184T2yuM=; b=q3ED/Bl8RUt7fbop5QGWdCOJJV
	BtsG2pSrjPBWeGrMN4WyUi8N98ZMMiqelzdRPhyEbymaItOPmsSBpRmncCvxfa/eTdU+O160ifKAo
	uZrbfdj3b9Y6FS8OVKOSdKlgkR5Ol+PF/fwqfGthv3D5IAqKJC8Ayi/h00/J7n6PbFimwCyoW3jz8
	C5QlyHECt2wQNME6c8evka5QAxsngwOPDxQZ5+3AW1JTPnUjWQXhWJDJMDVQ4UP9FY27nemicgEVb
	rQHfOVyUBBucTYEoP3Q7IzF4mq9msu2zlSFwIThw0Rf28CaUB8G0agfW5j2CK/WwOA4H0pS1HGVzF
	ASdzAsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGkj-000000038IM-2KAv;
	Tue, 22 Jul 2025 17:26:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGiF-0000000381g-3YZY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 17:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ex9FmglyVKBQIa3cLqGvOXxHA97cbemSf3f184T2yuM=; b=q001L+Klap9aeYBrf7FJ4w0irO
	0rbL5kOzwrQR6hcd+fnbofrFtheX59nz1lK7WHxm5kI+7lkjoJCaMPfnNpx7MvTO5n+Gc2BZMXy+E
	S38nJixZf2fuIYACJ9uXfyOwJszGfk+jJ2U8q1S5QqRUS3wDKXDZ7Zm0lZc3MynjLCyE4psfZRSgw
	iwFcYBSTUov9rHtRgZM1hws8KALVkT3s74j1umsuw2gn7WHxhRTm9kfNDk59w6F9claIK+ODooJcr
	fWnqeW5K9iy2XaRXHBWiFJ8UBoUUUFyxUpix5FWyOpMeI4uWtKt0nIcgm42uTDl3IzoWysBDBop1M
	TGs3vU0Q==;
Received: from mgamail.intel.com ([192.198.163.18])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGiC-0000000BK5E-0UGu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 17:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753205012; x=1784741012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iY8DNW2TAKM17+S3GE59sF3ZE1JUQqgmoNS4oXSaDTI=;
  b=K4MjJsxfYky9Un9P42NZ49NjzENijzbzELAQpL+FwyImwmQGEmppFdSW
   fwsU4/PElm7ZHCcbfFO3T440mp+QppqtU0sm4mLwYOfFYXevZ1kXlHhMY
   w0dSjs1KUfT7hOOlYfI/2YIPgL28CK+DA/vjaHe1pbld6tvjtW5OLRTWA
   EOO/ew5fHbzueOm2kVSHtBXuL23jn0Xyjh9I/ysKBXUPN7q0YNf3aV/2V
   t9lW8oXGan8A//tlVOsnHt5RNWo6lHTElIZv2+/+nbaOBxzOSO5nHVvl2
   ajnRq/rjuo+iY0GrOXVaAKB6rrxcn/A6PqSYHVfsrygZdq63lVlGPOJYL
   Q==;
X-CSE-ConnectionGUID: NOc0aVzPQuSSOibErMuA4w==
X-CSE-MsgGUID: vYPGIK90RwSZdxsUY3CmWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54686980"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="54686980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 10:23:24 -0700
X-CSE-ConnectionGUID: uaWWmbRTSpWBbZdK7pVGwA==
X-CSE-MsgGUID: lepFhLzqSUi9A8Qk/GF6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="163750882"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jul 2025 10:23:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueGhv-000IaB-1e;
	Tue, 22 Jul 2025 17:23:15 +0000
Date: Wed, 23 Jul 2025 01:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v12 8/8] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Message-ID: <202507230101.w90DnJxJ-lkp@intel.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-8-87bac3ec422e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-8-87bac3ec422e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_182332_641575_76F4C312 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Shivendra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 97987520025658f30bb787a99ffbd9bbff9ffc9d]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/power-reset-reboot-mode-Add-device-tree-node-based-registration/20250722-023323
base:   97987520025658f30bb787a99ffbd9bbff9ffc9d
patch link:    https://lore.kernel.org/r/20250721-arm-psci-system_reset2-vendor-reboots-v12-8-87bac3ec422e%40oss.qualcomm.com
patch subject: [PATCH v12 8/8] power: reset: reboot-mode: Expose sysfs for registered reboot_modes
config: arc-randconfig-r111-20250722 (https://download.01.org/0day-ci/archive/20250723/202507230101.w90DnJxJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250723/202507230101.w90DnJxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230101.w90DnJxJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/reset/reboot-mode.c:82:76: sparse: sparse: Using plain integer as NULL pointer

vim +82 drivers/power/reset/reboot-mode.c

    74	
    75	static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
    76	{
    77		struct reboot_mode_driver **devres_reboot;
    78		struct reboot_mode_driver *reboot;
    79		struct mode_info *info;
    80		ssize_t size = 0;
    81	
  > 82		devres_reboot = devres_find(dev, release_reboot_mode_device, NULL, 0);
    83		reboot = *devres_reboot;
    84		mutex_lock(&reboot->rb_lock);
    85		list_for_each_entry(info, &reboot->head, list) {
    86			size += sprintf(buf + size, "%s,", info->mode);
    87		}
    88		mutex_unlock(&reboot->rb_lock);
    89	
    90		if (size) {
    91			size += sprintf(buf + size - 1, "\n");
    92			return size;
    93		}
    94	
    95		return -ENODATA;
    96	}
    97	static DEVICE_ATTR_RO(reboot_modes);
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


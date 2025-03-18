Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8827CC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov5qJaVEuCCVtw6x3/0UOGURayPaMzelE4ZiNKhZLFg=; b=0AKTZJ3+cq0Kx4bwXas3imXlaQ
	Bl+KYe7+My1wKpW3CDKiTwhfS8eT4MVfSIvPQAr9GB9kWiHWElEqyh/vk8mNcBfEtbTdbpMCmNJxA
	PyAY+t3E+pxZ77AkaqLFt0LRzjicRS3yOQsaZ1W8cdUYnUu1JJ+PrEnKEoGD8zY46kSyPoTlL0Tt8
	bUSIsrAr7nRFWGElQUkMlqEOL7yiplPOnh0cBlxSSxSawjVpqjS2Sd3SE3Z/upxV8tBbpSbx7cekB
	StMCP7OAwqrERLMxzfFFPEA4T5YDEiq5OZWobrAt6jvGm4qFqqXLmGOL2C+n3kiJf7laUT74ckLBk
	CAfyA6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufu2-00000007IsX-3L2M;
	Tue, 18 Mar 2025 22:59:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufsM-00000007IkL-0DZo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 22:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742338654; x=1773874654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ab0mjpny9YV3cDgaOEiBxiCSt5kA5wyfbzdqOnZMbfM=;
  b=FSAwpcmj4eb5CWQU8i7yxwJnHdNC78dhpt9GDChvPQYYB9YH3W3WLh/g
   rXqSLtArNQRS8LU0nm8mOvUDCh4SCMiZcx0ixLsnuTnRswVKqCcAj3Wn3
   BtF02izob3iUugDJiVP6FWrh1pLh1kecopvhxKOUn4760oICbHbTdS4OU
   8l3If+1Nmy7v0Dh4rmkPXGDEaY5iwnAych8hU+doK1lnFexA2EHoBaGou
   kIj1tP3OwTtyN3gkdPc0m92eDeE15u1jZUGkDVgREMS2agHaUQqr4MzvY
   jw1w/9QqdJ6bR7ZDlgUr9QVA6yg1WHquD4DM5j7wVVKwjuBIa+0sZIA0Q
   Q==;
X-CSE-ConnectionGUID: Z1OrkMGQTi2470ywXpMfEA==
X-CSE-MsgGUID: iYK412WnSOqArf90XqDRSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="60899297"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="60899297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:57:29 -0700
X-CSE-ConnectionGUID: LkmWyGn/TXCsM8/yBE1esg==
X-CSE-MsgGUID: jjNBGmTXT6Cr8oaTnsh5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="159556524"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2025 15:57:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tufs6-000EE2-2N;
	Tue, 18 Mar 2025 22:57:19 +0000
Date: Wed, 19 Mar 2025 06:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Hilber <quic_philber@quicinc.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Trilok Soni <quic_tsoni@quicinc.com>,
	Peter Hilber <quic_philber@quicinc.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Simon Horman <horms@kernel.org>,
	virtio-dev@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] virtio_rtc: Add PTP clocks
Message-ID: <202503190602.IElWB74j-lkp@intel.com>
References: <20250313173707.1492-3-quic_philber@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313173707.1492-3-quic_philber@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_155734_165942_EEF9AA2F 
X-CRM114-Status: GOOD (  12.58  )
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

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d8960672d63db4b3b04542f5622748b345c637a]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Hilber/virtio_rtc-Add-module-and-driver-core/20250314-014130
base:   9d8960672d63db4b3b04542f5622748b345c637a
patch link:    https://lore.kernel.org/r/20250313173707.1492-3-quic_philber%40quicinc.com
patch subject: [PATCH v6 2/4] virtio_rtc: Add PTP clocks
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20250319/202503190602.IElWB74j-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190602.IElWB74j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190602.IElWB74j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_rtc_driver.c: In function 'viortc_probe':
>> drivers/virtio/virtio_rtc_driver.c:665:23: warning: '/variant ' directive output may be truncated writing 9 bytes into a region of size between 6 and 15 [-Wformat-truncation=]
       "Virtio PTP type %d/variant %d", clock_type,
                          ^~~~~~~~~
   drivers/virtio/virtio_rtc_driver.c:665:4: note: directive argument in the range [0, 2147483647]
       "Virtio PTP type %d/variant %d", clock_type,
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_rtc_driver.c:664:2: note: 'snprintf' output between 28 and 46 bytes into a destination of size 32
     snprintf(ptp_clock_name, PTP_CLOCK_NAME_LEN,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       "Virtio PTP type %d/variant %d", clock_type,
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       leap_second_smearing);
       ~~~~~~~~~~~~~~~~~~~~~


vim +665 drivers/virtio/virtio_rtc_driver.c

   641	
   642	/*
   643	 * init, deinit
   644	 */
   645	
   646	/**
   647	 * viortc_init_ptp_clock() - init and register PTP clock
   648	 * @viortc: device data
   649	 * @vio_clk_id: virtio_rtc clock id
   650	 * @clock_type: virtio_rtc clock type
   651	 * @leap_second_smearing: virtio_rtc leap second smearing
   652	 *
   653	 * Context: Process context.
   654	 * Return: Positive if registered, zero if not supported by configuration,
   655	 *         negative error code otherwise.
   656	 */
   657	static int viortc_init_ptp_clock(struct viortc_dev *viortc, u16 vio_clk_id,
   658					 u8 clock_type, u8 leap_second_smearing)
   659	{
   660		struct device *dev = &viortc->vdev->dev;
   661		char ptp_clock_name[PTP_CLOCK_NAME_LEN];
   662		struct viortc_ptp_clock *vio_ptp;
   663	
   664		snprintf(ptp_clock_name, PTP_CLOCK_NAME_LEN,
 > 665			 "Virtio PTP type %d/variant %d", clock_type,
   666			 leap_second_smearing);
   667	
   668		vio_ptp = viortc_ptp_register(viortc, dev, vio_clk_id, ptp_clock_name);
   669		if (IS_ERR(vio_ptp)) {
   670			dev_err(dev, "failed to register PTP clock '%s'\n",
   671				ptp_clock_name);
   672			return PTR_ERR(vio_ptp);
   673		}
   674	
   675		viortc->clocks_to_unregister[vio_clk_id] = vio_ptp;
   676	
   677		return !!vio_ptp;
   678	}
   679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


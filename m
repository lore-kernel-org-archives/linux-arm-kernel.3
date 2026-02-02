Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBB1E7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 17:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuT7BSbTpA9YqGylIgcZMjHRBgp33SIFds1E3lD+FRM=; b=yWKhWb34qWN4s93PoxYsuoP9aD
	c8Ndf56Ftzrwh/tDyZeICo37rmKOgI9kNaD6G+QhRk4rppQBmmTUiNka/E5TRJrOaLG5LqsIY9/Wt
	cnQkxKt+bkg6Kq0GvkBkFRrTqIaE6stMCF8cJSGpywSPxV4eJITp2XmiYz9+lO5tQXiprOj6WDByW
	+qyOIbkAs8SgEntOZOmYEL0USMt9Yjgpz0JNn98L9IyURRkrBwfbmcr8Yj7CRUz4ZCCmdGcVVjRKG
	wE5HyhR6/+jQjOOqsrtmmBpYRNsSm9nIIAHqF41ILiywzQSwM/948OMNBNaCZOsOCYhQIDTm1to6h
	Xr0VY91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxrT-00000005MoE-1QWr;
	Mon, 02 Feb 2026 17:37:19 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxrQ-00000005Mnb-40Xl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 17:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770053837; x=1801589837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qnUdp0fecZJL9WMPJ0BhqY7uIDclw68asQkR5FLPZ6A=;
  b=ZErulivcoC9V5YlgaNoy8+kj714i6q87Q6joQWjvUSeGUFJkgq4juPuk
   Q4ULbAwyNUgy46gBU/ZmdKMM8l2thFqPa5dV5f6F+fUeassFdmGilAmP1
   hPBNfD/tBF3oWwXYHiCzVanaqEEPXlb8YHX6A5LW4FrSMalvzV9O14DEF
   9ZYVfCRBOph0RMtZ4uj7XoXBPX9/nGpE3GrKrZPCCgnMlq9XZzrRkEXZV
   ec7EdQvt0AJ0dE7JwIvjvkwmXAF4qA4Zx52fxpB67zN5j0xFhazthg03M
   RFVUvjozKNQ6oRk0bMWeJAkmD+ZGtNvftNA4ggs+VTTYAbNSDRGqvCvAg
   w==;
X-CSE-ConnectionGUID: AgERS/k+TA64cdJo8QQ+LQ==
X-CSE-MsgGUID: p2Uf0W9CQc+brbfjmk1j2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82584540"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="82584540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 09:37:15 -0800
X-CSE-ConnectionGUID: mNWRr4kkTkKaw6XHoiHtJA==
X-CSE-MsgGUID: /VpVgHcER1S748B3+00oVw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2026 09:37:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmxrK-00000000foG-3J1S;
	Mon, 02 Feb 2026 17:37:10 +0000
Date: Tue, 3 Feb 2026 01:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>,
	Krutik Shah <krutikshah@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	Vladimir Moravcevic <vmoravcevic@axiado.com>
Subject: Re: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device
 controller IP Corigine
Message-ID: <202602030131.VCTzZ4me-lkp@intel.com>
References: <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_093717_010482_831A3063 
X-CRM114-Status: GOOD (  18.78  )
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

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Moravcevic/dt-bindings-usb-axiado-ax3000-udc-Add-Axiado-UDC/20260202-211951
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f%40axiado.com
patch subject: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device controller IP Corigine
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260203/202602030131.VCTzZ4me-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030131.VCTzZ4me-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030131.VCTzZ4me-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_queue_trbs':
>> drivers/usb/gadget/udc/crg_udc.c:881:13: warning: variable 'num_sgs' set but not used [-Wunused-but-set-variable]
     881 |         u32 num_sgs = 0;
         |             ^~~~~~~
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_ep_enable':
>> drivers/usb/gadget/udc/crg_udc.c:1812:26: warning: variable 'uccr' set but not used [-Wunused-but-set-variable]
    1812 |         struct crg_uccr *uccr;
         |                          ^~~~
>> drivers/usb/gadget/udc/crg_udc.c:1811:25: warning: variable 'epcx' set but not used [-Wunused-but-set-variable]
    1811 |         struct ep_cx_s *epcx;
         |                         ^~~~
   drivers/usb/gadget/udc/crg_udc.c: In function 'crg_udc_common_irq':
>> drivers/usb/gadget/udc/crg_udc.c:4250:13: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
    4250 |         int retval = 0;
         |             ^~~~~~
   drivers/usb/gadget/udc/crg_udc.c: At top level:
>> drivers/usb/gadget/udc/crg_udc.c:126:19: warning: 'driver_name' defined but not used [-Wunused-const-variable=]
     126 | static const char driver_name[] = "crg_udc";
         |                   ^~~~~~~~~~~
--
>> Warning: drivers/usb/gadget/udc/crg_udc.c:4325 cannot understand function prototype: 'const struct of_device_id of_crg_udc_match[] ='


vim +/num_sgs +881 drivers/usb/gadget/udc/crg_udc.c

   858	
   859	static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
   860			struct crg_udc_request *udc_req_ptr,  bool b_isoc,
   861			u32 xfer_ring_size,
   862			u32 num_trbs_needed, u64 buffer_length)
   863	{
   864		struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
   865		struct transfer_trb_s *p_xfer_ring = udc_ep_ptr->first_trb;
   866		u32 num_trbs_ava = 0;
   867		struct usb_request *usb_req = &udc_req_ptr->usb_req;
   868		u64 buff_len_temp = 0;
   869		u32 i, j = 1;
   870		struct transfer_trb_s *enq_pt = udc_ep_ptr->enq_pt;
   871		u8 td_size;
   872		u8 chain_bit = 1;
   873		u8 short_pkt = 0;
   874		u8 intr_on_compl = 0;
   875		u32 count;
   876		bool full_td = true;
   877		u32 intr_rate;
   878		dma_addr_t trb_buf_addr;
   879		bool need_zlp = false;
   880		struct scatterlist *sg = NULL;
 > 881		u32 num_sgs = 0;
   882		u64 sg_addr = 0;
   883	
   884		dev_dbg(crg_udc->dev, "%s %s\n", __func__, udc_ep_ptr->usb_ep.name);
   885		if (udc_req_ptr->usb_req.num_sgs) {
   886			num_sgs = udc_req_ptr->usb_req.num_sgs;
   887			sg = udc_req_ptr->usb_req.sg;
   888			sg_addr = (u64) sg_dma_address(sg);
   889			buffer_length = sg_dma_len(sg);
   890	
   891			dev_dbg(crg_udc->dev, "num_sgs = %d, num_mapped_sgs = %d\n",
   892				udc_req_ptr->usb_req.num_sgs,
   893				udc_req_ptr->usb_req.num_mapped_sgs);
   894			dev_dbg(crg_udc->dev,
   895				"sg_addr = %p, buffer_length = %llu, num_trbs = %d\n",
   896				(void *)sg_addr, buffer_length, num_trbs_needed);
   897		}
   898	
   899		if (!b_isoc) {
   900			if (udc_req_ptr->usb_req.zero == 1 &&
   901				udc_req_ptr->usb_req.length != 0 &&
   902				((udc_req_ptr->usb_req.length %
   903				  udc_ep_ptr->usb_ep.maxpacket) == 0)) {
   904				need_zlp = true;
   905			}
   906		}
   907	
   908		td_size = num_trbs_needed;
   909	
   910		num_trbs_ava = room_on_ring(crg_udc, xfer_ring_size,
   911			p_xfer_ring, udc_ep_ptr->enq_pt, udc_ep_ptr->deq_pt);
   912	
   913		/* trb_buf_addr points to the addr of the buffer that we write in
   914		 * each TRB. If this function is called to complete the pending TRB
   915		 * transfers of a previous request, point it to the buffer that is
   916		 * not transferred, or else point it to the starting address of the
   917		 * buffer received in usb_request
   918		 */
   919		if (udc_req_ptr->trbs_needed) {
   920			/* Here udc_req_ptr->trbs_needed is used to indicate if we
   921			 * are completing a previous req
   922			 */
   923			trb_buf_addr = usb_req->dma +
   924				(usb_req->length - udc_req_ptr->buff_len_left);
   925		} else {
   926			if (sg_addr)
   927				trb_buf_addr = sg_addr;
   928			else
   929				trb_buf_addr = usb_req->dma;
   930		}
   931	
   932		if (num_trbs_ava >= num_trbs_needed) {
   933			count = num_trbs_needed;
   934		} else {
   935			if (b_isoc) {
   936				struct crg_udc_request *udc_req_ptr_temp;
   937				u8 temp = 0;
   938	
   939				list_for_each_entry(udc_req_ptr_temp,
   940						&udc_ep_ptr->queue, queue) {
   941					temp++;
   942				}
   943	
   944				if (temp >= 2) {
   945					dev_err(crg_udc->dev, "%s don't do isoc discard\n", __func__);
   946					/*  we already scheduled two mfi in advance. */
   947					return 0;
   948				}
   949			}
   950	
   951			/* always keep one trb for zlp. */
   952			count = num_trbs_ava;
   953			full_td = false;
   954			dev_dbg(crg_udc->dev, "TRB Ring Full. Avail: 0x%x Req: 0x%x\n",
   955					num_trbs_ava, num_trbs_needed);
   956			udc_ep_ptr->tran_ring_full = true;
   957	
   958			/*if there is still some trb not queued,
   959			 *it means last queued
   960			 *trb is not the last trb of TD, so no need zlp
   961			 */
   962			need_zlp = false;
   963		}
   964	
   965		for (i = 0; i < count; i++) {
   966			if ((udc_req_ptr->usb_req.num_sgs) && (buffer_length == 0)) {
   967				sg = sg_next(sg);
   968				if (sg) {
   969					trb_buf_addr = (u64) sg_dma_address(sg);
   970					buffer_length = sg_dma_len(sg);
   971					dev_dbg(crg_udc->dev,
   972						"trb_buf_addr = %p, num_trbs = %d\n",
   973						(void *)trb_buf_addr, num_trbs_needed);
   974					dev_dbg(crg_udc->dev, "buffer_length = %llu\n",
   975						buffer_length);
   976				} else {
   977					dev_err(crg_udc->dev,
   978						"scatterlist ended unexpectedly (i=%d, count=%d)\n",
   979						i, count);
   980					return -EINVAL;
   981				}
   982			}
   983	
   984			if (buffer_length > TRB_MAX_BUFFER_SIZE)
   985				buff_len_temp = TRB_MAX_BUFFER_SIZE;
   986			else
   987				buff_len_temp = buffer_length;
   988	
   989			buffer_length -= buff_len_temp;
   990	
   991			if (usb_endpoint_dir_out(udc_ep_ptr->desc))
   992				short_pkt = 1;
   993	
   994			if ((buffer_length == 0) && (i == (count - 1))) {
   995				chain_bit = 0;
   996				intr_on_compl = 1;
   997				udc_req_ptr->all_trbs_queued = 1;
   998			}
   999	
  1000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


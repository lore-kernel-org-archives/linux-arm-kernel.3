Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C52C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 06:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkWtTb4nOH+DERYkkEkktsu/rgyMrs0tJoV+LEAg50w=; b=j5fLxjN5oppEGw3rgmokVeAnxF
	283ntkm43STMcg49Z05DhxU3CRsSVAYsEjasPggAirVffQ64KQzOQC1p0gHGewufYzk+A/n+tI4IV
	lu0Uvg8SBOh0kHPvaD+uB6if1McIvHxO2wiY8hJmG/9mCjfhU2kHsM/JcQUztZbiNJkzt4GLi2hvs
	5/CwV8/rzblZ4+Nu8BfjDvnjuZpIG8wLN6kFLVSGjKZ8I5BTfhRcp4WjnAjnIAN0NiElK3lqIajpl
	jHwOQxLbaOBfUoN8qY63NtDmyn6Rs3IKhswtlhDf6Qftmpnt1HMBVaZW945EZkOrD9znNaanAxvHb
	NbeYLvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C2D-0000000Autj-0jYX;
	Wed, 09 Sep 2026 06:43:53 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C2A-0000000Aut3-39Vj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 06:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788936231; x=1820472231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7gdKpKFflD/3CuK4Pe16Yge2b33nk4BgG6x4bwQVnM=;
  b=gvqbeL4XbUfRHkVF58EAtSJbYcN+T3NrzjTgvMjc4iMM7sdXT506VtR1
   W81wKbAukmVLmZ0tgTASi5g8822FaFY+HQamwF3EwTnLky6uNY2lP7DCU
   4zZISIAYoDTHzKgPufkSkT7TkxvFvu0gAhldiAJ2hwwoBwlzhPYT1Pd8w
   GxUkHbmmhRlNCZHIqQZFc8A6B69uVe5Z0QLKnKb0lO+rxzerXP/00RE0W
   yzS87JnZFN0adGZiJmVC7/VUnBtyFCkrG90CM1TTUPls3g2vKF/zOfDrg
   8/YAUat4HxxvTqjcZyCfIXFz5i5ZixS1/x3W6/OYSHIVhTWc+tH9u4y+4
   g==;
X-CSE-ConnectionGUID: qNVjeGJwQVirlM9h9bpOlg==
X-CSE-MsgGUID: UjP1flRuQ2azG8rai4dI1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106720256"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="106720256"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 23:43:50 -0700
X-CSE-ConnectionGUID: +AvCfD0UTCC9gxEHi8A2Ug==
X-CSE-MsgGUID: whqY3FT3TheW5UMnFrmDHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="276458655"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2026 23:43:47 -0700
Date: Wed, 9 Sep 2026 14:43:46 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Heiko Schocher <hs@nabladev.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Message-ID: <aqEAImnHDYWcOdc0@yilunxu-OptiPlex-7050>
References: <20260810062105.299808-1-hs@nabladev.com>
 <ap2Yx8oACWfBKOep@yilunxu-OptiPlex-7050>
 <6a489d2b-b5d1-0455-793f-f4100fd3b3d1@nabladev.com>
 <aqBbFGExUpS0k0yE@yilunxu-OptiPlex-7050>
 <fb783b51-d5cb-c2ae-9d26-11df39e40aa8@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb783b51-d5cb-c2ae-9d26-11df39e40aa8@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_234350_827003_61BD08FC 
X-CRM114-Status: GOOD (  32.21  )
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

> > What if we re-program the 2 FPGAs at the same time? Is there still
> > chance the 2 CS lines are all asserted? Can they be correctly
> > re-programmed in this case?
> 
> In the FPGA layer, yes. Each FPGA is its own fpga_manager with its own
> CSI_B, and the only lock the core offers is mgr->ref_mutex, which
> fpga_mgr_lock() takes per manager. Nothing there serializes two managers
> that share one SelectMAP port, so both CS lines can be asserted at the
> same time and then both devices take both bitstreams.
> 
> But one layer higher, the only in-tree trigger for a SelectMAP device is
> of_fpga_region_notify() calling fpga_region_program_fpga(), and
> of_overlay_fdt_apply() holds of_overlay_phandle_mutex from beginning to
> end, so two overlay applications cannot overlap, if I see this correct.
> 
> I would rather keep this out of this patch.

Yes, that's the way to go.

> 
> If you want it handled, I can prepare a follow up patch, and it seems to
> me this can be done with a simple mutex in this driver around the write
> transfer in xilinx_selectmap_write(), with one lock for all ports.

"one lock for all ports" is still illogical to me. The FPGAs on
different ports won't interfere each other, is it?

> 
> The port does not have to be held for a whole bitstream, as documentation
> says, that SelectMAP takes the configuration data non-continuously, with
> CSI_B deasserted in between, so serializing single transfers already lets
> two devices be programmed at the same time with each one seeing only its
> own data.
> 
> Should I send such a patch? And if yes, as a follow up to a v5 version of
> this patch?
> 
> Or add both patches into a v5 series?

No, fix the existing problem. 2 FPGAs are another topic.

> 
> I am fine with both ...
> 
> > I mean I think this patch does fix the problem of "always assertion",
> > which is good to me. But the changelog seems stop me, it talks all about
> > 2 FPGAs sharing the same bus, which seems more complex than just
> > manipulating the CS.
> 
> Agreed. The two FPGAs are how I ran into this, not what the patch is
> about.
> 
> So next proposal for the commit message is:
> """
> fpga: xilinx-selectmap: control CSI_B and RDWR_B during configuration
> 
> The driver requests the optional CSI_B and RDWR_B GPIOs with
> GPIOD_OUT_HIGH and never touches them again. That flag carries a
> logical value, so both signals end up asserted from probe on, whatever
> polarity the device tree states, and they stay asserted for the
> lifetime of the device.
> 
> Neither signal belongs to the driver's lifetime. CSI_B (Chip Select)
> selects the device on the SelectMAP port, RDWR_B (Read/Write) selects
> the transfer direction, so both belong to the data transfer. A device
> that is never deselected never lets go of the port, and a port pinned
> to write mode cannot be read back.
> 
> Keep the two descriptors in the driver private data, request them
> deasserted, and assert them only around the configuration data
> transfer. RDWR_B is asserted first as UG570, note 4 of figure "Continuous
> x8 SelectMAP Data Loading", warns that changing it while the device is
> selected causes an ABORT on the next CCLK.
> """
> 
> If fine for you I can send v5, with no code changes, just some
> comment changes as discussed.

Good to me.


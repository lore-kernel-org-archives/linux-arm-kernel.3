Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2A0D26292
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:From:Date:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDR+lA7eIftXSNxJvI7Q8Wnh5pZEjUMDFJmEy+cTTPI=; b=tkzZwlkIo5zkY0Fb5eOhZKlZAE
	VP2wb5mPpSE5wSAoR6KA/pubjpRSpO/gLCJy0Nt7C9zSUINQRRgl/OVviK4wMEnspyGLHP6BF6dgF
	gvfpg0YWngMU+tdiP3824PCf+MzTrfopLAofthtR0eZxtfY1SsKyzPrFOvpRQi5ydP2y/7IKJYMqN
	04eUIrRgyb5F8YbWzRElHiGhluEvevLPck1jQK9wz78t5lxjp+fPPNc5WiPTwYGQGx9c1TikwZ+Qr
	gO+g/JAmzHjHuhRYvD2zU/mlx/3HjBgrbi/+Xx7lOVMrYZOwHhD9zx4xbVZ7DBhBFSAW2lpeuy/cJ
	KQkTRAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHV3-00000004NQz-3X9v;
	Tue, 20 Jan 2026 19:34:49 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHV0-00000004NQc-3uLC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 19:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768937687; x=1800473687;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=2OP2gYd8gP3arfac+WIk0FTl7PjIcKNcOVBnLH+gvvo=;
  b=I9YgQemahMnLKuB32nEIsQsC6WbuFzR7xNFGozTEIE2kb0O2p6oaQkZt
   1SlVkMQEGyWmLkVTf8vnnOX2JJxbRqZ8ks98UPZD8HrOa2ibO2OMYjOmT
   x5Eh5UTqUezp1TWyM5XMMrmQFlh4AwoHG8W081v1euhQubP8AA+WtFNOm
   1Y+FXrSma6j4pQqtOm9uJ1vrQgFAsXYXE6z8ydGBi7kn7rpFiHLRPOPK0
   o/SjP3co9mUIN7+rFERee0IcynNCIRIDAZEzOEqqnnhYQDT59LIAYmNik
   Lc8xPAZ6E3k6J4ZKpBLh2JUV41yshE0T7+Lkzgi/64EnjRlnuf8dRL7al
   g==;
X-CSE-ConnectionGUID: sWGl8J39RY2Fkz3FZ3pwUg==
X-CSE-MsgGUID: 56oI6jhaR/CLmMuGyzyKsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81532125"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="81532125"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 11:34:46 -0800
X-CSE-ConnectionGUID: u5dlNYZSRJm5gQg+qwh5qQ==
X-CSE-MsgGUID: YbCma+iYTcqDUDNpphyrSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206630531"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jan 2026 11:34:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8632295; Tue, 20 Jan 2026 20:34:42 +0100 (CET)
Date: Tue, 20 Jan 2026 20:34:42 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <aW_Y0h7RNsN12H7H@black.igk.intel.com>
References: <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
 <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
 <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
 <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <aW9JihlsjnJ-uBul@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9JihlsjnJ-uBul@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_113447_036913_8D490E4E 
X-CRM114-Status: GOOD (  57.73  )
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

+Cc: Rafael

On Tue, Jan 20, 2026 at 10:23:22AM +0100, Andy Shevchenko wrote:
> On Mon, Jan 19, 2026 at 07:56:57PM +0000, Mark Brown wrote:
> > On Mon, Jan 19, 2026 at 08:17:46PM +0100, Michal Simek wrote:
> > > On 1/19/26 20:01, Mark Brown wrote:
> > > > On Mon, Jan 19, 2026 at 07:52:35PM +0100, Michal Simek wrote:
> 
> > > > > Is it a better way to use auxiliary bus as was recommended by Greg in past
> > > > > on drivers/misc/keba/cp500.c review?
> > > > > https://lore.kernel.org/linux-i2c/2024060203-impeding-curing-e6cd@gregkh/
> > 
> > > > The driver there appears to be doing runtime enumeration based on some
> > > > EEPROMs on the system and creating platform devices based on what it
> > > > finds there so it's a bit of a different thing, the aux bus suggestion
> > > > is about what the code that does with the data it got from the EEPROM.
> > > > This patch is for something described directly by firmware so there's no
> > > > way we'd create an aux device, that's purely in kernel.
> > 
> > > I don't thing it is actually eeprom because in fpga you can place at certain
> > > location just memory (or RO memory) to describe what it is inside.
> > 
> > The table of per module I2C EEPROM devices (there's a whole pile flagged
> > as optional) sure does look like it, and it's a very standard way to
> > implement hardware enumeration of non-enumerable systems.
> > 
> > > If you know it I think you have multiple options how to wire existing drivers.
> > 
> > > 1. ACPI - which is what this series is trying to do
> > 
> > Is it?  It just looks like random cleanups.  We've got a change to make
> > interrupts optional and this change to device properties - the cover
> > letter just says it's a transition to device property but there's no
> > indiciation why it's being done.  The cover letter for the series just
> > says it's switching to device properties with no further explanation.
> > It looks like a "that's the newer API" thing than something that's been
> > thought through.
> > 
> > None of this looks like something intended to add ACPI bindings,
> > it's not clear to me how we'd even get the device instantiated on a
> > normal ACPI system.  There's no ACPI IDs defined (and there aren't any
> > existing ones), just a conversion of the property parsing code.
> 
> For the matter of this change, the only thing that can be preferred in ACPI is
> to have the real ID, id est ACPI _HID (allocated by the vendor, namely Xilix).
> So, ideally at the end it should be enumerated by ACPI ID table with properly
> allocated HID and not with the compatible line.
> 
> The compatible line is for prototyping and DIY (discrete components, like
> small temperature sensors, when allocating proper ACPI ID is a big deal
> for a vendor).
> 
> The set of _DSD properties is okay to be shared even in that case.
> 
> TL;DR: We prefer ACPI HID to be properly allocated and used, or explained
> why it can't be feasible (which I don't believe the case for Xilinx).
> 
> > > 2. DT - on x86 not sure if feasible
> > 
> > No, x86 decided not to use DT and shoehorn everything into APCI (and the
> > x86 SoCs put their platform devices behind fake PCI that looks like PCI
> > to the OS).
> 
> There are three platforms in the past that used DT on x86.
> Latest one was dated ca. 2017 (SpreadTrum SoC with x86 core in it).
> 
> DT on x86 is a real thing, but very niche.
> 
> > > 3. platform drivers - as described above by Greg not an option on PCIe
> > > 4. aux bus - for example keba drivers
> > > 5. dfl - drivers/fpga/dfl* - used for accelerators.
> > 
> > These are orthogonal to the above, they're Linux internal things not a
> > concept the firmware has.  You have firmware descriptions of things that
> > can be mapped onto platform devices but that's a separate thing.
> > 
> > > Pretty much all current Xilinx drivers for soft IPs (spi, i2c, uarts,
> > > watchdogs, etc) are platform drivers (more OF drivers because platform data
> > > are mostly not used).
> > 
> > > It means I think would be good to get any recommendation which way to go.
> > 
> > You should use whatever firmware interface is sensible for the platform,
> > if that's x86 that's always ACPI.  For other architectures there's a
> > split with servers using ACPI and more embedded platforms using DT.
> > 
> > > > I have no idea what the hardware this series targets is (other than that
> > > > it's using a FPGA) or if there's even a motivation for the change other
> > > > than code inspection.
> > 
> > > I think all these cases are very similar. You have x86 with pcie root port
> > > which is connected directly (or via pcie slot) to fpga. In fpga you have
> > > pcie endpoint HW which connects other IPs sitting on AXI.
> > 
> > What are "all these cases"?  For something connected via PCI I would
> > expect a PCI driver that knows via some mechanism what's connected to it
> > and then instantiates the IPs, probably as aux devices.  I would not
> > expect to see the contents of the PCI device described in firmware at
> > all, that's a big goal with using PCI.  If something is not connected
> > via PCI that's obviously not going to fly but it sounds like you're only
> > interested in PCI cases here.

-- 
With Best Regards,
Andy Shevchenko




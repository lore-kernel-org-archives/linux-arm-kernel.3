Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED1CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnH/wGOWdmEeRBdfZjCbfX7MQj2i70UkDsWT6n1REh0=; b=McUb1Ge5eB9CiCCt5zTt0steK/
	b42Y91fAQpShwuhHaH1mEbbpB/BFaAFbH7pvXyCH3M2Pwfep/2uZirze09KWlol6JBEfGVr66LAUT
	w8wFZXmreIUcfwMC+3nlQy22x5UeDryKmegDyGxpSwHiMX8RMRdaZ+0zsJCIo0djURQlq8IFZQ3hp
	PYosmKa3VZpfRQf1HlHgUKzrdCMUF1zEaBa9XycF++Rx7lt8aGqL8QIZB4MkZbSVQBMdCoMFYG1tQ
	OllN1YcQEfxPvpQ8HdsC0GUVxPkQlFGxc8NEHJ0wfIAFJdSndLlNl9WFrahZTL9iIFL6DG0k6RT0z
	yoM2nE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uJg-0000000DmRA-1hWc;
	Thu, 24 Apr 2025 11:00:28 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tTm-0000000Dc3p-0KOj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745489210; x=1777025210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ohWISbUI5Hdqkvh3YTzjrPdr0SXkU3j2Fcx45MwThg8=;
  b=L8QE8MTVH3cx/fXphdVDU5Ipta3aV3gJVPY+cIWm/g99p6LLZMbj50fo
   /yN5VoHQljWE3B7ZMtRQ4X0WvjHyFGWXyrvPAhhkbQIyGFVPvFr/ZSU4v
   hJxC8wT4nQf/QgLAIh3mrNMx+N/WrlAFUeDEcpBDe1pGrmRME2NcTW4lA
   NACU8nlMHddkP5mQtW5vjgngZ1hesqzugJcn5p/p0whM1Pz212VWEM4Ga
   cW63ZhmzEDa9dgk+WbGF8qFeuM65De+oUSR4ZwqmzmBT1Ky5q06YEN+PE
   UryhGts17kDJC0KS28E/l4eAMkfyWlkuipOuyI+npcqrNKTQbdIpGhUmE
   A==;
X-CSE-ConnectionGUID: Mip5D6N6SrmqLH+WoGT5dQ==
X-CSE-MsgGUID: fNrsBvlrTXa1Z5QOGFuV9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46821427"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="46821427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:06:44 -0700
X-CSE-ConnectionGUID: M87gWBuhQQW769P5s2kxjA==
X-CSE-MsgGUID: 8NT3xrSgTm60P/0pBA820Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="169788122"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa001.jf.intel.com with ESMTP; 24 Apr 2025 03:06:40 -0700
Date: Thu, 24 Apr 2025 18:02:05 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Sam Winchenbach <sam.winchenbach@framepointer.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	mdf@kernel.org, hao.wu@intel.com, yilun.xu@intel.com,
	trix@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com,
	linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sam Winchenbach <swinchenbach@arka.org>
Subject: Re: [PATCH 1/2] dt-bindings: fpga: zynq: Document ICAP on boot
Message-ID: <aAoMHV4cPrMWPHNk@yilunxu-OptiPlex-7050>
References: <20250328141944.119504-1-sam.winchenbach@framepointer.org>
 <02496a88-3d9c-49ee-93ab-8f1400fc0c6b@kernel.org>
 <p4bujnmgkcvsu4qipmgh2j2loedepmwgp7zlaxrurhaveb6tbc@ibqtbjnbzdzj>
 <14b12882-119d-4c24-9634-e4cc37a39212@kernel.org>
 <2ccsnpv67gsu354uo7xe7syrxs265ncj6hl26v3cwf2dfm7hyu@ihkemyajuiag>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ccsnpv67gsu354uo7xe7syrxs265ncj6hl26v3cwf2dfm7hyu@ihkemyajuiag>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030650_170287_2429E15D 
X-CRM114-Status: GOOD (  36.23  )
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

On Mon, Mar 31, 2025 at 09:07:03AM -0400, Sam Winchenbach wrote:
> On Mon, Mar 31, 2025 at 02:43:59PM +0200, Krzysztof Kozlowski wrote:
> > On 31/03/2025 14:30, Sam Winchenbach wrote:
> > >>
> > >>> +    type: boolean
> > >>> +    description: If present, the ICAP controller will be enabled when
> > >>> +      the driver probes. This is useful if the fabric is loaded
> > >>> +      during the boot process and contains a core, such as the SEM,
> > >>
> > >> I don't get how this is suitable for DT. If you decide to load the
> > >> fabric from driver, that's driver decision so not DT.
> > > 
> > > Before writing the fabric to the FPGA the driver disables the ICAP, enabling
> > > the PCAP. Once writing is complete it unconditionally disables the PCAP,
> > > enabling the ICAP. This patch just makes it so, depending on the use case,
> > > the ICAP can be enabled at boot. This will not prevent the system from being
> > > able to load a fabric through the driver. I added in this boolean so existing
> > > behavior would be maintained.
> > > 
> > > Do you recommend another approach such as writing to a sysfs attribute to
> > > switch from PCAP to ICAP?
> > Not sure yet. Can't you check the status of ICAP before programming and
> > then enable it only if was enabled before?
> 
> I am having a bit of difficulty understanding this so let's talk about cases
> where the ICAP is enabled/disabled -
> 
> 1. When writing the fabric from the driver
>    In this situation it might make sense to read the state of the ICAP
>    interface when preparing the fabric, before enabling PCAP. When the write
>    completes you could re-enable the ICAP if it was previously enabled.
> 
>    This might be outside the scope of this change - and I am not comfortable
>    enough with this use-case to understand potential side effects from doing
>    this. Logically it makes sense, but there may be a very specific reason that
>    the ICAP must be enabled after doing a fabric load or partial
>    reconfiguration.
> 
> 2. When the FPGA driver loads and is probed by the DTS
>    In this situation, which is covered by this patch, the FPGA is loaded by
>    BootROM/FSBL but contains functionality that requires the ICAP. Unless the
>    user has made modifications to the FSBL or 3rd stage bootloader there is no
>    clear way to enable the ICAP interface. Checking to see if it had been

I don't think this should be a property for fpga_mgr device. It is for
FPGA reprogramming. You insmod the reprograming driver not for
reprogramming, just to enable the already programmed functionality.

My idea is, to load the fpga_region with an image tagged "external-fpga-config".

Thanks,
Yilun

>    enabled prior to loading this driver does not (in my opinion) make a lot of
>    sense here.
> 
>    Perhaps the name of the DTS is confusing? The suffix '-on-load' was meant to
>    indicate when the driver was loaded, not the fabric. Would the suffix
>    '-on-probe' be more clear?
> 
> Let me know your thoughts,
> -Sam
> 
> >
> > Best regards,
> > Krzysztof
> 


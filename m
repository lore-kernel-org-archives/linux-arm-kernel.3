Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B474CC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0o6BbyNMieHY+nTPlSXoikbKBcKiXxBXsauusDrJ23E=; b=c9BTcC2qhOpCoxsqjtLOwDMbWw
	IUnBtVeQWEs6MVtyHmYna/UGJahJ7SA1BSDy7Vde0HSIQbCBcoCcaG4FQjlNO3Z/RpyAOqfd1MY5I
	FD7ps4FreCjWHuGsVzURtqcSe5+0sSWrmgAJFDKfyr5aATHkVRDsW21De8h3udF3hspoaF4xMoT1C
	o6/jT2WsjXq6gj2StF8ImcGtb+LZhLAsUcvWY0QNOLwOP3MIlIMgOAIKS4OFcG3yrH/lqblseRmnt
	MGLGBPmVjMmF0BzrCph22y3WsbHAgg8jHVBWluIjhjyc2yMqWUc+AXQ600Z5SBehh/pjufDmW12dn
	4KVEbHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WkF-0000000DOld-0zOT;
	Thu, 10 Sep 2026 04:50:43 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WkB-0000000DOku-3BHi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789015840; x=1820551840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=27sjqAX3mzIarYqMVpWaoeAe05sB9malX0xlN8XrmvM=;
  b=DiZ2zkPwqz+zGilyQS+Kf/ab0503v15opZ5FWPIOWN0G3pf7PiqIXh5c
   1sZBtCBQnAr3UH/ivOn4SpFQ8NZHN8P+nTQ9ROjyKfTTuYslHXD7MPCsX
   lPKAxwqSnDW7ZSDcvVlefxNwdquS9BsV8RVIVCu2UDEyBuvkJdMb6izCh
   tpEBYwpzBalMl042XMNNPcx5vl6FOpkslloP+xv91r/qlpJAlqiaH6lql
   30DhiPrygUaAUiWLG2Kfls6O+wfz99MVxaCe5L/Um4lZS1VLkuSnbG08X
   d6yRM6fsQelCr1vL2PVLd4xTIEFeSYGe05NJ/1uCjmU0kuHY/EnqKFN3G
   w==;
X-CSE-ConnectionGUID: ApGysfthSoyZZTE84j8eSQ==
X-CSE-MsgGUID: DHeb07pDRl2TRBw40pUeMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100621091"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="100621091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 21:50:39 -0700
X-CSE-ConnectionGUID: t3yLjyHCRoasgCwgzmWvog==
X-CSE-MsgGUID: u1n+qZFcRfqsUdFaiUs8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="268257232"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2026 21:50:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 999D699; Thu, 10 Sep 2026 06:50:33 +0200 (CEST)
Date: Thu, 10 Sep 2026 06:50:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
Message-ID: <20260910045033.GN106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
 <20260909060615.GJ106095@black.igk.intel.com>
 <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_215039_867845_7CB8A190 
X-CRM114-Status: GOOD (  21.42  )
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

Hi,

On Wed, Sep 09, 2026 at 05:20:35PM +0200, Sven Peter wrote:
> Hi,
> 
> On 09.09.26 08:06, Mika Westerberg wrote:
> 
> [...]
> 
> > 
> > If it is possible, I suggest to use the same way we do in ACPI side here:
> > 
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
> > 
> > It was specifically designed so that it should support DT as well (that's
> > why it uses the device properties _DSD).
> 
> Oh, nice, I didn't know those existed. Konrad already has a PR open to add
> these to dt-schema [1] and a PR that already makes use of these for dwc3
> [2].

Great.

> I can just write generic code similar to the ACPI one then to add the device
> links and split it off from this series, though I think that dt-schema PR
> must be merged before we're allowed to use that representation.
> I'll adjust the dt-bindings here for v3 to just drop the representation as
> OF ports/endpoints as well.
> For the PCIe/DP tunnel notifications I should be able to use the same
> representation, possibly with an additional usb4-adapter-index property or
> similar to differentiate between the two DP IN adapters, once I get to that
> then.

For PCIe yes, for DP you should not need those at all.


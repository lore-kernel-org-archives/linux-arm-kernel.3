Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C912D262A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36zTzon9oUVK/nuiPMa7vnryNd3MX66gD0YjlfD2MdI=; b=aV7e03CSlksiQ+gbCaqkDsQSdj
	aebFPDQUeRo2beGyQMP8PeVmazIXRPflHmrEwwLGZYtTVhQ7KRRY4bQD5wfT/6FlEi1opkkE9WH4h
	1pmgxwA1YPqR/N/6WpC7Py7HDekJLqMz16yNdLm+ycdIEGMJhakpaayOR62D1gY3MmwD8VHXKex4d
	22UAaG0jMadTF084DXr+ULuI6J+A/g7ssvam1ENSSJX1CtYy6AJ0JhBboJ+mZcL9+0ks8PN10uk2Q
	ItpYYTDE+B27qD2Ib8K+g9buqaZqywiRgjlejq+14R6SeUOH1JqQt/j43LrArUHjEqHppBBRCKao9
	s7QGXEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJHR-00000004UNe-48jn;
	Tue, 20 Jan 2026 21:28:54 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJHP-00000004UNI-1Huk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 21:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768944531; x=1800480531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VAkJ/KITOoPPwFJHwdAoEzuCuhXukFgLDyfcXhDmS98=;
  b=QY3iLTOeTi1j5zzbb7/Q/qN4jRpBINcd++KfRco4NybEMpOFSXnaIWLp
   UpThdhE3EZBh5l0C8GJh1p+JD1K9o3sJH/TqZ77CESHzjlm/QHozU7B2J
   LeVWZo/cbit++x3+XZJEFUUZJZXO5T5Xa054sD67vVyPqO0EvaFyI++qP
   yyWnpvX+AYwUxCK1GLaxHDvSdYzQxIwq0n9Crm4Xk1TQH4gJItV2dT0n7
   Cose02Js5LHM3Afq1+9qLdBXzat/GFSo/7HO4aRKIYGoORO0T6cp8ZiVl
   FbkFJIehqbLAJk4Itay4FLKWe3gc3Xs2OPrknG+2GXNmeoeo8kQaUkfx5
   A==;
X-CSE-ConnectionGUID: VJ2FgXDoSKeN9IG8lXUX3w==
X-CSE-MsgGUID: XnwUJhoVQ+WNQJtNzvPryQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70257759"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70257759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:28:50 -0800
X-CSE-ConnectionGUID: dAWGnrmlTsS7OPsMmnwgMA==
X-CSE-MsgGUID: ipFP5vVHQK6X3ee9IwH9Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206477213"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.240])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:28:47 -0800
Date: Tue, 20 Jan 2026 23:28:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Michal Simek <michal.simek@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <aW_zjaRLtewa_NV1@smile.fi.intel.com>
References: <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
 <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
 <BF71A04E-7FFB-42D1-8C8D-6FD13415EED5@nexthop.ai>
 <c3fc04a4-4b09-4c6a-a0f1-e5aa92a22976@sirena.org.uk>
 <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
 <817bcc43-7f10-4329-8924-6c375eb73ff2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <817bcc43-7f10-4329-8924-6c375eb73ff2@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_132851_363416_48F46EB8 
X-CRM114-Status: GOOD (  30.43  )
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

On Tue, Jan 20, 2026 at 09:04:58PM +0000, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:11:44AM -0800, Abdurrahman Hussain wrote:
> > > On Jan 20, 2026, at 10:45 AM, Mark Brown <broonie@kernel.org> wrote:
> > > On Mon, Jan 19, 2026 at 04:20:06PM -0800, Abdurrahman Hussain wrote:
> 
> Let me once more renew my plea:
> 
> > > To repeat once again:
> 
> > > | Please fix your mail client to word wrap within paragraphs at something
> > > | substantially less than 80 columns.  Doing this makes your messages much
> > > | easier to read and reply to.
> 
> > > To drivers that are used on ACPI systems, yes.  Many devices wouldn't be
> > > used on ACPI systems, or would be expected to be exposed differently
> > > (for example, hidden behind AML).
> 
> > This is not for a normal off the shelf server. In our case we are building an embedded
> > switch with an AMD CPU and Xilinx FPGAs that happens to use EDK2 based BIOS and ACPI.
> 
> Sure, AFAICT it's mostly a PCI card with a bunch of stuff on it from a
> software point of view.
> 
> > >> I am just trying to get this 2-line small change merged so we can start using the standard spi-xilinx driver today. I am not trying to boil the ocean.
> 
> > > I mean, adding a HID wouldn't take substantially more code.
> 
> > We could, but we don’t own the Xilinx IP blocks. Are we not justified in using PRP0001
> > hack until the driver owner adds the HIDs? Wasn’t PRP0001 created as an escape hatch for
> > these kind of scenarios?
> 
> No, it's more there for the cases where embedded ACPI systems need to
> import non-trivial DT bindings so they can avoid having to respecify
> things that ACPI really doesn't cope with or for local hacks.  See
> Andy's reply earlier in the thread:
> 
>    https://lore.kernel.org/r/aW9JihlsjnJ-uBul@black.igk.intel.com
> 
> AFAICT for ACPI the HID assigment is a bit of a free for all in practice
> - board vendors generally seem perfectly happy to just pick something if
> the silicon vendor didn't do something.  Just look at all the parts with
> INTxxxx IDs!  That said Michal is on the thread so hopefully that's not

INTxxxx was a (historical) mistake, but look at the correct one INTCxxxx
which has listed several components Intel doesn't own. Because ACPI HID
it's not only about the component in use, it's also about integration of
that component in the platform environment. Hence it might require (platform)
specific quirks.

> an issue and we can get something from Xilinx fairly easily.

Exactly! Either from them, or AMD can do, or even NextHop.AI.
If you have not yet registered vendor ID, it's pretty much
straightforward process.

Here is the pointer for your convenience:
https://uefi.org/PNP_ACPI_Registry

-- 
With Best Regards,
Andy Shevchenko




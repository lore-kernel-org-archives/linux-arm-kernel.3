Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0547D262A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 21:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKX0ISpo8MrowFxyj0yZu/v5Bkf/1Va/P961EsU+TkI=; b=RzzRXRJ4BZMO19X8RP9vua/xIv
	zRdEocNZ+YDfzGQF2sVPsAG2HEE3czyVoJrWjgRhSzctjHxjjeUgFEzi8XEaS3a03nGyQ75D/lOl4
	Rn1h18XikQLik/Qxh1dQMisn0FQXdE5CgV4e7deFHSK7O1LwpNXP8TAfZpLsqR6FyCYRdoinNOTJw
	Mo0XBSw1PejBTrOsb9u+vbJ2P4WpjhfA8KwlpnGvRvBmMU4vlU3doz9+OZWFD+184Mf2c8udWI/Jm
	xzXd5EwAEUaJkeElmeVU2kbtlbbhwdKPHR3hgttsTgBBTdwH6gFo+IwplBr7UnMCzo7mhzHmuBt3i
	MPbSPJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJQl-00000004UeA-0LXt;
	Tue, 20 Jan 2026 21:38:31 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJQh-00000004Udp-3igR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 21:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768945108; x=1800481108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CT6zt3Dtq5dxWE4pQyre7nUMsP7URChsL+MVv8cGisY=;
  b=lQVA7v3qllw3SXtfioFE8rsrovlT4Y137/MMR/l/n30q1tKDtND+jq9W
   wDRfgSiEXQBJmNEbHR/SFe+enYaQIp0UPLpzYg8bjjoR+z2mIclsraeuB
   rWQLR8q7fuft/NDseJozfduZOjF7Ef7+e2nTRlhCiEo/l1iN2343HMbCY
   3nenOQB4KHuXgmyj18XRXAdA0TD6Lxk8a+4T1mFtdo7Ql5Lw3Vjl57gQw
   5g+Jx81p+vJi2VK9Q0TA5Y4sO3+e2g1NzKWQI076ZixQcU/QJQt1b8eCp
   urmPlRjfnYml4Ykm8w/EAgPoU06IcLcpO9NmRJhp6xSxk/l/iHg5rckLV
   g==;
X-CSE-ConnectionGUID: a8l6U231ST2eQZrVzLTgYg==
X-CSE-MsgGUID: 4JJ5lMgTRR+mmU/5D5ubsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74034180"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="74034180"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:38:27 -0800
X-CSE-ConnectionGUID: qdantrLwSeeMgjF7htm/+g==
X-CSE-MsgGUID: FI1WJXHwTC2cKZFbtBadXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="210686552"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.240])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:38:24 -0800
Date: Tue, 20 Jan 2026 23:38:22 +0200
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
Message-ID: <aW_1zlEdaPNwiXuI@smile.fi.intel.com>
References: <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
 <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
 <BF71A04E-7FFB-42D1-8C8D-6FD13415EED5@nexthop.ai>
 <c3fc04a4-4b09-4c6a-a0f1-e5aa92a22976@sirena.org.uk>
 <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
 <817bcc43-7f10-4329-8924-6c375eb73ff2@sirena.org.uk>
 <aW_zjaRLtewa_NV1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW_zjaRLtewa_NV1@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_133827_941616_FC317C50 
X-CRM114-Status: GOOD (  36.80  )
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

On Tue, Jan 20, 2026 at 11:28:50PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 20, 2026 at 09:04:58PM +0000, Mark Brown wrote:
> > On Tue, Jan 20, 2026 at 11:11:44AM -0800, Abdurrahman Hussain wrote:
> > > > On Jan 20, 2026, at 10:45 AM, Mark Brown <broonie@kernel.org> wrote:
> > > > On Mon, Jan 19, 2026 at 04:20:06PM -0800, Abdurrahman Hussain wrote:
> > 
> > Let me once more renew my plea:
> > 
> > > > To repeat once again:
> > 
> > > > | Please fix your mail client to word wrap within paragraphs at something
> > > > | substantially less than 80 columns.  Doing this makes your messages much
> > > > | easier to read and reply to.
> > 
> > > > To drivers that are used on ACPI systems, yes.  Many devices wouldn't be
> > > > used on ACPI systems, or would be expected to be exposed differently
> > > > (for example, hidden behind AML).
> > 
> > > This is not for a normal off the shelf server. In our case we are building an embedded
> > > switch with an AMD CPU and Xilinx FPGAs that happens to use EDK2 based BIOS and ACPI.
> > 
> > Sure, AFAICT it's mostly a PCI card with a bunch of stuff on it from a
> > software point of view.
> > 
> > > >> I am just trying to get this 2-line small change merged so we can start using the standard spi-xilinx driver today. I am not trying to boil the ocean.
> > 
> > > > I mean, adding a HID wouldn't take substantially more code.
> > 
> > > We could, but we don’t own the Xilinx IP blocks. Are we not justified in using PRP0001
> > > hack until the driver owner adds the HIDs? Wasn’t PRP0001 created as an escape hatch for
> > > these kind of scenarios?
> > 
> > No, it's more there for the cases where embedded ACPI systems need to
> > import non-trivial DT bindings so they can avoid having to respecify
> > things that ACPI really doesn't cope with or for local hacks.  See
> > Andy's reply earlier in the thread:
> > 
> >    https://lore.kernel.org/r/aW9JihlsjnJ-uBul@black.igk.intel.com
> > 
> > AFAICT for ACPI the HID assigment is a bit of a free for all in practice
> > - board vendors generally seem perfectly happy to just pick something if
> > the silicon vendor didn't do something.  Just look at all the parts with
> > INTxxxx IDs!  That said Michal is on the thread so hopefully that's not
> 
> INTxxxx was a (historical) mistake, but look at the correct one INTCxxxx
> which has listed several components Intel doesn't own. Because ACPI HID
> it's not only about the component in use, it's also about integration of
> that component in the platform environment. Hence it might require (platform)
> specific quirks.

Btw, you can look at the MIPI I3C HCI case. MIPI as an owner allocated generic
ID (which is usually represented as _CID in ACPI), AMD allocated their own one
_HID (compatible with _CID) exactly for the purpose of having platform quirks.

TL;DR: if you are 100% sure you have no HW integration issues, requirements, etc
and everything works as is, you can use Xilinx allocated id (assuming it will come)
for the given IP and use it directly as _HID, otherwise use that as _CID and
allocate your own for _HID.

> > an issue and we can get something from Xilinx fairly easily.
> 
> Exactly! Either from them, or AMD can do, or even NextHop.AI.
> If you have not yet registered vendor ID, it's pretty much
> straightforward process.
> 
> Here is the pointer for your convenience:
> https://uefi.org/PNP_ACPI_Registry

-- 
With Best Regards,
Andy Shevchenko




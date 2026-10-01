Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E55DCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4zlnr8mVMCGsGC8oDdAeCbX7QuuY0GIRHnY0XmWliU=; b=1O/VKvWLa7TlFUDWNfFOutH9k7
	b8SRfXKEojr/jljVQtOoKSO47DcH+oUfF1cvNjT8cY0jYJ8u2fRwD97tX3OKh2PdNKRZEMRjCzprH
	lx/iTtMzi0q3k7WE3cLdOPMOjWRj/GJQlExIA561Ak/PlWF7l5RW5LcFxxxSAHzg0ZDRSAyQ8jGzS
	VNc3WLX0Q2rKr9qZT1ua1CM2rcLe4+DNdgXlhQXvBvKGM69CIX1UbyDSVWR2wpidIQZGbZhrurA9e
	OGL2PyT2RD7r6POipKoD+v93C9GfXRzpWN867j7vR1CKkQKYMIsxMWyodtFSu4ltI4YgkY3wbb0ZP
	8HSPm5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLQG-00000009ytI-1xDF;
	Thu, 01 Oct 2026 18:22:24 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLQC-00000009ysa-3zgF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 18:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790878941; x=1822414941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y94ugADCjd5S4s4n0Tg88CMgCId4+Gj9yqv40QY1BOI=;
  b=TOel4ohlXv5EOmvI6Bs3QpLWZEIBwlOcFFtUWnYfdBPcUSNl4VHsE045
   Hq6oc7o2kGN06xw0QpTqGoxL7Gcqups/415t1KOA/h+iFX2TZoSnvhY9J
   GtKNJgJRPP06K9gISn26i9TchEmOkgZWsTYT4EWwwfh4u0A0IwW2m+g2c
   fAE0jC0sG8RxOnogYvSjfnYxNxBxTocCzDRLbUa8aU3yCY//lX6l7AllY
   PSdTMw5nfPjbFyfMdjEgB47kNbEIUEDAul+WaIyOv5oP15/Jcv1swzdkQ
   QwuPtzFEkM0fipHX2HgphkwflW1BZbeZvSrzP05H3Sm+fhR8d1ehHUieT
   Q==;
X-CSE-ConnectionGUID: 1/n8VuDNTZyW67BHYjFESw==
X-CSE-MsgGUID: keZCTxaGQhWy9S3mH1J3cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90704763"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90704763"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:22:20 -0700
X-CSE-ConnectionGUID: L5g60cWbRa2/8tjijxT4Ww==
X-CSE-MsgGUID: StWR2umvRNqgnHBGcd2t7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302298846"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:22:14 -0700
Date: Thu, 1 Oct 2026 21:22:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
Subject: Re: [PATCH v2 0/5] ACPI: Replace acpi_get_first_physical_node() with
 acpi_bus_get_primary_device()
Message-ID: <ar6k1MMzNDTbdLvO@ashevche-desk.local>
References: <4766532.LvFx2qVVIh@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4766532.LvFx2qVVIh@rafael.j.wysocki>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_112221_034675_E1E3FD76 
X-CRM114-Status: GOOD (  14.34  )
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

On Wed, Sep 30, 2026 at 08:30:47PM +0200, Rafael J. Wysocki wrote:
> Hi All,
> 
> This is a partial resend of
> 
> https://lore.kernel.org/linux-acpi/7995179.EvYhyI6sBW@rafael.j.wysocki/
> 
> that only includes patches that have not been ACKed and the last one that
> depends on all of the others.  It is based on linux-next.
> 
> This series replaces acpi_get_first_physical_node(), which is inherently racy
> and therefore generally unsafe to use, with acpi_bus_get_primary_device(), that
> doesn't have this problem, everywhere in the code.
> 
> I will appreciate ACKs from maintainers of the code updated by the patches, so
> I can pick them up and get rid of the problematic interface in one go.

The whole lot is straightforward,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




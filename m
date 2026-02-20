Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC43C53216
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQmVqCcq47P/YL5WFkxAGQdcQWmE6yXoLN/mGx/s3mg=; b=p9vldqpdMnxHNyagMDNyHUN3wr
	qRbKDoLi65hQxW4f0NUUppF0eTIB9x/vG3Yt9vwyH2QipwZb/oz60Znya70wE9I6zvxLw3WceHQdn
	CV9DVKlKMXSzWPg+zi6kiMfzSfJk3vqb4MvtziAToGODq9rdzp5XhcJgb1G0p+NNb0Q6ED5wVuZ8A
	mkGZQqgq1F+e6a7gPkJnB9zzu211/e8f4u/+R+BCf20bWugBY0Q9obTiKFSVzXIz2d6dnhSXb5LJp
	2PgvZabYeFgcpD26KqxrAQCAXB+Fu6G2nF1rIxSPkuGQNJz/nfE9FS0boXZFofzKPX+yC8oY6xL3e
	jHRQjhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLJz-0000000DNAb-1K5E;
	Fri, 20 Feb 2026 07:53:07 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLJw-0000000DNA8-1v1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 07:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771573985; x=1803109985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ry/SqBO4nEjBTGtqR5qvz+4VWZF+KIABLUZY2fBztRw=;
  b=fTxNRW/yxz5vBBw40zbaAN2dqAEviT6RcUKkubDpcDR/EkrGxurLAQiJ
   eE/CTVsVjRVIl7UXREXR6SwRyVcK891MF7GX043gIn5o3bqnUvU8n3km6
   snBWIx2XW47t9o2K8ROMEHLPOETfXGCAKcnFGUzLX6LSvyA4wWAIBojEJ
   +FpOaJY48Pdag2WRC6RE63EbFiog3bKV8ssrk5nBAizhozFx1hlkHZTrH
   i1iPDVyn8RdaZfEEV2UeN208nK1Mt6hAy0ZLXSpYC19Ntws7d8YsPJOm+
   BxDRXlCH+vbnqI3jI4YfDJHGg6zimDR/ctn2Fb9HfdtrCgV8eutDIJQgJ
   w==;
X-CSE-ConnectionGUID: 8n77dti8ROawdXhMn4HUmg==
X-CSE-MsgGUID: zDW8fQWjQmaMEc0WWXCv1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76281840"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76281840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:53:04 -0800
X-CSE-ConnectionGUID: NPMs+kk9SG22Lb5mvPfbAQ==
X-CSE-MsgGUID: tFvyDA7xQ3m7FlqBBA1ubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213891484"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:53:00 -0800
Date: Fri, 20 Feb 2026 09:52:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com
Subject: Re: [PATCH 3/5] iio: adc: xilinx-xadc: Replace module macro with
 custom init/exit functions
Message-ID: <aZgS2c45nGTozHkv@smile.fi.intel.com>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-4-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220053941.611415-4-sai.krishna.potthuri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_235304_530722_D87B0009 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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

On Fri, Feb 20, 2026 at 11:09:39AM +0530, Sai Krishna Potthuri wrote:
> Replace module_platform_driver() macro with custom init and exit functions
> to prepare for supporting multiple bus interfaces (platform + I2C).

No, this is not how it should be done.
NAK.

-- 
With Best Regards,
Andy Shevchenko




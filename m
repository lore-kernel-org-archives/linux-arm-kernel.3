Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58B8C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IB3y6gSzQ1dn1UBFNanfDh3o8gRbfqzRlqMryIwmtQ=; b=wbB0h2scwOkUz4pGpTwc3x8SyB
	9hTNdC+H5W8VcfK3JWF80ovQFrFsjg7mUxmAG4Yw5xk1NszXIduGjfJ0J6zawj+fJe8eTondckx9K
	tqm3HlLFcnXNHBp/ScZCIAnJAQx4Tq9o+sIfz/vvXTAd0lEB8e0irQH208vRFv5xmhiGj1gPKNx01
	3ITytIa+xleQaeOEnG1gLl1F/LbamrVmHz/Oo95xu+Drp8drdxgmiQ4UNbq11TQTYKef8U4lJTwas
	Pw//fF1jRxNUE+v12YjQBcIMpwPzuZJHWiBiAWzoB1gTKADegDAPu7qux0PyQpQb5sBhahKvbBw9S
	Ri8Bg8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATQ5-0000000FWVY-369l;
	Sat, 26 Sep 2026 14:30:29 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATQ3-0000000FWV7-1sqX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790433027; x=1821969027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5OUwhCAJxeTYtuOFGq+98In/t3e8+SuwLlaouQgWS/Q=;
  b=mVz4BVtj5NmR/3s0jV3nJeuizK5hXec+SK0AJX1XSX3UOL935oqqf475
   pWR2g3RqDWyJvZpubYnZ3+WAlTp1fxLHVm19NN4jMQQYSMlbnzF6Lq2TI
   SvKk3cEyt3MukSCUYugpdxPkWY6FEwAxrT0oRTjH7gC8PT1tbI8sEicU0
   3MDO5VbMy+JG0Nkd21qSEXzLUp/rNuMJyNdl4+q0Xbyd61N/cGnuO+psI
   U448WyLJ75LTlHwXiOSG0njwgeazX8J4mqf+JbPzHu7N5tnWkOtlODaDM
   zX0wpuQdivha4e9PVzy44OpVky0m6qfmQl9FH5PTIazCRMxo+IWAd5lC0
   w==;
X-CSE-ConnectionGUID: wmVmkEoDScyw+E+l4MIXzw==
X-CSE-MsgGUID: FolYZaymTlmrF3DRsunmsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101367854"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="101367854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 07:30:26 -0700
X-CSE-ConnectionGUID: 2Bdoerq7Q5+MUd/FkX7RlQ==
X-CSE-MsgGUID: J0/rUETGSXCDE/l23z38sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="312515518"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.219])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 07:30:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C1E13121BAA;
	Sat, 26 Sep 2026 17:30:22 +0300 (EEST)
Date: Sat, 26 Sep 2026 17:30:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Message-ID: <arfW_sncBRNsyP4L@kekkonen.localdomain>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-3-r-donadkar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_073027_562438_8217D78F 
X-CRM114-Status: GOOD (  12.04  )
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

Hi Rishikesh,

On Fri, Sep 25, 2026 at 06:59:55PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Some camera sensors now use an expanded CFA pattern to capture near-IR
> light along with the visible spectrum (R,G,B). This allows capturing
> light in both low-light and day-light scenarios using the same sensor.
> 
> Instead of having a 2x2 repetition of B,G,R like in older bayer formats,
> here we have a 4x4 repetition of B,G,R,Ir where the number of G pixels
> are the same, but half the B and R pixels are replaced with Ir. Thus
> instead of having 4 total phases, we now have 8 total phases or
> re-arrangements of this pattern.
> 
> Co-developed-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

I think we need to use the common raw mbus and pixel formats for the
patterns that have IR pixels. See
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

That's mostly pending on userspace support now.

Can the sensor output Bayer pattern as well?

-- 
Regards,

Sakari Ailus


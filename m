Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kODkd/SZopnxWAc6vgk9h5AxPba1yOSjwKG+Q2WLPaI=; b=KAfYX9BpHrFjB08CVZRB9w3auL
	bVYgm5yp6GdJ1uGcqastCPwXHSmLUSeR+1AKJ0pfNaDHoQ96jByDITHP4lE3bXDlOv3wOPY6ynnCI
	kAQUowNLuBAypgcOoz6DB1T+cuYqCuZ1u3c7zLW9Nsz9P3UKMRYPPNb52B44R2WOacgMJ/skcvARF
	wUNZH13twsPcibCwbrmLDc5/WWu+yvGxlqFRfhLwSYzjvX6iCOJlfDs1jDpM5QkwC/wZymt5eaddH
	ARSCYtq9mVFeKOu2FzTJtEswxOTZeBCpxbY62rQD7ibOyecX7Bcn4aSeZ7Sj3vbSGC8iCnXYbkQQl
	wTDiUA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdK1-000000070nR-1mC3;
	Fri, 03 Jul 2026 12:48:45 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdJy-000000070MC-2vXP;
	Fri, 03 Jul 2026 12:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783082923; x=1814618923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfe56DaBuMolh+4WBApbrq/tC7CCFTxnUcy4jtF9o7M=;
  b=GHbnoiUHIMtI8YIpkwYWkrYcYGApN7VaYexxQqkfFCtoN5IDHvVTNVsH
   o4DBrjvPHWcg0+Q2Hyn2hJEotlf+PFK5MmNTzRinhV+sH/jmAA2WycxpK
   qH8KD4gKpVG2pesDUa0i0E4u3jIPWLM+Z68rT1iBuNDgfOB9QtcoQqddi
   g+4IWbvlmWDHiYdHX817ivifz6LGZB9MedBv0iR4GuuL63kVJKCY6YkIQ
   yrcTuIyZim3Id+9dUgtohDPEY8o1lw8T9NRubYBTkkIk1aFp0aHTh0+Lb
   lKBp8NAlCPUctR1MsHCrPMgirlwilmityaFcOlXjLWi4o6wcj/CX2eksw
   w==;
X-CSE-ConnectionGUID: OzPb/+RFSaWodrj/CpCCAA==
X-CSE-MsgGUID: mETlsHXVR8O+pbE7mwosqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83613113"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83613113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:46:42 -0700
X-CSE-ConnectionGUID: CV+r/4VLRpuQT8//tAUw7Q==
X-CSE-MsgGUID: n+bCD65wSTGlX5/jBvpc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249139803"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:46:37 -0700
Date: Fri, 3 Jul 2026 15:46:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 02/13] device property: Add
 fwnode_graph_get_next_port_endpoint()
Message-ID: <akevKiryGPA0_vZx@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703110317.1283411-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_054842_798546_861D6524 
X-CRM114-Status: GOOD (  12.27  )
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

On Fri, Jul 03, 2026 at 07:03:03PM +0800, Chen-Yu Tsai wrote:
> Due to design constraints of the power sequencing API, the consumer
> must first be sure that the other side is actually a provider, or it
> will continually get -EPROBE_DEFER when requesting the power
> sequencing descriptor.
> 
> In the upcoming USB power sequencing integration, the USB hub driver
> first needs to check whether a graph connection exists, and whether
> the other side of the connection is a supported connector type. The
> USB port is tied to a "port" firmware node, and this new helper will
> be used to get the endpoint under the known "port" firmware node.

This version is good.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




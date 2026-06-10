Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F148CCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9dVOFjzG0qorTuzugExUm+OGvZnf9xKQzU1sFL/cwg=; b=rUlkwGlFfJTZPTLmQ9BMqInZ+s
	1gARAiUYa0vYv1+Pd3L3y+928kMl2lWmjeEXSVNUAXgd6JwhyggTP7uHHC9BQv9vs+Qlg6dx8pKPK
	VXOxSb4DtEbrtSDMK3YVYrsvaVe4R5+SRiaaxSL5IK2KdTPS7twIkaPOCWOSEKfhz0qtPoZiAX/MR
	m8mjUc5Gnq8AIybfWsc0ckLky9SISgTWG8ejsKx7YIN7uEIaZXJQ3BNCVsBNRMIqrJDZSY8gIk5DM
	/dE+1HIfCGhDD3zu2sEZcBlkppv1ZcQmKWq1y/AkwJOFwoh6OmyxPe/zwrS7ktf73ds6ix+fEgiXs
	iyvCdpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK2S-00000007vs3-1GXt;
	Wed, 10 Jun 2026 14:36:16 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXK2P-00000007vrD-30yI;
	Wed, 10 Jun 2026 14:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781102173; x=1812638173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rjVo3E6bL/gwM4u8huqi79QwAf/xG2SrVmrblO9TUZc=;
  b=MQNTaBiDVFlHCSFz/jT+LpiqrIjKYComXutJ5kMZ5qpiini/pYmLsRe9
   mle6cz1cSAuR5EsH3YmFzIv0m7RB5bpUEOOzNdbbz9pYSOLqEsasM1i/b
   D4VWJ0lXTrB333RewCeL32wZVh4iQnEbsVWIJ9NZJEOHA+0MXmVkjklRF
   UjRjnTRgplcWycNAws5ePCxJMYfTeaub/qA0HHQZ7OBnLqC9s1jCuDvZe
   o23rMFhjvZDai8GTa5b1DTfOZy9FlU7b5+GQcN5YNuslgaT/oBzU98u+e
   U6Ja4h1FylhgM719aK3NXRD1g53hW8ZsHuFTXNXXdqgWRO+ywmAKkNrrH
   Q==;
X-CSE-ConnectionGUID: 3EAyUYKER/GWkvHChEGMpg==
X-CSE-MsgGUID: KU9Aa3zSTj6o3PXthYmDpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84466564"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84466564"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:36:12 -0700
X-CSE-ConnectionGUID: qQiWu5zvQd6n+fOOpRJieA==
X-CSE-MsgGUID: slS4EcOxQy+lPzGNsfCINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250113779"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:36:08 -0700
Date: Wed, 10 Jun 2026 17:36:05 +0300
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
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
Message-ID: <ail2VcubjT7HNGUC@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-12-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610084053.2059858-12-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_073613_789710_20558F06 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, Jun 10, 2026 at 04:40:45PM +0800, Chen-Yu Tsai wrote:
> The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> UART for BT. Currently the driver only supports PCIe and UART.
> 
> Add power sequencing targets for SDIO and USB. To avoid adding a
> complicated dependency tree, rename the existing power sequencing units
> "pcie" and "uart" to "wifi" and "bt". The existing target names are left
> untouched. The new "sdio" and "usb" targets just point to the renamed
> "wifi" and "bt" units.

Why can we do that? No breakage? Only internal names? No ABI affected?
Please, clarify all this in the commit message.

-- 
With Best Regards,
Andy Shevchenko




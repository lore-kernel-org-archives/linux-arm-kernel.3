Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BC8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3C7hQoOXJkEa/gjjOgg7bVIM6ICp5ILXS3NQN1aXDE=; b=00Du6iQP9Tfo9j/YDopDGceUCp
	zSXjA8+3Qd7/8R+GptI+qJloSow2vR9dKg1vd9uJDZKEhIduoP7mZHHb75jmpFUPybY910PVF85Fy
	wy7PrpYYHmQqWpowtjpeVac8XJ1pfHi+83VbnYXIB7RWKWDL4050ZvMnr4oTPNbB5X3HtNROa2t8n
	bVSPZiIVAF6ybPOBqB84822nOCj7yiASOfdczWyPHrx7Rp+6Dw5akNJY+LhfUzMgzTngG6gIlfN3J
	FfBg+gaRsr15Gx4kPjfUKodf0kDGyjhZ51ltftQtZhwOTX4ndZSQeyavgJArvh/WbjTWAbC6CZZkX
	uHP3UIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdWy-000000072Ae-3Akz;
	Fri, 03 Jul 2026 13:02:08 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdWw-0000000729q-0sfK;
	Fri, 03 Jul 2026 13:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783083726; x=1814619726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=go3A92f+qVfLN0BBANEqxhTi+7+zvO5fvzs2fUIzcw4=;
  b=NuzrB/0gQgSBjssMI1Y5o8NIJwrzbE9E4Ise0k3V+h37YH8vGbm+bvNu
   /ngCGHyXXH86Bbis97tt1Hfs3vdb+naI32hRp6CeSqPNK5UHwUo9XIIiO
   euEN2H5hbkQVZAr092yi+bTMiegC5fxgVMxWA+QkZHEZouBmej3Cz78z2
   cZ3Vx12L2XmkabMSJdTjLZvneSl1JLUTLEzKSK3nXjefZ+tHi0RyTDuTS
   r5voX6G2maILsMdjI69WgdRbc7hbhrOjF0YWuXss+LY5VkA8W3IFYwq1Y
   W4CpTqffgEwg1YmHud1gjciF+QEM99lBMNjtfTikaG7hlVhWwYn2GEPRJ
   A==;
X-CSE-ConnectionGUID: 5isnYXXQRU2LkILwQSipWw==
X-CSE-MsgGUID: oiV5PtMOTS6ktRX1mJIxTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86386253"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86386253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:02:05 -0700
X-CSE-ConnectionGUID: pugGM/gaQTaY9txxcMNEVA==
X-CSE-MsgGUID: mOxugsDkT6C+FxXoN/1dQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="250458340"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:02:00 -0700
Date: Fri, 3 Jul 2026 16:01:58 +0300
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
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port
 device
Message-ID: <akeyxn390mVmYo83@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703110317.1283411-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_060206_293223_1340A27C 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, Jul 03, 2026 at 07:03:06PM +0800, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
> 
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.

Now I'm more confident that it does not mess up with ACPI case.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




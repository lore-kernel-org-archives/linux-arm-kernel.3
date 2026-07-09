Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84382C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liUtB982pS097ENOX4hJ2wflvh58x2g04BIplTyX6D0=; b=rauJ2vfbCb98wPEwirFiuKB7XD
	jdoU9000L3uW2FxvfbldSVD/OjSmcopRp7JLK8vZ59MuRMkxFieQ1K/0Tm0T6SupAU/nxnoOG9WOQ
	+k9fM9aPhnouv7gBS3Bt3OZvdbiWQiHJF21/aPoPRqn2huGkwPaDVm2yeO7beusGRmJT29/TKhsj+
	I19ghByd9lp5xPbfU0Hm5WBrVaJmv1gZhDhSdOMhU3+cfL0MoK8kXG7AjQ3xapfCHZGr2GTLcCUQt
	a//w96M0Y/7o/r2V38i3tUZbzXNU5DlDZd4A0YzxgTubtnuKvLOqw7OLGkB23ETqRJ3MdyUi4ipdu
	BnkxQzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm9A-00000001zGC-2Ilh;
	Thu, 09 Jul 2026 10:38:24 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm97-00000001zFd-2sQx;
	Thu, 09 Jul 2026 10:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593501; x=1815129501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iLiK3CTSDdvUowUyU7p7EgFeHFgaWNMld+MOAz5fmpk=;
  b=oK3GT2gkIpRJJjuVtzslVKmsKxyiFwWb2BlcR9oEhXYCXYaW1Gif0i9j
   JTw7qdk8F3GuEmPaV18ONNWZET4Ls2FeVkFTYZ/lQSSGuByCwilXOcEf6
   doYYxFXC2q1/PmcFpC55ssQpcM8+kC0xo/17YOtgn6ByNhNSESWcujniv
   D5H3/LojxlP/hV6iV4i+46Bs9wuN/L125Gvs2/BNP37JeVfvsFbEfGpi4
   BOw44G6ZdSHAs0KJdmVsD1w68jbJiIrZOejQl7gzbuekQQxCKmONMM2jZ
   B6ZQFZQO/Hr4tOzTiyGb6732SEvSR8RR/E6/Sr7aKRV+GFBR4ll/iZT+E
   g==;
X-CSE-ConnectionGUID: Nj2IYB2MSEerQWX9OQh6aA==
X-CSE-MsgGUID: im/tOIcJRDeuOiCY1JU2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84149232"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84149232"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:38:21 -0700
X-CSE-ConnectionGUID: 9eSEoKOvQvKdFLKV0C3kuA==
X-CSE-MsgGUID: NW8U+aFdQuuqkVYYdWQYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251896574"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:38:16 -0700
Date: Thu, 9 Jul 2026 13:38:14 +0300
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/14] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <ak96Fi4U3JJzbW3f@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_033821_734900_7263DC70 
X-CRM114-Status: GOOD (  11.29  )
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

On Thu, Jul 09, 2026 at 05:57:12PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




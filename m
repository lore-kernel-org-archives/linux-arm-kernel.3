Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D629C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcD68ggny1joEpMqpashahzuMhH7VhG1V/QEZFS6CWY=; b=RJEmVZ++3G2CHucEjbrJZ4kHps
	+hzY6WTZ8fP51i+gbReiqKywTP2NI/n1g6ipi1350FloJoEO3sK/Ubjrm3P6yv/z8e2q/NApzgTTa
	R1XyeMCioJlHj1XF+MZcho+zBVZnA2IUnosWxN0/2fbbH4UVcXCvLs0L7zycZf4QAzRShJmqEsapy
	cUYCEzlQ7PyxQ/TK8hwMLfHl7plvU270e50Dfnt2UjwQo10Rh/ZRsiq6HuUZEqMOsNNMzvYLIt3Wg
	/BYLdHU7F0W6IAcfflqaCo5EBfSgxk5426u+nMfoprj3u1JHZuTpuHDJ821asAvxuYIILndfsWbbs
	N7hnP/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdg1-000000073H3-0VAf;
	Fri, 03 Jul 2026 13:11:29 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdfy-000000073GW-215j;
	Fri, 03 Jul 2026 13:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783084286; x=1814620286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ur0KVXHfio32hANukgiS55qHcr/vid5LoYAKVA8ObVY=;
  b=ETgClG3D1EQeMLFzmtw6vJIEQFE8TIwPEiURekGiPldrPWxoHi/qeK3l
   6e54VZYpGh2qCfzDpwHIN8vjmIViKDcuPyIuU0pEU/XUy67Sdkh2zo/ep
   xJa0DHXBoe5C9peQBBwh/Bup0XG4/rAbFtp5UNUWHwNNlRoN2WiF+/GOa
   oxhT0hrIGrBrtsTast0MvQigy7Y00RwG2viGVJTV+ZI6kUgUqf9bSPjJ8
   5lg5/fureaiBcjXAvq9F88lWjwHBPhtrq9BH9aFLQEHjFoF2S6Al7MG9d
   UXyZN35RQMCzIRfo3XyilCFLJ/nQuAWUwcNlggV3S9L17O7aT8YAzcKnE
   A==;
X-CSE-ConnectionGUID: 4y3nLF6XQPKbaS7mxPxz0Q==
X-CSE-MsgGUID: npPua//xRZ2C8NzaFcO5Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="84028529"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="84028529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:11:25 -0700
X-CSE-ConnectionGUID: OtKHXtZxRy+HZdZh/F4u3A==
X-CSE-MsgGUID: 7twUTalZTUmLgv086/XQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248664397"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:11:20 -0700
Date: Fri, 3 Jul 2026 16:11:18 +0300
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
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <ake09vk4fEv1D9QC@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703110317.1283411-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_061126_960490_1D123BC1 
X-CRM114-Status: GOOD (  12.98  )
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

On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
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

At a brief look this will be the only function that takes usb_port
instead of usb_hub in the entire hub.h (I don't count container_of()
as a function). With that being said I would rather see it to be moved
to port.c altogether (yes, it's more invasive change, but looks more
consistent).  I would even dare to move struct usb_port (and container_of()
accompanied with that) and this function to port.h. This might require
a separate patch, though.

Perhaps something like: 1) "move struct usb_port and associated APIs to port.h";
2) "...this patch...".

-- 
With Best Regards,
Andy Shevchenko




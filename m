Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E5DCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3S+P+RczlTcfOUWCUwTs+JQdLMNgj0//3Bk2CpGKeu0=; b=WzuVRfXkc1W4zKm/EhtiEFdH03
	O75vIxnKNnKkAWad0Zx4y4rQoeP9hPkfGz/+/ydtEIE2dqi86Ut2B6q89MFeJxaBFfwsonrZZCbMZ
	6/RGnjdmHDl18vX31XMhvS5Ua/y8ZC6lK0rEZtstMbkeLZTUwKpCwYLnhfXsJk6QGNMbZy5tlzKoP
	VnFw9z55vC/i4OFFsFv4+4ut+eEa+B7Zvyb/CYl2PY9ZrFsKdJBcWbRDKAWwrIH2Wd3X4Qr/E6qim
	Og9PYTPMR2t8TNKzBC813niz8IqS+G2V47DGDz0/F5lpBqG29aJ3v/f93bCqmIIXH6vJ07sz3UOkz
	S3vB66ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJjF-00000007r90-0Xqq;
	Wed, 10 Jun 2026 14:16:25 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJjA-00000007r8N-2xvZ;
	Wed, 10 Jun 2026 14:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781100980; x=1812636980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uUn9KmX+YV5IrN2SPL9arcCvhPBUW1vzMP5vPumfeKU=;
  b=fO9xSCkcCBEiNQ6q+X4O4LF/Bv4uEA3GeYo8aUsV/j9rGI9gz6VEwI9U
   4eGZmCeCHK5MeWfm/KPycXo96ydV4ZqNWi+DkKGRJX/hpGuAHDofhRjU6
   f6vcGhYICeUvQDSJz5Hq9j31qt3PUI8sq50vRjNx+S3R104AoVg/C1qQg
   ouC6EVPAnIAAAhOAj1blhtX8X1iLeQCnrMEzv1dy55+5scy0kSp1FKtTH
   6MwBBH8qSVEJuF0EQvfsgMTf2sK94kdhzQQ0ZD0RXojk8B8Bu/tsAPaTy
   8Zyvl0WLWMHgP5vEh7eR1Boo/ONm61+ywvynonpaH2bY/FdKhgCyG8Ats
   Q==;
X-CSE-ConnectionGUID: pEju5NdNRpm77Aszt7gpyQ==
X-CSE-MsgGUID: 4bwdbAQ3STqinN17XwjG8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81801548"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81801548"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:16:19 -0700
X-CSE-ConnectionGUID: ihCtU1ENTqGYOkLDAvncxw==
X-CSE-MsgGUID: pjpObk6LQ1qcu4V0cTf2Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="248050350"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:16:14 -0700
Date: Wed, 10 Jun 2026 17:16:12 +0300
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
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port
 device
Message-ID: <ailxrP-_9_NL8qnN@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610084053.2059858-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_071620_815155_49670E13 
X-CRM114-Status: GOOD (  11.69  )
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

On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.

Okay, would this affect ACPI-based systems? if so, how?
Can you elaborate on that, please?

-- 
With Best Regards,
Andy Shevchenko




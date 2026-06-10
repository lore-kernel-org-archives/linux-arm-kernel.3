Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0421CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iO1kSrBuJ0Gvuy0lwBZ2oCfnsSrOH+ZpDZFUh9+adCk=; b=Tsc3lWI1aiENR5YhZz+p9C82by
	+eg+fA7o4N6GarW0ed4D1MDZUFcIQgBvMZDE1ZbN4HHL9+rsHmiXsWRc09txZOjwK8Iry6ROVXg2H
	S//IQAPsXDcMXVSsHcW7ezEtjELeypjUw+ucY8Vjan3gd6YSMj7SVsYOk3lecm1C/OETbL+COGOss
	cemD6rpZaOC8UTz+J/p2gVmDzAeunSnYbH6MBwdtEkanulvJ6aShfVk1bRmm/2DSsMRu5NhzjOZYr
	wOlrqiTlq8pyUB+bzEEZx+eVHLx6xMHEUzKap7ZjSXexwfKT8Xcq26KQMBP5z53Bp0Q2p6/ss3bkr
	HS1hEA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJQk-00000007p2F-1snZ;
	Wed, 10 Jun 2026 13:57:18 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJQi-00000007p1I-0WY2;
	Wed, 10 Jun 2026 13:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781099837; x=1812635837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IvtqsN9HqWtrsYzJFpIQXKTW+grvoM/ms7i/bF9Ptxg=;
  b=OvA/4+OTqI6CY1UoIJhwHA2U1L0/tyB13OrgXF6S2j9+KcsN1IocPI3/
   C2GacTwqqy4Ul8ssdki7gTGcnlHab8YEuUPD3k/YRle+FakTzYN5r7E4q
   UlKMq20ezDRydUrlOgeUvWIOOoQrC67b2YP1GknHelfDL3g1fFaJZTcnJ
   M5VquSSMTVKRUpXBqKOXaQYDuMyj6P0unt118hwL0DaSmRa1F1hTlUjTi
   ztLACIxv7ZmmyA1xSZju8Z3xQPsIuTphFkC9LNxndu+7Lv0fmFmhCSLRZ
   JhAYEsE5CsdDsDoVzRJI0RiU1lRHy7jywvG53ZDAF0p2tu6/CFLvWeklQ
   A==;
X-CSE-ConnectionGUID: zOwE0xNqSBy/4MHrN6nsKw==
X-CSE-MsgGUID: vG+WBY0sRfuGEi7+klfWbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81799390"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81799390"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:57:15 -0700
X-CSE-ConnectionGUID: pIzUFeurTd+gn3kzaSXAbw==
X-CSE-MsgGUID: ZwgnVHecR0qgh6Qv8HV+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251260733"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:57:09 -0700
Date: Wed, 10 Jun 2026 16:57:07 +0300
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
Subject: Re: [PATCH v2 01/16] device property: Add
 fwnode_graph_get_port_by_id()
Message-ID: <ailtMyYhbkOgaZWw@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610084053.2059858-2-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_065716_242532_36443F81 
X-CRM114-Status: GOOD (  14.47  )
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

On Wed, Jun 10, 2026 at 04:40:35PM +0800, Chen-Yu Tsai wrote:
> In some cases the driver needs a reference to the port firmware node.
> Once such case is the upcoming USB power sequencing integration. The
> USB hub port is tied to the corresponding port firmware node if it
> exists.
> 
> Provide a helper for this.

Okay, if it's really needed.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +/**
> + * fwnode_graph_get_port_by_id - get the port matching a given id
> + * @fwnode: parent fwnode_handle containing the graph
> + * @id: id of the port
> + *
> + * Return: A 'port' firmware node pointer with refcount incremented.
> + *
> + * The caller is responsible for calling fwnode_handle_put() on the returned
> + * fwnode pointer.

Note, the Return section must be last one in the kernel-doc. The last paragraph
sounds to me as a better fit for main description. Basically check how other
kernel-doc(s) in this file are organised and follow that pattern.

> + */

-- 
With Best Regards,
Andy Shevchenko




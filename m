Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j15GYHy8kYoGfHUO2c0IXPfvulakam5H5cQvz7EN6h0=; b=k8QqQedt0ZxQR14A2Nrs3oGTSA
	fvrxcdYRE8QvAEVGZmrMfpItFvUbDoKHpjCLuWPsIWb7YKDpE1aoM4rD4A8J8tPwQ6mNLGA0eJT5t
	dtXfkTR/Uf+vHUftU4P37drXNEMvpY9+IXi2GLSnrKM4cR7/SyOSzpSMfjRTGwUt9pfJZz/eBqY2y
	SvnPJ3B3MRP5nKBJJJ2yxY5B+lOZtlWCXkbp6CloZ60xsfhm3nKHg1W8IAnrNTBIbb9VhMaC3jXKi
	1Z9xN6Kr/8U8XvQAdfmticwexUOFV5LjqzGuhnzSoYQY5pXMDFSIqL/IHXpGCoa4VKjGnx3wNFZ/G
	i+csJ5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfe2C-000000076xz-3wKk;
	Fri, 03 Jul 2026 13:34:24 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfe29-000000076xJ-0O8V;
	Fri, 03 Jul 2026 13:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783085661; x=1814621661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+YDsaVWOUv1RxK+8utVxCX1+Gsf9vT/ItASTLwgreuo=;
  b=Gj2ig/+LV1aR0y7ZZplV5ve6G48G4O5jhfP2EBF+Q0wF2AW5NDsA2zat
   7hrXtCZRhyidwEfwrHovSGsQUVLRXQFMYLrXZUGSH4iOhbZrT4g8Fhce/
   cHnwjGgE1f0Fg+8hJbKJdNcCOO8zwuxzGGnOPKhNahM0YDn3iQLgFtzKg
   aVu9ch58/O5j9bqMgnMSxeyRxg7yli2hXvCIHPFebxyHK0MU3MCPE9KQj
   Y/4GZZfLd5tD6FXPDMaWH9wyEtp0CUUZwKRuqZxATs+UMvPWGOzuicwxW
   knqVBEN5dCLvKZYxmBDkb0EGTmChy9/bvkCwbPXOnFSFw8BD1LtxkFuXH
   A==;
X-CSE-ConnectionGUID: Be+eZCbxTPK1QU2Pmb9RVQ==
X-CSE-MsgGUID: EhBBdDtOTiG9z7CMx1wtqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101384507"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101384507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:34:20 -0700
X-CSE-ConnectionGUID: 3b2uYpljSmWfiHeJLiq6gA==
X-CSE-MsgGUID: RU0gKjNQTza5b8+Wtp7g7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256690746"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:34:16 -0700
Date: Fri, 3 Jul 2026 16:34:13 +0300
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
Message-ID: <ake6VXm9XTDr9d-W@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-6-wenst@chromium.org>
 <akeyxn390mVmYo83@ashevche-desk.local>
 <CAGXv+5G3ETTGbgjWJCbQjn9yvRamx4GHPxjWPgmy_aXWUxm0iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5G3ETTGbgjWJCbQjn9yvRamx4GHPxjWPgmy_aXWUxm0iQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063421_145810_6D4F26EE 
X-CRM114-Status: GOOD (  17.60  )
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

On Fri, Jul 03, 2026 at 09:25:56PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jul 3, 2026 at 9:02 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jul 03, 2026 at 07:03:06PM +0800, Chen-Yu Tsai wrote:
> > > When a USB hub port is connected to a connector in a firmware node
> > > graph, the port itself has a node in the graph.
> > >
> > > Associate the port's firmware node with the USB port's device,
> > > usb_port::dev. This is used in later changes for the M.2 slot power
> > > sequencing provider to match against the requesting port.
> > >
> > > To avoid potential conflicts with ACPI firmware nodes and then causing
> > > power management issues, only assign the firmware node if the hub's
> > > firmware node is not an ACPI firmware node.
> >
> > Now I'm more confident that it does not mess up with ACPI case.
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thank you and Bartosz for the reviews.
> 
> FTR Sashiko pointed out that this is likely leaking a fwnode reference.
> I will add a fwnode_handle_put() call to usb_hub_remove_port_device()
> in the next version.

Ah, indeed. The _get call has to have its _put counterpart.

-- 
With Best Regards,
Andy Shevchenko




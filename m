Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD210854D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bMKwVBgw3zW9VnpBkG8ZNfyvFgZ8r//ilWROTast5c=; b=BeErzI3qK6dA/NH0QZrcKpaea6
	RbRovZJGtGc89Uuc+mEYtsiVZWixsgnxhu7/+orNMLcgo6MhEeJzUUiKF8GKn5mnJfR/TtyT17IVN
	jdnxQB5XIGP39eIlqvY7wHY429Y+WJHhBes2y9KWdZ5CyfD1NZXnjkqgPNXe7Dm44hTYqcDA7LlIs
	H66GJ81OtjB/FIXo2iJLNbxOHmG69O0VkB/FtMbvNMSkU5R/Y09r99WqYJC0vGCxguATtkTiVlNoy
	vVyMZZYUXlDW8E95ZrMeWy+FNLGXnRGwnZHxjKIHLTcp/BIjoPp/xX/yev85CUwy+1UhXHiYkk5Nw
	Gaz856sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mrg-000000086Os-2vBH;
	Wed, 18 Mar 2026 09:06:56 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mre-000000086OM-3EqA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 09:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773824815; x=1805360815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OOpz2QLVOMmh9KY2GRGxQ6h+0tnAzCc8jxynqR/fL8c=;
  b=nFPhbNvfz+AaY+CWIaIvbb0Po/h6UkosFdZm5JrQrY4AVd7SLVp3iXOA
   4SNwYrq45tCOs19cnqNCrCoaFDwLcxfGcP5sl77Isl/wBpWebJWdysz9V
   OjPrRxImqAgrgYBemHc3SCmAEJs47kc25gHfiy9co6wmMahT9eIUsiSbF
   iH6v8eNxIR2lYuDaznm1hFKq1FK54KI3z+lG0oIoroeF149RFMPyOnMDZ
   BCh+ZpgmnoC0UCSiDWRwIDctCn2Ed2LIqp3SrwmQ1TMMeygZlI+9fJ5Ip
   e6WPkxaaJNmhZc9FpvCJevNdMB46XYwmKwnABqYjkwFIEqqwCA0qauisP
   Q==;
X-CSE-ConnectionGUID: jq/zFzKJRKGdbs1vrTDmLw==
X-CSE-MsgGUID: maEl76a5Qc+qaLjQOo0qfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74573988"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74573988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:06:53 -0700
X-CSE-ConnectionGUID: bGaVs8xpTUCoR2u709K5aQ==
X-CSE-MsgGUID: hk9DpRDxSG2N5wW8ulwWpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="253045856"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.240])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:06:44 -0700
Date: Wed, 18 Mar 2026 11:06:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
	Mark Brown <broonie@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev, imx@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
Message-ID: <abprIZ4_LUScJrSd@ashevche-desk.local>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
 <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_020654_904768_75EB6E99 
X-CRM114-Status: GOOD (  25.72  )
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

On Wed, Mar 18, 2026 at 09:41:44AM +0100, Geert Uytterhoeven wrote:
> On Tue, 17 Mar 2026 at 08:34, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Mar 17, 2026 at 08:26:53AM +0100, Wolfram Sang wrote:

...

> > > Thanks for tackling this issue! I agree it should be fixed, just
> > > wondered about one thing:
> > >
> > > > While flags are often modified while under the "fwnode_link_lock",
> > > > this is not universally true.
> > >
> > > Is it a possibility to use the lock in all code paths instead?
> > > Because...
> > >
> > > >     struct list_head consumers;
> > > > -   u8 flags;
> > > > +   unsigned long flags;
> > >
> > > ... this change costs some memory on every system. Maybe it can be
> > > avoided?
> >
> > How much memory does it cost? On most 64-bit architectures is +4 bytes,
> > rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
> > +0 bytes. I expect that 64-bit machines will cope with this bump.
> 
> On all architectures with natural alignment of pointers and longs,
> it won't cost a thing: struct list_head contains pointers, so the
> struct must be padded to a multiple of 4 or 8 bytes anyway.
> On m68k[*],  it will cost 2 bytes, as the existing padding is just a
> single byte.
> 
> [*] Iff m68k ever switches to 32-bit alignment, there won't be an
>     additional cost due to the change of flags here, but of course
>     there would be a cost all over the place.

Thanks!

Yes, the worst case is 64-bit architecture with 4-byte alignment. This
will cost +4 bytes.

But I think we are really wasting time on this part of the discussion
(and any similar) as long as nobody targets struct device or any other
BIG FAT data type, that will bring much more benefit than saving 4 bytes
in some struct fwnode_handle.

-- 
With Best Regards,
Andy Shevchenko




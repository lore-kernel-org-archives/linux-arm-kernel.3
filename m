Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3164EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARFMEq0oVkui4XPPgbn854eRDYcjamGL+khcOdCj0t0=; b=tEan8ZMH4cM/zu02vVSpiCNTyc
	HNb9zqwVFOvMh+/dwXQeGf56NNN+InDDjOXkiqiy6W4Bgi7D6QnRlor8RJD5TNXFzLf7MEAmEOfKx
	RG3bB9QHBnRrLoqBx4S8hSbpPL+QjxbTxHjAS7V89asgA5AR2O1VfkTLshXbVjfmeAn7d1pI+1suN
	2zvuivZjtwUlN9VKf/DlTz1BCqd6zzqlzDPN2jEiBB9nQzVLqlK275nWLfevNaxXwbcCga5SHSduZ
	H44DSdBtKUmYoVYKjjV64cESm2FQzdNfpQY8d/bzQq+e0hcsIIhYlPWqAi+Rjcnsr8+izxiAyNF7o
	0Ya8ox5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm7e-00000001z5A-12FV;
	Thu, 09 Jul 2026 10:36:50 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm7b-00000001z4P-1vNt;
	Thu, 09 Jul 2026 10:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593408; x=1815129408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sM/To+DTEc32STAWmbWoa4mxR1gafUH0Ew8jud2Bb6E=;
  b=bua0mjXM47Lg5VIlNcyvznBOjLcjqQcEEQ4wacmSt+F0RV8lNCP7U73P
   Mn3xb7t9p2KKRC63biExgj0U23hsmHTB8Bh6otZmanmW+DCLlzIH2kOf0
   S0yAHmsd3505TQlTbCDMcbor09GTI6uEa11Bnqyng4KcAqawAQwLd+8RA
   Az00Lxpp0gbwNs7T1g92yj+eSXbr/Vm2lKHiRAgkUS1YZApOO29CChf4n
   oby/y0EPycoz6+CF/LBoZDien/jWAeH2ymtmhM67YCYvJG7kz4L6zqrud
   UcekR56BNrpKnvCCeLOj8nKyIdtgMWJLYWAXiBbXPerrXWkBaQJjd601t
   g==;
X-CSE-ConnectionGUID: HQzzbuM6Ttm90+zcZzHaRw==
X-CSE-MsgGUID: vH6uxkH3R8qnPCIKjj+VVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84128310"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84128310"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:36:45 -0700
X-CSE-ConnectionGUID: 5i2pH1kLQnmvne4XMmnt5g==
X-CSE-MsgGUID: aCmP89aeSLqKerWrRicZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250148201"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:36:40 -0700
Date: Thu, 9 Jul 2026 13:36:37 +0300
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
Subject: Re: [PATCH v4 06/14] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <ak95tdi31diPMTZ6@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_033647_534773_0023DADE 
X-CRM114-Status: GOOD (  11.79  )
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

On Thu, Jul 09, 2026 at 05:57:11PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
> 
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);

Drop 'extern', it's not needed in a modern code (like 20 years?).

-- 
With Best Regards,
Andy Shevchenko




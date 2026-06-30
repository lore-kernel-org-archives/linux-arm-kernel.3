Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B67C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf3Vqj4QxxG1BOTXJ9G7gN28EjndtgBNmFI1KsGhXAs=; b=sr5dGJIMdBkEZYNPFoz/qY6JQE
	EwulgHgSCwcwwhNGEOxkNUNF5S48r5ZJoG/k8GtQBgk1mV5izxXoZkIaOiw+3NE6FYOtb+XPx58Bs
	SL4yvXJF4fshGULtJZvcX1vshcONzu5vmc1gSENwiVc3oS8z1DyoUXAh+w43fytTS15NhoRbwi/z2
	VQaKcIyaoJwqQHO6uMbRkJBIUYL238W+ihTEqJqSvk6DoSk0wUh8mrFfSBV6KhL46zAPUmbY7zlDr
	7kc9URHFVW/B5EwPe8cEgdyfShQeeH7P2lb/k1vTkwWbhbs5lUUCIim2JIMNXuOZ/6fOZtjt7i1b5
	C/jk5moQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXVB-0000000GyiA-1bCE;
	Tue, 30 Jun 2026 12:23:45 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXV8-0000000GyhW-2GKy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782822222; x=1814358222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nnKfNNoQi2mX4bhRyFZ2Qt4ZP48zuHBEcPETaD7ybwU=;
  b=XLPkpD3iAfI/CUuMhp0JAqJdqJenl9Vy+f/Y55gmv0rx2WQYa2tKXHzz
   kdjXsIz4WdmggdJKrsolE9FUWf/7qQqnrBSqyP+/huypnhVASzLeuiNSm
   LYri+l1dWvch1hRxH+B66LpaACSc7scashxcePRPLNo3TVIW7fej6oCsJ
   009EQURLEqZsFPTwUx7plxh3kr1ePHOF3XNtqUSnqqUAZ+YvapzjKHN3l
   ziD0igvnhXp98wyTtEG7q1MnhLPOyfoTccijRrikhtpyYC5jfhGIA+QYs
   4GVq5lFChlCQu/j/j5tYjNfkLzo7HxBaupBrb10QdMcxBfKC5ym1Qf630
   Q==;
X-CSE-ConnectionGUID: JACk6s+AQ9WJmdHhcs6HXA==
X-CSE-MsgGUID: ktPbxQnGQkyCsJRgJNm/4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87216010"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87216010"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:23:42 -0700
X-CSE-ConnectionGUID: vkTv8ITNSma9Tgd9In8mUA==
X-CSE-MsgGUID: PjQptynNQs28p4qyqrBhTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251198195"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:23:37 -0700
Date: Tue, 30 Jun 2026 15:23:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	marcelo.schmitt@analog.com, jorge.marques@analog.com,
	mazziesaccount@gmail.com, Jonathan.Santos@analog.com,
	jishnu.prakash@oss.qualcomm.com, antoniu.miclaus@analog.com,
	duje@dujemihanovic.xyz, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/13] nvmem: microchip-otpc: add tag-based packet
 lookup
Message-ID: <akO1Rgf4tibxbhfk@ashevche-desk.local>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
 <20260630093603.38663-7-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630093603.38663-7-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_052342_659451_15EF71CD 
X-CRM114-Status: GOOD (  23.82  )
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

On Tue, Jun 30, 2026 at 03:05:56PM +0530, Varshini Rajendran wrote:
> Add support for accessing OTP packets by their 4-byte ASCII tag while
> preserving backward compatibility with the existing ID-based lookup.
> 
> The OTP memory layout can vary across devices and may change over time,
> making the packet ID approach unreliable when the memory map is not
> known in advance. The packet tag provides a reliable way to identify
> and access packets without prior knowledge of the OTP memory layout.
> 
> Two offset encoding are now supported:
>   1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
>      Used in DT as: reg = <OTP_PKT(1) 76>;
>   2. TAG-based: offset = 4-byte ASCII packet tag
>      Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> 
> The driver resolves offsets matching valid legacy selectors (multiples
> of 4 within the packet count) through ID lookup, falling back to tag
> lookup for other values. This ensures existing device trees continue
> to work while enabling new tag-based access.
> 
> During probe, packet meta data including the tag is read and cached.
> The driver also validates OTP memory accessibility and emulation mode
> status. When the boot packet is not configured, emulation mode allows
> access to the other packets. When both are not available an
> informational message is logged.
> 
> The stride of the nvmem memory is set to 1 in order to support tag based
> offsets, comment in the header file is updated accordingly.

...

> +static struct mchp_otpc_packet *mchp_otpc_tag_to_packet(struct mchp_otpc *otpc,
> +							u32 tag)

Despite the length I would place all in a single line.

> +{
> +	struct mchp_otpc_packet *packet;
> +
> +	list_for_each_entry(packet, &otpc->packets, list) {
> +		if (packet->tag == tag)
> +			return packet;
> +	}
> +
> +	return NULL;
> +}

...

> +static struct mchp_otpc_packet *mchp_otpc_resolve_packet(struct mchp_otpc *otpc,
> +							 u32 off)

Ditto.

> +{
> +	/*
> +	 * Legacy id based packet access: offset = id * 4
> +	 * Inside the driver we use continuous unsigned integer numbers
> +	 * for packet id, thus divide off by 4 before passing it to
> +	 * mchp_otpc_id_to_packet().
> +	 */
> +	u32 id = off / 4;

Make a temporary variable for off % 4. In such a case it might be compiled into
one assembly instruction (yes, it may be not achievable IRL currently, but it's
just a better style in case one will use this piece of code to copy'n'paste
somewhere where it will make more sense).

> +	if (!(off % 4) && id < otpc->npackets)
> +		return mchp_otpc_id_to_packet(otpc, id);
> +
> +	/*
> +	 * TAG-based packet access: offset is a 4-byte ASCII tag
> +	 */
> +	return mchp_otpc_tag_to_packet(otpc, off);
> +}


-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3F6C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyUgvIE+JnfaBx0D8IIzn1/8MwFCxGAtan/yvDRXFgI=; b=kAjqQJMIIBK65uCHwuLNzalG8l
	/FaViU4Kt+n3qyCodOmE1NwMl8p03xJHE1bDhODq+UsUDpMg8llJCz21+nzi/Vi4ZO0rdkfDnjiCS
	lwKvRLLJLg3aumzl+dMFKMv44E8jHbyqPZj0sFRIgYLOYU5wySfC/i4mEkq2ArJlwpdSWStAwaQ7T
	Pe4wiMmZlKYp3596UKCoIXK0g7GvNgSDbJ9yjrbIp7zJZCig9F8NHO6CUCm2wT8V2Ae5RpJi/7Bzn
	VEHZZR04BdJIvQGqlH813pXjs0JJptWsiBM6YqIL+/xk4CuDffMm7lgIHTGkjQWSk2j3gFzk7coXR
	OIKIL7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuobO-00000002T4H-2U1e;
	Fri, 14 Aug 2026 09:53:26 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuobM-00000002T2u-05PM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786701204; x=1818237204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P50msqmGToj6m1U1nM26bFNOxv+piPx+jmPvAkrk/tI=;
  b=U9YsEzkXB0P1atHSVnROnvkJeFz20ovX2qybgxRE/w729MmhaFfXHgef
   HGBHKXbNSMP8gms0aJRFu33Ekv3z3SfWUoJSsB87gd0SIe8cmRZ8WzpqY
   Vh+nNv4JrbFJC8z1zJzC7SsvyW/PYEbVqbz5IeOnAfiqc7Ve5FhCYDrN4
   0N7hce47+ZsgRBtfGukv3M/di7fIdjHfU7rsXE0RI/TVqkjAxMuAVUuhg
   dpWO6QWY3gJGlwMd5g+ZNSXV4nzxbp24xPGj/VLTX+UKfMlM1/JjkVMsd
   js+DXG0ShCl36hatS7wGOyMFl/qG28lmMTgDkNxgiyeHL4rD8OPNNMi+C
   Q==;
X-CSE-ConnectionGUID: jCynpybPR8G2nT7zhdeDmw==
X-CSE-MsgGUID: CvJF8/rjR0yyzexDn1yuNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74815269"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="74815269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 02:53:23 -0700
X-CSE-ConnectionGUID: IjoJ53CGQ8yQ6Fbsa+l3Xw==
X-CSE-MsgGUID: V9pMgBuvTrCq8+lA32BrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268037172"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2026 02:53:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 10EEA99; Fri, 14 Aug 2026 11:53:19 +0200 (CEST)
Date: Fri, 14 Aug 2026 11:53:19 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH v4 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <an7lj2g1bAkOZw-o@black.igk.intel.com>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_025324_108149_28F3E2DA 
X-CRM114-Status: GOOD (  11.90  )
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

Hi,

On Thu, Aug 06, 2026 at 11:37:21AM +0200, Sasha Finkelstein wrote:
> From: Alyssa Milburn <amilburn@zall.org>
> 
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
> 
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/usb/typec/tipd/Kconfig    |   8 ++++--
>  drivers/usb/typec/tipd/Makefile   |  11 ++++---
>  drivers/usb/typec/tipd/core.c     | 225 +++++++++++++++++++++++------------------------------------------------------------------------------------------------------------------------
>  drivers/usb/typec/tipd/i2c.c      | 106 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/tipd/tps6598x.h | 121 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 276 insertions(+), 195 deletions(-)

I kept you wating so long that this does not apply on top of Greg's
usb-next any more. I'm sorry about that. But since you need to resend
in any case, one more nitpick/question. With that, for both patches:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> +int tipd_init(struct tps6598x *tps);

How about:

        int tipd_init(struct tps6598x *tps, enum tipd_hw_variant variant);

Thanks,

-- 
heikki


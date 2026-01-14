Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62CFD29FF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzQuoQYvhb6Pj5SiGRiWaFyvhDZlBJJ9aEtsbH9djGA=; b=ujs/bR4ZGPJxEnCE7+KrSmdkjA
	sOGHjHGiXLaxgt5kx1b5sTa79mfbL1KXGvGKOlCbLhFtRR81BDY5g/8koQ7V5K2MySBL6HtzUNjFf
	qgteCbpglLeeerBDGTaLo/vBUJPisIkup51kdYlG2KjHR2JF4/3fygwGAfCjAZJvsEu4YBiDTF9VO
	5axntjD3Nwm3JVmmQ5w26H6qDo84LmX2fZowK+DuZNBbQmEuipHJp7/m31HT2QdgeEFovNLUy/Tbl
	01Cit/wH8Pehuoiq/HYCjXG3aR0KufTMvy1xnuVzVg2pD/xMDPDKmLtZcb2uLe0VTQ8PGUN0KlQAo
	QswEIIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzgU-000000096a0-3BVR;
	Wed, 14 Jan 2026 12:09:10 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzgR-000000096Z9-1Tv0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768392547; x=1799928547;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=EYswg02gjuvqs73LUDwN0ChfKC/BQKKnQB+oeLlaqiM=;
  b=ccZ62QnttDIQuKNRrPINyW3NcuVpRv7Tb/nL9yvhw60jFURL4IIPnyZU
   8kWpTYW/vlPhIvBbpDD+++HqzmWWqe/3OpRIkvLxyxHJ4hGZa9dfdEWx0
   wYpCkEcNUAaVvfuhxUK6iOgyc6Fw9I019VndSt8rYXUEbaHVosvECmSQv
   7ZfArwOTMAf/Dt1tOu3rMMCv9xtWyjQEnANaHH+IUQLHbDemOvjjKL+j9
   e52jPr+DvyEIr1BRoiIsnPFesTUCp2sbesyKpnjg1U9HbwDEO7lZ5XKvC
   G5rVsuIfN9Ot8MkKdwwz0qD35LwUVK50zAdJMdG6/xaNt52AlUTQt4n/z
   g==;
X-CSE-ConnectionGUID: Ugcd3XEFRayFIjosxRPIQw==
X-CSE-MsgGUID: 7nN+gDPERoCcdAtz1GfnZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68697370"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="68697370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:09:06 -0800
X-CSE-ConnectionGUID: YfId4127RIiRbKbn/2MR/A==
X-CSE-MsgGUID: voMxLI1LSL+SxXySXk3osg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204943430"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.94])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:08:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>, Jonathan
 Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>, Chirag
 Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 2/5] accel/thames: Add driver for the C7x DSPs in TI SoCs
In-Reply-To: <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 14:08:56 +0200
Message-ID: <5d2167dd7c898afdb374429a9dca8d262967d125@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_040908_298270_B812ECD9 
X-CRM114-Status: GOOD (  10.21  )
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

On Tue, 13 Jan 2026, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 1d3a7251b950f39e2ae600a2fc07a3ef7e41831e..8472989cbe22746f1e7292d2401fa0f7424a6c15 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> +obj-$(CONFIG_DRM_ACCEL_THAMES)		+= thames/
> \ No newline at end of file

Maybe add the newline while at it.

> diff --git a/drivers/accel/thames/thames_core.c b/drivers/accel/thames/thames_core.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..92af1d68063116bcfa28a33960cbe829029fc1bf
> --- /dev/null
> +++ b/drivers/accel/thames/thames_core.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
> +
> +#include "linux/remoteproc.h"

Ditto here about <> not "".


-- 
Jani Nikula, Intel


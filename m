Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB28CD29FF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQB9s03mSjxS0jmvZJsXPh5oI6zSk/GcyRq9LX2EdUc=; b=dVzxojdR5H7tCrlrktaAFQvI4y
	vFjn7dZgVA7zBl6gq8WjmY75Vj9UIkHvpFYYPLRh2vGg4NNTEDkoL9ltPhj17qaPDfaNTNFiK99Dr
	iZyqR3ouhgF2UX/jf6ZJtAl7MgdPW4ih926GYqvzPMHknXW9GwoaLpTFKpY2SYwAJwHQLBiQIifI7
	e1HQyZCHMdajD5dbE0FHnNl0r70zOqmGakFHDm5jzy/G7GCT8jcmYzZ9/57zKB3GNMnnD3KquqLvx
	2HTImJESH+kCZQNrR1n1ePtSNfxoamDcthH3oatyE9Is/MPf1gzkURoy5bZsPk/8aGXAK1/MCT+tJ
	ws5T3StQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzcY-000000095HP-3O3b;
	Wed, 14 Jan 2026 12:05:06 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzcO-000000095DJ-0gTO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768392297; x=1799928297;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=8Vys6z8x451y8jCfmv4tHJdqji+vE+8qZ4G6/y7V1fs=;
  b=bTleEYBvTPwiLQ7JdoJfPVn5CnnqxLFhU0cJXLT/WCocWWV+IrIsxH9Y
   m0O+NZ88XyF+18CNPzRXV+VuIKzKFJndh2UouFGnHK9RfHykWen8hM8Im
   PECNs5SOYDUMPhMAWf8HbHONDZDsw9jmPT9dqONtaIK1DCp6WyyL82VuX
   Zz+6jMwMlMN02c2QjbeqHSXes9D9feSJOieYOPG5rpAUDvOI6rLE7hGLU
   bjjZ/Z/vDvGUICwkPtxPbV8EW/++9bKIrK8N4YTpLbW8kU1guoQY1ubiV
   7p7sjp6LuDgrBeVkI0uCHxM5QBqbrGD/Fka48fmiW5GEl6U2SqTahuao1
   A==;
X-CSE-ConnectionGUID: J6TU9m2RRN6Rsk5pL/b8QQ==
X-CSE-MsgGUID: IacYwwR3T5ik5sTSeMCWTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69608382"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69608382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:04:56 -0800
X-CSE-ConnectionGUID: L5TFJIbzQHuz1awGSe6Qmg==
X-CSE-MsgGUID: UaaRHJhvTS+nCq8qGoc/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="242205696"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.94])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:04:48 -0800
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
Subject: Re: [PATCH 4/5] accel/thames: Add IOCTL for job submission
In-Reply-To: <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 14:04:44 +0200
Message-ID: <1acdffd8f05eae0a3531d43d3919d8bd4558f37a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_040456_250167_9964F832 
X-CRM114-Status: UNSURE (   5.50  )
X-CRM114-Notice: Please train this message.
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
> +#include "linux/dev_printk.h"

Random drive-by comment, please use <> instead of "" for include/
headers.

> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_print.h>
> +#include <drm/thames_accel.h>
> +#include <linux/platform_device.h>

In general, I think it will make everyone's life easier in the long run
if the include directives are grouped and sorted.

BR,
Jani.


-- 
Jani Nikula, Intel


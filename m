Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777B8CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 00:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/p3aeZ2469/VM/d0M9zdk0kPze0+6RFg7wHHi/c7B0=; b=0uMVoBsE4P4T8LPrz4JRGaJtF4
	kv74LIdJdlY+c+TW9DTe6rR85NmH03c885yMc2VKPWLUFv5066E5uJ6j7Kq8dV/QsDp+JfxH41VC1
	pwXqc/CKDz0saPeN0YxmyqEOcOM7Tia23EKqvkJSv+HGJVBG+JwN6crQiw9KRcjFgQ4kENstW48mk
	UWMKTIvBlBxPo9d51TouiQ+lSXXXYdkUaPAm2liOsc7rTkc4A3igQgA7/jDJ4YIcbkqF118VOq4j4
	S9oqG5KryFqYi64ug7YP2gD5qnU4afsu7MaoEypZBByfqEkxTvpLhLL0KPgInbLm5KdVY7mk+yEgE
	/t2lY5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NRF-00000009aO3-1Ns3;
	Sat, 11 Oct 2025 00:26:21 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NRD-00000009aNa-2WVy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 00:26:20 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0Q50l873552;
	Fri, 10 Oct 2025 19:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760142366;
	bh=R/p3aeZ2469/VM/d0M9zdk0kPze0+6RFg7wHHi/c7B0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hDH8fMnLgbrB7LY0TQ3tcyNLCT4MT2KL3fZvuefzeNZtAkw8uovEQYun2vfA5zu4w
	 a/SxisuUxhrcbzY2RlpyIuu2/J0vNyvWBDQyMZhwCSSFvbNc0QSZwtT2nR/sigzwUg
	 ijSyUGBEe2Zd69Lg0WzAypRs/Rgs5wioZQFvieyI=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0Q5I02575496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 19:26:05 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.20; Fri, 10 Oct
 2025 19:26:05 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Fri, 10 Oct
 2025 19:26:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:26:05 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0Q4s02432767;
	Fri, 10 Oct 2025 19:26:04 -0500
Message-ID: <a8a35f8f-e962-4a2d-ac56-46306c0c1658@ti.com>
Date: Fri, 10 Oct 2025 19:26:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] remoteproc: core: Removed unused headers
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-3-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-3-7cecf1bfd81c@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_172619_731996_E79E9EC1 
X-CRM114-Status: GOOD (  11.51  )
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

On 10/10/25 7:24 AM, Peng Fan wrote:
> There is no user of crc32.h, debugfs.h, of_reserved_mem.h, virtio_ids.h,
> so remove from the included headers.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f7d21e99d171667d925de769db003c4e13fe8fe8..8004a480348378abef78ad5641a8c8b5766c20a6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -17,8 +17,6 @@
>   #define pr_fmt(fmt)    "%s: " fmt, __func__
>   
>   #include <asm/byteorder.h>
> -#include <linux/crc32.h>
> -#include <linux/debugfs.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/dma-mapping.h>
> @@ -30,14 +28,12 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/of_platform.h>
> -#include <linux/of_reserved_mem.h>
>   #include <linux/panic_notifier.h>
>   #include <linux/platform_device.h>
>   #include <linux/rculist.h>
>   #include <linux/remoteproc.h>
>   #include <linux/slab.h>
>   #include <linux/string.h>
> -#include <linux/virtio_ids.h>
>   #include <linux/virtio_ring.h>
>   
>   #include "remoteproc_internal.h"
> 



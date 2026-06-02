Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A319CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9m8S6JyUzmFdM3Udt7t3oE3a4LWGNMVRc638npnOlA=; b=sftIHJx/YQDb6t2gUzP2n43U9A
	6Fb+Uvv3IVkqcyKTAbsDTQoi/kFvJJIvyo81+F8CX4i7FgCaWK66sgQGUw9CQxqHBWCZV9P2bMbfZ
	Uus9RI22yo19wxisqEDIG9lsBv+0D8twpQT3LwqOjCmu309UgaKv4UooO/ACxd6k8v9gZT94Z1mRG
	Cc4u0RdRe2WwzE9d7fYveECRTCGOiFs+lFOh0wfPvjtiDO7scoj1GJu501jRpVHXEarC8vD3LKAq3
	WdvPqkMPNzxv3EiT/YEcrqVECt7DbAPbjx1YdpMhM0KodKoGQ6LDVOBgXlLdufMMEKOlVdktoClXt
	ysfNKAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURU6-0000000DNea-0Z43;
	Tue, 02 Jun 2026 15:56:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURU4-0000000DNeN-1rg2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:56:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBA3F60154;
	Tue,  2 Jun 2026 15:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849271F00893;
	Tue,  2 Jun 2026 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415811;
	bh=Y9m8S6JyUzmFdM3Udt7t3oE3a4LWGNMVRc638npnOlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AdWaTzp8bzhTy5l0gOgtLBl7/OluUXVmwcSlruLQ/GZvBbsPcrQpSp+blRZYNyjtX
	 WnEDa6VNN6YQEWRiJrKk/RHRbg42aP/BgbcLeOuJODmT6Und49Og3J4tPcbEZj0Po+
	 F0mLEu7LJCv/MP43R9uhOZerWE5GKhFiRjO2PWBBbmxX9v9mpomt1cZzxpLRc0m4VI
	 EKpHmXtZghsRbyaaKYcOIni+KJU+GX0KpJzT8cOxDDEyQC1LofR/Uwtc9c/CWLm8Kc
	 LCWD21iuy4h8XkdHPe2+ECus/QeMj+bR3+x7C6UWbiIETbfCLM5Fwn8Ox2eqk/JvWo
	 Cgk+OqXh6Copw==
Date: Tue, 2 Jun 2026 16:56:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Seth Forshee <sforshee@nvidia.com>
Cc: Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Honor maximum RX/TX buffer size
Message-ID: <20260602-grateful-elfish-elk-413154@sudeepholla>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-1-c071b12ae05c@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-b4-ffa-rxtx-map-fixes-v1-1-c071b12ae05c@nvidia.com>
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

On Mon, Jun 01, 2026 at 03:45:11PM -0500, Seth Forshee wrote:
> FFA_FEATURES in v1.2+ supports a maximum RXTX_MAP size. This maximum
> size is not checked when page-aligning the RX/TX buffer size, and
> FFA_RXTX_MAP may fail when passed a size greater than the maximum.
> 
> Decode the maximum buffer size returned from FFA_FEATURES and limit the
> buffer size based on this value if it is non-zero (zero indicates no
> maximum). Include verification that the max returned by the SPMC is
> larger than the minimum, otherwise use the minimum.
> 
> While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
> consistency.
> 
> Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Seth Forshee <sforshee@nvidia.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index b9f17fda7243..dc45724a29ba 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -32,6 +32,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/mutex.h>
> @@ -55,7 +56,9 @@
>  	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
>  
>  #define RXTX_MAP_MIN_BUFSZ_MASK	GENMASK(1, 0)
> -#define RXTX_MAP_MIN_BUFSZ(x)	((x) & RXTX_MAP_MIN_BUFSZ_MASK)
> +#define RXTX_MAP_MAX_BUFSZ_MASK	GENMASK(31, 16)
> +#define RXTX_MAP_MIN_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
> +#define RXTX_MAP_MAX_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
>  
>  #define FFA_MAX_NOTIFICATIONS		64
>  
> @@ -2086,11 +2089,13 @@ static void ffa_notifications_setup(void)
>  	ffa_notifications_cleanup();
>  }
>  
> +#define FFA_SUPPORTS_RXTX_MAX_BUFSZ(version)	((version) > FFA_VERSION_1_1)
> +
>  static int __init ffa_init(void)
>  {
>  	int ret;
>  	u32 buf_sz;
> -	size_t rxtx_bufsz = SZ_4K;
> +	size_t rxtx_bufsz = SZ_4K, rxtx_max_bufsz = 0;
>  
>  	ret = ffa_transport_init(&invoke_ffa_fn);
>  	if (ret)
> @@ -2118,9 +2123,29 @@ static int __init ffa_init(void)
>  			rxtx_bufsz = SZ_16K;
>  		else
>  			rxtx_bufsz = SZ_4K;
> +
> +		if (FFA_SUPPORTS_RXTX_MAX_BUFSZ(drv_info->version)) {

This is not even compile tested ? I don't think this is defined anyway.
Anyways I don't think we need this condition as v1.1 or below had it
MBZ, so it is fine to drop it.

> +			rxtx_max_bufsz = (size_t)RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;

The cast is unnecessary, its is 16 bit, so max 0xFFFF << 12.


> +			if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_bufsz) {
> +				/*
> +				 * Per spec the maximum must be >= the minimum, or
> +				 * else zero if there is no size limit. If the SPMC
> +				 * violates this constraint, use the minimum as the
> +				 * effective maximum.
> +				 */

I don't see any text implying the above from the spec, drop it. Please point
it to me if you find. Even otherwise it seems obvious here and doesn't need
the note.

-- 
Regards,
Sudeep


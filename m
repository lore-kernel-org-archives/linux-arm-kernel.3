Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99051606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tLL2OjvW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SOBq+xfr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=908fhrM1HlZfTYgmWBBmx3EXBJTSRYE/1Nc7g2kDk98=; b=tLL2OjvWyjYiOS
	SjbCczM1eD73tvbrHJIw2zC5O9Ayvlyx3R40t5XI8/EIRo2AcxuyG3m/vdY4Hgu0zRgy5bDKeihr/
	4M7/78+/V9qpN1nWMr4Tdrt+la6qyoUKgBz3kXnYmxSn23uigVylLC16JzGR3qa37T8mn1qxfveV3
	WOSk/RL5MYPHMmSMPbTj6co0DBTLfKBjP39Xw8JgkpOW0eVWeMWtl8LYMJvDxA0zpTn6n8NEkd0ni
	q1brCjj9aCcqWAEZ0NFmvikLJfB6sTLXNJEfuL2w850Zj4iww377pUpbzaiqHlDzvnU7fSC+JV5TT
	kZn++duXUnfdMEF3DGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWJx-0000000EZsc-3PIh;
	Sun, 01 Nov 2026 14:14:05 +0000
Received: from out-89.mta1.migadu.com ([2001:41d0:203:375::59] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWJv-0000000EZsD-1BIe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 14:14:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cYMHJdYJyH2hnxqe0M9Ky2nfXrZcnOvPqcgoIDJjcvI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542441; v=1; x=1794147241;
 b=SOBq+xfraJJp8nTTBpTv50QeDYHVixvYawFSkryoSeO9lxAoWZZsWP45cXImuCjYTZSCDQE4
 FoqyVqo2Y0Q7Oa3xEfp7ix9qetMW+9Og3dDrTLCbZpjUwVenP+Zo1pwm4zK0p7z3u6ut/85Pf0x
 0S/bBBs7WuU/RI9kY8PMan0A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a05e464f0524c77c;
	Sun, 01 Nov 2026 14:14:00 +0000
X-Mizu-Trace-ID: a05e464f0524c77c
X-Migadu-Flow: FLOW_OUT
Message-ID: <c12f6a9f-983d-4704-a90b-3453ce984a2c@linux.dev>
Date: Sun, 1 Nov 2026 14:14:00 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] drm/tidss: oldi: Fix cleanup on a failed init
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_061403_488143_A86A2982 
X-CRM114-Status: GOOD (  13.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tomi,

On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a later
> OLDI TX fails, the bridges registered for the earlier ones are not
> removed.
> 
> Fix this by calling tidss_oldi_deinit() in the error path.
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_oldi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> index 506507e83112..7344d86e1f13 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -638,5 +638,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>  err_put_node:
>  	of_node_put(child);
>  	of_node_put(oldi_parent);
> +	tidss_oldi_deinit(tidss);
>  	return ret;
>  }
> 

Since tidss_probe() (in tidss_drv.c) calls tidss_oldi_init(), it also
calls tidss_oldi_deinit() in its error exit path.

I think this patch is not required.
-- 
Regards
Aradhya



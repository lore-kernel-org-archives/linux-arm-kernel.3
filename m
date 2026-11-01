Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WVtZkqB2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pc24P/jl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XSCBRN33qQsy8Auxjft+8kvMXuANLfWvZcIctPrMpas=; b=WVtZkqB2bDvZdE
	EfdzG4vFq2ZZEDNJs2Ajny54SRteEFFJVnCZGtaVmGnuInGFE6rKLeJMBXXr1T7pQ8C6MGQZSzbbh
	f+jysEADm87nhA3EREIDgfaAXEagXZIBRquchJGRh/vyyuz34v5BpaJJZXQvZL1IogQKsTbSVKbod
	przcpa9ku7V7DZgT+Mm1rpBgIWjwpqgE0a60U9OxlXmOqBBB0xVtWslIVkPfVcc0FRnIORMrG9bHI
	snwjK1+zPUPhrROs8HGoU1cxaqZ9EphIVAnaDJnA/ofvkImwxAnKRF3WGvOBwJ3tWcf3qCr2kRYdD
	biph0kT2MMet2ygiyoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVxD-0000000EYKp-1KXf;
	Sun, 01 Nov 2026 13:50:35 +0000
Received: from out-203.mta0.migadu.com ([2001:41d0:1004:224b::cb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVxA-0000000EYKG-3oXv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 13:50:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=H/s3VKQo6Z5fR1WbNIhwJli7PgqADZcHiVAAOisPb3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793541031; v=1; x=1794145831;
 b=Pc24P/jl4DNHuiBNxex6uzO6LR6dk7swpKTlTQ3YsA1IbGEC4hOBltfiDabywVGsnrpyDocA
 DGTrj7snn/tGnKkZeZ3im9eGAXntES97lgg5isCMnFpLhzEhIB5zA6jVkDJ+p0Kwqj0HJLh87Po
 ja6Ok4NL3eaTaU/pDRl/KVNw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 99df9d40205e812e;
	Sun, 01 Nov 2026 13:50:17 +0000
X-Mizu-Trace-ID: 99df9d40205e812e
X-Migadu-Flow: FLOW_OUT
Message-ID: <bec5d30e-4d65-49ce-8445-7f417d1a5060@linux.dev>
Date: Sun, 1 Nov 2026 13:50:11 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] drm/tidss: Add helper to identify the AM65x OLDI
 video port
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
 <20261029-beagley-ai-display-v4-2-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-2-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_055033_087292_EB10CC4D 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29/10/26 10:18, Tomi Valkeinen wrote:
> On AM65x the OLDI TX is modeled as a part of the DSS, not as a separate
> bridge as the newer SoCs do, and is fed by the first video port. To
> handle the AM65x OLDI, we check for it in multiple places using the
> feat's vp_bus_type.
> 
> However, vp_bus_type is problematic concept and should be removed, so
> this commit adds a helper function to check for the AM65x OLDI by
> looking at the DSS subrevision and videoport number.
> 
> No functional change.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya



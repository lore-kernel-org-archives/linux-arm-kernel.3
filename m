Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAB3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=STt5YVex;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BurmkMJK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LWXBlZLPzKnKaNGDns1PDTQof10SihzxvuMClE89woY=; b=STt5YVex4du/fo
	5Ji5YBinMaXKGFdlHOoM7Ym9/RARnX2Z8KfmipwLlCD0TuIHEes7B+0E6cjHG2u0Ord4ZBCu8FgNI
	g2zBFnB/M2w9GNO1yMwVcCmSMwIwYSVLtKiyn/yuUVv4wMP5BcaGvP77RajSv9Grm+HFBMpcHwv0M
	ISIGQyyamrcDUCVsKKY0i6wa8f+KwSrCToaiSfL0h6/RN6/qyjmiE32GNMzRJnrxyotTRlgYCoEWA
	PY/BH7tH5Hr6qIVUFs/dWU3TCr6Z6vPOkoi76Ehf32tMVXP7VuZhAoSMeMZkEey7GgwfkhH2GMvn9
	+RetgPnQGYl/WzWDH0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWMz-0000000Ea3e-0eNn;
	Sun, 01 Nov 2026 14:17:13 +0000
Received: from out-204.mta0.migadu.com ([2001:41d0:1004:224b::cc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWMw-0000000Ea3J-3D8Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 14:17:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Mr3FrvXdJqV++CzeIDT2YbM/X6OsDRN2jwhe5NJSwRs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542628; v=1; x=1794147428;
 b=BurmkMJKg76iQ0+eVR9kVIv/TufYb6x1CY+Mt+sWnb271cCbyk3sT2Yld73jF/xNXTdBOJ0e
 HGKwYcGV1lKRjBaGeZ0WW3oQ7Vm+kpMYw4RSt+YYDGciCN6FG+DxozK/kTht324AhgHz/2aUw4Y
 zRUuAJ22xzGfAM7Ymtg2TLQc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 65d1e23b5d0d19f7;
	Sun, 01 Nov 2026 14:17:08 +0000
X-Mizu-Trace-ID: 65d1e23b5d0d19f7
X-Migadu-Flow: FLOW_OUT
Message-ID: <51403482-bf37-409c-b3f4-cd957f34c1c5@linux.dev>
Date: Sun, 1 Nov 2026 14:17:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] drm/tidss: oldi: Fix wrong return value from
 tidss_oldi_mode_valid()
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
 <20261029-beagley-ai-display-v4-7-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-7-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_061710_947356_2FD7E68F 
X-CRM114-Status: UNSURE (   6.71  )
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
> tidss_oldi_mode_valid() returns 'enum drm_mode_status', but the current
> code returns -EINVAL or 0.
> 
> Fix it to return proper enum values.
> 
> Fixes: 86db652fc22f ("drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>


-- 
Regards
Aradhya



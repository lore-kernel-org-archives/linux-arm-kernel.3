Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47015606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=heaVxx6W;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xOTU7mMF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L7nC007n1UoC31+bUEjdNbMK1h27JQgcUX6FHEn7wjI=; b=heaVxx6WtrKNjn
	gE+xatmvF7SzDcM8q/8/c0Vl8d1mVQRBgBvrc9VxuBICL7oWPqEOihFak3zNFijeEB2pcIxNziQ9W
	xAQUwBf06Mg6mJPAI9+3/VaPNM56DpagYIMYy5ze4727eWD3zEYVPR4ZHQf8s3gR2tXBSMIO7zUad
	59ZX1MshOvZ60CmsUtfTaNuJwj2NM/aXc2NGvhrUnvB7eJuoPy5C5NKtG/weMBa3hS6q6Pr1EtFUV
	7aXBWjmWzvYSfueuty7XXJUsSOVLuSps8GH2WuOOjAH5kTuk1cttFbTvhBltUSYcS4Z179t3mku6a
	WPLCiCcReWVZ0RhVGqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKS9-00000003Yld-3QxP;
	Tue, 03 Nov 2026 19:45:53 +0000
Received: from out-150.mta1.migadu.com ([95.215.58.150] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKS7-00000003Yl9-14xB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:45:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DqgJmYvW/WYxuocn5VZljrjSvENrQMdWD4e72HV/Je8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793735149; v=1; x=1794339949;
 b=xOTU7mMF+oS3Rx9JR6fkpmMoHgt2fVZ/uNc0AniMa0hFGQLrZARrnGBVP82colADPqViQrtS
 5LGWaAMIMCokkFgCss6zWVOx9D1VXv4DCQkcUg70nXyVXoLx1nqtclKT74iDY6YxNajO24R/+86
 yk4dD+6yalTcgGs9nUNH41OQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1b57e00893805f86;
	Tue, 03 Nov 2026 19:45:48 +0000
X-Mizu-Trace-ID: 1b57e00893805f86
X-Migadu-Flow: FLOW_OUT
Message-ID: <dbb34880-2ca1-4c19-9efe-bb2db51f5493@linux.dev>
Date: Tue, 3 Nov 2026 19:45:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/15] drm/tidss: oldi: Add power domain support
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
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
 <20261103-beagley-ai-display-v5-12-f1c8d0e52bb4@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261103-beagley-ai-display-v5-12-f1c8d0e52bb4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_114551_456107_EFC90DCF 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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



On 03/11/26 11:34, Tomi Valkeinen wrote:
> The OLDI TXes on AM62P and J722S have power domains of their own,
> described in the DT, unlike the earlier SoCs. The OLDI TX nodes are not
> real devices, so the driver core does not attach these power domains,
> and nothing in the core turns them on.
> 
> Add support to attach the PDs with dev_pm_domain_attach_by_node(), and
> manage the power state of the returned virtual devices with runtime PM
> functions.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya



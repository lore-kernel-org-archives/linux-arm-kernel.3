Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25374C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=; b=Zx3cd7W82oS7MhZwUB3ggumodn
	0scF0aMGmjY4i8b3XzL484RGLwGCqaj8kHZDmzsmNhFRrmT4hUehyCFl608NmiKiN78DBZzkXD1qt
	/AcePhx7hT9M1McroFLBYsDSnbRpwJeLmV9b14EarefBOcQ/XIXdhM94spyqxJU70MrLeZ9ASuHUl
	LSyk+ekVrGtMCFPu7ozjvPdNwi17slL0M4pH+drMPoL/qEPMbl4yzg6yTQlFzPBJsTHFUw5eOFWJm
	dyS4iRMdDImtDCdfOUPDxehZ3CPuCLU36tQraJYU303Ldmt/uQaJanE/8qOT2c1+64okypYVPpw4u
	ZK/KHmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWP3-0000000GtQv-28Dm;
	Mon, 24 Aug 2026 15:16:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWP1-0000000GtQ7-1KGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=;
	b=Rsq3X5AidFmPk9E2lkTPsaFE6hDjJUMoiDm4fTzugq0pRU7ZTk5kjsuFFtaM09AyUUVzqp
	kb7IrdINmxp9vSro6IbBUi83hv/1whPpaqR32nxn7gKeqK1h6c3YgeRHgs2PfLre/aDwrb
	TNtOlUTZgPA6n1d1cT+CfgxMLFuY57s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-hTM6E7mzP6y2K46nxnTEXw-1; Mon, 24 Aug 2026 11:15:57 -0400
X-MC-Unique: hTM6E7mzP6y2K46nxnTEXw-1
X-Mimecast-MFC-AGG-ID: hTM6E7mzP6y2K46nxnTEXw_1787584557
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90a60102d6eso25273266d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584557; x=1788189357;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=;
        b=IXEjaakbvKjMctMF5F2Lc9zSgoo+lgX/uUptzZ0eozeaRIsNVjgVFhsH3LAOKFuoVA
         PXICOMhwhDM7YnkaoiD+b6xxGhTgaG9WUx5xg2X9gXdBcO8VwQy3E5KRgeKfUVfUN1jU
         JQ25JyELPWdRI9W2QBl9eftp7bv4dVZBMw9mtVbM17B3GnrqhCrxpBMfNOOJBvb7kdW9
         VSVQsXAVYriiD6P7/eTrhAIe6RbaunDi0dKvPDoAD0oidgACODjA46NCCUIGBhif1VpH
         TXn5EHg81lhudG+UkZse+wUdQAk8yRnn4wSGiyFBFU3iVUqQoMiv0NSlILzNzCltYRML
         8hQg==
X-Forwarded-Encrypted: i=1; AHgh+Rqw+4FySvmz402YmY+BJZ2mnfwFZDRDxgZfejd9PBqoaONdSHYB0qVsxpGXYoRIDjPW3sMZbYpYY9kgDi4cIiXd@lists.infradead.org
X-Gm-Message-State: AFuF++m2dh9az6c8YRyFSjvcBrtFl1uc/q7s/b7tTI4MqI9BDVVzgb+/
	EgRkqMEVw7l6Gc6JiT9rGnDh2KLTuvpnQfBAl6ElHmnDzpLtDSuqB1tKwFHhkLzl5ZffxAB/Nx1
	CmdzX2JRtuGYBTTo5e41rqnzJdIufAuZGycVYCT5ovSkbzgOYXLp+nBpSBgZIJN/iSE6ARZygsh
	0s
X-Gm-Gg: AR+sD10/c2pqigYMbwIkdIOh4FKVaZPtFPY0tjy3ZDzXhg8fteBc47tviNmMLme+T6x
	26SBA5ZaIkKYG1NzfZJ1pxLaVBNF0IRg5w/t/sCxg4ZVNkBZNPNxu+qk+Oh/3d6E2psT/TlFIgc
	bMB2PtOcdbmkdBByMaideEQeCsWGhPbViFOi9bSk9DBw8JHOhfhg7TyJ+V6lruIDVZ7MVE42nwn
	MXVVtpYs1vi3idKYIxQzd0AdHHRQq10y41zhADNh7fRAwWTHxK6rRTkRQp83jvtjUhLMF8++45/
	UT+jCiyLJc7CxJBbbKGGuUdRpba+3CedbsNZRgOI102FUoIQB60Fj1dA1QFKyDu/ey3zvjrKUAn
	yeR2DPQpkC5v3cQ2b7DJ05MjZGcTqjIIqPG0=
X-Received: by 2002:a05:6214:3c99:b0:907:5150:a2dd with SMTP id 6a1803df08f44-90c80de23camr297867656d6.14.1787584556636;
        Mon, 24 Aug 2026 08:15:56 -0700 (PDT)
X-Received: by 2002:a05:6214:3c99:b0:907:5150:a2dd with SMTP id 6a1803df08f44-90c80de23camr297866236d6.14.1787584556058;
        Mon, 24 Aug 2026 08:15:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c939314d2sm64503026d6.25.2026.08.24.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:55 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgKneyW6uUtrVs@redhat.com>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LfNil4q3E5iF4jhe7lKespufSGtrIfxHp-kkc1-B-dA_1787584557
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_081559_432036_88B02F29 
X-CRM114-Status: GOOD (  13.36  )
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

On Fri, Aug 21, 2026 at 12:03:02PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF36C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=; b=neN1Ies1gHGizCgLAANah6Jq+9
	LL0GQYYq4WhaYmpvi2jPGrJCkE/XjQ+9y9hCy5F7R70RdVy1kGNcm3k5kJh8SmnQv/9vKpTjMK/Y7
	LFZnUciqysIL9FBTbHBi9uEUXfFe9l/PY6eCoKz6+A20+fe+2Ta3p26Flzgrqd8s4KwwVkgJ4i/8Y
	QgQk1p2zpg4Th/Loe+iKgV5Ym0akVS7EdjMAR33xZccpHZYiaV9WdMQLdAxwtx82FgH5uOOdrfLQn
	Ntofq8Qk3v+6oVKIlMdZ8caI4kMB83czURi/L85HVjZdIroVbmfVZf/nqo0aD/w5uDw09Wg/oUapM
	x+w1SCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWPI-0000000GtV7-2xAd;
	Mon, 24 Aug 2026 15:16:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWPG-0000000GtU5-1Onf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
	b=ZrCLflZRwXXcDEQ/4jd7Rjwz8A2vAAbTAQbJ0O6bYi+nk1nIaoE2Vhj+9fZJ1xBXcoN3hY
	vn7gU9s/F3ZLhltiyi3ayIHKboNMDCmoo1AU4zgPZI4bHdzSSVeXKgpAjdTiEen6dBcVGP
	lcweroFzyHz1dB+tUqQJp5wddcu9ySU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-LP1WbggNPJi83wBbuJCgwg-1; Mon, 24 Aug 2026 11:16:10 -0400
X-MC-Unique: LP1WbggNPJi83wBbuJCgwg-1
X-Mimecast-MFC-AGG-ID: LP1WbggNPJi83wBbuJCgwg_1787584570
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso51348041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584570; x=1788189370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
        b=FPTZrxA2zNSlegDZDO0Bp2yVUrXPQKCtcManKrGI8M9+huT9H/kgZ/Bl8iwLZLeswn
         HQ69zXmIZFW6BCns5AbZDqpVk92HLBGL5X8imT7BVeYhR97eqXbA8810dJQ68AHMOypb
         a/QbJEQ5EBYOXpvivWmuMDubV+qZ+ZQJBSt8UbGQoUhZ1xlbHJaOHeSUpMliHXYE+it5
         X/bJuzT3vKPpOkGZRBPaIgZ2+eB/38eIlnjldrD5XXY8Gl5MNO/kUZbV1vdfRfdlTFH2
         fB2pZxINYrxwWkhU4/RGGitZL+0OGAFrvlQ1yd/TxDhdDEks5jbqzSlW5nGT1Jil3ITn
         0emg==
X-Forwarded-Encrypted: i=1; AHgh+RoZSox0OayjJ5Pv75eENaRTwHZKyi82d5A/eBpFbHwzl3dxkk0ei7g8XYVl+2Mc55TyL5lbEm6iiJE+bADM7pJD@lists.infradead.org
X-Gm-Message-State: AFuF++msttvqxMmw2cFm7XEmN/nWsxn5lPiLR5TCXUEOFTpF5X91soUo
	UPC/pKei6/h71ZatmBkh07nfGHhnYlAgDl5sTltewIqXuaN3x0Oin4Q3xa37i0sIe/rhXIZoPJd
	bAKpSdkW9ZmyCVAShL5dsa60HlvVPo/BgQ2Lt3DMEJmEDrpk0zGh8vG7wGhnQ61FinpSt+IMV3E
	4J
X-Gm-Gg: AR+sD11bvTHrHiknjJ4/gpCpWIsKTq5RxWuX3Bpkd8The6VgELwt08AgLbgglLnWwJS
	FmDikJVuCEzFC3qWGtAce7cFjwDf3NozPL+NqqPUQT09B6tUQLR/sqei/q/4gR4mwB3qKH3w3D3
	wH5hTKR371NmJymDLJrsnpuqIpfNk4aOERdiGZP2GSwUCmFtLqIs2wa9jhzkfv9ZJT5FCsmJrjc
	7Ppxtsk8nHNnguYyq5CRB65lnbaD+Cnt/yEmfG313ZYtTqb24CB1Iiq1xaqfw+LUHmAQZlrsRTU
	6iovFWGjk0Z7Pv5LGX4dfS3HjcSmg0LW7QYWCtuPoLQwI56OAbKecy7EVwUM0bnQ6mLUAqJDdh9
	1RHlGsbSQXT1mYXjhjDNAJbNBVKMxdwJPy5w=
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279729881cf.8.1787584569724;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279728951cf.8.1787584569268;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4c1a1sm63772856d6.34.2026.08.24.08.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:16:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:16:03 -0400
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
Subject: Re: [PATCH 2/2] drm/tegra: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgM9vY01nLeX_f@redhat.com>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cSjtHN6g0EmbJ9s5lz56rJvMW5LDbz_Og7YBLdg3o2M_1787584570
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_081614_448135_631F4F67 
X-CRM114-Status: GOOD (  13.24  )
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

On Fri, Aug 21, 2026 at 12:03:03PM +0200, Geert Uytterhoeven wrote:
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



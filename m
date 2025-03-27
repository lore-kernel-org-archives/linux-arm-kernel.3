Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6B3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcvekZQH+j+p97YeB4/yEpAZzvs9KIEsKULl/WK/9vQ=; b=AsUFO3uXdPY1hklkxMGZDVUMql
	VndFHGgKDQ132dmVuLmRIeYYws/uxfG/KTsSdrawGRvAX0E+oljIONmQrmDwWhfjvFVjAV+ZPEiyz
	/af57PEXgrHF00UztZhVxQ1Lfy7Je2Ncs7cWWm0nyjonqwWdPnwLWbJZTtLftr4SUZGqyeA/46RfT
	hq1G1+JdLuYKiRSFmD9ttuIUr/XA9cSx+ik4lEbzvl7V+1+D5+M+uSuiNzJlY0TCHQbZl2HRwNxlP
	LBs/9fPsLSDSiljOpmD0WSjwBVH3QopHuZUbOrnotZ6Ag8XMUtTbKCnBR0t/TmsCVBKvs2rmALF7J
	J42QKJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txouv-0000000BKbt-33U2;
	Thu, 27 Mar 2025 15:13:13 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txojU-0000000BIQ7-2RIb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 15:01:26 +0000
Date: Thu, 27 Mar 2025 11:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1743087681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IcvekZQH+j+p97YeB4/yEpAZzvs9KIEsKULl/WK/9vQ=;
	b=PBKCEw+kRjk95sKh2ZN02rlprYFY1nx3B1WFeMmw7eLoMLXmyGrSSLAxXkStIsfagZ8zmt
	T0udX4ZTrsEPWsOGQl/xc4tctgdpgepLyZMh4KsRJGGfbfNGtotW+VZAuorJzQRKIjTMky
	GQ4SPU30Sh6aswM8Z8+OQya2j/4jo57b6G1LEc/9Ay2kuP0t0c9lluUYtYgCAvhMalgSUI
	HHvev9srG7jpm8+sI+1kgVsJ96knrCfxNuQyGHO3kTVcCGx9BJt0XOPYxUr8EERyuaen9S
	hKKn/BEI08vUpHLo7MJAJJmATNahJhpRf5mDypvOmC/qWx+5yc61WPwQX31eLw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neal Gompa <neal@gompa.dev>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5] drm: Add UAPI for the Asahi driver
Message-ID: <Z-VoO7l5xzuN5RUX@blossom>
References: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
 <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_080124_756890_9ACA5D44 
X-CRM114-Status: GOOD (  12.62  )
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

> > https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v5 contains
> > the DRM driver implementing this proposed UAPI.
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 contains
> > the Mesa patches to implement this proposed UAPI.
> >
> > That Linux and Mesa branch together give a complete graphics/compute
> > stack on top of this UAPI.
> 
> Do we want these links to be present in the commit message? I doubt
> they'll stick around permanently...

Permanently, no. But by the time they go dark, the relevant code will
hopefully be upstream in both kernel & Mesa. So I'm not worried. Not
really weirder than any other links in commit messages we have.

> This looks good to me, and the referenced integration code also looks good.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>

Thanks!


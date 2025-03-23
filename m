Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B75AC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPUcsPWWa2X9NKfpybVnP9b2BUGvSK430jlCkPrgcYg=; b=xUMW+6ltL3SgUA1ejITZOxIgPE
	notZ9heha9jHrJCIuo3pOKQurn0lxDcG36QNz1tQYdsTwSXvu3ZnPJFAoxpbzk1yStIVxcAc4D8vj
	aCsqa14umLyreKMTUEakCknd2PxpDuuC2OGG2ugGiHgFC3bUfRHC63KL6aRhepnF5wKG4tu6ebi/H
	902hlngdlHnj5NGdfsMW0JUp25N30N+FSKwrtLH7uBgvv4rDkTJWBS9fLn8Fj+JoXRU04tbuvbjm8
	0X9fc7bzUHgh+wr7d7oId25B3xgO9Mwe9qpV2Fb+SPA4UTeu+kT67WYyi8sn+m90qUlel/N7I5c5L
	ufb0b6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUyd-00000001vyi-2Aq7;
	Sun, 23 Mar 2025 23:43:35 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twU7T-00000001r5K-1uCW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:48:40 +0000
Date: Sun, 23 Mar 2025 18:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1742770117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IPUcsPWWa2X9NKfpybVnP9b2BUGvSK430jlCkPrgcYg=;
	b=pPcWRwJ6ULwbzFVnYhIkw85Ou/fbeyBqqixE9bPjue5gt4XnjsIwZtqv/W8AOOimwa//lw
	MGeQNOeLPbmVR4Uyo46BmpfX7ZGdrSley00lutcJsJ0Wpcr2x4oaYsBYKei0QTrvg7djta
	RF22Z3ZIY7jDI5SSCYfwpPEY/zAcQ5Z3M143egmgItXDXvPjsyLJfWiTEckWlVTJLeGhsL
	8zRsfeddKqwItobtsycZyajOv3GLCEWP4k2k+4qrEEjucPkaAWbnM391NLpwvYC907xwjq
	AZ7HfTVC+7PB4IFJv044IpsrUy4Lz2wsJejWoLjKXioqgx1zyBbtCFEYQnthnw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
	linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-CPspG_Cy-f-MKe@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <Z912pMazVwHKLi72@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z912pMazVwHKLi72@phenom.ffwll.local>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_154839_630918_4259FEE9 
X-CRM114-Status: GOOD (  11.11  )
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

> Since this is a deparature from our usual requirement that all pieces
> should be ready before landing anything we had discussion whether this is
> an acceptable one-off exception for special circumstance. Thanks a lot to
> Alyssa for driving this. The very much summarized consensus is that due to
> rust this is a special case, and because the userspace is in upstream mesa
> and lead by people who know what they're doing and have been around for
> years, it should all work out. As a stand-in for that discussion:
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> But Dave&me very much do not want to make this a recurring thing, please
> don't try :-)

Thanks for the ack :)


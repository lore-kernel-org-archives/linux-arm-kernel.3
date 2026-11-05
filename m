Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3946082BD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B9VAPCbG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHt7HSGu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4QpYJSS9gn8AjXi8jX/3Dtqw7BlVuFU8dH7dnogBVO0=; b=B9VAPCbGZ2xPnR
	KWXh5RelXsie36flmfVygaqPMBxnBx4iAskj0zxowL//ys1Lhuw4UQlrNEc9fW0mhLP/qGSu22IVq
	yueCBrefMHa6r5uhSOc+dR05PV5CHt3WB3FGjP6hjojWdBKW7mfD8bmiwCFIH+r4B+Sc5j3uTwk8T
	SHZt64isMUWGs4A5iqemxpD2RsVcVl6ucatf1jgoKZ4qtymKY7U47Op6n7WAFwWWZ/7yN5724Hmhj
	QRlSl6SjGgXppNJweFKYK+dBhF8BFQmM+r8rhs5wjRt/dc48zuiNMb7QnSh9A3JajS/q3702kQbqV
	OnXulHFX3cSsmfJNVODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEU-00000009EOg-3Llx;
	Thu, 05 Nov 2026 14:14:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyET-00000009EMy-3bbR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84A88438DE;
	Thu,  5 Nov 2026 14:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B311F00A1B;
	Thu,  5 Nov 2026 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888065;
	bh=4QpYJSS9gn8AjXi8jX/3Dtqw7BlVuFU8dH7dnogBVO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZHt7HSGugybN5tt7aBm2DYpjLqmVSzGHPf+FbQmlOA5T4Nk5fCKWzCEZb+J82PHlw
	 l6AVe6kDbgKPpfD8/3R3rRcmmEPrg353sNwySWNZPUaC8eFmRslm5bIRcVZkF6IdyU
	 ruk1UXsR2KoKlIyaiX4m5Bt2MaupvTmPsJkjn50vKnSDxBeKsVV4bwubvy7qds1fXh
	 dHtWj4Z4lh+pj2d8Bkkjb5jAZcuLTyb0EPvvsrr0CO/XIRBV5F5Y3YmW39L6T82LYq
	 MDqcufEATybJTn1bGcMM2j64t0KtpUgUMcx8vhy/hXPFsBB7xQM1sVp6uE3gUGspMg
	 8BTqLnNf590eA==
From: Lee Jones <lee@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-doc@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
References: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
Subject: Re: (subset) [PATCH 08/10] leds: pwm: Switch to __nonnull_args()
 macro
Message-Id: <179388805861.2575351.14283088205507759337.b4-ty@b4>
Date: Thu, 05 Nov 2026 14:14:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 08:19:47 +0000, Dmitry Ilvokhin wrote:
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
> 
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.
> 
> [...]

Applied, thanks!

[08/10] leds: pwm: Switch to __nonnull_args() macro
        commit: 687615faae92e36a2b6c5ab0d007751e8e88a645

--
Lee Jones [李琼斯]



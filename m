Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D33606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dliA997I;
	dkim=pass (1024-bit key, unprotected) header.d=ilvokhin.com header.i=@ilvokhin.com header.a=rsa-sha256 header.s=mail header.b=WUo05cr+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RocjA1LFJ8nCgW+tO2y+Fh4wXXWjfdPFo024IhF5Wq8=; b=dliA997IzTlJrKQ5yizbtcqUCV
	W8hoVT3FHh0Q2WUNIbsBk39eSQz3QJz3uZA2xovdNCf09hR2OBvBY0a1m4vD3cqpxkeDPtrdC8Rx/
	ltfBj2E7YK8JM35PM5cxzLH4aYdyHZ9hFZgSp3SVwKYAxPdx4n3RPLupwLsxdlmgXwylI6263+JjW
	ZkwMILUMFgp6ZIFG+RJV2y/AGqyOLjBJ0ubi8/W8YvYpSbRINzcHngeCNhx0bCe50l0HAZ71GKfhj
	StCsMR2TS4dgMtxQAvRHjEj6sw/+TucIeFZksFHsmxmiBylSx+bvwUKZjtZXam63yf2MfUHAVcY7y
	CHTO2Ikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOwW-000000097YA-2Oz2;
	Thu, 29 Oct 2026 12:09:16 +0000
Received: from mail.ilvokhin.com ([178.62.254.231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOwT-000000097XP-1rP8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1793275747;
	bh=RocjA1LFJ8nCgW+tO2y+Fh4wXXWjfdPFo024IhF5Wq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WUo05cr+foO7RPlP7534YSiBgZ8CQPkwQY40XhGkYZY6+6/4j3XkS/IFDfGv+Pkoh
	 y9zJIn2BFoMmtdWooRjNBcjjjJtArbTwyJLsxt66JLoWE/gVCnnA7sNVi3UolL8xve
	 VDmnu4pCCOxy8JC/MQlwNqsBS6P1OvE3N85vIIf8=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 2E446101220;
	Thu, 29 Oct 2026 12:09:07 +0000 (UTC)
Date: Thu, 29 Oct 2026 12:09:03 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 00/10] treewide: switch to __nonnull_args() macro
Message-ID: <auM3XwWPnMHcPptM@shell.ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <cce30180-c1c4-4b10-b681-8944057bc698@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce30180-c1c4-4b10-b681-8944057bc698@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_050913_831002_B1D5E64F 
X-CRM114-Status: GOOD (  23.35  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 01:44:59PM -0700, Randy Dunlap wrote:
> 
> 
> On 10/28/26 1:19 AM, Dmitry Ilvokhin wrote:
> > Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> > nonnull") added the __nonnull_args() macro to wrap the raw compiler
> > attribute, keeping the attribute's quirks in one place rather than
> > open-coded at every call site.
> > 
> > This series replaces the remaining open-coded __attribute__((nonnull))
> > users with __nonnull_args() to standardize nonnull attribute usage
> > across the tree.
> > 
> > Each patch can be applied separately by the respective maintainers. The
> > only dependency is kernel-doc: the string and lib/list_sort patches need
> > patch 1 ("docs: xforms_lists: support __nonnull_args()") in the same
> > release, otherwise strends() and list_sort() drop out of the generated
> > documentation.
> > 
> > Latest Sparse release could not properly parse __nonnull_args() without
> > arguments. Fix was proposed [1] and merged, but until updated version of
> > Sparse will reach wide masses it might trip on __nonnull_args() without
> > arguments.
> > 
> > There are few more instances of __attribute__((nonnull)) usages left in
> > the tools subdirectory, they are perf related copied files and can
> > (should?) be updated separately after this patchset lands.
> > 
> > Build-tested allmodconfig with GCC 11.5.0 and clang 22.1.8.
> 
> What ARCH(es)?

Fair point, I should have mentioned that I run this on x86_64 and
aarch64.

> 
> Did you mean to use such an "old" version of GCC?

There is no grand plan behind that to be honest, I used it, because this
is a version of GCC that comes with CentOS Stream 9 on the box I tested
the change.

To be on the safe side, I checked patchset still builds on GCC 16.2.1 on
allmodconfig x86_64.


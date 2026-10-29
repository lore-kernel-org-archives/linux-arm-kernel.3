Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CCF606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cjGkATcK;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CeoMdVtq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YDl9p7g5quENVJzD97vvD5OqlYe1ysXU7bQyzl1X/uw=; b=cjGkATcKt8687QgdQCloI03W22
	8SadfhjV3yQGAgQQ9yDhjwgDyzzSNXwDc4UORF1Ez5Rp0cGZiN7GWrksTH/Vx0HwwYCYl9NfvnJ+N
	jd29WL1fYk+7xhJraXxweyLii47ScWuXJM6nHPJOhqLVxPjlNNi/g5cTmKsXeVVR14zLuclUPDyYe
	edYrs/ND/w47VKvppXeQ9/aPgY+LXx9b8BAFphXZV8NX/DvgcuCkK/lddwt2yz1bQbmnibBc5kQyN
	N6Sku4rsCrAy6VskOirEZV5G4udSOhEuhd3987/IWYJUxZ0Hn3eXkQQPCHspMhh/lBZ+yu12orHRh
	4GlcOOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLk2-00000008ku5-0uBp;
	Thu, 29 Oct 2026 08:44:10 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLjz-00000008ktD-1tbk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793263447; x=1824799447;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=WP/QAZ7Uc8hCjUk9W10FsuMb7rLn58PCckd869LjBFA=;
  b=CeoMdVtqvfGLCEmCLLUrcv7IL0jmaaTBN/6LyqkbQei7u2/Q8HKmMWSY
   Fxi2WrPo/2pO0dTiN84kuXqEOuo46kNgBbJrjReVn4dMrh+CEwClfoFF6
   /edOEUVZY06Uve9TdCv6IqLWy2UhRC1Ho5mw12byVeaZoPZTSYUPs00M7
   /Rn2/zeaoC+H8nO9+pyBXPTA9U3INi84IeLntgSgqdywBcPhKP6HrGZOB
   YBnkiIJMSMe4C84/tz22R4NRhW28Qtzf3HRFU8e3e3He1x9o5El2fAejZ
   Y6dJIdfTMOd442G6LMLf5hyYjr8J3xY42rZMtHAdxAqzmuuXtezQaEUYy
   w==;
X-CSE-ConnectionGUID: Ezcedop9T5a9GsCFLbeCzw==
X-CSE-MsgGUID: HiRn/6B4TCq58HkKYbkcVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2011315"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2011315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:44:06 -0700
X-CSE-ConnectionGUID: oDqzyd5cQ0OZV3ZmvaMS7A==
X-CSE-MsgGUID: gVbT5JW4Somf8pxelwKQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5411378"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:43:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy
 Tsai <billy_tsai@aspeedtech.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy
 Shevchenko <andy@kernel.org>, Matthew Wilcox <willy@infradead.org>, Andrew
 Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
In-Reply-To: <auHf-pdvGkPibgTp@zenone.zhora.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1793027261.git.d@ilvokhin.com>
 <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
 <auHf-pdvGkPibgTp@zenone.zhora.eu>
Date: Thu, 29 Oct 2026 10:43:56 +0200
Message-ID: <b3045bc3ae77ef78a1f479448a5dc780d89bf38d@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_014407_556540_337A5B71 
X-CRM114-Status: GOOD (  11.56  )
X-Spam-Score: -4.3 (----)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026, Andi Shyti <andi.shyti@kernel.org> wrote:
> Hi Dmitry,
>
> On Wed, Oct 28, 2026 at 08:19:44AM +0000, Dmitry Ilvokhin wrote:
>> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
>> nonnull") added the macro __nonnull_args() to wrap raw compiler
>> attribute.
>> 
>> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
>> nonnull attribute usage across the tree and keep the attribute's quirks
>> in one place rather than open-coded at every call site.
>> 
>> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Pushed this patch to drm-intel-next, thanks for the patch and review.

BR,
Jani.


-- 
Jani Nikula, Intel


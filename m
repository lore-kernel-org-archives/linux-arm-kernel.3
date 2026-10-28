Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAB8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4uC+6B+9;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JGKF85hm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jLuXcsrhYze/uot6RAritgtezmvs46B7suAi1iRl0v0=; b=4uC+6B+98cyzsQbudn01Up1Nrw
	7dueo/QlOydANkM6K5bCRzMElIBjHUyDAv3LSAb274usMLMg3M2YMuqIFYDsrrBt2u2EmsaKGxvSC
	xUmHkAxyrVh+AQ30v0c4TbcNxETNv9Wd6Xn7qrqXTvCDq3F10afSpeaGXqnO3amE3OW4CDQ5QTjAS
	rECWjGX58pCL0Io9gs7zpQBGXHu6fJl+7UewoUp4kobD8mEaU3f/1QI0iR8tUtWcWqVx9xKNGPUmk
	fGqRumhdaNTxsuC8EQWPFMHSpuTgV20CBM6Fj1iRLhI5uYtW7S2kISAT4d91qiuf6X/FYFdYR2fpy
	7PD6Z3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1ui-00000006rls-1dKH;
	Wed, 28 Oct 2026 11:33:52 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1uf-00000006rlH-1L0e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793187229; x=1824723229;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=z8y8XV24bROqh0zonAMNAjIZyMJbY12xpb+/fK8m0AI=;
  b=JGKF85hmCVQ9pf9eXbOsC8wgPHWDavTdyCGWPRpxPC23gPTB9HurHR1u
   WQIzCd0zwuTx3xDYu7R6x7Tug0u3cG2len/6bLyuT1Ba9nt2Ksz9lFv16
   uWsDoRlbFOlyD/wV5bIxwsw3kIwHlbx+7870/Q08076xKsblgMcUIm7Xw
   nkUIXIu5vX0mQFDdirfJv+J+GkeTU7aMk2olzE59xTR4u4jE9NpgRt9lo
   j3gf2C66LaqLw0qU6mJ+rQfIH8X+Zwj6uep7ZyHB2nWJbxPDyFDqeTPXW
   uH7NK1RnZY34FW9rSVNOCVg9/KCrbR1XNYeByeZKByf52EvDlzja4Tmz3
   g==;
X-CSE-ConnectionGUID: 0zzUdf/rStONUD8FaZc3cg==
X-CSE-MsgGUID: HUOclJjhRIK2cVvzz/6uXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1813637"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1813637"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:33:48 -0700
X-CSE-ConnectionGUID: F9mrBK1+QXS8jOjCv8P8bQ==
X-CSE-MsgGUID: KJ1QgI6jS6ey2L/RLS17LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6633584"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:33:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook
 <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, Matthew Wilcox
 <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Dmitry Ilvokhin <d@ilvokhin.com>
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
In-Reply-To: <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1793027261.git.d@ilvokhin.com>
 <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
Date: Wed, 28 Oct 2026 13:33:37 +0200
Message-ID: <3b839373c03f6b8aeafa8e4801a486ece68b0815@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_043349_419838_5C3AB218 
X-CRM114-Status: GOOD (  16.64  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026, Dmitry Ilvokhin <d@ilvokhin.com> wrote:
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.
>
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h | 4 ++--
>  drivers/gpu/drm/i915/i915_request.h        | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index a2f4b6758a65..648d0b4139cf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -127,7 +127,7 @@ __deprecated
>  struct drm_gem_object *
>  drm_gem_object_lookup(struct drm_file *file, u32 handle);
>  
> -__attribute__((nonnull))
> +__nonnull_args()
>  static inline struct drm_i915_gem_object *
>  i915_gem_object_get(struct drm_i915_gem_object *obj)
>  {
> @@ -135,7 +135,7 @@ i915_gem_object_get(struct drm_i915_gem_object *obj)
>  	return obj;
>  }
>  
> -__attribute__((nonnull))
> +__nonnull_args()
>  static inline void
>  i915_gem_object_put(struct drm_i915_gem_object *obj)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index b09135301f39..f559203c332d 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -437,12 +437,12 @@ void i915_request_cancel(struct i915_request *rq, int error);
>  long i915_request_wait_timeout(struct i915_request *rq,
>  			       unsigned int flags,
>  			       long timeout)
> -	__attribute__((nonnull(1)));
> +	__nonnull_args(1);
>  
>  long i915_request_wait(struct i915_request *rq,
>  		       unsigned int flags,
>  		       long timeout)
> -	__attribute__((nonnull(1)));
> +	__nonnull_args(1);
>  #define I915_WAIT_INTERRUPTIBLE	BIT(0)
>  #define I915_WAIT_PRIORITY	BIT(1) /* small priority bump for the request */
>  #define I915_WAIT_ALL		BIT(2) /* used by i915_gem_object_wait() */

-- 
Jani Nikula, Intel


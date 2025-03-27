Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC0EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kk50b7VQtCoi6qqeYirs2opyA8yqIK4cNax+DA6HcVk=; b=CvRR1rFRA51me7RvYRjOSTXQrj
	s3YfYXkY29HE57Kdx9Z0d8FEzpv5fkUZmDLGuEAcSP8bXNfMFTLyIx81je/NJzvQGej+uNyg6yuGA
	GBr39kDvrMNg6IvzJUw1fEKd//vZol1eV0byE7Amv9CHthIER/WKw1LmUPLvQNNE3PavPQuI9yUU6
	/G0emZwOo+KbQEYhXHVfXIpyt/7uf4g44BLNg2goegM7cqFDigzFRp9dNK0l8qY2plV0prVooYzA1
	Q0q66cw58JiVdLZ5NaChAcyAA/x0wGNZnP6TYUfpLpnMIvIA1vv8++twhmTXinzS7XBdNBGigGZhR
	vo1DtRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txj6b-0000000AW2W-3q6b;
	Thu, 27 Mar 2025 09:00:53 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txj4D-0000000AVbG-0mo0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:58:27 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D8ADB11400AF;
	Thu, 27 Mar 2025 04:58:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 27 Mar 2025 04:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1743065901; x=1743152301; bh=kk50b7VQtC
	oi6qqeYirs2opyA8yqIK4cNax+DA6HcVk=; b=SDStPgrprdwR4zU/vpSycIzboL
	BckAU7v7+qBwG8T2n+RKeKBdcKTyR7J453IDULDyOAuY5egBXoOn/r4UtapRipen
	FHGlr0FRDAxX1G2oD8cwg0B3SaMl4hkN3xuIihof8V47vokjd69mA6m0yqpbZ0aT
	+AXhl9GgGwDOTjvtiX7r2GYGqa5rrKR7rCd62uXg4wQJBABE4QLx6xjjbFg24UC4
	wZwWCK8BA7Vci7Th1Xt33UjHRD49aasLZ890SEoVZ5dKgfT83hi/Az6EtUIHwHdP
	Focp4h93tEsihHbeouGmMrLDnFNTiXLRtlgV+jwCexfE+/EHoofL7u2TNRGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743065901; x=1743152301; bh=kk50b7VQtCoi6qqeYirs2opyA8yqIK4cNax
	+DA6HcVk=; b=GD4orJ9C4CVwvieaU8+w9R65kDp4fev0YJ/aQe0Grxsv84MkqWK
	fulQ5b7PLsUxgTXBos3mGEABasQAXrqNYTzGCIWEe25H2qoOkthlp76NuB4bWvmR
	FS9ej14XAvzh2Zjv8oFMYSM6xB/Xcb07+0VdzlNnZmw3Lrve3On/+MZfUFKtf5zq
	iLm5ejVZ8TDzdV7lxhCQvR9gvmyqYPVgzylrqR/vFBBjmQKs94PVo888vjY6VHpx
	kSLqSaSmZm3k88X3LBb8UPqsPTK2fmx7ZCZ+38Z5j0zVSvqippjz9RvyvLm/Syl7
	5TXAZlfNqhd7nPeSKu12BsAEvcixttRtvNQ==
X-ME-Sender: <xms:LBPlZ9-tuEFAOM2UFp5LzNOUAvcmYKEqVu62dce2vVQaEu7hAm7EXw>
    <xme:LBPlZxt-YtvoZjIipyWScSrwNTfF4_ZtOPIIR_1LgzRdphb9ALYfuybn_GHpp4jp6
    TX2qMTfINyxsmFDLHw>
X-ME-Received: <xmr:LBPlZ7BLgIikfi0Gw1mLxIyPhx8NjGa1e6OKyDqeKs2wiuEOAM2IJtjXVXfjUzeWxe5Tl08qycEGV5kvO2NsUDUjeDYdIBusKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieejleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    jeenucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqe
    enucggtffrrghtthgvrhhnpedtgedvfeevteeltdegjeegvdeugeefheevhffhveelgeej
    geejieejhffhkeektdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhfrhgvvgguvg
    hskhhtohhprdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtg
    hpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhihshhsrges
    rhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehm
    rggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtg
    hpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhm
    mhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:LBPlZxfGww1FiQO3h-LVVP5BVt47aMjxmO2cPlRoG13crGVqXaFMIw>
    <xmx:LBPlZyPGy4vBVbqGcrRx5fZZXCdnItH_5auozgxJ2dHVkdoORVSMOA>
    <xmx:LBPlZzlr8Rzp-yzf_bIxeDLMAnlR4OiPS9ddmMLSLaXgkZ3_f2A2Gw>
    <xmx:LBPlZ8tuSfISNq9YrpiAa1v2hsNmm3Vmlu2CoxBkUmTjoJoeeoYOUg>
    <xmx:LRPlZ3YZpTDLeE7EZ8niGwFbP0ssZi7F_sRe5DQ6GpBtPyroG5zTzs_1>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Mar 2025 04:58:19 -0400 (EDT)
Date: Thu, 27 Mar 2025 09:58:17 +0100
From: Janne Grunau <j@jannau.net>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,	Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Sven Peter <sven@svenpeter.dev>, Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5] drm: Add UAPI for the Asahi driver
Message-ID: <20250327085817.GA341311@robin.jannau.net>
References: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_015825_714893_EC49E060 
X-CRM114-Status: GOOD (  42.60  )
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

On Wed, Mar 26, 2025 at 02:16:38PM -0400, Alyssa Rosenzweig wrote:
> This adds the UAPI for the Asahi driver targeting the GPU in the Apple
> M1 and M2 series systems on chip. The UAPI design is based on other
> modern Vulkan-capable drivers, including Xe and Panthor. Memory
> management is based on explicit VM management. Synchronization is
> exclusively explicit sync.
> 
> This UAPI is validated against our open source Mesa stack, which is
> fully conformant to the OpenGL 4.6, OpenGL ES 3.2, OpenCL 3.0, and
> Vulkan 1.4 standards. The Vulkan driver supports sparse, exercising the
> VM_BIND mechanism.
> 
> This patch adds the standalone UAPI header. It is implemented by an open
> source DRM driver written in Rust. We fully intend to upstream this
> driver when possible. However, as a production graphics driver, it
> depends on a significant number of Rust abstractions that will take a
> long time to upstream. In the mean time, our userspace is upstream in
> Mesa but is not allowed to probe with upstream Mesa as the UAPI is not
> yet reviewed and merged in the upstream kernel. Although we ship a
> patched Mesa in Fedora Asahi Remix, any containers shipping upstream
> Mesa builds are broken for our users, including upstream Flatpak and
> Waydroid runtimes. Additionally, it forces us to maintain forks of Mesa
> and virglrenderer, which complicates bisects.
> 
> The intention in sending out this patch is for this UAPI to be
> thoroughly reviewed. Once we as the DRM community are satisfied with the
> UAPI, this header lands signifying that the UAPI is stable and must only
> be evolved in backwards-compatible ways; it will be the UAPI implemented
> in the DRM driver that eventually lands upstream. That promise lets us
> enable upstream Mesa, solving all these issues while the upstream Rust
> abstractions are developed.
> 
> https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v5 contains
> the DRM driver implementing this proposed UAPI.
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 contains
> the Mesa patches to implement this proposed UAPI.
> 
> That Linux and Mesa branch together give a complete graphics/compute
> stack on top of this UAPI.
> 
> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
> Changes in v5:
> - Rename GEM_BIND to VM_BIND and make it take an array of bind ops. This
>   significantly decreases the # of kernel<-->user roundtrips with Vulkan
>   sparse binding. The uAPI here is lifted directly from Xe.
> - Merge in_syncs and out_syncs arrays, but leave
>   in_sync_count/out_sync_count alone, requiring waits to precede
>   signals. This simplifies both kernel & userspace, compared to either
>   fully merged or fully separate arrays, so it seems like a Good idea.
> - Drop queue caps, make all caps render + compute. Even GLES2 uses
>   compute to accelerate blits, and even compute workloads use render for
>   a few fallback blits. This lets us drop a bunch of crud in both kernel
>   & userspace and should slightly improve submit overhead.
> - Reorder ioctl IDs to group a little more logically (bikeshed...).
> - Improve some comments.
> - Link to v4: https://lore.kernel.org/r/20250323-agx-uapi-v4-1-12ed2db96737@rosenzweig.io

...

> diff --git a/include/uapi/drm/asahi_drm.h b/include/uapi/drm/asahi_drm.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..a9465cb89ebde6f6768fbd5ba0fa4d753e2a7e32
> --- /dev/null
> +++ b/include/uapi/drm/asahi_drm.h
> @@ -0,0 +1,1211 @@

...

> +/**
> + * struct drm_asahi_params_global - Global parameters.
> + *
> + * This struct may be queried by drm_asahi_get_params.
> + */
> +struct drm_asahi_params_global {
> +	/** @features: Feature bits from drm_asahi_feature */
> +	__u64 features;
> +
> +	/** @gpu_generation: GPU generation, e.g. 13 for G13G */
> +	__u32 gpu_generation;
> +
> +	/** @gpu_variant: GPU variant as a character, e.g. 'G' for G13G */
> +	__u32 gpu_variant;

nit: the example can avoid the duplication of 'G' with "e.g. 'C' for
G13C"

...

> +/**
> + * struct drm_asahi_get_params - Arguments passed to DRM_IOCTL_ASAHI_GET_PARAMS
> + */
> +struct drm_asahi_get_params {
> +	/** @param_group: Parameter group to fetch (MBZ) */
> +	__u32 param_group;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	/** @pointer: User pointer to write parameter struct */
> +	__u64 pointer;
> +
> +	/** @size: Size of user buffer, max size supported on return */
> +	__u64 size;

The comment is misleading in the case of newer / extended kernel which
supports a larger size than supplied. You could change it to "size
written on return" or clarify that the value on return will not exceed
the input value.

> +};
> +
> +/**
> + * struct drm_asahi_vm_create - Arguments passed to DRM_IOCTL_ASAHI_VM_CREATE
> + */
> +struct drm_asahi_vm_create {
> +	/**
> +	 * @kernel_start: Start of the kernel-reserved address range. See
> +	 * drm_asahi_params_global::vm_kernel_min_size.
> +	 *
> +	 * Both @kernel_start and @kernel_end must be within the range of
> +	 * valid VAs given by drm_asahi_params_global::vm_user_start and
> +	 * drm_asahi_params_global::vm_user_end. The size of the kernel range

This reads a little strange. Would it make sense to rename drm_asahi_params_global's
vm_user_start and vm_user_end to vm_start/vm_end?

> +	 * (@kernel_end - @kernel_start) must be at least
> +	 * drm_asahi_params_global::vm_kernel_min_size.
> +	 *
> +	 * Userspace must not bind any memory on this VM into this reserved
> +	 * range, it is for kernel use only.
> +	 */
> +	__u64 kernel_start;
> +
> +	/**
> +	 * @kernel_end: End of the kernel-reserved address range. See
> +	 * @kernel_start.
> +	 */
> +	__u64 kernel_end;

...

> +/**
> + * struct drm_asahi_vm_bind - Arguments passed to
> + * DRM_IOCTL_ASAHI_VM_BIND
> + */
> +struct drm_asahi_vm_bind {
> +	/** @vm_id: The ID of the VM to bind to */
> +	__u32 vm_id;
> +
> +	/** @num_binds: number of binds in this IOCTL. Must be non-zero. */
> +	__u32 num_binds;
> +
> +	/**
> +	 * @stride: If num_binds > 1, stride in bytes between consecutive binds.
> +	 * This allows extensibility of drm_asahi_gem_bind_op.
> +	 *
> +	 * If num_binds == 1, MBZ. Extensibility in that case is handled at the
> +	 * ioctl level instead.
> +	 */
> +	__u32 stride;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	/**
> +	 * @bind: Union holding the bind request.
> +	 *
> +	 * This union is named to make the Rust bindings nicer to work with.
> +	 */

This comment could use a short justification why this union does not
defeat extensibility after the initial statement that "structures should
not contain unions"

> +	union {
> +		/** @bind.b: If num_binds == 1, the bind */
> +		struct drm_asahi_gem_bind_op b;
> +
> +		/**
> +		 * @bind.userptr: If num_binds > 1, user pointer to an array of
> +		 * @num_binds structures of type @drm_asahi_gem_bind_op and size
> +		 * @stride bytes.
> +		 */
> +		__u64 userptr;
> +	} bind;
> +};

...

> +/**
> + * struct drm_asahi_submit - Arguments passed to DRM_IOCTL_ASAHI_SUBMIT
> + */
> +struct drm_asahi_submit {
> +	/**
> +	 * @syncs: An optional array of drm_asahi_sync. First @in_sync_count
> +	 * in-syncs then @out_sync_count out-syncs.
> +	 */
> +     __u64 syncs;

Would it make sense to explictly state that this is a pointer?

Reviewed-by: Janne Grunau <j@jannau.net>

ciao
Janne


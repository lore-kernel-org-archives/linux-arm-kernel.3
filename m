Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8DFC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 20:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkBIE2F1u3NosW2VlcN5+Gf14+J0Igu/mLiEiQXhQ/M=; b=IRb2wU4Y2/kq3Ho8rS4qQh7ei9
	DpgX+4xOJxw5Qb2vcQtEIlNdomLzFGLVW0XknwboGfq8Qi/p8YOzalsmPIbobbHwHisgEn4iIAee3
	1dmlmPev82VMytr6ExcT9b2LiEkLZnnANhOV81kpT3eCKeza21QmTT1tGy34hdPvrsr4F5Yx7G18H
	eolfKMvePtqnmUmlxn+ctV9wHaNzapdbtSoJnBJGA7Ql3cGV13NW1mV5ZqorY5Hdi+QXICiqvmI3x
	SpN8ZCRyNlDzULIatJDxjzohzafhatMmbT8ighw1Q1dJcm22zggfny/Vm3TANoG+KROGjdantsM+D
	9rZSDQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLaK-00000003RrF-3DGI;
	Mon, 30 Jun 2025 20:58:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLY0-00000003Rak-3F07;
	Mon, 30 Jun 2025 20:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00249463D5;
	Mon, 30 Jun 2025 20:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC8EC113CF;
	Mon, 30 Jun 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751316975;
	bh=PO44svPAYFFi6GiqbWS4Fm1Ty0ssVHLymeJlTxwzafk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HhKs9WPSntjrnVGvwtUXKtRXfRp7ZFQTMeoh2xdI+oPDKiaU8VWwMUVyewuWLutRg
	 thNMMLiVjeUeK8jrFPHKkQyxzP2F2NksS+Un0A8qTqqrV8pBLyPcDk6KCv22zCVQYV
	 qZ4FU2CVCJSancybT61fdQYX+fdRJEBBnLKiCvNU1+Q4l7zPtuANNbD94XMmClnpQc
	 fl1gtL8ERG1fIzjVoe5OuU8vLVx1bKu7M3+zBmUIMmzC0EA6hJf/Xnu2pCN/sSbiII
	 ck22XgFecXDsY2l7lnuGZhGrb+5aQiMIxfvnxQbH95E1q4CaoZnFLDAqHjLiwO3N5f
	 WnRbpWKBx5XlA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so5504565a12.1;
        Mon, 30 Jun 2025 13:56:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK0QuwM+A+ruAHD/gS4Aj08sBwKDBd3S7MLXrTBVNyNUdR1yhFWxwduvn0T98wZtzsoKoaH96dGhfw476YKH8=@lists.infradead.org, AJvYcCWyT6BaHlR95UvdfhMPqA92JV320KvEYW3Df5V0AUwIS4faKyRss+T/G8MkHECK5/ho2/8v+bShGdhKpT/aUYyx@lists.infradead.org
X-Gm-Message-State: AOJu0YyGV8+MxLQYAaeEeiLF0GNDevb7U9GRxJal6gDkklxJsmAhWVfn
	rTCVrVpbgmBUtU4/vwA9xhrb1HJu5mU8lthzYlAhPBPCmhuixfCJCa0BwhDpilW5HUaklVFuPdB
	/kR5/jt3ANdGVm62ofqD65t1JzFxP5Q==
X-Google-Smtp-Source: AGHT+IHN6KYVrLpEyM//LpRHGQ3ciilHAEEns6c2p0uRqrws7WdVXCCQfCRU6orJIR5QnGKwW7fUExXvkMdYX3eTq8k=
X-Received: by 2002:a17:907:868b:b0:ad9:db54:ba47 with SMTP id
 a640c23a62f3a-ae350190c99mr1589912566b.43.1751316973962; Mon, 30 Jun 2025
 13:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Jun 2025 15:56:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJtKCXE0MLaBN5-r+w+2jVwt8UMwHtr-nP0PoBmfNodpg@mail.gmail.com>
X-Gm-Features: Ac12FXy8hWxpEFoW3ELH4IZXVQDuQYuBeJxvmHd6gayxY_Y6diMDIDxJ1A0GBAM
Message-ID: <CAL_JsqJtKCXE0MLaBN5-r+w+2jVwt8UMwHtr-nP0PoBmfNodpg@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_135616_878286_4F4826B1 
X-CRM114-Status: GOOD (  23.39  )
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

On Fri, Jun 6, 2025 at 1:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
>
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
>
> The job submission code was initially based on Panfrost.
>
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
>
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
>
> v6:
> - Use mutexes guard (Markus Elfring)
> - Use u64_to_user_ptr (Jeff Hugo)
> - Drop rocket_fence (Rob Herring)
>
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>   Stone and Robin Murphy)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

[...]

> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -12,8 +12,10 @@ extern "C" {
>  #endif
>
>  #define DRM_ROCKET_CREATE_BO                   0x00
> +#define DRM_ROCKET_SUBMIT                      0x01
>
>  #define DRM_IOCTL_ROCKET_CREATE_BO             DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
> +#define DRM_IOCTL_ROCKET_SUBMIT                        DRM_IOW(DRM_COMMA=
ND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
>
>  /**
>   * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
> @@ -37,6 +39,68 @@ struct drm_rocket_create_bo {
>         __u64 offset;
>  };
>
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +       /** Input: DMA address to NPU mapping of register command buffer =
*/
> +       __u64 regcmd;
> +
> +       /** Input: Number of commands in the register command buffer */
> +       __u32 regcmd_count;
> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into accoun=
t its
> + * dependencies with other jobs. All tasks in the same job will be execu=
ted
> + * sequentially on the same core, to benefit from memory residency in SR=
AM.
> + */
> +struct drm_rocket_job {
> +       /** Input: Pointer to an array of struct drm_rocket_task. */
> +       __u64 tasks;
> +
> +       /** Input: Pointer to a u32 array of the BOs that are read by the=
 job. */
> +       __u64 in_bo_handles;
> +
> +       /** Input: Pointer to a u32 array of the BOs that are written to =
by the job. */
> +       __u64 out_bo_handles;
> +
> +       /** Input: Number of tasks passed in. */
> +       __u32 task_count;
> +
> +       /** Input: Number of input BO handles passed in (size is that tim=
es 4). */
> +       __u32 in_bo_handle_count;
> +
> +       /** Input: Number of output BO handles passed in (size is that ti=
mes 4). */
> +       __u32 out_bo_handle_count;
> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};
> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to =
the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency or=
der.
> + */
> +struct drm_rocket_submit {
> +       /** Input: Pointer to an array of struct drm_rocket_job. */
> +       __u64 jobs;
> +
> +       /** Input: Number of jobs passed in. */
> +       __u32 job_count;

Isn't there a problem if you need to expand drm_rocket_job beyond
using the 1 reserved field? You can't add to the struct because then
you don't know the size here. So you have to modify drm_rocket_submit
to modify drm_rocket_job. Maybe better if you plan for that now rather
than later by making the size explicit.

Though etnaviv at least has similar issues.

Rob

> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};


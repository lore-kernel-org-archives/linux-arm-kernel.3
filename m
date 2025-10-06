Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE527CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GDKfnwebfg6cavOTCKB56yDBm/Zhzbdw0iMvsXnYag=; b=yGJ2+TjbJyc5dTzVW1+U+rqHM9
	PPewa91i7tSABXn4Zro7HJA+kag67veX7a3M2yQHqJIGwwAJB3MlgGR1Ih/mdBTzZD+57sXJCvytR
	KLNbUxXBmS3K1LgRtz3Y1WXWktsx5AMGm2sNfHNMepFK8XRfgsU0w/Rovpkd5moE5IP9lBwT0kySe
	Jpmk2CcdUYhMeq9Bi5Q1P7rNJ5PAi/I5dcEmhXLaJpLGrxPy4Ur/xQnE0y+v4MkTTUoIRgxPbll9E
	iv7g1j2YVOR+wVY8xRtifl2um7rNHDal1C6hAAg/Crh365/SXj1lBc7oCWQR0EFiOTcImGy51uiSM
	z3sT5egQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5p0U-00000000Uyv-1jbe;
	Mon, 06 Oct 2025 17:28:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5p0S-00000000UyF-0PbU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 17:28:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-776379289dcso432159b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759771695; x=1760376495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GDKfnwebfg6cavOTCKB56yDBm/Zhzbdw0iMvsXnYag=;
        b=Pj5U2scH7dT43qcN2P+wnq4n6oncwoJgBsApaqUo1IAHRmzhKYg1n6woidHAKVKDyw
         BY2c/EfhL5G6GmY8gWzYuxXKhYNgguie3X7RHtFvQsrpadovP0be5E9kwfGwaTV4LzEy
         NEeW3UR4RFTV6Ayn1QrPVGBZrrfeixvFxVxCu0EIvuYyohMMnOzsmq6oquHMBPxXDR26
         FsUxjZ5n+C0fD4yeKIY2Hv6WUfywO+PUYyW9e3CokvJQBBp7CERXKTn1pLFFKud9nTDv
         YpU2DAL856S6LTkYjr8d/g9eV8fzYm0vTLayk1B2mFO9YnQgEiGFEkIGes1x3stag0+/
         6Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759771695; x=1760376495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GDKfnwebfg6cavOTCKB56yDBm/Zhzbdw0iMvsXnYag=;
        b=B8tXHx6exmNlmt9xkwfP2Z6pRiNIzbnaBHruLcR1L8uzy3CnE1wZkzSv4ekwUIQ9oh
         2kgxP17xqsAO3lk252tbb+S6aVWLnWLkQlLs64bKMtI3j+vsd/bv5YANAkFm5WquFkF+
         gCaTKHDSzxyOLGa4LZgUclTqcfFry9X+P9QlOWj07YEUluokY6XWSkGZIarylkjPxUvB
         5Xw8T95+JkLU+SHWEkGjmfteVq6dRtQPDUS8Kq4O19WcUsSO4M0iy7kjGU186giEt8WL
         8qRblOkHvlSs8shjBtgNpYNoY/ZTAp3Z6a6vTkjykIVe0tYUmC9v9k7acf5A4zWCdG9A
         jczw==
X-Forwarded-Encrypted: i=1; AJvYcCWgaKPFPMxOwwGY/RPwDSG9yLgt/Xpfwbje3+zvqlPbhIwT/2TbTAbqoNuv2ubc5ue59nTIpTJ1t/WVC3pWQZZc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+YINjbPy0ULG5bSMt6aV04TJqxBeUAyjBVk1SpaLupcHyYYVv
	rxDRXbASwOzEL44fDhsSoy52xS/Jp87O2Dnohhr+wu25J9Y6syqCb/MNs7bg3gdqDWCax4RoSuQ
	tsFJpw80UpSP9gaU+sz8hiLcGTtMXWFg=
X-Gm-Gg: ASbGncs9Dh5EmKf13keJtVbJwL0V7Bg0v8ZeRjhUEeNen3b8TgNijOv5AyTUgQ+6S37
	uaErxkdRJPoaU74JR6+YKriurNXazeYpAL72EFb7aZZgNE70pISv+I77MJfoYRN50ur1MvKLXFO
	f+K4Lmuy1c8oiuHULOwa1dwUVkjCBUgRSMrhnxxc7iqePusLAX/+ls/0/nO9jDAdiJsoB88d/Db
	oQwhRWHh4hA9/Bi3gXzgY6GGtAFBrw=
X-Google-Smtp-Source: AGHT+IGvPeQrk5YFtH2khflLvQDg/9vgHofkKMZDxex/a1mvimIKIjHK1zrwCIBICFwSDWRCp0BHVAyUVlLdtQ8SYl4=
X-Received: by 2002:a17:90b:1b0d:b0:32b:aed4:aa1a with SMTP id
 98e67ed59e1d1-339c27a2515mr7922326a91.4.1759771694946; Mon, 06 Oct 2025
 10:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251002210044.1726731-2-ardb+git@google.com>
In-Reply-To: <20251002210044.1726731-2-ardb+git@google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Oct 2025 13:28:03 -0400
X-Gm-Features: AS18NWD7-N8KS167TRBLTuJkfaeYqaGjNM9efec5tOE9vCI2VuPTAvMNzqdKU9w
Message-ID: <CADnq5_NUJDfctoHf7-vTcM9ACV6fKnKxXDbYYuaGBmgzU9=a-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	broonie@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Austin Zheng <austin.zheng@amd.com>, 
	Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_102816_148918_F67FF688 
X-CRM114-Status: GOOD (  28.69  )
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

Applied.  Thanks!

On Thu, Oct 2, 2025 at 5:11=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com>=
 wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The point of isolating code that uses kernel mode FPU in separate
> compilation units is to ensure that even implicit uses of, e.g., SIMD
> registers for spilling occur only in a context where this is permitted,
> i.e., from inside a kernel_fpu_begin/end block.
>
> This is important on arm64, which uses -mgeneral-regs-only to build all
> kernel code, with the exception of such compilation units where FP or
> SIMD registers are expected to be used. Given that the compiler may
> invent uses of FP/SIMD anywhere in such a unit, none of its code may be
> accessible from outside a kernel_fpu_begin/end block.
>
> This means that all callers into such compilation units must use the
> DC_FP start/end macros, which must not occur there themselves. For
> robustness, all functions with external linkage that reside there should
> call dc_assert_fp_enabled() to assert that the FPU context was set up
> correctly.
>
> Fix this for the DCN35, DCN351 and DCN36 implementations.
>
> Cc: Austin Zheng <austin.zheng@amd.com>
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c    |  4 ++++
>  .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c    |  6 ++++--
>  .../drm/amd/display/dc/dml/dcn351/dcn351_fpu.c  |  4 ++--
>  .../display/dc/resource/dcn35/dcn35_resource.c  | 16 +++++++++++++++-
>  .../dc/resource/dcn351/dcn351_resource.c        | 17 ++++++++++++++++-
>  .../display/dc/resource/dcn36/dcn36_resource.c  | 16 +++++++++++++++-
>  6 files changed, 56 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> index 17a21bcbde17..1a28061bb9ff 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> @@ -808,6 +808,8 @@ void dcn316_update_bw_bounding_box(struct dc *dc, str=
uct clk_bw_params *bw_param
>
>  int dcn_get_max_non_odm_pix_rate_100hz(struct _vcs_dpi_soc_bounding_box_=
st *soc)
>  {
> +       dc_assert_fp_enabled();
> +
>         return soc->clock_limits[0].dispclk_mhz * 10000.0 / (1.0 + soc->d=
cn_downspread_percent / 100.0);
>  }
>
> @@ -815,6 +817,8 @@ int dcn_get_approx_det_segs_required_for_pstate(
>                 struct _vcs_dpi_soc_bounding_box_st *soc,
>                 int pix_clk_100hz, int bpp, int seg_size_kb)
>  {
> +       dc_assert_fp_enabled();
> +
>         /* Roughly calculate required crb to hide latency. In practice th=
ere is slightly
>          * more buffer available for latency hiding
>          */
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> index 5d73efa2f0c9..15a1d77dfe36 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> @@ -445,6 +445,8 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct =
dc *dc,
>         bool upscaled =3D false;
>         const unsigned int max_allowed_vblank_nom =3D 1023;
>
> +       dc_assert_fp_enabled();
> +
>         dcn31_populate_dml_pipes_from_context(dc, context, pipes,
>                                               validate_mode);
>
> @@ -498,9 +500,7 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct =
dc *dc,
>
>                 pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
>
> -               DC_FP_START();
>                 dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> -               DC_FP_END();
>
>                 pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_fron=
t_porch;
>                 pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
> @@ -581,6 +581,8 @@ void dcn35_decide_zstate_support(struct dc *dc, struc=
t dc_state *context)
>         unsigned int i, plane_count =3D 0;
>         DC_LOGGER_INIT(dc->ctx->logger);
>
> +       dc_assert_fp_enabled();
> +
>         for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
>                 if (context->res_ctx.pipe_ctx[i].plane_state)
>                         plane_count++;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/dri=
vers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> index 6f516af82956..e5cfe73f640a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> @@ -478,6 +478,8 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct=
 dc *dc,
>         bool upscaled =3D false;
>         const unsigned int max_allowed_vblank_nom =3D 1023;
>
> +       dc_assert_fp_enabled();
> +
>         dcn31_populate_dml_pipes_from_context(dc, context, pipes,
>                                               validate_mode);
>
> @@ -531,9 +533,7 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct=
 dc *dc,
>
>                 pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
>
> -               DC_FP_START();
>                 dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> -               DC_FP_END();
>
>                 pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_fron=
t_porch;
>                 pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> index 8475c6eec547..32678b66c410 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> @@ -1760,6 +1760,20 @@ enum dc_status dcn35_patch_unknown_plane_state(str=
uct dc_plane_state *plane_stat
>  }
>
>
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +                                              struct dc_state *context,
> +                                              display_e2e_pipe_params_st=
 *pipes,
> +                                              enum dc_validate_mode vali=
date_mode)
> +{
> +       int ret;
> +
> +       DC_FP_START();
> +       ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pi=
pes, validate_mode);
> +       DC_FP_END();
> +
> +       return ret;
> +}
> +
>  static struct resource_funcs dcn35_res_pool_funcs =3D {
>         .destroy =3D dcn35_destroy_resource_pool,
>         .link_enc_create =3D dcn35_link_encoder_create,
> @@ -1770,7 +1784,7 @@ static struct resource_funcs dcn35_res_pool_funcs =
=3D {
>         .validate_bandwidth =3D dcn35_validate_bandwidth,
>         .calculate_wm_and_dlg =3D NULL,
>         .update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
> -       .populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu=
,
> +       .populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
>         .acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_p=
ipe_for_layer,
>         .release_pipe =3D dcn20_release_pipe,
>         .add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resour=
ce.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> index 0971c0f74186..677cee27589c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> @@ -1732,6 +1732,21 @@ static enum dc_status dcn351_validate_bandwidth(st=
ruct dc *dc,
>         return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
>  }
>
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +                                              struct dc_state *context,
> +                                              display_e2e_pipe_params_st=
 *pipes,
> +                                              enum dc_validate_mode vali=
date_mode)
> +{
> +       int ret;
> +
> +       DC_FP_START();
> +       ret =3D dcn351_populate_dml_pipes_from_context_fpu(dc, context, p=
ipes, validate_mode);
> +       DC_FP_END();
> +
> +       return ret;
> +
> +}
> +
>  static struct resource_funcs dcn351_res_pool_funcs =3D {
>         .destroy =3D dcn351_destroy_resource_pool,
>         .link_enc_create =3D dcn35_link_encoder_create,
> @@ -1742,7 +1757,7 @@ static struct resource_funcs dcn351_res_pool_funcs =
=3D {
>         .validate_bandwidth =3D dcn351_validate_bandwidth,
>         .calculate_wm_and_dlg =3D NULL,
>         .update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
> -       .populate_dml_pipes =3D dcn351_populate_dml_pipes_from_context_fp=
u,
> +       .populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
>         .acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_p=
ipe_for_layer,
>         .release_pipe =3D dcn20_release_pipe,
>         .add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> index 8bae7fcedc22..d81540515e5c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> @@ -1734,6 +1734,20 @@ static enum dc_status dcn35_validate_bandwidth(str=
uct dc *dc,
>  }
>
>
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +                                              struct dc_state *context,
> +                                              display_e2e_pipe_params_st=
 *pipes,
> +                                              enum dc_validate_mode vali=
date_mode)
> +{
> +       int ret;
> +
> +       DC_FP_START();
> +       ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pi=
pes, validate_mode);
> +       DC_FP_END();
> +
> +       return ret;
> +}
> +
>  static struct resource_funcs dcn36_res_pool_funcs =3D {
>         .destroy =3D dcn36_destroy_resource_pool,
>         .link_enc_create =3D dcn35_link_encoder_create,
> @@ -1744,7 +1758,7 @@ static struct resource_funcs dcn36_res_pool_funcs =
=3D {
>         .validate_bandwidth =3D dcn35_validate_bandwidth,
>         .calculate_wm_and_dlg =3D NULL,
>         .update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
> -       .populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu=
,
> +       .populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
>         .acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_p=
ipe_for_layer,
>         .release_pipe =3D dcn20_release_pipe,
>         .add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
> --
> 2.51.0.618.g983fd99d29-goog
>


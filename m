Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB260CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZXewi+MSpgfgN5O6jXVKlfCi06aVUrotCL/q5o/3Ssw=; b=uUi/8XrIDvGH39vncCC0YbaWPG
	C+/IubmcChvKn8Eq9aqNkaVgK9nuy6a/qiJ0BMwEYyczxbRFSvxzdxEXt/9o4CWm+qrf8Ol5aeiPr
	ywVFrZEdOqj6ELYrL2yMwjGz6zXF9iLvYAW/WLHSzYajqz3TrWuvTol6T1faB0dgXeRZfan23Mtqr
	DhWRgWMCGV7Od4SF48MKdrFNxml8kfA6cm+aH4LTcekZONk7K0+HM2WHtcxex8caHxWj1eUnqOiq3
	t9r651M1yY9+H0tSldbC+FduOZQO2AkEbyVjInF2FxVN5K6YDIC5yt7emRSi/Qb0zC/+z+4sNm6Ow
	JMBIrO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QQK-0000000BGWZ-2oni;
	Thu, 02 Oct 2025 21:01:12 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QQH-0000000BGVI-3AGR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 21:01:11 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b3cd833e7b5so185812066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759438867; x=1760043667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXewi+MSpgfgN5O6jXVKlfCi06aVUrotCL/q5o/3Ssw=;
        b=2BJVFX+pcPadXWHOGy4kCRvy5KZ4XHf5VHBI/gvUvvZ7ihqO1lRgm9dHGbacS2r1dv
         nRJiGG/64o37Hi35vIyco8DvesqBhcqxz1U3y6NGV/c37/oUb9BP7MNuP2OY7GzOb/5Z
         ygCgdPSCjy/ODfjlo9l4ZxQG7OpQBSmfWmeggwchwxMvTNjQpZoVncYrtBhiNiTvZ5hj
         c2Oj7QH2XwBCAjPZJjo0KbjHuBZT8gAYtdBeFl9ZhlmLf+UjlSfMn0gkC8I8uDhhpWFL
         InkYtixmpVs8p+j5t8ip6mPGTxq+5ponGzmq5BO078wCH6gRkm+zTiMwDb2XEziVL9s0
         tetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438867; x=1760043667;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXewi+MSpgfgN5O6jXVKlfCi06aVUrotCL/q5o/3Ssw=;
        b=vFSCfsBXPTnCkOzfofgOMNeFOS9R4+SMDqldZ8XkUmqK0saWeBlVf1w1LGq+EmcBRA
         RiQA2NorvAbBRxSLT7soXbv/G1iAMsGwrdbjKaUGonnm3jppy0yKOCP4xtoUsNAeKpFb
         wTCnRE5yCFl+M/hBZwpm/h4aR2mYWhLQDGWkX5IHYNMgtu0OZI4cA3sQDQ7Qodwt/SU9
         +YBhJKdchdtW1bYm8MX8xgh6dS+hBe3RwkIPfDjltK9a22lnezAos+2f5doR+b7pTWyO
         Ts4YuYaqT9egKl8nlMwCkJ0dEqmcgG6ZorktoXDE4z9aLp9UOB2lxamkHBnJaN021H15
         snnQ==
X-Gm-Message-State: AOJu0YzytlkxXjpxksPmrF6B3Ao3IuOgjHuWvKR2CCb7AkamRJPpNyAG
	O2I0B1xEUjobLQu+j1eNXv66/P9d4SZ3K4yWcp5DRZthVpuSpeOtLAVg0S1seluGV62zZ8zCbg=
	=
X-Google-Smtp-Source: AGHT+IEExjmvbF8Lb9M+XG7YR7QTAIMSCeCwavhfGOO8t62xLo8r+Wg9cNCxdOmE3p/nTVLIqxQSzoMn
X-Received: from ejbwr20.prod.google.com ([2002:a17:907:7014:b0:b44:aed4:d213])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:ea6:b0:b3d:5088:213f
 with SMTP id a640c23a62f3a-b49c1c67beamr97495666b.19.1759438867035; Thu, 02
 Oct 2025 14:01:07 -0700 (PDT)
Date: Thu,  2 Oct 2025 23:00:45 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=9413; i=ardb@kernel.org;
 h=from:subject; bh=79gRZqCE8gjHML9Xmm1M2zyzayfEyQ0TDshfv9BB904=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePe879ls71YX5scfvJf5tKT1d+uaJ59tN3VeJWKzuzfz
 VGe3XEMHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAinx4zMmzNfqabUnh+kuY1
 TTPlV3OjZk+Nl5+qFa4mdlh9xdXUz5MYGTZ6OM+auzPnydya25LCCr9O8R/X2Fn9T0B3aa5tyAH hDgYA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251002210044.1726731-2-ardb+git@google.com>
Subject: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, broonie@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_140109_846766_6BBAC3D9 
X-CRM114-Status: GOOD (  18.55  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The point of isolating code that uses kernel mode FPU in separate
compilation units is to ensure that even implicit uses of, e.g., SIMD
registers for spilling occur only in a context where this is permitted,
i.e., from inside a kernel_fpu_begin/end block.

This is important on arm64, which uses -mgeneral-regs-only to build all
kernel code, with the exception of such compilation units where FP or
SIMD registers are expected to be used. Given that the compiler may
invent uses of FP/SIMD anywhere in such a unit, none of its code may be
accessible from outside a kernel_fpu_begin/end block.

This means that all callers into such compilation units must use the
DC_FP start/end macros, which must not occur there themselves. For
robustness, all functions with external linkage that reside there should
call dc_assert_fp_enabled() to assert that the FPU context was set up
correctly.

Fix this for the DCN35, DCN351 and DCN36 implementations.

Cc: Austin Zheng <austin.zheng@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c    |  4 ++++
 .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c    |  6 ++++--
 .../drm/amd/display/dc/dml/dcn351/dcn351_fpu.c  |  4 ++--
 .../display/dc/resource/dcn35/dcn35_resource.c  | 16 +++++++++++++++-
 .../dc/resource/dcn351/dcn351_resource.c        | 17 ++++++++++++++++-
 .../display/dc/resource/dcn36/dcn36_resource.c  | 16 +++++++++++++++-
 6 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 17a21bcbde17..1a28061bb9ff 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -808,6 +808,8 @@ void dcn316_update_bw_bounding_box(struct dc *dc, struc=
t clk_bw_params *bw_param
=20
 int dcn_get_max_non_odm_pix_rate_100hz(struct _vcs_dpi_soc_bounding_box_st=
 *soc)
 {
+	dc_assert_fp_enabled();
+
 	return soc->clock_limits[0].dispclk_mhz * 10000.0 / (1.0 + soc->dcn_downs=
pread_percent / 100.0);
 }
=20
@@ -815,6 +817,8 @@ int dcn_get_approx_det_segs_required_for_pstate(
 		struct _vcs_dpi_soc_bounding_box_st *soc,
 		int pix_clk_100hz, int bpp, int seg_size_kb)
 {
+	dc_assert_fp_enabled();
+
 	/* Roughly calculate required crb to hide latency. In practice there is s=
lightly
 	 * more buffer available for latency hiding
 	 */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 5d73efa2f0c9..15a1d77dfe36 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -445,6 +445,8 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc=
 *dc,
 	bool upscaled =3D false;
 	const unsigned int max_allowed_vblank_nom =3D 1023;
=20
+	dc_assert_fp_enabled();
+
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
 					      validate_mode);
=20
@@ -498,9 +500,7 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc=
 *dc,
=20
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
=20
-		DC_FP_START();
 		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
-		DC_FP_END();
=20
 		pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
@@ -581,6 +581,8 @@ void dcn35_decide_zstate_support(struct dc *dc, struct =
dc_state *context)
 	unsigned int i, plane_count =3D 0;
 	DC_LOGGER_INIT(dc->ctx->logger);
=20
+	dc_assert_fp_enabled();
+
 	for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
 		if (context->res_ctx.pipe_ctx[i].plane_state)
 			plane_count++;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
index 6f516af82956..e5cfe73f640a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
@@ -478,6 +478,8 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct d=
c *dc,
 	bool upscaled =3D false;
 	const unsigned int max_allowed_vblank_nom =3D 1023;
=20
+	dc_assert_fp_enabled();
+
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
 					      validate_mode);
=20
@@ -531,9 +533,7 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct d=
c *dc,
=20
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
=20
-		DC_FP_START();
 		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
-		DC_FP_END();
=20
 		pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c=
 b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 8475c6eec547..32678b66c410 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1760,6 +1760,20 @@ enum dc_status dcn35_patch_unknown_plane_state(struc=
t dc_plane_state *plane_stat
 }
=20
=20
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, val=
idate_mode);
+	DC_FP_END();
+
+	return ret;
+}
+
 static struct resource_funcs dcn35_res_pool_funcs =3D {
 	.destroy =3D dcn35_destroy_resource_pool,
 	.link_enc_create =3D dcn35_link_encoder_create,
@@ -1770,7 +1784,7 @@ static struct resource_funcs dcn35_res_pool_funcs =3D=
 {
 	.validate_bandwidth =3D dcn35_validate_bandwidth,
 	.calculate_wm_and_dlg =3D NULL,
 	.update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_pipe_for_=
layer,
 	.release_pipe =3D dcn20_release_pipe,
 	.add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 0971c0f74186..677cee27589c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1732,6 +1732,21 @@ static enum dc_status dcn351_validate_bandwidth(stru=
ct dc *dc,
 	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 }
=20
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret =3D dcn351_populate_dml_pipes_from_context_fpu(dc, context, pipes, va=
lidate_mode);
+	DC_FP_END();
+
+	return ret;
+
+}
+
 static struct resource_funcs dcn351_res_pool_funcs =3D {
 	.destroy =3D dcn351_destroy_resource_pool,
 	.link_enc_create =3D dcn35_link_encoder_create,
@@ -1742,7 +1757,7 @@ static struct resource_funcs dcn351_res_pool_funcs =
=3D {
 	.validate_bandwidth =3D dcn351_validate_bandwidth,
 	.calculate_wm_and_dlg =3D NULL,
 	.update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes =3D dcn351_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_pipe_for_=
layer,
 	.release_pipe =3D dcn20_release_pipe,
 	.add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c=
 b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
index 8bae7fcedc22..d81540515e5c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
@@ -1734,6 +1734,20 @@ static enum dc_status dcn35_validate_bandwidth(struc=
t dc *dc,
 }
=20
=20
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, val=
idate_mode);
+	DC_FP_END();
+
+	return ret;
+}
+
 static struct resource_funcs dcn36_res_pool_funcs =3D {
 	.destroy =3D dcn36_destroy_resource_pool,
 	.link_enc_create =3D dcn35_link_encoder_create,
@@ -1744,7 +1758,7 @@ static struct resource_funcs dcn36_res_pool_funcs =3D=
 {
 	.validate_bandwidth =3D dcn35_validate_bandwidth,
 	.calculate_wm_and_dlg =3D NULL,
 	.update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_pipe_for_=
layer,
 	.release_pipe =3D dcn20_release_pipe,
 	.add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
--=20
2.51.0.618.g983fd99d29-goog



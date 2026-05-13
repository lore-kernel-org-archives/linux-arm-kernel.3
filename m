Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2761CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KPjNzhHK50cDvgdayyNCGaEkmYz/Q2VYJa8N/oM2vHs=; b=O/eGNuYIFtXmnhBSwVPHaVK5ZG
	8AfqSU4sKrhtG03zOlN/N8YKTLH5T1Vzqp5M7WlUztw+Hy8LKj2bM4rulUL4z4F2r4BgsOBwXAaFv
	Ot0pJgZwcK4V2SEKuciKQFuch0DfGdjrgNbHV+2FKguyi5bDYzdU6zFtVIDOD+ubSg38GO7Xci8Ue
	julh6LZhcAkT1R+vR0v3toQROBh0vegPTVow33pziINGFbpB1uvWNJ/4V9sx4Qi4SqgOg4qZ0rV6I
	+N5iJsxZ1onDDVUDtLSDBoHcdypjw2sqWmmrKND5Oaj3jHD0L6joOELo5ylCkPfjotQzp9YJUlVjh
	KkgrMZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEBJ-00000003RoW-0TgZ;
	Wed, 13 May 2026 18:19:41 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEBB-00000003RnI-2TCO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:19:35 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-90d1f03238bso178958885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696372; x=1779301172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPjNzhHK50cDvgdayyNCGaEkmYz/Q2VYJa8N/oM2vHs=;
        b=YwMi8H7zSHy0iNiHA7xfO7eUoA+RjljJym3XtHTuf31SmrzhwHRNcxcuAHlDPzEbTS
         rMig4NlE6gXIRO/DaIGNEw6hTi4rALo+2POUtUCCNiB1tW3mIwBSE3CTORSfPZdemDpY
         NUqSVKxrlnZBFu5YECWLKnK6cXsTzcqjop5MXtYtIO9nC7kzazz94CVFnuwGRqNY7ekP
         oima0pu0mlhdd/Q2nYlmxFM6Y/usyUsNyUe3krfxy3aCMSG81sxz7GrDWPhYJy2WP0em
         AYEkHY9XFYKx4/RVfnYYFxwI2wpiWoGGl4BKwdtlGn0XSxynVfraZTVrq8q4Oje3tNke
         h4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696372; x=1779301172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPjNzhHK50cDvgdayyNCGaEkmYz/Q2VYJa8N/oM2vHs=;
        b=CtySSjeU10e0Pd6zpHGEJVmHezPsGDA38OFxrqp/7StUg7C1NtWaRddsRnwKQRgwqP
         hAVlM38DZnkw2ZAcVJWl6/HWCQI0YU6zMmjZhNI6uv6dpAZDF/ZXoyoCUtHr0Ln8ymbC
         79PsLYtUZA4yR+RWpFfbE2yhpT4kCqLATffDqugRY4t1Q3RSN1U0v8Ilbo93dsNk6F9w
         9c4wXO/ojfep+yyByFqUX0oTWBX0ltONZT7s+AGAX+bRYZ0IdOLiBVcKOwXjxiV6rMcc
         hLY3tCapFkJvS/ju4OCff6Q20G+Hm3g03I50LtY0RhJSTJfmLHZ7fjbMx8rvfs9tn728
         3FLg==
X-Forwarded-Encrypted: i=1; AFNElJ9O9kp6ZvOhFq3DVJTBKBbZJM1vOw+fk77RlCArJXbhJyZsiLml43perofvl/rKpzW7JyOlGsVFxYNoPwvajfoA@lists.infradead.org
X-Gm-Message-State: AOJu0YzFukEAIBpyTCE1XmuEACW8eBwfKOX94u2YuzkdJFh7focyhGSM
	ecsx+tcnEVvR8d5jeWaCsocczfZy5AbYwHLmqRCzmU8YaHhqQUAjExBY
X-Gm-Gg: Acq92OGHN7jvnI85NR1BYD5InByCTkZH7ZwhmaPDAbLdO8xsSGrx1pFvGyzQsw3+Jou
	4Qg1sEFPEpEBMZceRTeCVrZ6FNM9E4QD2JUzTmnu5U3Xt0HXM1LJY0GJx+6sjAHBKQ1f4uXMMhR
	EOyEaXCUQaEIJ7pUyeGYuPpNo4IFuL3xKeRbYuBp1SNktVnADr7bBfKmyaXFvg6kpNtYYjC7Np2
	K9bxzekJmkLUV1SG8lvWYUIFSv4s3Bklrdez2CjHc556x8qUSOe7Ezveo+PvH1YzdG67dXKNnZS
	D4+cguVGx4LKKgAVMIFNiQBJ7D03v0yYY+AClFQxXcaRoDjuFnD7qUIrsxk/FyPp7wt1OORCjen
	Km5IHNznee6qHcQYyyh60KbOeo4hBcm/yGeM2gSDf31m+8090u5aVleAR5fZEoWFcp+PXm92fTU
	PxLM2GcRaSlECgJFwp2t83VEiQLXukEqL5lx07sHfkw/GLQ2Sv5B8jCekff/vGImcTPbJ740PSS
	XH+gqPEO4hNe7gGXMFOLJ+aIggkvLCP/pVoObiylpEjNEKgtf7AvA==
X-Received: by 2002:a05:620a:8886:b0:910:1c85:4adb with SMTP id af79cd13be357-910b110235bmr62071185a.37.1778696372150;
        Wed, 13 May 2026 11:19:32 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bd02f12dsm27871485a.40.2026.05.13.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:19:31 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkvdec: hevc: cap EXT SPS RPS control counts before descriptor assembly
Date: Wed, 13 May 2026 14:19:22 -0400
Message-ID: <20260513181922.2075438-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_111934_019327_43E28437 
X-CRM114-Status: GOOD (  21.12  )
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

V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS and
V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS are registered as dynamic-size
controls with a per-control element cap of 65. The V4L2 control core
enforces only the payload-element cap. It does not bound the spec-derived
count fields that the rkvdec HEVC helper later uses to walk fixed hardware
descriptor tables and temporary helper arrays:

  - struct rkvdec_rps::refs[32]
  - struct rkvdec_rps::short_term_ref_sets[64]
  - struct calculated_rps_st_set::delta_poc_s0[16] / delta_poc_s1[16]

A userspace V4L2 client that can open the Rockchip RKVDEC m2m decoder node
may submit SPS/RPS controls whose counts exceed those capacities or whose
prediction reference index underflows. rkvdec_hevc_assemble_hw_rps() then
walks past the descriptor table or temporary-array bounds.

KASAN under a small KUnit harness wrapping the real helper reports
slab-out-of-bounds in all of:

  - num_short_term_ref_pic_sets = 65 (write past short_term_ref_sets[64])
  - num_long_term_ref_pics_sps = 33  (write past refs[32], intra-struct)
  - ext_sps_st_rps[i].num_negative_pics or num_positive_pics > 16
    (write past delta_poc_s0[16] inside calculated_rps_st_set)
  - INTER_REF_PIC_SET_PRED with delta_idx_minus1 + 1 > i
    (u8 ref_rps_idx underflow then OOB read on calculated_rps_st_sets)

Validate the SPS/RPS counts before calling the assembly helpers. The cap
values match both the HEVC spec ranges (num_short_term_ref_pic_sets <= 64,
num_long_term_ref_pics_sps <= 32) and the fixed driver descriptor and
helper-array capacities. Reject controls whose counts exceed those, and
reject prediction entries whose reference index would underflow.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-7
---

I don't have a RK3588 / RK3576 board to confirm this through a real
/dev/videoN request path yet, but was convinced enough by:

  1. Static reach: registration of EXT_SPS_ST_RPS / EXT_SPS_LT_RPS with
     .dims = { 65 } at drivers/media/platform/rockchip/rkvdec/rkvdec.c
     :239-287, the SPS-count-driven loops in rkvdec-hevc-common.c
     :213-225 and :228-251, and v4l2-ctrls-core.c :1213-1277, which
     validates only EXT RPS flags and not the spec-derived count fields.

  2. A KUnit harness (separate, not in this patch) that allocates one
     struct rkvdec_rps + a single calculated_rps_st_sets element via
     kunit_kzalloc / kzalloc and calls the real
     rkvdec_hevc_assemble_hw_rps() helper. Under UML + KASAN_GENERIC with
     the kasan_multi_shot boot param, on a stock tree it produces these
     reports:

       BUG: KASAN: slab-out-of-bounds in
         rkvdec_hevc_assemble_hw_rps+0xb0c/0x1080
         (num_short_term_ref_pic_sets = 65, write of size 36 0 bytes past
         the rps allocation)

       BUG: KASAN: slab-out-of-bounds in
         rkvdec_hevc_assemble_hw_rps (num_negative_pics = 64, write past
         the single-element kzalloc'd calculated_rps_st_sets buffer)

       BUG: KASAN: slab-use-after-free / slab-out-of-bounds reads via
         u8 ref_rps_idx underflow at calculated_rps_st_sets[255]
         (INTER_REF_PIC_SET_PRED with delta_idx_minus1 = 0, idx = 0)

     The num_long_term_ref_pics_sps = 33 case is invisible to KASAN
     (the OOB write lands inside struct rkvdec_rps) but corrupts
     short_term_ref_sets[0]; the harness asserts that case explicitly.

  3. Same harness on the patched tree: all five cases (four adversarial
     plus a legitimate-limit regression with ST=64, LT=32, num_neg=1)
     pass clean, no KASAN reports.

If hardware-side validation actually does reject these counts before
rkvdec_hevc_assemble_hw_rps() runs and this patch is unnecessary, please
say so and I will withdraw it. If it is reachable, I will follow up with
a runtime hardware splat once the Orange Pi board I bought arrives.

Let me know if you want a patch set with the KUnit harnesses too.

checkpatch.pl: 0 errors / 0 warnings.

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98..895fb16bc572 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -408,9 +408,58 @@ static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rk
 	memcpy(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps));
 }
 
+/*
+ * V4L2 caps the EXT_SPS RPS payload length but not the SPS-derived counts
+ * that the helpers walk. Caps match the HEVC spec ranges.
+ */
+#define RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
+#define RKVDEC_HEVC_MAX_LONG_TERM_REF_PICS_SPS	32
+#define RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS	16
+
+static int rkvdec_hevc_validate_rps_ctrls(struct rkvdec_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+
+	if (run->ext_sps_lt_rps &&
+	    sps->num_long_term_ref_pics_sps >
+	    RKVDEC_HEVC_MAX_LONG_TERM_REF_PICS_SPS)
+		return -EINVAL;
+
+	if (run->ext_sps_st_rps) {
+		unsigned int i;
+
+		if (sps->num_short_term_ref_pic_sets >
+		    RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS)
+			return -EINVAL;
+
+		for (i = 0; i < sps->num_short_term_ref_pic_sets; i++) {
+			const struct v4l2_ctrl_hevc_ext_sps_st_rps *r =
+				&run->ext_sps_st_rps[i];
+
+			if (r->num_negative_pics >
+			    RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS ||
+			    r->num_positive_pics >
+			    RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS)
+				return -EINVAL;
+
+			if ((r->flags &
+			     V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED) &&
+			    (unsigned int)r->delta_idx_minus1 + 1 > i)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
 				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache)
 {
+	if (rkvdec_hevc_validate_rps_ctrls(run)) {
+		pr_err_ratelimited("rkvdec: rejecting HEVC SPS/RPS controls with out-of-range counts\n");
+		return;
+	}
+
 	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
 	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
 }
-- 
2.53.0



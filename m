Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51318CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvwC2v7tf0bP6Dcjl3lKTCXZwlNlpqu4CB+86cy9Tlo=; b=cyL4k8h3H0SjannSWqeAuH1QMH
	PMloKkE4sz7CuDsZSEFJWQafQfZU6ncA9SEvPydgln6mjsFfHp00p05n3tCeZhwRHQlt9IqH8KGqd
	DfMs47sfC8wOGC8hvJJUEs5eYbGnURAgei4fq3K16TE/o/f8HBS21o7iT7I2O6dkiE5pd6qh1nSe/
	nOygShXv/7Gu3vFcP9B7khVLDMaUTbvNLrgPBVsWqUahu/rL4HMsKwYv8SefO35QV1N7fy+fU+gEC
	pBlFxFA10ab17sDogUXKa4JZ9COe0+4LebnHjLmok7O17AOyMV3pPThJokb1dSrpLm6HPhUXdJ5CY
	UEAJrY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKFA-00000004gSy-3OJn;
	Wed, 27 May 2026 19:48:44 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKEl-00000004gGc-3HRo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 19:48:21 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-91080895355so1360158985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779911299; x=1780516099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvwC2v7tf0bP6Dcjl3lKTCXZwlNlpqu4CB+86cy9Tlo=;
        b=eiiUuOUlP/1++E5VDXerFnI21EOR4tWyI6WyfnBeU3q1ZguChyXAkRQ9w2lC2MSE2W
         bxcrycbk1RCbbpeF1Nx6DYzYO66D307QTYHP4Y40DdDiBVpBFLf3O6Vs2CETB9lfWSJ8
         TuhEKsgT+3FGCjBrmjF+szFkEy89PneYvxrYAwhhW/Xdz63X5u9od2njEzajKzaZCeJN
         QTJJDeYqo0RjfZhjzwccXAzb+pKyGkvP8bJ7O+lyd7cw5mbT7KgubCHZS7eb+dJ3dBDh
         FTNBXzDBLd2AFRtdaMSgQnDMbhwPovrYw5jpowQuJKCL7Y3XJR8iydILrrRAlc5lArW9
         oKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911299; x=1780516099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PvwC2v7tf0bP6Dcjl3lKTCXZwlNlpqu4CB+86cy9Tlo=;
        b=SInjJlKnub0H9m3YWzSdm+mLFcMtAl7DX64grrJ6oiYL446qi46ShAQc6/iG5QvqMB
         GSGa6WjlJ0X08EaA0pCZ7tqLs6x/qpW52txjwnDSH0z0Te9FosskYTogf71HCUvQAAKs
         h1dG0YI4DxbM8kvD/jKTPxPsCg1qeSmrU7cnKVc0mw0rBnl1jb79cF4Ctb/3HyfzLn/F
         R8Yh4+fR2st0XWd8lYCIQUBFdYcrNa7W7t9FdjJh/eB2fAGynhTjGS0hdO2FUPF/d3At
         kDIC7jTYLNYZ6qAd6MWRj8DmsTF7G+3oLxM/kq/WQF7XLZEbDi0Hie7tL0fthReI/MAw
         NuVw==
X-Forwarded-Encrypted: i=1; AFNElJ/viAAepOMtpgYz06rz6PQQMnAa5BgpLJa/MsOgUhmtucYoZAdiJFmfTAxbNxl2z3FE9PCUHfajWQ9zANG3l+Lo@lists.infradead.org
X-Gm-Message-State: AOJu0YxG2ADY2zy9Rcf9tgRNMYbK24uVE8xyGgaS+uvnbBT0s5XTGkD8
	fSk1ytOVXp4NnVnGBlAKmF7Nseb4/ja4d6SUVdawns8+BfxPTUDxFY7X
X-Gm-Gg: Acq92OEN8ZJJ1riKkZ4SFNR20JpMovUGWNE+Jg/sRQrIcRAnQ31nPhS+AOsR1Y5E0Vy
	XJSTqQanwzuSNjUDgWQqSAm+fGhMPwtbPCEF7wJjSVk570eQSQmdZLMLsGVr1EQDX8d6gv7maxG
	e+ovWmfe94tV89SgOj5HhhgcIgg+RYhef9WFzRMxHlP8amqxcHydN8ci6abx4p0c9UJuXO9B/fX
	6R21lhL7SLbAiEI6cb1jkadR2cpVPEJGvruqXaIuU9aqX4ro40/j8f55tBejPYhA2MhNCuktwAJ
	8Apgc2o/OlZDaZb/7eysOPPhsuBB8lMfQQwQBNZSE+rDaDQ9vOfmIohEDAPujbvQnEhFLCgBVfv
	Xf+N1bU55jLXA/LhpP9HmnDEuaNooC1TkkeWxEFb5rxMER5YddwxbK4DwHjfkSbvCZPJJM7qmUJ
	jDFqTGV1vq6UPNUtsG+oS7bQbWpqcgBi2hohNgwr+Y5kPQO1UQBEIXDMy6mQdCGF7HIzuhvDYKx
	Gwo5X9LjxboUdTXYFm3x56wUFFAKhDmJ1uNmTD99ipofvKYOOZ4MQ==
X-Received: by 2002:a05:620a:2b45:b0:914:da39:eadb with SMTP id af79cd13be357-914da39ee49mr2225042385a.12.1779911298765;
        Wed, 27 May 2026 12:48:18 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87017a0sm564942385a.15.2026.05.27.12.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:48:18 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] media: v4l2-ctrls: validate HEVC EXT SPS RPS counts
Date: Wed, 27 May 2026 15:47:36 -0400
Message-ID: <20260527194737.1999409-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527194737.1999409-1-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
 <20260527194737.1999409-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_124820_490427_5F46E8E7 
X-CRM114-Status: GOOD (  13.35  )
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

The HEVC SPS control carries the short-term and long-term RPS counts
that decoder drivers use to walk the matching EXT SPS dynamic arrays.
Reject SPS values that exceed the HEVC limits of 64 short-term sets and
32 long-term references so drivers cannot later index beyond those
controls.

Also reject EXT SPS ST RPS entries whose negative or positive picture
counts exceed the 16-entry arrays, or whose combined delta-POC count
exceeds the HEVC DPB maximum.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395c..a1d773e5de20c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -16,6 +16,9 @@
 
 static const union v4l2_ctrl_ptr ptr_null;
 
+#define V4L2_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
+#define V4L2_HEVC_MAX_LONG_TERM_REF_PICS_SPS	32
+
 static void fill_event(struct v4l2_event *ev, struct v4l2_ctrl *ctrl,
 		       u32 changes)
 {
@@ -1213,6 +1216,10 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_HEVC_SPS:
 		p_hevc_sps = p;
 
+		if (p_hevc_sps->num_short_term_ref_pic_sets >
+		    V4L2_HEVC_MAX_SHORT_TERM_REF_PIC_SETS)
+			return -EINVAL;
+
 		if (!(p_hevc_sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED)) {
 			p_hevc_sps->pcm_sample_bit_depth_luma_minus1 = 0;
 			p_hevc_sps->pcm_sample_bit_depth_chroma_minus1 = 0;
@@ -1223,6 +1230,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!(p_hevc_sps->flags &
 		      V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT))
 			p_hevc_sps->num_long_term_ref_pics_sps = 0;
+		else if (p_hevc_sps->num_long_term_ref_pics_sps >
+			 V4L2_HEVC_MAX_LONG_TERM_REF_PICS_SPS)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_PPS:
@@ -1267,6 +1277,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 		if (p_hevc_st_rps->flags & ~V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED)
 			return -EINVAL;
+		if (p_hevc_st_rps->num_negative_pics > 16 ||
+		    p_hevc_st_rps->num_positive_pics > 16 ||
+		    p_hevc_st_rps->num_negative_pics +
+		    p_hevc_st_rps->num_positive_pics > 16)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
-- 
2.53.0


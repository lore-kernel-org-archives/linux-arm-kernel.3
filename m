Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C53CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 19:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c11hqP4/VNZytv7vm7NkzIMTSch4hrmtgsXa84FfdMs=; b=IFSUwsp021for8QWRa6QokNZLq
	eR9PaQXpcX2R6gKLkQmiFoLPU2GXRMMuo1saaV7Wlab0Fgh79n6JJmpbbOtjM/jkaYlLYb3yUaDUL
	BngXp6kcg3mfL6bUas9mxbeYH23AIMZRd81jF/HEG+slp1rSgq6fMqajmsXTcaKF8gQtGrQSfWblz
	DJOxrricefiifYA676y5JpfaWd64n5/bqhjuCneobCa6mHsiQtvjJlQEv9/PfpZuuGWoIsM2K0RV5
	VP2nTyW2ceygEZWZJEGuf/GxrRCuXisVJf3fJHUth5ua+8uW2VoC6RHSCc3S1abgEFezD85UM+gLu
	YB9o/94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKEn-00000004gI9-2xJu;
	Wed, 27 May 2026 19:48:22 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKEk-00000004gFw-3WxB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 19:48:20 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-91173f20ccdso537210185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779911297; x=1780516097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c11hqP4/VNZytv7vm7NkzIMTSch4hrmtgsXa84FfdMs=;
        b=VyVkVey9jc4hEGckQNBVkJVDuRS4dsEZHIzkZ8JR+5LrrOKvQStEQxUodmq3HNNYXq
         2auThQUzvC719h2nkrO6yK/CWutu8WH8UK53i1Q+u3muN6PIYP0JsHJloJGCk3Cyqht9
         ei8LZaXH/mPilP7yeXTZfwFLy+hUzciS9F19vIbfNjlCoAqlqp6nNcjpYy6fmIlaux7w
         GeIL5fq2iKohTVM5/Qb6sugKEigQQL+nPZ1sm9AoyvqaB2pz47D+TkU6wYPyIAFbJzSQ
         BbTbbD+tysY8+eLIa1rxV8etGDHK4JKsMtoIYtqPlBUV/0R9KeKV2sgj5qhKyqYPkd2T
         f9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911297; x=1780516097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c11hqP4/VNZytv7vm7NkzIMTSch4hrmtgsXa84FfdMs=;
        b=PCiPBB25ExXdkNMaDDMZvUbNti3n9RCnVTRRVKlWbRjRGEqtq9ihtUQJYhBaTPSOSu
         dE/hc6l9nowxvqa5rHs+e3sWTMWArXBWBlZRRgKEcg2scTLnONdjFV0B4SlfVOyVf96e
         EuZ1kfEQUJUMPnq13omEcvG+QFPchT7owi6T3p1rJjsGwV+i75FHRpSYxJsMIifoX6xg
         ZH0s13MFMFDM1PA1xqfLKB7axRjjR03IJoCqFpxNEoct1zDgjAc/+lGTVC+Ovq2j4kLp
         SAbjWDtOx0XhIMaadZShnmMkh+SZlqTE/zQ5+CTty/HtnBnvWsKw9zvYbeNywFFBtY8x
         3TDw==
X-Forwarded-Encrypted: i=1; AFNElJ/W5OVe3zkhEgfWipWZvLYiU3AakVDKLq+G8Fm7Gc8fG5QF1+VyTwJ3kiHwFXrtfzgm3KNt3PQUcOjT3hE8Gpbp@lists.infradead.org
X-Gm-Message-State: AOJu0YxwHmZ/BM8ovkmnnm6aHeJzRXyga5EQQw8S2HQNbgI1UDA5BivX
	k2OQ/fH5tJIf01R5o+wygZQKS5EYi9PrOtNtjotkeot9Hp+gB2ZiDfrL
X-Gm-Gg: Acq92OHrFSBBKISVp/vbDWV5LnXbYBnwcx0PfYnuFPo4C3xcvBYkWn/dBNKZuhRmMjh
	Y0B/PlGJe4r7sXRtUiauiiWwGFGWWtowExKopdnUCgyiHJ4VecNszy1tSxyngtyGQdkGzhaQbv0
	dh9573UXOeNLvX+KOeBasQso3KbDQKa2HbNISbj+Z/ZERNidNV6eoUSYD8UuPwIgDKxu6UciNLv
	iHWvnM/HxPrTjMxi9xtLhZPF+YXxgzL2IXVGqmxMHMpZt+4Ae9pwIGpgjh+sEE+vMNqdBKUbJ2B
	IDChDYccZt09+TPH/0EG6ZJWc6tZZacIbMbcBm6YuKPqGO45yFWqiHIYtquTOJNJyZqAzXSUeev
	m46m9If5EM2Oip4d5A2I3cE/Vkn7jUQLS4qLm9VGVIrZa5igeAS9IOVmuQLwKod1lVsEsusN1/5
	SEAxqCNCLFMsDPutX/f4lvlujM9KCNPI+lov/cwMyAS8zGCpNIfVufvUIuLh5ofoUzvwDrXWZmS
	pAc0t7783lXP0moxxj8eXGNmrByVrABSvjFE4Mp2WeXMLLbXXpstA==
X-Received: by 2002:a05:620a:2a08:b0:90f:624d:70d3 with SMTP id af79cd13be357-914b4928045mr3475904085a.23.1779911297364;
        Wed, 27 May 2026 12:48:17 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87017a0sm564942385a.15.2026.05.27.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:48:16 -0700 (PDT)
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
Subject: [PATCH v2 1/3] media: rkvdec: hevc: tighten EXT SPS RPS control dimensions
Date: Wed, 27 May 2026 15:47:35 -0400
Message-ID: <20260527194737.1999409-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527194737.1999409-1-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
 <20260527194737.1999409-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_124818_893984_B46F5102 
X-CRM114-Status: GOOD (  13.74  )
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

The VDPU381 HEVC driver registers V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS
and V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS with .cfg.dims = { 65 }, but
the HEVC spec caps num_short_term_ref_pic_sets at 64 (ITU-T H.265 7.4.8)
and num_long_term_ref_pics_sps at 32 (7.4.3.2.1). The hardware descriptor
table (struct rkvdec_rps) sizes match those spec limits: refs[32] and
short_term_ref_sets[64].

Reduce the dims to { 64 } and { 32 } respectively so the V4L2 control
framework rejects oversized payloads before any driver code runs.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e96..4fd06f4c04db0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -278,12 +278,12 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 64 },
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 32 },
 	},
 };
 
-- 
2.53.0


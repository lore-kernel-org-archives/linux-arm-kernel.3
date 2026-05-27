Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C5DCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 19:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8mDciBpPj7QyAvnzZsu2M6LtyDI2HbLOpEqsNC58XE=; b=2QggdRHU53rNMm5B/7cWJxws7V
	5AmCrad8qGIJdd6C64NEwmqZGkX7X3T3f9nryzLWeI2cJEh/gd7IDJjIIRbnZCopTwza8P3ZmPndu
	7w5jpW8GYm+QSiA2PrQl9pjSss/AQbMK4v5AXFFlubG1DAXYfqnZWX8Zu66xXz5AR40MtCnoemAOJ
	qtBRXjza/ZWEc3zYMsUH5EOd8x1A+ENsGegom+OC5cQO7ROngpNJFkYRPh+WWaYbNI3GnvlrqAYTP
	NA5S4BVgOtFANM/FpdY5pmc9d9HdpQI0lYzzXTKN7xtd+yOBZYeWx/RBY8ObNZOc91GK0lM5PO8ez
	9xmerQeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKEm-00000004gGt-272o;
	Wed, 27 May 2026 19:48:20 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKEj-00000004gFT-3FAq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 19:48:19 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-91066394ef8so920452385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779911296; x=1780516096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8mDciBpPj7QyAvnzZsu2M6LtyDI2HbLOpEqsNC58XE=;
        b=JViBqiyVBvhg2E2EEyLcV2y9/cYhojC9qaF2HRBAgGYxml+mvvXVEeqwVfUEUjAXB0
         i9P3ZuH2U2uDI8qSJqGoFTgaDAP7RGKxk9SJsl1lQP2qeqUuWeHQBFMWdeL8QiOXBMhY
         c2eSRK2dr/98My8hwal5HM80H/NpEjGeImHG2I2Juv5CHDoiqyQF4GoR2q+Ow1CLj63R
         yaLRmMmDqkfZUWa0JZpWBQDSyhzVM4/5xwJwU+QYO0nUAtOIkqxtECG25tarwA1Kn7io
         ePqi0Jjru9uZz3URdOkB0Au288RlQfm9hgDRGucwvL7zXUh2gMeIId2JNo0MB0skN3QS
         0Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911296; x=1780516096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8mDciBpPj7QyAvnzZsu2M6LtyDI2HbLOpEqsNC58XE=;
        b=LhH2rXDEU4QHeWeHoUOQqEXVurCpL23Vfx17HHYFORZIBGa2MVTwQh0vgpcW9yo6L3
         4I/UyjuXg6aDleiXYstNh7GZCs4MQxTuvDha5TDNePNQd4HqQjYif/nkX/ekzxOqphYO
         iz9Jz9kK7XSJS+LI/6/SkS4Hs9eH8hvsk/HjfznMwGImy2tFWBu62WsnLl8dbV8Uqn8P
         44FNZEpXJHwk6q/2uiZUuYN1g/EZS5AEMUPbLJGCwqHTziCGLs/cizVEq5M7LHCPq5qJ
         kmQhWy80jjmWJcygr8EOPC+knYhI+eED/r+5Sio+vQq8lEhvdNQTPjk29M8ILD2vyikZ
         CKCw==
X-Forwarded-Encrypted: i=1; AFNElJ87N3FOwW2dY1j1/71w4Es8ZMCpEVPqe207hWHWTAz5KoPox1OIQkZiH9s+GSxA6sx8YjqbPn90JKWKXxOjqw1i@lists.infradead.org
X-Gm-Message-State: AOJu0Yygmub5uYjS7/ZE4G7e6BKJdNr/9Fvm6P8KzMCuT9w1v65XvPBV
	+2XqREpUtPJLYflebWeVrhsz0aSWbg/kMzy5ZNaHYWRLHMWgrEWVEibi
X-Gm-Gg: Acq92OGMQshOz8HOEkDFlUyTmgqo4F1vDJSNAo8OL62Eh9dUcSnlS1LBQWXGwQxD16G
	or7gYzk+U4j1IcCWX3+wDHfVH08eN2Q2dZsB7O4cT07Uzg8rKBEfOhZeZM8kldnwA8Ut8cCBL3j
	CcUt/FtV4qWMv1jBR6l08gfqAE3ZoWH7utMydxFX7oT9RFv9B/Y/Y+iAVGLpnqp93t549bQDRit
	x97t1kreln/s6rR36YH/QE2FDkHszyG/VoTHmgPziBDaG5E56w6bapSRaLXpp5dZ5h9uMZtx6rb
	7j097D3q88lgRXdxpDUOrPGmsFiRZVRmlwcKw4A3OJ389HkPLj4/UfvfnvEBVrdTIjtSaPZ9Uzx
	aN54ei7dVirr59AMDcSt3EZR5rc/Vs/VnHb/wn/piTcPK362k2ZkKQEMSwxkNde1qwm5GgpQt6i
	Z8q1B+A5PBuFR7IHRk+X1d0bV6qhsy0KjEuseCQQvbKSZajqTpxUDauJXVHGaF1dIyzCQRldFS9
	j5Frudxh3cOtVU5cQ5znmG3HYs/VBU8muXnvOJLFP+QiysFO0itNA==
X-Received: by 2002:a05:620a:1b81:b0:912:1:b415 with SMTP id af79cd13be357-914b4934c9dmr3420082985a.26.1779911295913;
        Wed, 27 May 2026 12:48:15 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87017a0sm564942385a.15.2026.05.27.12.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:48:15 -0700 (PDT)
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
Subject: [PATCH v2 0/3] media: rkvdec: hevc: bound EXT SPS RPS control counts
Date: Wed, 27 May 2026 15:47:34 -0400
Message-ID: <20260527194737.1999409-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513181922.2075438-1-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_124817_820857_066FC2AC 
X-CRM114-Status: GOOD (  11.22  )
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

A userspace V4L2 client that can open the Rockchip RKVDEC m2m decoder
node can submit HEVC EXT SPS RPS controls whose spec-derived count
fields exceed the driver's fixed hardware descriptor tables and
temporary helper arrays. KASAN under a KUnit harness wrapping the real
rkvdec_hevc_assemble_hw_rps() helper confirms slab-out-of-bounds writes
on num_short_term_ref_pic_sets > 64, num_long_term_ref_pics_sps > 32,
num_negative/positive_pics > 16, and an OOB read via u8 ref_rps_idx
underflow when delta_idx_minus1 + 1 > idx.

v2 splits the single validation function from v1 into three layers at
the appropriate level, per Detlev's review:

  1/3  Tighten .cfg.dims on EXT_SPS_ST_RPS (65 -> 64) and
       EXT_SPS_LT_RPS (65 -> 32) to match the HEVC spec limits and
       let the V4L2 control framework reject oversized payloads.

  2/3  Add SPS ST/LT count validation plus
       num_negative_pics / num_positive_pics validation in
       v4l2-ctrls-core.c so every consumer driver is protected.

  3/3  Guard the delta_idx_minus1 underflow in
       st_ref_pic_set_prediction() in the rkvdec construction code.

Cc: stable@vger.kernel.org

Changes in v2:
- Split the monolithic rkvdec-hevc-common.c validation function into
  dims, v4l2-core, and construction-code layers as Detlev suggested.
- Drop the rkvdec-local #defines and pr_err_ratelimited; the V4L2
  framework now handles the bulk of the rejection, including the SPS
  count fields that drive the rkvdec loops.

Michael Bommarito (3):
  media: rkvdec: hevc: tighten EXT SPS RPS control dimensions
  media: v4l2-ctrls: validate HEVC EXT SPS RPS counts
  media: rkvdec: hevc: guard INTER_REF_PIC_SET_PRED index underflow

 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c |  3 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c   |  4 ++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c         | 15 +++++++++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)


base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
--
2.53.0


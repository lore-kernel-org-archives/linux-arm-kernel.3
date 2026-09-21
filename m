Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C30BC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEhqBiuQL/MEW0Qf0v9yrljoDp5ccHOdzYzDtJ6My1Q=; b=VmdCaCtqRpKCueMnn3VhzibLaq
	TjUx/F5bWQycokKVF1UipO/V2TN8SdwvkCqTtdUNKJzyyjS0QqZO2xYXW9Rcgy9HMqZIByhk020eR
	/JbRaTX8e7MSiwV4/rgXa3t/aiwXdCsaTeIlMG3xF4DfyJ2c3A9/A6IpggAiGXuyCSEfm5n+p0FHc
	Q2ovUXqhHnOZKYvXZngL90wKDRSm6fOEjUu43lacG/B6N2w8UuGLLoPc5X7bSx6OfWc0rPrHl3rlC
	aJtwkxs4LSz4K1WyS4fwkGGG6cDKSayW/pjaQ0ejFlJ1S4NKJilS9Xb+sIj9ETuFxxeD/Ot9ixiMo
	iprDhFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gM1-00000002jIn-2c0f;
	Mon, 21 Sep 2026 15:54:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLe-00000002ilP-2Qt0;
	Mon, 21 Sep 2026 15:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=hEhqBiuQL/MEW0Qf0v9yrljoDp5ccHOdzYzDtJ6My1Q=; b=v5PVJ6CncMqWhTGMoE5JnUYlM3
	QcGEjRjsI9LQtSXu0IbvtXjlLvPMdbsSdHWWyhbsuZGldBoOmmazhzKLQpnAfLwC9fJlxnBoWEPQz
	RuRETsm0LmOx+Vacg3Bj9Gnq4K84bKzhP5IXCA9eBpDVuEhrOVgGW64xxb2t6BmPAE1/YD6rnX+sJ
	WTerYEI8N3LAVbRBhzog1ZZ2ZPWTFR6ff/sb0aYZelSOPfx//0dsmaCzx6tSBTa5ctcYV7+Kh48xK
	5wDVkh8nedIeqZa6Lyz5kd9WXi8Jf2m7jA5kWsMDSzkvjYAByBikQwi10G3mli5vqH0kaf1IawDmY
	5kY5XHKQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLb-00000004fNU-17Uq;
	Mon, 21 Sep 2026 15:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790006023; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mNxYJPeTGHAGjPBxt2kG+O2omHs5iLPq053ahnUDuMDwCG+h/AgQV8SO1CcujSUd0RTs8zTxtr9YP1QcEg3zec8wba0rEkze1jbVLJaHKKMbgZ6SnL/2prDQmEPAgh8gxAwFEWhfnjYntkmJbR/+SW/NcMFAuYwgnBemfloyXpQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790006023; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hEhqBiuQL/MEW0Qf0v9yrljoDp5ccHOdzYzDtJ6My1Q=; 
	b=AOytYHd7RrtEEmEKbAFxraFjfljCZppLavxE5SUIhncMkLyUtMk5Srjanz6f7JFISOf4oT5zlcwpLD1vYKZB5YZLfbFTfZHF37WBaNo78Sjyox26JwZS4vCoQ2f8+ih1Nxq+eheV/GGQNjEYs6xseLNlRMiewqB4XLNxBmfdWPw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790006023;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=hEhqBiuQL/MEW0Qf0v9yrljoDp5ccHOdzYzDtJ6My1Q=;
	b=XP2LsrtVFXpGYiWDKFgWo+6g2O3stDZB0BqRxuDntgCEGqi0Do7N4jm6/EyqlGNC
	6oLlKKzi9sX4i2Jc/xjliyQNMiEDC6h26bBrEf9cqdC3ZKmv1+VJQU9qPsWUWB8C2DV
	u2gQofzgkZkNipPBCS+uhTGbxA7JyecMz/KFnhNc=
Received: by smtp.zohomail.com with SMTPS id 179000602308953.27122495413869;
	Mon, 21 Sep 2026 08:53:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:44 +0200
Subject: [PATCH RFC 18/25] video/hdmi: Add support for QMS in VTEM EMP
 packing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-18-2fcd7d011646@collabora.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
In-Reply-To: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_165427_811999_455AA155 
X-CRM114-Status: GOOD (  11.20  )
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

Add the necessary struct members and packing code to allow the
hdmi_emp_infoframe_vtem_pack function to write VTEM packets with HDMI
Quick Media Switching (QMS) data.

Co-developed-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/video/hdmi.c | 6 ++++--
 include/linux/hdmi.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index ed9abc7ad228..c164f69a646a 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1994,7 +1994,7 @@ ssize_t hdmi_emp_infoframe_vtem_pack(struct hdmi_emp_infoframe_vtem *vtem,
 	ptr[1] = BIT(7) | BIT(6);
 	ptr[2] = 0;
 
-	ptr[3] = BIT(7) | BIT(2);
+	ptr[3] = BIT(7) | BIT(2) | (vtem->qms_en ? BIT(1) : 0);
 
 	ptr[4] = 0;
 	ptr[5] = 1;
@@ -2005,10 +2005,12 @@ ssize_t hdmi_emp_infoframe_vtem_pack(struct hdmi_emp_infoframe_vtem *vtem,
 
 	/* This is where the VTEM part starts */
 	ptr[10] = (vtem->fva_factor_m1 << 4) |
+		  (vtem->qms_en ? BIT(2) : 0) |
 		  (vtem->m_const ? BIT(1) : 0) |
 		  (vtem->game_vrr_en ? BIT(0) : 0);
 	ptr[11] = vtem->base_vfront;
-	ptr[12] = vtem->base_refresh_rate >> 8 & 0x3;
+	ptr[12] = (vtem->next_tfr << 3) |
+		  (vtem->base_refresh_rate >> 8 & 0x3);
 	ptr[13] = vtem->base_refresh_rate & 0xFF;
 
 	return 14;
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 71e2b36896af..8eaa127f0cb5 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -243,10 +243,12 @@ struct hdmi_emp_infoframe_vtem {
 	unsigned char length;
 
 	bool game_vrr_en;
+	bool qms_en;
 	bool m_const;
 	unsigned char fva_factor_m1;
 	unsigned char base_vfront;
 	u16 base_refresh_rate;
+	u8 next_tfr;
 };
 
 void hdmi_avi_infoframe_init(struct hdmi_avi_infoframe *frame);

-- 
2.55.0



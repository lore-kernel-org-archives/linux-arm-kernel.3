Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89457C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YCcBWqb/14OVf5aTxzQNZow44RZO+5hy/WyrTI6Mqw=; b=IJs2Xrh16RW4D2g+4DoqbKAFyq
	6Ce4T5tVn/oZ8fy98MdUCk6EQgv78iDDOsg5cpcp/oEg7UoBxxA0Itk+vVvE1jL2pKKYe7b71GsLc
	3eHXRd1pT6xh7PuHeK0uZvIaey8V1J61BPly4MhPof/d1stOSsbxty+jZHSL7lJnPygArD3qzkduT
	TyEC7Z36EWAAKMXoCXDRGgTTlEbssbX9HI6zlCYABFMrnI65faZaCm2tVrZM3gnpGe2erVCCCdFJD
	XWS7oV8eSRL0QbL+fQcgXOlgiFFy9U7KEN3zccGoM8atcop4rV1/le3QEJEOPFPyiyCbF+Ll0ugpS
	K2Ty0nmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCHm-000000068rz-4BlV;
	Tue, 08 Jul 2025 17:39:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByH-0000000665d-1p0o
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1YCcBWqb/14OVf5aTxzQNZow44RZO+5hy/WyrTI6Mqw=; b=SXdKZM5NoqLqUKLMtT/irz111C
	4yhefSCdkg5BSi//atW1x/BcYmD+jNYe9vsidc+3iliF2LS+0fGH5u2NLv67v3fP1PLz9ZGQi++k9
	mq84Bx0yUll+ZqW/wJ6XA5l8KOyPSdUaJWCXCmVPARCsynap9rcBxwyYfsu3AB+QFIWflxjsjHVSC
	VNHxhlMBqb8vqEbr5HrjwnxbdgEnRFlSSxLPGp7s4vqVk48fWjB7j3AvQWFKa3SOJu/xAMJzNdfDH
	hHpqFHhDdkV2X5W6QF9cS9ZLWXqHTvZp1X+oDOB4lklkirjXSha6bImlfKX6qEFIP7pj3RluMXTfO
	3rS3uquQ==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByE-00000008lHa-0Kjq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so818651866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995143; x=1752599943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YCcBWqb/14OVf5aTxzQNZow44RZO+5hy/WyrTI6Mqw=;
        b=NPFp5ekNLMz6pAavnK8Q88wsk/x5QgMRPpkPZMtvUOmjHqp6Y3pDs/caGxeCsRcEkI
         QrL3MW9K2fncHoxpmVr4Q1MKq2YLASAZyoDalyifJ33Czg6bJ3uf8unIBvQFdHZ4Id51
         Yc9PdOJtjWP3q4Fte1M6egMbIPNL+11eFykJJynNQelWjfTnNxVuZUaFl5t5tkaA6w9F
         TbHRy/Vljm4+GqE1we4dF9zKhqeBwAxZRwshdrWV1tg8y9iTaSkFYhQQkgvxSQ1upPfG
         tdPTkS/RlhWb8f5ifI3qyWYbX1nEjkgqj/qFg4aK7+I8kdU3lJx966riiyqOzkoRSNjg
         Nukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995143; x=1752599943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YCcBWqb/14OVf5aTxzQNZow44RZO+5hy/WyrTI6Mqw=;
        b=QtLHgA35Jw81qc7N4nDuV/ygHLiXgfdXiYy9Ti9oMn72FHLnBQW/BXAGUH0zNEnYIn
         Lb9N7iTBGJXG6zZW4xR8rrO1/zlL6YKd9UWkMjgPpqHe7rnleQ2/MSwluKh/utlKDoj5
         Sjm9zzkO47WwXA4cWAMxEVKbOhmV8qmbp7d6L7i+t8f70RH4aijkukRAauCzhn6SLDh1
         0BXWT4Qub8nZ5E62Yjh4XbxOAdy19uKVRW0nMaHwNaQ5tPqkHy5SEVM/vi5Qk92bCoFU
         /R2GsGGRDt1tHMpf2KdgSxrgj6BOo0PmtmvN5TVmgIvYBUPNjIG2ABM+YvPoLpy9LdTF
         ZZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCUS51iQgL1W3/8utjqiwTQxEMOd+KJVf2OvMa2CimAjISa/YB32ZeF+CN563iTuS1F3Rwwi9UTz8/KIuaIzwmJi@lists.infradead.org
X-Gm-Message-State: AOJu0YxwdvxLRDUZm9WM+wjW7xKUPKeAQrs2hwgLHnYRHe23x00f9W5i
	VNaX0p6z/plvxk9VssKuBVSORL44Ud55otDjTKR5IX6ybO3spdtV/nLchjS2Ej2EKFQ=
X-Gm-Gg: ASbGncsrw828W4nPq8lRbyUCyk4TQm1QP/vbly2VkpDnYaBeH83Nx66j2UbKvB927DM
	RNYsU4fyGAo1glRhkV8NE+C2jUGNn1gB3HDWSR84t7y14Gl6jOQZjtr596G9CURIJ1H18lRAud2
	tOHXvHzVksFxaFaxV0AuMIv2rPQtNpl/NaiMmbyS5DNTEZPHiGAZB7FKKAZ/lFptCqwGf6q884M
	k9mgm6vmYPoqkBZNDf3u48xblYk0xkmpSxlDV+JWJrqLtwDBuTbT+NVRyRN+22LU3WioYJLMYTJ
	aPg0uWSVHrYuy4X5O6mng5xPV8kfcSk8lBt9MBumVIkHSIygMlAFFmhMofjt2TWuB9gbck8CZEp
	96RnzElJ/8KBWyfWjWxGM0oNXTzr5
X-Google-Smtp-Source: AGHT+IF8kfHJKejLeK1j6H1zcywDZ8Xdr2xWppCGautnggpU9vBR2EhDTLoKC/i+i65Bb+rH5MsXng==
X-Received: by 2002:a17:907:2d8c:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-ae3fe82cdeamr1461476766b.55.1751995143150;
        Tue, 08 Jul 2025 10:19:03 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6949fa6sm938612466b.68.2025.07.08.10.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/8] pwm: mediatek: Simplify representation of channel offsets
Date: Tue,  8 Jul 2025 19:18:31 +0200
Message-ID: <94aa8b7d52040f3a8dcefa7bfc634b3b747a26fa.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5739; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=z5L3CHH25GbwGRFMLktIjhgOzZBzKjmxrP0Cl1JGUM8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVLq2AvNIQgz0PLl1pxrGIZfz+DVJY8qDCHHM wDr+RYhjhiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S6gAKCRCPgPtYfRL+ Tu6rB/9p4O1XZjIbDPc+vjcQU19EDxQe/BSCihxRRBdMxsMWowCwgoaYwPNSUSn5iBl4xCOW5rO bQ/hp5Q0Ef5zbg93tsqLEuTnR9T+jOX73GWuhB9XlUVuOBDRDJPwXCJyXw/oBACjJXSqIYeOpmJ wfwQmkghSSiQGiAC6/vEJQroAxsibBG0tkVeVvthZ47oyvGEZWyR7bjlyUzh/PWUxegEGmup0CH E/pd1HmG8gt7WYRyc1GUjZRHT7kxw4eS1BS7f24FYHbJr+AGOj/EMTJFLCh9mttnyUG3LvsBYtJ 6yJOAQvuZdIz8i5zTHj52ExXITzCPHJd3sJs5jpp2lxLqnZ2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_181906_336113_47A57342 
X-CRM114-Status: GOOD (  16.09  )
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

The general register layout contains some per-chip registers starting at
offset 0 and then at a higher address there are n nearly identical and
equidistant blocks for the registers of the n channels.

This allows to represent the offsets of per-channel registers as $base +
i * $width instead of listing all (or too many) offsets explicitly in an
array. So for a small additional effort in pwm_mediatek_writel() the
three arrays with the channel offsets can be dropped.

The size changes according to bloat-o-meter are:

	add/remove: 0/3 grow/shrink: 1/0 up/down: 12/-96 (-84)
	Function                                     old     new   delta
	pwm_mediatek_apply                           696     708     +12
	mtk_pwm_reg_offset_v3                         32       -     -32
	mtk_pwm_reg_offset_v2                         32       -     -32
	mtk_pwm_reg_offset_v1                         32       -     -32
	Total: Before=5347, After=5263, chg -1.57%

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 58 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6777c511622a..a816f136f39d 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -38,7 +38,8 @@ struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
 	u16 pwm_ck_26m_sel_reg;
-	const unsigned int *reg_offset;
+	unsigned int chanreg_base;
+	unsigned int chanreg_width;
 };
 
 /**
@@ -57,19 +58,6 @@ struct pwm_mediatek_chip {
 	const struct pwm_mediatek_of_data *soc;
 };
 
-static const unsigned int mtk_pwm_reg_offset_v1[] = {
-	0x0010, 0x0050, 0x0090, 0x00d0, 0x0110, 0x0150, 0x0190, 0x0220
-};
-
-static const unsigned int mtk_pwm_reg_offset_v2[] = {
-	0x0080, 0x00c0, 0x0100, 0x0140, 0x0180, 0x01c0, 0x0200, 0x0240
-};
-
-/* PWM IP Version 3.0.2 */
-static const unsigned int mtk_pwm_reg_offset_v3[] = {
-	0x0100, 0x0200, 0x0300, 0x0400, 0x0500, 0x0600, 0x0700, 0x0800
-};
-
 static inline struct pwm_mediatek_chip *
 to_pwm_mediatek_chip(struct pwm_chip *chip)
 {
@@ -118,7 +106,8 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 				       unsigned int num, unsigned int offset,
 				       u32 value)
 {
-	writel(value, chip->regs + chip->soc->reg_offset[num] + offset);
+	writel(value, chip->regs + chip->soc->chanreg_base +
+	       num * chip->soc->chanreg_width + offset);
 }
 
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -300,86 +289,99 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 static const struct pwm_mediatek_of_data mt2712_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt6795_pwm_data = {
 	.num_pwms = 7,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7622_pwm_data = {
 	.num_pwms = 6,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7623_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = true,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7628_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = true,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7629_pwm_data = {
 	.num_pwms = 1,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7981_pwm_data = {
 	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v2,
+	.chanreg_base = 0x80,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7986_pwm_data = {
 	.num_pwms = 2,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7988_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v2,
+	.chanreg_base = 0x80,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt8183_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt8365_pwm_data = {
 	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt6991_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL_V3,
-	.reg_offset = mtk_pwm_reg_offset_v3,
+	.chanreg_base = 0x100,
+	.chanreg_width = 0x100,
 };
 
 static const struct of_device_id pwm_mediatek_of_match[] = {
-- 
2.49.0



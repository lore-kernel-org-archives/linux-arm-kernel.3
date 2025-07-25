Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADA0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxaYQHDh5cKo8mtT6NzRrhKRLaSvrukMWylmIT86P38=; b=QpG9e2P04K4H5WSrE0DIo89Jce
	v6AvXsZQUtsM+58Kqu3LZzqOm5wPN5PPHRoQdwC3cYUwrT/oVjCwinm0lr/WilNkw6uOOn+4+/FCN
	aJ+hGVjevloVaNaCMDulLhWxHllE68rtob334TwtyutKJIABl1/ztGpWhbCr+Ci5YVsYWC1LPoAvt
	jMW7LrEMqyLri28fhOLSnquZWPrSs74wr/gdqQF54Xki0wIA2Tz5yZX65f40TrdN0WKd7vN7TAuUF
	FpjrtaxugKwEBXAtob1koDL9fiHBdBR72KIEaKPa1gD1sN4gNEXA2C10P2P7uzJGiioMylzgTuzDq
	VM5QfO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKkE-0000000A9dN-1K1B;
	Fri, 25 Jul 2025 15:54:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcB-0000000A8UA-2t52
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so1263096f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458342; x=1754063142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxaYQHDh5cKo8mtT6NzRrhKRLaSvrukMWylmIT86P38=;
        b=FzoCgd65L5zHAxiiXeQ75ZciEtFrv/aC4QnjLns7Bv2dOPg9bFofph2fEQXwV3Vf61
         whU4ILBZWKUrmk7P/mG+KEhUjJnf0njGKJzsehgTU1Qd1LC+Oa5atvxzzVRXwtCAzG5n
         EYpWWO0ZhYX/uM52Vs0P71ovE+7L6O7ChSbQ291GNO28rU/WboVRA1Bu7+VdMHD6rxLk
         XQUU6iiautFUiQ/STLPo1Lrfi6T18SdnVWKCauPA7HBxqcfiFgpafrSQd7NK4DF5xNIc
         Sg53fv0c+owrYRVFVF9saYPEsORAvZHCU+Y0RKRDatth/t3p08RMSf8/RGW1oijNR+WS
         xiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458342; x=1754063142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxaYQHDh5cKo8mtT6NzRrhKRLaSvrukMWylmIT86P38=;
        b=RQoMHjUO0m8Z2bSwW4v/Xr31UEvURDb3TV4oOQ3eGVJ8FL4fe6z+aCzmGT1yOSKHzn
         9pBfXtTxCc7T3cVOC4JB8jozUHJv/a1lGxsV7yfSLJEheA2wWSAHl6u6lPtCE4HVQr4a
         oNcYWYk088ou3SH20ZL1sHwW10Ac6yB8OREhdDELLnG2C5aAxIMhXP4/kId61/1xJwRx
         NhdipOpuTP9xI+odtT2AlYMMCsiAYhkL86GbS515ZsUlXlUTeMS0T7t/euV4oMjvEpkv
         q50jZA02HVuj+u7JXKSNYc+fmOmzSGyUM91D0OwL007cCMZ7xHJsnzevFZ8BdM3ajzW+
         ujrg==
X-Forwarded-Encrypted: i=1; AJvYcCUshNsVHbJxnQUtgyUTNqvKGp1L5JQk9pq2sfgyHVWlrASVQvkdUPCSRjP7BJFNvqd+rWSr4QpuM90MSnwyl/Jj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk28cNE1RfmK2YPMUrR0Fm7cW1S3zpPLR43umKf15CSYnC+7aA
	ZNd+q6Rqo7CtsKubiAZT4KshX7v5OPgwi6Pq4hTYSGk7R5803RH6N8oqeMvocCVOCao=
X-Gm-Gg: ASbGncv74PWu6pQxhnzaNr+K+iLgTW9tE5wSETOw+XvV0ifMxe53yxJA1wynGACxVq7
	YZUo5HQXUCsxZcV8pTrN/ZveFzsy9w2fjSniqylK4otrV13yDHPpKSEkmsHcLpUxWOgLSKS//VY
	CQulN/pZVf5rZUN6jjmhxWciFqpXx2POW/o0jSJR2yPLZvNeqQFp3q2KJPLJ7hFRTfFE3KNaPaz
	1aMRGiWUSSuOuSCZtwX9EoIt97EpYfiOOYdXNqYprFrRLO0JUQ8AapbfxFC3Tueh++IIqDYzj6w
	DZUUUa0r0UeD6MJl0dLTAtc9t21+UzZLnNIl7CYGa8culGjt7svlWL0ttJ1HoE+fuQwbhKEPVA5
	UYPmWMsmCBvuSdJK7y7O35Pd/AACLTgk5WySx0Hq+4ndr1S5cxiRB1c32eVOR6a9K
X-Google-Smtp-Source: AGHT+IGLf0RaznLGubTb9GrWSWMqA4rv+UHjGWeJ9+UUUrOkSVNTMU1NKksbhZETQOgp46K2YKeCjQ==
X-Received: by 2002:a05:6000:2512:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3b776683682mr2225218f8f.53.1753458341899;
        Fri, 25 Jul 2025 08:45:41 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778f20f13sm216269f8f.74.2025.07.25.08.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/8] pwm: mediatek: Introduce and use a few more register defines
Date: Fri, 25 Jul 2025 17:45:06 +0200
Message-ID: <20250725154506.2610172-12-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=3mJ4A/6Pmt4yLob6UGgS31y2jyn08FFUhgu5smHeo/4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aImLDhXHCb6+d622T7jKufvSctxWiBTt29m OA/ALkdcA6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmiAAKCRCPgPtYfRL+ Til2B/9tjtEebAqhfh5ngLznwQUXXFNGgnSlF6oz1SeyDpnoN+OC4qnsM1qWdTqrdfdvA91hPEr O3S+BcFDco8tFtStM6LbUFyBv+oeo2Ij52cM8b+jW8ShPxiEjlddINOfYGCs+qvv/k/mCapmtZF 1qgPHFEZVgCkcPgWtfkTxB4Ja3PnoDVXg0p1Hh40y9KYZtDJpF8makBAKCITOPqdexyxgkA2cU1 KXe+2HS+wMGmPAR4l9qKXWBXXy/LWTEnJWDzsJcAoVqSL1E7tyZyorVS5rsV4PxFhbrGPPNPDH2 yTeVeFcSC8aChRRTY63bqZ2RPUyegW9R8gs6XrhaNCkfiVK1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084543_730744_53016678 
X-CRM114-Status: GOOD (  13.97  )
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

Instead of using a magic constant for bound checking, derive the numbers
from appropriate register defines.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 4dfe657957bf..eb348337454d 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -7,6 +7,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -21,19 +22,19 @@
 
 /* PWM registers and bits definitions */
 #define PWMCON			0x00
+#define PWMCON_CLKDIV			GENMASK(2, 0)
 #define PWMHDUR			0x04
 #define PWMLDUR			0x08
 #define PWMGDUR			0x0c
 #define PWMWAVENUM		0x28
 #define PWMDWIDTH		0x2c
+#define PWMDWIDTH_PERIOD		GENMASK(12, 0)
 #define PWM45DWIDTH_FIXUP	0x30
 #define PWMTHRES		0x30
 #define PWM45THRES_FIXUP	0x34
 #define PWM_CK_26M_SEL_V3	0x74
 #define PWM_CK_26M_SEL		0x210
 
-#define PWM_CLK_DIV_MAX		7
-
 struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
@@ -162,14 +163,14 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (!cnt_period)
 		return -EINVAL;
 
-	while (cnt_period > 8192) {
+	while (cnt_period - 1 > FIELD_MAX(PWMDWIDTH_PERIOD)) {
 		resolution *= 2;
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
 						   resolution);
 	}
 
-	if (clkdiv > PWM_CLK_DIV_MAX) {
+	if (clkdiv > FIELD_MAX(PWMCON_CLKDIV)) {
 		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
 		ret = -EINVAL;
 		goto out;
-- 
2.50.0



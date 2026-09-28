Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474F7CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=; b=jm86OvuF358qoOBLBhJtZZwUjD
	Lwi/OwjUNr1XfRpFdM11sOpeHWJUvXhu1rA9qOoJyHi2E6697bnFplblN2q+eBmBYA3aMzxPE8DtE
	tJJUvd14YQK19c3+ladYzB5xKwuTZqbMMYH02xNG0W91+iaPlLv/5gpzg95LSGAeMfZSD3dPvmIm/
	hZEmerDBQGf5zK3C4GO7CBxFPqIOkMrVxOzLs5Luq/Cm6Rd2wmC9udCVHTAZdecKzK359fdZhSZ9R
	KJF132szia0JknGjF7IBCpXMj/j/934A0v0iKh5mgj+q9AzQF+e6ab0OYf3K3OecuVFOf2UUoiPeY
	309JnveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEZ3-0000000159u-0O1P;
	Mon, 28 Sep 2026 16:50:53 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEZ1-0000000158o-0LxT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:50:52 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d8239so26668815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614249; x=1791219049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=VszlLdW3VyPVMw+9bSQmvli4lJVX4OVPys1cqKfanfltQhihD6Mm10mgsstoWDxI9H
         o/rNeYM4LCiAxADE8X1V2iibjIkt3zlatqlMnbll/8n2BAaPg14ErhtYmnm6QNeyxSMD
         SD21aS/LVhS5BZOFTXGzBf/fTGay8OG77wbKERoP0wedbc8ZumCTncRWG5p/lYGYBj0J
         QKttHBNmZva64h9cGCVhRoSrdrTyzRpHhzSi2BIDbKTyNUv3SwvUyVADkdaQvlj1iFa4
         FnZDr1UdsWQGKMuKnnWB5nC9CH7hvt2+n1YLJFVRgcrrqIrqcLT8aO+NVj2xgsUotJ7a
         Dmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614249; x=1791219049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=zrEEfetEsX8U+CgT5hfrcez3wjY8T6pfbG217VuR+i/JvCbPlUgRKohze3+ZDJlzO1
         uI8inzLBaGM3kLLRJYA0joXV0//24Z3uunmS+hIvA6xxLZe+Gg9RtvpHKPRjjQGpdM2k
         2CYxksaHeiIL9W/WjioZf4Ov2uN5YbqjHrbM8upUrK9cx+bPdzAslBq5xgpJkozRLMZu
         UgdOMKJUhlEOLlatdXqVEPdHRCW4PeuuqnNt6SZ4XrZrQnoI5txSDRnnipw+zMTBCZmT
         RtIgkJ3m6F5ZUit1lAX1IPBlCTninJfqL+FyCIl2COCSPh1iqTJGvtgkbv9SufNsUQqA
         FFcw==
X-Forwarded-Encrypted: i=1; AKwUvBylDOpSLXYCjPy+E9vvCViLT0ddZCcRjyxoi4uoWOJcxU1hr677ZAEoe3llsZcheANJ6fvIsfPfpelm7FahNDAx@lists.infradead.org
X-Gm-Message-State: AFuF++kaEkdZQl0TXLxL8RDNNDBuj+qPADhbWESutUuyccEOCjGWn3LM
	C0roD1eSfIgyczOyO4y9ujCleHdXGi4sMCiePxqxeTIvMnXxhBhc+Waj
X-Gm-Gg: AYBFou0nFi59VYPiLsoVLojTVMmqdtft52pXesjNfREJBiVVDkSF+9FM3zyWQl+XCsQ
	ABnOtEPw2Qhus8rzQeudoyYA5k21A/I0qdV+l39hRj6VpKy98nFqy7aAStPVHSMoT5Wq4jjrLgE
	pB5wlEunHEeGqGDRLHY7aex4xZIQsK7UOVTj+8OI76sqKOBs/WGci9ZcfFq4ia3vMEbmoIy5AQ0
	ZgaE0eVdgMQIx+8EQ6OAgtNPeigfY9A7vfezQTjBMJFZEa1wB16lbq++Mov2kdRyDifME3n/Zpp
	X8hmu0ug/U0ewnA539jt5p0iNJhlQtmM9snZBT54WTq/JDCoXkNyrXq2rWn6NB3SaxhfuKR+cv/
	McXZXuO3wM0Lzvd2YEIyc/xfZ6Hu8rTD4/nonD8F/4VSgv39I+HL5gNyb6MsXyt6XCWXLHb7udU
	UiS+vBZWvHow9gAynnhhE1f2M2XRaVD2nVJ0qay3bMlR8TZqjdXjEAf8GBwgM72RVvRwQROP7Gx
	znEDuRs
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fe7bab945mr244219495e9.17.1790614248631;
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm27538220f8f.35.2026.09.28.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Mon, 28 Sep 2026 19:50:45 +0300
Message-ID: <20260928165045.642354-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_095051_138270_506DE4DE 
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

The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
(amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
get_output_size() derives sizeimage from the raw width x height.

When the width is not a multiple of 32 the planes are too small for the
advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
The decoder writes past the buffer, and importing the capture dma-buf
into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
sound over a black screen. 1280x720 and 1920x1080 are not affected.

Size the planes from the aligned canvas the hardware actually uses.

Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
AddFB2 errors.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Michael Freidkin <freidkin@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -34,7 +34,7 @@
 
 static u32 get_output_size(u32 width, u32 height)
 {
-	return ALIGN(width * height, SZ_64K);
+	return ALIGN(ALIGN(width, 32) * ALIGN(height, 32), SZ_64K);
 }
 
 u32 amvdec_get_output_size(struct amvdec_session *sess)
--


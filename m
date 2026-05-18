Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BDFCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pC9TScL6CxIBlhr7Fs+T0Ee2cF3m9ksp0G13aaDD7mA=; b=1o+EyjuLhjtyk8dzfVQhmaeRLJ
	JfnDdqwXJBfeV8+UlevhiGDMUdyxinr1XOuLqmiVeS2gU+1ISdNU8AsjfmMGTqVkkUCjzwm9JkMfF
	XGj7Zgxw720GzUzaFOibEOcb9Z6Cs2lAtHZYvmtiMgniDK1fiAvl6khdN2UtBCHtJdc0Ds8sHBNul
	wSpaaC+pYzkUN20tduM6TLWIbgH83h0QNovgMfXI1D1UzgiYIZuDMAbleh1D1dbsXxkou0XNKVve6
	1Z9juQQIpBOc+xq/xIxywTb6msHjPs+M2autx0a52AWsZ1NpS1reNDX0PVWUYkoZZp9d4m3i1TACF
	ChJJL6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzMS-0000000G3eQ-00CS;
	Mon, 18 May 2026 14:54:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzMP-0000000G3d0-0g9E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:54:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso24781095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779116063; x=1779720863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC9TScL6CxIBlhr7Fs+T0Ee2cF3m9ksp0G13aaDD7mA=;
        b=guGHzgGuxKg2+cNn6KVSInJoTBAqPkEU6VwZ3tKgEcg80HTpkKO7lKrIN7lzaSFVZk
         nKY1cDQNZsvT+apIoOwtVfZp8SjU7BmRJKd9PCGv0Nw5J1WIL3Atba+DS770MDaoSKHC
         u2A32non+XZLeOSdrnYYNCVgerhRWi7/HeeRQbOcMib8rPK621Jbh8Gjpa5XvV+ROgAm
         YCfgKnac8gAspd8R/YLCSd0I65bURloaJBboPGCZQnrIGCd/LzOt/NVo/R3YfXXzyuhA
         ilVZUvRtR4U6Em40aofM6W2mRKTF/DHmvO78y1pM2JU7JFU8T+nR0YmfFqvJgQi7Jq3N
         wjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116063; x=1779720863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pC9TScL6CxIBlhr7Fs+T0Ee2cF3m9ksp0G13aaDD7mA=;
        b=Lv3tO83+mlpjRQso8z15I8nDMFk0E3ojmgtyF1IdKltZWWLL9+pwSBr/TLybE+iTga
         X2IlJXaiwOoBR8DetPL4wg9zFmud59IQXGG7scPFwzALyKcdUGehxVdH/1a7S6sXukmq
         3EyYBhyuNTyNouAra6WLp+beJbdr0U2T7V1fe3Mz5ROCCB2M3zKwNiHjUWFJjIfmFxy+
         M24vTTkQHvZ6GPy81vhIxOIAtiBNog5MYPXQUmmZgVTdbbCZBfeOcyazqSy+cSvDnQm/
         5xw5zuQlf+CWDa1797D01Crv8c7dzJ2y7hTPwWGysRBQ2BExnVeeRd0u/s7V90xWVXhn
         cylw==
X-Forwarded-Encrypted: i=1; AFNElJ8ebiyU/Z2iOjpsBiPDA14/PjY0FnmkoYvlely6KP45fhhphVPp2WkhY/VhZemE32gLM+/V7RrRy3C+a6YenOG/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk7BSZU+nzboJn+LO+vRZ68mQnfruw4uAp4Uk/aYOP6uNjanPh
	SEyDvigd68eO7GL403fs68kd3ewxHaHt0AOGD31SPD+XaST/vEvoz5k=
X-Gm-Gg: Acq92OFgfYCfeUVgqn+OjZaisiPr5OABljNTbYfpc9koUUcs3osZZgpDnUYi/vbvi4F
	6Pyk9/vXvDrvz+OBx7QuKqBFaFxl6AsboKl6oEy2GQFb46JB3167vlT/RfjFqXqkxPyzYzz74jp
	bSvbpf6Qzh+l0bLgm065BgBYxR855SmgZMuk8b20dH3edPD1jbB/UvMxNRoewRYKOMkvGCqZYIt
	MlfbesQdKom8IvinRu+YD8su6tKbPIXy4G8X9udwWcOKI0gt4rICAesAyxABG7Prh7/VqsOmu06
	bKMRQPaoJVP46yzZ00AdYDYzJ3i9Hl6tE7Rp7WaHYpso906K9zijL5q0W4VMHZZ0UmHGTk8BATE
	IlTJir/DwCTREaqApmbQZyhh2I3tNokocc5Oyx1W/9Q3+/sj3IF6bbtd1uRIERBn0QalU0c+Io8
	qLJb1fxh4fnUh6Fvpy9H5lq9krjfssGF2g27XBYIChBV35PDEvNzip+EX7q358HXmb7eWKgmepO
	QQWC85v+F4=
X-Received: by 2002:a05:600c:821b:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48fe6515831mr225383255e9.25.1779116062889;
        Mon, 18 May 2026 07:54:22 -0700 (PDT)
Received: from localhost.localdomain ([151.47.57.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm261061285e9.1.2026.05.18.07.54.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 07:54:22 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	nicolas.dufresne@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	stable@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rkvdec: fix PM runtime teardown ordering in remove
Date: Mon, 18 May 2026 16:54:14 +0200
Message-ID: <20260518145414.64514-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518105413.42147-1-pavone.lawyer@gmail.com>
References: <20260518105413.42147-1-pavone.lawyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_075425_220213_4F37E0CB 
X-CRM114-Status: GOOD (  14.48  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The current remove() path calls rkvdec_v4l2_cleanup() and
pm_runtime_disable() before pm_runtime_dont_use_autosuspend(), and
frees the empty IOMMU domain after that. With autosuspend still
armed when the domain goes away, the VDPU381 can be left in a dirty
state across module reload and suspend/resume cycles.

On RK3588 this surfaces as a VP9 inter-prediction bug: from the
second ALTREF frame onward, motion blocks decode with U=V=0 (BT.709
green), while intra and static blocks stay correct. Reordering the
teardown to dont_use_autosuspend() -> iommu_domain_free() ->
pm_runtime_disable() -> v4l2_cleanup() makes the symptom go away.

Tested on a Radxa Rock 5B+ (RK3588, 8 GB LPDDR5) with both the
libva-v4l2-request mpv pipeline and Chromium's V4L2 stateless
decoder. With the fix, 300 random pixel samples on VP9 Profile 0
clips at 1080p and 1440p match a libvpx software reference exactly
(worst delta 0). Without it, the same 1080p sample at frame 4,
pixel (960, 270) reads HW=(0,112,0) vs SW=(204,147,116). HEVC and
H.264 stateless decoding via mpv keep running on hardware with no
fallback.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
---
Changes in v2:
 - Add Cc: <stable@vger.kernel.org>; media-CI flagged that the
   Fixes: target (ff8c5622f9f7) is present in the 6.17, 6.18, 6.19
   and 7.0 stable branches, so the fix should reach them too.
   Link to v1: https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.com/
   Media-CI report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/100124849/artifacts/report.htm

 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 6f5f0422d317..bb95b090a25b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -2066,12 +2066,13 @@ static void rkvdec_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&rkvdec->watchdog_work);
 
-	rkvdec_v4l2_cleanup(rkvdec);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	if (rkvdec->empty_domain)
 		iommu_domain_free(rkvdec->empty_domain);
+
+	pm_runtime_disable(&pdev->dev);
+	rkvdec_v4l2_cleanup(rkvdec);
 }
 
 #ifdef CONFIG_PM
-- 
2.45.0



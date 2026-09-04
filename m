Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F67C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wZtWfz8k9yebmPOl53AMpbrmlWc8q0MMFm5Ljx0y4d0=; b=Fc0SgMEv3OGE8CaeJrLh9VGeqh
	B5BSwK9BvSN+TG6ikKJvqfSkOoUzD4HsZseiQXNSDU1/69VPxuvUFDgF+24DN2jf0RLb3TTwSPLgg
	DcgE62DgU/SAg50BAynfaRWPL3swwcTA36mFlGyRwbhJCuUMyo3sn2JslPGQtnmk5mCcGa5ZyoPFI
	tK7LJQ+tUvF6fNbG5p54WhpgUtw7q3AOuBIyrl2U38FtVhv1UzZiInr9SIiNYQc1jb265zLfHm1/t
	rVLDt2/TY9z90C69jdASXLvNGpZLQD5P/xr4YulyivhcCNMBs7UV3kJETohAlfC47NTspuTcs4rs4
	+EmdD/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rpu-00000001mzF-3DRa;
	Fri, 04 Sep 2026 11:11:58 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rps-00000001myN-07Ph
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:11:57 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6acc74fef22so394916eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520315; x=1789125115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZtWfz8k9yebmPOl53AMpbrmlWc8q0MMFm5Ljx0y4d0=;
        b=hE14q5WqC6ud4T5TH17MvrcpU8WYadBl2uSADS+E0OsMl4IgsU7A7/BLis5VbKFfKj
         gz92dyvvjyVT059ys5BGD0pA5X0ctrMQBhLLgxo03d7c0PLFk9CZsDuoHywnyNOPVAaU
         4nq7Z9ues7wFbDQysLNMTgHXQ5P/ARjMFcyFJdyEKFoMg6IJywsHQviGXzZgiaLE/usC
         3gBJ9VoJDKj67SbMjSPMz3vlLLo+Ynf37+GEqEHJs2RZ2MbBihqWcjWZNCyXxNuFpXRn
         +v6hX7co9Dp0uGS7MvlMEeSviQlq2DKxbqgTugFucyhjaZ/9yrCDoBw8Yl7AuaXDoFyI
         WjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520315; x=1789125115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZtWfz8k9yebmPOl53AMpbrmlWc8q0MMFm5Ljx0y4d0=;
        b=FQY6sPzlGFy2RS0FBH8ugTgk6WLeNcgFisiFj47Lq7TrsKMwpTN2wBX+8PrmMtHz5C
         v+2mjT/5zAM+zcQgnd52IinIXD3LqF+jRY+H7UY+RSI/Td7r7ZXa/wI5wCPH2W9O7Lae
         6zJZPMiZ2+zsRzFowg2ZVAaHqbFXGGV7rPzI7uidSmroStKeqlfRQOnsLgrjRROMK9H/
         vgUHMRzsV6Dh0LeX8+CV6rK2BovT6HeDQ+bxlhT/4LX+84QAz3WmyV9ggyp5Dv3NyM2P
         tomv3TU0L7+pJfHOFE9KrfQnnRXMmY0b25IIqqS9r1KrooIvPP6ErzVL/tsBP5rJoZPt
         baVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxm+VwbK9MQoKUs2O7OtE/yW5N3h30X5SEE8tL8xKNTFUmZzgTveoj4Dhon9P5NRCQj22XlE/0fWVf1tlfEcRm@lists.infradead.org
X-Gm-Message-State: AFuF++llk5WmBbFF3uBxBv0okhEYKG2ChXi8opnXvMow4Nrs3VRsXwwd
	uAJ/OpPJsx9V/rqrsklvs8oEC7oT5wb5rmmPXvwxIKccKFllE/k90heJ
X-Gm-Gg: AYBFou2GA3vL/XlsapQK4T07/EP61iTrHVNx4wV+9PDHTzHve6Q39aFaKhVoMafvHoU
	9v0V+Q7Z1l3gIwO/9qH0cUvAyu7kBJXmYqphjz3HeXwm4yG3TBhNXAqIVgE1ZJkTNEh4/tvLVtN
	9s7l0aB+joAym6g2tCplJCQKKDD2zvMM/kev5zkm/cXLWFi32dzkmvUgNvQFdlcN3aZVKuxdBjQ
	eRJiCShZIK2FsUnqjzfm3esBjv61FbL+Nw+knp4H+d1cScd5N5NYH9AMrkAo0n1tKHM2nqwaH7a
	0JlPvE1O9DXxdeMqHAxt64i6+2juEN59uOZzgFr+MtEx1uzByTL+QPQaXbOqVnTrpFaGaXio++V
	s8aQzaa7nacdA2EmPf/GczeHIrfwMu7CgKwpknI9pRvJlmQQLEhQjvz6OmwGEXnP1QMeVdYe6Q9
	U6vYKxFFKanZidCQgJ3Eu1wGk2rOnI6qU5T0rSUEYhjwZzI8NpyRFCcJ7XnF4rXMq8M0+PB2yM9
	DqyEOdAi30lncE=
X-Received: by 2002:a05:6820:188b:b0:6b7:46e9:96f9 with SMTP id 006d021491bc7-6b746e9a2e5mr1706058eaf.41.1788520315117;
        Fri, 04 Sep 2026 04:11:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm9779797c88.4.2026.09.04.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:11:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: fix typo "vaild" in comment
Date: Fri,  4 Sep 2026 16:41:46 +0530
Message-ID: <20260904111147.23677-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_041156_071021_B2A7E8E8 
X-CRM114-Status: GOOD (  12.01  )
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

Correct "vaild" to "valid", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index e92a4d872c41..c420e61b7610 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -32,7 +32,7 @@
 #define G2D_HW_MAJOR_VER		4
 #define G2D_HW_MINOR_VER		1
 
-/* vaild register range set from user: 0x0104 ~ 0x0880 */
+/* valid register range set from user: 0x0104 ~ 0x0880 */
 #define G2D_VALID_START			0x0104
 #define G2D_VALID_END			0x0880
 
-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72852CFD625
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Uu1H5BSD/8+NS93eqVir5v4iZ5eZ6Au8D2IPvaCZC4=; b=mW6hlKkUvZLOcp0cH8O4SWtXu4
	2arGRHx9hbTlQS7UNKbPY6qQZeaEBmbc0Lz1iR6dnCrkvy+Pi97/nL8cG8EcIaws6s+N2TUQ1roLK
	qeFzPe3IcuPB384BnTB3M3yUnysH3M9zRKRiFd1sJBrMxVwGO8YlvsiXMKOZEEgQ9nqfts41IlM56
	6GAgtrTYQIKiVKtIVIWuG163uLernVPE2TEnuJynbL7O7EDVkTgce0/maf6GW88sosls5l0h6++IR
	RSp+ZGeRqoxSa/4Nnvpl1Y07+pPvkpYYbE6ZqBb8PwzUvlhHYEL8GMOvGReDlo7sMLe2WMCWDOl4M
	O0vhyKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdT14-0000000Ew5B-0u46;
	Wed, 07 Jan 2026 12:51:58 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdT10-0000000Ew3C-2yHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:51:56 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so1097612f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767790313; x=1768395113; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Uu1H5BSD/8+NS93eqVir5v4iZ5eZ6Au8D2IPvaCZC4=;
        b=ciHILFmBLNuu4LGhq1iX1YPhwmbwR1mYPZJ7SGAQXR7lyv8nz0YYWaRwL3Ovk5GLFY
         spKcT9YL6x+VMGl/+knr7wY0jYxuXduuXeVTz7Op8ScmaJgYdt61DCcU6MZS7D9kvbSj
         0vgKfN7JQXixVAoiDlFcFG7DucKI/SMSkp669plPBRyLhDSsxViaV6m2uvcejP6eWffd
         1Pb7CpFFlB/1Q0FycxSydXTq6hP6Ou+qP9e8+D1xlzTAV8wNUqA7zhrMYpYRvuLwApwY
         6yn0ypxLTxZhIE7tXiKeMHBTGzPH3STUSFmSph9qW3jGQs0WYpwQ+swmyDJBbQVHjreR
         N3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790313; x=1768395113;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Uu1H5BSD/8+NS93eqVir5v4iZ5eZ6Au8D2IPvaCZC4=;
        b=Y9H0d8j0xLzeR7nmUHOeew/vuiX3zl/L10YO5KN+E1R/W2POGkBd1weja8CC8rnbEf
         QAzHiGy0Di5DjbKpR3SZxlmuQYu2QaqHWEDzJuLEUruTzGt+JJsO1piWSwTB+AW/kII4
         04qBM1XOZqFmYLtm+wsJQ+PJ/pcFsBjg/MvBWTfs9nshlAnGXsZT5D5RzqTIAspmYdLl
         e15mqaO8gXT4IXT0584A8scJcTL/bzuqRKoi6uJWRD8pNYDdp9B4geb40ofgg913eNr9
         LmrOOWN3v5gvpk0Ba0wwB3SMR4Iv/imjrXoPjaQTJZGcKrQtOPxT+jYoW8HBOCIKuD3b
         1cng==
X-Forwarded-Encrypted: i=1; AJvYcCXmZNXVvq8jIEVPvcrFhgZRDeDnycB1xQiRn2MkXpXJrde0kDl/VmEYKHCPDvodvoN+8wUb97khVJCV5pENmwYB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjt1U7a4waoxcxlO8UTdWRgqnzk2dKC/nbGUdk2qBWVrGTtAdW
	1j6JAK0PRuS57Moi919SABaXnnZWlj7Je8JazFMHw05d8cXoJDPmQMWfhKU47u7p2TQ=
X-Gm-Gg: AY/fxX4Cs3rMcTpFhqnGqt/dDDIh9JAMb6rvkdWN8FFu3NaZPsCE+hXpVxoDbo5jf8r
	bA1cySOEvWzGAGpJ84iinYhqqaBYaq4LSV2eCcy0TM8TImpRhVvoAUgfA9GwxR2JcNSUA2DjbJU
	xXx9IyxJz9TeSKaVQzesAo8XKEq8yrHpR4wQVbjrDaYEFgLNj8nwsB1NYGxY1bY372As6aUOQv8
	RSNer7/svNhyMYnNQkBrKYCtPl1IK/CFnZKXXNGng/VfZcPOsnaLQ7DZJCCW/53FXasGDyC7lK/
	S8j2Mt0flIwGIgSUl7okSbBRZiaB2CmsqWmHn6einNM6JZMJIZqOvmSk0Ag2chhsPJcedT31AuR
	beeeNw2GrxfCRaCpHtVJRFp86rMMKbIiAHot6z1Td7xiDWLEHfxzkb6HgaYzKT2oJQjDJKfMUZl
	I859EqOI295PR91GkgBBMgOgTDQF1FcFLDIEnKkK28fA==
X-Google-Smtp-Source: AGHT+IGtmy+rmCPoBaw4OXxfbS0cwSrvVmxx0w5l1Pkf23wV89pinoU5RtfWAgoq0o44R/EZc+4nJg==
X-Received: by 2002:a05:600c:3483:b0:471:1765:839c with SMTP id 5b1f17b1804b1-47d84b36a60mr25617005e9.20.1767790312777;
        Wed, 07 Jan 2026 04:51:52 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm96167505e9.13.2026.01.07.04.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:51:51 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 07 Jan 2026 12:51:47 +0000
Subject: [PATCH v2] scsi: ufs: exynos: call phy_notify_state() from hibern8
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-ufs-exynos-phy_notify_pmstate-v2-1-2b823a25208b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAONWXmkC/42Oyw6CMBQFf4V0bU1beYgr/8MQUukFbqJtbQuhI
 fy7FRduXc4szpyVeHAInlyylTiY0aPRCcQhI90o9QAUVWIimChYxU506j2FJWrjqR1jq03APrb
 26YMMQDsGtbrXhezKkqQN66DHZd+/NV928JpSJvzkiD4YF/cPM//Yf3Mzp5zmdZ6XqjoXQvHrA
 7V05mjcQJpt297ASvWI4AAAAA==
X-Change-ID: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, andre.draszik@linaro.org, willmcvicker@google.com, 
 tudor.ambarus@linaro.org, jyescas@google.com, 
 Bart Van Assche <bvanassche@acm.org>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2453;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=b6bGsRp96mSSDNnBG4wke+H2gJj/dTJWhM/CmWnrx8k=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpXlbmWHrRbxL0hbh/4m7jouBvvAK6X/XuMtcbx
 KhVs3PMJ+eJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaV5W5gAKCRDO6LjWAjRy
 ut9JEACG3J2/QCQXtSVwyR1VKL0SK3TpcZ8Z9VM0tjtPjrxGKYt5vTijVq/pHd7GZMQshzuuF4y
 dXtphkj4YY9plBcc+xKo2NmzefB4icaI2juenadwRc/Jgx1Ihd94fyAizKWoYHjHs7jtWRaKAXZ
 JR006DGeGdYlIScrn9ObqX2YYd5i1tms0OQP9QIIhEtmWx64MSw1OxqhyziftYKtqCKhv6zxdGV
 QuMEiMXyIBSKa+vSSPA3mok595CTmPFpCy04co/hkyB6JXW8VKMdkTeC8nCQ/GF98n5wX2UwiRR
 bcFjicTHDbHV0qhTUOub7vdAw1IsZ0cYBp9zIsdXd91QrBdvQUJoKRmXFepkJHmCXXRgUX5oqn1
 Va9CtgSk36Y9MG8zyk5YbwT8+XHbI4hxQBIJUsQga217FkCgNuu5P0HWr0hc7sxfLF+4PNGqHbA
 oDTfOTRJbpXf2sdMc/NzZnjvDa3jf4vtjIv7Ibu//yQnLf0EfdonAaejgGmgoSoMaLDYN6rRHuJ
 jjVjhENwgsEEH8GrrO4CgE4xc3g52RewQwCG+tsQbAEuW0IUI42Re3MLnYpRRgc4pUQgLBIis61
 MHGdE8sZ2bsB1jNc2mJdprEtYVGCnYV9yHBCp3A0qzjRB/iFvdg4djG4pPkmf+zamP+hjvVIOiC
 4XaqiwfEvXcF3og==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_045154_782462_BCD2A637 
X-CRM114-Status: GOOD (  12.98  )
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

Notify the ufs phy of the hibern8 link state so that it can program the
appropriate values.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Note 1: The phy_notify_state() API is part of v6.19-rc1 and onwards.
Note 2: I've added Barts Reviewed-by from v1. The API name and parameter
changed slightly during the phy subsystem review, but the intent is still
the same.
---
Changes in v2:
- Collect up tags
- Rebased onto next-20260106
- Update phy_notify_pmstate() to phy_notify_state()
- Link to v1: https://lore.kernel.org/r/20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org
---
 drivers/ufs/host/ufs-exynos.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 70d195179ebaa01f38331faaee6f8349211c4c3b..6da3d7ee744b92cfe1806fa654eb80a564ae65bb 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1568,12 +1568,17 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
+	union phy_notify phystate = {
+		.ufs_state = PHY_UFS_HIBERN8_EXIT
+	};
 
 	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_disable_auto_ctrl_hcc(ufs);
 		exynos_ufs_ungate_clks(ufs);
 
+		phy_notify_state(ufs->phy, phystate);
+
 		if (ufs->opts & EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER) {
 			static const unsigned int granularity_tbl[] = {
 				1, 4, 8, 16, 32, 100
@@ -1600,12 +1605,17 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+	union phy_notify phystate = {
+		.ufs_state = PHY_UFS_HIBERN8_ENTER
+	};
 
 	if (cmd == UIC_CMD_DME_HIBER_ENTER) {
 		ufs->entry_hibern8_t = ktime_get();
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_enable_auto_ctrl_hcc(ufs);
+
+		phy_notify_state(ufs->phy, phystate);
 	}
 }
 

---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>



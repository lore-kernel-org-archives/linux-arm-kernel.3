Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49160C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BveM5cMWSJ3TieKfU41UkYe+p2SvuBRd6rFqa8L96gE=; b=NG6mEmdRqA/y8YmlLo42ZCtPQL
	+iGgHOGqsuFfnRkJKSQcVoiSkhV9TMq/zdrIUTSdgisHIjSd+Bo8RQpX0UAu4Qck40HRX1Jn1/FnP
	8RDxmql5a/pOsGKVzxXBVNsK1MFjoC+k1D/8UXOhod2yyUHuEVddtcNLrl6x10eQhmNX8qw69ww9C
	xeTKtVetWoQyImIEf7IsDNmHKawbRnhrmtJr/50HPFdMUp7RuwE1XBnoUdPIf3eF+tkp4GF1YwmFC
	LYVOEKFD6yCF/fVnhJ5sP7DaG9tHcQ8qrdia+7lr1rIG+mkgSstGsjjBH2rzwTGnaqLrs0LobyaFu
	uNT3tSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsd62-00000009Cgm-1u1a;
	Sat, 08 Aug 2026 09:12:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsd5z-00000009CgL-3Pvs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:12:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso2842485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180319; x=1786785119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BveM5cMWSJ3TieKfU41UkYe+p2SvuBRd6rFqa8L96gE=;
        b=QZ9C6jj838z1Q7Yx3LkJfKmu28QdjtdaLUc6LJAeJCGgg3j09jYm3DrJiO89C64noq
         RVs/vw2NRsqq30RznDdrcrOGPcj3p/aDkyTZSNo9kBo+ZTnuW4+BA+GqP/mzybKGvLcP
         PeW0+PHUQvRPGAK3CKD8VLqHYzD6O8683qBRs9LBJwnMPuzhDwL3DpwRpy98nk0/warX
         CM0XnQVTdB2wI83q9lxjP9kcoBNuZPhjpYDSjKcyqUNYlHorViXlqanu/bBIrubRqXQe
         5fhzh7je7VkEg5NtVJunNikYAnoJNzYvVTPom7ELmMruwj5t9JCbXa26ZUqmOtD71qzU
         sPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180319; x=1786785119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BveM5cMWSJ3TieKfU41UkYe+p2SvuBRd6rFqa8L96gE=;
        b=lx1RrvFpzQuKVxBxDd3GDstIiI+2swDOMTECIi+uaTpRDDNaScFg/k4QGnol/VzCrF
         WlTKgJ85J2vmmpGz11Nm/Bk/THXS78dOOynu+ymiGmRuYgW7sU0KZxt90+fuPOPOftj/
         y2TItAzX1JH7HNHoOS9T6TAeGFYCVpcnCRnUMBfcmRN9F9vR0c6jHpSCBo8f0H+M/GWZ
         gD0VTTlhT/RNJFM6oTJGdMk1pR9GNhxbLW13ix6XxicwJwK/4iMBRTw/tpeJFYHZrji4
         Fmu/EF8596FLQep4AciIR1D2+HooX0r+ZX+WLCztR5lqemRvtiX5o82CbMv0vLavSgQ3
         P+kw==
X-Forwarded-Encrypted: i=1; AHgh+RqtEulQ33QkTkVg73W6hO7aYlXTtP8wMnLplTsx4eIGqPmA9QbzEg2LzwmUvqJmDmtlPzsWcXBrvQWqacSkbvSR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyxx/2iLo/4tUjMYsatUj5GDpMwglmv6QG+clrKGXbjKT2nJbk
	NhRPm8LqOvvLxmhvlQpseUSGoRD6QgGuymhVbCvhOMitVgszM7uDCy7n
X-Gm-Gg: AR+sD12QfU4szs9iJXI1I0jID2ZSbK9Z95r+XmSfjDus6fDfwYBK1hqsnOaf1CHb9D/
	h90nOZ+fzy16M/ug+qPbMAVQqv0z9O4yk8gVBRbtlImmGTiu5BKe/ZTCRW+2X+zrKDfygjapwpo
	vCva7qYdFWejGlwvSI5dWmJp870qm7Uhx5LvHF3hC54cTrBJY+I0iFkJ1Zejj5CCnw1wFoPIUZk
	+88dkwyaABeLgmpSlaF/RctRv2kEBhU7uLr/IYW4ulLysfNXFevKUB4cME53/I5F0LOakWi7tKL
	xwseIFTaNe3UHCxpLCdgkPfxudU/iPVd3F+ScxZsvKeiFs7Aa3muFT5u84+f7ngIeaM/Wct/z7t
	Ikg+SA4SX4G0eN0YUwADr7IHfTofIawMF/mV7fE07I7H751PzsX8GyesXtcWKq0Rpc9TGJxat42
	gI8/ONUX7xM4xgfbsbx9B+hDONK1L1lfyEgjgTyIKcjrQAFI4LsZemkyZvrSNExDkjrgPzTtPie
	cHykw==
X-Received: by 2002:a17:902:f709:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2d2a8458b93mr88228315ad.4.1786180318914;
        Sat, 08 Aug 2026 02:11:58 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde308sm17126060eec.20.2026.08.08.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:11:58 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: sun4i-csi: fix async connection leak when notifier registration fails
Date: Sat,  8 Aug 2026 16:11:51 +0700
Message-Id: <20260808091151.2691482-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_021159_854788_1227A343 
X-CRM114-Status: GOOD (  14.24  )
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

sun4i_csi_notifier_init() adds a v4l2_async_connection to the notifier's
waiting list with v4l2_async_nf_add_fwnode_remote(). If the subsequent
v4l2_async_nf_register() then fails, probe jumps to err_unregister_media,
which never calls v4l2_async_nf_cleanup(). The core does not free the
waiting list on a failed registration, so the async connection is leaked.

Add an err_clean_notifier label that cleans up the notifier on the
registration-failure path, matching the teardown done in
sun4i_csi_remove(). The notifier-init failure path adds nothing to the
notifier and continues to skip the cleanup.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..a8db851ab5a5 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -255,13 +255,15 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret) {
 		dev_err(csi->dev, "Couldn't register our notifier.\n");
-		goto err_unregister_media;
+		goto err_clean_notifier;
 	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
+err_clean_notifier:
+	v4l2_async_nf_cleanup(&csi->notifier);
 err_unregister_media:
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
-- 
2.25.1



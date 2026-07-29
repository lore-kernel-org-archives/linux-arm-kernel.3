Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2CDC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 02:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3vGTZ+9cBJHUjmSn73Xe4evmb/1PkSIQ94tual6z3w=; b=PyZbAkpBT0w7KragAgmm2ssERP
	efKGgfLpxIYDoWW4N84A7Ltxa+kWsVSqKMKYhZwDl3YIAeGaG0dm79wSE/OgHB2aKYESBA/7P2mCb
	2ScnWlHB4NEB81W/E0CTA7B0ACivykGJUQluPuSMS462xmA+i714w/2zOxj9wYFKdGw4869eVJSe5
	Ix0m7TOG+bbX8FZ4/NnUM0i4bnLhT4KkahfoI/GTjoSPgG9sKMG9phHYm6iTxpdVoRhOsPtFHNx6g
	kVEYakh+Mmc1t3I1ta1t/AruVE2JUVehJZYAYdQ/fKy+JbDPPprAvzcuj+diJ3OksiSUvXl+ilGV0
	D9Cqt5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotsg-00000006gja-3ExD;
	Wed, 29 Jul 2026 02:18:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotse-00000006giw-1U91
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 02:18:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ceaf8a1265so5678245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 19:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785291527; x=1785896327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3vGTZ+9cBJHUjmSn73Xe4evmb/1PkSIQ94tual6z3w=;
        b=PHF5EG3CdjSPCoW7cLTNWEtD/p9hAri+RfXPtsLS29vaNQaC+aAY6wuYelX6gRYDeC
         e3LRkXxi1eSafX8FE2aVDwCBLIfxJdBTvnvyWeeeXvp3iFx/JslDqDufiDoyW7H0delW
         PFAtkC5NEwbiczZ0E1smaOflFwt/T/XprrjAZi1PoSLHhEJzMeNqXZbwgRbcqVxGF9Hb
         4WSNz/FtYqe/gGayHkaE7lW7jE3dMb6YDDLDD5bKUm6A4LhKUkeoKX3PoXbj99rn6jG/
         VA+RrMipuUs0p8xkY6XzTeCUB28qwEAPRCwiNMXd2kvhJ2cIQZS9K4sVZKHPccFiaDUW
         x40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785291527; x=1785896327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3vGTZ+9cBJHUjmSn73Xe4evmb/1PkSIQ94tual6z3w=;
        b=mMrAw1MBEKOOPouJxzVThOM3lbRgd5mwUVNs4H90MlD7GrSLcKlGlQBxFRr+23MWNW
         Z7sB50l8VHx9TgNratDuLKEEwxcMBtaswG0NCZkdwbXlzspC41agXIcO6HmrlW9XlCRl
         ozgPrskWmcpJlTJVS1xM49wueTbBRV9ZmWbwlQjQXjQVhnL6OXS3XkH03vRzzdcvftBD
         OZS2QzDFj42pnRNaT7Fp19xEJHf2EdVvBiLi8iod4Qq/7WG9O3ycCuDEqmQFmURgNCWn
         N+RfKX9TQH7teYRF0PbW1XF+4SdxOrmQFDk8eLmiCvUpF/WYSpQcwK5Y8Po8eEuE/dHC
         hguQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFPaH/90VNVjBJugL6I5c/kcQqz4oUxb9GI/6TyBUuYFV6UJNhQrg8GLYLxHxqC8S1J6kekuw+YKS95wczRPlM@lists.infradead.org
X-Gm-Message-State: AOJu0YzSpwET7VC+yr3sQXugSTzLIG8itUrAJEnf1aDhDv9ULjKkxsUL
	7Z8DaYTF6c/wNnP1SsmL/b1H1Er/JTk9a5vZk5MADy5h/TJY/Y2B7x8=
X-Gm-Gg: AR+sD103Cbo6/vZAR/A05OIxHc3D53R9cI3Vd5WXahLkNkg4gPYViFlq55WxrUPam9A
	zU+QazqU7rYwfgE+uJWTLPU6CQxzwj2NuetrzFKYuKXg36fWRp8g7n95EE3oNXhr/zJOn8dyERY
	uhv3IEAyD+RiWy3f7uUUFN48h2FleAWyNnh2KpE7/ECJW1W0E6QrVwkDVxScOjY5w6bVAVAWh8P
	2iNSnj20hrIrIe5Ucr61Uf3DiZtZZEW2hTeM2wi21ZaP1LdqC/b7GMxVqyIFuFDtS0nYix7KWWy
	tq+q1usau6X+goRakTTAvxguOH9B34mvdOlUcfponhOrTNJaNon/cEZx3dMiq1WVHMgcR2HlM2s
	RceKwP8v7M2ojOrBO75rM9IhRVFAEM7DgZnWKPxurPLhzzGqsI0TTIjI4ffE/dX7x4v8SduHQR+
	eBvoliWTCxQOmo70fwZGdQjAwIqfBAgxkqSunTHw6IaCC0ZV0iFXFKMhlqFzYK5wlv3xzswuWdf
	XrSeaRcz0hGoRtbd+DigfPHZA8ldhc+sG1vT2OKnaJjXEajplgkP2RPIapf0ICDaL+lRMPLCIh1
	dUyyoDauxflZ5ogq0pTwO/2cnXXpN2KnSg==
X-Received: by 2002:a17:903:1905:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2d015c0fcacmr52704555ad.18.1785291527425;
        Tue, 28 Jul 2026 19:18:47 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a46774sm3848685ad.27.2026.07.28.19.18.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 19:18:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] media: stm32: csi: unregister async notifier on cleanup
Date: Wed, 29 Jul 2026 11:18:34 +0900
Message-ID: <20260729021834.50550-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_191848_428611_082227D9 
X-CRM114-Status: GOOD (  13.30  )
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

stm32_csi_parse_dt() registers the async notifier before probe finishes.
If a later operation fails, the error path only cleans up the notifier's
connections.  It does not unregister the notifier, leaving its entry on
the global notifier list after the devm-allocated csidev is freed.

The remove path has the same problem.  A later async operation can then
walk the stale notifier entry and access freed memory.

Unregister the notifier before cleaning up its resources on both paths.

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1059,6 +1059,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&csidev->notifier);
 	v4l2_async_nf_cleanup(&csidev->notifier);
 	return ret;
 }
@@ -1068,6 +1069,8 @@ static void stm32_csi_remove(struct platform_device *pdev)
 	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
 
+	v4l2_async_nf_unregister(&csidev->notifier);
+	v4l2_async_nf_cleanup(&csidev->notifier);
 	v4l2_async_unregister_subdev(&csidev->sd);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1


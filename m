Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE3BCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 03:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vaUdEu4koPIKyGQFeZFD5bATRmYQBh/annrTgOkgSHA=; b=f3uX4hEU/c7uEKTfDFCtvqdxrx
	wlYnOwcq8CKKU/5sZcdi6LqtcVh0vZMgDGkdLAhu0b11diEM35Q6VbMyQU21RUPqZYiavotb06exS
	RKzbgTTzrpNd1ItwSHfGN7UP5T2/897s3PGluNhV00QJNMnmc6KgZTJ+joCcxLkiPsSBiW76GFuXQ
	v5Oydi09WTCVkQ71BCp/tOE2jSwGgNtQo5ohYb+GyQtr7jxQ1Xc7DnANkM2zUzoGh5AVlB/LtVYar
	Eg2EJT8ctkBYMJyQElqBr1wgQZpRw8DIzR6V1R5wYK/RaYPrXQe6lbzsL/qWd8Ob+TFVbSeMCV+lU
	UqWbALZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFkeg-00000008h6b-2iDf;
	Sun, 11 Oct 2026 03:55:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFkee-00000008h6E-0mGF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 03:55:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so7573855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 20:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791690918; x=1792295718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vaUdEu4koPIKyGQFeZFD5bATRmYQBh/annrTgOkgSHA=;
        b=bYEYZrC5+e+M1Z1Z1ZrpY7G9kchITMxMpGt43q9UrqGogfXQDiamH7YHLHsRLvDbzO
         1IARPfNTBzfoifVS90WcDzxQkhuCHmMggu74mRWiaUKw+RlMJb7frrGEs8+YBQsCmq5f
         at4xve/cchqqlje1IOky9Q7o5syPD1G4R9/3EnmhM8NOtLchfMPbk0CwGxagdaCAqEJb
         KEkxhOyE4uHi9jINjwlcvl00zBM1Qif+Z8AM+C9iyIWK5h1Muw1iYa+Zl0XTc21m8FNa
         a2PleFrCrv+0i4owElxOAovSc4NLVPh7/zA7z6e1S1rISiMHIqc8CiU7bMdQruiOBOh+
         BrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791690918; x=1792295718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaUdEu4koPIKyGQFeZFD5bATRmYQBh/annrTgOkgSHA=;
        b=d2Z0CAODwXjCDTSm2ETchfyJzsQCB7+9iDdP+p8tp5OWHuU2GcD33Sv0c0qU7OcSxK
         nx65kuG5SkfA9S3Klo6Iy+9mmyyPY8Kxz37VYaduMdiiPuVsPCCDCyJFEPgxCkppVS7D
         ZMdbCqqcXcKE+peUtE/eTDYa6egQhyNaB7bGE6XEld2+tJL6l4LB3FQjv2ynf+/2O+Rn
         0gLll7S+9jouRcW7bto0xOqlO87R4d94k85qS94v0ailSpKGkN/5gNKkcSgZvCEfvyYS
         /L/7aNv2H9/RwSGNDZmGlKDEkHLBrQyxNLg7JLKOR4yTCkFErXdMmFiqUvc9CAjJQoL3
         3ZIw==
X-Forwarded-Encrypted: i=1; AKwUvBwU8Egd/Wx711PnzKSu4Vtqfr3NDS008yCQdcNEarJ0pcYUl7pLxh16CA7f1Zk6VK1uDMAHzv+l2kjTeW1S+RwN@lists.infradead.org
X-Gm-Message-State: AFq9FYKBwVrHCPgQNOlMAEBObfN5+HrljXhLc9d8Ds/pvKhV0lJWvvld
	kDHzSy1qSppMu7u2Kz2mGwzFgoXNO3OK0lEGGs5byq0DCREMCy8pLAeXTNxJ+EuS1lM=
X-Gm-Gg: AYBFou0aRmqWSrQXlKtpSBP9lER8HrEgEU2u35mH3+qqTAivrBoIh00F/Vo2qIt1Xsz
	cFk3565b6T2d+3hMKCsr/ZC93rLVwM4YGmw4A9YtUwPzImC6MBkAclL4aBQpPtiF8I/dm7JtdJ2
	xi95ULpJOGN9Kla56m/6Ko6juD4jA/3l8aBe3srJ+tb5iau7tKZZiaT5hxXKL20BnsYcSArBVxB
	XWhKVSBM5OPX9ed5Qdhwi9f3KLx67YECxe3DlsepZXNf6Yw2EVan3QfD2JuPzZtU1ifl2FGbC5K
	j8gHwvnPSvEqeV3wWiO/8s3snCJseY8GGaqpF4CKJG8Duc6nukpQr4N0Z558UyQCo9NshReHdAd
	pyXPMZme+hpPwWNliL2eiO4E0n7aTCMEItGRz5qljftZhQrynGfi7sNf+/Me0/FbwTbbMOHO0qT
	vEdz/9JlPW30tS0gNE0/oDQsMObLYmh/fG/+XFX2+yOm0gFD8VID41HPJTGSMShXtCMFLMTFtrl
	AoQSfQRjhll/H3UaBlQWao=
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a18e49d9f5mr108349205e9.9.1791690917510;
        Sat, 10 Oct 2026 20:55:17 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:e952:dc8f:95c1:823c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm202624345e9.10.2026.10.10.20.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:55:15 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] ASoC: stm32: spdifrx: fix synchronization state check
Date: Sun, 11 Oct 2026 06:54:59 +0300
Message-ID: <20261011035459.2289403-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_205520_245990_4DE95DC7 
X-CRM114-Status: GOOD (  13.91  )
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

The interrupt handler uses a logical AND to check whether SPDIFRX
was in the SYNC state before clearing errors. Since both SYNC (1)
and ENABLE (3) are nonzero, this also treats ENABLE as SYNC (and
any other non-zero value that might be added).

The logical && basically just converts this to check for != 0.

So errors occurring while SPDIFRX is enabled cause the driver
to retry synch instead of disconnecting the PCM stream.

Fix is to change the logical && to equality (==) and only retry
when exactly in sync state.

Fixes: 0c93c291321f2 ("ASoC: stm32: spdifrx: retry synchronization in sync state")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 0ece547407739..88863dbd05d9b 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -720,7 +720,7 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 
 	if (err) {
 		regmap_read(spdifrx->regmap, STM32_SPDIFRX_CR, &cr);
-		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) &&
+		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) ==
 			     SPDIFRX_SPDIFEN_SYNC;
 
 		/* SPDIFRX is in STATE_STOP. Disable SPDIFRX to clear errors */

base-commit: 611680f6050a66b84e5cc0af33862a83d1f7a200
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA83C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EMc4l7y/58xan7GJe/6NBJgIUEQeEH6NdAFiW8A4ij0=; b=xj7Vj2ldtmbw/lygXsKtCZGGhY
	+8CDGbWBmTgR8SReDF6X3IIgnt/Mqi38GkzVGQNkteQ/E607qbj3mh38J8C7p9azJ4enhiqRY4he0
	mlRpJgwvgoyI935kSI1eFgihVwgBADYy/wMVATaNwJ5NEcDAf/ttUJZM0eLIuDReGeXwUHU9720B0
	X0jiEHOUpUw3SyofbeD0eLv4xju9DuskDd3oPwqLxi0PLHfhcJ6yj52jJKGkLFlKrgvLDi00iGeK0
	275hLXG2DCT+dbsUBgwfeAmzGT40E5f1csZB3LNSV7kDHXyxSN94rMoEJ/3JSgDsCP/M+5BcRSmk8
	QixmfDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWVY-0000000Gpk2-0WyM;
	Tue, 30 Jun 2026 11:20:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWVV-0000000Gpir-2TGA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:20:03 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c8deb37737dso1461209a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 04:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782818401; x=1783423201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMc4l7y/58xan7GJe/6NBJgIUEQeEH6NdAFiW8A4ij0=;
        b=hKonQR2LtkpyCI3zkCAra9HtYWW2RypA923es94jBLCuXdlN8fwOXPFw7+iEb/d77U
         o+4r/TsECDJ5N2x1Sfm6mxf3DsWkRNl3hqx64bd2j5ZVfSDk50OhjdQlS4PBFj3jv3Ol
         JgC0gSuknV/rnKrHdZvHLTSXp/KSKmxiKs8vSgPhbgfmNO8VVUpOFeSUTK7E5WpE+Brq
         EJ5z1DFSS/8EKL3xXx9rob0LMjnSRU8+k/txqTmQzqx2K14uz2VIHgLVTjqz7crmCIBR
         b2lGWsO80EGPyJRb+MzfzTMPBcYQbiUYxYvFOJJJQlVGo2gia3wcTm0mx4Q/iuaCzBtE
         Rf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818401; x=1783423201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMc4l7y/58xan7GJe/6NBJgIUEQeEH6NdAFiW8A4ij0=;
        b=IamfU1rwdYYHU4Do0K4DztZFtcSFGjplTzq9MX6A+jT0bDH4CvZ3qjq1HIpmbfKh0z
         gmKG8oZn0PSQll6dTB+By4FyNkTf7GnbZ3S51WpcfsnKXiH96Sd/deSUF23DYRHvykUN
         gAUxumDEZ6A3jX8f+45oxvkZe1wCMIIVqcouP72YlAos5nSip8wDa7ylR6teeku3Mqnd
         qo6eeESRMeg6BO5N92OsczCXxuFthHxo5AhRc+iKCEO8wmc7V01Ya6e9E58VsA5Rxe8d
         3VxxYT5jhH1ryghwT2fciERTF78AaxVrouYq1mJmacdpze9aNQaOd0xBLARO0pRzRrp7
         5DNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yiYDzqW4lBmvtsKsgF5UlpPDZX+QafLZjx9sXo9jz6pnZbtYP3AXvzqn/qjN+lgEBpZK4mhIPtURXf9TsqvrW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0m3CLVt9bN0Go98FRLqPBBmy3Y18QO4vL0CmTIFkOXhOakwxs
	9G85laTYp3v53OWhGWLzo+k2SgEv7usjRR5rZiBybnrHk0TsNS8aAXhA
X-Gm-Gg: AfdE7clA//VS+oB/ipW4cmzw4yUOW9LQdSAwJAQ6/0rBqJKFIP8WfFflSKsIh6mlICE
	vIDe70fGTUXiw3lfbXMZi1vJwQPJtZN3UG1X8vgXE29lw1Jj+T0C+G5bdHmko87A7/woKXLfQqi
	OQFhd+dmCe4OT69wkonMkaOCwAPv9vx555rGUeLGRfJnIcfESRrpx9DVthJbpuYMSPznECynFdY
	msRUVi1UsZ+RThArlItuC8Xg4cKtuamXMu7HhQjMUPaVzoGJ72T3VRPoHF6OxjgsQJrNyTFao4x
	q9VTlVaN9CiLMitnVJD3owWFEbQgF7S/QsrwD7cgRoZmmZ7vHZV9HrTgBGRi3jR5PMWQVWag9GJ
	HiiEbD9qrpf73+JREBJw1XBCs2lx4PA253loDCJlakNnoSdYeHOdCdvIcdPoRI4r+OPPsA5PLnz
	/91+VCE0fA66fGknXU2FQTjr+gqGQAw/ytXeJtnh2Weq5IQQc=
X-Received: by 2002:a05:6a20:4304:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3bfc50563efmr2667483637.12.1782818400587;
        Tue, 30 Jun 2026 04:20:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95a3e7sm1323781a12.19.2026.06.30.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:20:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] i2c: mt7621: Use dev_err_probe() for clock acquisition failures
Date: Tue, 30 Jun 2026 18:19:42 +0700
Message-ID: <20260630111942.559932-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_042001_634280_6B70E226 
X-CRM114-Status: GOOD (  10.62  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when devm_clk_get_enabled() fails. This correctly
handles -EPROBE_DEFER while simplifying the error handling.

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

update in v2 : 
 Add the missing return after dev_err_probe().
 
 
 drivers/i2c/busses/i2c-mt7621.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..8ab7a304a02c 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -280,10 +280,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "Failed to enable clock\n");
-		return PTR_ERR(i2c->clk);
-	}
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+				     "Failed to enable clock\n");
 
 	i2c->dev = &pdev->dev;
 
-- 
2.43.0



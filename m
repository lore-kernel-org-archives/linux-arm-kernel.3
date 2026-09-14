Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E1AC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fc4eltycEplIA/0aLYJ4l4ExpzLKApvTuVgrIn6Z/9o=; b=05OMpKIhL4XlWETaNzsQfhxEvd
	afb0MYiPyVoTFM/z22gD4n23nXHtxMEut5+/3Dk1zdcUUUpBKMEoGT1LIjuj2X2zy4bXi4vSyOc76
	+pUxOXD3ZFdp0os4BZAIgewERwlJVKUjgl3ntytr0F2/cfIBlxbQE5hJ79TBttlwByJ4aIfLBv4dM
	4HPR1KcYQZ0uMDAY72qmjSVepLDZ0M+KEfkOwlmZSSUrrhHIKazoWcxhDgF1wM5qdCbdYtBDeyizv
	JHuSU6hC5kF1ccDascXtCCNcHsR2F8LROXHc35cGj1G4bEjF/HsO4k+Mc2Pwij6fv5bDm2cxB4UQm
	MPZ5I4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66kQ-00000003m2R-1SfO;
	Mon, 14 Sep 2026 13:29:26 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66kN-00000003m0O-3qzV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:29:25 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so1615567b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392563; x=1789997363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fc4eltycEplIA/0aLYJ4l4ExpzLKApvTuVgrIn6Z/9o=;
        b=h5dpSX9S66NtumbV+1zBJZ5z1rlTNZSC7hdGxNk8p1DMidV8QxCllE6oaLHTS+oeUl
         oU/zvUrMMmH0pl47cNA87CAz7zaqGsyjw6GpUVyk9wN6u23tYLnOLQM9zNRzdXOTQmsu
         duDHZSkR1BJAbcixPsJmQ5mvQ8QPpceqm9jF2U6hTcr5CFpYT0mdWEf+U0XqS4jW6sLk
         e3lbB9VcGG9erm85g2W3DhvGasv5Z2Gnw30UZEHCrwUsoHQVcA5V1L0RTfQxLzVL2MYB
         ASxdConcuTtOeJnSJt5Ajm0OmDIoCw216T/Mu+XpBEN3gdZ9TQ/60hD91jaFjch3D/U9
         JRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392563; x=1789997363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc4eltycEplIA/0aLYJ4l4ExpzLKApvTuVgrIn6Z/9o=;
        b=cPU3CPtzRZGN8KQI+q+qvK2/QjXvoXjAyVkm7LB+5xyWdjZh6k8FUE52rkipd7ZKk3
         1DLD0dCiMquxHpDAhHbHRyrrkWxVxC2QyugssigfarRAHx1+ITDiHcJvQzUBs9+WfojH
         NKVq+y12SWgIE25pHWZ3WeSo88AqhIJJUjM420as+ovJnZugaXQsKqToG5b6p5NRvCYv
         6gyKXP2qaif+3uz+4n/WcaE4SxYxcnxHWFHqSdFMuxzeJAk9FP/OXbT5g1FhZab3x3IK
         L/jS67OD+hrUseYP3ga6Sy9xtjjxdrOUnHRGWvQg0yWPSsCo07fGn1MHcSjzH/8js+Ls
         rZsg==
X-Forwarded-Encrypted: i=1; AKwUvBw9r8GXfE0u7B5nBrLVDwnDP7+BtvfkmD3rZru8NE+S/baUXb6SPoUfkPG6zNBO8EG0OdwOdNu6w/kub7NVqy0i@lists.infradead.org
X-Gm-Message-State: AFuF++no8oB0v5RpSw9JWCgrjh57cMvW4y+st00CaTL0XCbf7dGlT0rS
	BA+xsfvAqq1y7EHgqkblCTX0yhvd5/xMBHO33YzAnC4pame1RHvkVLuR
X-Gm-Gg: AYBFou00UK6VNtGEc9G6FaZp9X/f/yCzQwHnQF10zSrQWktxBhF6LjYV+PRodwrZV75
	eY0i6rI+Yl8VrgApARrxWOwYWkCmtd9yBxsCrFZXNzev1mLOKJ8e+emCtqewbCwEVeM/gRBjuDN
	ybl2VUrvLAIVspovO93XPLxe4mRi1EYPJPkzZPDc19kxoT/lsy9hMQd/iunJyVFI3y8h8Kd4ogE
	mohecH0wTdXcrMB9oLezJjQsYUSDg39AyaD+kC8XCW1IW1ZGVrgROwDUq8QTKWiE1yAE2CfA59z
	d7mH0lsKcqYWDc9aBm2TV6Y1G5ryyQBXhGqb1Mm/XJPkV1IHKzMb2k6SBNsvJ3iSV7ZZssWyseu
	2cXmP0ugcluZkQVM3lDnwUZWWzFQWTyUOpMzju/Cn0jr6OfIVV/tdH6zf/T82APj82yM5Nn9swv
	CFdXWTIi8aljxSjBVOA3sNvBVbwPwBguqkl8k+YCOpxQBxlXV55W97kuyHkV52tutTvSznuupRy
	oD+FzxKQPKI8GPE
X-Received: by 2002:a05:6a00:f08:b0:86c:bf42:fa44 with SMTP id d2e1a72fcca58-86f83543227mr5924981b3a.6.1789392562587;
        Mon, 14 Sep 2026 06:29:22 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a6bbec8sm4597643b3a.60.2026.09.14.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:29:21 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Valentin Caron <valentin.caron@foss.st.com>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: stm32: fix clock leak on pinctrl probe failure
Date: Mon, 14 Sep 2026 20:29:14 +0700
Message-Id: <20260914132914.2371788-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062924_000389_7EA1E805 
X-CRM114-Status: GOOD (  11.85  )
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

stm32_rtc_probe() enables rtc_ck/pclk early and unwinds them through
the err: label on every later failure -- except a failing
devm_pinctrl_register_and_init() or pinctrl_enable(), which both
return directly, leaking both clocks. -EPROBE_DEFER is a routine
outcome from pinctrl lookups during boot, so each deferred retry
leaks another reference.

Route both through the existing err: label, matching every other
post-enable failure path in this function.

Fixes: 16ad2bc09efb ("rtc: stm32: add pinctrl and pinmux interfaces")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-stm32.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d4ebf3eb54aa..e7a942f6c190 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1175,12 +1175,16 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	stm32_rtc_clean_outs(rtc);
 
 	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+		goto err;
+	}
 
 	ret = pinctrl_enable(pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+		goto err;
+	}
 
 	/*
 	 * If INITS flag is reset (calendar year field set to 0x00), calendar
-- 
2.25.1



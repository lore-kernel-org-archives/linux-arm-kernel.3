Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A462CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=; b=O9rWVSGrOiIGIesdqwS36TM+9+
	LWIxCeyBk+ED4+XF5ru6uBjtFqgLvTHEmljbhNwwkw68aJsvuu1pAKyZ6f5G29QtJ18hwXRHed5LK
	jphMj4Npwv63j0QTNb6Zbug5ZoQ+Bb6Z6Y8QQATypTqTUExKbo4Dcu7KVm+rq1TUctXj72Ijswhac
	KWpsc/KVpUWYPwC26nYne9rvIQYrcZt0gtorE9FrW0fyfmv00Ec/X86RFPWPmAe3UNtJtw7LIXQj8
	TYmvkIlDv240XmELAAFGyS300cayKh/ZLO3LkKYcFuW0uYtp9/b8ILXQYNsjDUw64CruojHcrHeWE
	wsLD8lQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT05-00000002y8g-0QkV;
	Tue, 19 May 2026 22:33:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPT00-00000002y2K-2FtO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:33:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43fe608cb92so2587630f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229994; x=1779834794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=;
        b=ikaNCtpuFMZc/2Q+BUtvIGKdtSt/sE0NYtz84krslUFBoeNP9SDgvZFEL75aIbx0mc
         ehzdtqfTLKSo0OtxME1TVSTe7mm0P++rxgQ2pbLb0lFmpbX5gMoizeNFVT4EQWN9vn9A
         A3djALA0i9baOPyapSS7dDw0PpPveIBOCvtYQbUxgdGQfWoHmhw12ANIBtorB1qBix6v
         2QMXx8igF7x+44OEbKJNWV7hL5ukrKCwv2qtpbzOR6H4jxWvmAC13qrLfFduCdbgn/+S
         fM/wvb5DXHmq1V6UIdJASqib8KVKTRSTblKPVT+ozFY0dORGB35gi+dKK4BVQmnU6BRA
         A3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229994; x=1779834794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNDI0lLPNRldsjOACKAWSwRc2mbScMYD4jMMM2OXl2o=;
        b=BOrHxs2aP0enC/1fZNJBo5C0JpsiAiZyILeqGIdqWphzxUOewkWhk7mJsKSo7IhFS5
         4QBu0p4PEoRRVDAXW7GjNKkjajyV3OCVMmZp7I1nk7tBhzU0pTYgfY6T2Hk+TpWuyxA5
         J7YMiu6CSr/AxzJSbn0SCgVKpaw0th845prH1sTDoyG4od8i0FcUYz5kX5L6xFiVz/be
         bWUn3SMzU+fCTOvUrNT9+6Kz87OdPhSOq/7L8k7UL9BI608h0QZpQVRLfwsZ2iISfuFL
         RGIWQHnQc+4dTF2wxdGRpV0i/QZIXx+cRiekK5ghL3BsEEPFpXupaCKcj6ZGiUNXJ08u
         6esA==
X-Forwarded-Encrypted: i=1; AFNElJ9N3U6Aq+JIhA5/OiZkcMTm5zOpjIQYVkrgqAF11Zvyt6b1v5859TJnfYkycBbc0oXG8fbG8h0WCSEPPtYLGtXv@lists.infradead.org
X-Gm-Message-State: AOJu0YztfCdGOvTVR0I/xV2td9AJzXGfzSqxPYBs8LgYv9g2F00ijnld
	DYI9ie8+J0NM7dfWhGqORyiSgGH6O3WIS1NIgrBJSw2UJ4VcWs3taEv/
X-Gm-Gg: Acq92OGLAw6rPn8g9hzHqTCRjz7vgdXoNVErrq9waUuatiX03pjWj4V7uwRSddSoJl3
	zd1cZB0fOZkTQZI6EdZ9x2mh3C5Wor1PFAjBshKukPDcaBYELJR3scfDegwbq8jn/CZhCMVmYaM
	AdO4gFVA8R7vdX2fRdfHpeJ4WS1OTTIBFfBJ9q2dyH+TL3cXwW8+NMHQd9YvLiEU+k0Qycb63mS
	JuUOvaz1/vcTV+mZO/OvMtPE4X/fOMfgHrQo1DiBZ/vIZNhgNmbbiT7g5y8sjYyRpVKZDFTunqT
	Rh4oJOcTw7ADnylP88Og+9el0SCkJdBtpqu436tzM0Fp2U/CMGgqztCMbdrgD5wlOIGdb7aEaJs
	8vbBrgpOm0tpQyG9VAwee5hKdI4HHklZs0+5ESoYHEeeVpkIAK6Ilk13PU1Om8zI/9jxzRNUtm6
	R8Ms915peXOWent7mFgA0zY1sMFStWb1NgZ6U6xT8MXhk9PeBRvV3/8jNi+PDZMtacU+8InT47I
	f5gX1i5vQ==
X-Received: by 2002:a05:600c:310f:b0:48f:d346:e646 with SMTP id 5b1f17b1804b1-48fe60d5693mr310445495e9.10.1779229994584;
        Tue, 19 May 2026 15:33:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 5/5] i2c: mt7621: make device reset optional
Date: Wed, 20 May 2026 00:32:47 +0200
Message-ID: <20260519223253.1093-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153316_617257_96062A81 
X-CRM114-Status: GOOD (  13.49  )
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

Airoha SoC that makes use of the same Mediatek I2C driver/logic doesn't
have reset line for I2C so use optional device_reset variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 3cde43c57a2b..fb9d9701bb10 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -91,7 +91,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	u32 reg;
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = device_reset_optional(i2c->adap.dev.parent);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
-- 
2.53.0



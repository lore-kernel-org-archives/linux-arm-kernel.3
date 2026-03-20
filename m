Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F2B1093187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=; b=swog3Cr4ECqfEghMt/GNb2gNWB
	mtW89rlBuw+k2hiB3DM6Ec+ospAjTr8P6qnimdhJfnDE0LwuCY18H41w9zU96nDyECKu9tJ8L/Oa4
	FUWkPUtU+mECLZ4EfkXptB9NdVOiBqnylDVKn88DPNXm4L9ezFHbuLnMKOg82aY+BnChykK6YfkDh
	nhcZF3nG9ll/CDVhcDmMIyGwFnwVKhOUTREPj9SzlMMc36H5/4svDYSVRt+gy/wwszqyDHIoH/Jpb
	Ql1hvLcmHYvLi6DBFadEkvPNd/QmAMw/IE9NTV05jfYOv8J7d7j8eODSYribYJz1W4Ugzi1zoQDz9
	NfwB1c6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHI-0000000CMFT-0wdi;
	Fri, 20 Mar 2026 08:32:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHF-0000000CMEN-3kbW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:32:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82c2239140aso5392b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995537; x=1774600337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=;
        b=bG8Xrf0Fib6X1XsyLjbd2DWcxvxprbG9r6jYrUHkyC15w3GrKFc7goSWWOz3tZ+Cmo
         d0nAKbbbz6q/3oMPaXx7XWhNDQQndKaIIzmm1oIsec0tcCSRbpx6y9r8Xn9zcZaLeL3Y
         IV9zpEytA9OqO0ryr93WDFskecCC9tIhIfaDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995537; x=1774600337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLEs0e2qJIlqfw8fHUZzPP3Wzmar5tmvZs6TyzNUS+A=;
        b=pSEssQMYGx4l27Kg4Wcr3tq8doyhYemTyqIFuxds7c59Nyj1AQ6hvrbnaezLGLHDUf
         5ZLE2ceym1RoUl2mrnGllYxVlcoil9CxgucymaLkLKQOTNUdig06Q2A91i57P4nWvUnw
         cLNWf8fvMg4TFEjkJHBRNfC7IR8IWOmrVV0AkVKdNMQpJsg4vGpUrXiErecKWEJwbLlK
         XTOR/0dW7ccRsXcpL+vJ9Se3OKIu1R8FFnuhg6dA9X7yVBU3/DSafEQTF8TQPT83idCM
         x/85VHb/w5d8+HN45x2fcU54Uws+myQSWCU9oTLrzchyQLDJ0WVrCPphrECvaMW1Kf56
         rLfg==
X-Forwarded-Encrypted: i=1; AJvYcCWcDcZZrQk1OoTDysoM0/TmwfiGCyj4CWGFteA4svn9MTYqulWnj5yAawrMX0iW/cjrgZaTxhVtHs3e0WYbHunR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5qXIpFjYRLpgIrvAsmyngNcC6r7/PQaPiG/CDMd8nHwLNHUWp
	zBJfTVpW0kdRDtUGg/7J8bMqzXS1wjc6fXg78gA/TLIB5vcFWJhNznyv3HzyMd1NQQ==
X-Gm-Gg: ATEYQzyitCB8Uask32E8ldYDpMw7rp6EPgPVKee8PO1SuVN5ZgZkWhhNheiMTmPxXuu
	PdOLvotOp2hdwPh6BMTr1BIknn6eGEX7KRVPWfLXFo0ifoC1yb91o9X7yYTPI3zlaUb61A6wbWw
	8r0SEWN80l1n7CQxthnwQbLxZHEuA9kkLX74e0vvtXHwp+xBc4fy3eRZIP7ovQkz7f5bo6rfoXT
	2FeguOo+Qxm+vYp64OjY0oNXnUGMxSnRXL4A9UJ0jJSwa7VpmwlZoVg668Ld4byILiqnhxEpu3A
	TQYuFktEAlizyf1vIfrsct47lem2PrzgLGAfOcP/xV5h1OZpMPjv+VcaSgRK/HfndALDxkNlfVK
	nKiohIWjNImgfvcobvS8a7BZBiNkkPpeRKBy72Ro6p8BsXc521PKQ5NdlSEP8uI0Uo+ZSGo8lN7
	8KbXpIGjyJkYtkuTDvSmzP0b1T5Z4xQS6HIeqArK7JyyLDjtgcpVRFF9tkhqwRSaVx5JypR0VNh
	4X05qqJIpz2+UucDOI=
X-Received: by 2002:a05:6a00:1a89:b0:829:9fa3:5c8b with SMTP id d2e1a72fcca58-82a8c3b91fdmr1755152b3a.55.1773995536642;
        Fri, 20 Mar 2026 01:32:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 0/2] regulator: cros-ec: cleanup and add supplies
Date: Fri, 20 Mar 2026 16:31:31 +0800
Message-ID: <20260320083135.2455444-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_013217_923579_6403DB3E 
X-CRM114-Status: GOOD (  13.40  )
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

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the regulators
exposed by the ChromeOS Embedded Controller.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: cros-ec: Add regulator supply
  regulator: cros-ec: Add regulator supply

 .../bindings/regulator/google,cros-ec-regulator.yaml          | 4 ++++
 drivers/regulator/cros-ec-regulator.c                         | 1 +
 2 files changed, 5 insertions(+)

-- 
2.53.0.959.g497ff81fa9-goog



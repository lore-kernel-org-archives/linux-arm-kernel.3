Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B6F109318D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=; b=euBcI8VsRKQyHv6Gj+IOlX+LWl
	7rcfznsdzKMyaAcv8WaD24d2Z7C3joE9Wjuid4WjqGoFiiXe/D9mxoA3KEIJnWM10e4416ySXAmJS
	OMOis8jWRoQuFGo/ryXltiBABikyjlR/3aLM0NITDMSftoL4eudOoUrBuDZIMrqkHj4wOSoRIM07D
	Wxdd+r2a6hqrafK/HN+/Zx388PkglISMyVPYIugnjAncKoo4h0v7x/N0S20Q24d9+Kzf05plUzpou
	7JWd9KUtO5mxfoD9TGA/MGFl9inDQC+4jYTK9tywBQUSAiq8HWuA/IamlBPK7hsV/zrKyE8lvlt+Y
	gdCMoQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHM-0000000CMJ0-3IPq;
	Fri, 20 Mar 2026 08:32:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHI-0000000CMG0-3b3G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:32:21 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1125201b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995540; x=1774600340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=;
        b=F/Vn5vp4qTnFYj3HVEAdcxgLOk2TYuWvT39oGhYf2nf7YBhy0sDWFoYjcnmrFJakYZ
         8EWNlJPwDzNW+NjrbVmPSU2kGc/wuKKoDjy8UsKhmG5spemXDyQYVlZLvOmztT7lnEUs
         Y3hmTE/vUB4MPMRAi/3QHkwrVXTAV/piCr6Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995540; x=1774600340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=;
        b=W2mBatUaCGDPG9M5E3Yd6nS8Lvv1AmcXoOauT4id569uoiRRU7VJ0OIz1gjUhn7JQp
         48Y0MOzizjcQrMAI1nZxvLf68WKLFhR/2YGFkWlRhJZ/Hq7oPAK4DPl00ZUe6YU+MWKp
         LxHWCsmqbthtrg3g0HmR9txOKzDfQ3cprbDRG6m7Mwp9byzsb61vCcLhl/fTG+4DpxnG
         gmdm13u7lVD8BmKiZwSKJboKf1SuElVhi/D3n6OTY6ukJCTRBJlaqQYfSrHeLlfoxdni
         nKxNF8cboXegBzQ7X2bHP9e4vfbjfv673trWjBXODf5N+OkJ6iH5qeJt3MTzO2SINVvk
         U6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaOteJT9vZLM6gJdCBfJhbgc8lPm5ujPfP9iD17NdfZ9i7iVAgVAXMg6UxLAFItW04VfNuSHbwDiEunHtlMHEh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbl+TF9mRmQTt7r9ObxystNwnRq6BFJFKIZYOIsCAwwmR4US+M
	XzKrjyc5WkLvNXj1OGZjCuQGtEzWPT9arY/oq2VNrA8kf/dqkGS1qEYD1pjV7KB/YQ==
X-Gm-Gg: ATEYQzzPZdIL0VgJvJ183kT0kTdUwmApGmD4euyIJT6oB5SDBAFA9aFXjL9yCbUWhm2
	EDY2TrCQMNinrXtfO/fa+UJBoy9Twxm30q5L/hbMdddxo4RkdR0P032irLcyi22TThcNOevgBx0
	lvcm+qYW3slpcocanMsWAOpkV5i5Lk4cayz+w1BuAKsj7TvGyFAUtwVl/aEELyXyot6mVPOoC3m
	Rbe8Uh5KJgfMK7WadGtqPuEx7tpaIWGok4QABtvi2jsOqhvfVzb8KWzp0h4ZywqdUUTTHVjc19/
	kOLJwzCRJbb9gNmHt806tLq+tkF+lwdHDn/w1IErr1nUmJG24XVIe5rlcrVU5nTALLgbDuGP5Ol
	w3NNQlgSf8Bz0AFWTsCXPj/Zl83taXV2U4v95PL9vH6ZqlLT3kCl8ueNCTDWumdztMLaFcW05mg
	2qEm3BiQHpoM2a8lTlN3VzXyYmisA84L4WYawtwdS6zINxI4CLDtp2w70NAeL9rOVMLGCaiFk3l
	boQSy3i
X-Received: by 2002:a05:6a00:299b:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82a8c35c866mr1756086b3a.32.1773995540176;
        Fri, 20 Mar 2026 01:32:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:19 -0700 (PDT)
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
Subject: [PATCH 1/2] regulator: dt-bindings: cros-ec: Add regulator supply
Date: Fri, 20 Mar 2026 16:31:32 +0800
Message-ID: <20260320083135.2455444-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320083135.2455444-1-wenst@chromium.org>
References: <20260320083135.2455444-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_013220_900275_5D7043AD 
X-CRM114-Status: GOOD (  11.12  )
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

Even a regulator remotely controlled by the EC will have a power supply
input.

Add a property to describe the power supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/google,cros-ec-regulator.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
index 5a6491a81fda..c2bafbc1e9e1 100644
--- a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
@@ -24,6 +24,9 @@ properties:
     maxItems: 1
     description: Identifier for the voltage regulator to ChromeOS EC.
 
+  vin-supply:
+    description: Input supply phandle
+
 required:
   - compatible
   - reg
@@ -48,6 +51,7 @@ examples:
                 regulator-min-microvolt = <1800000>;
                 regulator-max-microvolt = <3300000>;
                 reg = <0>;
+                vin-supply = <&pp4200_s5>;
             };
         };
     };
-- 
2.53.0.959.g497ff81fa9-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8993D69115
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S42PGEHBHY2kpBVY5qDRZG4XP5aA8pMSU6efiWvXnew=; b=2vTd5xbst5K6c6z8CAfcV2F72+
	QSWs8mS3DsA2g0oO6zKkAHFlD7e/aD8HtSfYanUdDwevtonJGCkREjxGnygJnJC0fEAH6BNRIoFkP
	NGerFB0Lrv8evdi9lefYMG773wN4FG/AqGuwwQ/h1WhPilzTtoGxYM3xqkkzMgDTqwAcc9zTa5CUL
	p5Tb9VkCGxI9dChKin42J81ErdUfSLQMTEppmrG4yNmJpYtED1Eifo4UvYhuCtRXLQ9yWERNE3RxF
	kdTrdmL5b4EpkuSMcBD4+xk1UriWAFvyuRUl8+1hZ45Bnvaoa5wnS2n22qqEFrDX+UM4z45DlzNyS
	gDvdZlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgLH-0000000FsDT-3XUL;
	Thu, 28 Nov 2024 15:22:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgGB-0000000Fr5Q-3sjx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434a742481aso8265695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807010; x=1733411810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S42PGEHBHY2kpBVY5qDRZG4XP5aA8pMSU6efiWvXnew=;
        b=hGPm03txaM3qp5tjZhMMMRUHIdwFofVM+JsKrPK/uIJW42ygXPO8xHLF4YwYKiQCof
         kSNlGKKqjkgnaRSUnxcmDxYlZOPU3Od/sPyr8i5PVMXCDa7TirJXCwWKH2s8AtPW39e2
         G9fZmZFOmKc0FIWqLk0YaGkfAukv4KuHzaqw7SfRjqE/XWytQlg3kM0FjLXInq9ZDlwL
         PiqD7qDCZdXaw33o5WyfgoQ6qsPz2onTykyNFO0LrFlwbgfUkuwl99wyfhgyf+hOZSSD
         ALff7xLVblM4GOmQEUCv11YjD6yvJtLfbTdnjds9ct7rOm8RWqoZK3a0ZPvJe+wMX/II
         56lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807010; x=1733411810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S42PGEHBHY2kpBVY5qDRZG4XP5aA8pMSU6efiWvXnew=;
        b=e+7sdkzVDfaemhLH1D6d1levYzoOiZSyHlyVNm/63s7qIaSwMeH30IdAjeiYTqXGBn
         weVq5c+eKPYe/RIs1fzzjsmhcZM5xBLg84BDSTf2v5CgZZ8U4gPGawwho9Tr33Jov29J
         jqhjkikMMlxP7iZzmFqc6ozypM+gwzKb5NrcURfse5gMdkZe4I2NlYwYUBP1FBB51ODs
         zVnrpL2osiKrNP02xKLzasiQEuduFHqSOenh7WIWaFsZXfniFnSSKDHZgyWY+rLeTYqr
         z52Bco+UUsXOBSAOx6PL4HMefZ2ofakCMu5BM0y0S49CQNplAEZPKPj9YtHgVyppbU7R
         wyCA==
X-Forwarded-Encrypted: i=1; AJvYcCUgSz/X0oLAukJRuNVh4MM7iKfMLzrb/ANMsIaWHxQD3wnBVX1G3JN1ldROKc9ubDEd2Ikz0Wgrm5XGOTumizmu@lists.infradead.org
X-Gm-Message-State: AOJu0YwW+dbcBJL276SzGD2GGmxsxIyYvUCQV6iOiIFnAmUgHbmoIx1M
	4WK7YO6y/JgyTJV/kLd2FR1HTR/yiUZWi4EqV4e8Mw1aeNZf5m1uKT3JSdXDuz8=
X-Gm-Gg: ASbGncsOL8OhUQDwiDfo1BY4NhauIQtfVKrbfpXxkWIalRXemRl6IZOsR/MCRor76QO
	Fy53TnDCr89nnhNNAqSNFIumH8fPAbyf586JjkUUY2LkjoHgh9s+gKQZTFhtBbjAPWzpkdNynbW
	tdnmAFMG4OfsQIb7PO+XcaWESfVaLOvH7M72+BVCdhYQRioAkFDcGdoC2xEQczdeJRmmgX+2PBi
	p7Yc6kSgtD/jN5GITJWLHU3H8Oj7W6wCR06WrVkotI/4CSImfbgr/nQzaeElHrecRLCLBk=
X-Google-Smtp-Source: AGHT+IGXMYu48cPlDHDHNCoxhqcYpYyTwMeAPAwgUmvro+k2EYbKaSdnX+mDxj6JuEry5M6D4bK2CA==
X-Received: by 2002:a05:600c:3146:b0:434:9fac:b158 with SMTP id 5b1f17b1804b1-434a9dbbc0bmr59715305e9.1.1732807010027;
        Thu, 28 Nov 2024 07:16:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:43 +0100
Subject: [PATCH v4 3/5] dt-bindings: mmc: controller: remove '|' when not
 needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-3-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ctm1v2XGG+ucVjPxKUudaikXrk6rMN3i6qsDbqS9Y/Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIlcJoLSEYYm5MQW4xLgZnBP3eyGyvSOl/0RZ/9K
 JJyjN+qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJXAAKCRB33NvayMhJ0TLaEA
 CH9I1Fa8qcZ3MWsgMhStJ0f/PPSyNF3vE8CX4dw/J/iF5BymCoCST2eaL3P3SsspJmCQBSU/GbYxRj
 osLZTWfI3J+EDSUOn+HdBdMXs2rYhYq5bHboXwtxFm1iEN7VTQNNOx7Fnaud9YZ3aGTIv6ION4fueg
 Sf4RzG6+sJwrAEIO40zuPr1buajpoO6hJtY4miAwwmjf7kW9B4u7GPv2X79yt3g0m8wFSRgaYn53aD
 lMAHw3kvclnOqYcB+YFbMUPKZee3WO00M04oIiFL7wYq124TUo5pL7o5rKjw2yMx9jHLLRdDTBs8Qe
 eXlNvggZc75XwfmnZNnnInKvrV3iEKqYdhQOqnnLgb87N7BT7GEsqHjQJAiEPecUnRGUtl5frhEhUe
 TPttFVP8KaD6wJ6uf2W0J8hPCLAhyMx3pH9ib6qY++XZHCSAThoxixtSMngbGEOuDuamG1jQqTv8jC
 evJPfaU7uk4kYkU6bjB8iZADcLJfHgz0zUxFLzcdJAPpJ6yWbYNf7X1DylnBjkhpr7+JythyuK3CSJ
 EhoVlvkReBXAuyz2dFzUEi3E3JBOYwzuXx3U0V0BljQ1s8EVBIz38l6P6ZjBL9bc/uZDnisOtFDRsY
 p4H3Llh0+QOUwqjyflnJvR+Sf3NdMV2cRWu4mjtqZKmE7QJ8n32BoU1vkuHQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071651_962998_0110ECAD 
X-CRM114-Status: GOOD (  13.52  )
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

Adding "|" is used to keep the description format, remove it when
not needed after the split into mmc-controller.yaml and
mmc-controller-common.yaml files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 6 +++---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index d8297af578049b2bf71cf6e06f45aac1e42bde56..9a72354397591d9648e80806c2f93797abdc70a0 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -9,14 +9,14 @@ title: MMC Controller & Slots Common Properties
 maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
 
-description: |
+description:
   These properties are common to multiple MMC host controllers and the
   possible slots or ports for multi-slot controllers.
 
 properties:
   "#address-cells":
     const: 1
-    description: |
+    description:
       The cell is the SDIO function number if a function subnode is used.
 
   "#size-cells":
@@ -321,7 +321,7 @@ patternProperties:
 
     properties:
       compatible:
-        description: |
+        description:
           Name of SDIO function following generic names recommended
           practice
 
diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 99c01ce318d3e5aa914ed9b1b71e620538eef29b..9d7a1298c455434a0848dac32cbe77eb8f71c065 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -9,7 +9,7 @@ title: MMC Controller Common Properties
 maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
 
-description: |
+description:
   These properties are common to multiple MMC host controllers. Any host
   that requires the respective functionality should implement them using
   these definitions.

-- 
2.34.1



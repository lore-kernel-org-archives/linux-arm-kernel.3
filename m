Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D08C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=; b=c1LYnAibEUGhJoKejsyaluOP9h
	UtiUA5X+QGBpBBQgmZKKAt7niC22PiiYjGboUzz++X4uZFxXUk41fDRfreZmmYJaimgFzPxLpefMV
	m/Szc0ULUOW1RwqdS8ELxKjKt7UJ99vw+Rd6ngA7nK5fulpClvupBXO8ulyD7aO18kU5frC+BVm1Z
	0vvkN9lar7Y0vUjbKXpcLyKkVvS+iWqHi+g45H4XGar9oy0iOnqtwqAe6Fvao2b16Y5UEjCD8HQDi
	AVevJBG025ynymJ4aTi0LaTqDwc7gek1kFu5xRVsuagdTChz+TxV03dPSiaUzEoQYj365nTwpfDf0
	ivD1+rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHPr-00000005Zjx-0kJl;
	Mon, 16 Jun 2025 21:30:55 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHHa-00000005Yqf-2mr3;
	Mon, 16 Jun 2025 21:22:23 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-70e75f30452so30782917b3.2;
        Mon, 16 Jun 2025 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750108941; x=1750713741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=Z0I5k65M3urmNLwuMxpoKvL+mR1SvSAVTeEQvdY1ygvDLVApGQ6r5vSA3v78sHPfch
         j20zDUwOLEqnnH+D4cKf/PjPRBC+tjQEbxlxQUjljgQhwfs4EMAejs06n/5Cdcw3M3Qc
         mY/KHJ/rXlZn1WOlxdtYpp9HxMnsafMkIcclUEizCS8c+2hwzCFgmqGSCf0D2EDjPrjh
         gUbfQfbhxFGKtKG1WwhiErSubf++GuAuXxvIu6t/PBjwMLcRBJhOO572mZzEZY74oKRm
         ZKTdJykrgrDWOzn8YyTAo4MOHsL27K7gceUqHri5ncMQjuuOHfbXSKhisMrm3H3EuvQP
         2wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108941; x=1750713741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=cnyfj6cnnJOXRtbklLxg31zwOHrudPwXruj8yCdC9hj7mUcPbkFiajTr/b7QHAGrMO
         ROLIFRAbQj3rmted3IEVJ9wEHo0+C5jCjhARytj9wNSwGlzlj07B5QLR4/SkPeyN1lMe
         Ivxg10ngS6QQg7PTQ+Qqx6v9P3EHyKFPUpH1yI2p8gJzzh3e92cB9yXll3ULxYgMoIlb
         ud4XHaLvcG40FSF5HxZRcB5BH2T4SUrcz2V5SFujbBR7dB/2TfiA+EK3XUwl3cm74WOh
         6pr2H3/fHeuNEzAdgUoOrw2EyFrr+UHlHs8TDxH/pl5JPu7NBRzBAoZUfwJt9TCuAA5R
         18oA==
X-Forwarded-Encrypted: i=1; AJvYcCV3jQ1rmXt4049OJ85WrqTbWv1YFxgujSirO8H7i6m50pkNVxAY4UIPc2byYhEb5RhTnHi5io06d84YB9wZVuA=@lists.infradead.org, AJvYcCWq+cDWzhdhQo2gYXRxGxL8DcDj3JMCFOl1PvOhNluBtPts0i7TJ4if1qNm5NXcX57xRy/ctdypVNbIpNom2/P2@lists.infradead.org
X-Gm-Message-State: AOJu0YxwxZrerbtxv+fadftg31/ZCoJ5nOaday+xm05coHqywF+1+Ua1
	m/1Cpf+nHw/wpchnirnTyjsUoAOgiQLXd2YGv0BW2Ffgz9/ZSFChuX3z
X-Gm-Gg: ASbGncvnUY57reMk8wvkjN/20BsBKDXLaVFNfHypj2gQ6/AFiqztUOrtQ2ec//k/zX9
	U6SQNpI3thTMW0RmrxMV1dmfFh1zapZ25d+55ZtK6ACShlkiBtHLHbqY1FR/lgXbyo2ZtixkmuH
	I4wrwUZbYo+Qux7Q4JWInqo0AVafh1banrGJRV8wAHx6evIu/4LHhHQ7qGQocHpTSKIACes3/6t
	2a9/Q3i2acdR5kmEF0DW3Doxm6KJ8Esuuc8wMfJ4RwpsCFjtH/WdwOs3TflE00aO0GgLQzfme8T
	EuokS2c9TaZ2X4ysUH2psHTxjOm3JHINmd55+Q7Mw0HEouNHbQFEdKKAn5eqXaOWT5IZEGw=
X-Google-Smtp-Source: AGHT+IHrTtKrQOUmpqpsbAy9Nyl4AZw8O0q3D6eTzQWBBmEHWN83LKSepZAj9afOX0UlwItAjwq80w==
X-Received: by 2002:a05:690c:4b12:b0:70f:87c5:5270 with SMTP id 00721157ae682-7117544ca15mr151939017b3.19.1750108941650;
        Mon, 16 Jun 2025 14:22:21 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7117bc177d3sm10418837b3.44.2025.06.16.14.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:22:21 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Mon, 16 Jun 2025 17:22:13 -0400
Message-Id: <20250616212214.139585-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616212214.139585-1-inindev@gmail.com>
References: <20250616212214.139585-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_142222_705841_8CA93A9E 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 59b69c4741c5..10de9b7bdfcc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -295,6 +295,12 @@ properties:
               - friendlyarm,nanopi-r4s-enterprise
           - const: rockchip,rk3399
 
+      - description: FriendlyElec NanoPi M5 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-m5
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi R5 series boards
         items:
           - enum:
-- 
2.39.5



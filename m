Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68757C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYGM0h7RhBS79sRo31i/Eh5uWT+nxNBuyvsqtZ/CclU=; b=aLfLg92ml3H2ZOfxjxR7uRdG3f
	A54AwAxPxkntucIAPAKtpQsXx2yAc7rRU4oxNLyo7INVMph1NjLdC4XLY6duPRqDUzlPsfil37es8
	b432PPBQEeZmqmNKlJura4Lwigzi9+FEo0W0YyDQZYT/11DS67JRjojXp8fTBOlwu+BnpEg5rVL5O
	CpRE4uCHCnyEyy0cCaHlyA3XMvpyf1EkiQdkm7upm+kxAp9/ODM1Uj9QAmL1lxQpZonUbuoXqsdDJ
	U9LrlvnMxIfII+NVf4/tB8rSHnsag01mfd3B+UIDt5UGbnIwYeNOGEBtjNXTRat6Ewnwkhj0wz9n+
	7+dbbe/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qNY-00000007bQC-3FWo;
	Wed, 16 Apr 2025 00:11:48 +0000
Received: from mail-pj1-f48.google.com ([209.85.216.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qEN-00000007ZdV-1vF2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:02:20 +0000
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso158778a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761738; x=1745366538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYGM0h7RhBS79sRo31i/Eh5uWT+nxNBuyvsqtZ/CclU=;
        b=E3wA1bFbd70rf+4LftKqhrLfNI3I8U+zKGPBBXSF4j5tPzzezFun1pAwUwNgQg4XOf
         SQYe5LtYv0GpweGWI3OHq9DwaFaEcaCzR45x7qyjamL2VLlFy06TmM+KLVS1ksYx+KHr
         tcRkSrsWytTXIh8e8VU3upXI2eHHqUF6wNK/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761738; x=1745366538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYGM0h7RhBS79sRo31i/Eh5uWT+nxNBuyvsqtZ/CclU=;
        b=CEat6rdkbgBLKlCsDSY3Ji9Tu1y3Ik1buNA1oLlccpoUzyWrkc5uPwDdVVFzlNhK9x
         SMCc2D3LRrRo7+JtTQ+6Niqg+81SIKlRwmMVZaMahQoHvk+FJB4HRo9yXq2i9Z8Re6Tq
         JuBxXeKgiH02bm54KAUfCDE/V5mSezSUfSKNto2thRuQ27HMvik7lxTcqYqY9v+rE090
         5JXw21pXxZhcjnFy+mqQz+dI9IoQXFyX597iS3kTaj2JTnB7Ex6dy2OzA/tAvbKz+UPy
         rl4Y6OW6yDKgQeqLWR+zo0lO0/bLqocy/uMpxaMX1EBE7yAt07v3GirTCS+LdQiJk6WS
         hXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVtA4WAuhe5DMS+dmBe/S/KRhxfcviBtT8EgQ+U5+kMDJHZDNSG8dK85rn7B5QYoaJDmk+8rBm6o0StB3bOEQn@lists.infradead.org
X-Gm-Message-State: AOJu0Yylb6SkN9l1X8/9G3lyrZNmSWZFsmPzuTKvXoHRai+0KE6NR7KE
	9PnML6IQkyMkZ1AU72wXXTSXDl2wwS1hdPpKt2HI1MYbBBDiEISRx1ibGdUxJg==
X-Gm-Gg: ASbGncvqYNY6fHGGWnAQ0CUHB+6ms4bXQ9u5HiQm99LMvmhl1PS4RRV3FgBsyTSy8ij
	xzS81rX/KEkNAIUDSQxZxYHRS0zFdtIUHubZgIRBEifcND3n+9yE070+mWIahVNUD9OJsIha+rG
	lZcGoiCsRv38uMKv7w1vMfRBEX9shAZd4lkujyDpcAe53ExqtnZJ5imKOLuS59B/4oA64mdRcZs
	WXiQKJXDzWb4g1+ryOXAlOAvYi6Owc+13ougvwzA9hXtuSp733s5hBW0ppF65KP+Gws9xWB7QHh
	NNYIXycGa4cnyLJTQ3PnF6dTYFmza8WmsTjFXpzxw490q+FgFvbzq72iMOAFllG5xOeV+6tBQJl
	mPQ==
X-Google-Smtp-Source: AGHT+IEOM8kY/Swx09k+WNyJ/f38PKBMBA/O7hhf0bPsaN2iBD0xvwXHaD7iBXxxmNY494s22DK7cg==
X-Received: by 2002:a17:90b:2e41:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-3085dfaceecmr2050851a91.12.1744761738388;
        Tue, 15 Apr 2025 17:02:18 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c33fe4de0sm1234335ad.212.2025.04.15.17.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:17 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/7] dt-bindings: Move google,cros-ec-typec binding to usb
Date: Tue, 15 Apr 2025 17:02:04 -0700
Message-ID: <20250416000208.3568635-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_170219_497299_A3E13CA9 
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

This binding is about USB type-c control. Move the binding to the usb
directory as it's a better home than chrome.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/mfd/google,cros-ec.yaml      |  2 +-
 .../{chrome => usb}/google,cros-ec-typec.yaml        | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/{chrome => usb}/google,cros-ec-typec.yaml (72%)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 50f457090066..ac89696fa649 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -99,7 +99,7 @@ properties:
   gpio-controller: true
 
   typec:
-    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+    $ref: /schemas/usb/google,cros-ec-typec.yaml#
 
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
similarity index 72%
rename from Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
rename to Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
index 9f9816fbecbc..3272d0e01f7e 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
+$id: http://devicetree.org/schemas/usb/google,cros-ec-typec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Chrome OS EC(Embedded Controller) Type C port driver.
+title: Google ChromeOS EC (Embedded Controller) USB Type-C Port Manager
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
   - Prashant Malani <pmalani@chromium.org>
 
 description:
-  Chrome OS devices have an Embedded Controller(EC) which has access to
-  Type C port state. This node is intended to allow the host to read and
-  control the Type C ports. The node for this device should be under a
-  cros-ec node like google,cros-ec-spi.
+  Chrome OS devices have an Embedded Controller (EC) which has access to
+  USB Type-C port state. This node is intended to allow the host to read and
+  control the Type-C ports. The node for this device should be under a
+  cros-ec node with a compatible like "google,cros-ec-spi".
 
 properties:
   compatible:
-- 
https://chromeos.dev



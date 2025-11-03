Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9E4CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIjsDBL7JuwSES1NzAI+XGn3v3VOxvwOWZrbhNp0OgA=; b=AJE+jbEF/96Sy6gOHsqmCJLGFV
	ZG1dvANUe98e1ob0fkBJNdiIFcHMQXb2pgHxSdXGsT/OZ3n6OpnKqf2bE2ZJSVr+goNFqZMq9wPDk
	Iz6eF9KPemOs9ILSUQkGp257QVgg2KiAkCEIX+TdpuqkeV6US3H8HrsLZsU5wxoRNva885oddzJej
	+XMcXDg1lOc9qDxaR0wW/NUQ5vGq52IuYixQs93LNGe7/nDXd5c0cok1HWfvnR3nd94bq7LSmpZ+7
	aDTg578rXi4iJORnuRUhLGTQQ5EyVoagR7awekO1hte/A02SjWpvuGg/Bw95Y5nF6Q0NWBXo9Hutj
	zpSn8XTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpX6-00000009PCW-3gtx;
	Mon, 03 Nov 2025 08:03:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpX4-00000009PBE-01Sj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:03:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47114a40161so48403185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762156996; x=1762761796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIjsDBL7JuwSES1NzAI+XGn3v3VOxvwOWZrbhNp0OgA=;
        b=jgItBniaUdCWZ/9VY7OOn17tak5Cp3o/8eitAijEfHh5d8z4coNGYl2u15/5PLf1rP
         67o3Y/VlAj3H1f01xeE+zGQ4rwXSOJv3Mfj9YA41xKg8Z9JPvhsuvo1d/gzMU8imc2Lw
         r7C1ibpc6u6PZ8hIGdKxgJfZ5hBkfhbGtpJVVXqowIbz3+vJZeystv63VsKoiH8Yfv+f
         Ng5m+l3xHHZ8rYjxu8Y6MUyEhmlj89o7KuJG94E4OIPRGvSZZlpuHZ7ewswOl8W1D1bk
         XNbsArd1FcX6pIfpo2kD1OS/FSOP9tNjSRY5DwuAGULRt0Y3irqjpqOBIdC0cfHpLdt0
         rP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156996; x=1762761796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIjsDBL7JuwSES1NzAI+XGn3v3VOxvwOWZrbhNp0OgA=;
        b=Fsp9jW+K2VkBMYsg1QQky5z5l0ZPRFljCYq9YFqhjOzTppBWuwxb9Jevf0v+7nEzZd
         HpKC5YR/NnTLfKltB/+BaP5+PtN+oM8JVGaHsj5k3fOATxaWoJGVVKDNShkA0wObnodc
         6vDRm5hwq7Msma5Gr88a7WMCU6SVcplaSSh+C6y/NsrrLFMPnClrQ1KJWPgmXuZMphcE
         9L3XgDuCppF87a1HqxVSckcgtSQiV4FGrcPt3pQt9bkAiGPhgTUhSkzoZEI2t+YiwfwS
         ziywzsbapcJTuuB6tJ7aTuqNXbYAEEf2YufS6hDy1TBOO8905/bFao0adD8vXAEgzY3o
         iREw==
X-Gm-Message-State: AOJu0Yz8cJbhdF3rzptdLkVxSunRTGBtAmhw8bad3NgFRMi/FwuTUjJv
	+PCjrCZURdPj7kvaMdwrTbiZXofbNJ8qj7fSTuVJXiZk4LwQ4RtEF0h+X8JnUsblol4=
X-Gm-Gg: ASbGncvSHXklnP5B4Zu8Cco2Wfqh1ksWqKAgy9HsLGGW50+e2dPUzjRvRPZnYf/jy0Q
	2Xb+UnAfSTMke6rB427oQWqFlY+a7llhEwmUjbzALOxYTWJ3HUH2neNxYR/6A3opJMlvNP+fczD
	x3iLaCGL6pIXvaynzKwMxfz7zutI7Wrdq59q3PanAa/15deOKS42GBLCW5Pkcgv6XJdno3aASUj
	sM1Qy97uvfpon+Al9if/HEt5TO0GHPt2ftRRFwt45gaMAjw31+CGw1vKpkVtHwJtP3Jt8mzvfzO
	W1Ms9tPvUjoh6D2bU1IZz3qO7wf8L31i/0aYa74Eom5/VybkkOo17/eYyI2EXb5hnkxEGXUDwXG
	RUkyKZHX3+Yn3fDXGc58x2aAPRSIzs/mn1IFGwInywW03LJdn5TaKFqONRjFhwHBGylK+RBlsHI
	dVs5IljyguMmguB7DGfaGrHRfyA+mutF/j3JSnWMspIg==
X-Google-Smtp-Source: AGHT+IFBlY4u+ylxa1NMbQq9AwRhhCZn287qUFC/y/Dpy2fHSIi/d11buCiKW+zA4wCy87Zp0t7RxA==
X-Received: by 2002:a05:600c:19d4:b0:475:dd59:d8da with SMTP id 5b1f17b1804b1-477308c8e97mr105117325e9.40.1762156996201;
        Mon, 03 Nov 2025 00:03:16 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm142336215e9.8.2025.11.03.00.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:03:15 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 03 Nov 2025 08:03:10 +0000
Subject: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
In-Reply-To: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 dan.carpenter@linaro.org, arnd@arndb.de, robh@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=0hmkBcwNi/15Hg41v/9tEZRSOuxBPIYSMFT8w80PEDE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpCGHAMuubZFKeP+YxESCfaJLCuZ7D8o+Eo/F4L
 pwst4jEZ0+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQhhwAAKCRDO6LjWAjRy
 uhoDD/94q/HSFeBMa4TMs0/aCpk+xFrvu4g/2QXL8QS8v2ZMGq7YC1ME6g6+tXQSMP87ztouMke
 PgxoQsUiJnpdFZM4skWp3URtpnWw+gBXhecAPHLHBSVNcdlP8I5rp3aBgj0hg8bkXFbYzJuApyJ
 xzReuVHfHxmG439toyIxW3hFEeFL9jfp27Sw7rxjsjmeXlDJpYzFpq1x2hU35tJDUN/iKmZcbNg
 UKs2tIEWRCLHdRh3qKupwgJ/Na0VWuykESGVmi7KZp8xgl/HR5+4zazpKCTIJZhFtFcq8ng7VyA
 0CCgD1lvOCZkNJ6eH5USMT4y3c1g+GK5o1rmr1LV7Bxc9MFijfpU0DWA2JOGeYvUjqpgGn7cyTs
 qO8McQ1j5xcHHSX2CPbyM1YQQqdXgo1t+/of+3A04GmR9Yhev+PqIrO7faAx0VxDsEz6PHdaIzE
 pkpBxC2XMEpQduylJlQSBylhManiiOMf6X1aKD6+/iVST92YboV7AxV4+etL934GSyVRkOlgxU+
 mI+2JXOkDBR+iUU4MHqLd/M49nNtibv3GdVOG8j9OsH91SAv6wdNZrQCsLksQ+WV9sx8sbCPP4m
 RIOFEvkpq1+IGK8HvRHKp2SaklEbxA2iLWEe/AO+65uLHuiOaWYAQx5JwofB5n7aBfZOrb12dbP
 Ozg1X2C/dJkz9Yg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_000318_087511_F64F2235 
X-CRM114-Status: GOOD (  11.24  )
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

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

Update the bindings for google,gs101-pmu so that the syscon compatible is
no longer required. As it isn't really correct to claim we are compatible with
syscon (as a mmio regmap created by syscon will not work on gs101).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193feeea1c12d0d5370168e9316c8dcf76..c5dd132a2b6948f8eda93e4a32ddd1b57a83fcc0 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -34,9 +34,10 @@ select:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: google,gs101-pmu
       - items:
           - enum:
-              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu

-- 
2.51.1.930.gacf6e81ea2-goog



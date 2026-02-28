Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FF9FEE4F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qwey03mZDyIX0X1N7iXb0Z2GyEloShTQz4q0hZoIMyY=; b=LSZ3eb8bHwzBGsKfxFmY91I/Ln
	DhmjqvHa0bfwu5iAhMUaLIxlZNPjLr4F3k/fe5qXHRTuyj7E4y/hjQIaHGpjiBXOpxjDZdwWa4x6/
	wtkULBKXIOD1CIc6yslFUq0Ebo6OEcSetayH5Y/eTsPNDlLr08AuEszyC7jm1TjDDULN5LLJDDsAb
	/nLSNLYqI2iOOVRQyzsjn+n+PtXZL5tyvXy2gqMCFouVSENKi8iB5WD7LxNLCdpz7EpW/0BVHS9Ys
	egVt/SnKaXOF8JWwzbV/azpK6X3SPH1cVZ+6pv5/aTeIOxJfw209HpOmduQQ4tgXdJsv986CCDBoc
	FQ+Any6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwRKU-0000000AGhT-1hAU;
	Sat, 28 Feb 2026 20:54:26 +0000
Received: from mail-yw1-x1164.google.com ([2607:f8b0:4864:20::1164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwRKR-0000000AGfP-1e4m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 20:54:25 +0000
Received: by mail-yw1-x1164.google.com with SMTP id 00721157ae682-79881805788so26186937b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 12:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772312062; x=1772916862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qwey03mZDyIX0X1N7iXb0Z2GyEloShTQz4q0hZoIMyY=;
        b=KnzSUCKe9a1tdN34D0XPSpW2mKoJvIlJKZmcMvDKi0u+MWx5C54Z9+Y/FHHpKutcMe
         Pa7HCTHN1Cqb9+SaYfECvOTBmWnnUzgHtezV7LM5W/JF5aixEWpjLMSnDov1ABA3Pqcy
         lC1CBrRPvMTmyeEwQCeGwRwK/bJJpma1BCNImkuRmsAee85134tL0FJb63l50EpRcBo+
         GFkgeZxSF0A1NHIGQ7aNdYZ5H3zQuyTU98kA1XfcyXy8MZoWhIJFWMmLWLWOz3ke/wAp
         SmwLc7gALfOdC0PvzsqSAzNN1yR5Zg8iffrwwa7DjMijKh1c2HPt+rz6NuYr30uSp5dL
         Y0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772312062; x=1772916862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qwey03mZDyIX0X1N7iXb0Z2GyEloShTQz4q0hZoIMyY=;
        b=QCrzilf3HOps0sxH7/rCsj0VY4pH2G25CeTzfoyeV0cOgYjthdCPjKueWvj5YO1S/h
         AAC4RAv+fCskDRPngwA7w8NHRY8wstBjZRK8bP670gQ0+6g4rgDkuW6NWeYW7Cp3Yx6i
         ioCrbg9StqXmq78aOaEHLaAXjB/fsnwBj7gwOgr9H4TBllrENEDaN84X3dHyq8OPK9T9
         Is1UaxceO91vshPOUidTbRRg4mkiaSzSR1940PScnqOeVXLh6CGCDiWY0mXb14Smyuko
         zOE3L3aijUNDH3OpSpHKBr/KUVkVBBYWff9mCkZHv5j4oPhqk4qg8gRME5caqn5K7IBQ
         cAyg==
X-Forwarded-Encrypted: i=1; AJvYcCVJwvX7EvZCcWJvl6jUpozgXjdKCAvaxUd6EqEpJFr9ohak+w8aNUit/lCKKmQzc/DtmwByY1xtVTwL+0e8hoIW@lists.infradead.org
X-Gm-Message-State: AOJu0YykuNvQe0eBX40eS969jKF0/hWNL3dgcIHcq/1CfLebAMa37S+p
	TC0k6QABNaFMpP8BBB4AORKaFy29IXtihP6C4qrO978F6nClTr9s2WaERfXQjmNPWK7R+hoGoDq
	fSu3OY6y5/+8+r7ThPZ2QODOnua3FLA3dEnaq
X-Gm-Gg: ATEYQzxOxjtF01om/XfkZjBz08l8RcYJdCBYfet8am2KE8b6EonqeKN+evaB4n4P2yQ
	GhtsQTUEK8ZIdGo5sDSqbvKpvJiSnxw1bzhfe9JzMVcA+ASA44/hz1Nob2PARh53R2fOk413FsE
	sXXSNRjUIm27ekPckoGN0ojZyincPxsAKc/5a4xXXJ7DWcua1/Rxc1KLLQXNHNmVt+tFMYQE8Tf
	T3HMP6Xi4jv7MQwnQE4WRpmEmJZvT9l1pUxY9jti/37QMrrmfyI1ye1J5otwDaSeaxTC56tNEK9
	bPQ5q9vSvAL3IC7cFabCTabnQibDMTbBMTOTRc0eGwIMer1UnnmFfqNlslfnDRkxkCtotainHRv
	00H3pWwLnvAQxKnNI5yRxG6EcGEecs6jVtZTTR62EEy/z
X-Received: by 2002:a05:690c:4507:b0:798:50ee:5b02 with SMTP id 00721157ae682-7988559ca7dmr66829347b3.42.1772312062116;
        Sat, 28 Feb 2026 12:54:22 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79876bf333esm10213567b3.16.2026.02.28.12.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:54:22 -0800 (PST)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Sat, 28 Feb 2026 14:54:16 -0600
Message-ID: <20260228205418.2944620-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228205418.2944620-1-dennis@ausil.us>
References: <20260228205418.2944620-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_125423_435305_80ED4D7D 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Dennis Gilmore <dennis@ausil.us>

Add compatible string for the Orange Pi 5 Pro.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..3c6b83a84463 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1320,6 +1320,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.53.0



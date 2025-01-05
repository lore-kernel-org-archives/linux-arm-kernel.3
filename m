Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3143FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 21:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOF8vj4rqtRo5gcx1cwNenfKCZwtCi5d+m7CQDoUVvg=; b=KK96zOf4YnaYcWgcdbcqlpkmHl
	fvaowqZ2WFAoAGUeckfDr27DTN+TsLUrMhXKmuBM1upXy/5gazZ/iWmmN4rBfmFjz6faFu+mO8HF5
	SfesjiKW7Sm0ZmNhjLHgLg0fXH9a8CtuZUJuDaXVC9EDIkNF+3GboJIb2g2PIykcG5a856kSFww7D
	e7BkFGJJLzRMFrth+144HZP7GH5dZYohGj7EU3lr8pvy/xi4CIirqQM1c++AwXd+tO02X+yyGsXVR
	dO15+GiNW2GVOcvU5UR+okI/jlwxkhZhzY05nia6DF+LR0gA59zsH702kp8wfp4kbo0z3iXHUQl2k
	YmHIP8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUXtS-0000000HPin-2V8V;
	Sun, 05 Jan 2025 21:10:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUXrC-0000000HPRG-0DNi;
	Sun, 05 Jan 2025 21:08:23 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so14641748e87.0;
        Sun, 05 Jan 2025 13:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736111300; x=1736716100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOF8vj4rqtRo5gcx1cwNenfKCZwtCi5d+m7CQDoUVvg=;
        b=bDEm2/QetdWJk8Bx3SLmP0/DRI31mmY3cI6I0LoQkBDW7FmIfYh6m3pqADEQvunIzp
         MXPUagzBQu8OHhDqNiO427Xh/NNES7dKwsBXjAmBG3mZ5/iHj2SQjBA30ihEopa1pAvw
         DszQ+8fqlZ/Ixle3/GvvEJvPBvJvJ7Iv/D+ejNNW2UMqWhz4N6a1NXig+hjnEHCOJDgd
         vAuOuPS4f8wg8ah3VW/KJwy3BBTGijpWxZ48BH4Wq3RBp7Tu2fR/93M+p2GtFxiNzY6c
         Dk6H/IS8TLD5KoMhSQnuVtqngN39f8Jz+VByZMwqYdR1sQvitKO96rPupTkFnznnayLM
         q+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736111300; x=1736716100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOF8vj4rqtRo5gcx1cwNenfKCZwtCi5d+m7CQDoUVvg=;
        b=BLwJul0XfnkVkQaPwnDarW6K5KUivPFypybMtA69apWRVFHEjzGEIGDibH5lCZ1J1j
         My3L1ttBGsglIlhVUQwWnDy5OaBWRXSJ4ecvcaKNHkToiJKS70kPW7x+xo7rGzq/s9Nm
         p5EuOfbg6JagcRFOdGHBdy5ujK48woS/kj2UKVHpRsiqMcTuUDTJM7QZOfZeEu+8JV7x
         Sui/V2ulW+Ii6+GOHlEQdRqlLRSO4WKa0WubLX9d4LHlYIc2/qEBxH1/YYQ2iG2BmrDy
         FweH4jU0OE/Mq0LMLgFy9cY88PqgY5HtZhxHveubqUJMLeYmmbRppMEj9EnKFPAT6mIb
         gZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyvvK3nFXrB10H5eLkeKvsUdjRFwkwqR4FU8ubkkJEs99S1i6mQi30jYfQ4X1ePFsA9exeY9gx2EAniXqcDEf/@lists.infradead.org, AJvYcCWWu4JCMWjCedZyA6K5kyrCKptvYDmPu92sbj48w/tlL+Tlr2qc8BmjRGomfp9HTHgtlAUHH9DbcHFvn8yYsLo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrky2cP0+I/uuihXypXJ2NXiZ17qqRfDcULYk4OxQ1H51ybMGy
	aIEd+DfPP7Z+Vrmrf9wx1oDK6aWExS5us2VtCgrtQNhpiQHrRmCufrJuwLAzUsk=
X-Gm-Gg: ASbGncvy08RDaXyzZ1ugqFxLVd4KvgIwDalDlgdJFgKDCylFLgUUea4FmPzX57R8bSK
	95oS+eZCuA1wWcvOZm06e1N2lOF3ltbHCcFi20QrsFdcwIhisu8Hq1p6nr+oisdbET+IZ5wVL3W
	gpfgOF3lW9vUSlJtYaYgNK3LrCkQHfXxeQF1qnRhxWAP4ap5sz80wJ96rDD6zbBIYcx6suOLA18
	HhudGOtEAzvHF2hjl7AblICkWfWuSvfx1e/RF0YcgXmQn6Tarks
X-Google-Smtp-Source: AGHT+IGBPHpKq0o6kD7wxLxf/GzUbJ9oFyvCpeW1y7oTfUk8U7uV9oVdC+US2wWeIPxV4cDb8uYZqQ==
X-Received: by 2002:a05:6512:b0f:b0:540:17ac:b379 with SMTP id 2adb3069b0e04-5422953c451mr12305085e87.25.1736111299615;
        Sun, 05 Jan 2025 13:08:19 -0800 (PST)
Received: from [10.42.0.1] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813687sm4773419e87.137.2025.01.05.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 13:08:18 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 06 Jan 2025 01:07:17 +0400
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add H96 Max V58 TV box
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-rk3588-h96-max-v58-v1-1-d25255f851fc@gmail.com>
References: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
In-Reply-To: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736111288; l=1033;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=eeTCvCciWfKUz5L1sZGrRkBrSqywxqaTRwz0H5B8ob0=;
 b=qTv2ud22UsloqEYGxKS4alpOydVp1QGTwedveAJV83u+csXhCsxnkL8VLUO8KdJ16Vrf0aX9q
 XcvG0Tsp3IpDxdNICSOGhxrpU6YQmR/nyTwcSs9k1P/8nEbdQm6XGbJ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_130822_117019_4CDD7341 
X-CRM114-Status: UNSURE (   8.27  )
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

H96 Max V58 is a compact Rockchip RK3588 based device that ships
with Android and is meant for use as a TV connected media box.

Add device tree binding for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923fadaa48c407a8e55e7854db7203e..010db4731d5f368365c72d17f66cb55d94ae1630 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -597,6 +597,11 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: H96 Max V58 TV Box
+        items:
+          - const: haochuangyi,h96-max-v58
+          - const: rockchip,rk3588
+
       - description: Haoyu MarsBoard RK3066
         items:
           - const: haoyu,marsboard-rk3066

-- 
2.47.1



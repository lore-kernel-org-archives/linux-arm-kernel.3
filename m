Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3928BEDEC03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 02:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=; b=MEGJCJiTiKcUQeb7TGORA2KPcH
	cjubXppw4VrcSgU1/EP62NXNXVN0CXb5BbSqSoAdRiuqxzRcckA59s8++QK71qG100CEbL1NdtXEq
	wfsfLfuM+74rAg5xYpg4GXfjycKuwwR22/oCy7irLFPmtI5crnSLcgGx7bl9CjvAF79mewa0wcGlZ
	wSCjRzSir4AGI0WWMxE7yr/Yqy7j4jFtPQCLz5QSVcExxkzG70gOZhZRJieVVQg3o/vt9D2z5Q4nA
	oBLvjvgxfAAazdVmIflZesqX//YzBrJfikCUOcT8cjS9NHeAuGsSciFmzGKU+LxZmLTPYKLVs+xir
	X+S4nc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcOf-0000000GKbc-39bv;
	Wed, 04 Mar 2026 02:55:37 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcOX-0000000GKY6-2Yg2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 02:55:35 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-824c9da9928so3866163b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 18:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772592929; x=1773197729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=a0sOukJWssjcDdHpaIWWXNkqa84fTUNUJSxtVekTFyu8flwqOGLN0MzFKagGH7SrLl
         aPF6FVls88rDDkqqnxJRnARhdvjO1pZU2ma4OC8erebvxqJ/EKfiY1+O+c+gfkZ4n/Uh
         BsxN7td9CfSkIM9LABm65yXDUR+VQScdE/ofTnukRKrU2hRiLxL2kSaKUteIrvoksfWL
         y9GlNZYF8iG2j4dGJgpmtq+s2OQ6qwwFOoAs7I31e5T6NZ4PmWxxVmH54FWljHcmBkWR
         /25gHgZzqi57K++BZvmSIIpXWol5MiBpnC+CehgGWBeZSBM8lW2byaPojB2XD/2r1yJi
         a5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772592929; x=1773197729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=ACB8iOuyvXUpIkNsBjWKBo8VGltfr7CyHCkKYeYsYw3kxuZXUrrFwsCwqbCwjmuX1S
         jI4Lcs/Mg2pFAyUn9Qw4DuqyjQhAR9SgAtP/d63f+yzl92vBsEEpNgfAOxmY1OkYnNiL
         ayInb9Bgeypvrduc1mssQNrHMTYX/hgLEc11EscmTUWWhaBIENaHDGDKISGVg5Jsfw40
         oKh2dCLHC1o3SIDhx+nR+1qaAEJLGy981X/xHOH/wVdLDuhMu6BLpoi+KLEC4C0VJVUE
         pmV5YqpDGaZ46qjz0zBMkEpIWEFLk7GgdhYcyPA0yDodtkPuITUP3bPepOr4dibh17j4
         nJSA==
X-Forwarded-Encrypted: i=1; AJvYcCVoRh6Fjl9vkeQ3Wdf3zpg8rpagZBq4EpvJed/y++/n6JWpzh2uX7OPUSH5cE7SG11kJa27o5Un1SzyQj5Kh1yH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9YtsJ6dHlNgq9ajrUV9vgs4bf9R3mXlMam45v/8CTO7irs65c
	YWyccpOJLNhnD0WwbmmxK2KrQcyUaEvvk3ZgvTLYd9LXwfwQQZBnIfsox6bCqthybcKibvXgBp0
	Kie1avajuyAJWF65fDDaRwLq5GRXIjkWvwWhn
X-Gm-Gg: ATEYQzxkjkiTwZppkr40Ts/xFV7UBEvkDQa4zTyPuZ5Mxd0Aa3yvNkZ0dVAY10Br0Ci
	/2xi4al2QuDW6tlm7i3Qu1clY9f57knspo9MGklPqO7eb7wE3r+YMw4SkZKXLBZ6N2olPC/+7as
	+L30d+JlTpt7yI3H7cm9GVdBnoSlpZvZjBMxmKOgwEUvm3lW8ZgFk5vaxzRB6S7pG1TJ9SkVxAl
	sgivKyY2++8ws4uTKyx6kRiILwQ+C8Hvm5rrnXgZLK1aPfJs8D2b/wwXcSOl2azlWnbpeW9jwkc
	JPbQVKqEgnWUiNgrXBChNwmu9eiE27tWT7RzIafRPKin46NfqaP2gsNSGAgKVe8qk27knFUCRw/
	wC1oFlz87FfKISDlk7g4SQ985RoTEMyWthtAUcNl2SW5a
X-Received: by 2002:a05:6300:2109:b0:366:14ac:e20a with SMTP id adf61e73a8af0-3982e215fe1mr450654637.72.1772592928735;
        Tue, 03 Mar 2026 18:55:28 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c70fa7d59b3sm1374096a12.7.2026.03.03.18.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 18:55:28 -0800 (PST)
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
	Dennis Gilmore <dennis@ausil.us>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2 1/3] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Tue,  3 Mar 2026 20:55:18 -0600
Message-ID: <20260304025521.210377-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304025521.210377-1-dennis@ausil.us>
References: <20260304025521.210377-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_185529_645554_0B8E449C 
X-CRM114-Status: UNSURE (   9.00  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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



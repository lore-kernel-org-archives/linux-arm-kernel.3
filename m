Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920A2D116FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/TsDHFpJoTghU0e6gzw66+wowdVuqKszPma+r/MdGc=; b=TaWQRrH09fg3EhVeuF/pmromVS
	I04pnK9vPck9co3AMilGAj1VgZSs3Ar8DijLGRn3KAIqETN249zJ7yrzhwZb6Wse3USogZcT/gBeT
	zrhBl1T8N7hkf8GWWY5c9Vt7E88WzsSl0xpew73tyKj65tdZMrH64geEWDfPj5+2FxvfwPQHX6STr
	bAjOUs3xXEHDcW5U6CErUvvp59QYSRI8KYETL92oHmZYLdVnTtcROLSFjWCgzH1l/5DbYHhDzM8gy
	NIqI+SfL2c0RvdOtxIHieZ0j8RP9rvth0vAkfayELqbRWrie53BqHrCWiCXXz8jDgtRrSpJL3Jip1
	pFWaXYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTx-000000038Bu-1xPM;
	Mon, 01 Dec 2025 08:42:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTg-0000000384u-2BcS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso15435765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578506; x=1765183306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/TsDHFpJoTghU0e6gzw66+wowdVuqKszPma+r/MdGc=;
        b=ZM1x9r+EdTlpyXOnhqjbgcV8/udA3umQUOkNAoo/rzwBZFom5sCQxDdIXQyk2zZD5Y
         xaqJCr9cgr24v2DSoMtYmbFobe6rOW7kwdapKMqpzdPgc091f5IA29jzzTrLkBmi4xHi
         IcJgiXgmCXI48+up52Hh7lCSp69gc1mL/TIHRbhgQQGkZE2Rlk4ahr+Td5WxYkeKDk9h
         gJQK5cfjI/sRokk9Nx31/8tuWDAcJFsDkdI8X/yXXhtcQESF3lxOmJZx8BuEK1yZo0cB
         KHWy8qEX2MeMNBIB2+KHBH+Q+pcRciy+NNrpUZObdAoyohtVTsMd8Sy8Eqz8A+AH5CJv
         HVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578506; x=1765183306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/TsDHFpJoTghU0e6gzw66+wowdVuqKszPma+r/MdGc=;
        b=ilOa5xx/kvBiDMoCHpESBIUdfmpH5LWMjAimEW/HHgSlrwnzfMF5wA6Or3OlNSVRpu
         scBFwW6JTawv9yP6Iog7hQssBChiNq9jAKZNK6VPYVR0K/o0tBUYsJ5h/ICA0VCCQ9o6
         icq8bwDNKxY08Fkf9CWy9WGwhUNx7C2yNAf37CVNoksITAV093CQqSsqVDKDdWaD2WZo
         8tqPpIj+6w3tVK1FqrtJHLcRHyRTXy22w42mU9TEeEgixEAwIrVwStYxYyx6TItc9CL7
         saEfz3wtsx95xDcYoVltcIsBQjZtFfucr3dLdBeLJ3hYzYG7R/9kcWWf7FCXF6sY3T8M
         +pxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXbYcMi2IvsJHVn2X+lNk/qIOoErTr3dJI5NGCrYAViCb1Adziq7J9zPL6MSb8dnzPAT/ObRy22Mbet2qj9fyj@lists.infradead.org
X-Gm-Message-State: AOJu0YyfNEoOehSG362WkPopev97hGLf62pm7eICYzmF1U3SwzDCUaXi
	1Pjre+3WOWLyyKP3q1GIK8STNyYP+bGlasBH/9cXxAe7hGbwcVMy6JPo
X-Gm-Gg: ASbGncvbwqaEWBTyZXVHoDtBQEpSDKDTH31NtYy6szMTn2DsD4GripgedMM5XXjPElk
	VLNA3T926pPYZttE7S0bsbP1U6Tlue3Ay2C3a6/4wkxOJeWInTktp4J86VPAkovFHfbnQ7YsTnm
	rIHq/OC/emTPu3qDes3cw3Sgqx4XvlIZK/YJD+jO5ecn1giKWkU/Od6641ap1gVlqIQxXiiDwQG
	YvjKj4MpsqihaPpepCtbXsQV43RhfruPJoSSfcADwp+0Q7+zYCTRgg+w9YrLlKlce4J1o/7rsE+
	G6Ab8sg6dfNdrnTSlUPVHT/VBzkwxzLk1SvYswim+B0DI8WP0yBKwIjVbyQk/waRDywFQAJyCjW
	B0Vc0XwfZFjzoJTmI2phPDqT3ZB4LX/vW73QtwICjxgTgdYba3XbCxgDIZnIyMHagNwvXwflC/K
	WMhoyfHJiIHrjtrKyTFLj2L/XaYa2r3g==
X-Google-Smtp-Source: AGHT+IEYuCTv935vGmlcGX3etHdHZbqBXh/TzCfPUEc0jsmHA4A4/uxPZ70+glSBPUk5gb6AjXKx3Q==
X-Received: by 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr380794285e9.2.1764578505868;
        Mon, 01 Dec 2025 00:41:45 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:45 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH 2/5] dt-bindings: arm: mediatek: Add ezurio,mt8370-tungsten-smarc
Date: Mon,  1 Dec 2025 09:41:37 +0100
Message-ID: <20251201084140.376058-3-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004155_093525_5A5A681B 
X-CRM114-Status: UNSURE (   9.36  )
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

Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
SMARC SOM [1] + Universal SMARC carrier board [2].

[1] https://www.ezurio.com/product/tungsten510-smarc
[2]
https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Cc: robh@kernel.org
Cc: krzk+dt@kernel.org
Cc: conor+dt@kernel.org
Cc: matthias.bgg@gmail.com
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..301f9a1e041c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -431,6 +431,7 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - ezurio,mt8370-tungsten-smarc
               - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
-- 
2.43.0



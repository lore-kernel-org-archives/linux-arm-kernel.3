Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E070710F9314
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 01:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=; b=TFN/dGQN/Hal+Ff2w8I+Z7eyRm
	TZY1NEgzyKKMxTtiz9ofCExgs3VWtgcHD3glLbTm/QPDY9SmRdofE+STv7k6k4CibrluFEF4UuC3M
	60dss52dzrYsEHWw6sM+3pMT+ip3tbmWqcp088W7122oZPoOFq55xW5cVFdj/yBU9yZmRe4RsfQ2g
	QKSuC+RcnDE85+jE74VOZuMQIc3n8K9kloIOwe4miVYPYKcEi4eoquL2LZ+YgNPRH8/q9MWoItxbq
	Ma2ZcuYDoNpkZZbcY8lXBN5doKQthJuu3ID8m+UuIvJqYZ5dv2q8IbgNurcEDLeo38LK/Hv15FlG4
	/rVLRd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7k3H-0000000DlWz-3kh9;
	Wed, 01 Apr 2026 01:07:23 +0000
Received: from mail-qt1-x861.google.com ([2607:f8b0:4864:20::861])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7k38-0000000DlRX-2OXG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 01:07:15 +0000
Received: by mail-qt1-x861.google.com with SMTP id d75a77b69052e-50baafd6c4aso49256801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 18:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775005633; x=1775610433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=WQVOuyL/vRLdxUtPH+yr42OCv6rKXKG4HXJOzcEqfiPaNAvywEfiKH/8N52chMrZFF
         RZveXotG12erbL1xA03GKZ4R0hSCUfIctI9z8jCoUvkTdf7iQjPVKDFF9ViKerk1gihf
         U33Enl9XCzXqVc2pGY72nRX32Ir7jgL8oSTdXYaX1k9W/Eb6sE49VsPROF81DnL/AlDC
         7hdM1Ra7bw32O5Qi5qQaWv62eChEK/GYRIyKPXgwHpm2OIjQApI+CSwZyz+raN+Ez3IG
         UE+/T1tlE7wlmhsiUmhvt1xeDXhnlLsePAlZ8VUuroAb8EAX384nxLZJB2E+vWZcuhA0
         viMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775005633; x=1775610433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=aoW1RgIhHiY+/+tb4J2I5U2++5hSxoaIOQOd18AD22g+8ljguSvqGD7MB5BN5w60P2
         N0aO4mob84WOJ4CIlUO39epqDoYxGZO1xjjPJhHV8Eyc8gPedS4HlMiLJhiwcKRU4xEt
         kaeAZ142wOTzW9yghXl1rBVA5hsi8lBELiFXETKuHh8oO7rMdjpezZRPBsT1tvPYxX3d
         GOVrN+YL73mSzAEDBA1GBS1ejdQGxFVCPMsGhprORm6L7iEExdBU6uaZkMHvS4S8UmCq
         /EiTzCnDOLKimcO5LL6FxZeWcdHCDiqgK5kqIB2ZT8x5qBQt4iCrsdZoDQZubGUMa4QM
         RI1g==
X-Forwarded-Encrypted: i=1; AJvYcCXiNDdcznMwAR/Em70n1rN2+a8gKTuc0VslUIC26em3RlL55N5SfTI+QDGdeJ45eH7riJTQ4fSjTA40edblgKoi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7JiLeJvvtgeElC9uJORliiTAq19Y0Tj4LRSjUxuRIa6O7ljkb
	n+SmZUrGj78Ev6DmFXfDpP0QIkCLi5D1ZkGTQU7QDHdxyuw6WJc260dW0yodDi4VCkHvrHpXocU
	EHwO3GY34McNWB7MDLUcTa8ViXz6DpCe4uom+
X-Gm-Gg: ATEYQzyRXR2auWNkeirBPyqVp2sO/pUGHbndYOxHjGk/O0KR6qhTA2L4ByVG7gTLFXI
	J4KvHV8Mp8GWqoXTjAf2/JxF8MyfbDVoBN3EKZ2NDBon/QxdxxuqQkW1WWhfQWA12GQ3evVkP6C
	SIuR8BG91+8+n/i/SW+kHxRYPN7S0l3qaPGe7M/cqsH34q0G/JheJJgR/9fRQFFfMXgoC335BtZ
	OLD23iwQjPHi+nC+TMZbd5sI+1/zZrhnUdjw+IdDSZKqrdk2cQcuAVwMO49nWh0E6ygw7b0fNEn
	ldVVGxassXl9yMXD4vQmzXLjk60ARhalNLShdYrkRnz5tGyCwXGEaz/vWZ4VcGg/UwZ2AZMETMO
	64PjHDWJs2H4xtLDWI7q+jmX8uUtnu0Grwp5v2OLwuJqB
X-Received: by 2002:a05:622a:10c:b0:509:3f5d:4fb4 with SMTP id d75a77b69052e-50d3bc15895mr25873091cf.20.1775005633089;
        Tue, 31 Mar 2026 18:07:13 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89ecd72ecd5sm14105766d6.15.2026.03.31.18.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:07:13 -0700 (PDT)
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
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Tue, 31 Mar 2026 20:07:05 -0500
Message-ID: <20260401010707.2584962-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401010707.2584962-1-dennis@ausil.us>
References: <20260401010707.2584962-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_180714_617251_30BB2CDE 
X-CRM114-Status: UNSURE (   9.31  )
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



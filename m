Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79024FCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=; b=GLK76MX+OyCAd4QubHIYkiC64y
	eDKH27ZR+LDnQttsDiP7iSC3JAd0Wm47JRsD55mQoFFxxQD9s1Z/RfGD3yFXG1DYEKRFTSI223Zgi
	kt9/9DZG6NIjlY5R+FySPtxBJHDhnCn69ioC84Yl7COwetZ4CKEed1vmEeG1KAjc7Ui2MdxYppSY3
	QhZSpLVM3+fHzqXbN161gi/3TFEPT+DyIbgPsJmedOIrnmAgVcTU/69owUGQ2xLEhv4lgu8rR8sfu
	gUZSKAu4xc2y91jILHJtU9/Y0VRXOmVA036hH8lhSRqi/moMURgsP8J239pzXOSXeHl3tB78FNl14
	6Euk1gnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznU6-00000008cLn-2dHZ;
	Tue, 10 Mar 2026 03:10:14 +0000
Received: from mail-vk1-xa63.google.com ([2607:f8b0:4864:20::a63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznU2-00000008cIX-0xjY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:10:11 +0000
Received: by mail-vk1-xa63.google.com with SMTP id 71dfb90a1353d-5637886c92aso6808488e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1773112209; x=1773717009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=NaiBbi0HogTMXwHL7wPNFFbXepp9ot6nGuxWMvztsK3QLakwd0ZRTF8Qbe1VY/d7kx
         xoCfdJizw2wGtJDqJ1m8te4cUhzxza43liatVz4sw/N+MfRNIQwCZCfAyCnnb/yxpG2H
         KqAfEpDIweWNeSsscU3CYdRVvTB/8OPYQUkxCw/Oz9TuOBGKEqTb6qUgC9duCA9yVGFe
         oSqzZedc9uDwco9yAuPjzkq4egir96OpuyxGZBnLtFSB6nAeuBR2HMpaAL6OUoBoRlDQ
         tiOCzn/Ojdglnfz0TnySu5RZkxmPoi6+U5gKjnftLc9+b+v77f79E3Z6Hz3oAGw4vnVo
         BoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112209; x=1773717009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=dZrKBPVZ3JRwK1pdk8LM88Rw4zn3n50ocjD7qwo+4VD1sgb93z0pFMNJhr4Sp02M2J
         xfVxAuwTg0mWc2LDx6It9Kiie/SKvVI+oGcBd4g27aNeztFOw3cqkWcUSWtOtqDBpS22
         X8FEWA5VLgi6vj3b6tkqfgmRS54aXKS7UsxnTbFUhZb2whUrXY+33JLGQMG2SIiDrvQX
         /ezf3+m5AJ20BphDq05LP4P2L3tuPQ1QvskJxmu8MQkfvwzfPWJdUlBXerk8T8c3UvHO
         5jWcqWuKxB0je6YQQeLKZ4CcWjY0cWimGZVnoI2h4XmVmPqp8GbZnrWOV9kU9w3c4EwE
         arbA==
X-Forwarded-Encrypted: i=1; AJvYcCXgo4Qkes1piuAsYztrB6lkuflfveIUfuGZueTLaUdwA7NZUuZs0d+jg8Kw1pc7ufK9SmnNTuo8cs6jblx43yR4@lists.infradead.org
X-Gm-Message-State: AOJu0YySnfEFQHW588uL1CT3uqexnPQ35xQKhC6ZL32I4ywHddLHTaMY
	6Z0/tNZ2AO8EzhYy+0dKuRAP60fknbS6itO64s5XrsY+EGT+d/ytQJSTDoYDJ7EKy5ghYGJMFOc
	Hm8XUKkSIEXUzjmYknupUFo5PxnqRpYVFeEIv
X-Gm-Gg: ATEYQzx6Ryyhiul5/wraphadDwFn616nbYu9gPsHrbrl0IZVuVtzcq2G3b/vLAuQIyu
	ROgXglB4DqrYF6mq//ZIlZZznHG9bq2FXQfrj6C4f4f5dgFaIhzFve/n4GWTgULKEXsYSrJ50G6
	ifdC7GVAJMJwZLDWUR2VXIoT0Qvj1FTvTy6K2nVaw29svoC6YlUK5gvjVl+/I8MEb909t0Tggvb
	bk1Ukh5s1p4PJP76agzcgGxovXGDDHv4bxrfA/wUBQaMJ3i/W+m8yXGVVaM621PUQG0KV2MlN0g
	1sWu+2p2OpPkT6q0aFuRtLhFQBf07OuYhEYiILLboW+enLYhT4nRlih9nKhybMlLp04PXdAH8av
	KDWiofJpzmRXOXzspdumv9NQWU+6Ld4/sxj74r2Ethbcs
X-Received: by 2002:a05:6122:1699:b0:56a:f348:9b8b with SMTP id 71dfb90a1353d-56b07dff8f9mr4723574e0c.12.1773112208790;
        Mon, 09 Mar 2026 20:10:08 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-56b09ae3ef6sm1544609e0c.6.2026.03.09.20.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:10:08 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Mon,  9 Mar 2026 22:09:59 -0500
Message-ID: <20260310031002.3921234-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310031002.3921234-1-dennis@ausil.us>
References: <20260310031002.3921234-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_201010_265299_A4825E80 
X-CRM114-Status: UNSURE (   9.39  )
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



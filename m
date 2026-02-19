Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28ECC531E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WfGnMtYSvSKtoJnZqrv9UGQYGmLqGwp6t5dpvCm2nwQ=; b=QFx0HqHUqitlIL
	6EvSv9UqKqDEGldcrxas36WRfcyftopqeV1l3tBI6mlI/YsqjfbHhvBecK4zpF9SIwZbIHKyZaHbo
	UE4sWjLOJW2s0xXYP3PVzasuPf9ELuwH4Fe+o3oNbOsKWRDv2OpGl3uSYn6YO0InTk0xaflLYKnhy
	b2wDGJVCxITYeWymyW3o/9mbtNJuvFhOS4ILW9cji5hd5Gyd0yUfLSmPEZi//BTLMXqLup+JhZNcE
	PRFf5xkwt14e7plchluCf32qD9jXVFDlGL3sHnfEVxbqnq9A7KVQ+0LZFlzZGAaenFuSu0WgfE5gz
	+4aXywqEMoa/jGQTKx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCwC-0000000CEQ6-18yS;
	Thu, 19 Feb 2026 22:56:00 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCw7-0000000CEHH-27Dt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:55:57 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d4bc6a8021so1153563a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771541754; x=1772146554; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfGnMtYSvSKtoJnZqrv9UGQYGmLqGwp6t5dpvCm2nwQ=;
        b=P+irXaP+sFF9ev5+IDdHI/cqcOzlRWAk4LhHYrLfQ3dOSNvXRDUDVxOzEWaC+i446G
         htDDP3Tf+JZEXITGx7zXqUZ46NmTrYHdKNVgF8y8lR44znzGVh4mPZMFxOhxOFX7qoxW
         rBW6/B3KHCt5t/J2HZ+CmObkH+qMPKBp5gGxDmA5xRgCdmnvQxnti1yeqKayO0jW+x+s
         FUKM2lljACEM92eXMPf5Bk4w2RgUkbm4s9FiZ0d1BtopIGE7gBGLWFqYb2+tkZz0PQ7E
         8mM78+hEa4k7RWGFG3BdUr+IgajdLfxkTr3B85MsvlE9yLFHcFotn39h+vb0mwPLpsjI
         OsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541754; x=1772146554;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfGnMtYSvSKtoJnZqrv9UGQYGmLqGwp6t5dpvCm2nwQ=;
        b=rrv5WhfZLu7Mdq9+aArsSkRk7DYE082+EQs/OC/dp1Y/5vv1fkatcXn3HeW4v0q/ay
         i1/AorvbaaXLOlOmFRbUkx8HOAB/FJRmq5MHGfYpNI/qdwWbyrHUXk6zECc1h9jz0EZg
         DhmahUGD2Ktkyn/eyqEJVuagEoEk0mB8mN5KN4vepyCKvHfvT89hjkX7ASxtqRo6KlCR
         KiWeiu12GGPbzG7ElCngwxpQf+H5dhafmlLwe0M/no3cX6Tc1RTSx3JsNHnjm/EngGTX
         Bur6Z4jmQMhnHmsLfavbAWKZ8qFG2gs6WxfWN3dWxfg9mxxrzSnBJFOZnWUAsoWvhh+0
         YXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAhuv2VsYJY3OpdUSAZNcb8igYv1T0Q8+SOivKhK+EJImJs1/GYB4BTaUXaR59tlIPJGeFy7nJb6HyDTfuo6ck@lists.infradead.org
X-Gm-Message-State: AOJu0YxGiHtdQsIumb2hKu92+YKYLLduBsrs53KHzuHlhpfUqbtSQZPD
	/MBsNG2aQHHP+tLF5RMHrnW7Dh1009uvSRPT2yAyTrAoBVpU1YO+TeKmUFKfEU6ULj8=
X-Gm-Gg: AZuq6aLx/fkM6DdVJWjq4TBIMxAymRHy6C4NqWNGCuz/g6z74UC9OVZMPCXAXt7+t4I
	tvyGfnlwJ/3nBBdLBD9tycM68TQLdQaFZL76fcOH47qXIwwvB2tLcDh3s81pIGyUE2NYlYnZRsT
	00BjAml759luX6omwunrqiWOz1NpcZzJv2gayZ37Ft6UoN8RvnTtRNcqSPXoEu7M4/eQULeh1H5
	vcSPgDnTsvvnc4WqL8HHY8GBLAPavqYleiHfh83tW3Zu6gxGl+Co0PzHUjVv6J6vBJzCU6a6rM9
	6RifdOshh8X5aPIsEQIs6WmisRoWBiNTvhwUDoAHwLOjFRCSQ2t07AOuKpB7Ix9druqQ4Tp9tlx
	QoEbjk9wCdGQEzHw0Hcaui4M/zgdL2K+4gIUz40TkAGOTYSOMzv/6cbdTFKVWygcB7bJZ8I0ASl
	FobbSXBOPBmbwbPE/YAfni2WfMAg==
X-Received: by 2002:a05:6830:67f3:b0:7cf:f7c1:d9ac with SMTP id 46e09a7af769-7d4d0acc297mr12600516a34.9.1771541754355;
        Thu, 19 Feb 2026 14:55:54 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm20565585a34.29.2026.02.19.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 14:55:53 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: mediatek: mt6359: give regulators unique
 names
Date: Thu, 19 Feb 2026 16:55:28 -0600
Message-Id: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBBFryKzdkAjpsSrFBchmaRDNZaJloJ4d
 4cu3uLB4/8TKglThak5QejLlbei0rcNhJcvmZCjOpjO2M70Dtf9rdhhdJj4h0L5WPy+CRa/UsV
 A3sQYrHukAXTkI6TZ/+A5X9cNZXdb9XAAAAA=
X-Change-ID: 20260219-mtk-mt6359-fix-regulator-names-cea2ddc697f3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=hJfG4u45vdCvSUtHigkyFONhukFUc6nMEAYruquPqJg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpl5TlJcv80s/C/Okoq3TlYmeApRt7FhXmVQch/
 AycgWxpsYeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaZeU5QAKCRDCzCAB/wGP
 wHH1B/9qHLMxyOde09UGuNhGJ6MzrXJAsPOna4RlNdG4C50Su876Rz/GwXwUTF0CJuuDACjekAV
 rhgitrHiyMuaC2PWeIZIsG5XCwzAdy9iOzpV3Yl2DnpQtoP9APz8vCc64YeSl5zgs9ljCEtKGVw
 w5l56Prt46rL8oLShOp5diD+BNQlQPvSKe+JwwT7MaZ9Zl2rspSDzvPTVst4pWw28ysshT4xvL+
 rgCn6SMFnn8L7/a1gumT2tbdPVgCod8Q1zWgiBg063uQwi8UQitgQM0AE8siYN+kE0BABZn8AFU
 nKPHGoyxCym8Bikoh9aePjwcvL+qTiicPPNYKwLWFTqCHibP
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_145555_802928_9352B892 
X-CRM114-Status: GOOD (  12.00  )
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

While working on this regulator in U-Boot, I noticed that the regulator
names were not unique. This is considered an error in U-Boot and we get
the following error messages:

mt6359_regulator ldo_vrfck_1: 'regulator-name' has nonunique value: 'vrfck
mt6359_regulator ldo_vemc_1: 'regulator-name' has nonunique value: 'vemc

To fix, we add the _1 suffix regulator-name devicetree property to match
the same pattern seen in the node names.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (2):
      arm64: dts: mediatek: mt6359: give regulators unique names
      dt-bindings: regulator: mt6359: make regulator names unique

 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml | 4 ++--
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
change-id: 20260219-mtk-mt6359-fix-regulator-names-cea2ddc697f3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>



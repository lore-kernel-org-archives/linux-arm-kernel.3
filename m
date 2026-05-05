Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14873CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=; b=0JkBVI9Rqx4ADU4eKDyl7FNGoI
	paX90zykiE9GpgXYotEhXVSc9qWUNqyno7bl7N1CULUw+KRXWIoB4KkyG5xy4cjUcJ+FDjW6/gcaN
	H2GjX50ECB7qTTy0oXFwy/koxcwuBqHnE9ybQnrVjWNOGFc4Mups1vvHbzS7Dzhyqj4AF5Tf80ecO
	NVS1eqDHYgVSY5mv5h1kkbGyqhZdWGBVKGHwzwn5PWRV6VVdJKHu/v5qtjvgNIscxqi33hxfcMTxF
	QMLNWpdeVhUBRUOUXjRSoXjTWAAJEnH0VTDo8WRbXgzltM41zzbndXcO2KrHN730GHa1J+yswxTKh
	jdlj8dqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnr-0000000FrOE-36Fi;
	Tue, 05 May 2026 10:14:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnq-0000000FrLI-24j6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=; b=BQQlUMJnmVX+dk9B69P9U4uwwD
	4USWYzLSKtqBQGmnuOnooPz/994xrJQ+bVgYr1zIzJCvOW3/BNVNdXUu5WIQIVedEsb1/3vA1qdd9
	5NaTfR1v+nZHgRrBbfclaeOH8KZL5xII6yzR5gqG5H5s1HHHRDokulPj2Idl78a0V1K/LA0Kdio8e
	G4ilxVyPDbvwIvPF5X8d5j+Bf9pvH6zWwRyJ2wtc7VTLmnlREGjgxtOYDpYcVRvftm4StMbruMMA0
	O/HRwPGFhmvH1DSkESx+HzPXH3RVo0ZCnL8KXaEPBE7oll68UpY2fynt4b3YXzCzbInDUXGExWmFl
	6jxY8ULw==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnn-0000000D9eS-2pNa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:57 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-83975e992e1so208218b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976094; x=1778580894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=;
        b=nsbcAYs246Owlx54mc39chAwvSmgI5rWTA4bDhF37AcSYRN73ORjzikJ8yvZQHzZe4
         6YjkKUOmQtEyw/xh/eUmZYx9qjeY/K4NeqmLCSWMW+YV3v6sNNwu4uvK5CZFwGMLo5D5
         vTP7LkSXsqcBbvDrzpbvsUl9Wky/zKQGp9/iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976094; x=1778580894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSojEqB8EaU9pvA9gkUqNkJ5UF0cty3ddK7cO2BBgvc=;
        b=LD6Regj66LlrAPLW6DmU21g9iZHsY2sTuAf7/0FvkL0lOHh8kLKXVDMDyr4N7nsKzc
         Q1PpI3Eue091fudn8iM15WSe5XYfhaMbIc2tmKfkTM6WIvldKK4W/cg+D9ygeJ3oXo+Q
         ATKqtbfUURv9x7Dp92WG4Vr87uVPyoThXzlVX0zLTw8CvEiNiZ3Yf3jLdjjnY7kskk1I
         hjUlkHYm1KkIf/a9vOwR7K8zf4Q0oXmKudlS6uFnls1zZ9PxR7G/zt8uJ0o6laRr1NJE
         FAQmR+sAnMzK7LUFogO2q3+SYyUrQuzrsp/AbAmglHYg1s/Y+WiyPuhhJ391XQYaM7GV
         Ia2w==
X-Forwarded-Encrypted: i=1; AFNElJ9cmX6HKpc8eMU61/9ZmzC+B9ZIcm1j26RgkFM00YGRhBJmj1RkRf/hx+BoVIPXpjsGoOceNkOFvRq5dQrakzT7@lists.infradead.org
X-Gm-Message-State: AOJu0YxutgGpVgU0cWqqDHn35UEdGca9FOjU0mASpii89ohLZumNAk0o
	a3I6pj2O0/QJze8Qg5xIlDfX8Im9jSOSaVz9uuBtKptKMCVXvQP19g7T+OM+XlZcOA==
X-Gm-Gg: AeBDieuybBYNGU2cOeR8KmKDOvmKdsvrQEfmPHBN3pM39xE2nZ0nlNPgzrj+pCMFUZw
	npw9nLLHElTH2G92anHaiswJAzDDpkhBNGyIKiIadjTjsuI/Q229aJsxYAXw1OPm50UvUvPHpQX
	5QbwHHmMt7NfrT9sNVanc5zLu7AmDjiDMKEPa4UGgqHCKMQix2A+1EJEg6JH/7LRRNhkYm29F6J
	2pj4aDT+1Ge5fVVpyn1KMzU/btbzQo1fVA0PtriVbCHwPU4p0+vFSgGGLz6d5Yed7sGH3SyBk9q
	FvtqMe3QAWMZW7NVCmPmRSBffC9IM3doWZX8JOuzPAXko3IHI2n3byOxJbQoCoOMTSws6cVJ66t
	+UIsDqL/lwJLkdMbalG778ikVjfc2aCYmli7yh8oxxkBuQUV1eWZ9JiAefu5kuggU7TuXSnIwRC
	LP6KWirJNH4XJRZGpsYyKhV/F1wKJ/Z/yXQmDUohVU68Za7T+a6oHDuJYv3+Grm/g6jqdgFpmTP
	iyEUZo/2fjzeGjiWy1SL0IWQPQP+A==
X-Received: by 2002:a05:6a00:3e0d:b0:838:c01a:7a54 with SMTP id d2e1a72fcca58-83921dfaa03mr2439889b3a.2.1777976093740;
        Tue, 05 May 2026 03:14:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
Date: Tue,  5 May 2026 18:14:02 +0800
Message-ID: <20260505101408.1796563-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111455_815122_C20AE5FE 
X-CRM114-Status: GOOD (  12.50  )
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

The VBUS regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index bda1b0f9f72a..dc1ba143ccf2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -212,10 +212,9 @@ tboard_thermistor2: thermal-sensor-t2 {
 	usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
 	};
 
 	reserved_memory: reserved-memory {
-- 
2.54.0.545.g6539524ca2-goog



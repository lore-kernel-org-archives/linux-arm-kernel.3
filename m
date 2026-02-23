Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EF4EC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jf6/GdPMgEPudu5Ub5QM0YH/lbZT9UmvVkra65sIm8=; b=j2JPBAI/Vy5+KyUsSRicgrXZdj
	Quy9NgA58CypSHQs5gvOTa068esLxtu6DWwqbMZireFJ61Tw9mtITZfeeVHGSw+yfHicqjToRnsok
	sCdUN8JFdqefnQe7mMScRG9CaTJeFQ2u6E0zQq+UijR7f3VUKosH1Yiuoc+Rt8zjaZYcrcGRS2kzs
	jDiJz+h/xldSombhGXrkrPPDgVqQmqae/5GvStaR/21GgF6cuqy5KPWYMVi+zi4isX6gywU75Ew4l
	O7+o9crXISqBGJBOCQryd9aMeSvzbgvKMeE9rr6UveP+NAHDeDLBV/zvkZkAcZPrJL9BWDJSXD7Ac
	ZktF+joQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYg-00000000jlm-1fvW;
	Mon, 23 Feb 2026 17:17:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYe-00000000jkP-2sAd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:17:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3482940f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867039; x=1772471839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jf6/GdPMgEPudu5Ub5QM0YH/lbZT9UmvVkra65sIm8=;
        b=DCDvl6xJWzENyXL4NGL3sMP84wDnyqq4pXjlgJoUVlMfmPfgQTe9OUvIgtGR4Kxjo3
         X0X5f0snqJGs5FxCmy7EHN8xmVeUW4obYscoLG2mMfxbZvTRLSLXnypALXJJWghjaim+
         8XN2E1K/5cpnd5buw16wyZe+sttQFW9v2ZeMdWLQBqQv6zAm39O2blwTaHR8qEBVy3i9
         q+OruEmGxM+Y0hLjtqVtrlAfbhDDT2qVd4hAVvSTWnWWG6C9F9LnXfM81F5A8OwKatFD
         biPzwBoypwYtCFvXhsEjeHg1hHUnUG9Z1sdmDVJVswCSLFqSeCBBAdQz9QKnZbSv5tJu
         V6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867039; x=1772471839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jf6/GdPMgEPudu5Ub5QM0YH/lbZT9UmvVkra65sIm8=;
        b=SpVYfYN5NcPx3jt0vA3w4nBDnTd0xSWsNcGUdXybyH/S7viQ+77tQtwhISD53WVp4M
         Dfh/QP6AdBiO3xqLQ6QT5swyHGobeKIIfPn6q05WE/UoGyXW0I3CpPtJ9qLH40vluSoM
         Jli5VQk0/GtS3sDQ5nrp7beH1l4kLdfW2poV7NydttEp47o1sjCQOjsoLWnapjtgYylv
         566IIqIOfeLsdigOQNB1N9T2+MDh1Wkyaz4mpJ1aX3TSkoYPtHsw6eJer0rSgMxbKRvD
         osUF4+W4stM1KkjxzrHBhKYxBTT/vtld0CbmRB3iI8HI04t1hxJhJwxr/qDywhthziNB
         bl+w==
X-Forwarded-Encrypted: i=1; AJvYcCXMjvOpbPWhe6LXCnkA60795p77xSlfQfK7QXdy2O5j7BiR0n3I/r7qGzYaHYhxLgSTLSDZ25szgQcBZFITOrDs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv44wCvNTdETDixRqRTGe2YE7k3CvTpN3mquSyTZ/62LyDDB4n
	+KQhccDdq0PDf+3wa313v+03casTlERBymXF+krr1lZFuAzYcCbHAXk/
X-Gm-Gg: ATEYQzzlQ9ZV+q6CaYxFQpIFfztNwXXAROpwWZfk6pkG46U8ykdqPoqFYCVbM6Ue0fD
	n/vQQR3/s7sqimNz+IPt/l1CyMcELz3RKkvO7t3D0tJR0KImjuYfUHZwa0z4fxcRzQqyhEB7itD
	KMKOTGgkA0crAY5i1wkPi6nfzIKS0wjmX3e0PwixHYFodYPlmJ05ll88bYgGzDyC1NCSOrqmS56
	DYvRgsiq0/VubCkKXiLsRDOQWgLjlHOFkVu/xj4Ay3/7nFwesm81/iyQVSMeuODwnG/rShVBOXB
	zdXBw+orPSZ9NVM7i8WHslyPq5XxX4KEGFKWi0zns5XINgIbQDTLv5emY/+ck1Mcv55udDzHJfl
	v+xL4gnTPZI1+tQqLcelNyoMrHNqqOmq2RIPnIcyiNVSZLb+K/beBrYcCfiqh9NOomcOTezTPKt
	ToWS1rWwCPPHIEfQkZoorU2pwS1y33Cw==
X-Received: by 2002:a05:6000:604:b0:435:97f6:4f44 with SMTP id ffacd0b85a97d-4396f1a97fcmr18768298f8f.56.1771867038655;
        Mon, 23 Feb 2026 09:17:18 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:18 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:40 +0000
Message-ID: <c5ce038359583c5318c2d5ee341287c213aef880.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091720_745751_61329531 
X-CRM114-Status: GOOD (  10.93  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10f..5f422d311d4d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -67,6 +68,7 @@ properties:
               - mediatek,mt6323-rtc
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
+              - mediatek,mt6392-rtc
               - mediatek,mt6397-rtc
           - items:
               - enum:
-- 
2.43.0



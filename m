Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559CBCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=viEsQP3lMoV8BeDB+aU54lJKfd
	eRXeXD7zg0y/0EW/0BKINNmctLXDJek6zB181rNo4o8VLBmTa0T3wV+BxLJZJUfqP54scsTzzBBzC
	264GAz4RTj2JQpDMlo/qL0QYaUl7qQr2kYdbzqA7De7ZhM/OEy9lyFp3TL46LYQUPh2DojJ1NCklZ
	HEvZrZf8AHMpTpeJiHvY5RkBvAdZ+tR3F/EONWxeBxUVtRV5v/AY4aRilqX4/ga0T5GwuywzIKgN9
	i/i6R+A/VQYlVtyWnTXAB2uVcmdapAaXMrEK6CHE5IftPjHYsC8x5pSuwUDAHBUSB/L0J3FEW2bK2
	iY9/tt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1bK-0000000DlMo-08qD;
	Mon, 15 Jun 2026 07:19:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1bH-0000000DlLD-2ffI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:19:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so23164175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507954; x=1782112754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=JZq3bBMoDuFpThaIHQE4GL8FiuOfgWhvFrTC7s39HABtAIBOXwhHs9AhG37svJmmem
         oKu5iVp7UJ0aRpZi3s489gfkrnxAfMZBSx6fSJPOoKYqkCedbomzJJgr/AHzWSqppkZN
         mjk4WIpxZ3Oa2K/cmCdHZBW+nuEgFZeMCru75mid5QdB5za9kEnSzVUm7EaD0bar/4mq
         8IHnRGiDyhZ92GIRudkp6XXQLLSwGII/feXwFpof5ztAdyZ2VSTI8NIsFQKF5YammT8R
         6d//YdYZM0TgQe0SCNtkbqBsZRHvZ/600l0x+8lWjRjNd/id+djBFk4QFuudbQvgJvcP
         Lk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507954; x=1782112754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=llp6ZSR6cYB78y50ItTYP1EUisMbJ6oYz9MYWEaFCQoP7bEY18z/RzwID3CbASBqRS
         BOwzOTnSUexISDFh1KmKzLz/A3N0fpnB6IJmItXA4JCRN73FWmwrqkm6GihdbGwipWPG
         3OiGqWlBTNonAv4Xz4/V2TJlJY/aDczYb/nSkOcYaIwg0gWKhBPwSNTajzxbtMey63F0
         mF/+OwH5lYHWE8NNZq8y39yapUaPMYbhIx+AzBm4dyv065B/0XDKl1W1Om7itb2tgDGb
         lH6OjTsRZ7tmdhgomJuxt1QNihMSe/oYDV1h1/yG+Eliz/BGDaJx9RE8l4vqanhR5E1/
         yX+g==
X-Forwarded-Encrypted: i=1; AFNElJ8bkKuUTY1vatbs3NDWHiOc5ELwpK5DRDyTeTMivjylRbGbB1VRE8Id4ZtWc8FjisEAUTausQtCGdoQdgSomL9b@lists.infradead.org
X-Gm-Message-State: AOJu0YxnG6porhNwXsUPxQA8SwXJCEfo/Fd6evz5ChCxDMHu7WnsP7MJ
	TThQYrb4lDkrMKRszUHvPjwzMWH+2itu1cf9eclo2UsnqexQa4HspH77
X-Gm-Gg: Acq92OGBJEdY19GYSfHrpCqi5SundZA1M22FosDMASz7Xj3n4LKHbqKg84OSAeDqRwN
	KJh3HyyiIHD7kSNDASMv7oUI+wfbk0185q2F75KhOylnf6VDdI52tLhNFAGe3eICMQ+QaOyaxUK
	Zf+iFFCeNhdQYxQOzRlSgOw5P6kMvdriuvD3fraxxMdC8yFW/lnWCoJoCPHumbi/Xh4Uip2M01+
	CL5iCvE9/f5gUJIKbjCaXSLSDjXZV+25CzGzGJIH8xJBztnhBciFt0letCt9idNhhtHyPy4xalH
	wlmbwbouOD6s+FjzFCu/qkI1DHlBnZnpN5fHxtVgG/B3aKRGZ+M/CaWjQQ2QYIlSMNBXV562BQb
	d7en3g94cuCWYioWvZuZbEtyHsNUq7dAmMgS/R2fBL1vM+wDYHa2bGk2u930z8gNCEnYeXOiyA5
	IcYpXvBnebUR96JNgc
X-Received: by 2002:a05:600d:8486:20b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490ec4fc0c4mr117642565e9.25.1781507953725;
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 15 Jun 2026 09:16:08 +0200
Message-ID: <20260615071836.362883-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001915_686694_45510CAC 
X-CRM114-Status: GOOD (  10.41  )
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

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0



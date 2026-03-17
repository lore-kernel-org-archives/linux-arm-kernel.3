Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D4DFEDA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=; b=hsdMVQF1G9lnA2DQQN4oLKh6A/
	+uQSxPr2ZO5RZ72zu43b2fQfmQBScWcsECWqEJkOidm/UYEU+2KXWLu8F4Z4L0Li7kjaz+GpDwpxe
	uBpFLYcMcnBNwO6anCLUEdFk1MbVLw7z9kWlEnWc8mPSBSYSvhgaz1+2tiiVG8WcuWq6gWF0XUVy6
	gXETG1HfrwYlaOVT1mE7o4xokqKLupYbDTtmBxl65qrw4zkAfPNEDOlr1dLbfTl2zZ311YSABorJu
	KQ2cVOZcwceESrRBreFjY8/oD27yaBoImOG40LsbllTpjoRvKoEHGIWHr//vAxTm1Qq9sDLXqxL1u
	LkElnPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQP-000000074LM-0sos;
	Tue, 17 Mar 2026 18:45:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQN-000000074K9-05jA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:45:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so43665355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773149; x=1774377949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=e/+zl4owtqvCb7AW8MVCecEce3mEFwezA8Zh5s+NG+salIPgf6pAA4GuZuVJ7BH0DZ
         x8qTGttfjUxtyCb4yFz8/knvYMFlkdRhlHGHZlsKnNas9DegDO2k2eYqvvCIGGiMGMj/
         8FWERRMd7WGF1KOJBq5RIreAiZ1rJu1ypgY/C95hdzsKunIwt3bZH9GoMQ/gBDwghj3R
         FYJET9S1J1gYeMBHF6fpGkQdLHLeTK7Rv3USVxZYOZ5wGDrYxR8kLNGuztZJgC6PEt5s
         r22DvIQA5AZ/TtW++W1FLyH9wYLkn8wDXC4LfEV/zjtsJWgtR7ji2wcP6Jy1Ch7WwAwR
         Ms0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773149; x=1774377949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=hR80ff3XOlA72O9N4OyFbtau6ybU8xPyWRzvSUIJlIRowymCssP/84llskW9Fihd/0
         Ym0pfRV+Ir+4dVQbswaxxtoPbZZx//kU6qXJHEa1mnfNhQlhdBBbUzeSL1ikyNOagI7r
         vLoVjj/rAyCc75p6nIc14BRLPMRJCCvq7wW2GA5MGWXhMo+a7M2J3pIYoztcuRaNJQ7p
         IdyPQv3GubC3k97MqkZafJIdvMVAxcdkWzK/noAeBBothnYIbrVrkQ0bC16lFHjF/qfq
         EuR+K2bkEMlDfPx3FmR7KWXojf0Du3p5ZNCqfbSWVSq/h6w9yPHSjzsJqTjrSq6vn3qz
         IL9g==
X-Forwarded-Encrypted: i=1; AJvYcCUz0oLKaE3frKrFnqqL2ckBdktVfL9S38I5dJXKqfhTv1z7RaI02YXlhw5RStl3uZufhjzoKVB1KLNbxouQbvnW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Sr9gWtRWdnHWNXQ7PbZb5WjUlC3ZSf/3njcXck48oGxkbldh
	NS6HTk1STR/8PBB0L/PcOeeDUFpF6FINbBfPUTgF+jsy7TQn1rmpLFWV
X-Gm-Gg: ATEYQzwtdKKxBtxPkKhoJ+Bo1hyZisziIuYJkABTU5Inj2DJBbDmJQvRFuxCK3cHlfn
	tdNNGclHJ8Z7eR5lxUqYun+rs11cLmZIvGGebVzY8iExYBY03hxn0ksqajoa7kcZPoAfOrMGp9B
	vgPy9A3fyBnjbJQqZk9qzo4XmMAIXpNKrkk0xclEiGDCrgNVJFXXZG47Kf2By2vJq688Q+xQye5
	UMjeqcpA2PEcgMZmzjd809Al26a/HiuKQhgJJm8WWe9J7P92VwfNz3Vuvx3PqkoaDeV93YyR6PV
	A3NiXAy+FBdC2aXkeHQmEktqsCSWPqO3P9HPM7st+Hz6CLQ/MWgaWAe29IgQsNmY4YL79BUdOG4
	UWD02Kn4FSwIULV/xekl5zE1LtNR1nOVjvjWQqLo7aEGfLPDXqK9Rlk8I+GTnRfKMxnWIkYLL6k
	Av6daOLIfo/riqpkLZclRhfvp5HlvDdA==
X-Received: by 2002:a05:600c:1f93:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-486f4463591mr10143505e9.26.1773773148893;
        Tue, 17 Mar 2026 11:45:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:48 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/9] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date: Tue, 17 Mar 2026 18:43:05 +0000
Message-ID: <20260317184507.523060-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114551_077429_DD863A98 
X-CRM114-Status: GOOD (  10.53  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0



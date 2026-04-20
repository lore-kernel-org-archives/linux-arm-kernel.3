Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA97AF5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=; b=KylIU/nD6AwoYRVDEmpDyUjCVV
	ZYIsuLRmk+Dmx/Fpmb7rT5HC+fpgzDPzBd7tvRrgzboP+QeOv5ICvRrWkcde0Vj3qrkJDqL8FqCQn
	Cm591iApxKMMqej2RU0Xf/iCQGlaWkshZsmDYOOb/Gz2YjB++gsoUn56febOdBrBflJTR6Dqw4Csv
	sh4G070KzX7sRuWm8JZ+S1sLA4QVRbV6x6ExGmjeygxqIKVJgzASVpoyV1L1Cb4YAv4i+yHrcF2+c
	HoFZxzsRSYBHriEWSC1CQHz0MCa3LWsCttGO4ew7zoTmpkqfOq2Rmho2lkHO2qWaZVIkOUK2/nMQc
	p3XXGZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIg-00000007jnV-4403;
	Mon, 20 Apr 2026 21:37:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwIe-00000007jmR-0zk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:37:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so16147875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721018; x=1777325818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=sS98grONc7Gf8yuf8sRUifgcIMxTto7WoD93GDlixwxudR9f/EzE27+EUSPabXojD9
         zvx8GPpXA4A452LrWOHtHQU7W/OaKESu0LUm7cwadR6FER1zGrpGx7ztCGM8RUYTkeN2
         mAWsmh+JaA+23Psu6DtnolE1rD9gUso2u4UYuzvpHgkRWaXzRUVcb3fXwZ0aWaVOU9KH
         OXu9uV+ap7qg2wXQa37RTW1cViuRo+5UD+PFyZ4qzrO5fdOf6bTF194CijSQwHFsbfCx
         J1aISk2nYioNUZ3qyLtZsTBiYYM5uDsHZXwKsFS+fqueHN36ExWRMSA+AIWYHJRO27B7
         1utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721018; x=1777325818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=h8R/kcSk4DMUOtG4F+yGNmlUk/H5twvgWCd4MpEsm7fNCO6qm2aISlfQr5VFTS+Xh/
         5/ytAdU4Vhz4uMDtQaNHH/467Paul7Nls0Tyv24EThITQRqhO5v7wQ9g6A5a6cIsgYzN
         gGogtN6xn54Mf0iOwshf4l957vsyyLjVMBvgFW6xVBf0I7qrEdenfhi2vkKRgDbDqoOD
         8nu5ZmWD0BX1+FLvPMD0ezyyUNJX0JM/pndujLmRooK7HR5s0nlk3jUxxHXayfoH9YJQ
         OBwszzVTmdkFMBS6SMw2obD9wVcXMFKgF4378ZjxQj8+F3/aNWNRy6f3I6bqgVJjI+Z3
         y7XA==
X-Forwarded-Encrypted: i=1; AFNElJ+8akFKjUAZOtkit/asKo79KaqUKnkEYMF8Gy9rAI5oOnUUjcPzpQxlw7dH7wc/P22EN6GOhvDN9YsxUxLkiU3v@lists.infradead.org
X-Gm-Message-State: AOJu0YzULycPjJqK7iFqWCkcytiBmbfAXulKZRdE2P1QAYIuNFcb7URT
	r9I3SQnZI/28p6Zy02dWarcL+pKpCp+AjLO/8HivKcCT6CmkqGHlC0OL
X-Gm-Gg: AeBDieukmUVqwmBlzFMyPv3JFBgSy/SLQ8m5+wLs9rHOslYh6KzLtl8kNbLL5KMhskd
	1LdFZ737UZGzGvN0rZJlazCaEWZP2jmaavy2oWa/kB8irPcEVDdWhNjdSJYpbesB5f5F2+Sfwqx
	mwQ3PoskRcBFRm3aAtc3rAXdWaJDkto8Oqc3R4i2Vz/cFtGwtJopRSL5a9s15sXOVn+7m1InUcg
	tAk3xw/V6k2vgrznO7B03ffS/dGe1Mlk8YHlPlrOjJJPsWKPIl7aEs6jOKidSdW/PjRTzA4+j9h
	QdlekF0/mc8N2FMJVCmet3hFzDcHElw6hHklI6juFZptSrhFy2H2JIS70/tkUWfNZqSwmtuIDdE
	0MMUXnOqaBa+k70nt0kPHGid+RV0sJ1/TYu1+j3+R/zWZi/KqkkEAg+ER9kM8njoDDV8yx1AWlk
	5dmASlJ74GyclCMMJXATzkE1Yv3BW6YWcUP0Ntd+Vb
X-Received: by 2002:a05:600c:34d3:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-4891cdabf13mr74014935e9.25.1776721018309;
        Mon, 20 Apr 2026 14:36:58 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:57 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
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
Subject: [PATCH v5 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 20 Apr 2026 22:30:01 +0100
Message-ID: <20260420213529.1645560-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_143700_295905_8AFAD580 
X-CRM114-Status: GOOD (  10.64  )
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



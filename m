Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC2F01830
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWHYFXyM7zqNoEaGGLabRt6WO8B9aIWRMhobpXYX2k4=; b=tTh8kYb3ubhb6/8yRIiX10nhkx
	ODrLzd3OKzvhxyAEEBoDbev8+RUxsTRGYvF6S1UF78Q0Ote2j4EvX5zFjXskunvh1aDQUjz0QZhu9
	oSttKOYnhAt1WqD1NHmeO2ayBAWc7Vw/7VimmDfWmKNN5W7UNgCsun8MRxvHKqns8l4hkZ/BtQP/O
	a/tez9f/9mHz0U/yFptRXH/t4bZnsFBT25Tb21QCqxTp23JZu1moWTX9fuykfSt8wtxtXKqe1QPe0
	jktJG98v5untdRf679aLV/KukpZPoxZLTpJ/jz5em7pPCspm+Elt1ObYqLhDiDq4HDI8t2tG1/2VR
	mz7fPdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwe-00000003bNN-0010;
	Fri, 06 Mar 2026 12:06:16 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwc-00000003bMA-2LKG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:06:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439bcec8613so3996878f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 04:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798773; x=1773403573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWHYFXyM7zqNoEaGGLabRt6WO8B9aIWRMhobpXYX2k4=;
        b=YPa1Ax9GFkOmShmwFFxOfHwSCm2CmTXXSq4aDgJdoPTMnBHmPNPXswEeH4iOsTnjJM
         owEMRxs54/deeq3g52BK8X8A9rbUy8u1J1uorQ7P+CQ1CHlOv9ne5JX7+VYK7vyRqelb
         KznWCVCQS0uY188UWiEP45qh0LmVi4LkAxtKSM/4jhJB8oZuxiz6CCKqyTLk2MU0c2Tu
         ttMth3hbGkV2p6HvubuCwUIvc6aUDexd6FfeRsPaMzHymgWAKWU1syyBBBDRloJBAFhP
         lWucHvCMEY9ZipT9BGYXTxHKbiTxYmcQE/VvdkrX3+t0OLRMZ5culwmcV++IwQYtKt1d
         mZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798773; x=1773403573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWHYFXyM7zqNoEaGGLabRt6WO8B9aIWRMhobpXYX2k4=;
        b=wO2axqshQcJNvMZwqKKhCgQ+vC/lAEJoA83CFFLZsao/nOd0X/x5trwz8DiR6usv22
         KZSshCv3mQ4J/gETNaKm4K5hEVlMXs1y42PfvuA8hyYqWZKIvqxNxMCIX/kHQBnKi38l
         kUL5EfARXAb4yrHzeoGe8Pw0TkbY6tShs/bxqQB/HGsrY+zcZwNqLxGpNGNnV2dZMsTc
         ke6nfngw9u4wkPcdXmrizNvq3y/v8r1vvqUbJuA6FrruJ2ynoMVy3syXK2cZvWi6CVZa
         mcLFpX6gXi24iTDTGRxbBev083wK/dljKTXnxPPC8g0Y7nmilIqoYBJpOv5hHu05vqfM
         fHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxne9V6jN/cy6GDz1TXvGN0mV2HnK2vFGDl7SQ4Rxm6TeAgb2NIa/RM8dmKWynyx+mrygG4qflx7czSq/lH+UB@lists.infradead.org
X-Gm-Message-State: AOJu0YxNWY6kP+qP2S7mplxsIHFSNE2ugtU3ZzOe8/DYu+EY1AcSB+pi
	u5TXAQmja776h+yr6J5fpQGDq5mE7spEISd1qncGR3EPxg0ZR5EvK+h2
X-Gm-Gg: ATEYQzy1Y1SKG47Ptabgldz3JKRHE2GlfpC5eW5JI8J/C/cToOL/3N5A6mUgFgn/E7c
	7SG7S/V83bcZpjF6ZSOK2dBVhQwyrO2ORundEWjr3Ae7cLebhIjtKx5aPPE09OS6QtyAeZz8QiW
	wElnQd7yDhUU1jJg/uGHQuCoYqGPTgJBPUo/mIzYTyXydaOQVJdRAslCrMzwDgtfu0RY/VxOEwP
	A4uIBAp9Qx+1HP79hPm2+HxKEpQt3MTmWfspRmPSsxd8Agc54mWRoe7uEmooTRdrKTG76MEBHjx
	XROlOsAXEwZ46+3sE8kNGPkxp+BXIyRiSu/qfyEnDk7srPU7gLSfuiA98o4R/vbXe77zwd9sxEk
	opqzcEHnLnyMmkpSKp/Wxp9yFf3W+BiNSffBcc+JCvdtxH91ttA/WVQMD98J+7oj36qrs5cDjRV
	/yOxyt1TVsLvIwo8x31I0J4CvlnVrUmQ==
X-Received: by 2002:a05:6000:4283:b0:439:b912:7391 with SMTP id ffacd0b85a97d-439da34840bmr3145089f8f.10.1772798772610;
        Fri, 06 Mar 2026 04:06:12 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:06:12 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/7] dt-bindings: regulator: add support for MT6392
Date: Fri,  6 Mar 2026 12:03:06 +0000
Message-ID: <20260306120521.163654-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040614_622680_69FB33C0 
X-CRM114-Status: GOOD (  10.51  )
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

Add binding documentation of the regulator for MT6392 SoCs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index c358b2f8059c..bb1456d01ba9 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -100,6 +100,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0



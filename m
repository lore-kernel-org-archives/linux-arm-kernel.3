Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44EDF0182B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=; b=xJ/iPeUPt6qdCxjQkMNcDm18og
	BFq33lx1JxRiwpgmgN7ncVpeyIS2+V7RtxKT+O3LMF8ngx4ZR+/ughdeanNETWRMKccCe0KeeKn6R
	lP83Gz3QNJfZLVXgQZNAyZiNYYDJPcNGuHR8t7ShsDgVz+dZATmYZjSpf25f8BuSDlA9XBeg6vo6/
	e0LIj5T3hIXW4SjvZWH4FiWJmo1ETweStq0WdXFnQsTlmSNIc71crztxYCa5RgDtXic19B69VE0uo
	swRUXZA9I809V8B4xGBTRESF8A4BFTubhZD2c89SWIohQ8o+FKFriPrRsNTkdrMVXJ/bg8u/Sox+s
	Yp3adblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwp-00000003bT6-2TZk;
	Fri, 06 Mar 2026 12:06:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwn-00000003bRQ-1bSG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:06:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439b2965d4bso5026130f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 04:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798783; x=1773403583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=lNf7gjaaBEWY6/PVplRVf9Hpr1vIQinYzDTWDfQnFuL7EfkB7jdiSEHxobg9zWb20K
         k1vDLECBrzokCOQO7bU8toGhN3E3qPhLjZg6wRnEU2tBrcJ3sesl3H9E/YdQOKhBIltq
         Q8S2XviKUeprhly3mH1Vn+NwADT+vQlc45ZjYYS0mDwgJnjenxAGpaNiGn2jzB1F6aa6
         J/y6YUzcMrccL7oPnq1dNN0VVjTeCzrnibfCDkq1HyOjCLyfksRHg6xLaQUgZFlAJ/U+
         cnqg545WTT+TnzG4k1CsB8jv9GnW54fu5mKsmZmRvaMgl4Txjqvgr6cCEu/9r8zfe1ZO
         GW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798783; x=1773403583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+y0veSsgUsUJmnxU5xqCTTpBOt5TLJfl8EzSd1maDY=;
        b=uCy87fzpnkqqcQqHmPq/SJBB0KoIv+eVH7V2cELpGuK5ZL9sM+1E2aURB59G/4fhKz
         HDi4LmaUm4mOn9C+iPmjmT4EjFb0v1/kKGj+sI8Q8GFjCKndfu8EfBX4kg1U/65FkdQ7
         TDE6+PCgXtmWt21uE5aDes/Ozh36SixQs0Z6HZsmGK+6rXgTmAMTH7R2lWYVfHfDIBWY
         XXrofu9p3Hqy5w+R1s7thfLuYG8ee6X8kiFCVq4C9fc9dVAYultfZC6mhxo760QfYazw
         BNxio5dj1raZ4A8bb02QFvElkKaze1/KBbddoheDxEOCq4ULbXlAYlgummDd1YfMJqBJ
         H/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7L5vyS7iL52lEUNQ8YSvhTW5B3ynEqyiu0E7OFMdDkqHce96pI2+4tdlj42ECHkkm/RholWUDkaD4jYAOE574@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuky8L2qOn+0fhbIXTWpJko9cGYxNX6rKDcJem36Lhr2rcEwRU
	1szAIP3uHcCTAcpoB1qXIvYyiML+PuvbvLuhs8ZblEzock/JjAshNtGb
X-Gm-Gg: ATEYQzx6Wvho7ZbhJzXQO8RxVbYZNEO0ZaJCuKWX323nzwh8d9NMfr7rkZ0Vn486HbZ
	B5LrxQqlO+7ZyVEmZKtGTTTdsgrENNyUD9hfinAVTFLumw8HlI0jj9rriFmx2eMSfV62FGfwGkY
	Rw3MImRhYTZHAGrOK3zgsgeaPNUD2wA61qZJ+tz1mLjZ7AT1wkhBNOw9VWtujZbgTa++X3KtZAu
	oV9j9Tu0UgTenB+eMzpFNLaeyxlpyI93T0U6Ni8tFE22NWji3+VPHKoX/VXFLmgvzKOHOvrcROG
	5b6rdf5twm3RsinssoRD8YcHqoqNVK+49W4WbglNU5xkj1pUiksf5dcwCUCTdxKheNTG/5lu4wH
	EOr26x8AU+xysKJ6+bghyajpaYNpSKMcNC+K6qLphZgN1suIXK5X++WQoep0zgBf/09h4C8PeYq
	Syn1s9H/FC4mT1M/zDBZw=
X-Received: by 2002:a05:6000:290f:b0:439:b715:6f49 with SMTP id ffacd0b85a97d-439da86fa3dmr3098642f8f.59.1772798783337;
        Fri, 06 Mar 2026 04:06:23 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:06:22 -0800 (PST)
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
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/7] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date: Fri,  6 Mar 2026 12:03:07 +0000
Message-ID: <20260306120521.163654-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040625_437089_BB7F398A 
X-CRM114-Status: GOOD (  10.13  )
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



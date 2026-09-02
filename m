Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD65C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=TMFikeOPykfoyNaOisHF0Gz1xH
	qikdG9qnEDBBX5kcQjWuyOYzRw+EaNHik088uMMzwFKLDwPTXDae7BEUvnv7gLdcKtdAzDl6d9rpo
	mSyhXKwcdorGpvCPDaMgFyAH1H3qI1XlpmS6J/SPxz5oAPU/VdpGNWiEBtwnfARip50ozCRO7wNUx
	LVSsVTNxc6wVrQUiVK9xdPIeEedCAPE3NZUbqpsUGuPpgnGQC6P4Vk6Pgj5WRhzJbbysh40A6v0n3
	OOc3S6YsRbw/uifPZ1TqNgYm0XsJTnVxkFR81ns5W7MQefpl6lRhExhYYCwWwD5Oihhn0TsDxKc0J
	mLyTHI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qjS-0000000Fj4t-0dDi;
	Wed, 02 Sep 2026 19:34:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qjM-0000000Fizc-1ssJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:34:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48436251906so1563605f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377682; x=1788982482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=CDiDtsznp2cy0vTKC+aw3C5/EnVpTf09Q3KazOuiiv26z1Q1yQdb37ZqsoM25KDuGO
         dS5ObcBZanI4Bi9V4M+766EZVOMFasJWBNnW9Uu5Bn9LWHlsB0kPJwapye3Y2YkalWcX
         x/G9Dt8tcfMytCsC0fv3bSgUpxuhQOjinrzeg2wEpL0HF6rp++xOG97RLbfWwFzmuXOf
         rnI30ByNkc2hslY9e98zJFRkTY4H3BVIXOGatgeEpnaSYm2WEgouWmyHt+Iaxni5va4w
         //AtXvf38BxSSWYwPxvGdurC4Go5iSnr3VXTbxn/SQdYcXqaYM/ElO2oB1VDrXmiCcYP
         6gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377682; x=1788982482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=UKQVaSdRSIe9lkwT0AoKgQWWXjlqvZuJB5TpC1pHpBVh7Tlgd1lXWMVGRsEpsaOKMp
         5UzlP0Sg7cHafkwyKJ1bNKqDriGPOwba9MP/mGv7q08pUAX820v3qtcljRwphbT4Yqx7
         aPowEE6KlIdoLrdLbcUHzp7E7kqo8lPDTwafjXe700dR7mW/em+ZDWr0VAHoB50OBaol
         Z4peDjrGk7/9O1xypQtk6iYwcvvrUXm2JeHkdS6Rz0JtXxXGD9+Le6W4EnfJ10QXRRG2
         1JXguqdtmdPrSZ3ASzwRObtUOiZ0A1HFdk4cG1hSxVn8XHPIt/2c8YnMVoqP4SPMVPNL
         cg/w==
X-Forwarded-Encrypted: i=1; AKwUvByJLud3GApd2fr8z77QJhgVfTQDk0mtybacjy0Dw8QATFpdF3rKaMeHczy/RdmvxPTD88E3QQCuA6yF1mvG24/x@lists.infradead.org
X-Gm-Message-State: AFuF++lLel48VzlfBj/bz5FlQpwNFlC2/mWoTdNqUvRSORvfuPjtuMYl
	lAsLP30AuGbGBU0jUKYnzetagyNZdQXOPuFvOKNXFCxHNE6Yr7bnWncy
X-Gm-Gg: AYBFou31lx7BixIWeKa2M4AQgQXBsWuTKHbqwuz189x6rqgawaay3tUd5YiMB+8hepI
	ImjVu9oWikpBLvp5kP+CKNSeUppVBi5VEfjVdz0Dmozk5+Euupt24WBSX+VeGc3qbByFBNyVCQz
	6gtjuqJEuHircCw112p5JUUINydcHgHjvvqwW+IynQbO2UYWDvL9sXYcLkY3o8v44wRy4ag3NkA
	gwg5AYR9LmA/BApz4DJ/ajkxmFavEq4uwmVidePcjassOJnorme16j2Y9KOkGMGWBVd06DZNNMR
	yezVX1+tD/Ocuj+AiyOqbwqcOhEoWtfpT3YGNSXcDNPmMidMuU8zVosy6yHxR6TCuK3RZAtQWGP
	yc7fSWtpB+nHKq3fWU2IYIiu/mpzerHJxldXPMpynWmgC/7gNFi39zITMmaWWOQNtf5xx57z7ei
	7YYlxxuzK9ao+pIvBYovrP7uVDlJfDRJiw+/eqhLsw2rNhgaYZsbzfVW0X
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr14997817f8f.19.1788377682430;
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed,  2 Sep 2026 21:25:38 +0200
Message-ID: <20260902193351.185771-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123444_510960_3E1414D9 
X-CRM114-Status: GOOD (  11.16  )
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



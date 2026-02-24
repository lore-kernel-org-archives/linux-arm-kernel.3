Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A8EFB811
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPkLAxH4Z4tNezijDFotOtHRol4uS6AuzdUXZUwrd9g=; b=VF3jxkKzUg5g4cRFnSowYvWIEC
	MBOjRXTCQiLj7P5LWElJiF3SClfFz7m9B6YerLtR0foQJ/3mJOsumEpD3ZRsOE3X3QiVzDafvDaEY
	tk5LQpfxvMg65SnXICyWtqyOEwUvzZIT8YkWRryG79u2C/8VU+fHp/fkHXHsDkn9elMKgPar+A/6+
	PoBvmD0RgkfTJfgWwwZuYa36fT49kauAtiJou1aCBsj/7iF0bmnE94Edfnex1Ypl7iwm4Sd4KM91N
	uz3PS9OmlbhzLYIKmTOqq9XbrAEraNbkv37vuJg9m8VHcLGh8zd5mk5+Tne3N/ktNwPNeALNJywzK
	jS7oYJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunkB-00000001dqT-38hf;
	Tue, 24 Feb 2026 08:26:11 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunk7-00000001dpj-3ZtY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:26:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-65c187dfc82so6310197a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771921565; x=1772526365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPkLAxH4Z4tNezijDFotOtHRol4uS6AuzdUXZUwrd9g=;
        b=cPX91si9UjhqAWlHkNL7Lli1WEj4Q4siwJpE1TtNwhLuU8tHrsY5ejtqe4H2MJDMwh
         DKzcDCFMyDc8RVwuYjra2lJ8ZFGxmzeV1E/0AjfgpNy4D3ZGSNAC9paIjDS3IwJlpvUf
         GtuWTQK70VZzSpatIkS1Y3r4WUypy+m4kAc0WQY9Qz1NPYrcNB8yr3AG/taOl47XI1J+
         If3qpwcGakUNN43SVEZaYYcHzRkiVI59SN/LcZ5yMCzvugFYVxoxSSG3lds/LeFUYTE3
         No0DUsUG55/jkSv/1PNb69YXGbxgn+vM0aMaprBqLIxl+5SpefZHYcjFTnkkKG8fEMAf
         muYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771921565; x=1772526365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPkLAxH4Z4tNezijDFotOtHRol4uS6AuzdUXZUwrd9g=;
        b=it23kSR6ceh3NFJJKAPh54MfCm5H9TeHgyRmcZNDm6y2SL3qUqkwG2SARqYb4oRDgI
         b8pIfAnPlWpyoU9zmtDUL8nEQOxTXRC2ARd36tYBM5C+gcTO7fYKnNZlUsGrOkiqRBcA
         RXQ9hZte7PrX/vQ1xm8fSo7wmC2v7m9vRcgnNgZVZmh8wW7XJUxCjtbNWcTsutubO145
         8pjBCsjAy4ZhE8b35oC8axadkGG+NU7XJc9jRixpFXXrgmVaf+FDpZqanrPchppYTteY
         rAF4wETo+IBUSJ01EIGLLK6Gg2gI4vRxqu/oaN6291dPKViMF+boPDSUMLprwOD7Xcnf
         qkqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6makulqQ7dsKsc1fql8ARSEsGuIYn3rfj+N3GC4lRAfIkiR0ovJp2GsDwcQ5F2IDYC/4Zgx6G7zQsnjbaNzMM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx0iWHsine2sdPNtOEc8mrdvwmRJrQcnUY5E3rBC16wQfGNEQ9
	BxeP486Y0/xuVz05GmNGGH/FLUqGJafhHZMwCe1MELAFS3MYspEb1XGi
X-Gm-Gg: AZuq6aJTlNc8d86i9nNE5vewa0hU5ThSPIzFZsntt8L//K0MX9TBEqKnYcZUVSrnPRG
	wTRdPGmE8IwpT5aV1QyGc1zUi75eck5an7Xf/+SlzwjR4LA9qD+EePyNQcpyA33PTRBAMqcwC9z
	O2zFRVLGqgaB80jF8HfrERsZNxa8Z/MeZ17OQn29pnckNz8EbGWkpHRp3QnwBSOMlicTBIRwqUq
	IxfDAPLxNFP3TqzeHWXREsusSS5fCGnmYCOKo+kjKNK/UXo3vAQTw3KL3q97eF9W16fVEEluw7k
	jptNzcxy4QUytEcqGSRn9Hh5boE7krHk6evjnOrBURQDIimkgmSlEm/Adho7YOgT7m78Sdi/1O+
	zcBAzYL2LCVLbe8sgGe/AzxSNukdZd2IsUl1HLqx7qC62FvVM4qWB96P1NM+8BeCjxNgILMaRDQ
	JBBssEExvRte8IbPm9QuiF9VZf+WUsvtj+aWhzA7bIPZpsE3fxjPwDpjzuwerXwAew
X-Received: by 2002:a17:907:25c4:b0:b92:c91b:57d9 with SMTP id a640c23a62f3a-b92c91b760bmr110934566b.58.1771921565148;
        Tue, 24 Feb 2026 00:26:05 -0800 (PST)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b92f9b0463esm33521266b.2.2026.02.24.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:26:04 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RESEND] ARM: dts: mediatek: mt7623: fix efuse fallback compatible
Date: Tue, 24 Feb 2026 09:25:41 +0100
Message-ID: <20260224082541.7938-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_002607_898312_A81EC152 
X-CRM114-Status: GOOD (  14.01  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Fix following validation error:
arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
        ['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
        'mediatek,mt8173-efuse' was expected
        'mediatek,efuse' was expected
        from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
        from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#

Fixes: 43c7a91b4b3a ("arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
It initially sent this patch on 2024-06-17.
It was reviewed on 2024-10-07 – 2024-10-08
I pinged about it on 2025-12-15

I hope it's OK to resend it as I believe it's still valid.

Link: https://lists.infradead.org/pipermail/linux-mediatek/2024-June/080475.html

 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index 4b1685b93989..71ac2b94c6ba 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -328,7 +328,7 @@ sysirq: interrupt-controller@10200100 {
 
 	efuse: efuse@10206000 {
 		compatible = "mediatek,mt7623-efuse",
-			     "mediatek,mt8173-efuse";
+			     "mediatek,efuse";
 		reg = <0 0x10206000 0 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.51.0



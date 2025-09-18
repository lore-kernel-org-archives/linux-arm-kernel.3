Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFD0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 01:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+l9K23yh6l3TvW8w/MfzE09CsujDDpfaYqSz07+eVdQ=; b=Ou2uJ5QSAii4meJHPZcyFBHkaQ
	Gx2wwMsrCj5hNc1OAwUx2/hX4/yzVlRHQFFrgIGOTBd4K5HuPSEJlucDII0bxm4znChq5d59GaJkD
	lAxCFYMptxQeTNLsZ8FbeRAM08RMqC/nx91QFVyHwsNmpf8+9qtEz6aeR3+D9qUTv05N61a6m8jZo
	RNT4zvdISbTt2IqYRtUMfVANs08EdBbN21RsWhJMpcDMJY2Xo6tDxMsF8kdToyiOa1P8dukAds/Js
	V1UfGOJcUJxeXsnyrzckKVTsYdMHCD1HhDV+pwPjTVam8D26zjXXqZfPV81WAxXbKNsHssYlfmYVM
	iNk1JZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3gS-0000000FwyY-134t;
	Thu, 18 Sep 2025 01:43:40 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz3gP-0000000Fwy7-2KZq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 01:43:38 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4b7ae45a91cso2895861cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758159816; x=1758764616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+l9K23yh6l3TvW8w/MfzE09CsujDDpfaYqSz07+eVdQ=;
        b=flgzjU4sMkDwTsQKk8CW3Oj6rufSzIOoDIkYhW/l8p9A03vkbEUqqd0zzGXD4JOZ2Q
         Xu6USvFAFpoS/qnXPN2X7rIYpow6J3Tb50bxYnQ7DZz6PXEb1xYF9lQot2Q4mflusUsQ
         F7pKucoIPfBOgiFD0J161kSK0e/NCr736CWfkistJpQpScGP9gnh2fsL3vndi7S5Czmv
         OLk4q0TeCAPU4agX2Gg/SltucnXerUUcburaoI40jJyo0V8TxvgBP/IN2PALiyOoQLcV
         ZIh1ErUi9B1ZwCdLxBuXS546p9Ehrx/qUT1sctI4m1WIS5KTBz2w5R87fLHvJVdv3ZwI
         DRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159816; x=1758764616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+l9K23yh6l3TvW8w/MfzE09CsujDDpfaYqSz07+eVdQ=;
        b=dRyWuooytZid1WUptWfWFAURhMtoOAmZL2yMuKIPa2eXrk/0P0OQtZpAlCOw9T/Jkz
         yV6NdPgYkcvMjzqyzt5WciZs55MRecIjlNNJCfJsa09b19195Ik13KPIbNBeUmT95niE
         80nINqcgZ+ngZA8p0LFq2a3egwuCgIcVo8ZN8oFz+1hAWxuIHa2E1kPQ5+lU01zCj/Gf
         uIen4EgZLCDsVTH0bIbB625gqq0FbUao4KTv5bsYbSj1HICKRKBrcpddzkhapCOhXyY+
         IukaAidFNUqo2euCpV3hUQpKcIVrXqyM1K1IK3eojBnc1G4L+zKwFLLc3j9TDgpLuG9V
         LEdw==
X-Forwarded-Encrypted: i=1; AJvYcCXOY0XzMXhxvwpFYKzhabN5GIKmH9gGfeOF/CDx+6bNdh3DFxnVCDH0/uG5VMbIdEBen4yz+adstDmbe8EWiHWA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv559mc45o0u3n5l3LUtpcRWjHcdK2LuNEdoL/Bhg7gTZSSTkB
	XEK7zoXlqwBFNaQhL2KIrjSYBlzxES/ZDOG6WA9wVLIIB1Wzc0NJ+v4k
X-Gm-Gg: ASbGnctjta2ggkQuq7UCut0nP1gf5PgkAW64l/7TDFpi+CSZz6Cz2KqYM48rBmEVfAz
	2nVLhkyKcswYs2He7Jg4Qh6crtyOcQvp0LFK+973gXSym5ELK9LFrN5nj9AUYscVSbK0NSI4RtT
	+BSJCFY/DRir+97GyYBXovo7SPqZ7CArWS7rrrbd5kAFjc3j3i0zOfJYfDu5L9EtZMHdOgADLDm
	B44kIFDR0UC3vC9Afn1wfpBjrms5O5OoR98osALLhBwrXE0Gm/iHy22N9B06r/RG1WLPvIenYpt
	aXArGwTbPC3NmT9c3cc2S2ZEA3IK+cDWZk4Kay77FK6f824zCslblmN+necMwPQk+tB9mjd63BH
	SBt/jClpxn5GnDrGAMDAhmSBKHMxodiltEIQ6BdRq9a5TBIbtrYDPcsaxOg0=
X-Google-Smtp-Source: AGHT+IGKxnkq9Yna25gDDHM/UBKhOjdM3Em76x+D0aBlAB+6RbOzXElaevH4sYxDOsPcW3TRYXULaA==
X-Received: by 2002:a05:6214:3482:b0:78f:5313:1417 with SMTP id 6a1803df08f44-78f531316a6mr29850696d6.32.1758159815844;
        Wed, 17 Sep 2025 18:43:35 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79346930bbesm5191506d6.17.2025.09.17.18.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:43:35 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Wed, 17 Sep 2025 21:40:52 -0400
Message-Id: <20250918014053.696710-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_184337_596642_6C8737A0 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Add device tree compatible string for the i.MX8MP FRDM board.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..8bddf1f8a78d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1



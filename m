Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021E7C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lou8x/c5K1Pc7pqGvSQaOA4FIVJQDpoBIG0cidJwwWI=; b=QAYu6PPhuiz7kSTPeA1uZzpFz3
	i79NR3X/H9gwe6k0x6fkLWos0h8P97laYNDmj06WzM2kEar6JkzW3e7AifvmRnTFfqQsKzzPtv/+6
	lkXdXZvOj0XKSX1b5mJ3zrYosKInJJ+WBpBT7Yv6fphbWA7g3YIN/tu/koWUJZolaexs6i1pknT3i
	2y8P5B3e5KGPGbeHYlNmIBwtT0KEEX5c2qmwoJZHjg9LpdgGiqvVTGaaTMu/CWiV5iL9DMUjOaED3
	9AxrRLsPL5laVuTMy7e6jlnCYDDG1fyOg6h5rO8M9IdnBg7b5b7zH1N/w/EuBb54v79zC1tZp9wQC
	UGsK0p+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgyx-00000004REu-3ObF;
	Wed, 05 Aug 2026 19:08:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgyv-00000004REM-1VYD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:08:50 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-848743155bcso721534b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956928; x=1786561728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lou8x/c5K1Pc7pqGvSQaOA4FIVJQDpoBIG0cidJwwWI=;
        b=RLHj1nqZren4ZP/3h0om8klXVo/8Jgjz6ZJIrfqmBME2HyqRuW2xthg9rwymvVQxJo
         LFA08QtbwKfafO0PrNucRJUYF/G+bQY0ZLfo4tj4WgymgYkY0RFkdXF83kkcqiHv0/xh
         0T/giTllaBIyNGUS5du+vI2hqPMR5lQ+inGQgdZ3bUQ9lHfA5lgceaYSyLysFFhk3NzK
         Hyd/ZnS9GVVdatSW7XWBpRErXB+MwBy1/oVKy74SZPlQjCRMkDQN+fMMIgg631/atCY9
         f+7cAsIRxt1NHAkTdOUHONwM6m2pF9ntEQJTmgVaW6LoPUWPC73mmRvRZ3bCFwiZ1ZZj
         2G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956928; x=1786561728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lou8x/c5K1Pc7pqGvSQaOA4FIVJQDpoBIG0cidJwwWI=;
        b=B2SfrmO+yZG2novKdAZH8995lEeTqjQiRjrZ3Cu+3zcfOkHSIXP8+lDuGPO22jicsT
         /uKnNcUazrbB47Qm4bAjOnsK1p3dJ9cFF5JwuE1sgovRxl45qpNC8R9bqGMMAL0yQCyg
         +deR3I588H5WiikT0VZcpqlX98E0KBK38+7YmzWFuqjmh+EmPhQZ2sw/6ZD+Ev563/BU
         ma1iuYr2cdi5vLDFIjo3Uyr/Q3QyhPeUnU6KgyIxAx2NAeKE60H0YC/Nbyo92t0kEQSj
         B7qto5kamIiDeH2htfmxI4TCvCSLTmdPSoqkOMShb1BtJO+aK1JFlexGoTJdEMQc2tkT
         INBQ==
X-Forwarded-Encrypted: i=1; AHgh+RogDxQBeVfwyEqK/5CtsZ38/uRhGbYuNkyKMuFG/8POM3and47s2Ou8yFdxJmfxiReChgFO7H7ox6T0YjcIvrhY@lists.infradead.org
X-Gm-Message-State: AOJu0YzHHsZsyJif9lmIfhof6TjW4s3NJ35qg8MryWPIr3/aKO7RW8eV
	LVsFxI1LXybapYqicpYaqbbTfxj1uBUMPOTm1PDZxvZKaHBvAU0XTMEp
X-Gm-Gg: AR+sD132WA4HItOxcHGb08fLj+3fT8I6fusygF6AIPnC9wvnaZ/Gbgjo2LS8+8pIuYI
	q7bXmZ7brB3QVIFWAjfDIRS1oGDGAQV5KPPD3CWL8kFVDo0QrBEeZMquxUZBqR2HaqYfEkPt9Ys
	3q9KXodpCi7ShnNj+TiH3saTD1rReG9t4V2Puobtb4LV6httsL2LydBRcTY+a+dPWPnh4/qmqdD
	OmHOuuImTOPt1jmErkNTcVq2vnOJugqoWM6oqGRXEvFoS+8KFYi+Xlow0WM7QAZxjouxKAHe3JU
	qZ1TBtda1AXu4fXI7OjAnxQXzyeggmvf29kj6tFdHMCoG92u/dNfVNIn8sOZDNMsOT7hotE3p2G
	HXU61KpMVgF6osZMGmChU6MXGyqzp6VOWSUga0lGSocVE3TGsc6lrSdZl2ndfwG/CyKcV8Wv7aT
	C3FSv9Imv1mMP7HoLi23Jlf7sZYXu7xuCriupDYjK7fylrs6nGooV4I3BLjXOaYSaiGLoa9kXay
	v17sFypA6SK2THk+xTuZd0yJLtIHjyEYyiQozG1kadnL98h8SdDA0y6mUuh8MSJYzZ+13LjkP3c
	j1HEstjSLQk6zeVYZjJTjM25kW15a391x17RFq2wfG1P9MRe
X-Received: by 2002:a05:6a20:734c:b0:3c3:91f5:82c2 with SMTP id adf61e73a8af0-3cb85e788b6mr9871329637.16.1785956928400;
        Wed, 05 Aug 2026 12:08:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707ecf6bsm2122724a12.10.2026.08.05.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:08:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: panamera: remove reset-names
Date: Wed,  5 Aug 2026 12:08:46 -0700
Message-ID: <20260805190846.8312-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120849_415748_52286CA0 
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

reset-gpios does not use a name for GPIO acquisition. Fixes dtbs_check
warning:

switch@0 (brcm,bcm53125): 'resets' is a dependency of 'reset-names'
from schema $id: http://devicetree.org/schemas/reset/reset.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 675967a1ad0a..bdbd0f097925 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -146,7 +146,6 @@ switch@0 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reset-gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
-				reset-names = "robo_reset";
 				reg = <0>;
 				dsa,member = <1 0>;
 				pinctrl-names = "default";
-- 
2.55.0



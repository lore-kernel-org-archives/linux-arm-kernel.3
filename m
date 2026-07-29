Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E246C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 22:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mrGwNQ0lfGtW2fG8p0q+5yN5AF4lKFQId8OOzJuDO6k=; b=mHCZfqabq/ugTpuYcp1HnkxRPA
	H0VnFHtBmePS1wNkSwYR3GMPnThky+kab57gJ29N+m4kjjHgFAwh0KpXSt5gT/fgpCQrXyveQyO6w
	lhClRRxHpj+Hz3yGRTSxC2zaMOwAIevB8fv4gBonzd19vVQcE6OfXlKJjpy+3o+Sv8lkxoHju+6Kg
	/DgkbqI8mnDBS9r0nFtiXuUpFj9ZzIUUT/T8tni6hF6fGs9v++yMii1U8dOLCxGgTj6EyaoYP3rBQ
	3r1+PxmVYJ6834nLJN2Q3O18b7tGww1TJS1J4bXz3D2Hs+l4ouKOlJcMO5pjjw4Hy5BdZF8Azkk/t
	Wra+DQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDA9-000000095FP-09Ti;
	Wed, 29 Jul 2026 22:54:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDA5-000000095Ez-31Dh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 22:54:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cea3004256so17927355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785365645; x=1785970445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrGwNQ0lfGtW2fG8p0q+5yN5AF4lKFQId8OOzJuDO6k=;
        b=NwCqlm5zq3iyl5xAL03OaM2rlZAcuGvRvS0Nuq5gUqgvHlMWwHAarvY0YPGSUClrOA
         ICE14CLvwSseXHfrswrCYp3wR4zAQWZrE/Kk2VNSyNBm+JUD5HAY/4s3kSf1RMXryOBr
         c/c/ukxv/mO49W7RN1yt0wbNPMpUAtz05Uam2BPlRlvL92VqMcwAltzVN1VpWFIHcU1I
         wDYbpDat+xitF4X3fDpSpR4o79rC0NXQqyRQa4EDwFAN6Rbxr8rq8m/F7CxZyWoQQaDc
         B8KpL7wtNp4EpGvG79koBEv6wlUnSg8Rg/9/9hMef6GMUuFFQyZ86YutUoxXaeFMllpU
         SYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785365645; x=1785970445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrGwNQ0lfGtW2fG8p0q+5yN5AF4lKFQId8OOzJuDO6k=;
        b=GNVW6nqG4Ag1UI5mxvDFMATA58W/54djOuWeaqwDe6tgAujZUX1JDPqk96IlcoiCKo
         NwhVpuV9eCgO8j+pN0ZWvsIo/D64mvRSq5kW+uW8YYcDuk55Xhdqaanqm1lXammU59R2
         TX37WZ2osBnKpTvaWA6iZHlSaK7yU/2UWrpIk8whpbEHPU1hL2SkhB9vaHAt+1C05mcq
         T4h3Pl6cImOE4/4teQg23Jlzv6OetV9Dwdo3FebQ4NZOAIgbyFFCfdnI5zvAPfzujbz+
         bqd8Q3rB7bjo4fxz0FZwG4vUQN7/hFNj/3fCA0ivGEwoooteWMaTsIFqN2Eur10oZ5WJ
         06eg==
X-Forwarded-Encrypted: i=1; AHgh+RpQVmfLERRidnc8nci8qEn3T8IzmB5xOlLIsB/wapv6dLfAga4tQz/JpT5bC3nwaHldfHIE0yKly6lOPHlsIPdP@lists.infradead.org
X-Gm-Message-State: AOJu0YxHmUqCml2BKFsYvOmrA4PMJio0iIYPcrrwJxGwiTCu4lwrsWFQ
	3j0EA3IgN4CLjn4jWP8gpLl3gwJnCz0SrFlgacaJ+63faRCS2COSbrIR
X-Gm-Gg: AR+sD11jRfgPP1l8h7GyRa5WnJMZfjuULo1fKHfP2qS76X05FJ4CLnquH25U568p4G6
	jvEPt/FNOYIqTLmuPxJ/BQO/vmY7y3ffZvmssvsaEeS1p9Xjjcq9zuxqWeSQ0x4OPlF/2+LKyt7
	StxOtfdOi4niWF+NaKbY6z9qlM4b4mQ4Ez2Wsw93PJwnK5/kmz0JJIv/2MUQF3D6hgE7iMsdH4q
	uTxneTb88zLZ+dRt0FFvXtHnmpLlRPGaY3h00ogvfpF4MaEioY0D61E/3Ui2uOfHchgcvrPR/eD
	oHtcBrW6HIlS1SwwXdNIKTtGS2yaQxcsyYu3/KUb3KrNElI4otJjNzJFiXhMfCVFxl21lsfHNhK
	0J0SQheFO5laXr2brGWleT81cZ/3BJDaxFtkbXQ0kPKAUWJGMPnPOB4V+U74SgW8Nc5+iJQWpvv
	FeNPeLePD02SrW6A9PYtVbwVyk28TaK+mFzOHlSh9aAKZouUZ0Sb9OWnhtDTlhdvP5FFAPLwRb1
	LJqW128q1wkWY0xkUS8qEdZoUnnbHpGSAO4janFwIJiDrLnMLlcOcMHUSrK3L+F97PtFQMwU9HD
	NwI7nCMEbMn3f1e2D9gu6YcogZQq3+eDjPVEgQ==
X-Received: by 2002:a17:903:3c24:b0:2ce:b7b7:30e3 with SMTP id d9443c01a7336-2d035be663fmr2561125ad.17.1785365644825;
        Wed, 29 Jul 2026 15:54:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a16088sm17373155ad.9.2026.07.29.15.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:54:04 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: panamera: add phy-mode to switch
Date: Wed, 29 Jul 2026 15:54:02 -0700
Message-ID: <20260729225402.775442-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_155405_786654_F767E31D 
X-CRM114-Status: UNSURE (   9.21  )
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

phy-mode is needed for CPU ports based on the documentation.

Fixes dtbs_checks warning:

switch@0 (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rgmii, not internal
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index e02a7a902f72..610316be475d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -183,6 +183,7 @@ port@4 {
 					sw1_p8: port@8 {
 						reg = <8>;
 						ethernet = <&sw0_p0>;
+						phy-mode = "rgmii";
 						label = "cpu";
 
 						fixed-link {
-- 
2.55.0



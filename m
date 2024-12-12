Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B24E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 06:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfBkU5xN0WacDydGlClNsMc9BslSTszE5PxuLZUJYg8=; b=e/0ZKw/QCoyjQ7gKUpWxUYf+op
	1BkvcDjpla2CT7XPzCpDQHflnUaO17eQsJq3cL9KbyGPo623Q4ZhXLidyMBUFGR/c0gQ55XnpECwg
	2C1DzIV+yBTpxlyQuMUbtz93n99e9ewKdqHsI3JFtShZ8ikO5bhI/Swn/blvQl25bcDLfUD2lxQss
	7B+eA6MM50yq6ZZJPU06Mwfza1jEqzr0LJ/7mMvEj2Kb4C9wlx2LufHgi/fKHXrJiY6rJs4sUk9or
	lXxv3oIe+dnO+rQezl646U9YMLhhH7MIxRm5tF3fJMLaUjymPZoiz3FoiwxdomMpyp6r5QtSwBuhm
	dVQnDb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLceP-0000000H2XE-09Gg;
	Thu, 12 Dec 2024 06:26:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZR-0000000H1av-0skj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 06:21:10 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2162b5d2e1fso481355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 22:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984469; x=1734589269; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LfBkU5xN0WacDydGlClNsMc9BslSTszE5PxuLZUJYg8=;
        b=t4TC5lNV1vCTGDdCjyfSNYgN9ZPu/oNzLm/doI7Dyt/1T/MlGD+TyeVTPKca9prxa+
         qy0FHK6KRlelCOK8uVbStQgjU95I4s+F0TkPyKwEuPtj5k579RUf9swSwETsXikwArP7
         IFyEY1xf/RuXXWEZs6nDZ/jr4DVcLexeYBc3n9bIbpLFzzwkF4SNOxQCR8s2sqQtPFJV
         nJQ7cYjxzNijiVQDsYxtqO85rt4ZzJ2uPRXaUP8ktUy3qH0k5KRI8Z9DZ1UXm0WO1ED7
         fuNzY7ZYs+aHgW01zb4zPFgSTWGUq+NEfUbkv7eZ4jzijJTn0Mcrexr/ZHAdpyttolii
         tsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984469; x=1734589269;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfBkU5xN0WacDydGlClNsMc9BslSTszE5PxuLZUJYg8=;
        b=BOoPhGWMGNU4/MJzTpfpbmjOc5gpye11oIEKfaIk+U5Dw5v1utgivmPA8e6+9zw5vs
         skSgbHKmnrE3KPBQtznOgRF5d3mosGsONVLqcbmQWgRSR70IipOptxutDR2/RLxJtlfj
         CbBwBxIfKYMAcBH5WZbHIEob7VUpCH3nwkSgoLZgmn4Od/mfQ9Rd0i+r1uWdseVvQ+Mh
         cv3iHS3CUsR0xKtUxaUctvJd1womyOvNU9MbkpyvkmYkhVzEx6+YHj0Nc2MgALleixUl
         aIoiNPq2vVd/D4K/4EhKGMq+1oqCl/Q6qrC3wy3eZyg+2X9Bvn/uwA82v0/hn6idhIBV
         pV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKxf1ottzv6ZZm0fW0/C+ZSIPljbQhc6clbdAEBuZby5TM6KXfHwoujSoQullU0H3ex7d8+aVVEbs17pldpIg0@lists.infradead.org
X-Gm-Message-State: AOJu0YzMKqXXIQBN87FlEda6R/4IyV/nf2tA9A1inUqeAAyYOy2VM/F9
	KiWohP2rXfiiddAoRiW33PlUysaKSaSeJH6wEjf8CBnXka2IPnQZ2r2q8kSa2uQ=
X-Gm-Gg: ASbGncsvc9JCQAdTytDaDCP8KW7IdZDrUqXFYjAc14NOJ7zKgMFTVrMXutWJRR8uUHV
	ioeK+rb03FqV1FI3j5TF7VuD5DHWkYq9KlJ0WEy/OaADVJNPLGltUsVff/CPUO2DYTW7k0kutQh
	mlczcsrWna5cRxG/IcexBNTj1UEVri2QEfiyu5NTJE/sP8thRqnVOjc5BmxB4NjoHn/zKzId/h1
	IJh5LHwNFFEZR4/6SufGfmkhl0VDwJIkgXlss/beLJ2eDgrDXTEAqgdL0GgITs2IzdAm1Cg00yp
	HIiQ62xq5SyHScvTfbUi
X-Google-Smtp-Source: AGHT+IG1aykVIJ7KK1nMnneAqk9zPBfBBGEs0+epeO3ZGiz6cJuzU7kmR5k6vnbujqI2WNuSBpIchQ==
X-Received: by 2002:a17:902:d482:b0:216:42fd:79d8 with SMTP id d9443c01a7336-217785929d6mr36812415ad.12.1733984468684;
        Wed, 11 Dec 2024 22:21:08 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:21:08 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 4/4] arm64: dts: mediatek: Modify audio codec name for pmic
Date: Thu, 12 Dec 2024 14:20:46 +0800
Message-Id: <20241212062046.22509-5-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222109_245532_285ED191 
X-CRM114-Status: GOOD (  10.62  )
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

change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index e324e3fd347e..cebb134331fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1276,7 +1276,7 @@
 		interrupts-extended = <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 
-		mt6366codec: codec {
+		mt6366codec: audio-codec {
 			compatible = "mediatek,mt6366-sound", "mediatek,mt6358-sound";
 			Avdd-supply = <&mt6366_vaud28_reg>;
 			mediatek,dmic-mode = <1>; /* one-wire */
-- 
2.17.1



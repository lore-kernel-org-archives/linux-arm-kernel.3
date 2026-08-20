Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D066C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WUT4gJuTXpaAq3LMxd9C40AoVdjqOX0m7pjXnk2O4Gs=; b=1xy58vcf2MXcl3
	PEp8LjRO/1TUeRjPfq/DhxKncFUsQbhKmO4lFJpQBDTSXPzwcWG96u75vp/LI/Qv51lK8S10tcHiP
	ImZGr4pIyaJ1sWbG0XQga8Idtz3OSQ6QFEVuU7PmHFsOd88W4DsX0RdJydC/KBZtHhtIq2sKSNsU0
	WuAFLc0Qw9j5JTW6uqzwXWFs7Sd5zXlofq09KdnMEo9qAd6u4vXWect7U5YyMtHciD1tW4w9ET7dI
	GzHyaCKAxPpRiw/4Yqc4nmOyzYD7jOOAfHhmsdg8BeFse+OaZV6tmZx+HNB6yKPexhm5MXGSvWx5C
	KFvLGa1CLKfcewb670uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Kj-0000000BeS2-19HR;
	Thu, 20 Aug 2026 14:01:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Ke-0000000BeNe-43HT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:01:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso9366025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234482; x=1787839282; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WUT4gJuTXpaAq3LMxd9C40AoVdjqOX0m7pjXnk2O4Gs=;
        b=jz7idWUI/Ds+V7TSDoUKJEREWF6Xiq7lUni/CZueMaic/N0FyyzuACJQugYuVJUSzp
         4zGZgy6xW77CIsD/JA0V09iHuwbjtWpDElecR5dPDZp0f9Tq0D/VtWlZbpCwEvVmilbc
         WeiSFC5Rdcws+F4b82AYBRPvU+8O5JYc1ZWDOpnmjp543dVz6kev9QfnB7ynS0BdwknK
         QAzA9m58vaxjx9TmVNclBP2gkWYUu25Vcbc7EOdQEQ7WS2G3znWZV+uWzgTCz216+I37
         FX10HeywASYUwdqyankTD2jsrZEkcUt2DXqevxDNTgJRKV0KbBivu9ui4Zecw3w/mqXu
         o4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234482; x=1787839282;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WUT4gJuTXpaAq3LMxd9C40AoVdjqOX0m7pjXnk2O4Gs=;
        b=mz+9DzxwAbhTgqHL29B3CgZC8s1Gc1VjhoaehU339TztzUSGeH7ketNpceUcw5Iicg
         GAFYAyO/FQkADmDkwrSodckJGFe/W4BmZ25R145ZUe9+mGU2zh7/0bh27N7tBhYn2afe
         1VVteVEima6CNd+gXTSpdy1OMUQwJzTOo+1Q90nbHEPBm/xKHVdo6Ivo2ffrlOupdcwq
         TEdLwexapRH48PzLZ+bIgff9vl3B8AqcrVheIJVJQYQ0RJu8cgEGeRGtUtQPmv+0tbHQ
         8L1DWvowSwST7lpNfRb72mBrvJ9OdTS03HkLg2j66Fa19JpqsyWX16n9igied7Zrq7gA
         b9sA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6osYtGMZSbR52Pl/sBBTsEgJaV86HXX/CIGDfjMw8TMWnhC1pizARcuYtriQvF+/bbpnpSEhFrLQawwlgdPEw@lists.infradead.org
X-Gm-Message-State: AOJu0YzmC5OF5jjC+ViXo893jhU5fzSmJWuXoB1sggjvYpAdWkV46Cx8
	Cln5G16yaFQtpXUDUVdTf/GKvRu7Mqk/TZXTrCdZKM7kGZ0i+j7zhbZA
X-Gm-Gg: AR+sD1345deyNQvAQm3qJLA49MWZMDZHoyi7o7b5SGBw2F/Ph0Bs8zEVsqJcwBhF57l
	jXbI4TtZO7/MyMg1EaEsaH0/QDnPAf+AhRCaNsvWElJVJU0ggncZSDvnFqm6UWhZMDKS/Aee5Yx
	4IEl8jph+bHK0Nhni0rG/BvsSblBn9YPHRn5nLISqwolwzFw4wiI4bsvrrMzx5Dy3pOZuioTu2o
	/Agpl8FPDt/oDJ0DMBtous+fDRyspfDJnF2gK3z10fhhUPd8FyrUCJvIH8E7bPDmt+aircfF7W4
	CJyTsPtLT79pAU09O/99Ivyg7cUE8bSzjzLRNhpia9EOZ36FaKEViL3wuJri+u/ED4PquAYUpDe
	64WvOIINUfU4gQu3yBH6Uf2REsgUImL6/j3QYDELR0+63QGy7PKMk7UQFWuK2laBNYlTxSjnBdp
	prFlpZfWo30wCai3b68ephAAID3ax6xSlvtDUSew7HiJEGieIdWaqvc6eN+LGca94Dy8e4Chgr+
	b2Ex9+eKgdK0DSIItdqP4xLIoIHGduQ5hq57yp4FjSSV4OreYTremvyrg==
X-Received: by 2002:a05:600c:1d06:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-499aa1a8726mr195609195e9.6.1787234482269;
        Thu, 20 Aug 2026 07:01:22 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:21 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/4] phy: rockchip: add support for the RK3576 MIPI CSI-2
 DPHYs
Date: Thu, 20 Aug 2026 16:01:07 +0200
Message-Id: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMIh2oC/yXMTQ5AMBBA4avIrDVp669cRSyowZAgLUIad1csv
 8V7DiwaQgtF4MDgQZaW2UOEAeihnntk1HqD5DLlSuTMTFGSpaxdh4vJiMedipUUSQO+WA12dH6
 3svpt92ZEvb0LuO8HXXyln28AAAA=
X-Change-ID: 20260819-rk3576-dphy-2304f848215b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=1144;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=A2VFtAAu1+hhr925EcEt3otzqbqApHxmFMxqu1c6scg=;
 b=p6MTPqtWbWzGbCNQJGHAQWd3iNaXx9MMd+sTatZJKw+3c3Axcd4gzRri2JGsHa6YnJQDcHV/q
 mzW3yvAtTlcBY7O0NfD4aO+MjBLxC0z0JjUltOKdGQOQIulnEbBk3wB
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_070125_028656_F62F728D 
X-CRM114-Status: GOOD (  10.93  )
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

Hi all,

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
supported using the existing phy-rockchip-inno-csidphy driver.

This patch series adds support for this variant.

As you may have guessed, this is part of the efforts to bring the
support for the RK3576 camera pipeline (VICAP) mainline.

Looking forward to your comments!

---
Amin Gattout (4):
      dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
      arm64: dts: rockchip: add csi dphy nodes to rk3576

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  2 ++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 34 ++++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 22 ++++++++++++++
 4 files changed, 59 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-rk3576-dphy-2304f848215b

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>



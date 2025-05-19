Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA300C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t/k62NGDDYYiEZcY3g4rv/NbFRxjHY8ftixszCG/oSM=; b=As66PBT4qnCwXMgiuD2GVQiZEU
	enbocbXFIeC3pfeQNiYK1GiREEt1SCC+ysRwma+bfcf4DQJOI+QoJmkgSuco4+uaAy+pRXZw0ObIp
	AUsOrCMrVcD3cQouXX0JFqaGVTxiEq8kNDU1F9iuIMTdaDFCH/LHIVM3RPFSVZqYL1Q4aNONKwQxJ
	t7eSNmeV0d6spXIJgGS0Oy7mGNoyHmy0oOmIr5dhet8cpGYGrsYAhNIg8dzoTVuUWpqOWpypjfME7
	EF8qSSEYIz3gO9ORjd0uzffKhx3cCvovXBWx/CZpQD7nE5XMQFrwysDwpJbg0ne7epRCKaLRxkXE4
	eze7CMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvpe-00000008Lg4-3FP8;
	Mon, 19 May 2025 08:26:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvk5-00000008Kx2-29Np
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 08:21:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edb40f357so32680365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747642859; x=1748247659; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/k62NGDDYYiEZcY3g4rv/NbFRxjHY8ftixszCG/oSM=;
        b=m56TbQfIBan9KqBfSADLDo9PUffrM35QdnahT1oXO7tG+BYZjvoAF4WIq9TBKe3mJp
         Ir4+caqoi1FAitynhzw8Q1849zG8shauMDpnmDxmwbsGcuW1oE5fpcCBW6+bHpdKfvbz
         uXwTr1gi+4iAx+HXyXfWoiS99WZQKSVsJDagXTs24x3N0QiAjlafTL8AL40W5UZLxq8t
         xvMMKyBV1UWyYIPP325rXXPP1mClD/wFun5ewWLPCsl4jk77a2VvImq6i4eB7hE6Bdlh
         3rZrtfohoy+iNbfIjPod+JZ8r4QLof6lAQMcwygLc9KuqeJxPFSgjx9okUTC9q9wjQFj
         b3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642859; x=1748247659;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/k62NGDDYYiEZcY3g4rv/NbFRxjHY8ftixszCG/oSM=;
        b=m9OrZHyXzYAi1tBJpg2rix84yaMpdqNl1YilsZsPmfomUi4QuLcg/FnEGeS1d6stgN
         y4Lr2nHu+03SWWQ9mgBr5luVTQvCcCoJOKLFtjF074xqe4gL3jrOCfy2dj7mNjUQ7slu
         37BLjKl2sP11ZK+HaN0eJ2x+BCz7DUZ5pkymg0viwbMvhwrcoJV8ZuNygVVZfIv7uLXw
         hqejVSh/Z0PT7P654xcFhuKqKmdj6sXNEnL0hHkRxOnMfiI0YrRNiyNhi5X4wQtYz0dF
         OJMhKeDkfK3eifm9mSOiKYpUG76hvU167xKJO76+IBj6iCFVQEBRAx7o8ZYM6uia4/X3
         Ck9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA6erq9ZtwUd95aOWWFRoPj7UTEkdClUTvElu7KQbQELLabFyaRNsMuOoZFqmDgGFV749tEMSdns+4Tc2q0lRu@lists.infradead.org
X-Gm-Message-State: AOJu0YyWaAM9pj1jV+22h/FVrYUD9gIuCQhVCOBTHkkigtWcnSgh96zO
	jY3I7nHONA6pT0KlVR+9kDeA91bZ9z1OY8pHncRQKZKIEMaESm1UJIXboRhRW4kr0mw=
X-Gm-Gg: ASbGncvDER1QOJcTbo9yStRP8cZhbY608VJmCqdIitPvJtATXXN1SakBtC+gVK43/Ln
	ClW9WyC9cOgaaYza4LhLEn4t7bQ0l+OJeM7AErmjnksMcvceKZ1/mUiuyLyuf9jR1xvePBsF48G
	E3d1eqk3w+yYoQJSB9x5EFZfPVZcoBrUIzDQ9sQGPISliK0uMQN1PNxm6qItYJ1RkxjGaRqthfx
	LpZrSfH59nJ+LmsxoQO3dmZ6vhx6bD3jLE+4hC41YYt/zUmagt0uj6UGGny+cZioGvJhpxyOCiQ
	1Xu9tzR2l1wqZn1I0Pdd/+WZiRN9mYPZ9qdfyhtlsXgr6JbPCTtHh1Q=
X-Google-Smtp-Source: AGHT+IFGzPPtx3PF8r11/vjc9a7/gcX2mANQelOTEbdI5fy6+2ZiOLqEmQuRVs3+LIEHWfWk7aen0w==
X-Received: by 2002:a05:600c:628d:b0:441:d438:159d with SMTP id 5b1f17b1804b1-442fd60cee6mr100229085e9.6.1747642859405;
        Mon, 19 May 2025 01:20:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:9e23:ebb5:83ee:38e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50eda6sm127139875e9.13.2025.05.19.01.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:20:59 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Mon, 19 May 2025 10:20:56 +0200
Subject: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOfpKmgC/2XMSw7CIBSF4a00dyyGR1tbR+7DdADIbW9UMGCIT
 cPexU4d/icn3wbJRXIJzs0G0WVKFHwNeWjALtrPjtGtNkguO97xlt1t8Egz6wcUakSDSp2gvl/
 RIX126TrVXii9Q1x3OIvf+m9kwQTThkvRY4t6HC5Grw8y0R1teMJUSvkCb6YuMKEAAAA=
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_012101_818438_42BB922B 
X-CRM114-Status: GOOD (  10.91  )
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

After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
select on ARCH_K3 are not needed anymore.
Select MAILBOX by default is not needed anymore[3],
PM_GENERIC_DOMAIN if PM was enabled by default so not needed.

Remove it and give possibility to enable this driver in modules.

[1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
[2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
[3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Changes in v2:
- Remove some other config after comment from Nishanth. 
- Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
---
 arch/arm64/Kconfig.platforms | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..bf9e3d76b4c0 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -135,11 +135,7 @@ config ARCH_SPARX5
 
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
-	select PM_GENERIC_DOMAINS if PM
-	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
change-id: 20250504-kconfig-68f139fbf337

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>



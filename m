Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D1BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx8ohLBrU/OokPvPfSuPsXKrA57TpfEKGJT/XmjQiVY=; b=U4fXVf/OtPzWeUtTwwdE54DmSt
	mNf+lDZHsHX/Mv5YXAd6mfD/aXDZB1dRrFp2MK8E0D9EIaR4a4krY9e5SB7d49S/13lihKahPjHVh
	RbtyvBGs34P4y+gT60R6gsLz8AZ6XyCc56zqNE1kB7Ahc0JOn65qXnGr9cBgmm4BX6ehthOuicaiP
	kfOLUACWIr+QuwwzqpCw/ClKhL5Mq+c6UyjVUpc6A0XpJNw9d6udp+C+4iYYXCi1C4A4guI7GY0Vq
	jhKcjr9zyFZHcK7mhLFIvBb5EgyPTBEOiqJkpJN7JbD1NcXQceO0OrfDuy4paOsI+S5we1PQvBSYz
	PkGHAeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taDrm-00000007vEr-3Vhe;
	Tue, 21 Jan 2025 13:00:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taDnp-00000007ubT-3nHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:56:23 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso12097998a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 04:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1737464180; x=1738068980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx8ohLBrU/OokPvPfSuPsXKrA57TpfEKGJT/XmjQiVY=;
        b=ILv3iXT0aVlw+3UcFdpUt7wS+VOLjAM+61VwUqNlg4mMylYpm9ofQxFEuXZtMLS5uY
         OeFxNcc/HNoTyWxrwoAPggyA4I0lydT2M2RSImJl8lISr98qVaOqkHl2AHOmIDtZZDUW
         8X/AdqqWZfR2LKPevkk3huAcMsCkCEcWn7Xcr/dzGWwwsxypokUbUq639L8X12/JrCBm
         rIGF5SqiqyKBKml1ESGbACst0sFDSz3H1YTtU0CsamI3fGpeBJvdEVqjBMtWPD3ULerA
         hL/bFpUNPD6JbkCs1GpSlt+zJ3UnOLiuyejeLnvQt0y60K+fwiFf0W5aK+wU3EIsj9iv
         MOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737464180; x=1738068980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx8ohLBrU/OokPvPfSuPsXKrA57TpfEKGJT/XmjQiVY=;
        b=Ge3462SoyuoCZ+2sMKD2o1pd8X6q/Pc6CntAg5ZgVEZ2yscrJuEbJ9iNd/4v/w/fQr
         zA3Rab1LhNv7mKW3YOzMehXpzYLi+y5ZdNyotxTwlTTSUi5hMj1NUjvsyT5+yaDr6SaU
         YU1fH0GkK7/3RM1Jz1CMSuRGXMZKx8ymWrFemniBwjKwfiPpr5IMmsvR/thPQQb+yu8J
         5o0iSkZ4UPnshl8uwczshtfj3+oujFOnMHSuU/H5Bhn0cILqa3epqG8nQaq//4/GUcau
         SaAdFEhZf8GplvQEnSvpZnIy/jdzQLZ1UHSxHz6XjAKK3CPZ/MNWeoJ4KC80lRARJw4t
         ANnQ==
X-Gm-Message-State: AOJu0YwqScLb3I0kdmv8hj8VpuZvCvBWYI9U4jykZ3i71lPFlumm7ri1
	3cFaO9o9GaLQMvueQxFC99eNzLlVmnewNeQ6FCHFmjN+hp6ginwbCi9pkqz9tHjqRyanNjfO6R8
	lHVU=
X-Gm-Gg: ASbGncskR/l6B7SV3qvdPL4O5qsRGI0Q4Oim3lB1mhb3vaVG7UbDS89F0QDeWC3NfOQ
	0qWpTAiYWBzzYydnak9CA685CcppeAM9MzFwG0AgznE46v9HTERyyEcxbP/AhSPAH06TalX4QWe
	kjAgYqFR9P7pe8hWWUgAgHZCCH7mF6sW2YQzw1ZXn9IBw072HsAl0gQQBJc+BdIR3Kmajt5e1P2
	4zaBccSo/IPVN3VPtK/H8XzMa3wC4ktVrwqO/MOpPY0Lswo/Zx3KDTd2FzU08AFNkpYmjS+sZZU
	fllCSBTup2eGQClPcLNIR0o9Ig==
X-Google-Smtp-Source: AGHT+IH2YjsrPDohH7bzIMs9wAWWL8aTE7Di9cAl1bb+50e+R1QaTdoPlQwcV1unai0DN5r3lzmS/w==
X-Received: by 2002:a17:907:7b8a:b0:aa6:8dcb:365b with SMTP id a640c23a62f3a-ab38cba3335mr1373905766b.5.1737464179884;
        Tue, 21 Jan 2025 04:56:19 -0800 (PST)
Received: from lczechowski-Latitude-5440.. ([78.9.4.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce0529sm740943866b.43.2025.01.21.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:56:19 -0800 (PST)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quentin.schulz@cherry.de,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck
Date: Tue, 21 Jan 2025 13:56:04 +0100
Message-ID: <20250121125604.3115235-3-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
References: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_045621_939474_B7217BE1 
X-CRM114-Status: GOOD (  12.24  )
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

UART controllers without flow control seem to behave unstable
in case DMA is enabled. The issues were indicated in the message:
https://lore.kernel.org/linux-arm-kernel/CAMdYzYpXtMocCtCpZLU_xuWmOp2Ja_v0Aj0e6YFNRA-yV7u14g@mail.gmail.com/
In case of PX30-uQ7 Ringneck SoM, it was noticed that after couple
of hours of UART communication, the CPU stall was occurring,
leading to the system becoming unresponsive.
After disabling the DMA, extensive UART communication tests for
up to two weeks were performed, and no issues were further
observed.
The flow control pins for uart5 are not available on PX30-uQ7
Ringneck, as configured by pinctrl-0, so the DMA nodes were
removed on SoM dtsi.

Cc: stable@vger.kernel.org
Fixes: c484cf93f61b ("arm64: dts: rockchip: add PX30-µQ7 (Ringneck) SoM with Haikou baseboard")
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index 2c87005c89bd3..e80412abec081 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -397,6 +397,8 @@ &u2phy_host {
 };
 
 &uart5 {
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 	pinctrl-0 = <&uart5_xfer>;
 };
 
-- 
2.43.0



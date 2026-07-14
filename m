Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103B0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=; b=4fZHgUgsatuBupysx2kz4OTz5i
	W+7rAjMy3ntxV9WA1NZKx1XQYPGJXH9KVMdibY9V9SD+ftnBL3rann3OAIzH+GP/X+thlBp16+XEM
	+0OZoeMoQA5Cbj7XosmDS43vaQjjfMxo5Z8p8A8zv4Z3IBOhx7Q9+7s3OcTcDZoN1Wl98w+lYJTLf
	Bw0N7MaZxWdhPk783J+NYFlZ84YQ6W6v/7JXaENcyLm10mCRrP1D+tOgxbZwUm7q9cQ220m/EXeIS
	VIo4D9kfP0vmbz2RCTfd1yCC2BBUWi9MjJoHlq/KXzrpdNw21WlLAGKzmG9oghCYgwNECi+05upRG
	UaTmb8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdX-0000000B2Vf-02tt;
	Tue, 14 Jul 2026 06:28:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdQ-0000000B2Pm-3Abh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc6dd436c6so6956495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010532; x=1784615332; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=rcp08ewW+nBrvWeq2W7vWRuRbInIbo2CJBfgt/NHQgvStm8fP7FrQTQQMRjZeFkrWa
         lWNu/o7OxRA7XO0tG4+v179+c2s1M7g5sl61IpqRdG2H9Wu+G1mjKF2S4+12LXIK4ltv
         ElRK6bAwQl/26WKzzoALy9YKgN9jT3k9E+i9ckazJm+RvvljiUzc2+8cooXU4VGXBqsq
         Rfh3bqDg010GslnpcxybZ7K3IsSU2zYZ6q3lArWAku6P/hGhJCczdE36pZDO/AQbc/uH
         FPzos5dJB/q+L9uA51qEIwhy9qbBVt+D5/xTfjQ4gxEkF6OdY4PsML/X02AdfQXL+EgT
         xDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010532; x=1784615332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=XIwJuTibqdefgjuMHJq5H52pI7/kC8X8tENZGy1Tm0a7goT5PmTKQpeH7xxHyUCNxx
         8ud+8Oh++CuUYVSxtbO4PxGkwexpdO36YzJAZSh4nPFtTR34ZAoUclnkrAuLH6ug48DY
         CpLkmtBY3wbB73ajhPTWK/uu7GuucbAlekKOorgRBpj7Ll3tltBFCXzxs7xfUar/bSYd
         iKjHrAB7jZ28kmVhVjwGmyk1uEBLj3+z6zWb35RAzsrdO6hzOf4X1iOPAHHwHc7BepRP
         FW1rftEJj3NAOR5HQQ2xTvaTxIxXlnOvXt/oV+Nn/i/6rdxuUJJZto+jqTNDfuiCmXDk
         lUXA==
X-Forwarded-Encrypted: i=1; AHgh+RqQ3btADwL+y2+mLCPCwmT+CJ5VfHIBcsuyQ4+gmND7qw21jAHiemKCIbYUIMcQcSRliCWI8wPHjuw4n/JL9632@lists.infradead.org
X-Gm-Message-State: AOJu0YxVOWeQI0VBYA3OizKZeVU1jgVlIb3iftHHNUTFRszFDtbuu3p1
	GTK0GzQel5QBPJL5HCF2WJw9/YjZdqjkjX3xK8FfhGUPNfzT1IgWgQPn
X-Gm-Gg: AfdE7cnYlGAIJ1cWVu4ee9VNovGkkfhNpDREB2Y800QC0JViYNSntACYJeRypkLmvV7
	ZkVeRuijPBiovsFRniM7/CfB3Zo+t7fFRgimoK2QxgNbQEnqy1BtPv3D+8h99PqXhCUniQmJiG7
	si30WktfVrcqBn0Rl4oMbTRAkABWa5BW5SDYGWovSLitqC+TxJLzvj1wTFuxEgMdSJ7VKIPWHGM
	NqXVo7cTb3+DKNhA9mEfFP0m518YIoXQXgFqqGWILljdjb9ek0+V6LGhZVJgmnJo/VwJaH/u/ym
	7oLkFQQSV8MpGMEaQQ6Iyjy4xx4/OFPYdk/npc4pYfU4vdSXQX7flfoyRP4W3zaB8PMhHyeq2DD
	SFOA8XGwTNlF1er+lKQm8EOd9F4CflzIg2qBSq7POFuWTTzYkzW3Oe/ExW0FM57PgWkq2acwvMO
	UEOj1bmRRG/lmZdQN45YO4/XzpgCxV5UM1XWYoU9r3BzUqOTlB2Mn5AQuB/2uJZdGK4j90MVriG
	Jv60pzvra7mMNkbTtBRbaUcw2Bz0oVJ7sUdxaeBhHjP4y9yzWAow7AF9JlGbqFfH9PjANQTz64=
X-Received: by 2002:a17:903:17c7:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2cee747c649mr27101265ad.46.1784010531885;
        Mon, 13 Jul 2026 23:28:51 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:14 +1000
Subject: [PATCH v2 07/12] arm64: dts: apple: t8112: Add common SMC hwmon
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-7-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xntfl1++Gx/cdpDy/4Lqe7P/HrcQ+dkFm9dumDjH
 73ZbrerOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOdVc7IcDQ98Uj5oxkh8UuuKh6NmLf+gtqSwzP2bPX3stjE25Vi08/IMPfUKpH
 4VEfHp9PrQg9frn554/RM85uZaxcJtbEyrPHP5AIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232852_797787_C57E6BA6 
X-CRM114-Status: UNSURE (   9.15  )
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

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index a3241c816c26..ec248ca052cb 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -1289,3 +1289,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0



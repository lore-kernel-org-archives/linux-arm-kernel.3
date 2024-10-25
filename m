Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACB0D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGdp4UlHi9Rl6xWRgeoMoP+ShACtzGL6t7tsX92UPPE=; b=nOimATVVPkJrDIvQE4O4c2FKZo
	FmpUTJkPN5WHcmrNXUtPslZzQUt6p3JBfA0Ci/sGPA0gEPQSrekzq82aYG1TDQZZ5YxRoJ6opg14d
	du6dkqpLCSdof8MWh7yBgSQQ4GEwLjb5TCqdgbIdU3o74F+tZsg+SHmfkpr2yjTV/S6Wp6XLJY/j1
	Gl2DG+oc1RiFdZPIzk1VOmTNyUo02smQh67+x8ijkTkKUd+vvd74uPcXfB3mcuI3geGQ4ue8udrbq
	riNOkSz+56uUNqfu7fw4vt7MHRRQE2bOSOT5JuXAwqVXZI093eDu9jxFibzPRYMYbZZUFm6Mx24Wx
	RI7bUKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48vM-000000029Jt-3oQW;
	Fri, 25 Oct 2024 01:15:32 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48pX-000000028MZ-39oT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 01:09:33 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7ea8ecacf16so977900a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 18:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818570; x=1730423370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGdp4UlHi9Rl6xWRgeoMoP+ShACtzGL6t7tsX92UPPE=;
        b=T97XsDHDkLBdqO6xAueCusYI5iesHWRi0VR5dhXvlbGQkm74OFf7W4K6Pjr5tIMiTL
         I7mU3I3UO5P16IcGVKkLxkOuiUfJQC3c/kyjENXjLI4v/CCoP8J4hx03Z5nInA2qCufx
         iZLWZtHZMi6TFXKo2EFZJecWjj/LMyCksYp86LXRVnc3IZ8EIoEg2rYwjmflpv3mde61
         VVYapwvFkkrIsUH+zMGa+Zka4v4ZsLvwvUeiKX2lgIhNHgKVko/2YDsErueBWGza7foE
         2Qw29tk2Ua/yhmMaWhEul1h8t26SsL+N9BOS+kB3PjfxWg4mZp83cckvkDvSP7fi0icz
         XnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818570; x=1730423370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGdp4UlHi9Rl6xWRgeoMoP+ShACtzGL6t7tsX92UPPE=;
        b=NU47EkSIomS7GPnU9mQwPPc/7LTPCvG6DWAsmvMIZobhbqoWTPsvOvbynE9SJSDKCO
         SgmRwVgyVyr7pb5jQ5XZhG6k5T2TlIHHGjdXTgxsz+xdD40UDdDcRC8uAx0FI4ZJbhPQ
         9CwGdOjO7U9xsSNVOBihJ0M39Fbf7rUrEr4hVGX8/uWFgmeKZaU2gSneI6qoZeeQh8BI
         Irsq/SHfQsUBBdWSPc/M26oGLmsBk5s18meyq72fblmxnt36sf0d6xeVwhlXYIJj8hHE
         MXCBduoorrWGExJYd2PK5vSoYhQCD9ED3LazUmdE6sclJYlcYFM/w0ACv3v5GEt6aalz
         IAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRJzEAzNllGUlQ9Aw910u8PWHQLV7o+/CaNfcTFfENF8a7bVdK48MAtwu0Yl8n9DI6Z0WbzatqDUh1P5T+vGSr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Z2YzikeOzaMo7IqP1F+/jjRKFDjTyMAHUi7lmFYnl/5KmFPX
	Huq3OYxabqBB7Vsm+Ozk4fGihNE8UyS7r/WOzs/sRiTlQK20WxFQL5pukw==
X-Google-Smtp-Source: AGHT+IHYYcX6rcKuACmUMAqT2j7xUKhF7rX1Eq0psxApSO+AaLQHyyTER201tiR+T8CoSPfZiRyBIw==
X-Received: by 2002:a05:6a20:cf8c:b0:1d8:fcf2:9ce2 with SMTP id adf61e73a8af0-1d978bb3472mr9319125637.44.1729818570143;
        Thu, 24 Oct 2024 18:09:30 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b93csm52875b3a.137.2024.10.24.18.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:09:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] ARM: dts: imx6sl: Pass tempmon #thermal-sensor-cells
Date: Thu, 24 Oct 2024 22:08:55 -0300
Message-Id: <20241025010855.1593365-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025010855.1593365-1-festevam@gmail.com>
References: <20241025010855.1593365-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_180932_242833_4FE284F0 
X-CRM114-Status: GOOD (  10.26  )
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

From: Fabio Estevam <festevam@denx.de>

According to fsl,imx-anatop.yaml, #thermal-sensor-cells is a required
property.

Add it to fix the following dt-schema warning: 

tempmon: '#thermal-sensor-cells' is a required property

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..6c98670a44ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -631,6 +631,7 @@ tempmon: tempmon {
 					nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
 					nvmem-cell-names = "calib", "temp_grade";
 					clocks = <&clks IMX6SL_CLK_PLL3_USB_OTG>;
+					#thermal-sensor-cells = <0>;
 				};
 			};
 
-- 
2.34.1



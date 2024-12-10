Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BD9E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jqw9ssvr+RamFhuTkFddw4DLtLM/EJe/MJOiR1nlAKE=; b=lqQDfZ0z3TdlAmWfMKFyROcXgG
	iTyvS5MlTNSVjcfSx3qiByF/lFMUKEnYFwqaN32yVSU6955OApb/bRTZrkILP4uvY8pAkSK5DfT6/
	GL1WX+WOYWDDZg2YNk9HDSX4PfmPgauvmO4VN0UW3QHuy6K+xTdNAKsx9vnSXFyDstuX0HW94NK/v
	QUYFIbDvtjpNJJCBVJma2Lc/T3IZFbnU7wI0zT1oRSdKer7Zd98Enq4pGS17ePluu1pqwmZd3X85q
	Vz0/LUSiOyWE1+m1tahEknwTRWTa1Vc/LIUvSUKlvX6G1SVHSuA5tL2Kne7CcNfQkgvSwIXbe1TLP
	9WbbYdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpC9-00000009r5Z-20nC;
	Tue, 10 Dec 2024 01:37:49 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp5C-00000009pwq-3ibn;
	Tue, 10 Dec 2024 01:30:39 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d900c27af7so24580096d6.2;
        Mon, 09 Dec 2024 17:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733794238; x=1734399038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jqw9ssvr+RamFhuTkFddw4DLtLM/EJe/MJOiR1nlAKE=;
        b=f64XJqmRvgmxsRNUgX404/4hp4JVHmUu5h40KH1sfI1yT6ilQZEcMAcHFCgIgfbSwt
         McAMpfUpfu3gSXoQJWSD5fxKm0owWHG/QA3j89rbFwkmU4wfeM8sPlBJNlN2/2Hm7ZfD
         2OMl0qoMMJOKEN/V2l7M6HrHZqTeBA3ifIstORW5kCzA/0JsMP4Z6HvVPrTZI49y1FOw
         VD2Oz0zWTqYpyPIG8OwjF0Pq1vs8CVJWkWN+GloVHmcTlXlbHMInbKMcsFWCl4mGksB3
         8zRn+BOV73xeGh5wI/GoK2aj08JGi2aQnXyQD/tT0hc2g5KLbL8CLn0iz5/Y3p1CjJWS
         U/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733794238; x=1734399038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jqw9ssvr+RamFhuTkFddw4DLtLM/EJe/MJOiR1nlAKE=;
        b=s3oEj2g6aN9onhVySxW7L/6RFQ+EUdJzGHpp0sn9a5aXyo3K4d9oGHeS2+2vpmBeKt
         cnXOuAHxhcLoCKNcSJfsCMiHis8+oxVqQl+YPMsxhAj3Y7rFAZ32u7kFxrRji2bJAQ7D
         3DId1k8/s4yhkdWwh1pBdpAYX8JUGuuF/vjYbF5kngp7zZhbUfbBhFuPPpRN6qxNFeZD
         J+7Ea7gidUOrH7EJ60hM+n6epEdcA5BqwAybpZYKscdaoiTQIH4VXJkD/x3wdOcdoNvR
         zJi+M19gOclnBsJfuRFeSxVZViW+OQX7JHDKiQGCCD4QpJEiHaz5pbVVIYu5sez4117D
         CcJw==
X-Forwarded-Encrypted: i=1; AJvYcCU3aPAjezH4I4sfNh6WCkCj7iNrhV1osj5K30rL4lgLjZCfPcOObxoWcllWRmb7XVvKLMX3hidv5sTSM35Bo2EL@lists.infradead.org, AJvYcCWpl95gkYjzFObwV+P3R4TyJuiydI5mpovFSIbMdG2O74u/GPdRs0xg/syEF8MVnWl5LRIDc4jtVMx9PtJg69E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsULYoe4edbceqOWl+qjoHV48uA6XlElSDn+4D4a9l4AUO9OjL
	fWkXzsueZVHwPxx7bcPwC8tJpgqEOKkxeCsl4++wmXUilim6zjCS
X-Gm-Gg: ASbGncv2k0FtJnxQZgZmU+WobQ+JwX6vCZaLLaHFA55ALC2yNHeUhZ2goPiirKiUY+P
	1zCSlNCFdxjBuxYv4L4hfAIZkokStFIDiHHaEhiPhasW8HiMURUiuXSFGv/bf9N7gBByUg9FKpL
	nCB9KxrOI3XS4uclilo6eHHiOd/76R1ajWEnG7E+3bmwwSg7RZWt8v/SgaXf2h1SLev1runSUWx
	C6LT5gwmTTUcQkS580OMj7YKn63OlRSVql4ZTg07ZpDd0DSli99LQ1EHP/UTY0TPQ==
X-Google-Smtp-Source: AGHT+IH6JIbgEEMAy3xvXZsAPmdWHrEPx5XojlgCSN0/zSm0Ou9M/ynX9WkvMGNi2Bhw9DACvmHMFw==
X-Received: by 2002:a05:6214:226a:b0:6d8:86c8:c2a9 with SMTP id 6a1803df08f44-6d8e73bf6b0mr241598566d6.31.1733794238061;
        Mon, 09 Dec 2024 17:30:38 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.53.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f429a79csm36834346d6.72.2024.12.09.17.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 17:30:36 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Geis <pgwipeout@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 6/6] arm64: dts: rockchip: Remove address aligned beats from rk3328-roc
Date: Tue, 10 Dec 2024 01:30:10 +0000
Message-Id: <20241210013010.81257-7-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210013010.81257-1-pgwipeout@gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173038_923956_C8099543 
X-CRM114-Status: GOOD (  10.54  )
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

Since commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node for
RK3399/RK3328"), the snps,aal, snps,txpbl, and snps,rxpbl nodes have
been unnecessary in the separate device trees. There is also a
performance loss to using snps,aal. Remove these from the rk3328-roc
device tree.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>

---

 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
index 6984387ff8b3..0d476cc2144d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
@@ -155,12 +155,9 @@ &gmac2io {
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmiim1_pins>;
-	snps,aal;
 	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 50000>;
-	snps,rxpbl = <0x4>;
-	snps,txpbl = <0x4>;
 	tx_delay = <0x24>;
 	rx_delay = <0x18>;
 	status = "okay";
-- 
2.39.5



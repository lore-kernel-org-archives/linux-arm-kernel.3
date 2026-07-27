Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7EBC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqApU/iRRg+SdT6DyB55HRonKrft0AEH9exH2EvMe3w=; b=0CPemUsJiGQR3ujzzqrmgp+N7o
	rOEjbrm1VjUEJwKZ3oPIt33pvolBxPY0hBvBejwzwy1rVg0hu1PczfPFnVVrUI1zsh9N7P6DFZIDP
	DJ4DYL6Vim4+4Q68D/G+sHM/QmLRnbCVgsHJakciLp+Tvge+GxoZRExbYtqhBu9UBGoAMdmtO7hbn
	lwGrcBA70P6fFFvkp+q1s2ni+fSWQ+Feip4D2yiN2r4oqjDFtzzaoMWrx58G8MWFmnpD/xsDTLnaL
	VsjkjM8xWoHpYp90TRf6Meblh28kOPqhoLr2ztMMRo84Tf4ylzV4q8iYkZbtnzTVVMBa2Dh0U31fE
	8BXBkE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLJJ-00000002qWc-1OFn;
	Mon, 27 Jul 2026 13:24:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLJ5-00000002qPW-2Sk4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:23:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4955de8797cso16654275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158626; x=1785763426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqApU/iRRg+SdT6DyB55HRonKrft0AEH9exH2EvMe3w=;
        b=gQG8bQcdqusQQ5gBot5jUcSN0Dmb+ICRyZ/oOrvj4bPECEAEvHqmqBUXAs7aH5z90H
         XeADzUrxYewYLuQDS6+1MBM3pGrcrGyl3T56mlbJDGTizdbTpVS7qOzplJP+WY3Z2lWX
         Lci24drwVZBQbiQoMD/s9Pe5kvNBjrL8C940mWeoo2JcmTk0FYbVQGpuLigcfbd4f0D4
         VFxk/2m645EqR6avx0CNILCHXbTYVfdDims9+fLtT621AvmebmZ6PGqs3cyyzEQbzVpA
         rk5UvCUD8+brb8LnuHYp7CTnIe0zDupORNvqAX6f5iC/5IG71fY8vc9JajfTT75NsA3V
         o5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158626; x=1785763426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqApU/iRRg+SdT6DyB55HRonKrft0AEH9exH2EvMe3w=;
        b=H9UCmrLB6RcYwe2fe40AXaNtUmg/fWfRF0po5TXWOZh4+TWEjH/qx23aNu0SOsbQVJ
         K4BYlXEw+pF9t6q77WbDTKzpBfg+sLKE/rMuUqI/g2HXlTaFavg3476xytSlYlc/XobR
         /geiFh1nhw/okjWtjY8zVBYYaq75vek6UlIjLZuUqyoMW12DsraSfsFb8J855HUPevBb
         7SY0vlSg9NhzMIiyY8scwMzWnzDwfpVZYyiOpsRmh+IbelWaTxrGHaLnMywzFgISwf6B
         NVvsRXHjgXtZ/R/cny6mSel7qROSPbyKZq+uIaVLpkf9ovq/60DMpYZRxEhodg4odBEL
         2/YQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6VuQZ8WXtq3T7iXB1mdr9py0/lPTm/Cgyu/ReukEA2nyiyEASyZgP2pr8c6Wmn6fDyUzYswdLXo/KliC8OrGD@lists.infradead.org
X-Gm-Message-State: AOJu0YyLMk6JvoQnRTSgleJWEKGK1RMgKDsQHbuHVwwPpOQC0uSiCxU2
	2UuGN9Re5LbXrQawLaO1ZpPz4KQxi3WaFQRSE3upXmrjYCwVVLEV0D4fJtkEclXm0arX3Leo19a
	cPIfYCEo=
X-Gm-Gg: AR+sD111e9EbPNtUwRwycT9zg3lZmY2F8W4sGl8lNsPaubWLhdXvAvSnXfetlFe9lgT
	HtU45dFYseVRLnL3dPbIEYfuT4yFzO1V7yjofDOb+6awgXvBVrsHEj8fY5js//zVEt4OY4XWgPC
	X0ba/ir3Co3G4y+4OxLGxaZl7c89SJr1XcHYbjkJJpKaKp95Hm1iDNZCVqiN7B2z5i43ZVHYbxW
	quBMctr39IcM5ZuvJiVWxwrHh6iU0rvlFQcJRX3g9wIy5hZneNlF8r5opXzl5qIho2z8XTHqxDw
	r2CG0y1GJ24UuvtjwKvmbFkK/gyuzkibAMt4YdQESC7DasOV5UdrIS+w1aOPxsfs2tlGL+h7b5K
	MIVR7bIKfpBokgoxkaQg0Seq6zEfOzT6mRX3njUpiweSYKg6X6Ky3qWoUVvjBhuE8u5hXl/DV6v
	e93SPA/DbuaIlp9ipr6HcNRNaEmrd4y24kePEBXea4YAjMIHov51xyJTCvLOortv7gsQ==
X-Received: by 2002:a05:600c:4295:b0:495:7990:a1d0 with SMTP id 5b1f17b1804b1-496b571a0c6mr69990155e9.19.1785158625718;
        Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 27 Jul 2026 14:23:27 +0100
Subject: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_062347_641893_495B412F 
X-CRM114-Status: GOOD (  10.36  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..0b614caa411c 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -163,6 +163,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		apm_sram: sram@2039000 {
+			compatible = "samsung,exynos850-acpm-sram";
+			reg = <0x2039000 0x40000>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos850-chipid";
 			reg = <0x10000000 0x100>;

-- 
2.51.0



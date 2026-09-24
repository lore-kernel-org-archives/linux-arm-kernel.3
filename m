Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE36AC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=; b=fzd1Ha9WS+NoxnEO+tU6bIa7Pn
	hBSxADBwTNtZJUb7jOFP6EK+rQsd413tNCgfjWoLMH6TSKadep0/yA/GPh823VqHFae1pTX2cEZg6
	8xt1J9ydVbh6H/0iU+9Xmw0DgedeOvLhOoMan4X24OaWM0+N3b2NrsxGGouTcXE/FbHyurcwfg1g/
	MOO5/aDX0tyZSoDIx8pTSIrLbuzR/uN6zdRPHdaKFhHZEsHKYoHDRNst4lfOKHeT49nb6q47WkmH7
	r3Id7bva1HjeWXjv7g42Ad02schEaYIUwd0Q1QjNrhXB2rgGsAGI1MPhF9E3CB2OAGJ6S0EUA+jWu
	e/vnDueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lOY-0000000BPtg-0Utz;
	Thu, 24 Sep 2026 15:29:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNv-0000000BPRs-0ozz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:20 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so1290235f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263757; x=1790868557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=GhaPtk+I/n5N1YbMokZuEZealG8lvIjTVsxThoMedVGuBaL0GUPIHh5Qjtv9+eua3v
         ZvfaWGMw9keBgjWWBKR1UvGlsiKVr0pbpTYPfXWP6ncUhu4f7ZPs1yWq0DG7unxkxDDC
         Je7uG015dC5dO4Zwdh4J9Y89hFivKLU0WKu2ltsANaUfcORIOOVB9TP6svxLLokgY/+3
         Mj6uIJORDYILVWzV9zlPzKd9rqH7fdigjRn0uMyXAG8UzgaIG/exNR/iHFMeQKOHCWHC
         u4wx+E62wB/cuJndAYECToX57IoinNcNjW9U9fsiHBAoWQSB+MKW1EUS11KOfbT8zuLK
         Gw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263757; x=1790868557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=u4V0P9PIu5DMWwFBBleqHs1o9iLnXQKDcMid2mKif/6Yug1uFOcRR9BEG7wmKJ3YI9
         vn4iXILgQrHkT0jaDwWmUlfFiRA0oLh0SuGX2ClbZfqnvOb+K53au2jEqke9xC0syBBt
         hNbpxgUFfmCUesYZA1BSuk3akbYOoGcNBdTY8vVoNQIvNaUur3iX/I3rTHT2E1dBz1yX
         u/NwYALjuvhyKRSJiY4l2a3mW658qcKjrfZ9Y9K2NsII5kvD6LPyaxwF2JpRrhvQGw8R
         urlwmPCsHjr8ygW2Ou2vegZH6SDm7nEweRY4EWL6Aq22tt3xuTmPSrbCh6kofO99gMBe
         D9Dg==
X-Gm-Message-State: AFuF++mOyypN4BkU5LH9l/spnqolTXxSkPG37sI7fsRlI3hdQ/zKVAZp
	SBH4gB/4LIm/S6g82Aujuejhk9bWnAiyZ4o22LAcwjm0MINYe+YAPGy2jLDfuBEWGgLk4sFkTUT
	gaYHWUqE=
X-Gm-Gg: AYBFou2zEzix0PuEx8gr/aSXbMCsI06Uo03Iguk93PrwVSBFLSdNVpXemFAmOFmfCSc
	VT8J9gae07v6LRif9l6gaMcvGnOcBz4eY1DDhL7LYHrEKFEV6kju+RbiGx1iVjDToQc4WzfDyut
	//XWITG7uUz4RhlBjEVMuYXeuBOl2FRLUhl7Ad4SOkFpokyRkxLfG4mCZFwkt4JZb2r+doCdyz3
	Z+0Hj+z2X63hWXcbFCRwYIqYLuYqpAL3kW/kYa9HbKpRJ/BZOfRQ2pFOBw2sgSrBYoY/rUj9N5y
	Msbzoca0pAOydton5RlJoI1VJZBiWjDckJMw8ZsXjohmrGm2jjw6FzUmAc1f2Y1MXQb4DI78YPH
	hx8KC/r0vdHEidZd79RSf92UB/2jWHRIVYSnBo77AZn7H12P9/zq/86x6IRSum/8dTXFxMsoiEN
	NyZDTAgvvzlRfAH9dE0gqof7fObVzy214ZWUnzueMVv6HXs63CWVn8Yk6EXz1+Nr2wSq8m+tWqp
	yC0I5izyfYNImB64nckdDMvH37zoKeVcZZl
X-Received: by 2002:a05:6000:4010:b0:485:ac96:7273 with SMTP id ffacd0b85a97d-4887170e2e1mr4826526f8f.10.1790263757380;
        Thu, 24 Sep 2026 08:29:17 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:16 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 4/6] arm: sunplus: enable SMP via PSCI on SP7021
Date: Thu, 24 Sep 2026 17:28:42 +0200
Message-ID: <20260924152844.81705-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082919_301148_FDA993D2 
X-CRM114-Status: GOOD (  10.59  )
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

The SP7021 firmware implements PSCI 0.2 via SMC. Add the psci node
and enable-method = "psci" on each CPU node to allow the kernel to
bring up all four Cortex-A7 cores.

Verified by boot log: "psci: SMC Calling Convention v1.0" and
"smp: Brought up 1 node, 4 CPUs".

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
index 493d32357e4e..b73cfde7ace4 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
@@ -24,27 +24,36 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu2: cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <2>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu3: cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <3>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
 	gic: interrupt-controller@9f101000 {
 		compatible = "arm,cortex-a7-gic";
 		interrupt-controller;
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8072DC98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=; b=n+T0qeDECNYsUiQU75PMd/LVCN
	7scTCFy0z0H0ZnUuM67GnIDjTu9mjxINAJwynUS153v1tBXDHt5O16s7jsNNURNQekldx/7MzhVDS
	08IIwR3DGQQfk2ZI6sOj7CvS+2zvRCYB4v5KOwtXi7iAMfBX3Ld+xw8E/km4mS7M0oE5B/f8JHeZ7
	2fn8wqGEpI2e8yj7ghZdxclfdGsBV7p5+Z3mVziRlizc30kANBd4mA6oQkYDOh2DBBdk0e1iAdDDx
	muL57g2ogDF3tLzezLb7lv9wILG0t/5Zcf1ubB46/+w0IEtzYYmgKlHJSqhwAetZ0qpW/CLO5VLrs
	yMZTN6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9meQ-0000000BeGE-320Y;
	Thu, 24 Sep 2026 16:50:26 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9meC-0000000Be7d-0ANl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:50:13 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so181165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268610; x=1790873410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=wJetY1qR5RDQz8P6xUuK72MqevvWQTRB8xyUcA98wVXA/EP1mCPsUNC5icrgkOThah
         nk+jPIBqkx+DiscrzoMPtam+7a9neTA7yvuugQlGLgI9+XRyVW7OL8gx4l8+E9xMK8KX
         zreeMVbUuZhtQxgA51d86sWtOth0/Zyd52gD0Ba3I524jVClQIz1SJX2M67Zm+8rU8Nt
         8+49YNUkHAmajDVpsOb8cYyCATSIQjSKpT9SUMkUSKCHvkV1fNOnjCiT+aUzq6QOEelo
         jMVxXRhKeDUgwyIsf+OBEvRz097gN/5Kxx7CrTMe9EXdf/SOnQt43V5u5Gaf/l9ygO+x
         YKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268610; x=1790873410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=O746921aFcvMIGWEtlX+i9PzdeUI+xz8Jt6ilDG4v2ztBFNEmryM67a7FXBifXqc1/
         Va0mqTQtS4tdyyYQbxD/3MvmPyyQpaAglpSzpyOqn6ymDCyAjfFBAZhc/98FtJajMaLR
         Ts+Gk7Yf+BUxGry2qbZUD9dfl5VwYgF2sXNQfqHkvGl3ok/P+anrdI7R18ampc6xCpJf
         N0utt2s9RLCgKVjtNq/dHQ32bUm2SAXyRfcPBZCov7a0SfqkHNPyoMKl8ol9BYzRsZD4
         6GIhwI3lTAO9MhupHBSOTcdqEAC+7o5aXS9OLVuvJja+e5cTQWN4ToDBdT4ulA8fm6Tk
         9BUA==
X-Gm-Message-State: AFuF++kjVMA1WGzfR0F3OaREdh8hA+sh8T3bhL36paUrevLHzzKVmVCo
	L0l9Pa/y/1pkzcGBwJqzinDGsP42LyL4uu4FS7gKsPq0kcHpLvv7emUCUUyLHmYp83GjajfoVT/
	XtJ9+dwg=
X-Gm-Gg: AYBFou1ZVmhtkjdw0eC4O1a9nGgLWkWvgbchj9LlZKY+YLWaHe6cVllGXiYVnnDcChu
	FjHSkxZmZpgzOM4VPjxDsQFGv2EXF2ECaVj8m27OP6RvU5raT0qhbW1Ip6Z2CCENjS4Pe78RVfG
	TInBco5zZvYiX1BtDVO+ra2y58HI2lvhtL2TD4Cj0ulnaHzDEkwv5TBJsZ/qW/fEm7LGyzxpJug
	+lP9kEHvOp0iXdhx2IAjzdd1G6XOx//N3k8oaUfNhrGP2cTZ6yLNKOIdU5haVHq849OO7eqOZtn
	IJnOQXMu0pO2TnmT8/ii+HJY75y6HQ+tJJ/4h7LT0cKoqikYG5DTH9jC1MtN9LU0XCT8uf7opRc
	L8HTgNIWY4I84PARQ40aA5j5B0q1XEgCsuXYhMT05uH3goXwNdE0hJWHzevYtCCRFHBcp4kxjD4
	C9ZqzWH7psUV1+yWz8UhNz+zpoCjyf247GcAyKpDmjgJfEUTqqo2IqrNcHKfy4/vTWfoA4nknw8
	RZgIDRtVJ3vDuLTgb/t37A5k1Dk7VyZ5nZW4w==
X-Received: by 2002:a05:600c:4e8f:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fe66d062bmr55000975e9.7.1790268610145;
        Thu, 24 Sep 2026 09:50:10 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:09 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 4/6] arm: sunplus: enable SMP via PSCI on SP7021
Date: Thu, 24 Sep 2026 18:49:20 +0200
Message-ID: <20260924164922.117236-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095012_091567_7B0AEBF8 
X-CRM114-Status: GOOD (  10.48  )
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



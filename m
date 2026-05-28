Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF132CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9bMfuCYDuzUQw576UfmJ0asuE98Zww1G7gRNmQ1InhY=; b=bBp+szND8pvV6aXqLFpxIzYz7O
	e8DMmzRSCcHV0Hn1O7Iop7frJDcsSYjWA38+NIQx9uuclwNocqxkEv8kD/5eN+WkEHA2FvQN+gmGV
	G0UAv+wMlDGk4FTVKKXK9zi5qzwjztqIBZAfExYsMAbrMF1hQNGmvda/IZQf5pxPSqfOWOKF739m7
	PLqoCUaGSIYE/ktP/wEJfdNbj/jOFE0T8N4yXaPaWt167N2ImSLq3bF+Yxw5Yfsq+pE6zfZvH+jCb
	eVxBJX8kHdX4lyMEEUX8Fg7o0N7WtWq15PFi0Emq4mzdp42oI4cUFhNo/y0wZMZtDiFkgOAO0W54x
	Lxc5s10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSirl-00000006S7f-1OQM;
	Thu, 28 May 2026 22:06:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSirj-00000006S6n-37pf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:06:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so19424f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005970; x=1780610770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bMfuCYDuzUQw576UfmJ0asuE98Zww1G7gRNmQ1InhY=;
        b=PzK6JJ5Nn1wz+t6HyT3efoR2I0dsTWuN3WmA8VcnBdR5k6OpX6x604uDQdwtmTSbDl
         lNEyLInaPhGzQjgipKGRwuoDXBA09WzKK6FVoAcL+V2Y2kpiaCXOyfuUkx6xTFgnMB1G
         qB18IEglUmvK8WhExjEH5Gu5ea7FYtMPzU8y1dk/y8L3E/k0moiZ2Soaf9bg1W4duElQ
         qpq9PNVpPxuRsI4HlXTV318dK98AFyOvONbNggwPCE+uVfvALUjL+imk9i9iBG67Moxx
         GKkT+n6YT6eFpxcpcoN5VUs8HHAn6Q6MOeln7uJw2cs4jc/z2Rw+LnxkZ3vdJSiVs076
         3hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005970; x=1780610770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bMfuCYDuzUQw576UfmJ0asuE98Zww1G7gRNmQ1InhY=;
        b=mc3SzL2mFD8H+C0wwq7TAYEoLZJSg101J0W5bkK7TkEd3ItWdBXKjlnErUTtWlo3Co
         GxB6TWUIIa1APrRb4HpUsfaX9B6M74Fbu2zSzom4ZexWpskgP9TVyfwML2P6cgD606la
         d6L4NUYD7QCj5r5VyDFs+2RiH9UrTmDQkRoAMQ8wX9M23bJzZcAIrurh9VEpKuhNq158
         Jpv+MBu2uafrlWaGFFo3Rbgnkw2l23Pua7pk5P3uq16qzJ/bi87e1wEX9qAQrajH23Ch
         h7YWK4ueCSatEFMrdiSv5E9fe3rgLTLfZqKqlPzgXHWvJTqRO/YCYddIKehRATEvkxFE
         PXAA==
X-Forwarded-Encrypted: i=1; AFNElJ/mPjVIbl8Isk4IiguFkHDnlQPIcYvzmpdn2Xlthjhpoug6iTRC0m5wOIX/Gfqyd8Rfpw7IEgpiXXRLdPIrEJDP@lists.infradead.org
X-Gm-Message-State: AOJu0YyRqObXUBMNHhPYmkKS0pB++u3zdGZi0nTmYHn7LxP9shZVoAgJ
	DxIMQ94xMP/9YzSR/g3udvJYAU0WHK9l2C+bzEEB4EegpYrknoR+Zftr
X-Gm-Gg: Acq92OHPFqpf0CkJjGr8CyfD1X6VOYHGYpZtQceJMEsHx1eyicUEo8XiiX2fOJLMJEm
	vX1DQmiFqCSsQtF1m0nNyNo2JbL5x98wHLHMQ2AaU30FsCD7Ts2Kc+QvVPmXVVj3EsmSPyNESpg
	w7jT1I0i9gjKPpyySgiRN/0UpxH2n61WFXZDqvjzdXutmkC/vk38eDV7iHorkcxel+XtYXGQ1XD
	JC9eMUb/741dThkcGF9pnLW5IeNWgJK4x4p1p1/NOQOoG1VUqxieNBUx2NwtFXyQ0b+njNrQ92U
	Ydknn/OIVj4nTQhHgQZLyCDIWH5djlGm212jNrewSdnwYyAnEqDbVl47Ky/XoxldjPocu/ACvbw
	7ZYR9cZoID0BaegIXclqdN5eNkab3rAdSIZChFJzeCrOpafLtdOIIZ9KYz2WSowndVpTscuWLr7
	SNhVjPhuA3jja9uSuv/9prQqMVIEfhcJG2RduiML7gN1DTMBxsDARGsI5fLCaPIHonX6v+DNatb
	k73LdZAl/wQxkXlqC5uizndfhJxqSNGHeZyala43tcOgUqZ
X-Received: by 2002:a05:600c:644:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-4909c07b4c7mr2974955e9.8.1780005969630;
        Thu, 28 May 2026 15:06:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eec5eba06sm4911410f8f.22.2026.05.28.15.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:06:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO
Date: Fri, 29 May 2026 00:05:50 +0200
Message-ID: <20260528220550.34891-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_150611_787771_1CC0F064 
X-CRM114-Status: GOOD (  10.85  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the reset GPIO for the TPM device on the Sonata carrier board and
label the node accordingly.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 7985a42f5785..7a58ad38ffb4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -278,6 +278,8 @@ pca6408_2: gpio@21 {
 	st33ktpm2xi2c: tpm@2e {
 		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.47.3



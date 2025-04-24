Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204C1C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=OP3yj9k+XqQbH1l0dHNqks9U3O
	EbPehMJm+K0Ew878EnaXqzeOYvT2sK9v6QQP+CSYsy9bn5Y0uT+qd6wN7A8WnySrOu2lToycCX28r
	cBU17ZikR7uJIBw/4uRdAXK+kMDySYsd/zD/ITWkUUHRgeTBqu30A3xqA5Y37NtXf2wEvDLoadyu/
	hfqC3zGb0TJgWZfS4/0RkPig5Ccl+VQNyVvwJyF2qZekXT6OMNnciOFBN+cWND2Rg5GN+QLlCISro
	YvoujPhndUaT64Iqq+pmgQUSB96XvHmMipwCYWluP7jnWsUxgvlGUJBzeJYxTpX3pqkaJQjtDBJKC
	I0cAF1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qC5-0000000D1VC-0Zvm;
	Thu, 24 Apr 2025 06:36:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyP-0000000CyWS-2Xyq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf257158fso3199175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475732; x=1746080532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=Ujqh0P2FUUGf4X8heHh96VakSe1+4wKCSs+919xq91kmdy3u4hdg3EdOglGrhY37kV
         flhPWY292raGWPQWL7dkknRnLunfzV1oQ7DEsc/qnUvFOFuPMNCw944LVlz5mVwlPV6k
         S9YXpvTPg6Dx3sSQHqgWEHrtJqAPho8iWbXjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475732; x=1746080532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=eNtMEBfjIUqAjUUvnai9nYaMPbr2YNtXsGTC2L14tUhHl/nFGOGyIAMwYEv4+CON8p
         U7IFkdZGAeIgTUQPyUwXKqdoa0GiSvHi8Gjh1L70fI//kNSGbdjK0wFQCWVJYo0EJSdg
         HBMXAcTaCgcKFjze8uEGmB2pRW2DG/1xPOBxKQLyJJufk9ryJ0elvDGP7TNqAd2aJ9Bj
         H1ObKzCQkLwFNZ9fyPha8LelN4dUi8nDMYRqdrsnj9o+/twHqtMdypknp90G/p5oxC+j
         wbRx3qPiIqRYC1qcQucBqWfDk/DSVHOn6dv5DTYfpGzZ4S8GXLgiIuhzugcc7biz8y3j
         C+qg==
X-Forwarded-Encrypted: i=1; AJvYcCXYYCJnFCPuzltLyHp7tjnLWdXf/4LIhioIbRs87+jMAQEuuxF37OnYXG7u0JsHxxYZPSWhaghTRTYSS7kEWqJo@lists.infradead.org
X-Gm-Message-State: AOJu0YwaYcQTm382XhbSDqkfkz4BnBeaQLPMRp/fW6tVlADJZddFgYC6
	3wMMN/ZM4bEfYg6PADTT9IN/6YS8fhRq9t5jlCEeVjT3dt4JxeD49bPSpEsOsg8=
X-Gm-Gg: ASbGncs4sWMv8R6mv8zLk+IEbmWPxkFqzoI3zGgeZuDK7CqS//07YmCZQorlLBfR8T7
	eYYJ7bSBw3ma4kVFPDPTmWJdc9P72EOWiRe4wY7BtuRu//GNpSDwQLYU6+b4+9GxCmLsWFiUMeI
	Yakh5YrWOep3y2sy3Jjsda6fo8ERPeCUvbEvAdDI1dVUvKGMI+gNzD6Pf2dlTyi7iJ1o0AaVfCz
	Dwyi70gJ55pV2tuX683HkT6CJZ6ckyMKHBy8XYIQd5WG98aTZWqSAck6Tus9QIroWOyath3lFoC
	Qas5ojbHVYmvDNpLBK1vcBpBGaJuKLvnxJXAcYJ7pnaiPsf/BDfauotKIcVvlMLPxMVjlNLt42b
	4dkNy8Et2vAHA/XI=
X-Google-Smtp-Source: AGHT+IEfP4KDLP0ELF+YdFHzWQR/nKs0MjW8gMXZNg1m5ZDmDJsijDCe2zRl33Nt4gAvs8xI/MK0ZA==
X-Received: by 2002:a05:600c:3554:b0:43d:16a0:d82c with SMTP id 5b1f17b1804b1-4409bd050a7mr8473415e9.2.1745475731840;
        Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 07/19] arm64: dts: imx8mn: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:37 +0200
Message-ID: <20250424062154.2999219-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232213_652683_44BF14A7 
X-CRM114-Status: UNSURE (   8.98  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0



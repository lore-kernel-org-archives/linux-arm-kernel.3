Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DA2C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=LYcHj1NZd8IZryAqSaCa+m7+Jo
	8m6Vq/plOxWR5BXva3cj5d8o1d5Kpa5WPMMlBK2YImD44TXH9ff4rtG38w2Y+fNzZWpK3R2K4QF5u
	nfUWjkUHdRJw1O2FfcTuwfYmpSSTd8TYClpXRkd1WBVSTj+uOK4GYJuc/prIpaQPWIXd9mfEIUOYD
	JasNjO2w0uq8rTS31bpocl0BpmaO6y0K0keX/vk4hky6noMTrg3JM6ilhC3BhnV/IzKz0VZyQVStx
	UKomfAaZAOv8s+RvYVD5vr8Tb9OTIT+ir67S0MUgBnuMo6QOQG888MRxn8CO5WlFacw4atwwT83Ov
	FJSkMrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8H0-00000002P75-1D8J;
	Sat, 18 Jan 2025 12:49:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88Q-00000002N93-0mHz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaf6b1a5f2bso790851566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204064; x=1737808864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=UPSl3ywowpMI6V10sWDHrgce41f3NfI+JB6PjfSjkF8g5JFZjcw604qdV14xGuiyLm
         2oqpIstMKRH6NwlcdwaHJT3+ef87E93kOI+1GRBj7FK1u+0HCk+cRBx3rq90wg9nW5OK
         MOQpyRdVkBQ8Dcd334eOfDGieNLtnJC4mRvO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204064; x=1737808864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=QJFLM2TRFZgytLWi03Te7AXQkNidsYfcjAsRiAOG+CfgDuTCblxG07y+DFiuscdHjY
         DkE8KKmZFuU06crZuWuZXb4Bouv7d1jxlyFv2euTRBCgz3x34hVwFhCOEY5p0iumWCVi
         R+8f95WsuxXI/aXi+X2rZSr1sGa+JcTB7MFL0HhlHtXv6CsU3R5+0QzCr6UboGCUfE4A
         gx9rXwAFRBO3XhN6nn55ARNsKZO5NhMnmKTKuZQxPlhgkznN2gbxmbIQnkd1DIJoHVvw
         txECJXewawrX625tsUguFoC7oedRc5Tj+1tGdyS++/DLAGHUlJN3MfpXt4WZDYhNDhnb
         MbhA==
X-Forwarded-Encrypted: i=1; AJvYcCXucq28bKpODwNTuWrSRajBxQcbldAoh/jgw5QlTUMj0egllVLpkJ4XhINwvPHH8hCPRxDPHntvTYzi4owGLdae@lists.infradead.org
X-Gm-Message-State: AOJu0YzjlQB2yXZSFwZUCKIbVL8LnGplugpR/w3Rf66UX/MER8KjqiKt
	5Ff1aXjUww7ftvqIi6xV//f71Fg4md3Z44A3B3CtXhu66risp0pBSki0XU/gInQ=
X-Gm-Gg: ASbGncvGKMXBPz3Jkqij9dc9hIvz1NnRi3a1cAoUhB9W4TXu3MB97FIRBseX0TUCh5X
	3CK+lVpsj+7T4NDoaBaP2ryhL4q01Tb66zvkt0BoOh+w7R5CXSPVzpH0f5h4DQx2p0hHBaH2GOo
	Z+aqZKvRqLGFGhwbpwPYEkcxibSemAAdDUltgmxv9EPCDEECFOlnIpAnat28872GYrE8JJdC57/
	VNHOe0YxwHhO1ylo1kospZCew0PCuEyolNT39rjD3PbuOvyOML7Z7iKcZKTu/875O8PEkLCLa0x
	TMneuvfg4Uq9ai0xQpuUUEE8XICFbOc5JXQZXA6CebRJOYG3F1NDfl3NOOrd28znX8swT3DdUGm
	RRLuZlF6Xx7kFTxiixpW2yU4q8GxYXJALr2RE
X-Google-Smtp-Source: AGHT+IFEvHSDZkW32vI1lJpZjzSOLwffU36PPtmj5J6Lh5G22I+ED1NwUpo77gpSUOYpqyDSVZVxSA==
X-Received: by 2002:a17:907:2d9f:b0:aa6:8764:8738 with SMTP id a640c23a62f3a-ab38cd638a0mr569237766b.23.1737204064528;
        Sat, 18 Jan 2025 04:41:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 06/23] arm64: dts: imx8mm: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:49 +0100
Message-ID: <20250118124044.157308-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044106_219073_3F8F0FB7 
X-CRM114-Status: UNSURE (   9.86  )
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

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0



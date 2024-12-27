Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A03E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+Ol509AXN9QcKlnnsRu6lr9QP7BcBqQWxrtIjE7WLU=; b=sPv7/1lXPOVzoZCkbThFZ9Eq+1
	ScHp94bMhWq45QUXrqguMQSH3z0PmzcLql/pqHl9KStiOKWT+Z6NpP1MHspksZuT3y9xcQue1l8Xg
	lXaBoecHpTA2/WzsKV3eQIAhmx+erXIcgbsRUlUtjOrAkx23eyv06LDe33GiNQ6S7xzyMUsk3Hcf4
	FqcRjQJR+sUItT73k2JVqYnp+ghT7bLkYdwPgp2hO55OtHSkCo1bNffzaFNnU1mY8KWZA18jc2xL9
	pKw/WqPxWenEy3Hir0WWch10dKQBPQySb8C12vUXqcnVDVrtBafAXR6lCE5Kry+IXZaDTT9TKG0iR
	64xZWXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDs6-00000000glu-4C4D;
	Fri, 27 Dec 2024 17:11:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDei-00000000eXY-25EQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso11735228a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318663; x=1735923463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Ol509AXN9QcKlnnsRu6lr9QP7BcBqQWxrtIjE7WLU=;
        b=PUzr/g9aqcTQN3GSxV0zz8icSiXWibA7jtS1nn0w0GHude9KFu9WrtpQM/5jnByQeu
         kKe9gQqpkTby5A7rIfND/wNu7pYa/oyjsiKqQMxpnvJ1xePN8UwsuU/H99EdTP7vHb7L
         MVAyXPeQ0nu/UMjOktUB8Kt9aR5V2cnC3DrFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318663; x=1735923463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+Ol509AXN9QcKlnnsRu6lr9QP7BcBqQWxrtIjE7WLU=;
        b=RkukusF2+T8f0+BGHD0PC3Ohvb7St8CkEiyfiqDDIHhRwGqtnU+3iufKclm2L/xsDf
         c63F1K/ZM9S/37dafWz1zchHzZ0pjSqXx8Dt7Ve+7yrl8OJqY1mVKGymbPo05h+4n21J
         cvDDhy98dkMIYBaYPtdWQxL/qD50XawLD/vdHgpwXjlf8g8nhyUb07xMtpwIJLuRoMjv
         Hq/wcCe4O+hi+6G0LwpGniHzyS4DolwcnZWMNYGmjFGS78Cez0Gl1tXaUWQHAV/MzhGP
         xYMUlxWSnWXmCHLEBXOU2L/IQTpvY8q2taLOPBAApIoQq9qESoXfrlPIoPPt89cqaGfh
         jcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYhUJxd7XfXFDUCTMJgK5oC/v37nErw8UiSi3D5n3v6yi01IMIpbFqqXUml2qSyfex/zdA/fVazp2CIR2j5QOk@lists.infradead.org
X-Gm-Message-State: AOJu0YwTrjbpD2IbGCKPM2st5LzSu2TY/SzjiAWoc9Kg9ia1lopZokPz
	J8r6LoTAbaNZgegrq7n7Q/4h1BROP8RArb5mS9DEKXosEyR5s4QDJzFM1NdtPVw=
X-Gm-Gg: ASbGncu9rRSOAlsGgiIqcU3qWA4ChTAgIe9uOHOVAWfTwkAPqH5PtI6W2MnOu5Gw9ib
	ZSTwUOV+VV2ft148KQv4NwoQ9L3WSJrKwsyFgp09RqTWGxI/X07+FvaRrJ1pgoyC60Volt3VaPG
	EZ04QDIxCa0qAIsXQkdu9Jl4sox/DI9msqPQzPHuCqa1d4rmTALfkdfNVFpbO2vMz5FmW8NwOkd
	Cd4oN1Hzet3106i6yN4S7OHrbIVRJR7SPwvEZEnWQA1VEhpkfQaRBaMchyzf9CyU+BDv3560y/c
	DNrvOv33U+buuszHUn/UAw==
X-Google-Smtp-Source: AGHT+IGn15Euo6aKn+YqBtAxfzqKuDORdglC2oyMCv+ocfoAc484ttWncQyapARm20g2sBw1veFNrg==
X-Received: by 2002:a05:6402:3206:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5d81dd83b23mr61279573a12.5.1735318662742;
        Fri, 27 Dec 2024 08:57:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:41 -0800 (PST)
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
Subject: [PATCH v7 11/23] arm64: dts: imx8mm: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:14 +0100
Message-ID: <20241227165719.3902388-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085744_536255_4991ABB6 
X-CRM114-Status: GOOD (  10.73  )
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

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..b1a4cc521bf4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -645,6 +645,7 @@ clk: clock-controller@30380000 {
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0



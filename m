Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9717AD49780
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdCZTLlLc9wAxF7wv9T8uwvI64qeiIyF1MUa7CbWwfE=; b=zSfiqQlc/6KNao4W8fIfejT99w
	G6+JWOQYg72Du1gpj+WCbc3L4+V5VlYFekeKb/B6VOiQ8fV7jWUIgM2QOl1oiYfqMaduj1ecUiMTo
	qlsHJ2YX46pD56l6GZYTpu6fMsON9hDf0gPNsrEfGpgBRL+gGURtG1CFNGEriGGsPZpqzI4bVu5oU
	jLJFfJT3P27YdNAjsuHxQJROMxq+RPFwgkr0WZo57hxmmHF6I0RYQCqPbgTBqhY25pmQjYfkW0Ca0
	YH+y0ZOIFIgMKy+7PKTsQpXS+omPE5oEXhiEDRYdfgysF+KhYqHFk1gqtHndoGIKF4nGgxRBp1T2i
	MUIdckLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo7H-000000049en-27me;
	Sun, 01 Dec 2024 17:52:19 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2Y-000000048SA-3HSD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:27 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa55da18f89so553901466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075245; x=1733680045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdCZTLlLc9wAxF7wv9T8uwvI64qeiIyF1MUa7CbWwfE=;
        b=Lv7p4bSegoyRY+Amt3TOqZec8G/8yiijBXJf/esaKwiuZT7KPZWaG5nPIuEQAG+tkG
         caSvAqu+RYF7/UvMTfLG1T87YethnByU36Rk5gojEm+7Ve9QQCrb10tPS2RiY4HuJ+M1
         9jcYST4aqCCkllVVN+6pbbafl0Gu/GAxJ1V9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075245; x=1733680045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdCZTLlLc9wAxF7wv9T8uwvI64qeiIyF1MUa7CbWwfE=;
        b=OQ8ulRWrBe6aDQIRNKpYkj11HL6AAud0tEhbLIVvDnYTpYT0iTm3W49KFHbFHX45cU
         fiZz5IQ1Sa50vLqPGzfiO4jK020B4T/i9kaETCF3s7xu49PjvBOW3uHLXT7nDsV9/xdZ
         ZAX4U2kBW5eVgedtVXIsfJjxp02oHxRG3FSqvPoFTjO4qfsMOaV5ouBCF1Xi823aEAVS
         Om3iOhLaI8SKXfrZr3P3JzP9atMPa2zrOiIL8DEUiThB46A7kS8JPRzzpNA9ftpj3fE/
         TZ99Rjh123BsMChqm6lE6LtafkS5uneKV6TEItIMxsPRL6aQ1xJ8O7aZjVqDryS3Okz+
         nPDg==
X-Forwarded-Encrypted: i=1; AJvYcCV2t2nHXTNFAKNByv7YNT2q2zBqt6ESgwxOL+zN4xkT2fJkt9/MQxqjlmKvoXL4LJYvK3pK0ZpeA5xHQdgC4uc3@lists.infradead.org
X-Gm-Message-State: AOJu0YxGO1mPiZa/5XabgSDimJv3zuE2qCxi1FbJvjFSBKQeKAMe3S5i
	rnDuVHv7jua4J5DUP30CIfmcX9wjuKa2xlNuovKGJGoHNAHcduDT2JIRtsRhNVc=
X-Gm-Gg: ASbGncvZX2zL05CthW4G3zIeDQQbPpAHCsFD+jXgBfUJIDM20uRGnpb8Knqn+6aqee7
	gGSdfRRHILAJP7T/6g80TLFF6CmOuXq/R5Zb8EU5fUnbHOt3eo+qmYyO4Q8MjSSYwL2Nz/RIf1t
	+oGMPJgBgLDm5rENkr3RFUMfv9ShAAW+YkkWPsO1DZs8irYzCdSVADgyWXg0cZT7BBmIjFKIycH
	a5IcAM8eA+Y9KEDr1St761Bm1GTxZ+C57yJXTALmGqxHPMzZ4YFiGkxKqzLWUOWLNyGyRAqMvC1
	tATGHxtc+eLRcQCtPr3jNfi2AVY4iXao+lv/MZFlRtV8fEtSvmT77wgVCPbrL5eUJlw4aYhjIvl
	GesHbZG2cSv9dtdnj
X-Google-Smtp-Source: AGHT+IF3ozv+j8XMyBjfOQVkJHdfyEzrE1dxQCNDxUlGdrVm5RNwVlOhcKaS/di184NLxV0j1TYOVA==
X-Received: by 2002:a17:906:2922:b0:aa5:639d:7cdb with SMTP id a640c23a62f3a-aa580f0ddfcmr1431249666b.22.1733075244684;
        Sun, 01 Dec 2024 09:47:24 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:23 -0800 (PST)
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
Subject: [PATCH v4 04/18] arm64: dts: imx8mm: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:04 +0100
Message-ID: <20241201174639.742000-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094726_817874_598E5BBB 
X-CRM114-Status: UNSURE (   9.70  )
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

 - Added in v4

---

(no changes since v1)

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



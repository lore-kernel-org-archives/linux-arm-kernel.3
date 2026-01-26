Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E898CD13C27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knPUlB2owHnkNVv4SE4pV1/cSooTAZY2IewxcUnkdP4=; b=IGQxkMAYAYQ7zSw979sSS94eQm
	PfiezZ2AU0PUp3vW1SoEBVv7qNbOJX0Y7H62PD5VYg5fxhgnooP23BuKSIqfaiyVc+GTRxIHoWHVs
	Egd+KW1jknYcK34jzojXLH0deAG7HiGOf6DUiFUhULgdGDbJ6iOpppPmnUSD0bhfBbqINZcFJ3oMV
	HG9KDGDnMZJCvfJMy6S4z7Mjy1+2ztjlkPxVWaLzkXj4Z63/73Gfh4x0Bx/ON83V+C7KQf7Cc6+zy
	vNcogopNHUpJkNNEaJ5iRkHSsWndyrcSXOShyF4kzJf8NqW7Ul+QsjkE22FP5UVq8WRuAq3DXyMls
	QZtO3n4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO12-0000000CjJI-18ia;
	Mon, 26 Jan 2026 14:56:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO10-0000000CjIn-1jAk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:56:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48049955f7fso39370105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 06:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439388; x=1770044188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knPUlB2owHnkNVv4SE4pV1/cSooTAZY2IewxcUnkdP4=;
        b=P+OFoWz4tW/0KxyK5cuN3krE6vl6KY2jPqH1ZHoeuj0EjsmNuXDxWFomSwYhnucM4/
         8nYTebI+qb2gG7pLiPXSJZ9+N8DqjD0NmbndLDIn8YvonXv1D3zmYq3vtPvmnArATidv
         1IVcuG+srL0GWxPMftF+hiFCTPevGvy0u1saBTkisi6VPg81MCYBxw9rrTDJ6npOrjKJ
         8TfljfXApfn0itHLe2C3lKzGBpOj7lc6sRK4JNb9MFoVEManJwjx7FcSi+sJ+XCdFXXu
         j8HosNzjVmmEof/TJnjit6Ko7XOM60ZonqDPSje/kD+TBFtDL0E75C8F0s9urV0B5Ewx
         p0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439388; x=1770044188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knPUlB2owHnkNVv4SE4pV1/cSooTAZY2IewxcUnkdP4=;
        b=NsZ54/5rnIaMbo2r3CE68p0V11Ad1AHMLqpYaQZkc6HqZi544+QM1/t5Oyr5OtWBas
         OAr/Y6KFpDVxkQF16njVRoo9RVes2ZiXJGKv60hrl38AgVX2UjwH0C8J7HYaLVa9vXxm
         moMjizNPjmdtE9LeAaLT6t7xRPJWPqnoTd/d72KG7dp7Bog9IRXwvxrFs7G4QTBq5D9z
         zCCjoFrq6kT3aeg75HiJY2Yadm40esvB4PkJCWcK+6jP4bL9DzDewV+AE6v4lzEVkoFT
         xZq2SXCpYh9+NAWPB0Xjl5QN7+Zy4kRrXUF1mvv+rhbDxdJrNZbw2oph3KTEuG2bmVPW
         YpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoN+GxgL0DkTXHvs3i8YmMQYkRCkRkX07EYZav6lgL55x3jf7hWCadpK14cioPViSNBBCjsghsF9Cpwneh6bVc@lists.infradead.org
X-Gm-Message-State: AOJu0YwSUIbPh41cMWEIGvcN46xnfTvuG1y0WfWFtv/58qQh+4j9r2HZ
	wph79eVIVooiCaGdV03AFnzLMKdUerOqcMps1JbiIHiPvMKKxRjckP4/
X-Gm-Gg: AZuq6aKJiEVOvOqptHUJ1KJ5+VIe5+wTdg6KjTU3oSW6bmDUc1PhUwnVDeVhFLIDNZE
	nHA08WeI49hosy6bjalBTN1ZK1Jr2R/Ur5cx/xOk7NjUsF7Vi3LN8pg5Okd/e8ZW5X4PpWMSNwn
	rl5cYKlbtmNtQnaqs4qEEusPM9A63AkN41D+VMzMOnTcZPOPqNnqLwi7unzdf541EG09R/o+VA7
	lNX0mQ4i6rhCDRLGSCYHh06OtDDid3UOEeRSQfrRaFOO3Q/EsD5D97g32uoguRdcpSwt6NZRyqF
	lWBWWBJ6loaov9G/Srw5VX+1PHN+0V/InBxBBnyvjf2bmSJKgbYBxpTQfRMycCo3qfg8tnXN0ty
	3qHyISnbI0KrdlXMl805Pv2eXnaZKinb08X4QT5cb9OLH7vxkVr8l5qGSlAQJAhe3c/lU87YJar
	WO1DZZlgt8qTdJ0r1fyLvBnmdb0dFLINXm9AcRVQ==
X-Received: by 2002:a05:600c:674a:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-4805cf5e6admr76087785e9.23.1769439387866;
        Mon, 26 Jan 2026 06:56:27 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:27 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Mon, 26 Jan 2026 06:55:35 -0800
Message-ID: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_065630_461724_D97DF860 
X-CRM114-Status: UNSURE (   9.29  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

---
Changes in v2:
- adjust binding commit message as suggested by Frank
- replace whitespaces with tabs in MQS pinctrl definition
- link to v1: https://lore.kernel.org/lkml/20260120150329.1486-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../devicetree/bindings/sound/fsl,mqs.yaml    | 12 ++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 3 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.43.0



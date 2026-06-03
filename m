Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AD0CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zPqZJh4lrGWaEtR1Sz6JxGrxryGpEZ6DtkLfnuyqJQU=; b=48h7cPnefe4xAF8/NsrK2isJN4
	l4oZeXkRNDCgFhKb1g8McEefxfk3pScZlCRwImqa0gEAl8T8QFkU4XhguTbpX+w2RAX9JgylZtwwB
	LdmxzyGu7UbrTIsSrDbE8kgmba1FfuRvf3rEXt/ZLKOa4+PyJbRakwLBglUtHgbC3YfTBYmKWiNOh
	pbG9Xuw39VUZCzITf4WCqpwDTmSeD+pgeqZJrftVr6flAl8MKxgu5FtHC+5EyA/oC99jQ/5S/J5vL
	qFoYxmcg0CC+imjpCUfR7ocGhf9oafYsczaXkrp9DA+lCkBICZF1f2BrZjxJi8WNZbdp8drTWM4JG
	Y9Rr408g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguV-0000000EabR-3Xit;
	Wed, 03 Jun 2026 08:25:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguT-0000000Eaa5-1DxQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:25:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so19692385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475107; x=1781079907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPqZJh4lrGWaEtR1Sz6JxGrxryGpEZ6DtkLfnuyqJQU=;
        b=kbg7kkNAqC1XK/OdNggT3MnNhV9mBidHcLkRrJonGdLqzzepl22t2oEBsnvRUyw0z1
         JKiXnpEIhjK3NYjB6DcxCniiwYyfBvYG01SXtLNmUEncFi/ciM0zRuMLUbIm9aALtLsE
         5WH4HUrfobc9n9Hcraw+si9/DAtzAfwVJTUlnzM8W2btauhHC6+ecZUK5wKJZxNn9g+q
         qtWVbYuXjcM8AosL/l7PfO9yNDP59YVCEz79WemP8X4YyWqH+flxy8i7e0QCHJe2d4th
         g0Hf0fPHrGJVb2/buUvs3wCneTeoa7kMa/5W78s453Btkv8fw1V3lS47oZFKT99y4Il0
         rbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475107; x=1781079907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPqZJh4lrGWaEtR1Sz6JxGrxryGpEZ6DtkLfnuyqJQU=;
        b=XxSS6bcz6k5HNZVV2cL4Nr3ym2Kv2LSmfmZpS+QPMeAGslq7YegBrmfoPlflxGQvE3
         kMNNyWk3fRGlaDJ7A779WFPpFfSLMntQ31nq0jnQHt6kfBzgWkWmK1KIU3tICxDN5mCB
         gPKOi+UYbZufxMjnqsvaKRZTwxNYhlU9qxhkF+Y9aO6HWNCT8db7hqcNycji+88eE9Mq
         3Mkcx73kjWbWCUkHz3zJVfWBKmtJ57TsHc7Itm44OMsjzqp3L2HcE/zwFj06kG1D3ytD
         oLSk7pzcC2ij+MWudOaCTWNlI0cnTGVyUQ3wTuvNVtlTT99jy78MTSu/kV38KAgAR8nM
         a8BA==
X-Forwarded-Encrypted: i=1; AFNElJ/O42NB/ViYEc77aUDPgX9bp1SJ7tEweXkY5vMXt7wWZI9KLQjS45R3CSLbPqD+SC3s9OjRXSzaFD/8llmOjEaz@lists.infradead.org
X-Gm-Message-State: AOJu0YxyYdQILPgCCmvt5DoM1Bg2RrAoYLhSJdMxg2toBxk8On2F939J
	b2etfOIpFEzQ/5j2HuCb/I9BQrQo4+fJf817bmCiiYF57wGn+ZoTox7L
X-Gm-Gg: Acq92OGqhHEOn2h4nBPr454s+W2bbqeUc8WiOJsxAh24m8buLUDnhBwfTJSOik4uPoV
	WlchQm6Gx5awCK1Bb5tr2i/hEwm3DwsJQ1n1FFBTPhkqElnuQIvEkblJXPFu7TCeW+AqB1tUuIY
	bcL2M5y3F0flu3CrFs8XC/2JNSsyNPGaNsEc6HjDc4CHA7rwpVzs1w40GtvV0AKvGtxkMnvzjqZ
	YtuMZxkUU/b20TkQwGnQ9j7ryMWf/AwNNaPVbZQxdR/g9391omhhWEZVAH7jrPdZZ/HmeL3PeN6
	LpeFOlikIVsKKJ0lEEHOi3LmX3Z0efspMR5/8/Y9PEaWDk3YsHQ8TpUmUdNx6St/9JpsQlDANZ1
	annL4B9WV2+5A+5s9AukkoUzplfH9vKRE/sRRTTE9cHhTTp/UMJZwA+vgrcBz2NaiRNW6sRID3a
	aqrioRF7d/lQUzmALnnE780rNNAxiAtpDIBFY5tqpyYad8izNs7uTEwtL2Msh//Q5wynuklc2bf
	AdpXmGZrk89MB1CJ+Khh8EyC3WxktOEUjg+LimOwsUVuMaB
X-Received: by 2002:a05:600c:6290:b0:490:b9d3:a9ce with SMTP id 5b1f17b1804b1-490b9d3aa4emr14885625e9.30.1780475107253;
        Wed, 03 Jun 2026 01:25:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:06 -0700 (PDT)
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
Subject: [PATCH v3 0/5] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 10:24:59 +0200
Message-ID: <cover.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012509_338232_0729E894 
X-CRM114-Status: UNSURE (   9.93  )
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

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

v2->v3:
 - Use reset-gpios for the TPM instead of a GPIO hog
 - Add ADC1 support

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

Stefano Radaelli (5):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
  arm64: dts: imx93-var-som-symphony: enable ADC

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3



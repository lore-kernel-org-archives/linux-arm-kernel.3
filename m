Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEADCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AA8qJbDS2PXrHXWRwL/CsSJDqnLVXMkoJNGc5ktbBCE=; b=Lmi9JGzgftU1etMCjpfBz2vcsy
	pvxJHGralzAFcrLDHIGYKHV0kk4XtopLGmXCg4EmzhJcFj03slW26AnFzntkKTql/bVsz6ZvLYU9a
	TGOXdcTPB6+LflghqCBmjjeG9cZo0IOoqTEAIEMppOPIvBlISVjKwPaKBjfCxKkwahp84Fm25uCx+
	H5p5Qi4nArHHtV4jZeXcPmrAk9XRaaEywYtppNMriWQX4kqxHpuDroZsKTxEdj92CP1Rck5zWfQC0
	HwSMoIuuxigz3J1vw6Tz4U0GhAtNJmZbMnaJ+JJ4vzCSP3uCvQeKEAoKlICKgwhfE9ObEsm6lj4mm
	ZsNaQu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNk-00000002OXd-2I9C;
	Mon, 29 Sep 2025 11:49:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNh-00000002OWl-3fKX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:49:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so23488855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146564; x=1759751364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AA8qJbDS2PXrHXWRwL/CsSJDqnLVXMkoJNGc5ktbBCE=;
        b=Kk7MFgu8k2StpCyOusIzV0DFOWL1uNK+3X1uKZH8HX/ob++gjrnet+fLCETxt/r4Yf
         YJ4v8vQyn47wuUDaR1GotW9OvhXF1sV+kXm0UenJIz+dOpejLRrEdtZuqn7adYOUS/St
         7w6oMAaawU2Uh2ucQb2RXa0cJU+jtJriUBC/j8Pi5Bf5TGilub16tC7mhXVu8Cc6+s8G
         psfJkxjlbyvotx6NAZ0+LUQRLJJUpdhF01cm+Kwj/YPZTR8MBhdclFlDDOdp5ubTf09t
         OKpi6v33nUU6NXyNANcIawXzKu+MfTCKUl7Nue3Fd7RSbtbY3m3xQPkUwznplPXnuCLS
         qNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146564; x=1759751364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AA8qJbDS2PXrHXWRwL/CsSJDqnLVXMkoJNGc5ktbBCE=;
        b=ldny3prCkemeTzXIvDuGsGtn9a5qgX1FlDaSzGXO0eVmunPnbRhT9Nplgjewm1brAN
         qJBMd0gn/YcnrUCZrkkv2KwLIdy944ER4sUxyY1esFG/ad8i6jVkB5QxPVzlEMx9lbYb
         Po8BW7fF+Gb4LtJ7u1r/KlnxHko1TEJ5jegdRRgep1oYZu8TOq7PD035ruB0z12VWBVO
         mh3ldqpYsKlQwV0nBz1C47wwbq22pHxw0IHxykJTk1uBGomR36PUEM/Q11kP3Q+WEhFo
         Zh9kXcwdmi4cF8tHxJVRC6XKoZiW4tZ/EoPh5Pz5kNJdC6r3RI/K/YsUcob7nd8dUKha
         FVow==
X-Forwarded-Encrypted: i=1; AJvYcCWLFZW+2HRdl3cSH9vLuJlvm6UEo6Y7xdQRAW1+2JqH3xZNlyPnNVAVcG8u0QCaDFdVeRuJIGJ1MTmKOBtU4QAp@lists.infradead.org
X-Gm-Message-State: AOJu0YyM5pIrCwyTuihvYdQ2Q28gKzvsHVxPuLgmQhaok0Qigo4/jlhN
	8gPpx1sJsCNqwq/7LH3nOliz7Doe02HqgHQTpeXY4MXWx7XrtYXXXVjk
X-Gm-Gg: ASbGnct+kKg59nhmsEQdjh875lnTDI+VDKIU9ehLRF4yfDgKwGnUXLcOy5KB1+9b0UQ
	fXF/CDspZu77GV0/KfVp8yt5Bbs695iWwnjzJwF9stBoaGYVPX31tNOBMgzyahN6OWjGZtSumIa
	ZJ4BpEtgjtbvVAE69NDucXL0xwX93JFY9Mut4rEI14fTUjZF1miXTIH0scjqz+Y36h7NYzmpV8n
	7qArJT69tyym+Skhv0YznW1drrxVr6yBnlC8hKJL9vmnMppPYlCHZSy121raNJAmKww2/gVqUcv
	9oK5Up7I6pH2Usub86bX6lK6TquozpFB7KsDqiAUH654SnzI7VRSi5JusgW45OcuawBItKRkR+3
	MYa7M87LkSWsd+JLBoSi39w37ZYl/b2VjRn6zSknlOC/grynBo8YuDasaO26NpTkmQE4c6ug=
X-Google-Smtp-Source: AGHT+IHWIIGjN6nhJ28ac9trCVEFZnQxU7WiTxI9XitTonZzPwwSA3UglkJvouFg2U2iPv1aIzbnYw==
X-Received: by 2002:a05:600c:4e46:b0:45d:dbf0:4831 with SMTP id 5b1f17b1804b1-46e58a02073mr3602305e9.0.1759146563815;
        Mon, 29 Sep 2025 04:49:23 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/4] arm64: Add AN7583 DTSI
Date: Mon, 29 Sep 2025 13:49:11 +0200
Message-ID: <20250929114917.5501-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044925_923674_4BEF38C6 
X-CRM114-Status: GOOD (  12.19  )
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

Simple series to add initial AN7583 DTSI. More node will be
included as they will be supported.

Changes v4:
- Add review tag
- Fix alphabetical order in Makefile
- Move PSCI node after CPU node
Changes v3:
- Fix typo EN7583 -> AN7583
- Add specific compatible for watchdog and crypto engine
Changes v2:
- Fix DTB BOT warning (fix crypto compatible and OPP node name)

Christian Marangi (4):
  dt-bindings: crypto: Add support for Airoha AN7583 SoC
  dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
  dt-bindings: arm64: dts: airoha: Add AN7583 compatible
  arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

 .../devicetree/bindings/arm/airoha.yaml       |   4 +
 .../crypto/inside-secure,safexcel-eip93.yaml  |   4 +
 .../bindings/watchdog/airoha,en7581-wdt.yaml  |   6 +-
 arch/arm64/boot/dts/airoha/Makefile           |   1 +
 arch/arm64/boot/dts/airoha/an7583-evb.dts     |  22 ++
 arch/arm64/boot/dts/airoha/an7583.dtsi        | 283 ++++++++++++++++++
 6 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi

-- 
2.51.0



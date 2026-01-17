Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15153C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUAaJXmI/F/1af7Net/YmbJOyQv7O+4kkKkCTpHdDNs=; b=LvbDa/X3D/zJQD8TITDo+o/MHb
	Aw9DODnGud5I1j3rFBz9OuMKfeOfwCOSWWhEvLWo7SZmtVOm867rvSAUeLIwFK31MHLxB8fYUJc4G
	fhkqm4BLqsRkVMS5cbNgKME5/Owk9VdWeY/HSTDMQ3yjGHJ0Zu5UmcEuQNdcZTBPdgTf6H6M5yRdV
	pVUAQ+az5fFgUyrahesZ+WqQnekwmiYEbVYx8AzKqqTFGv7yfp4KAxzHc9dAOm+nG31fkp37JIv2A
	FdX2AVsLMxSMubtsJDk9khhD278373SlGvzA3M+8FijYhTajz4AlrWqs0K6uahqZXIgCea6Gdd0rb
	HkLg856w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0z-0000000F5eM-0Tqr;
	Sat, 17 Jan 2026 01:22:09 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0v-0000000F5dB-0T4x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 01:22:06 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1233702afd3so3309939c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 17:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768612924; x=1769217724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUAaJXmI/F/1af7Net/YmbJOyQv7O+4kkKkCTpHdDNs=;
        b=RxVMns9ckNbO0LizmUThx8BiPETuGtCNVzoGZYeghpNo0GF+RfmlDDS95gmCosZJNN
         6mPnx6FFdtO6+XuLjfy3Kl0duSupHH2tm/SbQpI1J/0CCRdCm7XoXmaiwUbAsTJy33bB
         NeM5JS74XCzvIzbpHdO3CwlDMnMT0FGWPfgINIOwNfu2CVFRvGaUR6wVJW26TLZMzjgk
         NIIVLcXLhMmur5kzkXUnpGEAyBU5m9KOiiHCr1eXUmPz3auL/JVUWfK2cqwWUvnDEL6b
         hK4BxZ5srKFjL/S9+7reX7eibRrMCyzGGV9kKmUFBz1m+fNI4DuWu/3KS7cQTypKrDBC
         LxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768612924; x=1769217724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUAaJXmI/F/1af7Net/YmbJOyQv7O+4kkKkCTpHdDNs=;
        b=nbeYrTA04P0HkVWseS77cEJ0vVz4XLbtVxn0Kb86A3mBRKe72RvFoqsmKnafDLpTmR
         xQEtq9+n9RrYIgL/Xt1fsLSbgRbmY/WaNTAY/QYq2kt+Qlh/KuXdh3CTvSoXKUN6UjG2
         Wd4jr1qRt+wU1mUt1KjPSKZxZtMOuOhd5aY0Ph+MsOQqx2a1JayO5oVivglEI0L4sOde
         A750dYMIocj/tK11oZNf7h5hJyeLQf/6i+dsZPh2Tbn/1ZHAOr8VOxoKDyu1jxx38Y3j
         TSGsC6n3Yte7qGM1AVExckIzk676H0XZD9h2rcu5AxIK9rbS0sc0qSryBrVTy46CK19B
         3iiA==
X-Forwarded-Encrypted: i=1; AJvYcCXR03zCXwO0j/ZG/Owfun3fBzFY4ct4UxCntkZj/Ui2+u24LdLHiuBxkmzXAU6QfUDS7ZEzBUbTHWL3cw/zFXfI@lists.infradead.org
X-Gm-Message-State: AOJu0YzQs1PtlSHJiZt1EbNLWK+lLkbJPyvNMr9Rm2O8DD99/eqpXf8o
	gdc/rWq6OcsfHMahUl00tdWLyhrI28feJ+5udbFEbWXPMC0BuKCEDcXuzBcT3U1bAl4=
X-Gm-Gg: AY/fxX5rAResnyz21pccXpGyrFOtghZTi+Xu9/9YYqr+F03XZvfDZqh5si4fCaeSuTA
	Z5fdyuEYaCD4W4okmqOfA+9PwsInGN8dmCXflYwdv4C3R+6kHfUtufH/BO7TEXUlpGbIVD+UFJR
	QnKuBVQu34vwvnhJw7paZ3vCkHDNWszEAjBswh2aUp6pKbfNXKObbty6GRcQqTYwPb6uLo8H0LY
	/nd+fB0C/mpf03U4/ZSXf/jjaN0BRELaRpNuT4W6+ezWbsqoGldln2gEjeg/bKalZLFDIpwoqFp
	YI75Kk9gXFM14MNMdbkVP3yzdPb1M61s1n/iXnm4hrsFAlWTO8+IjV9Imv+GTH7OFMTocWnbP+u
	G+k86Uo2uaAunQkt6D/4QTZTx63BPhqPnaGMk6yinBTlIZx5lIbe0RuQoocsrnoJBYTGed2NEAD
	J36eC+GlqBNmk=
X-Received: by 2002:a05:7022:6988:b0:11b:a514:b64f with SMTP id a92af1059eb24-1244a72ae90mr3884422c88.13.1768612924273;
        Fri, 16 Jan 2026 17:22:04 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac58140sm4388151c88.4.2026.01.16.17.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 17:22:03 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 3/3] spi: dt-bindings: xilinx: make interrupts optional
Date: Sat, 17 Jan 2026 01:21:36 +0000
Message-ID: <20260117012136.265220-4-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117012136.265220-1-abdurrahman@nexthop.ai>
References: <20260117012136.265220-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_172205_151815_944EC325 
X-CRM114-Status: UNSURE (   9.66  )
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

This makes the driver work on platforms where interrupts are either not
provided or broken.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/spi/spi-xilinx.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
index 4beb3af0416d..24e62530d432 100644
--- a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
@@ -38,7 +38,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 unevaluatedProperties: false
 
-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801BDD6406D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXY85Uw4s718bBbfWJ62Db0PnAMMSAWmGr9NoDA95ks=; b=KRVweEo07bHW8bhq6lzfVudpdR
	eNVa2ZyNlGUQpOwFg9AFEWnrdoWprzdZU5pdRId2wSdCNOyR3CVD+an9Rk93XQs5p7+vHqehiupo5
	NiSsT8F+NcYj/6Gi+cBOeQnoKa9V1SNY/lgFIkfptv2YdwYOierwb1dV5gTxobpQKMvpXpM2xpD/5
	CAt5SdyVRLRos2OOL6zKg/pqFC+zuQTqR1V3/tXoJVB6vaVF2EuheZmiRuy7S7WmZaWG+EhyFzkTo
	LO0SA8SmZSqu9LcD9VTJCvNKIPoaSXPmNYdQZ1F6SuBoy6wuAeNYLHDBbc0elbvNrRmHCCXufGUWA
	NDQhKN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUa-000000064GZ-34vA;
	Wed, 17 Dec 2025 02:42:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUZ-000000064Fr-0H9K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:42:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso73755b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 18:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765939337; x=1766544137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXY85Uw4s718bBbfWJ62Db0PnAMMSAWmGr9NoDA95ks=;
        b=LH0eqOnTaUhq4LjWosU/Yu1rHY6kciXKY9TSFdvEytf5c5VDQacmhxsWqfD1KTnwRB
         cAsSE5iT82k2m2zuszI2W/MdV8ByOvSil09chKDvwN1BF7vl/d/1aiNOGVNSEK6UMTMO
         yESWD+m8zf6KvgppkqC+RnljGBOLfsbkGCuBlQKI88jjeRP4CB5xTCC8tXAp/fWuwq5g
         /3U/2+G5LJisJmaFUv4mrAD9IHWQEge924s5grE5v2HOLU02NxmvUVMtocbHsPGbPZ8f
         XEZF0manKd0OppYjxjSm0TtbSs7I0bou2AWs6wqX+iHIVZd+gUgoeFHimtIhmK9ND1mw
         dL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939337; x=1766544137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXY85Uw4s718bBbfWJ62Db0PnAMMSAWmGr9NoDA95ks=;
        b=WCrz6yx2DiYKCDwWHn1Kby729Iu2obABPPI0Gh9MQ/dLpXfkB/HI4nA+rTP0GGdb+T
         V4mE7dZQa+Hycw44TEz2P1RpIocQ0g9NHRdf+AFcfFTCuaiBH7eAlfJap7qxQ8bzeXWo
         Ka4POvad8DB9KpWbNI5tzwAG+0XhvBEwbKzUXAYf6NbiGCFuT5LLfqc3ge6b0BTUgYiA
         AFcG7c7xxSZuaB2DnU6xcbpGs8TFTgnMpiRz5V5qgCHK2IEpRrcVaveU0FesewXM1COj
         2lIJaLiNRDi46YuyYOZEP9bWzysAYZZ6PzuSAQeAqwhfRj2kTlKOS1G1he6pkoAvNA80
         pOtA==
X-Forwarded-Encrypted: i=1; AJvYcCWtrE7f1MNgbvpLXMV9WLmoH9apgkywgQv1rzsxp+khF8o4Lr3vuj33yaXmxWsNXN5yZG3NHLJX222/8C9aBaav@lists.infradead.org
X-Gm-Message-State: AOJu0YzT68py2g8zF3Afa32ZHBmh4nfdF1WgGobLcTEc6rRT9Z9wfwB+
	Fzk3f3vpTorYBg7vpQG0Hydq/6GDimq6gpEquLglCdYagCIcatWjpetJ
X-Gm-Gg: AY/fxX6ia8EmM4TCC1yxk5VL0xofvbEdcoxitDx1CDMfD7DI0H2N5/MaHIVGpfK9I4I
	0yRaxPX0xk6jnkYBweUtKvJfSBG8dfFWAbVvglQgyA4CLIs4h3kuiHmvzYw1Vt5kdvyH2ZKe8dz
	epQQtwQFqHyjmjQHv/I+FPBsOc4i1ombb8v1MLV2mY39VH7A0/8n06inb8kNLRUnRrd09yOmyDx
	OPiyxuc3GC5xki11GteoV1Ra9d1N8Lr4lUAazDniztJQ5QBhkl17H3RGQnFql0XeX+vELwLhGt8
	UF4RJpeuJdnxR9P/m6u97ucRyd6cQiJckRzJC7MaY9RclBDl+PDlvWyu0cHC+F0p+154o1DsgfJ
	2l6bQzxwDjrkhDCsfMgJNa+sSXyt7u2haGqlTuByJSJkCWYopTlmTrRb4GAOOaUjIBn9oyoJQCL
	zB8SEqHy9gC/JVhOrTPvSvwwK24l46uS9GZ5N9sEUhw/tDwxjNlaxsheS89d0JIyss6g2Z6vLRg
	6ceBx2s2XumUwU=
X-Google-Smtp-Source: AGHT+IHsL7dhoNmgnind5e824EvL1VoebSronNRlFQj2ywcoJod8TlpwxQtVbzBWrHsh8omPPq5EiQ==
X-Received: by 2002:a05:6a00:330a:b0:7e8:3fcb:bc3f with SMTP id d2e1a72fcca58-7f6691b4951mr13932466b3a.20.1765939337346;
        Tue, 16 Dec 2025 18:42:17 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8c29738sm941342b3a.17.2025.12.16.18.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:42:17 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 0/5] ARM: dts: aspeed: bletchley: Fix dt-schema warnings
Date: Wed, 17 Dec 2025 10:39:33 +0800
Message-ID: <20251217023938.445721-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_184219_126991_C4E42E2C 
X-CRM114-Status: UNSURE (   6.43  )
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

This series fixes dt-schema validation warnings by using generic node
names, correcting GPIO property suffixes, and removing unsupported
properties. No functional changes.

Changes in v2:
- Split single patch into 5 separate patches by change type

Cosmo Chou (5):
  ARM: dts: aspeed: bletchley: Use generic node names
  ARM: dts: aspeed: bletchley: Fix SPI GPIO property names
  ARM: dts: aspeed: bletchley: Remove unused pca9539 properties
  ARM: dts: aspeed: bletchley: Remove unused i2c13 property
  ARM: dts: aspeed: bletchley: Fix ADC vref property names

 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 100 ++++++++++--------
 1 file changed, 54 insertions(+), 46 deletions(-)

-- 
2.43.0



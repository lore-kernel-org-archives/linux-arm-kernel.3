Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29778CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HFXNnIoPUffpq5LRnYNe5XZlozI/CQ/SXlZWm3Cx7lg=; b=Edo6qiIgu0XJz2KqNC3qwGXX29
	i2DUoxsQ7jaeGYxG364KDJkwFeR72pKRE4omFrVRrUv65bYl2QlxWwG3Z1okWP2PQmpwbaIbUCVQA
	R1BGHlxsbMqN8DH0BzQ5PO7I0uva7xfBgRVzXD50tcAw4SnnRC5G3LDB7K7jajKu5teIqQmc97wKU
	v1YKNzSXGkEy1YHPNeVZZ2MXkDz5EGDRK5YgC74M9l551g/M16TTkRkp1SWr6JDr62MobMY0fzd4F
	4QSuh+4CTmNV0hcXRVw40ClFdSY5tuRDkGtvWvZuYUrgQDjdC7w3xM7S2AHj16tY3paxxZgN97Taf
	m2Jf07RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaW-0000000DXtI-0alp;
	Mon, 27 Oct 2025 09:32:28 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaT-0000000DXsL-4BcS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:32:27 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso7976533a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557544; x=1762162344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFXNnIoPUffpq5LRnYNe5XZlozI/CQ/SXlZWm3Cx7lg=;
        b=g0kepqpwMzSWM4g6kVSgSXiSUrAs6WlvBD4RE7i3zasnSio71qFc2i+WlEcFRLe1o1
         9nezomTCEJM1Nfj8maHpvkkVsYk9ntqA9LT3saDExOjF0q+3lH+nWK77gxGvlRbhu47N
         TxAA6jTGAujK74iWIr/UMMdtziTeWg4CsBSwaDe8htm23n7YS15iztNYpUuH2hxg+gm6
         glLumd7LZtM5c1uloh9H7ajfBroTOepOzNVVMkyvjZfdpFBM82JJTLqDB5CQuR2bHL2t
         ygHCIdi/ro3jun7GUtU8n0ysm2EBAyC3EqTLdJQ8SjTvjTZt7uVqGNzfK3i+oV4JOBsX
         5Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557544; x=1762162344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFXNnIoPUffpq5LRnYNe5XZlozI/CQ/SXlZWm3Cx7lg=;
        b=hwiBoFZEzM2JzY1AtAgaOd9KZnygL3tmBmrOlhe2L2WvEQKMuboWaki+hLtI7I5OrD
         qJl4dBNudbSpeM3/02Z3wrF8FrWOUIC1AQKzXVdsIdOQFTryG1Pm1a+NTOBm1sWIesgi
         It8kookG4fil6oUeUngD4JAuDW6OqY5rLkza5HqKR8sizd+qUG0tAPZ9TOwzr25lCMjr
         p4c/mXYv5QAIXsoxF+5hFDiQ4jYqzMy9K3KryXpy8Zz9qFJtSkAqNNXuOaeNrfLkF4iI
         f8B2jGDXgkJRWULIlSUHsg1yOruD8wEO49DbzRvF9Gokr4VHrhDeYHVG/KgVHBrMGT4t
         iIkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPr8juTFAXFPexNA+IOHufuE5cVZ5bqi4uD0M2tf2KxOpeyVI8qEZGgwJhuO2IyU29OUx8kMaDb4+zdpnViQZ0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9rP5D7BQuO/hxzs9WXK/hrN67XXTyRLld/o2dZf+CTccqRtgl
	Kt41qSVsk1OWX2kRCNQ/PTSTlHA/PXGZOvJv7S8U3FWR/koVji/RMhlH
X-Gm-Gg: ASbGncsMYlSHT/48JZk2Crwn34ib28R9A/VvArfxbrKT1ZHE2fset7/9Gcps/Qtsrqr
	o203UTo19M9INr+TjbQh/A+fRPGTybWMcuyxd+MCkVXlAoj7F7iorCx0r2LUBbBGzWL8a7OhrD+
	8vHYij1hXidcgRf3U2uuQmHLYjv1/HxKSTTSpglkRCGUAD1Ph2x2PTqT0S/PBXWc5rDIjfrKVm5
	QAVMKkG+7RCeNez1UxhJqVfoBb+J43q8qPJvo+28GnurYbKV9XGdKo08UvvCmT5pJAzNkERZPfQ
	3CctXTlzGvnPPW1r3KhGJLCCNRZJQ2RgmLiYlYgzQj0T7bTcRk5um0ZTEnDnhgVYyNn36b3Iw9e
	2JpO4l7CslB9WrzxvUixb/H78NzNSxiRAMJfECDCQhIz+8JY576zd3FFUUXN2005kslZqK7pRN1
	CJqB+vCrD3zEEP/YxYTuWHboFbrhFMrzPuAms7LaFuasU9LRdYoCO/Z48+xIgK4fcbsTeVtaZoE
	0Ca9GYvDOMgKZQT
X-Google-Smtp-Source: AGHT+IGfPIauWeOpslI13bmvAnHqIt73uiqSk5b04/1UOaUS+qZFr7MvAFxL/2NZS2hRKHY7Dz10qQ==
X-Received: by 2002:a05:6402:5206:b0:63c:1f3e:6462 with SMTP id 4fb4d7f45d1cf-63e3e479149mr13612800a12.23.1761557543459;
        Mon, 27 Oct 2025 02:32:23 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:23 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] arm64: dts: imx8-apalis: add additional functionality
Date: Mon, 27 Oct 2025 10:30:06 +0100
Message-ID: <20251027093133.2344267-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_023226_050018_4234DFA1 
X-CRM114-Status: UNSURE (   8.83  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

Cleanup the regulator used for the Wi-Fi module.
Improve ADC node by specifing the used reference volatage.
Add thermal nodes and cooling devices for the PMIC.
Cleanup TODOs no longer applicable.


Max Krummenacher (3):
  arm64: dts: imx8-apalis: cleanup todo
  arm64: dts: imx8-apalis: add thermal nodes
  arm64: dts: imx8-apalis: specify adc reference voltage regulator

Stefan Eichenberger (2):
  arm64: dts: imx8-apalis: rename wifi regulator
  arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator

 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 44 ++++++++++++++-----
 .../dts/freescale/imx8qm-apalis-v1.1.dtsi     | 10 ++++-
 .../boot/dts/freescale/imx8qm-apalis.dtsi     |  2 -
 3 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.42.0



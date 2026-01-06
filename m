Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAF0CE9D4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mRFZgchHX2jb8eFhmYCpM7vKuPhTwBiqRXcoqsSVBI=; b=eGS1Eq+yg2M1hM
	y7YRmX/a15LFswdxi6A/tk0MahFDxfdqV/Onnnispca3NE4HJhDC7KXfpULUI3z/4gVUXW8F90RYr
	qosJyCn0M9azUh1733gpkLDikdF7YSRpl1/xojQqOUHtz1xjK6L5aBKmwVjBPBh/kMx5uEWcji0PO
	g3EK44tRiOWqcAfZ/Tm4YL9Qn9y6dw92RZlGEIXQJAdZZsrnJhnv/WvZvz8Cuxvw1m2iyHOa5sYnq
	TPCFEYkULT7gPI2/KrS5EPhiatN16CxiN6OfyDXl6iaVzrYyDNnk45n5/XV7MnXq7/xe0/oZETcT1
	l86BhAHYn9wVGgVsIVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8sD-0000000DOSP-0RHm;
	Tue, 06 Jan 2026 15:21:34 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8s9-0000000DOPc-23FL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:21:27 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-44ffed84cccso310878b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767712881; x=1768317681; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mRFZgchHX2jb8eFhmYCpM7vKuPhTwBiqRXcoqsSVBI=;
        b=dmdBJKeYuluzYC9wXukavI8TWmRvM6cWY4wbFWFDn5VnghCdTM0lxJ+/yoEFVKvCRS
         QI9r1zjLJO7O0nGxzVC3HXktphfwOfrNC9LKqvCWzpdvZvKmWpdM2vqeXHCC9MZqlE8A
         N41wrZ0WC3Pu+9UNT3v5FjofI4GDD676gi4nzf91FZ54Bjf67stRLOp/4ZBe/57E1+oN
         XblLOP00EE/8VxONrRaON67PiJHs1qgNPU2m4fV1HZdEhrPOyzA2ZnGCCEXrjwuG6gy8
         JvpLMhNNxCxEwwIRwuq4LoPEXWKwsi73zSrHgviGJcPTY/MayVxkEI9tzYNciFWaxib4
         B2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712881; x=1768317681;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mRFZgchHX2jb8eFhmYCpM7vKuPhTwBiqRXcoqsSVBI=;
        b=heuYAnMCJmSJj5QJrzMmD9Tz68c+Q+3gkRiYus6Vu7Dkg4vWR6Ea4F4eupeNmdoqJj
         z4YPUAWZ2vFbkoB0BZrylRHtenWQh7LeHFy4/c8z+IqTF0ztJP5DxzstBweBZZ7k70R5
         GmWEdbuRoKh9qLS3BVKDdkN/rL1vRr3oWju43yq9Llk7MrMFPXID0PXZHdkF5NYhZXpm
         /Aiavt8dkpKpcRUghMAaRXiq3ZQDvDO2LfPURkds3B8mBJO84b4TW4g0YoxBQ4yHPTgA
         RHTWooLZ7oE3KozEOyn0gGX5064l0duYMnQGLMU7qAM0Rk+jAakSK8HRxQQe4BdwBhea
         UUtw==
X-Forwarded-Encrypted: i=1; AJvYcCWDrm4rG029lxxr+oLVtrLc20fSLlZIvtQJ9q+PjVd/j0VKoB/YEjkCf/tTUXsPlrSfs7gZ1MPueaNZASTBCQx/@lists.infradead.org
X-Gm-Message-State: AOJu0YykcfXGHxRcwxqNmXHBRanrYoXCEpzModP80fpSYPhBPDWI4bl/
	E9c6fRUD/xlbYlwM+5fgPQLX9DvAS9v9Dd661OsCrPcHIFWsQvZLBsaJB10nwVrSB/c=
X-Gm-Gg: AY/fxX7k8Fp+uZXFSyRC8q9bIL2DHrzc6muvcoXKmFA0ku+0S7hLrzoGuAhA8WRnHMH
	JbCQgj+YnmCqyhkYyOfxOVKv616QhrEijwMnR3AXAZhNFYpACebDojq6cIswKfwwQRoY336Go7v
	zB+vVotWYut9EJI3/j1ZFNXO6x+1gXF33Hn+pWhtgVeNUb4Fhc9/Q/qA05hx0Ewoi7V1BrqGcsK
	1K0hCNPGtLIfbdUch+LhMiofC6NxfTdErNJJDOpW5VnU65vSLv+sb5g7FXUlukpyuMOCiMb94uj
	hOyT5bD2JcWVVhNoJjhpvjZkWYylev5R9sWIq12LEVXuOJvPODI6/BOOpVspqtlFPEi2W2x7UV8
	jjhR0R46whUdPrwxoCPBXOyD88SLb0IxuTdNU/J5dlItsPMmESFuxP+HTzIsY03xUXzM2ph9j7u
	DAqhzIq9tVKoY9JEw=
X-Google-Smtp-Source: AGHT+IGjEHbpqU6LY4RJ8+CevaCM+RJCZaili7qB1Q46krb/sk3v4K9+clY3lM6bvdg7eEwxH/iBxQ==
X-Received: by 2002:a05:6808:1793:b0:450:d504:9295 with SMTP id 5614622812f47-45a5b2b3b89mr2066823b6e.44.1767712881182;
        Tue, 06 Jan 2026 07:21:21 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7f98:2205:4ba4:3e65])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e17cd81sm1041992b6e.2.2026.01.06.07.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:21:20 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] arm: dts: mediatek: fix pinctl node names
Date: Tue, 06 Jan 2026 09:20:54 -0600
Message-Id: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G6gt1uUr4sElalCrtEUE8e8GT
 8PAMA8E8kwB6uQBTxcHPpxIliYwLJ2bCXkUB620VZmyuMcVJ76FhdUGT3ZD3NB1O+FU5pWpctP
 TWIAMTk9S/vOmfd8P6g9gGmwAAAA=
X-Change-ID: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=/TeDlw/cAEB006wcLjZMrKPIkG2WYcBLIBb1X30w/es=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpXShbReLW6cOm6xpd2RjcDVAWadQN7gSIS90HC
 0BDe/zrsQiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaV0oWwAKCRDCzCAB/wGP
 wCIaB/0fD0W9zZkaM75mQbeaPzXPA0VsiPREgfVmLDS/kx2YcuNqR3QeWd3VI/OZG3lu1JhTZeu
 gr726LqIwSLRbF/uyfc4GbWrQHxRL8mj6g9g4UGuovmonCzNnzYZRoaEoiDPlkmh2lVRUfRNNlp
 YdJUAWvD3YyVz4HvnDje9jJGl9Bk7jhNTZeZCsrYH4wOaKrOFpPDbJVVysjebH2Vdq2ckXeKbPT
 rB12pXOAVZhvk1mA87CO51/5vokOEyt9rtUi7kHjJjmEIykvIhJlOyDomh0aaFVDkE3HcKkN5+c
 MUXSc5zYcmO0ypk/lNkCytfhQf+IyAAz4DVPJsqPv7Hlo3D1
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072125_793799_1F34465B 
X-CRM114-Status: GOOD (  12.22  )
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

While passing by, I noticed that the pinctrl nodes in a couple of dtsi
files did not match the addresses in their reg properties. Here are some
patches to fix that.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (2):
      arm: dts: mediatek: mt7623: fix pinctrl node name
      arm: dts: mediatek: mt8135: fix pinctrl node name

 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 arch/arm/boot/dts/mediatek/mt8135.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7

Best regards,
-- 
David Lechner <dlechner@baylibre.com>



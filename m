Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F271CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=; b=h7hPiKvlBOhqrHzEM4jnN1E//f
	V3iq/wRrwFqOQ8S1L1/SaJMXGh8wHC2GvFE06Z61AsKfYc3QtMHcvt3XdYyJm66sR3zdlwfDDxtIp
	qd95GQadRjDad/sKL9R5nMQVl8IdMMxkelb6Tn6+Y9JUABCj7EvPwFB5PTpAo6d3f1GeD2bBa+iaR
	BbA6l+50OGTJyQ66M/8Pr5QXtTlwWHjAq7Zi4DargRYywLBwD4HNK6qidSgr1uQfYy1pXBsK+mzIZ
	jmsCHiZRySOFMJWfij/xGv9HNzV5iWPVrWl8zoXupNEWRvxy7NyD2E43FAfExQZYQbaU4A8zyatal
	k4tWCekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3fT-0000000BHcB-1wNJ;
	Mon, 01 Jun 2026 14:31:03 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3fQ-0000000BHaK-3sc0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:31:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-842319576d5so746980b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780324260; x=1780929060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=FeguVVonyEODwYoCpF7iWdaQANzHd+cAdQ+ntMKfP5Sj0XH1UZilHwoFH9eOwDNpi2
         YxOICuCs0egK5ZMkUtCG6LsErpQxW04awVyBgUzK3oHyzng55LwvdS051MdwmsI0LZtC
         EHwWFhyUpENBzeGvOcqr+FkwzIVAOMrkr1DjO9xrcH7OzudkXwmq1xtaq26UQxrWfqh0
         E4kc7jeT2d7MtFZDIKvP57gr4FWkiEDxTLCCV7zc3lMA41ntjagVSCKDjJDhfKhxVMFM
         b3K3qW++rj0IqmIqdiD0iDQXEzR0q85Xf9wiZLun1oPcxD2WUQyjCvBKL0XwRkBzXm71
         3fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324260; x=1780929060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=qy1vFPeuFjQ7Yx8HaInat8ay6l/2/guKT7IxT9M5/CHL15uFUM/tIsOmEwGd8JOAv5
         MSt/ILBOpZj7oPpnZE/kMFn7twEvmoPvPQ9EcN5NljT6S8Xc0pVSnC7yQF27we/8sqaW
         LTu1HNviULygvN9XJCMvH3j+76jzAWTgkgnaSBFSkKMSf1jTcg0fSWJq93bJ+wKlCHIB
         3HiRWfukDa2kw1Sj/yQ/ZrXP4RkX6hilczsNV1CUwbzKQs2/Skadl1vWhRyRI9O8J9Da
         tyQV5WArRWi/cR5YBEr+PimuZgaQOJIakgTfSj+Udby1qVuf41P4h5mqnTamlglUZFwI
         /+kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DU27hMMQ4traZKMKHz5X4Jx8YwjqjadfaUKzKSSg7Jfwnuq2K3lgrPACEW3hake77TV1MBa+9XYa1peZVE+6K@lists.infradead.org
X-Gm-Message-State: AOJu0YzLfETd35xFe8x6Q2FQnAsOE7XND7n0Za5amp451whH1kUtk9La
	1A5m4D3yGbaKtxhnufnlwwb1V5FNXOZmsh9h9iRKzKr9Odt0Lj+P7WXq
X-Gm-Gg: Acq92OGTEacbEdnQErL41QAsuwqKLZcMoVGWI7KoWnVMb+JqvIGaMGMbb46ZoxitdYO
	YDYag87IRx/M0mTbws8ozUk7tPjGYT43IUaNYtma7m70jRfOEIkEWl05dJjQoUnic3spiIj4SOD
	3P6BLKODHnnvp60C9nm1jrh957vtLwCSXMCz2xHxZdpXrg/HzEfCowFwWECkogPdd8EcyjO8ryk
	HVMuTuLK9g0lq9gKoZZo4ujNq5pjlfneeA44NIhA0z1EPT9J50FOnZ5f5CJ8/XqbS4TWNoTnHw0
	XF/6TJpTg3tWA+5WUFuqijs0rszPZDlw6M9Cqdw9a2Sm+hbJuk8SOeB3fFw4jkfsaLIHhRFINkc
	JFhrlrgiNZVooUc2k8R/Ni4d8hsjpRImTJK9HY9Qa/ATRim4EGAjZIu3WxL4hfAfU5M2U97ymBB
	rTSpcL00u2Dk+IsrozwbHG2bfpHo7glbC9GmFDRyv6
X-Received: by 2002:a05:6a00:3014:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-84225595638mr10412294b3a.38.1780324260099;
        Mon, 01 Jun 2026 07:31:00 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm4910786b3a.34.2026.06.01.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:30:59 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 20:00:21 +0530
Message-ID: <20260601143022.153941-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601143022.153941-1-hrushirajg23@gmail.com>
References: <20260601143022.153941-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_073100_976859_AA306A3C 
X-CRM114-Status: GOOD (  10.20  )
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

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3



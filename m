Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B8AC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ll9uMnEQkCBBfRCH6YlfkEd7ynDhjY++QekPE+Dh1rE=; b=sc86eSaVsD9FAjO92o8D9iZX9D
	eFob/ItxGNUORGzDoN7zGH5MCM5f/32HemtfXLvGS0cjvAUkXpkBUqFA9Lvvmf3h0CiYn69l0WHoh
	uXS8jqc8tNNsDdfbG4cONmUuiKlJvYGUbJxqPMAyezy6A0yqWHxoymufdm4394L7DPcDT5A4h5Pyc
	SSXJftmqqCFdthSvYgua0207//JRp+6D6WDN+fz40RxAnk7WaAmAuiwvf1NwOdGB4gCdw+XYgYGlA
	LnvCnJ1KNOG98ksrHWLLxTEcJ8JOheYxLClAsas6qBX3TGzU3Ve5V4yR7TYZIqe4QEbaDwUd7cZwE
	DJC2y+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAXe-00000007PX1-1Z5r;
	Tue, 21 Jan 2025 09:27:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taATg-00000007OxI-36ND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:23:22 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so625934366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1737451398; x=1738056198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll9uMnEQkCBBfRCH6YlfkEd7ynDhjY++QekPE+Dh1rE=;
        b=jVzAHlZJArHLQ59z0aqjXzD0u1j735/Etwv+dh8Fmj6MgiLdxwzSGs8sNudFAaEZg4
         FkzEStz3dFoiZ65pQ37mVCqW1w0NnF6oFJBeM7yes8MqKhDOfXtBATGixh3rBnxHQbjf
         A7q6zFYLpo//Jt41MrhYz8iUMQox3a5EFtSqAL/qiHkpgqXwIcszW+L8krJ+aXaeclYJ
         YxyPYxU/lv0J2cPzdm/XoU7hCHS2CTMBrIxh/YPufaXteNHSN165wg2GcqWNG9NsU6g7
         ylrbmMm+WbONORbB+0YrESxA1t8gR8jow/K/xA2Yzu+0H27oev3PEKMO7BJy5iy0FB2C
         2ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451398; x=1738056198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll9uMnEQkCBBfRCH6YlfkEd7ynDhjY++QekPE+Dh1rE=;
        b=g1d7yoLx+gwK0rvBwaN7ekrJiY/2JZijipnRPiwW27BurMzJ76tzp02kHMJfchE2lh
         OQTCbhnJCudt+cmLNZt/SOVTgB60GbPPKKVBgJoVUAqYm+8wDJmysh5FEqgHhq8rpkjb
         8UEUKWuAO7Lk1LdpEnj49GBMNVd6oRGqYO0YpYcBwgVVUZIJvrxgNdd3jSxugZTP2HvY
         1bA8vVz1gn12LSmyVDDA/d6nNzSHFdbHiRNbXJt1xdqz6IXTdyGiY0NVyGlm2bikiVxE
         tfOsJqxfpkKWoqze1gQ4eBxhYVUyELqeQwupNBmTscEZwLWmJkZ35lJGmaqYJgnjpy7c
         hx0Q==
X-Gm-Message-State: AOJu0YxY5DJERE/pprSKo28X6Zah1MFAeGLIaj75VbAXHIXxj1+jTQZY
	vsZLWRtFhLlqRMnpLTXOcQ1Fa1+4Rciib4TEijwgM0RXIv0VLgug0Vw1VBEtEoV4ppJ5KJaDFu6
	K
X-Gm-Gg: ASbGncvFQr1p2L7QjFe7TOrfFraYk2VPGAAstoBKtPu7rzjP0UdTtZuumOypZj/xKBV
	fcPOBELkIzpff5JW1216Sn2WlTwwVKyVcK3g/Z5u3h+n5SC7YJLCdJPWJMGGd4GdnA7Xndk8pay
	JvPm2naacQRamfgVoAB+o7sE23U+8sINoiGn+K2ywfP44Xufw0ntpRBPTo+ptzYPjxyD1Uh57Dz
	zqG+uvrm6wXbelBUzCl/W/uOgPp/5xSWQd74XNJhfBobR7P65uS9GF6XXUbN9ehu8BR3E8sx/cX
	Y2eaJs3UMOaecqfVST3tQ7RmoQ==
X-Google-Smtp-Source: AGHT+IHvcpIrnjOYngIGbkb+lXRHpAFpXBbe5Dl/RgrHmQEuF1cOVKP9fzZ3HXQ+1+pDqZJ8S6QgsA==
X-Received: by 2002:a17:906:fd85:b0:aa6:becf:b26a with SMTP id a640c23a62f3a-ab38b0a13e6mr1491837466b.9.1737451398284;
        Tue, 21 Jan 2025 01:23:18 -0800 (PST)
Received: from lczechowski-Latitude-5440.. ([78.9.4.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db8942cad4sm5681726a12.60.2025.01.21.01.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 01:23:18 -0800 (PST)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quentin.schulz@cherry.de,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck
Date: Tue, 21 Jan 2025 10:22:55 +0100
Message-ID: <20250121092255.3108495-3-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
References: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_012320_779377_98942C10 
X-CRM114-Status: GOOD (  12.04  )
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

UART controllers without flow control seem to behave unstable
in case DMA is enabled. The issues were indicated in the message:
https://lore.kernel.org/linux-arm-kernel/CAMdYzYpXtMocCtCpZLU_xuWmOp2Ja_v0Aj0e6YFNRA-yV7u14g@mail.gmail.com/
In case of PX30-uQ7 Ringneck SoM, it was noticed that after couple
of hours of UART communication, the CPU stall was occurring,
leading to the system becoming unresponsive.
After disabling the DMA, extensive UART communication tests for
up to two weeks were performed, and no issues were further
observed.
The flow control pins for uart5 are not available on PX30-uQ7
Ringneck, as configured by pinctrl-0, so the DMA nodes were
removed on SoM dtsi.

Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index 2c87005c89bd3..e80412abec081 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -397,6 +397,8 @@ &u2phy_host {
 };
 
 &uart5 {
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 	pinctrl-0 = <&uart5_xfer>;
 };
 
-- 
2.43.0



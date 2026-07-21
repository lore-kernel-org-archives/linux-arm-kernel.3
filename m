Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E98C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BIe2hT1tS/hkONRpAbeJmIad5iezlCwLptmTsdS8/DQ=; b=vdyJVChNBOwj/nTEzNohj/GTlt
	zCEjmgrmAMyzNEk5KFkXECaSZPzl41n8l6jSc1ha8/2T6Hq6MxpSoOjSqXf15Puf66NMliAA8CTIr
	rQ2+K0rwDzDKNJlbw2FyReqnuTal0DtRtnsgkN5oLIS48DOLBvaslDX+tBpA22898pOIhiZ9htmdp
	9mgxOE0G3EHwkPJJ2xmVxqF93WkI+9Q6pwoKSxl2kDE/dQr3Rc/p0xZu6s/CFKNzu77oWg1ULOmV+
	97kSjVpdo39z6Rl6BwysjhxvOtiX5LzNnBZav4qMHnr7Sm9C7h6WPzF9r+dsHwho/1bb7KSkf7rnx
	t6czxhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcr-00000009YQ6-3IfC;
	Tue, 21 Jul 2026 13:35:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcg-00000009YFq-0tIb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 13:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BIe2hT1tS/hkONRpAbeJmIad5iezlCwLptmTsdS8/DQ=; b=o9L7gTXEodrgq4COPlFEYbM2/T
	YSomkXnbgQlD+aoYfW/hPowIlpn+w0F+BrAakPteQVML/YkLBpo+XWkjkXwvprjOKCVAp9/EWnwAs
	nYb7V+3NIz3ikB8g2r9/XA8WWQag6UxiXn1bvJL142KHR5VJqK2jyR6Zxmt6wNiQebflUaauNX68B
	e8En3u8m1AN4rtYRiQnaRXalFLPteF/GGKeJWLQZp+ogrS+CppgG6jhIvz7zH9bPmiBfhfeBesKcG
	a9KhtYFFtb9McLc24tyZLnmF9C+bENzk8eMsEH1gKgm2nm8O2eY+ty3qKNFsp4N9guBhfwGIHEmZH
	e7q0YoFw==;
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmAcb-0000000HaVM-43Lx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:35:01 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-96944741eaeso2800398241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640895; x=1785245695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIe2hT1tS/hkONRpAbeJmIad5iezlCwLptmTsdS8/DQ=;
        b=inpt/CRwPNFfYdWdIO7wHx/2ROpxzfZoKLvbe5AM8s9iBu+N7ePlHUPda0/MiIBghX
         o6h/jNVYLKjz3KCgN3WI1L1JmFuK7YESzESqajhiCzWpzMtYxGlUdPv0jV0JxgN8jel1
         ywv9oJvI21PpkSVkTYfe9wGkfColzzvvbCnJvOn3QWlfm1HXdkNSaOTmLFVxhDgLrkAq
         +jgqngkl/jbXD78qgTAWUWjUoNJOwebUzq4OWAhdA/Km8qUEdtz8wD1ANIu2rEHXMdkB
         CU7xH/iPrUy6sLeOH1HMjF2p05Mfn/pjPgsJI6bi++UsKRMl5sANBR6RRvG2mEFp/fE6
         yTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640895; x=1785245695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIe2hT1tS/hkONRpAbeJmIad5iezlCwLptmTsdS8/DQ=;
        b=Sb6jEB/yrmbY1zb4jajpw4VwcTt+c4jMvr8cGPWFXwNH+Eu02ER+D0YBxEGTungcS3
         9aXC0h8TLkkzSupeyPrUfrmKdEPqiKePT78xqmpUBlkJIqixLXjUGMmwyMWF9FSZpyLx
         MC5q3xJR5/XbQhAlwZr8Hn0sLjgigWy7SN2/jMOL4JtVR9pmupS35NeqsKoiFM8bsk91
         ONetea/enM7SRECRlVuJPf4tMZzUetJRb6+8QkSUoJ6hYnvCiOswnaQPitNbaF0VkaAk
         ky2/hlRGRe/dU15prQV6Ky5WRgFi2gkqHNpmiku5ooI/gE25oIYRhbb/VKgC+uJ0eDKW
         WWmA==
X-Forwarded-Encrypted: i=1; AHgh+Rrce73vQAgMValh1UDjdMPi5xFC0SgPmk+CtXPhWG5Bwjla43T9DtiK/ms+x6/tPkMHCBpu814FFLJtq8olO0ev@lists.infradead.org
X-Gm-Message-State: AOJu0YzEHT8FWLGStU1jrSGy0mlwNh88AUSeFk+yOXxJ+lYRHIaQcY7r
	3a55E0uTg30EQsRzGnljvrlyO8FBjfZOGoOmi/oiKiELOkbaJzQKIlAO
X-Gm-Gg: AR+sD10K2wA/rSEFIqck93nLibGrISs0MIFkvidrSCwibTKgXYuwYuKOJOAuZUNJfwM
	0R1sJB9uq3PKpWcocynWM+4xn+Oeh20l3w+sD4+BGkEHDq8+RtedhY3Etdw4g3lkl5HgUjNs21K
	4/Wp+gWY1HS41Y7wCwBH4O3foe2qIOfqsOKAghQ5Yim78yV2c7hf8TvubUbFwdiGW5zmy+It7Ss
	NQ/LiQovTxRIPehyw6vZ5l9uXXAJLWZNIGpm2YVjdV/gPIMN4kPNl87tN2cuixLzhcllV93ZLvu
	Gw3KK7gzKphzH4SfsGFuMUi9KkjASSg4o/tlemJJtxXRHN3EoaljPYf+gt+AY/UoeeVB6Oa4BbA
	+GnjpmUiKe/HizYJ7jcKI0DgpkwZ+HQu+AJeiChf02trrz5IkCDp+581XQS0ZT1l/Qq2smZrKQe
	MFd2Ej5NPUb/TWXyxLLKb1NMwPUgysZ0n70pvQzY5NX7dINzOW3F31TrtbtEN+
X-Received: by 2002:a05:6102:3e13:b0:738:be73:55e9 with SMTP id ada2fe7eead31-747534dcb84mr5275283137.12.1784640895443;
        Tue, 21 Jul 2026 06:34:55 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757fad06csm11851362137.4.2026.07.21.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
Date: Tue, 21 Jul 2026 10:34:45 -0300
Message-ID: <20260721133445.44283-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_143458_165632_D369C2D9 
X-CRM114-Status: GOOD (  10.51  )
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

The Marvell WLAN host wake interrupt is wired to GPIO0 8 and is not
one of the PCI INTx interrupts. The PCI device schema therefore
interprets the two-cell GPIO interrupt specifier as an invalid PCI
interrupt and reports dtbs_check warnings:

pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long

Describe the sideband interrupt with interrupts-extended, which
explicitly carries the interrupt controller and removes the ambiguity.

Fixes: 48f4d9796d99 ("arm64: dts: rockchip: add Gru/Kevin DTS")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index 3f3cb0eb5809..5435fbc27095 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -505,8 +505,7 @@ &pci_rootport {
 	mvl_wifi: wifi@0,0 {
 		compatible = "pci1b4b,2b42";
 		reg = <0x0000 0x0 0x0 0x0 0x0>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio0 8 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_host_wake_l>;
 		wakeup-source;
-- 
2.43.0



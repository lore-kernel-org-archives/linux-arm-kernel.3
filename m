Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8EBCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ECq6v5kjS4I+m9N3qtX70S6BCp1pZjjE4JAhJFsm0ZM=; b=fpErkV9Krwz+KugGbwWqOvC04B
	EoJvqkIdTmoRgjnd6mmzDTWgTQm/LV5ivECbPj2S6DDd8NsOc6mxLCD7/l61scqq1iwfE5tcEPih2
	S8xbDKUBMfJ9SydxcR8yhgEy0Ux+7q9faqiCCMmbXWWKc3m2RvhELJnsEjhm/R1crhVM2T5RaR1Ua
	j5FlLYZTX7Eh0D0unmb5YbHJa2DvxC4E4XxTu55JDasI532XSbHDjIvFgG9T5mFIwzNXCwgphzJ1J
	9zlhuCKSmQURCXzGJwgE7HXP0NkQPTvE8NfWyI6Qo/1+Kne9h/eaz7VIemkaYMuyNz8UmTRyA/JXc
	MEODZAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Qe-00000002sLc-2XcF;
	Wed, 15 Oct 2025 20:49:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Qc-00000002sKx-3uCK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 20:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ECq6v5kjS4I+m9N3qtX70S6BCp1pZjjE4JAhJFsm0ZM=; b=V6KL+d9hrgu32NTvQQxA98sxh4
	eCNd3MUJuAmWxDaY+YMtFp3QfVjqSGYaVYkQftv4Wuyuuv1prhmeAWWJEDvhEhU48mUPhn9GlzdfC
	VML1dyuFTciTS61f7Ff/T9YMvoJtWywCulKHk32gPWIm5R8SFPanXGXGs+O539dNtIK/neAHqvaAb
	TwPtaQEQy5Y/susfUyOMRNfXqb6ebMdGPrEigTfZXFngBukgnZW+hGPrkipuou4sr4bJu/RsDB2IH
	vBsh9/NyTi+0zmCXKfEG6EZWsw4QQURS0o1Bos/G4L1HuoErm2+HlgfUgtv/G1yTkYuKYbzMp0rZF
	1/STneEQ==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98QV-00000006FUW-1XvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:48:55 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-33ba5fc3359so46052a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 13:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760561328; x=1761166128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECq6v5kjS4I+m9N3qtX70S6BCp1pZjjE4JAhJFsm0ZM=;
        b=axMGsZe326M8Zzl4CJA4WzXCJrPuizdWPrfEhdv8Hq26xXXuSeZ2+Dry3XxJV2qNI9
         gDXmH4d0n7PDr02k4/jdNZIDRi/L4zlkUQN0oWaO1J8MAPyBbgyvJrmDZpP7KePKI1zR
         Y83OhljMKQNf0pXCQHxmNEiNjGLjapXllPL1ACIWXP1HnW60XDEh7KGQOgP/yHrf20T8
         ux/jyUhytmqxKYxKqBELAVjSLz7ZQZFJKQlFOnIkc8Yl0IzCx/LtXT2IQlv3VQPwd87h
         BkgL9/9mJxAYpaOfX842wj/vRcDWyxwyhyolSYv1Mdj2sBl6VSo3DxONxYXRg24X4chC
         x9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760561328; x=1761166128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECq6v5kjS4I+m9N3qtX70S6BCp1pZjjE4JAhJFsm0ZM=;
        b=L0YGebM6MXKj6CGW80cPJfG3zFtzzubt9KkL/hCQt6L7nrNbtIWOzS70lmBHmN857W
         Iyz/EwkP3F/X3BEMKHyUO1xjC8Ky9z5tgJrU1Jy9tB3gceVRD7gRJXa8/j1hid45RsDT
         5a9Qz3zodkeyFUv7ANBD96KYj0vWOZPwpgAAaiUIhPFX5M4DnRizm2LYbBiDKEQiI+Ud
         cuCSpIfue78tZOOubrNiQMwXhpAiHIJR5G4aRU8nGtBdmVbGbRKj4jnW+DPO304CQOe4
         nbuGshKAXC2SN31aINNj5cafIBx6QG59bIZ3qjafjle+Cwf5TOdIuzyFHFqnzOkflzAA
         4Y8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuGy3fcWuNmqJjKnQdvsVfu2lRT0h4KoufBdwl2nI/I9N530vbu8L9CmC0jXgaeHmr4S+k5TMiTmWWXW9gSRWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxEVAQZRfT64RWVpC6Bv2kWwSOfcXebqgPFWBugfLMi1szoq01j
	im3/YG9hy0VYN8v9GVA/XTSQS0EIT2OsvKsJaMaKR6GyG4Mhwla9i02k
X-Gm-Gg: ASbGncsqnEN//7dkNueBKwIxZ8gf6PN8/Z9ryDripM+G8mxYh9pGh/di3ZDB9dsVn7+
	Hc2B9gr0udD3yabjo3FURerL8FF7Uq066bUzavCkwVG1I8G3Sz2dA71Thr9m4oYupmBfzn26gZ7
	cipjAuBc+efR4irvcp1tZQnxU5AmAjkv3Pkh7dRNJ9OM/bg4YQaAxHW0JN0a0Up7CT7vsdjllf/
	JZ5kUFxWzh2fypp8x5LdhKRKVB+80cO/DTXer5KemKrNDfZEYcMz3DPNhmPYqKmzGd6VPKfO+MC
	HxuiVnwd3R002hzyoognYsav3HQQiJWiJraENzmWSwukd+clPs7Su7VyKxWPNSO4inFJf8+JoYd
	9TVVcx6RiPE5r7XzYW9b3B/DiSD4bxhXbe3T/n7/aNWDjTbY=
X-Google-Smtp-Source: AGHT+IGN+lN9vicyM0JMq1Ocm6RG8YfGzytjeBBr/s+6dWoWkU/VmH7/8zJwDfHCWTW90MulWcmRHw==
X-Received: by 2002:a17:90b:17ca:b0:32b:a332:7a0a with SMTP id 98e67ed59e1d1-33b5114b648mr39129699a91.1.1760561328178;
        Wed, 15 Oct 2025 13:48:48 -0700 (PDT)
Received: from localhost.localdomain.com ([2620:10d:c090:600::1:d6f0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a2288bd55sm523896a12.9.2025.10.15.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 13:48:47 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH] ARM: dts: aspeed: fuji-data64: Enable mac3 controller
Date: Wed, 15 Oct 2025 13:48:37 -0700
Message-ID: <20251015204840.80070-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_214853_051186_0562C84E 
X-CRM114-Status: GOOD (  12.69  )
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

From: Tao Ren <rentao.bupt@gmail.com>

"mac3" controller was removed from the initial version of fuji-data64
dts because the rgmii setting is incorrect, but dropping mac3 leads to
regression in the existing fuji platform, because fuji.dts simply
includes fuji-data64.dts.

This patch adds mac3 back to fuji-data64.dts to fix the fuji regression,
and rgmii settings need to be fixed later.

Fixes: b0f294fdfc3e ("ARM: dts: aspeed: facebook-fuji: Include facebook-fuji-data64.dts")
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts
index aa9576d8ab56..48ca25f57ef6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts
@@ -1254,3 +1254,17 @@ &emmc {
 	max-frequency = <25000000>;
 	bus-width = <4>;
 };
+
+/*
+ * FIXME: rgmii delay is introduced by MAC (configured in u-boot now)
+ * instead of PCB on fuji board, so the "phy-mode" should be updated to
+ * "rgmii-[tx|rx]id" when the aspeed-mac driver can handle the delay
+ * properly.
+ */
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
-- 
2.47.3



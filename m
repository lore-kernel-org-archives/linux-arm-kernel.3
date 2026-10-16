Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDC4CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=; b=hsKt706AJYKMCOimtmrh/8xd/i
	xbSEb8rOr6QLFBgiEL+O4oKb4Rr9QYsqOn55rPNuL2f7k4SETw5WmdjZTf30TzR62lUQnN8HqinDk
	hGQbK3+rN7FfTK7h05BdK2jPmd5cXt5ZfLDhuDuW7EPrGuET7gfc9mKbS2DZEbeHCLu9A4AJ/N+cv
	Vc545K9aM2LVmovml97BMCUZ4jk1+ue/OA8dp5ZlFdsIMBPDL1/spgzKY5e8T0XLgsPW/eBUbv1gj
	lGYP2t1K2u1D6lSOyzs7IdXe/itTnlLiyBrAQUFaGUC6I0bHTHsOuyIsyPR1E7YDDVb4TlTnbgniw
	OIvUzdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7e-00000003AfY-2rkV;
	Fri, 16 Oct 2026 14:41:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7c-00000003Ae8-1tcW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso454908f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161682; x=1792766482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=TO1icRVleLRfE4FWVR2ZJ9BrjDOgctuN6C46RvSmEkUntSRb68aBcdY3DF7ZgY84T8
         iT43l6H3pE3X6YYvDz9q4WUfvCYBt/QcmS0LHm1fHFOBjfhk/Q5X4iPaglIOylH749QK
         Vk2VjrXLhNo2fxQWg+QEjU/Bmoto8/k/Gm89NG9tX69dW+m1KeW5YpKfu9iYGTq4HJCS
         vXOOjDBdDMKF+H6TREIgp0TIJPLXpBKncYeQtjy6B4OEV4JrfTbGuuMMFxQcIPnNG12I
         NYlHBsEIBsv1R4Vq2LfJgIiOVnODKjcwRN1+s/fm8fi1yBJvwy+6iazX63n7lZ/EiEuE
         wfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161682; x=1792766482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=NaqUCOAJMl7JIo+MTmDNSQh7SsmXnlkmFKTeWfVsixD2KfGz7Lh7f7Xmv8InOc0J0L
         PmCPQb8lVCkOOqcy+5OgA5CmvuZBH8V9q3xRVpkckPHShpDctsFuaQxtUZ1n3Ucms+1o
         r/adlaCi1LTGYL0TAGUa0ZlIJpnvs++3+uHmzLimqdJOYZifOzNXINyJrlSoB3NLJ7sT
         P0v/dWiuDVRkNO8NmABBi0/3i4jtTJYqNwwDh5iivVkC/UO4F/+ADpapH0hHhdObCuzh
         t3GbzADFP27G+4ugww38MU4F+hWeRt+n70xGcJq7ICMLTP4tMGi/CB9rtBMfyXd4FQxd
         MVTg==
X-Forwarded-Encrypted: i=1; AKwUvBw8kzrTaZXCxiVJopCES4ozz/QtrkGsU+IedbwutUjfgDOwC3YB8jMHUCNagcvD5YRveIT3OqXH7jAG4dCK48HF@lists.infradead.org
X-Gm-Message-State: AFq9FYKGaqFuww5SHex4+ePtdMFWfoN5V0wTIK+nx47zJ1VZPaJYBWY5
	UociYpm5HZBSjuPu6QuMSW15+tvKWlBrv1wEt92GbxDTbASNIUb8cJnmX5apn9v9OM0=
X-Gm-Gg: AYBFou0+bs21IWkz/3AzadCJX5tO2YEMJtSHRz5e/BFvpznA64twx7dy7LzRx8cyZ1n
	JbX724t2PMhVeJ56h7HU3xSZz8IzFJ7hu/VCWyUk2NCKGi+2baj1kHFGGt2JXy0yZEWGGvkZmz/
	iMUiDsAbjehwgUxe6kvsEyye2WpTzXdODFLjCa7OTaoPzjHA5Ya7hYHd3hsSAhFsHpNTg60PGga
	Y3AM+mGgXyw+JE7wAe2QUhvIZYW1PzCIYNhro2zGwZ1odF6mFZ55iSGdd0p2TVtWL6cWQO4KPb4
	7BpOM9yQg7TWz8h2+sdCuJ8vjWmnVhb6WkRSmfOGp30Qsr308YdszCx8eF9x4yUZ4uLcEnFnR40
	8if/ZTnfD69OBPqNJ6pvrKav8308KpN54LEFx9pNx47KWZOkXW15YVeLT2sUxbpVFRWlblVTaMX
	ZFkzwa8w7IiZobzvdZtlsp3jbZI5KtNirIWA81wGJThCRWJ71KdByo5+EGDrTQKiJu3hIBcU1uA
	voC4WD5LeWFI46kvR1PjlRo0Fm5D8GkTWgOn3KxEZOi+Z3+KmZm0xmIZ0x4P7B7b/07fBA=
X-Received: by 2002:adf:edd1:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48dfae1ee24mr6334662f8f.16.1792161682381;
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:16 +0200
Subject: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1058;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=vkbGDt2t9O3PEQmqq3WpWoBfMDyf2l0F94OzzH0Lqck=;
 b=G/D+U2sPat3Xx8BIZaPIsfhCX1A7J15eqsyRChroWg78s4J3EXHdoTbuWHyx0L7PknTnAfqwn
 IH65RPB9BFLAvsjLEHx+wXWjp9HH1vccFQxAVZoS1qKHUm/WAA8zm1l
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074124_513148_DFAF4479 
X-CRM114-Status: GOOD (  12.45  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

There is an issue with USB being put into idle with DMA enabled and that
is mostly prevented with usbcore.autosuspend=-1 on the kernel command
line. Stop the ti,hwmod code from putting it into idle by setting the
appropriate flag. This stops the log entry 'clk:0058:0: failed to
disable' being generated.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..2f55dc32e150 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
 	.name		= "usb_otg_hs",
 	.clkdm_name	= "default_l3_slow_clkdm",
 	.main_clk	= "sysclk6_ck",
+	.flags		= HWMOD_NO_IDLE,
 	.prcm		= {
 		.omap4 = {
 			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,

-- 
2.56.0



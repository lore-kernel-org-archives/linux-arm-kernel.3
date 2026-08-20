Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8499C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aHco+x3Zh+D/yrx59tyB9cB8wV/dfio0NvYBL4wP8gw=; b=fzQHzZXn0y8LF+OUBHLVZqExGI
	gINvJafvNAI/w3Xt4CCgjcoXmqVlW8rdiCiubewfdwocUkhySRo0bieYoVtszQTE4vF5HLfByfzSp
	ZyGoCm24XPVO+LT63nrhmBbG7CgKyw9dCEZyF76QMyh/ku49q9U/ZOkTgMA0o0yRpN2d+osooM3vE
	xSx0LnZ712p81yl4OH0+xYi8ZFI+as7gQYrAHWR0TAJ0RO7CYrZ2XNB8oJI17H/qImqxgkPElIGFZ
	X40OvqRGB4bxueqd4g4M2FxpXEjzH8w13i0GNa1KbT9amdxoflXSx1kgL1/n2CYrv16VAnhV6NTw5
	zotZ4xBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyy8-0000000BGWG-05QQ;
	Thu, 20 Aug 2026 09:21:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyy5-0000000BGVh-3LE2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:21:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-499b02fc590so7445035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217708; x=1787822508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHco+x3Zh+D/yrx59tyB9cB8wV/dfio0NvYBL4wP8gw=;
        b=Wr3MQCtx44XEbr/LLLHKhuvw+sBg5KKHXHbzDeejcfrYhg9UMMB55X0osQ/dYzfHBC
         eV+9KzzQTJnEYVuDTSalINLOA3kJEJI2wim+bXgX7cHr6I8HLxb8fHzeFjDFUpN2Hlgo
         8zRlgG0AR9fUzPeSKgifzJEqjX/6jySmjU8f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217708; x=1787822508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHco+x3Zh+D/yrx59tyB9cB8wV/dfio0NvYBL4wP8gw=;
        b=rrdnDruRBNVyYKzt7SuyLfXAxEZS9yD9gNO8MRo5l7mFyAm3PXK098EbujMxJxnT4R
         EC7fVJ/+5FpU/jiSpemXHC9GXdg7I7DXSX9R+29IQE9ezbvZ3XhfYCWbEqV14Y1Kyj51
         +tH4RSCrwYjq1BbWrK9BB4uFFIHRn08K697XJ2aCiP2rDDNIUitZ3IAJwuBlytI0XhXL
         ToCpqMSttqorKKDfZojdCqnqaGXq9ZAQjAQXLjLNobEhHTPoU8Qh6JRheX6L6tDn6PIN
         4u+mRnory1FsVXqQieiDJSeynw8KV/QBxzfzoAwSCMrf/kAVLLWXRJd1xxa9iYZtxRip
         AXoA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1g6fMc9ohAmLd6M6Sfg4ce/iD2ZhmXFa8Ky39EkdVqtyAHrOVylfAX25qrBUa9mmHGqRE6OKjOxScqe9RfjwE@lists.infradead.org
X-Gm-Message-State: AOJu0YywXbjzvuYa82rvP7vMNGVrOICnS+voLWxJVXsUSy9Pg21zLbrX
	naqbU7r7vrr+zTWclZ0Ne9Eaiey0C1h9523z/OynJbUL8k6ow/rk7+JKO+Rag/8ld0Vn0gsIo3K
	WJwu4III=
X-Gm-Gg: AR+sD12VjtkFIWjyBhJfNrvzuSqlXspTy24pfjnj0h8mg9KK7udvIplZdP+gY67j9ou
	KNoWRjazuX7c+hhFquIYxPZgXt4uMf7NdvipCnDZkcPXcxd6cRGNICtSUDIbz1zTx6UJSfdWToi
	Y2SSja9IxCgE/ItggbAfRQRoedpB0ZJfi6ySylVdjYd6uo1K/jp5dv9xZ9mfzUVVq6Ps4xCBfhT
	X0U1a3Uka4jx61Uo5GuXpJY6Vyiz0hTOkfMd/Qekn1+EUmbnCrweaHYIAe0CZvyexE9fw0CEP29
	cU98vCfxZeFO065I3My4D/VFqGNtkA+DRovfMDNnVAE9fdtZj8cl8ssrY4O8R0nC3bDOeDfFSaA
	MQHqaf/7l/OEwwpdpiwrtjiecjX5K0re4aNP8ZE8j7H6I5Pld3VhJG9I48mcdPiPRMFrCRWTJkc
	b44cT08yletK20uSqx9AxRgZgYJjv2NkS59X78XVcwbUr7n16jiR/fVt2sit7ta/ugnVLdstbOD
	xBEzmVA10Z0XI6DDrWyO+lefZXa20ADqFxFtGlfarnliRyB5JovBfLuWbDfBbDwYIxAMMc1Zw2a
	mXPc/4/SJ28bLuSU1njGZkMyWz7w9cg1GPUqvxiTcPqYueOOwQ+qh4elb3aZzGFduOEYdh2wmQ=
	=
X-Received: by 2002:a05:600c:a012:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499aa1431a5mr212624895e9.1.1787217707767;
        Thu, 20 Aug 2026 02:21:47 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd7a9sm165259515e9.2.2026.08.20.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:21:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 1/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f429
Date: Thu, 20 Aug 2026 11:21:36 +0200
Message-ID: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_022149_864413_8E77BC43 
X-CRM114-Status: UNSURE (   9.89  )
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

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..f94500cd90cc 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -794,6 +794,10 @@ rng: rng@50060800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 SYSTICK>;
 	status = "okay";
---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0



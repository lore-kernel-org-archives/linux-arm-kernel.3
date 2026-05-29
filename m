Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC97CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LnHNg9n0JGZsDydxLfv4khIj43e63eeZtcUcMwaZSDY=; b=tYOALmI5lLMjAbUzWQBuEKiys7
	fFRr6YfV+ol1sxyGuTsLqWyekmTWCSKm1w9IN/tUcfySOmbHgeHy/LT8gDqZ5xm8smRjbkv15Llht
	BtWW4881emsh6ECUd4U68MuYLD9Uu/Lv5Q651t75gU7Ln0cGV0J9VxAaNnCGx0QDMaevxL7AFVHWD
	sOK8BmQDrf5IbblHW9VPF+zHB9ge6JyPpeIT5hJ3xq9g2oVDtqwLwnWC/6HpOKYOVsVAH8t5stW8u
	1j4hv8Z+jWb/xEkp7lz+iWKP4Eeiq5rxERLLPUIvGyqRGe5ybXr2mB5gsBeolNEYxpqsnwqN+F15D
	MIV1ehdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZM-00000007m6l-2NNh;
	Fri, 29 May 2026 15:56:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZG-00000007lzA-05cp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so95482465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780070172; x=1780674972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnHNg9n0JGZsDydxLfv4khIj43e63eeZtcUcMwaZSDY=;
        b=cf+pXIYnVcTUtrN2YBx3tq7oj6C0WlPiozNzaFOV5dQcvCRYbl/TSl6CEAcQQfeNLE
         QA04MkpKDn0m/I7YKG2y0jl64QTM0AwvK90s2tojkJ01Brs790hoFnGiilLYhZ2yF/Ke
         NY/gH9fxecLBs87gIrvO9C4+CKVJyLqaNyhVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070172; x=1780674972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnHNg9n0JGZsDydxLfv4khIj43e63eeZtcUcMwaZSDY=;
        b=PbUvwdLkvUAjRkMVA4noFL1Bu4OmFYJf+2NnSXvnwjTy7HMz5eX0L6Xje/Wkuunsai
         rSsUyGBHFnVWkHovxxTMc1R/O4CNpDYvWhd9eA1byq/L4wUdNoj2EzsHVj4GXdpfA44H
         8ucVJtQ7Gxe+seXuGOCufGYD8QL5lBt9N5FTLgWXnaVp1SX8Sqca4ort5H2o3FVO1ZJ5
         7dlr0kOlhVhs8wW0vqJXiJG2ghe/vW4Ae47xP1LFK1mAo24R1icsPf7HHGnBYhqvcp09
         /U8aeqyb9+swr8VbfMaZ+2aB/4lUY8V6AaoN40kv1MDQYVnZ9MqCAEcUVjsQlwFjXbJZ
         gn7Q==
X-Forwarded-Encrypted: i=1; AFNElJ83+4w6mJV5czln43dthKYhYxZzfs/QWiakZ7Sj0pl6WYbCzTEH1Ock1PEZ9uPa57Q/ojpXFtZIpYthbsKUXzcC@lists.infradead.org
X-Gm-Message-State: AOJu0YyUzMzPCyIeKRuXD/j0OWQAR7McMyc/vuZo4/IV8pgZTL8gP4AO
	pasLHSjMmoAFHTtrTC1h7OBhFyHAxHUrFb6uH8PNcaS7nbaKzPcVccpO1D2/vSbxK5M=
X-Gm-Gg: Acq92OF1dI66fH34hgO21F5mt6qxBNZ4+abj681WJ2wCa/KYkOce0nRqZbZRE0nng1g
	IKRBrBNPxbjg9tZwE55ymoeNBgKNg9c69+o/MlIXWBACecSTz/9ip7bwh5lipEHxfsSwBjVlxk+
	McBT2fF4tb+gMh6/hac4jf43N8cOf0AorgSCvL/BKzkJjRzWlHQxdkKDU5+BDgXXhj7D4Zn6c3w
	Co+yAU++67/BYtNTo+ThDLuST4sLEUBDF3apoKXX4yiIwv4pvlee0UbxyJPHyOs98pZbd4or/4X
	mXAl3JiWvMv179V958IyjcwOIaCQWfiBWwM7Df0SUwPq4PB5UZYhdNrnSFwHfUWRR33ce/Szy+9
	/eJi6jnW8Fi+bbAHMeM7WQVKx0R/2WUVZslxKJxqPLOlwDcHIzjO8QsG+5NQIn0OzAK+2ok/ckw
	tR8wvOfgnDCXKcY4i4IKGQekJnxlfzyGKzLW/LkYl28sHNM8eYxKD2u7yOyLxSbmYdKbYf7+VvW
	QvjfyneJ2m0wX9lQRNdbbiVPv6Q30gLMxcmtVG5ixBirYxN7gSEEdEPt1oNdqYCKz8YkA==
X-Received: by 2002:a05:600c:8a0d:20b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-490a293dcaamr2867795e9.20.1780070172253;
        Fri, 29 May 2026 08:56:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354c682sm4114680f8f.23.2026.05.29.08.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:56:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Fri, 29 May 2026 17:55:50 +0200
Message-ID: <20260529155607.3948045-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085614_106330_BC3A6066 
X-CRM114-Status: UNSURE (   9.59  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..b3416c928c08 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
branch: stm32mp251-sdmmc1-power-domains


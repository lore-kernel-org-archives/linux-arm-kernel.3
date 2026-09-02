Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22F1C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 04:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=; b=UlJuFoVuZGY4XoytLUldPrX5ni
	gRajCZbtGNG9B6RRt8tdLuMdabFrVQCYBGpWsJlENZXfKy3kE9NiHeR+HIdZlwwXhCG1l6dNe5+8S
	YRVbN2QoJGGFrVsZK4tZEpDqb5OZxhd1fkMhcf26SJ0OR5W5n1Tvzd3l0C9SQsf21nMPcTRScecM4
	S0lJuIjxIvUUD5XKmqe7OOROay7RfCsVv1nevKEoeO0pkFJZnih1TOkrgR/B1DFbWGx88yBG5cqgU
	W/feW9otkPAxc07oNdowQMmeXTtKrixFdG0fy+PUL8W/CrpYUyKmc7i2s6oFB6vj3LFZkxvP6lFwZ
	jodTqwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cEa-0000000DkKa-1iIu;
	Wed, 02 Sep 2026 04:06:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cEU-0000000DkGB-3pya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 04:05:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso5990185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321953; x=1788926753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=esJRKgSwhiJk48stSf2FyGcymtyEN7fgNYqKLAsVBVSdcm8brBJ5R5D8rBMsGRgp2r
         XqgaBtA4uRtAjdWU2+qbJUtEGSLLYyJRJVtfUQ7AZWdL15dkpAiXAlijG8sVFxZZ38oL
         fXbw08SM8xNMVaAV2dHFxb/o0ToFyI0Moc5JN2MhoqZSlm1V1HnG3GA+E4Oj0CyWIy5b
         wdKjiAzoC8QizVRsjVqlRSQL2UMO7Vun6cvIJH1FCSBlJPxAwcGaaVyMa7TdUu9UZqMW
         xj4WIZZg53SS0Mu02kcEYPYvzy+QUv16czgoALPqp8g9weqUB8xDKSwNCO7ozEsa4mOp
         VYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321953; x=1788926753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=VJ4cqEXA8rcWhzptiZP0sBPBtyTe/8b5Xqb78nDw9I52waQPQY443LYkDPk3RLrFPp
         DrhHo9Q8DJKTLJecmae2oJ2lIqXTc/+O9V/9kbJFB5oU0cdRCVsD12iO/Vc7IK/aeW9F
         Rtpcb0VB0s6Ex8lEsVfwH60FiOd7oSLft1XMgHNcc6R3EvFmsnUYBdAot9ZmJVHUZ+g+
         6f7KUD7SUW+NV9RFIl117S75HdDkUtA4PFTxTfkpu6Bo3D8crLrwp4Fn5CixXHiLbR4k
         2XMpiTCT8MO1ZY0zV09b0vE6iNfGLr+a8Y23mCjKUpX56dzC5mcCwqd/A6QZ+gtoV81o
         4BEg==
X-Forwarded-Encrypted: i=1; AHgh+RrTeb6KZqtXJNF7VKPXYEh2gc78zekvOECSFlp+92mKz0xmzdX5ux52fB6M/W7YrBt53+sdJhuWC/Kf+kOijaUx@lists.infradead.org
X-Gm-Message-State: AFuF++km5bF5CZ6Rc8/WyLGZlWO7VdpQ5adaC9E+uffh1y1g6AnZ//eL
	lzD8DAj4DYsZfbyxbQHU3aH/fMW9xTqPiWqzKfO2N9nAXNLsSppY8ujmTuy+Qup53H0=
X-Gm-Gg: AR+sD127EucwGHF4GAPNdomu3vo8nMM47irziZ+SnuSmx3emhfWH9rNH20FTcxW7Y9C
	DXFJoCLfszVDOY9npQ7wOHDlKE4Onf1tg21VVc19txqhnBUxAHFcryM08/0m9J83nXT/5sPM4iR
	bDbuUyq2n4UjETmw7YNw1RQkjHvBKAvzzod9GVyPvhQqmsqg7LaoLAVFEsILrwnd/P14Qh0JpoK
	x2DlI1TgkIlkySP9ArlVcE6rbL2qfF2TruWZz4NRhLkP/zvzVByy6MegJkSkfdo7iIIotcjocqi
	RrBicuQMZ/DNzKr1ORa8OjTVBZkS1aLKL9ISWNPMK+QGZ35/qeXz8doS4hcJMjcL8W1OPR/nKBc
	AMuhdZOCbv1mXEr+Bw8UqE3xoyn7l6gslQQWVeMSZN8Q8gnP/DEwZLpiNDUEKcBqD9GqndS8ISH
	Idk1Pbh3IEfGdAKn1C3F/yr6r7ZT+O1qJICshsWzL9pw2CTuqUUQgF3DDteAwJ5JrodiajuEcyh
	YQiVO/zycjfBYrFLZ+p/yE44sPkoRJDiwSwvSU2S+oyjpFR6UQ9KHFg6E7pI4M=
X-Received: by 2002:a05:600c:1f92:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49ce5816440mr28643995e9.2.1788321953089;
        Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:42 +0100
Subject: [PATCH v6 5/6] MAINTAINERS: add Exynos850 PMU entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-5-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_210554_998973_7BB19148 
X-CRM114-Status: UNSURE (   9.90  )
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

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 554246ef6d91..44986153183d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24290,6 +24290,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0



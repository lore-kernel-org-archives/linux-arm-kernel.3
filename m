Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139FFD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=; b=rzb1mJ5/kfVMrxAVqhfqBCbrQc
	knLoG6RxXcq8mYN7hW/IEOJaVHZOf4I8Jl8pE/JPqbs5yeXiZXKPRsugh3AfLFiyps84DdsPQiasR
	TlePzfH0g1A3jBWL98UiphAxEnBDWx6r0QouMzPPh0u+1s5Jr0cbfKSdqwVUIzitesollUKweyPBA
	MVKFb/S9xf04PR9kgkrGEHkyQOumX/WsbikTLbiRtPUDwpANHJw3qtRmBRbW0yZ31JPWPUoLtu+qe
	aer80ARvRGRLsmOzqcVQB9Pixx1Q20aS72LhsiiSYrxlZPvIUP8wDS+HBb2rDf+EUkdrxKOumG1sz
	ZiZDeGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5M2r-0000000AErK-0by9;
	Mon, 28 Oct 2024 09:28:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxg-0000000ADdm-1lJN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:22:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so4558452e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107375; x=1730712175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=E/C0vpxl28BFvwRK1U4tuk4UBsj2/gswOeK6TS63plKVYGKseK1EPpdSHXqX+KiG+3
         UGdsxbbxXtEb3YVSjNiwJONJxUhB1zcskDClGFvI94k4ffuXbzrHXFAmB1lSGX1ble5l
         OAx6aJsilXoJInIpbeeKuxjnV7FtYjiFZl5k+jVzr3A0UEUPGOd4i1awP7lGAszQPwHo
         9dQwGL1N3F+wnwB2sijGKHUK6V/PFnBpCw8b/mdrPPqJyan8900S+6ghiKel3v6V8rF2
         mUXgtV4ZSiMiYvNda0FPAHVoYGzAvjl2Z8dfM7uWsQRI2K+G0I8AIossWSPUunvGetAy
         WECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107375; x=1730712175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=NZIzPnRDzph36/iBlfk7c5kZjkT1J78IyICQgf4xKw+XUdbzrgmUwfE73TtOEY5Kml
         RLb+u/aq9Ii9/3sj8/CdK9/Q5E0iSnv+FfyqufY+Lu7HT0gEscBuyzRgJj2Zh+5CdNd6
         MZhKTWWqwaVhmF6kX3AwXATroLJ2qUjk8u3p7Ao5p8kibBpt96ZmgOvVT95uRaxxRAT2
         OQfQNU3sxHd5mrL9PYs2ZeMRsF/hXDDHJHpc1nU27F2pjXHtCvY/XCWJ5xn0O3SYXzDl
         qJPdk3gveQQOTpis0+ZHUan7WLEpLJsgr2FPfZaa4DG1egZM7XbTru2I2vFXTnZqeoy1
         tVXg==
X-Forwarded-Encrypted: i=1; AJvYcCUEF7mGhsbfLWR7f7srb4O6Q42rQld4cwP/s0wCHtqWziNBsCGqVrThrdZSmbvdy5FK8FtkGj9mY+oxv2pxcJqZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz260S6RMUpEfAPk8MNjCmE0DaGld0ycgzQW4gSh6wWdfuV9m2b
	hi8HnlUZLOeRvpP8I3BDLUHQhR1Z9coAnRt7eD+hEtBtzKrUPx9Q
X-Google-Smtp-Source: AGHT+IFRcgf3ECiwU8IQI519Q27K78Uui6OJ25rmRPH87iV2KN7tLz/GFEpPWHJBQHxdCfMSYb6I4w==
X-Received: by 2002:a05:6512:3c8f:b0:539:8fcd:524 with SMTP id 2adb3069b0e04-53b348e576amr2787084e87.30.1730107374349;
        Mon, 28 Oct 2024 02:22:54 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:54 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:30 +0200
Subject: [PATCH v4 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-2-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1257;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=L3bYZfWAgZW5JNaWDhl/QF4KE7601D4KEfmVId1ELs0=;
 b=fdmZQ/KmML9TiWtD/gFokOgPOpMn4xqVFodJLt1oAD+ah1Y6wFDp03p5Zj/xmIK58ZWzqjqU4
 iERMTvlu9bGDJ4JT02BbXMbWuCLTcYaowmbeanPM0TnmD7VmQmlOqZL
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022256_472918_466EA95B 
X-CRM114-Status: GOOD (  10.42  )
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

Add the compatible for Samsung Exynos9810 chipid to schema.
Exynos9810 is a flagship mobile SoC released in 2018 and used in
various Samsung devices, including Samsung Galaxy S9 (SM-G960F),
S9 Plus (SM-G965F), and Note 9 (SM-N960F).

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 47a8d98346ebb83a7ea4d11e2fc7fc87df6bc5ad..385aac7161a0db9334a92d78a57a125f23ca1920 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos9810-chipid
               - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid

-- 
2.46.2



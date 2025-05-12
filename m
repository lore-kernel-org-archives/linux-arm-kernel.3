Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468A1C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCEGd5QmXaIoIGtIYkIMv7CgoQZabDj2tjwmcFG2bWw=; b=uiuNuZt8SK0sJbWkZ7oDUZx+FC
	YN0R0qJk5gfLtdPGCrh50TsIb8vtT9HX3skbWp2CU5M7AWL5HdFrUzSB2Tvmakm/slUNoDqTueM6H
	RLSbHecHdovOJvqeJSuViYTUR+1L+zmuq0rew2WfP+wa9je4SpfcyqH+Tf1i6YoJvq6T0uG6slyIu
	65XNNpuHCG3Cz7MgwBUqc/IksAFf/TJ2x1SGQm6MCajyW45CzRh8AR2p2iD6rTwvNMNIc8aKd8wHm
	KGBMp5bTuLVRBIr/clLKT+rYZwN1yoEqqU5+UaeyRtm2zQOFDlP/iLXHZGIP0fsHDWeHSJAT5XiaJ
	XzEEPg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEb7X-0000000AmgL-3aBA;
	Mon, 12 May 2025 21:55:35 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEai8-0000000AioP-2dpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ace94273f0dso948640766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085359; x=1747690159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCEGd5QmXaIoIGtIYkIMv7CgoQZabDj2tjwmcFG2bWw=;
        b=a7x+ncdP3O+X78aOVkxbJGNFGi72Wn/VdAQfz7FfU0NtaJQXmDIeyPWoLnKd2ZbNXy
         fVKvnR2pgd9oW2RfhZ2fbTwzArH4lShTfNhi/fjGTCJdmYJ7zrH3Ak/9dVjW3haZ3KBe
         W9BNMK5NhIe652Dpj0syZF7Ls24hU6M72+jlf10reTkwU5bKXM2II2z2Ws1Gx+637wzu
         h65sF1o/bZ7s0zG4vlE1Yo73sDFs0in5QOSxjnHU+DnN2Apkg+BfexKv72n5kVfStBvl
         D9q2/TZ/40Q9nn+EzEPpoNDbIbyL4bvpPS2syblIUxyY1ULjFUcvszWg71s6Mbhs71vh
         ocFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085359; x=1747690159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCEGd5QmXaIoIGtIYkIMv7CgoQZabDj2tjwmcFG2bWw=;
        b=lJoFTdPqNx8S33koT8vE4RdbhtzvXs/EWqOjork2+iizbMnB+lv8WHKe3cfEoThESz
         xF1Smxy7bQwkA2h11snzCFPW++xV9/0NJ5czBz9ovvEEZM6J0WWMZ9063HkAZC8f6qQD
         Za78XbERuC9FlIikIdhvdaKF4vkoRrm0CtSIEJ20fJmeqKQvK6tnueEb6rETuOMxc9cM
         XObArxZft4zpk3MLIa3sMf33JN/0cIOWzMJ99oRZEqS4mh0KPW9qq8RrLRtQ1rb6Hdmz
         MvNfrXJGj38vLth6yJ9r7aXbUMGF7moBnSIeO/6/6bdfju7idTPnaKbaGyBaiaAx/RLV
         Qk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVySaxGBcH7H5bLryYEBaOJiD6HsKKl2CjKx5hKoeqAd4EZArfhOTfvYDfh+bKXFfqoYmawFJDryVADOnsuiGSC@lists.infradead.org
X-Gm-Message-State: AOJu0YxI8U43rBiMvu5Kbtc1ZL+BPsZ5DL559cMs9G8hzPbXlRDriPBj
	yORV3ocZfmYggpQ+QykeP3qz7NtHCYOtEVLo5SZJLQhNYpdcavu/
X-Gm-Gg: ASbGncv7X1VeQBhmVH5Pd8eVRGCkyVue4N3WUUvYkiBg1vkGE1aMXJqy9p5JZZReMpd
	AxQzpBksEhqK3VAlTTSDXnqZUEw4rMdEe6KvYJpCrO+sXeeiDIiX7A1MoxGLwYRdL49F98nXjxi
	A+DpY6KPfDMn/RJGJrUnLi51LRQEqxFkn7U2IWh9FJUCwHxQzZ+JSM0/7GvObBrFhlAbjfFTd8X
	dGzoIrKChSTTz2jCuMlqiMUGVQZs5DIPoNftnWg/wF463xZVSbtAb1XKLOZtWEkZ1zg7Ry/imCt
	O0KNo5yRmXLZwttcIitoJ7keg2tmeYsFuv9rtDcG3lZrASPcyxTwAOOVId+CRTw=
X-Google-Smtp-Source: AGHT+IFOVZsqKkUnHrG+Z2T30gLqj4jyTC304lPRcXNoZpYwifO2FrYbU1VK0myyirrCmWtQYAce4Q==
X-Received: by 2002:a17:907:72c6:b0:ad4:d5be:8329 with SMTP id a640c23a62f3a-ad4d5be83d9mr91960066b.3.1747085358761;
        Mon, 12 May 2025 14:29:18 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:18 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 11/19] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Tue, 13 May 2025 00:28:20 +0300
Message-ID: <20250512212832.3674722-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142920_668894_F41F5F77 
X-CRM114-Status: GOOD (  11.20  )
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

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index e38213209973..0adda5574714 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.49.0



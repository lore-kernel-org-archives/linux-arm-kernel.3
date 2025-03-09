Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DCBC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7binUbZaUuDaOb3p2Eu7VlTLMfhBcoFyA3aW55N69bM=; b=jw26lCgCYNzP6/OVZVHVlKM5qB
	EnKhm2n9YOwdLFHxlwBCvAIvhmthEi/ccpHsSgkZp4Z3e4/onT7HLmdXKLJ02+Ds2Um1PreWv13vR
	ggAXHw5B5IBCiWIAY80wbYsQw9Az4d9PMgnTz5SDx6GH28I016o/UQ9ocfXZBQM+TnMiKTHS/vCml
	CnEY7SZRl8ngnkovWobysiOYjtfdzPDqE3aJ1nFnapHZpsuzXlmqXWN2ukSUoF51nM/WAR6+KyxNF
	0o8HIeYAG9Zst/f5aNX45uLt1ArE90UBL8zV4sLsP7KKUgDlR1GT9qGjlni8J4U0SUE3ulAfJzM4C
	S0FhgQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCcN-00000000Elt-1RzC;
	Sun, 09 Mar 2025 09:06:43 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCLA-00000000CVh-3TaR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaecf50578eso582082666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510135; x=1742114935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7binUbZaUuDaOb3p2Eu7VlTLMfhBcoFyA3aW55N69bM=;
        b=Ah9Qzyizy26XXN62X2QR4YWIdH8hpn6482DU37n474hGCyANp5mogTNqdfKgrvP+9b
         RltZ8F1y9bwPrTldu27Y+P2OLRbDjCMBZJO1ZLF9aOy1IFxpyNFeGx85DAQxyQgB3++n
         qRcjNZAwPSBKaY/+IHsuFGFKSYtjwx33JZCeK0IlvfwpgSVKmHxishCqztRM0GxSo39c
         +wWggwhmL4vPJPqGvYRAiY9CNNRVvWaQmoHNxyDz+/uTLfgrcEImN67Jv9h/JKAuo9Ip
         Z2JBkxCljJmaNJJyE7M8lWFluREiHIOUjtCgkFN4HP/Escnnl6NrvsllxFRdfR0Kp6nM
         71Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510135; x=1742114935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7binUbZaUuDaOb3p2Eu7VlTLMfhBcoFyA3aW55N69bM=;
        b=CFtR9Dk2d0m3D0V24Kc7Lc2NWL6WRhAc/in/2y1hnRI7P92m7s4xojlD+4f4JPwWFh
         1amaBwevCIpsfRii1RV7XRF4DqBU+zZ5N+aOX4MEQH1X8jxG4ubl2TWMqm1jTBZ5+DMJ
         UM4bJsbrfCEbZ3Ivr9rrXgX6DCqQq4BDr2be/MB8llvpy1vgFSBOhe3T1UpKt7HzHR70
         5Jo+3nwO0My+/o2ESVJ4GocCmcn0TL/wbR6qKjfjrBpps31+knkjbEAW71MsRZr4AOVK
         rMo9vSQ4cujOQqiQ/VuFrrXoaq7I7/SLShuR4sCouVRi4frXaxbAmb4MlvtS+d4PCxbr
         qAMA==
X-Forwarded-Encrypted: i=1; AJvYcCUi9M5eKMaHJ6C9odkikWwQCbYK8B+tQviqlbwDocG+wpx5ywGHVkZHSvbQOPGJTkHKp0Urtp4vB2OhZXlrZRRU@lists.infradead.org
X-Gm-Message-State: AOJu0YxUORpeJpDC9fAc2uf4sa4DP4PE0KrSf8uLC6xNdY+bpuhFzupl
	K1sWypO64FH4G2A4EaQDw/03cDMb+zESslsMoZ2BFpFMpQJGq9kZ
X-Gm-Gg: ASbGncuP0dls9CYnhjB5H2FDJlWSnB5QzBy8lorOKVbvpPRk7rq1rT7MTpkVq/WL2ZL
	9LbwItHEPp9HqQK7pYlHqjZbjPwteeGM1MtvMPEIFebOgr+RzrNqxN+KphXj9kJ7FS1BbESKB/w
	pK+WNLkaTesmcrtLBlXlCJ2c/T1TN+CBmodXz8giu22wFHKIXGQ24nHaRATDFfnZRHU83DjJgfe
	U0AfgNpZH4ESSu1Srm1aSB4pZCK1QcNVISQ5I8C2vkEqDhH8yphOu6CcnVvmQ+CfEZ0apskFCjr
	Mt0vN1YhWKiq9dM4Mm7ahSX3E6VC/UrrTKKGEmbWZj/95F4qT0QtDky/Lg==
X-Google-Smtp-Source: AGHT+IHmESnp20S37aW3Ui2usQAvY/2Y8u4CD0NZ6eDoOr+o1EaAHluADrNw5wzWwlijBh6ABetEoQ==
X-Received: by 2002:a17:906:6a29:b0:abf:40ac:4395 with SMTP id a640c23a62f3a-ac252bb26b7mr1238784266b.31.1741510135400;
        Sun, 09 Mar 2025 00:48:55 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:54 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 10/16] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Sun,  9 Mar 2025 10:48:02 +0200
Message-ID: <20250309084814.3114794-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004856_867515_D4829001 
X-CRM114-Status: GOOD (  11.88  )
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 9e27568e0105..a497c7af645e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -85,6 +85,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF82CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=; b=s6HjVgRw4dW5PhROUUeAAXj0dj
	N44Wo43IlUdVP4w4yPpYYXuZ9jZImHvEfsbZljhfmZmzm3PKskFN96IBGr9zEAzPmhBoGAU794kZd
	JY2a6Ac60y9CqEk97N1BskuEaM1+U7WfJpXjASuf3sjfcoplKGwff9RqIHBoQwGqvtH335OZPUKBQ
	5IDKf9SIoK1CdurgTG0v/gcZDkrKewa9XPzAE0KHfpHstk7CVkuMCosqdQbHEq6hgXZ5+eUG2StsW
	z0MiIx2hqZDMltUZYpGwL1MWYSlthlMJqSnn65WoWXiKPjxT8gitp7bkhDOFMoiz6/+aKG09Dcr6A
	6aVKZj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCfZ-00000000EzU-3E7C;
	Sun, 09 Mar 2025 09:10:01 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCLN-00000000CZ4-0as7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:49:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abbb12bea54so603955166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510147; x=1742114947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=DjdraVw0m3QuZOVLPZH8kLiCPIQqCYIZEZ34oxvxZWmYqitnyr6KZBf+nKxXgCliNG
         T9jVB4G/CJIjrnMHwV9wxek1y3TiNiFuQQbkZn4E/yvDPnYmjrbVO5j8Xjf49K2QjY7O
         w5kUkt4gtMGgrDp1pW3zWaNWxwKFu3dm1keHxjFeXHf+LJqZaFubM2rV/jGs9HQ2sHVJ
         IsLuTbCzbFsfteYub+T9iI+0HLWH4eaoCvHhqi4U3xOAi/owDD1volNUTWaLn1kjhMZc
         sIsZsajL69HQ+7crH5jmipCSzw5zVYh6hMeJNqjUkEjjznVZioWKSoHMyUEjnmE3XHXT
         k39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510147; x=1742114947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=YXfsbRISNaNs60MCpI/4gbO27TmFoVv5cIH2MLp3ldMC8I387fW13HH5mdbWfWy37W
         BRFjy7nW4hWufM0nxbQY7dCbKoWdcTcADRxKAy32bhdav6LN+8/PE4EFP1/5XKQOzePW
         Nv+ChQnyO0tUqeVTcdJao92rhYMFFj6oE3RQ0tvVz8iYQDtJ8mGixU+P9onsF5WSt5rG
         WOGRJKB98gR3oewanj1SWOwER8dlbwjLHMMIXwLg8h+p/tVrw0zTUgaadfHEZ2aCkqEn
         NUrgZol8KCPyV0GoeR7n7Ot0ZtOL4hXggJ2JOsfQIvKW7/t6LeK8UhDFua7hQoMmw+vZ
         XMJg==
X-Forwarded-Encrypted: i=1; AJvYcCXE71sM/hCmXW/fZRtTC1PxPQOLSvX3BVrY/oK0EA6M5H1wqHyIz8zIWwyLxaR1aX2bJBUI+CqaHyKyrqVpaS2N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9r5QE7q6Gme7fsmt2ah4xyrNy1D0A2Dt37tbyVSAP7xYQu+dK
	FAxg0270oYl362khAwCQ8NGJsQlyb4g0gLYH1XhG7DU9gWPs+zwE
X-Gm-Gg: ASbGncttdBgyjLe57hlp2+WG5UcdnZ4krSD2NVisB+53+BSNqDqSVx+uUOs4uCvv2Tl
	gYX0egrqLvWGujKITiEYghMR04W+N4WFrTGk3Vew5MM5dsvTXEGXuBtCkKOsMss9ppy/CD439fP
	d5AQf0XvAWA2bnG/wpvui3W8AWWVHo/E/L2qZ1Ss3aDHPf0ZR4vk3ovUqIxSt0UWj4+ujTZ34Q8
	NR4H+R+SFgc4LWKiRhM5yj11/PT50Zb+WdbL36RRL1LtQWHcNmaHZ8K7UuB9tROaL2l6ti5Dl0x
	4xqMWS5a6McU97Vt9IIsCSqs1TPNkUS/cJQ/oYBzNy/J9uVN9BO3I1tdVA==
X-Google-Smtp-Source: AGHT+IEtJgNKkcfiGC5STawEzBHIltzLZ/lVjlnump5VNRcZ/7ElRKFxJl72L3LSI0tucNmXfakjug==
X-Received: by 2002:a17:906:f594:b0:ac1:e00c:a564 with SMTP id a640c23a62f3a-ac252ba468cmr1117297966b.38.1741510147444;
        Sun, 09 Mar 2025 00:49:07 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:49:06 -0800 (PST)
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
Subject: [RFC PATCH v2 13/16] arm64: defconfig: disable deprecated MAX96712 driver
Date: Sun,  9 Mar 2025 10:48:05 +0200
Message-ID: <20250309084814.3114794-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004909_178302_FBA75DFA 
X-CRM114-Status: GOOD (  12.83  )
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.48.1



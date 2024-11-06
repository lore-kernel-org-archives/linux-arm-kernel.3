Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAF8D59F75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqklnXtcZ0T+lSHc7mcdxj8FxKGKc9PBldQlZBXC1T4=; b=qXcXPgnCDf5IBU
	tZAAOgoEO0PphqzQx6M1Mfe895WMTiYzA1LzK4j1bobAmyqkv1OlSNNZ/AOrSJj67oOlVTd3iLznL
	K3EAud7I1+YntDaC070h9Xzw8vmyUVmr4fEEiiWfvHXuc7U4eWvDuuFZPTxwgGZ2Ku/UFKIzTaSLW
	CiG/lgPCpj+V/fOZlMRkL1ykpjFSPPIDuODSnfwvs9FoZyEVPKVpykL7YRZ65TT+hX6tEorCYBhqp
	G+jEUpiZYaaz5n7xSVZolPxmHm+7CVl7JVoUAh4UUqRCkvEAIYkiUSyZfX/va0Rh19m0pSa5qRuJU
	sYi6cfKBXR66giKfHbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oBR-00000004s4I-2qBO;
	Wed, 06 Nov 2024 22:07:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8o9g-00000004rlv-1wQV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 22:05:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43163667f0eso2784145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 14:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930734; x=1731535534; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqklnXtcZ0T+lSHc7mcdxj8FxKGKc9PBldQlZBXC1T4=;
        b=YufA8nA+/q14QCqi49lkcRbDCznIrE6yMi0Zg7g9jmWVAAI2Up7jA3mPS+idWdq8Ak
         QkT7+QikdjZh15SEk0Os0AMD4gpsIdCufo8oyMs8u9PTrzb0DbEuuhE5I/70LgrD/uIL
         Mdbe7ZynMYCTv1TeKA+1WC4xJeMIfC+5jIS9NrZt8EId0owrxsj9CYns2KukY0ydlC4p
         M8G+hJb1dFEUPcUdVgRPsmCbDGdFX7DOtX7Kn46LWOSUKtyiztQM6ENKfkyuTH8+wPUM
         npKV0M06y1VGWXDmsPYTf91tyv87+enyvUH/GPm5hUycPyr2pUp/zSgo2PlcoIPEVFNp
         adlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930734; x=1731535534;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqklnXtcZ0T+lSHc7mcdxj8FxKGKc9PBldQlZBXC1T4=;
        b=lg8tDM3cNH5f9jTMC034zZ5ZZI1qYJBqWQirH/mlR5FHY8lju4cCq9jhf6KS8pnu8e
         3QIRMWIigeLxDa/IydKicNM0DqjBGpTl5uJDxSyLvVJM5H7w6Lcl33I4yKH9YgtthQVu
         jRT9Ej+UJgX7Fao8tOkLO1aUYANh0Ssyo8uyxa7D33e/sMV25qogrB2zq/sYY21ioyR9
         qztPWxmaHabkGHD0HFVp6z+0VVamD3wc5GtJsUnTAeaDilL24l3vKNoMZX04Pt+sgGFO
         m9T/GYp45R8sgmVz27qfKcsjeFxi+zwegCDzCc7/USAudHIyXW0i32kHZ8WgqNooAFQG
         60PA==
X-Gm-Message-State: AOJu0YzwytZ4GK1ex+AiifRsQ4JZt7tGCogqk+sT1xUahA6CK+pjqOiA
	IDOTTXtpzfx2suR+8+K55fEeLc9VeOCz+9X0aeUTSrP5cqKg9bpP
X-Google-Smtp-Source: AGHT+IE6Y7ubo9iP0AJhvaqbFPGr9/zv6r/DCkyqFoxY8CAAbQQy/4bGLHV4b4+wJnMD6OeaRvp01Q==
X-Received: by 2002:a05:600c:4f06:b0:431:5f1b:a7c6 with SMTP id 5b1f17b1804b1-432832965d2mr183460825e9.30.1730930734049;
        Wed, 06 Nov 2024 14:05:34 -0800 (PST)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-20b4-40af-8ae8-9c61.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:20b4:40af:8ae8:9c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b0eesm20288493f8f.106.2024.11.06.14.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 14:05:33 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] pinctrl: samsung: fix fwnode refcount cleanup in error
 path and update comment
Date: Wed, 06 Nov 2024 23:04:38 +0100
Message-Id: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbnK2cC/x3MTQ5AMBBA4avIrE2i9ReuIhZVg0mopoNIxN01l
 t/ivQeEApNAmzwQ6GLh3UWoNAG7GDcT8hgNOtOFUlmFYjY53YyenT3Civ480A5NnZu8pKnUEEs
 faOL7v3b9+3723MfqZQAAAA==
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730930732; l=794;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=5hIr4DqH344QQRXKlkjp641JXAdj+t2BweafuQTt1EA=;
 b=UW8O+ZSbS9ocVYCoSiiqQ02rZTe+4QqvnvDRkzg7Zoadme/L5yho3KU7WsPQfax8iYAh3Wjym
 Cm+YahsvW+wDrI/MVuRCI05vflLgW6STYBl4o08MbpZsAZio+qsk7xP
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_140536_541451_AFECF6F7 
X-CRM114-Status: GOOD (  11.77  )
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

The first patch completes a previous fix where one error path stayed as
a direct return after the child nodes were acquired, and the second,
completely trivial, updates the function name used in the comment to
indicate where the references are released.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      pinctrl: samsung: update child reference drop comment

 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
change-id: 20241106-samsung-pinctrl-put-cb973a35ef52

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>



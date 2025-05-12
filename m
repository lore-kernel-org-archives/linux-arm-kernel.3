Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598F2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wj/D5H6Qe+Mu8ENnwOehkOgYhIq8MIIeAM0Q4Nh29A=; b=C+wGT6g2ZPKEQLCxaK1+/CSv5y
	CrfeRGdo7ua/OXtZCLUs5sci2d7QrmkRYrGJrHrj79Fcu4N4sz6e2XZWhsYkBxHEiOQ5CRBc8iRJM
	xGiS70PqcjQzfmqOAzXvfgkijX1IZ39usEbOH3JMcR290tLs54hMBmj3DrgtocbWSukUFkqub00Wv
	DVNcOnHo/8nAKdwTQmxz7/l2ndo6AwjHfShEXIw0pA3SyP3FtOV4xfrjgUnZuaBb7AQNJR3/TTi9X
	4kzUb6n0EJMIlbrqieD2I8flMcqWVH19vPiLol30TQRDLrXrXDsVfhD9jw5Vepci2sxAWggBItLVl
	PYh3+UsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbDa-0000000Annl-0X4k;
	Mon, 12 May 2025 22:01:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaiE-0000000Airr-0PCd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-acb5ec407b1so858387766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085365; x=1747690165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wj/D5H6Qe+Mu8ENnwOehkOgYhIq8MIIeAM0Q4Nh29A=;
        b=EC6GxPXpLQYgnS+8fpbEzpxlCCWq3v4HzCla3AA3rB7y4z5WalNEiwmD9U0DzoSf3M
         vHJNhnyz00jY6/6P9DYpXqOhXjz/177mduF0o93HjVcTEFhPdnBwyTvyIqADSerJuP5N
         Ebf69L5DGIzDRuIb9cm756RrcqZ8AYL95YgLd0NBe0/BdE+H+1rTdXOaIp12Nyv6JpRW
         9XlEG6OGSmQk6cm1Zwl3R/uqbRLpY69Zp1DleW6KozqK1Y3i78Qjxa9W+q1oUxaa63/2
         v+GQs470xeQKvHY1maXL/QvPPMz27mTT22zIpV+/sEWejtXd952ekzh3woVOizULqOjC
         a+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085365; x=1747690165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wj/D5H6Qe+Mu8ENnwOehkOgYhIq8MIIeAM0Q4Nh29A=;
        b=PREk2Ru1JtcWb5FgcVcrfF60TAmTOHvsZRUYl3KNFb5HHAbGQVpKLWqIO1BX9rM23x
         yFV+JVizvQbQuPPkbULzFgeNPl9LYfUIREMTb8oF0m1ULgzkI2BHpY5SxSZHIoQPMALT
         VvT3wapm8U8j/Nqlkg6PVPAV4Co118d58CPKSYG+7k9KIGpx6CukydscE4wpFXnV1E/+
         /lb+b6Voij32WnwCWXlIQQh9YZKbbw0BGenlr0+GDvO7SHqFKsAkact4QAOONlpoc3Wt
         4dCzDW1mjshfAhpO0NQ3D/DlQK1tCuE1rrcQ7Z3zW5GT9tCD/sHI67h+lzoLuS7xyFSE
         Efmw==
X-Forwarded-Encrypted: i=1; AJvYcCXnhOxew8zmB0M6Z4DH0TuPafcOTYZFPeqZtw6kAZQlVN9hha/6T185Hgo5BxGjSmzlafJ/xoPbqXkj9/QPbgOV@lists.infradead.org
X-Gm-Message-State: AOJu0YwoQ+OOECPRcE4lQOje7fZU8+Fx9/yW5eGDYmgTGLVr0dfJ157m
	4ZLgQ1qDIy6EI5IEdf0TRFByFLN4T9GLkqm3M04I69FEb+f1a+E0
X-Gm-Gg: ASbGncsryqniatIMsW3ByMgruFCHiai/hdBV+JVNGmj1SUqCYx5LO4hKxUmj90rQ6Ym
	5k8u7kOOn79k85TzR0mmvV4sabA06JoEFq64hmdZhgdUflkieIkIu4H6LXjSQb2ky1am1qCAcjU
	IJ43E9XjnhEBfhu4hQF+fQIBQ/yFxx6Kx+XAjPJFgAQOB4sfRw6li2zwZHtMiIx+mlA2uhouCKI
	XuECTp4ZNG5W4F3UAHNAT5m4Bu2rHXeR9o9tybAN4DCCO3t/DlqZfU8lUGLDUABlXCISNV0XiyW
	ZL/1wgeNGaLQxlt1tjeokxIDx4lIhhA4eykn8LddvYLM1OB8iz3nj1r5NnfqEPw=
X-Google-Smtp-Source: AGHT+IF9mrznUIGYs+0D303n81wrWCXoOyXY7upv/Aad3B9G+edHBUuhmp9z4B5iKaMEI6AxjGibgg==
X-Received: by 2002:a17:907:3f29:b0:ad2:50ef:4925 with SMTP id a640c23a62f3a-ad250ef495cmr634015066b.25.1747085364606;
        Mon, 12 May 2025 14:29:24 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:24 -0700 (PDT)
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
Subject: [PATCH v3 13/19] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Tue, 13 May 2025 00:28:22 +0300
Message-ID: <20250512212832.3674722-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142926_137238_F8B38BDD 
X-CRM114-Status: GOOD (  13.45  )
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c572..1c97624833eb 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A30CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 05:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=; b=VEQ2PIM5ef7IIHglGZxsi5xk2p
	rFXD2NiSvl1FyGLU2+uvLQKf7WZ7DgOFsrLjwOYCyAjgmQPWszWsIspiqNUM7aW6eHhcmTdQ6R1Tx
	9lmZlxZOPLMizOko8G6slewh6ayAVqIjot6hsLBiZukbXwnQwhG5UBM+ByuR1/L83FWZGAEItvZdR
	SmN0yrVDgcd9WHlj43iUh97T2OzgtVLerwjXkxrovcSbXSIUS91XhWLPVXcrr44b+1leQA7yYDl7x
	SysaJIG3nxvkQaaxlcQFfUqUdqMILVP5n+oE2IppgWMt7Fvtjucl0kvvxcOYokQUN0EB88AXR7yuQ
	b/nmPnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1f0i-000000064Uq-0Wna;
	Thu, 25 Sep 2025 05:59:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1f0f-000000064Sp-35U4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 05:59:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77f7da24397so673075b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 22:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758779956; x=1759384756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=;
        b=mzWC6yNyZKMfS0VM+BGp6W8udNdCKjDecrjYw1JZmIk6QWu61TGyxzCg7csvDeVBQp
         KumdbflVmMZ+bh0+2wmpif+WCze8iciTMqXPMReew3LGU4JyAuSfhspDlI2sXB/hgbzl
         AVYoFyTMm2v7SFBpHnUPyQDSowcwquBDk15t5hBk9ZetBjL9Ky/LnPeZrvadii46MAkY
         uKrC94A+BpDnDoKZtFecakJPYeKrm07HXuFGlQMlibGXqbL42Kxw7f/5uRxS6zb8s3PX
         4qNlEJjK6GezEAeKM+8lhKLvsNsnNLpu38OB4k2ut7wEN3a7z+nSKSJ7FeEtluCij3Ly
         ALSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779956; x=1759384756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzgyK9PV21LUzCc3kELjlfdCuadwZ4YNSm8kpUWXn6s=;
        b=XmwcvBM38s/5C6iloy5HQZp4ZzhAOyzNCZAc9w9+5wadVwOiyHY8bbrASZSxzJudEp
         ALLHCtazasVezPg1ACar+mCdSB4nUu+CM3vMsJNVmLmYQwb677ylT4JVDJQZ3Nf5AR2c
         FjmPpKQsaFy28WqcqzB4egHFYt91cbcJ7xrpVnMvQZUsfGrLEi9H81fgfzrX9uJ9tsMq
         iqY05NBnep+E/oNKDSI8+A7jIvcXEjVRV2HXJoGg2BMiQMc+0bBPK7xECRnB8PzWSNjF
         NV/wOmJu6BsCTHXLuJMqxV5hBJlOIWq0UtcLw9pF7+IZKrMcEMbcmXqNMHBh5H8tr2SJ
         ZGqw==
X-Forwarded-Encrypted: i=1; AJvYcCUKyBeXtsibu0+LOiZbEL1UWDKbnjFG9hUHOGFMFkOgpIhNf1QGVJyRXCXA7/p6cIyakDvvWn50s8hFKw2jpUQR@lists.infradead.org
X-Gm-Message-State: AOJu0YzoX+NK1kmb4l0f/NRoF53Hp1BwKu4JJu42u5TB65sg311yp/b6
	FSnGLx/GvyHoQ7ileLXs2N6bWii3h5lA9gCdPCm/qWf/qpyLu2rBKbsN
X-Gm-Gg: ASbGncuoPEJz47a+sLJuyzpaVMslEYZKCeTAxoPy6jfotf6J+dCfYkC4sRPLfw1xfD5
	k810hP8Ul0eLtF2mddtULO7Q/r0C/0si8JiRNeARiBCdWIB7ocg9Nl+1cEtgeUfM14Kv7XG7K0E
	lIqTgSCoCO2VRtz5F12aFQj+6ETJQjhmYd0UgT5Npv2+1kqHRTPd2ukegVi5Fp5EzT9/SGhTuE5
	fUvJGYBTGTpAPAOTVfPULYh51WLM4L6EruaEyh0bRSa0tBFGkg2yzquRKQ7nJD30VpXY0l8NDB/
	6JyvBc622DT8v8r276+UKQ1BLn3V7CyE2+e8P7t2ofT/bj4cWfbSVy8BmkJP/VaRemkgl9edziS
	fNiWu2bJRTM5mYowJu0gz3uoN7GWoWhc=
X-Google-Smtp-Source: AGHT+IG9xIcUHZTl7U2e2Kcvms7TIgsGltU12ow8osqzjYtqIjX+3YzN6wVfCYN2K3OEd05eSOjGkg==
X-Received: by 2002:a05:6a00:1408:b0:77f:6971:c590 with SMTP id d2e1a72fcca58-780fceb49eemr2573091b3a.22.1758779956482;
        Wed, 24 Sep 2025 22:59:16 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:3981:16dc::247:77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b231ebsm866478b3a.52.2025.09.24.22.59.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Sep 2025 22:59:16 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Document LinkEase
Date: Thu, 25 Sep 2025 13:59:04 +0800
Message-ID: <20250925055906.83375-1-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_225917_772501_8D6278BA 
X-CRM114-Status: UNSURE (   9.71  )
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

LinkEase is a company focusing on the research and development of
network equipment and related software and hardware from Shenzhen.

Add vendor prefix for it.

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad..db496416b250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Lincoln Technology Solutions
   "^lineartechnology,.*":
     description: Linear Technology
+  "^linkease,.*":
+    description: Shenzhen LinkEase Network Technology Co., Ltd.
   "^linksprite,.*":
     description: LinkSprite Technologies, Inc.
   "^linksys,.*":
-- 
2.51.0



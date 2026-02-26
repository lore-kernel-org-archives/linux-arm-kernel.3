Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159C2FCE09F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gSsgQwZJwP3d9XrK8WyIp3GZ6Hj1uEXl0FYyD3hmvI=; b=w7mTBL87MphYB+IJOEDm8jolhe
	Tw9w0M9Ra/mAkr/olOOaqeO5fXu4rBg+F2FGYP3YUxDGGQQPI5NNUblrpIWxOuCocIB+blvuCJRiO
	Epljrzyr+ioiQYoToZ1RmFU2xTIkSJtrU5CfNpfEYs3FbKFbErCv2eevxLOyt0iEhpU2K5PBO5GO+
	a7TgWz6lUy41BzzcGa6O0fbcXPIz5M3+0sDYptBfOQS+LEAe99FZoT9oj4zUx6YublbOR2Kv2Cjor
	NC47o22F+hCO8X66e1HIwTGm7Ml/OiNudijeEJuar6KdfDWSwmES2y6EBbz+EAzjOmtuTSQ3ALaH2
	HT2xoXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfR-00000006N1q-10YZ;
	Thu, 26 Feb 2026 14:48:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfL-00000006MyW-0kl1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:48:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aad1bb5058so8490115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117314; x=1772722114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gSsgQwZJwP3d9XrK8WyIp3GZ6Hj1uEXl0FYyD3hmvI=;
        b=dAT8pswZXV8N4MJ/uL3tQzfe7cnYB0y0z8FcGA4v+RZpPhNu/VFZfhzuiMe70TEmAH
         dyuSxNiv7r4QAJgGCLlQ9St/ORwRcYHcIKi413cxfZZkySJIIbx+ClOJ2S2uJ6VZocKc
         uLbaWjmgeGRGeSnIjNI5TD+454kMzpAWV1cS7CYhWJRWBgzZ4gMJi/fbnoVLr7CRKbCm
         RHbLw6s3Rs3q1bxFETsmvMJBDf3A0Jf4/+pkUHDnqD4+ctECwGk6xCPbBq+kdsCuBurc
         8s+9on7SSEv91zdRoQeWn0CEJNO60VFTiSVSkvhFL04lQq61bcwqqX/KgU3NXHmR5Dpo
         z/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117314; x=1772722114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gSsgQwZJwP3d9XrK8WyIp3GZ6Hj1uEXl0FYyD3hmvI=;
        b=U0363hBMNcy+oECISJAioJGNDgyyT0E7oX0cInalejkFHnYkiV8ThAXcS9Xj5NQ2Kp
         MdKo01vl6zHU14ls4H+Pfx20VclVObrOPHgjRFPIyQg2PinshI2GL1EEv/ek2L3Lahpu
         xqZv7xqk08DxbU9K0iJ64w91aqEAQoBktlDEpSTpuibEXXq6/PhVIpdoK7hRmzN5C9f/
         dUR0BVv7JIqzBcTbwmdK1ZEFfMqoO2Db686ILnkqMgUo1TBKOqXeGgHtslT4kagXGlbX
         1bW7mfCp9YkTDBH0f2udlDnRnlVh9vU4Vh6vFw7ObAzODLptYhxBsAKfFF1DfdAlRiwT
         HSew==
X-Forwarded-Encrypted: i=1; AJvYcCXwMcnHbAXT9Nejn7H8/Z14poG4n2X0mAcYBlHnw/L61hIkpo0pq2bU6RVHfK2/3lbYBZRVeS/Wip1xh7ijV59u@lists.infradead.org
X-Gm-Message-State: AOJu0YwSAiZBmvEGx0BNB90s5Eqcg+dZGGyVqNMfuBv9CsgrBPPMrcXZ
	gL3iMqreowMENsdjsNjYxbR2jU3DVbf5Cesc3RX6fB0a2k1riaQsJYxO
X-Gm-Gg: ATEYQzwT9ZCvthZl/3D+slKG1i1tPWVlO7vkRm6+9MJep8OyzCAUA9rWHlXeWEDyptO
	cWlMwiejRY0bdRYz83MqoL/xtRgA5wbIHUmGxP42VZEehGdi9gc8aTa0UdubET7pCLSoG+MY4dz
	cPac5clSz2XPQKVdfdL5Gwsu0WLBUGHgwLtJ8cFp76xn7oVJou2b/QaK2BkrWxyhQ5urFZgRoOv
	1Z2IkK0N9r9T1+FAli+dNuQYQ8GkrGXTtydl4zsE9rXwNaAES/SFBgq3EYNea7KumYkGJN5eUPE
	8yNRkI4ReihMkW7zLV7aXJAm52q9T8QAqhnT4caIqlj4qaqAWXvRcxv1iyneFtp6NGRgeYIUJhE
	bPAZs/IlzP2xdtQ+vkTCmQvyexULYDyYC9KH1M6zVJLQt0urzc8UIuHgBX04pVd4mLL8E1Mc8+N
	3iWD8arxXYDkEC1dZ64lKsXxvwWX0bSnPvy8HKEI2b5mZZ1yhkVIR6kU+VdduMzYNsgNPBfs8as
	9G7aA==
X-Received: by 2002:a17:903:1b6d:b0:2aa:d61d:b6b3 with SMTP id d9443c01a7336-2ae0349484cmr25894555ad.41.1772117313599;
        Thu, 26 Feb 2026 06:48:33 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa65sm27871825ad.58.2026.02.26.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:48:33 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v5 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 26 Feb 2026 22:48:18 +0800
Message-ID: <20260226144819.3428730-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_064835_220871_7CD100B3 
X-CRM114-Status: UNSURE (   8.59  )
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

Changes in v5:
- Use 1MHz spi-max-frequency to comply with binding schema

Changes in v4:
- Drop invalid property

Changes in v3:
- Misunderstood reviewer's feedback in v1, improved commit message description

Changes in v2:
- Fix Makefile alphabetical ordering
- Move vendor property before status in device tree
- Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94B3CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA6BwGFWueG+QJIiZVBMUSc9d4T3IHUstOE/1clnUIw=; b=1nncfbk491VnEacTm4r6ojisW+
	In5/Z9JWnvGeRV+JRUqbNxHWStjBAFibFmC60zxO2iNjtUla7qP3p0yhjhNvFbn6tFljEpRA0nLyk
	dYlpi/d9AIyWNxXeiGM/oXO5DrAeQZdthZNua8hqV6BVrM0MmJdKF9nZhfIip/Q4yQbuxqu4GPd5e
	hsAXfkX74dUFvEA5+cnzJ6liFqIbEgtdMdmk9xBfhi+LGB3/T4MVZV0IgR3zP6fQjLKaSRy9WLK6u
	HSPsbnBz0fvsg/C9fuyqSQE40kHdEQotyHpOMTGLEt5Lq5xQlyJ15ohuivUO37V5ajiAcp9LihRly
	+W/Pm8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkve-00000000xDg-3TnQ;
	Sun, 14 Sep 2025 11:29:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxkvW-00000000xBa-1t2h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:29:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so1955926f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849389; x=1758454189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YA6BwGFWueG+QJIiZVBMUSc9d4T3IHUstOE/1clnUIw=;
        b=KYYoRhrusHNZwiKbgO1OGgvwx6bYTGEBtH98uiNm3V/O1ugETBEs4RZbrm2le9PvVS
         vKEVTwinGdqHsMVLXyGlhXdyH1/MffBFLDWDPCXEJKqCDZxlukeNDYYzPapC54ZRbDlN
         h/XfNS31dv+UpoLpYJqksqgJDVAyropiZ8h9gTQNwvE/0N4bpjgg5NGTe1vLyRZvQr+A
         u7KHDdgIsLlCtOcierXvliZsTtEKVBvveKp/9tSEuI/VkJ+hldbMh4FpX8fFAWo6slsU
         ut8HSym7shOp/umswYFkoD8PtnYOxM9mK/idp0G1H3u2KZ4p/eJzJkxeMPpvdnQfgNDm
         Ch9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849389; x=1758454189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YA6BwGFWueG+QJIiZVBMUSc9d4T3IHUstOE/1clnUIw=;
        b=klmxhSg19bBRMy92VHirPBuhU45HZRTFJOpBsKwxrzyaXdamrmO+rlF8MjP7INsBOK
         9ilfPq2/6+E9SfO2Wxmcupf90zKXKOfnKs4YgqESsq/wL39KBzUVirzclY8KC8U0P7wt
         6LR3E90558ZZ01rkqfBAhAbY7Zk0u3YIxBQsI2g+8JeIa/N9pCMlpZc/IHJfOmZTupia
         K1DQJmKQ1cnRZVT/eU2giQhOOO4EzOZCuIo0H5540rmIvHEivxeQqCsrNWmmCR/iCqGo
         T1w2TDmp3EIZH+RDz/VGsPynPITWy8PW40bWxWfKpzPuDCJwypzIQbPUA+r9yOegNG3M
         c6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkqPqcHMe49QU7N7sweH0Ykhmty4j6aXcjcQccKt206MIXpZI9E/KiBwqlmxX7zAxeIr2nlnp3G4Cwjd1Eh1kX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2mVnrRFsUzcRTlSFwZ52BrATE4bJswF3HZOJ/mTtwpL09MwO+
	t14v8l7oFXvRGLt/ftMP46x+P6W3lZa+DHn9ktvGFUC1zGLGEEaHBghJ
X-Gm-Gg: ASbGncst98A7ZiTBy6WdjQVxo0QiTWlQ7UIghuDnpQ90WcQxr1GoGT0mw3TcyY2jf4b
	NDaqFCMT2Uk0IS9ZutfB7nZwsKC+ALNws9Ei4RbDME6xAdL0L5WZ+iLCJmtsti/aukJZzimtn+l
	RiEZVSBXY8Vgo4S0OJrEE3L8FKvhUibMWIizgZH/FJZPvGOJA49aAtFOOd/icOmPMQd92zK0bjM
	5m9+MeHlxjZb0v3lPFdB7ZqRC45m5KJPLoxmOaJRaY6uao29Both/PRlktuRplIcwF/rSc0Bq3S
	xzSlU2p9uzy17iTiR8Nzg07MOvHeJ4PxO1lQUs3dhHkq+jPk+WvIox3U9lrNwEgYH5dG3nwpTGr
	QdjLgpUmtRbm319vSM+DA0w9OG+6djxH3qY2Gbneqe9LrHA1odJGzyJxpkQhcB2m3OG62sIktRg
	==
X-Google-Smtp-Source: AGHT+IGyHDRZhIKdaCEmBZILWIecKug4YvVS1K+HM/kKk2Om/qzHCs838upA5zAOAAg9via+3MJt1A==
X-Received: by 2002:a05:6000:25c3:b0:3cb:3490:6ba5 with SMTP id ffacd0b85a97d-3e765594a4emr6092807f8f.9.1757849388568;
        Sun, 14 Sep 2025 04:29:48 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:48 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid compatible
Date: Sun, 14 Sep 2025 14:29:41 +0300
Message-ID: <20250914112942.2604194-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_042950_495461_159B1EC4 
X-CRM114-Status: UNSURE (   9.51  )
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

Document the samsung,exynos8890-chipid compatible. The registers are
entirely compatible with "samsung,exynos4210-chipid".

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 383020450..30162e55a 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -20,6 +20,7 @@ properties:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
               - samsung,exynos7870-chipid
+              - samsung,exynos8890-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:
-- 
2.43.0



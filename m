Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AD3C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSCtok/LXHWjOC/ldk4qZGIJX40EUPQSZo5x5RxQ4Js=; b=KTd30Mcs3wZK1LTuv1WZeHkgxM
	z0EudptlGpsibink/MRBDwG8aQqJakyMWQaTUp8yGQFIqUTa3eKFM8ERnZ2W7eHcT0jjx0TRmjtPA
	XiIh3g7+9I5BOkmal0IxGdqp70XOZei4LAJR8Twb1TicecifcwyqRWg+wBvuJp0QbvF8cg+DN0KSP
	iamRfvUmMUl1eO5uj577+cac+cLcmYYrjiYpVrVYaOdAdHF64U86r6lfdlcXqdMS8QbzaX67S9MqW
	8fgMeQA9Prc4vdhig6VT6EpXErtV9woRz92DbHIlzbovNbrrToS068pDAQFztxdCOhXnhnKabsGpB
	xr+KBtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLic-0000000CnKr-1YV8;
	Tue, 06 May 2025 17:04:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOO-0000000C87t-0oFP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39149bccb69so4426346f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538286; x=1747143086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSCtok/LXHWjOC/ldk4qZGIJX40EUPQSZo5x5RxQ4Js=;
        b=ZlJwtTqUNctPz/otKQPoa0iEyMc4/eFATmmymoqOuR2i6yvPOUAwx7fr8a261mJOIt
         Pmo/8WqzTFbWsCroNxEPicBLbkc91QOVrUkU0wIwSM+J4ElZSvElTDhUz+NErwh/4x3G
         bVQ/mnrymRAE6rEHM5+EqzIiJ4iGs4+CyhTwotWJ7xju4icTHBh/rF2LWKWPywqfg9H8
         Q55LuzVFwm0XuDlS5uE3YOfnTcoKHd393e89PaMVdmp94+aW2fseLjNS2ZVhO1r42RK5
         qTEA5PJK2vL7In+T6UM22D6d5ZFANIhXl5k/aszUbmiL7vE+ErN2Gh8wvO70GUDw/1Se
         BtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538286; x=1747143086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSCtok/LXHWjOC/ldk4qZGIJX40EUPQSZo5x5RxQ4Js=;
        b=XIPa7GdY2S+YbpmqboH1EZu/zreQghjouybF5UpA6n66V5rp+ecZNxi+RR4g8GNniJ
         /KuJrfWETmaihJGYDCUwKNznyKXBKJwn2IwwbOKF4pv/z/vhAuwQcW3ovwN5dt9Zk7ae
         csOC4Hg10f8Gm52J3cjSFccR0TWOEOlWeWJTBfL3I24TKKMIwliOV/yEFHOjaQc6XUmA
         km017bWHdSY7U8qHa8lOuU8TReZ68IBfLpBrstlWlxgumSJlJSqomMD/GeEiycU3LLjW
         3M00tpmQ1SYMgS0UTjc1mMBPZ2zhiDzlK0HnaIh8fESapvNWK0KPkT8H5ghVdcrd+dOY
         v9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHwD2K+P0xeG8osZL9d81bpeiRZmoH6JOJfb5+m772x7z9rWntv1cM8vS5bABf29IbnB1L5cOC/mSZjF7rgMpQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzAmRuAqvBfjpQOXRnKoHj2uVUT6AtYcN4axn3J/h6y70gfbHpq
	PubL1xO37Bl0frWxykiOTzt8c3UWgJc9XIbILhLAA7wlaKwNNM2n
X-Gm-Gg: ASbGnctmUTY0GGzzAgD5cShEUsyqpXh/m4r7oA5nG0laCPZ8FxMS78rJhqFPCAGXwCj
	acPe1JuPpoxR6Zk/B6KyWYBEIii3Zoo3DmAAMGnHB+whc0QNgBXEZ/UW85ewbZm9wo/bSD2ynH6
	5ZEzdsNtR63banZcc8ZjQtetb7i2+X1+ZhThzKEUQgeryEm+bJHETE+hByXgStgC11COeEB+1Xe
	r6ukVnqyQUWx05XDwge1MoFYrUBG64mw+k9mvl0eC2JA97OlDN7nc8lOpJISdCHISyF5ISYfAHz
	VoYrraELQu8sNJmVTlGi9xua20YL+InrUVqCgXdqj4F6KtxaorIdzWAUv0EjjKQrkRANUaIkP4h
	11c6ZbiQpJUmzHBR+Kx4eiEtV1wDBvV0e
X-Google-Smtp-Source: AGHT+IFKXjOd72Qs5TKxJQUEwSs0e8lqRxS+nFWKJwEVL+VsNb634sDy6T+tDo5HnQs5IujdDN4T2g==
X-Received: by 2002:a5d:6dcc:0:b0:3a0:ac3f:cdb4 with SMTP id ffacd0b85a97d-3a0ac3fcdf6mr2159303f8f.27.1746538286317;
        Tue, 06 May 2025 06:31:26 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b17096sm14150866f8f.96.2025.05.06.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
Date: Tue,  6 May 2025 15:31:08 +0200
Message-ID: <20250506133118.1011777-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063128_231365_A260A67E 
X-CRM114-Status: GOOD (  11.16  )
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

From: Thierry Reding <treding@nvidia.com>

The PMC found on Tegra264 is similar to the version in earlier chips but
some of the register offsets and bitfields differ, so add a specific
compatible string for this new generation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
index ea4fbf655220..be70819020c5 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -16,6 +16,7 @@ properties:
       - nvidia,tegra186-pmc
       - nvidia,tegra194-pmc
       - nvidia,tegra234-pmc
+      - nvidia,tegra264-pmc
 
   reg:
     minItems: 4
-- 
2.49.0



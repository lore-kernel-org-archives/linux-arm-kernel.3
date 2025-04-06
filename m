Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3587C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vp7a3HYfxPKluhq3571/K1pXx9tBAgWDjXrdUAjk+fw=; b=HDopPjKckTNTKg2jVIdjB6VmjE
	575MUOIz7ohlGYuzKOe0SPc64pPb4rhLTsoyZ/iqAPzYa9q6cTFQgV6Wyd/Srq5ZPWWv2RGjQKs7i
	xFETf6/JlF5hnaFEQb3IM4DXJbBUtWcZ90RaZJFpM3Y5DbSeZf6R1k5w8pQp6eEBTutgc/yYQpF3E
	cGxvglkt5bap8cYLE1Upgzwnigl2SKhbJF4dgNHF6+szdTEpQA4V1mYyGs74G4gasiKF6QNceRq3C
	E1VBLlMKTUsh2L2G62d9/VFnTcgVsJibc3jN0Wt5tKaOrsrTGgBlVqTOIj2Kf0XEv9TekF/tFtqVo
	lYDu6bWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WXw-0000000FliZ-3rW9;
	Sun, 06 Apr 2025 20:24:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WW3-0000000FlbJ-1i3t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 20:22:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso471933f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970970; x=1744575770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vp7a3HYfxPKluhq3571/K1pXx9tBAgWDjXrdUAjk+fw=;
        b=agFTE5MJ0jI7mwUOldppwbNdGMr0vzPSg+3dt/s4VeKAJWBf74+ZUpCqZoIrxfa6gm
         /v7hgiRYR6idrXHUu8n32Y2Zl95r/+MAEibOr8EyA6YG6tZDScld3zqGfEOdvDqQh8Nh
         Xm02Mps1CY55MLmqANsRwSW68L8MbaUsUAz1VU8B6wBxTAbffNX1+arraHdDfxmXegEe
         hJlBZhEwlHF9YZKkst121Sfszs24F4KzEZ/lCjXwCx/trTLIfaiEhTcuDVB88F8wceEK
         oN3Ez8//k/pdmAUNo6OqyAbOMjFrDm5tbJ3HpvWSO2KFWzVg8GZs+zQoW2sOsXtEDLDM
         u5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970970; x=1744575770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp7a3HYfxPKluhq3571/K1pXx9tBAgWDjXrdUAjk+fw=;
        b=L+Fh/hwjSQQHuENC2IC9TWnjMEeDqmrLFVdnLLflqkPC9oda7vfW5ZnU0QVJoUmfHd
         1Sh+tfWb8weDf3SG+fTg3moWmPWs2+Ocdk9JBaFZ/Ab3Z6612VRtSoE7b1KtbLts2Zth
         EhnXU1irJ1cIom9YAvoSZmnW0+sYZ/6L+pvt9w6s44jbEp7FV4shgg0VuzuJ++UG2AyY
         QtNXm4Hyw+kmuctQBP60C07NqMwGSMndDoDr/goatN3iR9hv8GpxOWPgFGUp6gSY3uAO
         nTHDi2sYCcISzuRe3KFv4YQ02a4h7o80rUTKH2iuNKpKi20uiVJdxq6NdnTPMUZgrVp3
         xJkA==
X-Forwarded-Encrypted: i=1; AJvYcCVgTycVMZ1/L08hHwz5yHylquWJnGM2GxqmCOATJf37QfvXyCD3prBqqP1U0Zh0cIKX5YAriBwVl7tfTZ3jVAGG@lists.infradead.org
X-Gm-Message-State: AOJu0YyzYd7SXkPzcUouK+nPxzOdxLdWo1njaPGwUrgqrERGh6qlZhfP
	DkSab+0wjap1wjd8lixt4zFYNkx23uCl3ACIEDd7x7MXFc596S/jFtKmjgTQ6Hs=
X-Gm-Gg: ASbGncvhtGfTk9VoV/yZXfA2mhsiVEGnT1ibTYeuU4rkMiqF6foyaWeLtWB6G/2M52I
	oiVzhn5btntMsYttqkOvT6vIBIsFEeawDfIfiplxh3HPEI3C+uocFwfKPaX+/azov1WokKzNKoY
	C7L1N613RCDmOqJ6jJNHzosEqaS4kI5EcejOAWVIWikYhvoCkoj4YB5WgqquDumEJLGQeZPu/Tk
	MXVYPGQo80hQdZW+6FMcXBPH2AwZRVIjDwToepyAemhAn7ftipfq16b8BujJPbBB3t+Tyl/6dY2
	elGzYi2Bco46ifAgu1ZNumKuNualXyybzDzCrY6IEkB/UUlI9YYS6A==
X-Google-Smtp-Source: AGHT+IE78MK18Cq/sIizJFaorgjRFVFZScT4NJKlc4SDdKfjlcTRgo/XX7XC4hoG4wqkNLZZYxJyuQ==
X-Received: by 2002:a05:6000:2285:b0:394:d0c3:da7a with SMTP id ffacd0b85a97d-39cb35766ddmr2963602f8f.3.1743970969681;
        Sun, 06 Apr 2025 13:22:49 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm115304655e9.0.2025.04.06.13.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:22:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:22:44 +0200
Message-ID: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_132252_107557_BBC7E059 
X-CRM114-Status: GOOD (  11.41  )
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

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 0cd4c36ae8aa..541517536489 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -410,7 +410,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	device_init_wakeup(dev, true);
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 
 	return 0;
 err:
-- 
2.45.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E90D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1w6RpVPZFLgX8W7zDDIW9Bt9wUWPJmCNFHj/06iwgR0=; b=PludNHylwUbqBOPyJSsRmdmE50
	9LLZDBXzOo9aHpDwgB0Fu5rGw9Ak+joIBhx57jUS8/xa4WiDBvbov1e7n++Qu/0R9dYsx1BaMSClK
	INejVdGmDnhu8BWQE96BIa++TRWXKKs2jAh0AKA/6ozAp/nzPav4sR4E9nZB8e46z2tKT5tJM3lK3
	Tdcfrn0i1fDn635OAZBM0SxBSAJVk9f037IJ6iahMqzAnAk62D3a5fm16cQS9e+pJc3495+3icBGF
	Wb6pU/p5+/iKuplmMFTu9JtvNt2nOUGQiV4jqLrgdD+RgF/mLT6EgY6TFxIuc0HG221AppNYtW2Zf
	g3b1nqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nk3-0000000ASCC-1MFX;
	Fri, 08 Nov 2024 12:05:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9N5t-0000000AKkO-3Vot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:24:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so1427779f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 03:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731065039; x=1731669839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1w6RpVPZFLgX8W7zDDIW9Bt9wUWPJmCNFHj/06iwgR0=;
        b=KabAQbj4xaOKslwV6srknNXwgFpBOldcERsYu0+HahUbHkt9ykheTRW2h4bDF2Riz+
         pWHtpH9T0Yy1oERDVtSdJBTc/a6Xsl8aXu2MxDk9oe+/l6Vc+EqREta6C1FqB1GAfmjE
         xwmzgQT480INkKcm/g7iWibtyQK/b8DCKXqC3VW6lqQcvqzkRpSYw8689fmlGwnXmoub
         SZUBodMgVv4/ba/jH3JSibYDKS+ZjkknbKoEUOLTtlQsKzHEzhN0NbGVcoLg2PWJ3Sm3
         k0Ub1N4hJH/Tba8qQVIDYh6InGnoLnVKuR3RD381QQGftwme3pXNfq0LNeScbLFFTE4z
         cE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065039; x=1731669839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1w6RpVPZFLgX8W7zDDIW9Bt9wUWPJmCNFHj/06iwgR0=;
        b=ay17+ZTr7LwtMnG528y9imhqgqsxV3Zdj/hDazEwWSFuWN6YXqyIxhd/4DA66dLsGA
         Z2+rPO+fHJXlgkCg7qDu41h/kgKVCOw9UJwmGCARqNOgW+T6yzVvY10Qkjz2VRS1zAId
         cAQxDNaoo/6tqS6jvqJJXOXOHvG3RuuDN6Z2/1efWy3J4j7KKtMBqrQT/3o9Dg0+uQZi
         vfHKVkc6ELKO1exsmwqGSGAg30x3IVLaZ2kViD3m2J9m0sa1BWKasArnwvx+vzKjRYxB
         rqIAvu+6vULKNjfGimpuZUQGGYt1r3ZEwEJf6M3c3Jvi4o8XtDgwO8njQV+XuAuLISw1
         ro7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDZ/4FW0n/YXceB9hWHIFJqfRmvhC5hogkPghKDiZ9HtTefbUBDlrKpAEWa2zp4FFjXEBAh/6eOYZ2ilZtnF+R@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf0ck/8elygQ2Xa4pU9iwMPap0N/kXKF/oZP4RA3agahr1tG0b
	v3XUEvN2af4ZwFT0dlhiZYEhFjnOqCOk9w7k2ATQZ6ensVZVxi7wv+JniOiWvtI=
X-Google-Smtp-Source: AGHT+IE2dTZAM2eNBdyoJ0vYP2310xH3HRvixP7wsdVyd9U7THrSH3mKlvans7ZEtSce5JJp+KGjDg==
X-Received: by 2002:a5d:6daf:0:b0:371:8eb3:603a with SMTP id ffacd0b85a97d-381f17253e1mr2103427f8f.27.1731065038785;
        Fri, 08 Nov 2024 03:23:58 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm4281443f8f.10.2024.11.08.03.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 03:23:58 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/3] clk: lan966x: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 12:22:34 +0100
Message-ID: <20241108112355.20251-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_032401_970672_6F3AD424 
X-CRM114-Status: GOOD (  12.11  )
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

LAN969x uses the same LAN966x clock driver so make it selectable for
ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index ef709327cba1..713573b6c86c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -270,7 +270,7 @@ config COMMON_CLK_LAN966X
 	tristate "Generic Clock Controller driver for LAN966X SoC"
 	depends on HAS_IOMEM
 	depends on OF
-	depends on SOC_LAN966 || COMPILE_TEST
+	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  This driver provides support for Generic Clock Controller(GCK) on
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
-- 
2.47.0



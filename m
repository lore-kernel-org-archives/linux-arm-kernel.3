Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B23DC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=; b=z94/gw8LNz7X2Qedvhb8ZrTc7M
	Hagww8uJZ3jdkZSlu61P+pFV2dzWhLzpFZB9I7fHw18PrBZ4JMTTIQZb6sZTbpUkmc6ULflBYDzjO
	aGVBeTEzQc5H3xf2oN6YouOoJ93BuaSa2pIfZaNu2yIE3vfOY/sviB/48H6cIBpLwWv+VfMiILFqL
	2orP8sy8szlye/aJHK7/AUFQ8Y9GHwniXIlUyUt7TGDbrAXQ9H0AbZpDtV/poS5Qk380bCVH3aR6S
	0aFTCfIngNWTRcCFrsjqeqT43ixCTi+31B59BQzI4hYB5AIbtMs4h5mnYJxPRxJoyaop8whSNTcaJ
	fR30AcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrabv-00000003t7n-0Gzb;
	Wed, 05 Aug 2026 12:20:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrabt-00000003t6A-0fAB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:20:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49553515a8bso13234685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932435; x=1786537235; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=;
        b=IzhcIwSJEB8Lg+ldtycOq1CgW3FYKUJhjZImNsNgPOnGTQWskj0p5ESol1NH/33J4K
         FTHUiEP/Xt/cZLhehRANszXo75aBfVAnnmM0hYsGiC8FO8TAdXxDQPcpafjfIEwhsSKD
         apeo7iRZuDyVlK4K8HWCIPcZypwJ/WtwdriiFMji0xCkB76VU5q7CmxlEYkXsPsJC/Fp
         eCvO65IN5PF38Jdy0k7L8zd0v9ENO3VDZbdqChTgJvtMFMm2tjRXK73q/m1Mhnr4p6QA
         /B5ma4mVlwstEB2cy2pnCcF7lq/VpC62zcWzz5LgamrXhvkuYCp8QEHon8HJfrDrhLaT
         8+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932435; x=1786537235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=;
        b=MMRP21Dr0wcaQPXGXQQbdw64K9hll7jDIapE7ipQJ10NXzNQREL/AlahjeQWN9Z5mF
         aq4+pME8ce3AoIGw24hXWi8+Z0kzlsHTPa7DQM1kenhNO0Kpk2q2XUzbWK01NeppCrda
         ZUUucjTqIjsbZLm5UHlM5c8pHY2wqx1pU7p0NQh5w+q1SKBD192KtfDC4sk6N8rOjLiB
         tHFYjplrwjj29e1EducH2g1NkQgtMzn4VNJd2HEWJpYgymAlhxtJp+ps6KAPt2gYA666
         9iOKVtrZ44AhytdHwvCPzrWqnAejWDGYIa5RsYEbT+bhAvp5zIeKSfGuIcAGbOY4OrYD
         8SAg==
X-Forwarded-Encrypted: i=1; AHgh+RoeTqrbTDkvmhN6Zx/eiEF9z22dvdS7TxoOz3n82TYHMYT6lPMaK/Ff+pGX5HSau5phcgVr/4pF9VDqp448z6+E@lists.infradead.org
X-Gm-Message-State: AOJu0YyKQggvtYZiU7euWwV7Urx+pfY7HVXFwPXHvapQ4XdR+xli70t0
	oB2UJ4ei6uVIDXt38tZfSf6qnWtCcGrHpTY48BLXujWjD47SQIR58ibukBT3FGBp730=
X-Gm-Gg: AR+sD13kbCc/Mnn+TdkDdcDa8zPiDFiDNpq9xPpEbZFd094UwYVyGx4H6dBKDd8hEhI
	vtwELBvJc4yXo18facJYX934Uud9HcRtgaSWgLwtLEJd7AqqHl2+zre60n4ODpQjmz7FfBpFxNs
	SjntNXn6tIG+Wde6OHxdsYWmVJgF6QFBzR46bxGW6zzvBSuVMMZW5wnXwfWnBMa+/IgmTZGHFD0
	+AQBLKuGFTKtUqrnhdFiU7Txp8BN8G+1/DCeADWEKqPnVj1QTtWanUhK0HN3TJGCueQqadfijCK
	ZNjIdMQbK5Rx/XnlLCDPzkXDeO4WD5TAsRU24wmkj2b1lJP6N2K/Miy0SAbvpgILEexJ2bP5Ntv
	QR3FzPXNzzLLZXmTJiV2mnRfiahDJU1B0onUXoyK9C/Qoz2hmZLy12+oaMtV1nCGpjImSYgw1Rc
	Rw3USpZIqvrNDizk+w7XrXYDMcb/ewLwENQlRIwOU1xwE3AtBxiYH9/FidAHqOjGu++5ZlgE6fi
	hEMK6XcGlDWRbtFHHdx1DgqmCzPCgAeGbL1c7K4bqyo3ALn3Ud3YyrVrvhWllh3nGV1BNsvHguz
X-Received: by 2002:a05:600c:1c22:b0:495:734e:4825 with SMTP id 5b1f17b1804b1-4994e7dcf28mr67408645e9.16.1785932435246;
        Wed, 05 Aug 2026 05:20:35 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:35 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 2/6] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
Date: Wed,  5 Aug 2026 14:19:49 +0200
Message-ID: <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052037_279162_E4938903 
X-CRM114-Status: GOOD (  11.80  )
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

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);
-- 
2.54.0



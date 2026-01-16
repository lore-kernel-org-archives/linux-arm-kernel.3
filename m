Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401E5C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 23:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q0sRttI86mEpJh7BtqYPvvcOCP+5t2tb7f6cBrMGu8=; b=BZvbzB3ljrBG+1PN8oahd0J+0g
	/2kix0fJG+/emuWEBuxENi/A3llcb/3drECaOa+laRbq0pmOoO9rOP1pDjCKZTD22jJAE0r8nDp4V
	bXeDQrnd7V0D1v++oZLu0yc0Af2HNxYd7GU34H9ye0Tuk7qKJOWPRy0EV0QIPXItijpkocBBvgOsG
	+hJosRvmgMSBYBbaIpIpPefjZKB9nHgf7QSLckK7LJGCT2D/r8Jn/QWJHrRH7m4s+gUrJ7Kf5HMgA
	8FWgAtOFsisUu2ZdTFFa0FCW8X3JP7ozQuLQbf3G14kBsPVNhHdD6VWjsJFj51t4a2WnTnlmsnSfH
	A/3XYzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtMD-0000000F19A-0pBd;
	Fri, 16 Jan 2026 23:35:57 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtMA-0000000F18U-2Yux
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 23:35:55 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-11f3a10dcbbso2663512c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 15:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768606554; x=1769211354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q0sRttI86mEpJh7BtqYPvvcOCP+5t2tb7f6cBrMGu8=;
        b=CxBsJOHiBmVTRgZQ+VUjzdVWbEVQvHjiSORqZ8f3k3Y3W+BFcoS/NcUe8EHl6cFbl+
         vk2mSxA0rek3iVpq9MeZbbsNqdVE16CFelIqCatmwjs2Pj00nRQzglUPLeJSiMJaX29k
         24/4y9twIaHEkzImy0ieHCjPoPJeoNj5XtkSpJglu2+6wmBdZkd4N63NkpbgNBXv3t9C
         3MW2it6hTzXHemAO3zLOdVSwwr0L8QyFuxv6feE12+svMcoOvbTtT+CQ2WbHG6GpYBC/
         m4pSDDTGZHkFA/tJ6g4nG5IyJc9mijpGsJOTnSm8Lrh1xA7C5txKdvCZrnNhGT5RWJsT
         F+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768606554; x=1769211354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q0sRttI86mEpJh7BtqYPvvcOCP+5t2tb7f6cBrMGu8=;
        b=pHcbi/yyE7G6tQxjXkBIHXGgkRjZew55zdPu+jOkfYXfsS17l/+klk84Sv0eGTiJuW
         dXKSi7+Q9te0xIzAdCCPw2UBPqGjkgeCa+vDwB0A4ju8GMW9PWXy8Ol1J7Qe+dJJf3Qc
         +Kp6r20xseGQjjhPNr/A2W9ZYM8whD26q5Wgjv6YcAz6E04iVP2xJ3XWQWluG+kHvq2w
         DswyB8dJfUPhO4HWdadL+eW6xqo617euqkfgfSVFJxUzEdUyQPPUTiqxML7aLjQNOJ0v
         hbX/jx9KkQ/lKHiIUqQLoOr5ItXWcH5AQ9Z7cMVgy0dOXmTB581AQ3rg0yLNzZia6uaN
         Cggg==
X-Forwarded-Encrypted: i=1; AJvYcCUp1Q9E/XLRs/E9qyW/No8ylGoytZkxJYIKldGg5XilmYm8M7f+UfcZq/x5A44BREOauY3SabYPvk3xEPs9Yk3f@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyx0F4hlNe0tYErcbrb8a+rJESzOPkfYH8XLB62ShX0W7KSFZN
	EZkknSuyoGqE5pyXUEvVKQmDnWLDWEI2OMDIJ+Blon3d5wkEpFbbz798Hnf7Qkt2O1Or/iSlgw5
	tdCNV
X-Gm-Gg: AY/fxX6jCdMfpBSqvlypctqmKHtyZRKSh4hD+18GzQaajAkhPnLt7Ksyk7zrYGNlf88
	CT0zVXUMJwvbafekF6ZmefcyHNA953S5KjvYdNv2es+oyw7cVAdXBV0N83vnu5GWkiYZEBhrkqK
	Je2c+pHaanEjJ8zDXgQUAta1KeKz2QTmuBHr40pf9EQaNCb9Tf9f3bH0KHXU1XJfdq8McC5I+zN
	Sp9TH29XwKIsGsrRc/khGu/pMEDgWSzQxupJfbYXH4jbbKH5HjjPJAc8uhZuOi5vcbIe2trkFQz
	bTxKyi3e6AgJ2LMqOcb3/h9TZki4jPXUpsvOdXS8hs1CFv6wos+lqWB85dus/RASUgmPaSh2EDX
	lIhpd53TLZ2C8j/pwHFgnOFrx6s7MSvnvONHdDKeeGdsmBq+kEwt9C/FfnKjRjT1UnsNI+TMxdB
	U60tqqhmqpno6UK7QOcVQyxg==
X-Received: by 2002:a05:7022:221b:b0:11d:c04a:dc5b with SMTP id a92af1059eb24-1244b35b987mr3230415c88.30.1768606553966;
        Fri, 16 Jan 2026 15:35:53 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af22aaasm3877513c88.17.2026.01.16.15.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:35:53 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 2/3] spi: xilinx: make irq optional
Date: Fri, 16 Jan 2026 23:35:34 +0000
Message-ID: <20260116233535.260114-2-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116233535.260114-1-abdurrahman@nexthop.ai>
References: <20260116233535.260114-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_153554_651733_36451C57 
X-CRM114-Status: GOOD (  13.17  )
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

The driver can work in polling mode in cases where interrupts are either
not available or broken.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/spi/spi-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c4b70e95b695..9fb1da2fcce4 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -471,7 +471,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	xspi->bytes_per_word = bits_per_word / 8;
 	xspi->buffer_size = xilinx_spi_find_buffer_size(xspi);
 
-	xspi->irq = platform_get_irq(pdev, 0);
+	xspi->irq = platform_get_irq_optional(pdev, 0);
 	if (xspi->irq < 0 && xspi->irq != -ENXIO) {
 		return xspi->irq;
 	} else if (xspi->irq >= 0) {
-- 
2.52.0



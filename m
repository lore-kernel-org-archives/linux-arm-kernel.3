Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C735C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=; b=NdjQEmVRUqP6K1+sQnYvzs9609
	BfakZiEcjGi5yigAXtdO13YVkI9AWDRIWk9Kre7YeSIjZ6ehxKyf4Puw8/6tVJcW6pdkTS8OrLdqn
	NL47ZDOPaZi0jutxM8g2xsplx/Zv23E9T5MdwbSaEdzCXvZ5F9eY0iXDQMdlGOhvW0UC4O1Mg+Ckw
	RftbMSUyW3Ib+OQm0S5h3EiSDhRK7VTcD49vckQASKyxVGHqZSJwgdQtoBFS72NqcTX660fnYquyE
	VCNZTE7Un7bxAEzWiNY4oO/5fZqPZdrj6bFkjbqFA1DGIKulswVppDCWf/B79Byqvdp65ico4YV2w
	w+F4s1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOIr-0000000Ac1o-2PVp;
	Wed, 11 Jun 2025 16:27:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLDD-00000009vGO-3S5p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:09:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-450dd065828so46432645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647389; x=1750252189; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
        b=dJCZ7zs+p3RPT6ADnfoSEN/FwElSw5WCgeW406qFjnU80prppIskUOVSggfCZZjYoP
         EOWuGuM3Wt7ms9SpHOYnZZuqab6IWNgdzZx2gc4I17vaD/X0OCnQIYCA1AUUSYJkncZE
         ByGgnRipNcie7NvYaePDHb4MiiVL9FZVsqg0kQd8SKPMXfwV5ozzPUso2gPVwzqy0TAB
         yPTuV7cMpC5smiK5pS2hpdPbcZ4Abh9qzDiMyFT2szP+LfQrt/WN2U4/3qSHCzrJ9qzZ
         PYMv9wxPARtdCpw2Vds+f/xjX7/J4dTqmhR/VbMTF5xdkxBRYOc97ccL7zxswQvdAZ53
         aAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647389; x=1750252189;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
        b=DFiGLkkYugYD8X/IqRKY2wZq2gTCgUEnXgUmthFIslC+SRUs2w2+uQ0wUxvhCAzuX+
         /XKAjorzNcS+Z7CK/VRo366b2zaoDZQY3Q6DboV6cPm+ttuwtoJ8fK/9gJVHNozCU40O
         ILZMD7qma5xpwH7ZxaUFR/+bDanTNSVGPO9s5TTgC+U/hcxeFkoUrTjSTpuzqde4y9W2
         3kmWetmP95VDRfmFOgtyAeYIv9YXoBDe7Ix52773KxQTI0GebvoCsoRXUFB2uJUjOqX5
         HeSYVLdTouGKW/8UqArSMlXP6VN+WE6AXILpI5AcctfR42KffKg/ZGYIU26gv/As6u7j
         vfrw==
X-Forwarded-Encrypted: i=1; AJvYcCWCwl4QBf7Ik50k/KmBgkkKLD8igc7kxtPgf4wrdIg9QnNGnpW2WEXqXN4P2H4ho/zV3QhVl6Z5OaH64iySS8TP@lists.infradead.org
X-Gm-Message-State: AOJu0YyHYt+5TuNfV8z2TwlczNbt9gSESTAlbusQhqu0XBCZw4abphvN
	MnIA8QUxoa9lZPIEF/wb/BjXagofFod1fnxA9V7ouNSppjudNfrvFhucjcgSMhyxQ6dNS+OrM3b
	oBMVj
X-Gm-Gg: ASbGnctX37W1Fd5beXBG7qN9wmyLS1oQd+kqJzwbfeT9ifsx+9lA645fL/kPba87YJh
	peY99Y36kXwm8wM7veA7CGdMuiwCh1J9C9kV85FFRN9gy5VukUfFgxNuKUuIFODP35Edi3eVXAV
	yVvWH9XOFohFBp/LaguMJCSltMRKx7koeOsuWCUoS70Iw8L+Vx0tijru0ZpNTVcQ5t6/AAXgK+G
	gPh9pFkEoxPuJbzrP72DBUW36+qXdSOfTA1tadkoQUQiE7yxMyKv0hpvpWdgt7w8banpOKLPOff
	/o5sF7jGuDsz7NM5bSdyLwpxqCTvhclbhNb/Qb5K/oqHYvosXcNhb6Yg5BZwS1OTb2I=
X-Google-Smtp-Source: AGHT+IEBRO+SagBJ4t0nPcz40k+JfMlWO7SvxBp7cy9P/imnH5Z03hsajw0WU0mj5IxyTgoNyCPJNA==
X-Received: by 2002:a05:6000:2204:b0:3a4:fc0a:33ca with SMTP id ffacd0b85a97d-3a558a926a5mr2258868f8f.4.1749647389545;
        Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53246b678sm15078061f8f.101.2025.06.11.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:09:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: stm32-ospi: clean up on error in probe()
Message-ID: <aEmAGTUzzKZlLe3K@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060951_869022_3FD0E2FD 
X-CRM114-Status: GOOD (  11.69  )
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

If reset_control_acquire() fails, then we can't return directly.
We need to do a little clean up first.

Fixes: cf2c3eceb757 ("spi: stm32-ospi: Make usage of reset_control_acquire/release() API")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index db6b1cfc970f..4ab7e86f4bd5 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -937,8 +937,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 		goto err_pm_enable;
 
 	ret = reset_control_acquire(ospi->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+	if (ret) {
+		dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+		goto err_pm_resume;
+	}
 
 	reset_control_assert(ospi->rstc);
 	udelay(2);
-- 
2.47.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB87C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 04:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YtX/Qf6NK/20sK/bOaui84KkOiA6Sp6G7U7L/FiPWA0=; b=m6A6Wm/ZLAx7Tfza74aDojVC4M
	5rub/2V5Ne2ofwpsp/AXlEXQBO77FfE60QfQZ9Kj+X9APi3afRls7IINivXSQr5dlU0XO1xntJOrf
	IflNwcVjraq+p2+ciZ8wUslF3qB+6AQEFk6R0rMg36lDAqYLi8xoF06g1LPTDpcpKdmCPbG0Vha9d
	tD73M8TNScLYe6adkayEJlFWoYXQPknyO0No/Jw/o3YyDgQitUHDXIc0Ad9Dt9LnLpWmbo9n+T5rH
	y2+sCBG4Q6XQn/xFMNzBUnaZiff4YpCqc+2ZYDNj+cJ9HiguFNycKI3AqsB3Rjh9Qi6D75YgERBTn
	QxEu8wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73NS-0000000AYAo-0eQu;
	Thu, 17 Sep 2026 04:05:38 +0000
Received: from mail-pj2-x26.google.com ([2607:f8b0:4864:39::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73NP-0000000AYAG-0hE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 04:05:36 +0000
Received: by mail-pj2-x26.google.com with SMTP id d9443c01a7336-2d747eb79f7so2808095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 21:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789617934; x=1790222734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtX/Qf6NK/20sK/bOaui84KkOiA6Sp6G7U7L/FiPWA0=;
        b=Ol3Rv0uyXWxekV6R6DL7UD47FH3LeRDXsMTmvXhyLZIdJYOYT8GahLfm887vLyVlcd
         LkqUHus0TQ1tdxS+++DNW7l6wdbVW7jgcyRpifjFL7z2ckdamh0jzjSmrz3ZYK6/4Vof
         Ys5nGJmt6M0hnVr1NKfdBPlJjbSnLNk9jb15LmV3BCbgnJYICQuSquksfZ8ZBNWBR9Sq
         e9rpQ9z75g4jmvR/3ArlRRy6OdyGL36UT1Xbfdihv/Qt/IBY2jZ5JPmeJ2rM4O95McUT
         THxDgemFzBylZSpgN5AM+1V99MxXoMZosucvwmXgvZYT3p8TiW23nkoL7EOwBWrJSZ/P
         b/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617934; x=1790222734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtX/Qf6NK/20sK/bOaui84KkOiA6Sp6G7U7L/FiPWA0=;
        b=IDIF6z0dgEacG6oBN0euq+yt1bTkCrqlJWsccC+crkd5f9Q+Rzs9kFRsD7FYAij3Qe
         WY2MZy21LTOOQCiy2CQfkOXY76ddk/GbnpgGqvDleCrrVePn3kEuybhC3cvrIDzHBmUO
         WYo6c4dBISvvt6Enu2PkwHYDF6HUlwXlLw0gZfd7bMBbvhGwr7qlk352NdhfM2fSgCpT
         nJzoN/AIN6ypagokPHmymJxIxYTYvmjtcL035gXf1qo2IsvYJuj2P7J5UPqQUFJx5+MW
         BIZ3VpowqpEMrbeosN0eADB1tB9RcKiuul1yNSAZ2hC3vOuc/JSq8WoqU9xHRmZ4YXlG
         4QwA==
X-Forwarded-Encrypted: i=1; AKwUvBwuI5dHcdmnQuuy5oWcEmGPUbsl2AtOi7POIpzrzMbvy5CMRVuUACN8Eqvz2ud/2eqF+vpGn9Il/L/x+LGIqtv1@lists.infradead.org
X-Gm-Message-State: AFuF++nex0MvkjhmrYuiGTIVrVGgmWvQH5Zx493NFvRXS9uKkPEgotVA
	2T0TOtei7skfofvzu+d0+7cxg+Wt7xfGCK3+vQU0LNLz89ZaRGXa+YU7szorEgzwSNk=
X-Gm-Gg: AYBFou1S3oVUJrZHHzAoKSzqDzWXbqKGYfxZk3BIhTkKb9+4jfrf5fxVhaK+Y4lpaTz
	LI+fl28kabPF6fQA+Y9dAFOblrkYa8I4e/mjO3xhf7nv5/KBR5KBkxuwnvPkJv+N9kZWVsYVdGd
	GCDB18MEPaXlSHwqsntPjgx03nYVZ4ogHD6HTm99sNlB74wlaSxsHON9WufkaF9GsDMyAjIHbSb
	hxqwta0rhG3IJ4FPyaVpoGRsfvndte2JnZfiNZiQgK9AyNtQ/ChIskY2NpNdqUL9U2BlsZaVmzu
	k/yL8z6F3mXyrK0TpsKy5Bxg6FP8QW5U/PvF53ykFJJOXerVUzwKtpgFiz6kGx4XJx1oxquIWFV
	tNm0APPP/Kznx0TVSWYoArzZTJAh0mgoM9KUsLlHavdoNAxCJirDxfzTwm8MmvJlRANSFf3le77
	DswQR+w9+v+Qm6H//EEP1XRGpj7qK+NahqXr0TNX4LvuZqPAC9+eQibuZOhbI6JHBMeFnIpRyQi
	swIAEylAG3QfGkThC4dfLOgWsYQGrEOkV86JQ==
X-Received: by 2002:a17:90b:4a51:b0:39d:ee20:1e28 with SMTP id 98e67ed59e1d1-39e1e510f73mr14802785a91.21.1789617934135;
        Wed, 16 Sep 2026 21:05:34 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cacce6sm10195833c88.1.2026.09.16.21.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:05:33 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
Date: Thu, 17 Sep 2026 04:05:09 +0000
Message-ID: <20260917040511.103232-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_210535_229104_15017874 
X-CRM114-Status: GOOD (  17.07  )
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

uniphier_uart_probe() enables priv->clk by hand and is then responsible
for disabling it again on every error path. It misses one: when
uart_read_port_properties() fails the function returns directly, leaving
the clock prepared and enabled. The neighbouring path, taken when
serial8250_register_8250_port() fails, does call clk_disable_unprepare(),
which shows the leak is an oversight rather than intent.

Rather than adding another manual unwind, switch to
devm_clk_get_enabled() so the clock is released by devres. That removes
the error path entirely, along with the explicit disables in the
register failure path and in uniphier_uart_remove().

The clock is still disabled and re-enabled by hand across system sleep,
which stays balanced: only SET_SYSTEM_SLEEP_PM_OPS is used, so the
device cannot be unbound while suspended and devres always sees an
enabled clock at detach.

Found by smatch:

  drivers/tty/serial/8250/8250_uniphier.c:232 uniphier_uart_probe() warn: 'priv->clk' from clk_prepare_enable() not released on lines: 205.

Fixes: 26e8349c0d76 ("serial: 8250_uniphier: Switch to use uart_read_port_properties()")
Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
Changes in v2:
- Use devm_clk_get_enabled() instead of adding a clk_disable_unprepare()
  to the failing path, as suggested in review. This also lets the
  explicit disables in the serial8250_register_8250_port() error path and
  in uniphier_uart_remove() go away.
- Reworded the commit message accordingly.

 drivers/tty/serial/8250/8250_uniphier.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index e3db60bf50c9..6fffac12277a 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -180,16 +180,12 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 
 	memset(&up, 0, sizeof(up));
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get clock\n");
+		dev_err(dev, "failed to get and enable clock\n");
 		return PTR_ERR(priv->clk);
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
-
 	up.port.uartclk = clk_get_rate(priv->clk);
 
 	spin_lock_init(&priv->atomic_write_lock);
@@ -222,7 +218,6 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	ret = serial8250_register_8250_port(&up);
 	if (ret < 0) {
 		dev_err(dev, "failed to register 8250 port\n");
-		clk_disable_unprepare(priv->clk);
 		return ret;
 	}
 	priv->line = ret;
@@ -237,7 +232,6 @@ static void uniphier_uart_remove(struct platform_device *pdev)
 	struct uniphier8250_priv *priv = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(priv->line);
-	clk_disable_unprepare(priv->clk);
 }
 
 static int __maybe_unused uniphier_uart_suspend(struct device *dev)
-- 
2.43.0



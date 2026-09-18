Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598DFC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SInoAck4kPSdZMq0ZJdvww+HIYJKSPW+Gpf9er2XW6E=; b=Khihk2D54+JNGoxK7VLxb1WTyi
	kY1+gFcbnT8QtRPHOLSgFkoaJcqf/3wRwo/erGI1L1tztnOA3y2VT3wILYuz6/N2+3eOxgr6QRUll
	+riBwZ7fc1S8KgljZm23z9nEEXRKhHu64zK/grbdB6gclqf1dg0mnDYBkL8UkoBmjWfLBW7CcaLnt
	2mMb2l8FzW3vUbQGi8gdT8kfMprXwaiW+/+2mxfQemqNpDML6eS+Wmz62pjFMeFK5qvpTDuKnmORv
	pFN4FZj8opgvSguhx5V0GoojQUmkOlM805YpJoc7CIrkDZyf0il1RcXlUOvxocmTPDXe/ALSCV0Ug
	ikuYdVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TIO-0000000DjDG-4Bru;
	Fri, 18 Sep 2026 07:46:09 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TIM-0000000DjCp-2S3x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:46:07 +0000
Received: by mail-pz2-x0f.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so166677a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789717565; x=1790322365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SInoAck4kPSdZMq0ZJdvww+HIYJKSPW+Gpf9er2XW6E=;
        b=WmK1BTBwvaS7JYzNkYCDPm7PqLeLEw2q1/6x3c7zbVZixYT/P1q5uLj6DD5PLHYTET
         RSHSrkxzC0Cwu67MV5+MUL5qdwZDeEKWa66aUo5LWLKw6eZclHCUU43p75ErvLwqYbJ/
         j6WWtuxvzPaPPkDBKXKuXQdSpXvvUFejVWdGXxjcyjnUwNTp39YxmaTtcFC8JvFqoNme
         emSAI2TvuItkxp7HatYIuACTiMd0FO0hliWf4LD6xDd1AsaR/iMquvV6rkRxc8CuTwGC
         8Yi3wcLNE85NRQCJCgNl69t7BQKRtYHl0/4SEgrdRAf+JLKJ79u64e86V9EmQ2DNbP9V
         xpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717565; x=1790322365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SInoAck4kPSdZMq0ZJdvww+HIYJKSPW+Gpf9er2XW6E=;
        b=xeVEBggCgLsyKfNKxP6hWsE1z0okHV27JAhzdA3Gp0DsFiQu6a8vF8Apbsuf0qxTEQ
         aLYCyNknBZ/OJ3bUWQrUJW7/ZdlzjOSDN4F43zoKXqMz8yLsMTIKtdUB4ubiPHK9bfph
         fEX0RgPJDuLQvKXQZmsq6a6UlIYBujVL+WaCP82wSoeVI1TERt93zbk6rB4chfyjh6zd
         wd8wol99DVV4A/orwqjxwy6dmZHmuQW9Ui5foxu8l3G64eynb777c72L3c57IqHTUBSV
         OSgBYU5/PKkTeedDh74iZ98xaoaMC+v0pjQDT20pLLlUI9U3rpiQ6buvbmga6DWOfhgG
         KfvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaIWp+VrStIxNJVHSaDH1HL+hDdBw+OiObya9bGp3Q8BP4ZDXiAmk0qM7wC3Q8VotFeRi+uyHcRUn5wPmn8wsd@lists.infradead.org
X-Gm-Message-State: AFuF++niC1YFylBvmQruOYzL8a8SK8JU9odXpDHGY+dt1kiTZExxN3Ha
	G4E7kjsRZXeQkyP0N85XERSoVrHUwRUxipk/gsIZ0PcLqFGP22ivgEw9
X-Gm-Gg: AYBFou2RrxYijIP1bvxJGF0Htcw9i0IsCJ8JrqCp66hMe4oyIFdtAYrf1ZusfCqiNgD
	60n4MbommVq4OAkrYzxr5LZa7CXOf/p6/T9YK4eew2kyjenPlDepqdaVIZXB6iNjEzeiEv9yHQK
	3fsaSMO8+5JmVg4VpAre7Ir79WlzL5y9PyseX5gpvwTzHEtO6mD54MhQR02DWVpzARX/EKFwyHf
	VGqARMDhv2SxpPlE2tNiuG0OzBAZwGiHkNgqJ5zqcDuYCnciJ7XRLO39hUbSeSCTEitNkpkpGjd
	clSVQRWTiUHUmPO4JTgJmLqylZMOJGtGAB9jtR7svCbNQdmSyCkJ7VWckIeQRMnovrFC61wemAA
	k9RLCuZ3wOvoP2NNjdEOo58Vaqf278Ja1ocUTnGQOhU3uAB/VDogwK7rJC+G1iBdh4+uRooPWqk
	U3+3ibEdjwAXA3uFqwBO/oYHdEEG2J2XUkSDComlAhRN+u9i8ZHnErT0JAnxplAe+CG0qYbIQFv
	gq8KebqR7eE8wwQo75e2wzd42jxbmvqpS681k4=
X-Received: by 2002:a05:6a20:6f9c:b0:3dd:85a8:cad2 with SMTP id adf61e73a8af0-3dd8c4b06b1mr3259004637.41.1789717564818;
        Fri, 18 Sep 2026 00:46:04 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2872052fsm2491833eec.11.2026.09.18.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:46:04 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH] serial: 8250_uniphier: Use dev_err_probe() in probe error paths
Date: Fri, 18 Sep 2026 07:45:46 +0000
Message-ID: <20260918074546.245342-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_004606_652170_66EB534F 
X-CRM114-Status: GOOD (  16.29  )
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

devm_clk_get_enabled() returns -EPROBE_DEFER while the clock provider is
not registered yet, and uniphier_uart_probe() reports that with
dev_err(). Every retry of an intermittently deferred probe therefore
prints "failed to get and enable clock" at error level, which is only
dmesg noise.

Use dev_err_probe() instead: it demotes -EPROBE_DEFER to dev_dbg() and
records the reason for /sys/kernel/debug/devices_deferred. Convert the
other two error messages in probe as well, so the whole function follows
the "return dev_err_probe()" pattern already used by other 8250 drivers
such as 8250_em.c. Those two codes are never -EPROBE_DEFER, so there the
conversion is a readability change only.

Errors other than a deferral are still logged at error level, now with
the error code added by the helper. No functional change otherwise.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
This is the follow-up cleanup suggested during review of

  [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()

and it applies on top of that patch: the clock hunk relies on its
context. That fix is not in tty-next as of today, so this one should be
applied after it.

 drivers/tty/serial/8250/8250_uniphier.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index 6fffac12277a..7d558b750f83 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -165,10 +165,8 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	int ret;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(dev, "failed to get memory resource\n");
-		return -EINVAL;
-	}
+	if (!regs)
+		return dev_err_probe(dev, -EINVAL, "failed to get memory resource\n");
 
 	membase = devm_ioremap(dev, regs->start, resource_size(regs));
 	if (!membase)
@@ -181,10 +179,9 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	memset(&up, 0, sizeof(up));
 
 	priv->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get and enable clock\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "failed to get and enable clock\n");
 
 	up.port.uartclk = clk_get_rate(priv->clk);
 
@@ -216,10 +213,9 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	up.dl_write = uniphier_serial_dl_write;
 
 	ret = serial8250_register_8250_port(&up);
-	if (ret < 0) {
-		dev_err(dev, "failed to register 8250 port\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to register 8250 port\n");
+
 	priv->line = ret;
 
 	platform_set_drvdata(pdev, priv);
-- 
2.43.0



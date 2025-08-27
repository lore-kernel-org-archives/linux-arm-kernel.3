Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AD3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT0DXhXRplrJw52i8Fj3GYlgwoA1mKFpUTHY07GBlv4=; b=u5Gurp6vJQ6xA8d3JJ8geBhdV/
	yL4zzu3NdYIHYZlLyGX3oRFLU0GUK2BFYUQoRD7Eg7rpT3EHIJDmAMKQHmCWcWboebw81n3TJPI6p
	QURRbTz4YCaM8g4bk3zSPomTk9NPPradrkjIMTqODFoyHdK5Tmx7222zGuvFFY3CzpdRRr/L7pgsG
	HJ4y3dF0puEe02f3lj9sq4vcZ7i9iTMPEJWJqUS9QTw24Zpirshj/xvNms+aG+RpjjPtHGXXIwS6n
	lKieKSCQtCy8JFzl5SdtmauJPOo4TTzh6kvojBYirI1+zrbhRcj+IX66TK4qobPZBBnqJa8MICGFO
	P3rX6MRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLn2-0000000GbtO-2c2d;
	Wed, 27 Aug 2025 19:26:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJj6-0000000GHYY-1GL5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:14:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so229895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756314863; x=1756919663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT0DXhXRplrJw52i8Fj3GYlgwoA1mKFpUTHY07GBlv4=;
        b=lderowIiwEE/B7PCNfgjAmAuAXnxbomy1xeY7oy+4EboECZtOFHVZSGD70/xVbsM6m
         l4x3iqrrKl6kefH1/CvbZK6928JDDUZ6RVm4DAkS4hb4mCz8LjptPwK8NGxd0bTHcuZD
         SY78u/ovYNS9BiuaDp0V0cAybUkYjf4n7ZpwSBWUdA8D68kxTOb9XNxE/WxIyk7QldeZ
         ttl+SwVDCfZS5uTayxB66DDz6fhb3g0wmOiFgqMwrYujegA85q8KByvgggZUyVfyqyJE
         AhUKUMJ1ZbI1unV+V8h5zzvBQLXJbQmqjZ1SNx4QO28WzAZjlzgqhGW9qUVjG8DO+CwX
         rmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314863; x=1756919663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT0DXhXRplrJw52i8Fj3GYlgwoA1mKFpUTHY07GBlv4=;
        b=KWaY4fGtDVN0PSQmnN+Jwz4+GDFVgSjFrEkrcn3RdqoEMAwsxTHX0qLz3AUWSv4/jk
         l+aHLbm4Mvrd6aQwxUB5sQ6pB2/9lh9nLPvpVLCPeJY8Ud0YhgUQGA9bsQT5E9zu7H4R
         ++Eo1EZIbNBXfUYvFbipDr1/8QKNl2kIUavLbr+ajIYx1vjV/Ej9irY0l2HKR9jipwn/
         TTjgIfe0kiJI2HYoQcVu+lh5ai1YJS0ebiFT5dHis7UwHu4pTnkLclGftSyeMvogwSUb
         QAcNZwtHGv+BnQB4fQ9SyM/lcp3hqWZ0ynOrEnRheRTerYOgBv5QCpbryj/Uu9uqzZh1
         Xwlw==
X-Forwarded-Encrypted: i=1; AJvYcCWKu08mvzCmQ/Tbwy12C55Oz0zgnU24NfWEF0VTkfZI5huwZcQHJRJcgaPxwWtW4CGuPBP1qx2hOw5jUdDcW6A3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5oMHpwrgTN6+6phUTLu0tu6BErLYhGeR/+h6CyEmlO/bT2X2E
	R4AWh5ajIfg60wJ8L75QteUo3eF9RbTpxV5JwlC3QcemiWZNSI+n7nYI
X-Gm-Gg: ASbGncvMQK78lt9LBQzz5miQV4u6on6YACWktwiaPwXPCfE3Y5VijbHNARxPxtQRsLc
	r3BDokb7D+D/pdlWN2yOgzP7/e1T5weFrKk/bN9/voQa7WTIlLGmIGTlxd5YZlWOEOf0xRoOWN1
	HClhIqTAPmbn43xLWAhRfg8unjCYvArmbQYzpYJehOymsxfwaUhmorwsVY7JzTgHTwhwwymrBJv
	qmtE8GroVzOkHd/9Wx62Jn1rxgw64iV1uoqItrrcXt8bA1I84sMfhyOLu0ttyUAJuVsJ1l6GyyN
	vecRisOGku2++Qibkjpeh8LjzVt3avGrx6izYwcVUDgc57crDG72Q4jBFNfaTr935MrCtb1zqGT
	odHa7Sl1NwXqh55cC1Umf1WVyrQpq+wdxgp77lrllGnCg5G2/0GE=
X-Google-Smtp-Source: AGHT+IGX8S2LLnbQSlxaUpZMAgFZh0mRyIm+QfdT71UA9bzgkN27ugYZRhxwwy0GRoAlORtkGkQV1w==
X-Received: by 2002:a05:600c:8b47:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-45b521ca71emr197311705e9.8.1756314862304;
        Wed, 27 Aug 2025 10:14:22 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c7113fdacfsm21272365f8f.35.2025.08.27.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:14:21 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 27 Aug 2025 19:13:58 +0200
Subject: [PATCH v3 1/2] i2c: pxa: defer reset on Armada 3700 when recovery
 is used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-i2c-pxa-fix-i2c-communication-v3-1-052c9b1966a2@gmail.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101424_347595_CCBAD68B 
X-CRM114-Status: GOOD (  32.04  )
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

The I2C communication is completely broken on the Armada 3700 platform
since commit 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery").

For example, on the Methode uDPU board, probing of the two onboard
temperature sensors fails ...

  [    7.271713] i2c i2c-0: using pinctrl states for GPIO recovery
  [    7.277503] i2c i2c-0:  PXA I2C adapter
  [    7.282199] i2c i2c-1: using pinctrl states for GPIO recovery
  [    7.288241] i2c i2c-1:  PXA I2C adapter
  [    7.292947] sfp sfp-eth1: Host maximum power 3.0W
  [    7.299614] sfp sfp-eth0: Host maximum power 3.0W
  [    7.308178] lm75 1-0048: supply vs not found, using dummy regulator
  [   32.489631] lm75 1-0048: probe with driver lm75 failed with error -121
  [   32.496833] lm75 1-0049: supply vs not found, using dummy regulator
  [   82.890614] lm75 1-0049: probe with driver lm75 failed with error -121

... and accessing the plugged-in SFP modules also does not work:

  [  511.298537] sfp sfp-eth1: please wait, module slow to respond
  [  536.488530] sfp sfp-eth0: please wait, module slow to respond
  ...
  [ 1065.688536] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
  [ 1090.888532] sfp sfp-eth0: failed to read EEPROM: -EREMOTEIO

After a discussion [1], there was an attempt to fix the problem by
reverting the offending change by commit 7b211c767121 ("Revert "i2c:
pxa: move to generic GPIO recovery""), but that only helped to fix
the issue in the 6.1.y stable tree. The reason behind the partial succes
is that there was another change in commit 20cb3fce4d60 ("i2c: Set i2c
pinctrl recovery info from it's device pinctrl") in the 6.3-rc1 cycle
which broke things further.

The cause of the problem is the same in case of both offending commits
mentioned above. Namely, the I2C core code changes the pinctrl state to
GPIO while running the recovery initialization code. Although the PXA
specific initialization also does this, but the key difference is that
it happens before the controller is getting enabled in i2c_pxa_reset(),
whereas in the case of the generic initialization it happens after that.

Change the code to reset the controller only before the first transfer
instead of before registering the controller. This ensures that the
controller is not enabled at the time when the generic recovery code
performs the pinctrl state changes, thus avoids the problem described
above.

As the result this change restores the original behaviour, which in
turn makes the I2C communication to work again as it can be seen from
the following log:

  [    7.363250] i2c i2c-0: using pinctrl states for GPIO recovery
  [    7.369041] i2c i2c-0:  PXA I2C adapter
  [    7.373673] i2c i2c-1: using pinctrl states for GPIO recovery
  [    7.379742] i2c i2c-1:  PXA I2C adapter
  [    7.384506] sfp sfp-eth1: Host maximum power 3.0W
  [    7.393013] sfp sfp-eth0: Host maximum power 3.0W
  [    7.399266] lm75 1-0048: supply vs not found, using dummy regulator
  [    7.407257] hwmon hwmon0: temp1_input not attached to any thermal zone
  [    7.413863] lm75 1-0048: hwmon0: sensor 'tmp75c'
  [    7.418746] lm75 1-0049: supply vs not found, using dummy regulator
  [    7.426371] hwmon hwmon1: temp1_input not attached to any thermal zone
  [    7.432972] lm75 1-0049: hwmon1: sensor 'tmp75c'
  [    7.755092] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
  [    7.764997] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
  [    7.785362] sfp sfp-eth0: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
  [    7.803426] hwmon hwmon2: temp1_input not attached to any thermal zone

Link: https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr #1

Cc: stable@vger.kernel.org # 6.3+
Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on tip of i2c/for-current
  - rework the patch and use a different approach which does not requires
    modification in the I2C core code and update commit description
    acccordingly
  - remove Imre's SoB tag, it should have been a Reviewed-by tag, but due
    to the rework this is an entirely different patch so that does not
    apply anyway
  - use Link tag for the URL of the referenced LKML thread
  - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com

Changes in v2:
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-2-e9097d09a015@gmail.com
---
 drivers/i2c/busses/i2c-pxa.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794dac3398a68d827c567aa5bb73ae3d7..70acf33e1d573231f84a1f09cffb376a8277351d 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -268,6 +268,7 @@ struct pxa_i2c {
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	*pinctrl_default;
 	struct pinctrl_state	*pinctrl_recovery;
+	bool			reset_before_xfer;
 };
 
 #define _IBMR(i2c)	((i2c)->reg_ibmr)
@@ -1144,6 +1145,11 @@ static int i2c_pxa_xfer(struct i2c_adapter *adap,
 {
 	struct pxa_i2c *i2c = adap->algo_data;
 
+	if (i2c->reset_before_xfer) {
+		i2c_pxa_reset(i2c);
+		i2c->reset_before_xfer = false;
+	}
+
 	return i2c_pxa_internal_xfer(i2c, msgs, num, i2c_pxa_do_xfer);
 }
 
@@ -1521,7 +1527,16 @@ static int i2c_pxa_probe(struct platform_device *dev)
 		}
 	}
 
-	i2c_pxa_reset(i2c);
+	/*
+	 * Skip reset on Armada 3700 when recovery is used to avoid
+	 * controller hang due to the pinctrl state changes done by
+	 * the generic recovery initialization code. The reset will
+	 * be performed later, prior to the first transfer.
+	 */
+	if (i2c_type == REGS_A3700 && i2c->adap.bus_recovery_info)
+		i2c->reset_before_xfer = true;
+	else
+		i2c_pxa_reset(i2c);
 
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0)

-- 
2.50.1



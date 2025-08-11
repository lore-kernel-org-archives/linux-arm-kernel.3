Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B52CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSipPKw7P4A06KCm7mnemasTOa9V0fPZ36VwYLVvIxg=; b=3Phndwz/ZFoMyUfP2hPzg7QaET
	uaVYUzABOopV6wl3E0oA8sWqbSzu9YSmEhRSbR6YduJIxaDPIpEkRB2PSfkwAp3NRRzIaKrvAJYjz
	87ZGmVd/Pe8inQn5izEQYmGidrwB2XIxOlBreuJhNvPaWQqQMmLop2oiFX9V+HWO+WV8gzbLEPAIo
	8Qy2TctkeeTOtucVhoEd+iCzBZeHmG9ctLFk6HbTjWxPDjxyvGlNsrix7B7XBf1GIw3csOCs8vZJq
	crine2YxJesBtl3zzLcNJpNZlN41jAIdQMeP6eUWKbtQXihkuPi0FbgCHHj5M8VT8AMI7v7qGURwZ
	sYcsRefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladD-00000009Dcs-1gij;
	Mon, 11 Aug 2025 22:04:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYX5-00000008yP9-1O2g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 19:50:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-459e72abdd2so28007195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941810; x=1755546610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSipPKw7P4A06KCm7mnemasTOa9V0fPZ36VwYLVvIxg=;
        b=ALV+jBKObyVO7qsXZQ1fRW8hejAJW9iYNoBUqTfl7x2x/jjT5zK7k8LbxPB6zaj+N1
         ZzcIm1kwe6MifXKibeP49QeMGKAHVSeKOZDkkBS5XLrLVEwI6wX4LdfK4bRh3aNFliot
         +Qh0uUjZ7mBEvJ93qw8mqK0msIwnzOUBcBrJTiZbQ1o+/qJHGGBmz9Bk2k4gHjZGp6uM
         titnlaRNuhjsI6WNcC2qoFIibIj4nhwU6X0UH6Gzsb/Ia3a2ewbOg5LJq9gPNWnocSab
         ByttiRuuJ9OdZpb5Nyfe+Nrbm7y0bFLuQVMkUxMqbMWP+Bev3/Wc2tnInJc9I44mEl5L
         t0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941810; x=1755546610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSipPKw7P4A06KCm7mnemasTOa9V0fPZ36VwYLVvIxg=;
        b=cMKX7dzAU3sxwL1qNrCRFpvhO/gGQqbbDJJfOQQFarOmG/4eCbbpty0Qz2tj8DSKmX
         dODarF3Aerbj2XXfJs092oJbms70tBUICqNG8E9ysVAqTB1y7CNCFGjQ8Hav3KYgXsZM
         wNGd9hhAiSE6u17QtsiBGwVbB6rYoiN7nNXtFrjv1abehlW3hkx3SQAhN3O4PhQ0jHng
         GnTVkrFtXsRfUz/biudzciv0hW800j6q1L5dswNy0NSNXhY5Llm+2MbGCCbo4rHNxApT
         KNjZ/m54Q01rF/Q78+3xtFkHq3u7E0wEeAtfoE23bE/A1lbZQgyuR8sNCSwJ+hR+dfno
         vyPA==
X-Forwarded-Encrypted: i=1; AJvYcCW4Ba3VI/FmcvI3MxKIIa4vXaK1u1TbBt35N0O9SetnLpKVl4NYgas2ObsavE2XHnCA14j2AfU4x6zPXYfDb6ou@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8HduesLAGR3Uw/MSg+AwjAPZq8DfXS6GkEP/lFNO10oYT9VzX
	ofqx10GeaYWE1Q0AbkHMJv3hoCvNPbGN5B2bAYLYlF9w0Wgn9cirByuV
X-Gm-Gg: ASbGncuzcgO7P4iXJWdtNRcwUOws4fqnkKIWbTkA1qTrwnhOdfaTQU/9td6E+3po/WM
	Xv/DtM1pVxTD1GQU7uWyUrQguAfJlCWb9l4p1ObUpfBBu6nySX+9alByrILr/3qzqc4kfNubd5y
	gt1mfP5hBP42aqra2/4P8Fho+oFXoPg+9nIKyY4se+jsp6/u/sf/FVvGcf9xpeNamcLkw/cJ27C
	k4hAvAmE2lpzxuXhqjnqyi27DMFtfDClQdtg3BDv2EYn5EfEVpiRK8r3RPxjFu7cip61KqNjaMk
	rqcFmNfRkyGVVJzLCkYugJukCY3Xm9Zhn5AcIdT1TOHJ8B2Lv4cy3XwuRI8VArsg91uoKDvpNwC
	Alq2ZSbcCG2Xqx3AWvJvtYtdF8OSmyciMiYdj7wrAKndOFyABhS7nxvhBA85lMg==
X-Google-Smtp-Source: AGHT+IEMvdMt76tULvaX1DNA9rP7wy9hsoqhDHvOI8Fp0uIBsF401YmUeXKvfshA/CBg6m/VRcfecA==
X-Received: by 2002:a05:6000:220f:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3b91100f094mr756349f8f.50.1754941809599;
        Mon, 11 Aug 2025 12:50:09 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:09 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 21:49:56 +0200
Subject: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
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
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_125011_379906_BF162342 
X-CRM114-Status: GOOD (  22.53  )
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
it happens before the conrtoller is getting enabled in i2c_pxa_reset(),
whereas in the case of the generic initialization it happens after that.

To resolve the problem, provide an empty init_recovery() callback
function thus preventing the I2C core to call the generic recovery
initialization code.

As the result this change restores the original behaviour, which in
turn makes the I2C communication to work again as it can be seen from
the following log:

  [    7.305277] i2c i2c-0:  PXA I2C adapter
  [    7.310198] i2c i2c-1:  PXA I2C adapter
  [    7.315012] sfp sfp-eth1: Host maximum power 3.0W
  [    7.324061] lm75 1-0048: supply vs not found, using dummy regulator
  [    7.331738] sfp sfp-eth0: Host maximum power 3.0W
  [    7.337000] hwmon hwmon0: temp1_input not attached to any thermal zone
  [    7.343593] lm75 1-0048: hwmon0: sensor 'tmp75c'
  [    7.348526] lm75 1-0049: supply vs not found, using dummy regulator
  [    7.356858] hwmon hwmon1: temp1_input not attached to any thermal zone
  [    7.363463] lm75 1-0049: hwmon1: sensor 'tmp75c'
  ...
  [    7.730315] sfp sfp-eth1: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
  [    7.840318] sfp sfp-eth0: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
  [    7.850083] mvneta d0030000.ethernet eth0: unsupported SFP module: no common interface modes
  [    7.990335] hwmon hwmon2: temp1_input not attached to any thermal zone

[1] https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr

Cc: stable@vger.kernel.org # 6.3+
Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
Changes in v2:
  - rebase and retest on tip of i2c/for-current
---
 drivers/i2c/busses/i2c-pxa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794dac3398a68d827c567aa5bb73ae3d7..f4cb36e22077753e21b0260df52b8bdbb85fa308 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1330,6 +1330,12 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 	i2c_pxa_enable(i2c);
 }
 
+static int i2c_pxa_init_recovery_cb(struct i2c_adapter *adap)
+{
+	/* We have initialized everything already, so nothing to do here. */
+	return 0;
+}
+
 static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 {
 	struct i2c_bus_recovery_info *bri = &i2c->recovery;
@@ -1398,6 +1404,7 @@ static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 		return 0;
 	}
 
+	bri->init_recovery = i2c_pxa_init_recovery_cb;
 	bri->prepare_recovery = i2c_pxa_prepare_recovery;
 	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
 	bri->recover_bus = i2c_generic_scl_recovery;

-- 
2.50.1



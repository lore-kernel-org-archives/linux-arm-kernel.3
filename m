Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1F1C61DDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zmCZgLjaf6WNAl4QcnYSjzIUbADts2hS5FwiTnomwBA=; b=OSpoY0mDyfrq/dbwWuJyvtI7SZ
	AfIqiQVvCILHnS3gBxIgclilk3cW8rOK3EPWWQYR+8boze9YtzBxp3X1FAaOzcs4OKvOL89YtvkxB
	eZU6xfHQAqrUA8FNgKQt3xM6pyosprPDH1kk9Fb4kXhA0/ofsT71ZDuXVYuF5Rx0Aj44UQ+1eexR5
	gW8O3hgoeTCKLSgRiTwmEWbaT8rrS6CZ+TtKzr9zjWlBEDUPVovvmfyao1BDr03JLGvS3ZYK29c/Q
	/lpPwdJQHl9CiQNxLC48VzJ2wzeJpIhIxWzFFY+8armGCw23/ZPru8OE30udkyJrkkFkvgNKB9083
	3y/xDvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtit1-0000000Fvcx-0cHv;
	Sat, 21 Feb 2026 09:02:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtisy-0000000Fvcd-0jH7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:02:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4806bf39419so28011485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771664566; x=1772269366; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmCZgLjaf6WNAl4QcnYSjzIUbADts2hS5FwiTnomwBA=;
        b=GTxifMo6Fk0L4DF+iTIeN5qXHoDE1+He4t+ZA1A6Lthp/8iQhI9UWdmOc57FWEvL7b
         +t3A3qAw3OCMu7TcTqedrkiQFSOn1dJJ4GRfZH5k4rV6Kz4M5iV+DhlUtMenfhRkRBRq
         Cby9iN5hFu/rng2RoCU3NfPWDPomubAaIOh1Fg8xKR2N283CRHGH92JwKmDl7eNjK68m
         w6H8vKxAkTUMVqRPV7lzvsITx/G2gJarbLAKJoprsij9Hq+3QztEdQrlrf8Xi8kGSxff
         wTHuvoV/KIKe3jdrkSmHUaODLFVIljHpwYc6/H2pmTxRc4ZRjqeSwFKqZ43/s2SKr2hE
         DLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664566; x=1772269366;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmCZgLjaf6WNAl4QcnYSjzIUbADts2hS5FwiTnomwBA=;
        b=trYLPtVCDXxPKqaCtM4zqOnugTf9hlEIQwgp3aNr5FsMWLhVjmyjbOkRpHGKIiTHhe
         dbovzCaZYBg2CWsfMqwSYxPXnRk2U+kP+xSIkGBLEv/YJmjXO/1oJqmkDxBz+xIMbEKh
         FT8EiI+Ip0KhsSyxfZLhUscI044eKerJMc7gA0c5p4PLKv+nErT3bD0dNlOdsw2auesj
         7b1QK1/a3Sgr7Oaq40SyRONF6TRmePj20QSjTyUN+vXaWM4jN23qVWtE5a9Dm2+nrwR+
         6LvuBHHKT5eGWw56b0J0dqU8tZLZQ2U/CureZcgw3Vwwc1fRoVjkQajwCtlvhEsEI/aY
         Omhw==
X-Forwarded-Encrypted: i=1; AJvYcCWV3Sc5pbsOIStRhCsAjXelM9AJc1rmV4lgEUGxsByGYZB12Am/E7dyFqBR41nsEdirF+9Z/ZiXtMq1SY7BQqx8@lists.infradead.org
X-Gm-Message-State: AOJu0YyXnDPdv6z4AArm865zxnVq+5ODBK9U1LXpHbfLQ9dygB9mGPSs
	25XCBMToCVuBO2Ln3LJ9nr0D7MpfjTHIBACojvTwag0TRXIgkUUCz8pW
X-Gm-Gg: AZuq6aIzuqb88FnIaudvez/QozJ3gjo1HTPbppwW5ETdh5VqCXPeY5fB+r26ADHo+KJ
	2xV6yE+cxcZqkjaCuBr4jv9L5RAANOdazkv2stkLpaGkJ8KuBHcvkrpm5p3bcP9Mqe5rqfdfUXT
	vGnJ29SI/4mDZDmvMyE/YhyVWeM8mdSklqD66JcBjhOqnXpN2sJS5oQC4wr+Ko6AHcqvTYwh2Ki
	IV8b0xvEuJ9W3jNlc5KZtF4VFduZnprlkc5f2QzLO6Tq5BsoK+YkG5W0w3lDVM1tp1sg7Z2OINM
	RM3pyyd4hmOQHWSdxYwn2qmKIvDzDq88SE/c6yu3YTIFkbB5OQm01bpmFMscrYk0ASqLF/Ba+DP
	+a8xAam6xio38c+dj88Tv07kElnHu/uHnhkUgz8ksDj6FK7egEBJmADsFClIWt9FJ12LE1qHSkb
	JklxGGC24oOZ2uCt5zBm+Cp1L5HmUEX/eyNaimIVmQw5pHXt4STEXZjw==
X-Received: by 2002:a05:600d:8445:20b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-4839fe96a24mr99827825e9.5.1771664566116;
        Sat, 21 Feb 2026 01:02:46 -0800 (PST)
Received: from [192.168.20.124] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a9b75b4dsm63146555e9.4.2026.02.21.01.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:02:45 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sat, 21 Feb 2026 10:02:37 +0100
Subject: [PATCH v2] usb: ehci-orion: remove optional PHY handling code
 remnants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-ehci-orion-drop-phy-handling-v2-1-5e26aa73790b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKx0mWkC/42NQQ6CMBBFr0Jm7Zh2VCKuuIdhgdPSTgK0aQ2RE
 O5u5QQu38/L+xtkm8RmeFQbJLtIljAXoFMF7PvZWRRTGEhRrYgUWs+CIRUNTQoRo1+xiGaU2aF
 pLqxv3JC6EpRETHaQz5F/doW95HdI6/G26N/6Z3jRqFHp/mWaQdd35tZNvYxnDhN0+75/AYvaa
 0XIAAAA
X-Change-ID: 20260220-ehci-orion-drop-phy-handling-d93c15c92042
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_010248_233186_811C6D47 
X-CRM114-Status: GOOD (  16.51  )
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

Since the USB core code handles the generic USB PHYs automatically, the
optional PHY handling code has been removed from the 'ehci-orion' driver
entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
initialization"). However, the devm_phy_optional_get() call has been kept
so the driver still gets the PHY even though it is not used for anything
in the driver.

Drop the remaining code, and also remove the 'phy' member of the
'orion_ehci_hcd' structure to simplify the code.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - add 'Acked-by' tag from Alan Stern
  - remove 'Fixes' tag
  - Link to v1: https://lore.kernel.org/r/20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com
---
 drivers/usb/host/ehci-orion.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 34abff8669f8bf096f4547b6ce0977eb130b3c8d..eaaa49712a8c64928771eb317165091480245d0f 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -12,7 +12,6 @@
 #include <linux/clk.h>
 #include <linux/platform_data/usb-ehci-orion.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/io.h>
@@ -60,7 +59,6 @@
 
 struct orion_ehci_hcd {
 	struct clk *clk;
-	struct phy *phy;
 };
 
 static struct hc_driver __read_mostly ehci_orion_hc_driver;
@@ -276,13 +274,6 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 			goto err_put_hcd;
 	}
 
-	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
-	if (IS_ERR(priv->phy)) {
-		err = PTR_ERR(priv->phy);
-		if (err != -ENOSYS)
-			goto err_dis_clk;
-	}
-
 	/*
 	 * (Re-)program MBUS remapping windows if we are asked to.
 	 */

---
base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
change-id: 20260220-ehci-orion-drop-phy-handling-d93c15c92042

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>



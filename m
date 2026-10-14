Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21599CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbM6G/cfBuexLxJw6Bstl+WC8ZXf72ew5u9fh5toXB8=; b=Y9uMv66DnnbzwwnAAn0yzXI60k
	wjEv9RPqp3+vJ5Kb/ZovbtwQtBCtUwwo0WvWQWUX3zkmkQtkqREWIiKKWX1ZkB2yRcmCkI6/TKrGq
	8+C7Mx5uOmjwi3pdzN/kZ2AwgYZhInHNKtPcgQOI+G+aI6SdyijDX8OGLbI01wvTOin7i+DuPOzHB
	negdw7CkGybxHDR88snPhsGR0WJzp6fQ/qKPZkryqlAsD8qCZGUb88/4WaqwB+n454A5lBCXcAyDS
	O0HxpxD1bNMnBlvTUnbwli89Dhirko7rFusmvYnDid4OVvAdnF1kjQKOjGP7Cgfy1KAgV86fFrzxP
	a4Dd7k9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtLP-0000000Ek0Z-13oX;
	Wed, 14 Oct 2026 07:24:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKY-0000000EjRH-3dSr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-486e8faff03so1599159f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962597; x=1792567397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbM6G/cfBuexLxJw6Bstl+WC8ZXf72ew5u9fh5toXB8=;
        b=rtAEdJo1mBOKocVXEf7c5zwUZtpgUmqP9dh4QIYISjgTMySWd71cAB0sGB4SZyxNis
         EdoOT4n2nWPMf4k03dJUkE6wVjwXTcorXAZ+ekkCldD2xyE2udrPUV0MXqaOjpD3avmp
         VAXOIvKCuuQAiCvZ0/tENN0Eil/cE7quCTzLhE7twpOeAAWXX7MoVoiY/o1HkIRwV/2F
         rQARQvGrKFH0R0n8YO4Jo+2ThssWK4NQzZ6U+jc1Knlcq2KU6qhWaEwsjuLDY+Xb4iFO
         KP8Dt58TWwhODQ2DPtR/yndOcMIzxsyy4UE+Ogb9NkfXAvBZrMIXd25DXtp4edUi8mCz
         CDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962597; x=1792567397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbM6G/cfBuexLxJw6Bstl+WC8ZXf72ew5u9fh5toXB8=;
        b=xlVcIPAd5jkBxpM3v/vllGQOVwx4SJPW1kH+Tu7A63q3cDT0vlYaj2K84jEoMIfGtH
         fbMYs4ZYly9EibnjVP6o0r2ObheTZyQw1dM9j4f9bKcySIR8GXeJPUep2VfrNYl+M0Kp
         knmygX7dajq2No/QQHCJPUa5tSNCGejmgC8w02mHjsgB/XXhSwebMCBYgzj1VYwXEiR0
         0rxTkaJWVxXVlmcr7wtgZQAoy09q5PM5zRphBALbrp5Whbr73SF20QC1sTgm0AD0fKlr
         dqUCUUxawkNCSD3HR6B1kZ2fIEz9AHbWcpJoxQnmnO358w4XLV8MMbh+nKmfGNi7lUgP
         kE/w==
X-Gm-Message-State: AFq9FYL6qJYPHooVYPfnDa2aXoGlaLcotaAJue94HOJ9y5XA1jWNfWX3
	YyJaSCZ36/4Kh9EWpp5s3gz/Odr6bb5zsoVxvie6sXFg2d5+7EBlVwxwklPsxGWlNvFAtw==
X-Gm-Gg: AYBFou39jiDhKLaFurz/PoOh6hZNsCcxvNRbKrXAtF9mJCL05uYOC4rDT7xho/qWM91
	7OeTxSmI7f6nBmy2uLg89ST6Sc27k6RjC2s36S4MZqcF3V/4dExnRhFzlCuo3gY3RF3Zyyz+WoP
	tJj7uYEloYdBsptMKwKzcgIRR3BsdQIXY/5NFTwOI04FF7rjWMXqAf7TKA+rtRifrqgdYS9rId8
	byLY2dm8g4qynALzZCNu0YP/hRRjMXAdT+vlxxfZGPgwI3msphCFvr+jpqJtYb8bDa+Lx/wNZDp
	98A1GUPsdx+fs4FYKjeANO5N1KiGyIRd0pGDRoi7OshdFIFl8hxFcBToiIBFvR643GmPQARiy4M
	FTQhp2V1bh5P7LnOHKKb315OmDdAQHY2QJNa2jasL1nUT9ryxFoGNC0Igqu7oaOnGKmXSu7ztNu
	zRt7ZfTMHGOhMttAVXMUBI4xE5LjJ2U/nx4+5G3yULv3kjPejPXeZCQDyA+is5RneuxlkxBu4kz
	xkJkn4XvwDzKQea+jpXR8QLT3Gx9wQjYSyi97G7Qf/F1m2e90kIwHO/rMRfE6y5wuvK0ju9qmju
	niaaFhB1VMZKM0UMxHRZLrY8WBx1ha1PqgXOycuMEokh4BDQD+MRUX+uUYUMlA==
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr296042805e9.11.1791962597174;
        Wed, 14 Oct 2026 00:23:17 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:16 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Wed, 14 Oct 2026 08:21:02 +0100
Message-ID: <20261014072109.1759502-23-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002322_569950_34F255DB 
X-CRM114-Status: GOOD (  13.77  )
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

Use the generic DWC3 platform integration to enable clocks and release
resets. ZX279128S is an always-on networking gateway SoC without
system low-power sleep/suspend states, and the suspend clock is an APB
clock gating input handled alongside core clocks, making the generic
platform glue sufficient.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/usb/dwc3/Kconfig             | 2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a4..dd0f6d25dd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -207,7 +207,7 @@ config USB_DWC3_GENERIC_PLAT
 	default USB_DWC3
 	help
 	  Support USB3 functionality in simple SoC integrations.
-	  Currently supports SpacemiT DWC USB3. Platforms using
+	  Currently supports SpacemiT and ZTE zx279128s DWC USB3. Platforms using
 	  dwc3-of-simple can easily switch to dwc3-generic by flattening
 	  the dwc3 child node in the device tree.
 	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb0..aa838cf067 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "zte,zx279128s-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.55.0



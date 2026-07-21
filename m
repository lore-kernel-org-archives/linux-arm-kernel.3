Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A082C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XNgGUgLDxikpwQAtd9a8q8cPJ0Sn1o/cujVuEUBlzWc=; b=2a9U/lXpq5N53n6UBgFqrk43J0
	nPzJP0my4p1mJ2d8BZfXVVspIQQLOqD/xFJWvIK9u5JiVHCR7WQpwBRmUfHkhaojHBYb4h29WxWEa
	jqUqnJvK3AShApwdK1DRA1Zkh8eCKo8p3gyqb4Qa5Aw5OJK27s1LiZJh6WXOw3fdhG1vX3CEaUhJQ
	/n8RjvJwgXZfENYfn5P2RPx1lgxQ5cimfiRIMWmCeV+zNZ9T3kV5h0qvpVfDMPbzBpbiqK/dvR3OK
	E9uucpDlD9scz1x5oSz6+GCiRq4Y2K/yExZ0VZKRTUojwDSM3m3Uh4ncMrmfPllmnDVspvLCz3JVq
	yW7xHiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8Gp-00000009H5Y-1Lei;
	Tue, 21 Jul 2026 11:04:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8Gn-00000009H58-1LwZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 11:04:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso84093015ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784631856; x=1785236656; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XNgGUgLDxikpwQAtd9a8q8cPJ0Sn1o/cujVuEUBlzWc=;
        b=TgzMYuzqxOhmAxFCKa53SvG3iiJViStxTwTu+hNSvy85UnBCMbRIlFES1i9Oe/qMC1
         ITCo3XWnzJ8uxMs0lVOVrkMOzd6Iks9AZxdMvY1XuWAO5a54L+kyf2ZcFI/rBbuQeTnl
         7Piycb488YWJ+46inHRVqweAtpiRXkBmTJ4/D0poGsd7zMXsChEzHI6MuIwNe2KugxwE
         2ou7kdahm+f8TQe1PtiLHh7JM9yoWMsesVAfnzKP2EtHTY8JjAA3AmF2cvFW2xkmGmku
         qHpNCeIcxMMJ+1cnoxiDdLsaTCXDRk2gJ7HyyeMOdahK/PYtqahpvqlfyUi0mb3zjVyc
         fp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784631856; x=1785236656;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XNgGUgLDxikpwQAtd9a8q8cPJ0Sn1o/cujVuEUBlzWc=;
        b=jjKcfnbcFA89kDDXGsZVDN3YfIEnsb4pHF0ezuTwjxvkBhATvcKwsHrmOwkEpO+f+z
         TrsPTeBwPqgw0W7Es9HLs0cmRFeZ9uvbNLdOi+jhb9bvVlTEr+v9YgEk/B0MbYkazqWF
         hc2z45K9NxI9U4M57Wv4UbmMu16xUWrD75zrsszsNpoeck5ZTZ/sCEy3vnJC89Wlg/Du
         bJs01ehBx7p3Q2iyX1gMuYCXH43Wp1VsoEM/z3V9c2j5Yy2jimmci2X6lCWaJXj0WEAm
         sttNzE5liAOuAK7ZCUmYoopKsrkucTXHufEfrUGXmdaxObYynglUq6Fcft+4T+vOwyzK
         sy0A==
X-Forwarded-Encrypted: i=1; AHgh+RrGS4FNgYHPX9OXRusq7+2kmu2A6zEWiyfIVfap/mXdRA2rJY05ksGHtR1HnCTFfypJ9ePCNa9WqwyDbOtfupH/@lists.infradead.org
X-Gm-Message-State: AOJu0YwgmH0MbfvXOOu8Ylpot9qniLwdDp49bsIPaddq+eM8On79JwK+
	/dO64f969rzXMNL/In0J1CinkptDSXBFzKAddIqBLr9KXp2bZeuAREpa
X-Gm-Gg: AR+sD10RgRpvuybZvpULNlZy8nonnq47T9VkgUc1AK5ZVFoGVAWfPifex/crAyNumf/
	IFD62XcBt7FK9saXk77Qr0FmxRT8W2es72LJhkCYpSeSB1JnHzikkc9ynzqf+iEAWpO5mWEKC+T
	W344wixTqCBoQK5ygbJmNIGiUXCF3V/5dU5GbhpzcK40XwH8Sm+bUxBhekLjgh4widchkJv+MLj
	po+2Orx9ZAcdpKcNkMnyibXXrTF9ghJrMBd1g0GsBcOzMFm2q4znVZ7EmvZgDaNWS4ZXxouR6sG
	oYUSllWujcU1PpDiZix7j3cPZDT4onu2HIVrjhK9zDS9QxRaFDzqLf35XRo5UHu/xmWZJwppa1Z
	4I/44EciVxzxKhJ12RvjJF+Wh7uk4NybtLhsLKd0fPbO4SuvaDYT2VA7G6futm385imJloPiril
	QAENXaoOgmmUQylqHhavoqR78Y2BCbXCFoTl0996x9XAnE
X-Received: by 2002:a17:902:fc8e:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cf349cc532mr198004405ad.32.1784631855821;
        Tue, 21 Jul 2026 04:04:15 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3474d305sm72786705ad.72.2026.07.21.04.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:04:15 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 21 Jul 2026 19:01:59 +0800
Subject: [PATCH] ARM: dts: aspeed: sanmiguel: Fix FIO IOEXP interrupt pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-upstream-sanmiguel-fix-fio-ioexp-intr-v1-1-8245ae0ca590@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKZRX2oC/yWNywrCMBBFf6XM2oEkvoq/Ii7SOK0jNgkziRRK/
 92oi7s4cDlnBSVhUrh0Kwi9WTnFBnbXQXj4OBHyvTE4407m7CzWrEXIz6g+zjxVeuHIS1tCTrR
 k5FgE7dj3JviDPe4HaK4s1F6/zvX2Z63Dk0L5ymHbPs7MizKJAAAA
X-Change-ID: 20260721-upstream-sanmiguel-fix-fio-ioexp-intr-1f880ca4153b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784631851; l=1256;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ZreoL/eVPuxj1oFb8/Qv2Bu+o3zQrHOp7wcZG/PkziY=;
 b=ojdm2efXwuf3QR3Gotk4btNOvBBhEIendW+qye+msS8NzhLD/ZFY6O23pbkZ1cIBBArxCA358
 7PntNXICI09CwO2hXZ8mKVYo8qzOH5Y2iXsiLLMWF5Wy7Tx7oAEFEO5
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_040417_372311_B1728EC6 
X-CRM114-Status: GOOD (  11.90  )
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

The interrupt properties for fio_ioexp (pca9555 on i2c14) were incorrectly
configured to gpio1 with ASPEED_GPIO(B, 6).

Update the interrupt-parent to gpio0 and the interrupt pin to
ASPEED_GPIO(C, 6) according to the hardware specification.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index d7ed497d7227..cb07c3615279 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -578,8 +578,8 @@ fio_ioexp: gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(C, 6) IRQ_TYPE_LEVEL_LOW>;
 
 		gpio-line-names =
 			"", "", "", "",

---
base-commit: adcf44809e1da6f462927203b008e4cdb2ee1b34
change-id: 20260721-upstream-sanmiguel-fix-fio-ioexp-intr-1f880ca4153b

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>



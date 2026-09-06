Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A9AC79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 04:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cQv+gwRX7Z+DTbRSq5jeq2W2+DL4A8UrN+ZaQRvPPtM=; b=LSXIBH0gH5JwGDfD+imYTaJmby
	bxl0fhDvt/tkGfyqw0q6r5QVUUoXVHnfN43+oJYwn8oheKDoDS4wjnHrzjU0R12lw9DZmLH0XnUss
	INpCskj3mOVE77ePfm/5XZInEEIJ8iqYBhft3kYDS/EKNoACXJOsulRAsrD4eRPHDhugfClTSPbhY
	QQFgACTcgQTS4RGqeX4QhU5+imZqDSQM5uf8jTRLUPbsF/RNl3eut/d4AZ24VJJWmA091IwugJSn2
	T+E0NKw7Nc7chbwi2GLf1Q1ejZwo7C4nuQ+8PLnKb/Sx6WwtdULuPV5hIUaqF6vt+s/Ll4WyUQ/Wn
	TxnKnLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3457-00000004f9U-39eR;
	Sun, 06 Sep 2026 04:02:13 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3454-00000004f8y-34PI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 04:02:12 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2d561173f9fso14196595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 21:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788667329; x=1789272129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQv+gwRX7Z+DTbRSq5jeq2W2+DL4A8UrN+ZaQRvPPtM=;
        b=mWZenVE56WGz+wgJJog6O3Luz5oVQzP2P5anAVFi+GG9FoNaLrQg7pAAOQaTZPSm7N
         iaRjdN3juFukno3OBO2kAbFzb3ldx3NAm2zAtbOJ8xYT/Y0eKor5FuYiTVwVUmmxZuw6
         oPZqQ+zhu5Wp00Iwd/KMSnFsXrBhgeLIXjPK70l3p222+dkkckkcbN+C+wd7jl7GSe33
         0fQA+Y18kao2e0yqHriAIqnafWbsuJaO2oWvC6ozB6+bkx0LWKMB9FA5dhASxi4enNBo
         v+WUlS4bX8y8d3/7JNGvZo/HHlV6lNtD5s34sYKqQtF0uk27V/BIEx75Svi0JYriI0n0
         FJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788667329; x=1789272129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQv+gwRX7Z+DTbRSq5jeq2W2+DL4A8UrN+ZaQRvPPtM=;
        b=bnlBAfMonRl26ULpod8Riv9OoR6El5xWD0O3l9+h+w/FcR0GLRo76D2HBDrciDObPH
         5GFNGAIH8PCZrtr3lwyurDVxd6gWhNJeFcOuBFh+MH4SEnwCJaxsCqEHW9TKkKrErJwT
         H2KRs3/Pnt6gBQvlzL4Raumv0IJqdgG5e8iKNJx+7nstvCzR+vJi+lPHJieYTqUv8rzC
         kp1izD0K8wkcMUzgVe325UAzc5U0rIPfhjD99q2mc9KHX3jj/B+zbMhX7HU99el79Hs9
         dKATk0gToJ6g7EJM4sMinYtf3wmXfapKQqW9COPnIMTr0bEXX+Bx+sScthqo/o9lT+40
         elgw==
X-Forwarded-Encrypted: i=1; AKwUvBx9HMfW1ceo9tm/18Bb5tsBgOo94359Hm+t6b/Ql8eDc45xCJ0oom/xnaHhlrJ1KGeabXQlSclOKxvINeQs+7ys@lists.infradead.org
X-Gm-Message-State: AFuF++nh+5G8q+XDlS4Z7vrtPoVDy+ZPhbx324NMzvxRhDE9w0yxr7QY
	xwwCwGQf1a4grR80uGoHxUap5kZgYRLPHFMnABV0DfLckfwIItBz3WKF
X-Gm-Gg: AYBFou3oW3jplSLXx3bv/o6+Kw+h0VI8gnPqgLZhVYmxVSmqI8o4bD1jU/SO4h04moX
	a+2ZASEsAnMa+A4lAPPAFMm+Ujfp9Ckdawpzc+YzcOwET1xHuCvkuIxPMDW+RFbyraQIzig+/M/
	418HExrTzrL1WusMXm7KtJ5jzsWCzvQOeHBsB710yJ9LrLjxeILwnPEoI4ip54wmTGs5nSi9Cdd
	AfybEuAIuSyiJWnt4XhBmXgNok8uKhRr3l8m6MrLlL1UTiu3cutKRK8dT7ms1YAy7MDdMVtjzyb
	vz2RPl/IdbxYrxqotxh4lMNJ6T4RjAgcI60ElhxrACwlr3YJjO0HCmFzJ/FR4k6zTTY2FM730I4
	WJCWhiIrbcEO7CVoYt87YBsOYWVOC0WcRXbZZrvc4iMxNz1/9eD5G2p6R42kkJZGPyHR4u3wwJN
	MqYv4xTpTcR8Tviujk9ekzyIplpmD4S5+dr369bruYVySzQ4/GvBW1xRQ4Ji5PHtZRYTU71uwQh
	4+YiTaliimaSl88G6vjlLoHorzqZatESE/XsD/K8ga0aSwq2B31d3xwrPX/fsDZdhlAXoz0Uwov
	5RtiOGmot2SM0FrH+aw1vMRy/RflKtTy8F43PwqXIv5jtq28oHBGXPE=
X-Received: by 2002:a17:903:9cf:b0:2d8:d4d1:313a with SMTP id d9443c01a7336-2db12634535mr249979245ad.17.1788667329144;
        Sat, 05 Sep 2026 21:02:09 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm17127334eec.10.2026.09.05.21.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 21:02:08 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Kees Cook <kees@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] ecard: use module_driver() to avoid repeated boilerplate code
Date: Sat,  5 Sep 2026 21:01:46 -0700
Message-ID: <20260906040153.105692-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_210210_782098_72626BD0 
X-CRM114-Status: GOOD (  11.25  )
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

Many Acorn expansion card drivers have module_init and module_exit
functions that only call ecard_register_driver() and
ecard_remove_driver(). The module_driver() macro automatically
generates these functions given the register and unregister functions.
Switch to it to simplify the code.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/ata/pata_icside.c            | 13 +------------
 drivers/net/ethernet/i825xx/ether1.c | 13 +------------
 drivers/net/ethernet/seeq/ether3.c   | 13 +------------
 drivers/scsi/arm/acornscsi.c         | 13 +------------
 drivers/scsi/arm/arxescsi.c          | 14 +-------------
 drivers/scsi/arm/cumana_1.c          | 13 +------------
 drivers/scsi/arm/cumana_2.c          | 13 +------------
 drivers/scsi/arm/eesox.c             | 13 +------------
 drivers/scsi/arm/oak.c               | 14 +-------------
 drivers/scsi/arm/powertec.c          | 13 +------------
 drivers/tty/serial/8250/8250_acorn.c | 13 +------------
 11 files changed, 11 insertions(+), 134 deletions(-)

diff --git a/drivers/ata/pata_icside.c b/drivers/ata/pata_icside.c
index 70f056e47e6b..df7203a74f45 100644
--- a/drivers/ata/pata_icside.c
+++ b/drivers/ata/pata_icside.c
@@ -613,19 +613,8 @@ static struct ecard_driver pata_icside_driver = {
 	},
 };
 
-static int __init pata_icside_init(void)
-{
-	return ecard_register_driver(&pata_icside_driver);
-}
-
-static void __exit pata_icside_exit(void)
-{
-	ecard_remove_driver(&pata_icside_driver);
-}
+module_driver(pata_icside_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Russell King <rmk@arm.linux.org.uk>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ICS PATA driver");
-
-module_init(pata_icside_init);
-module_exit(pata_icside_exit);
diff --git a/drivers/net/ethernet/i825xx/ether1.c b/drivers/net/ethernet/i825xx/ether1.c
index 3e7d7c4bafdc..d21aeb831531 100644
--- a/drivers/net/ethernet/i825xx/ether1.c
+++ b/drivers/net/ethernet/i825xx/ether1.c
@@ -1070,17 +1070,6 @@ static struct ecard_driver ether1_driver = {
 	},
 };
 
-static int __init ether1_init(void)
-{
-	return ecard_register_driver(&ether1_driver);
-}
-
-static void __exit ether1_exit(void)
-{
-	ecard_remove_driver(&ether1_driver);
-}
-
-module_init(ether1_init);
-module_exit(ether1_exit);
+module_driver(ether1_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/seeq/ether3.c b/drivers/net/ethernet/seeq/ether3.c
index 20dad39b5ab9..b0d2cbc35914 100644
--- a/drivers/net/ethernet/seeq/ether3.c
+++ b/drivers/net/ethernet/seeq/ether3.c
@@ -882,17 +882,6 @@ static struct ecard_driver ether3_driver = {
 	},
 };
 
-static int __init ether3_init(void)
-{
-	return ecard_register_driver(&ether3_driver);
-}
-
-static void __exit ether3_exit(void)
-{
-	ecard_remove_driver(&ether3_driver);
-}
-
-module_init(ether3_init);
-module_exit(ether3_exit);
+module_driver(ether3_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/scsi/arm/acornscsi.c b/drivers/scsi/arm/acornscsi.c
index 79d7d7336b6a..8b899fbf092e 100644
--- a/drivers/scsi/arm/acornscsi.c
+++ b/drivers/scsi/arm/acornscsi.c
@@ -2902,18 +2902,7 @@ static struct ecard_driver acornscsi_driver = {
 	},
 };
 
-static int __init acornscsi_init(void)
-{
-	return ecard_register_driver(&acornscsi_driver);
-}
-
-static void __exit acornscsi_exit(void)
-{
-	ecard_remove_driver(&acornscsi_driver);
-}
-
-module_init(acornscsi_init);
-module_exit(acornscsi_exit);
+module_driver(acornscsi_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("AcornSCSI driver");
diff --git a/drivers/scsi/arm/arxescsi.c b/drivers/scsi/arm/arxescsi.c
index 925d0bd68aa5..2d3f5b0519d1 100644
--- a/drivers/scsi/arm/arxescsi.c
+++ b/drivers/scsi/arm/arxescsi.c
@@ -344,20 +344,8 @@ static struct ecard_driver arxescsi_driver = {
 	},
 };
 
-static int __init init_arxe_scsi_driver(void)
-{
-	return ecard_register_driver(&arxescsi_driver);
-}
-
-static void __exit exit_arxe_scsi_driver(void)
-{
-	ecard_remove_driver(&arxescsi_driver);
-}
-
-module_init(init_arxe_scsi_driver);
-module_exit(exit_arxe_scsi_driver);
+module_driver(arxescsi_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Stefan Hanske");
 MODULE_DESCRIPTION("ARXESCSI driver for Acorn machines");
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/scsi/arm/cumana_1.c b/drivers/scsi/arm/cumana_1.c
index d1a2a22ffe8c..62c11168f321 100644
--- a/drivers/scsi/arm/cumana_1.c
+++ b/drivers/scsi/arm/cumana_1.c
@@ -324,18 +324,7 @@ static struct ecard_driver cumanascsi1_driver = {
 	},
 };
 
-static int __init cumanascsi_init(void)
-{
-	return ecard_register_driver(&cumanascsi1_driver);
-}
-
-static void __exit cumanascsi_exit(void)
-{
-	ecard_remove_driver(&cumanascsi1_driver);
-}
-
-module_init(cumanascsi_init);
-module_exit(cumanascsi_exit);
+module_driver(cumanascsi1_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_DESCRIPTION("Cumana SCSI-1 driver for Acorn machines");
 MODULE_LICENSE("GPL");
diff --git a/drivers/scsi/arm/cumana_2.c b/drivers/scsi/arm/cumana_2.c
index e460068f6834..24945e1765ae 100644
--- a/drivers/scsi/arm/cumana_2.c
+++ b/drivers/scsi/arm/cumana_2.c
@@ -504,18 +504,7 @@ static struct ecard_driver cumanascsi2_driver = {
 	},
 };
 
-static int __init cumanascsi2_init(void)
-{
-	return ecard_register_driver(&cumanascsi2_driver);
-}
-
-static void __exit cumanascsi2_exit(void)
-{
-	ecard_remove_driver(&cumanascsi2_driver);
-}
-
-module_init(cumanascsi2_init);
-module_exit(cumanascsi2_exit);
+module_driver(cumanascsi2_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("Cumana SCSI-2 driver for Acorn machines");
diff --git a/drivers/scsi/arm/eesox.c b/drivers/scsi/arm/eesox.c
index 99be9da8757f..823ad179f24c 100644
--- a/drivers/scsi/arm/eesox.c
+++ b/drivers/scsi/arm/eesox.c
@@ -626,18 +626,7 @@ static struct ecard_driver eesoxscsi_driver = {
 	},
 };
 
-static int __init eesox_init(void)
-{
-	return ecard_register_driver(&eesoxscsi_driver);
-}
-
-static void __exit eesox_exit(void)
-{
-	ecard_remove_driver(&eesoxscsi_driver);
-}
-
-module_init(eesox_init);
-module_exit(eesox_exit);
+module_driver(eesoxscsi_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("EESOX 'Fast' SCSI driver for Acorn machines");
diff --git a/drivers/scsi/arm/oak.c b/drivers/scsi/arm/oak.c
index d69245007096..aea21bb13355 100644
--- a/drivers/scsi/arm/oak.c
+++ b/drivers/scsi/arm/oak.c
@@ -194,20 +194,8 @@ static struct ecard_driver oakscsi_driver = {
 	},
 };
 
-static int __init oakscsi_init(void)
-{
-	return ecard_register_driver(&oakscsi_driver);
-}
-
-static void __exit oakscsi_exit(void)
-{
-	ecard_remove_driver(&oakscsi_driver);
-}
-
-module_init(oakscsi_init);
-module_exit(oakscsi_exit);
+module_driver(oakscsi_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("Oak SCSI driver");
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/scsi/arm/powertec.c b/drivers/scsi/arm/powertec.c
index 823c65ff6c12..67f071a0543b 100644
--- a/drivers/scsi/arm/powertec.c
+++ b/drivers/scsi/arm/powertec.c
@@ -432,18 +432,7 @@ static struct ecard_driver powertecscsi_driver = {
 	},
 };
 
-static int __init powertecscsi_init(void)
-{
-	return ecard_register_driver(&powertecscsi_driver);
-}
-
-static void __exit powertecscsi_exit(void)
-{
-	ecard_remove_driver(&powertecscsi_driver);
-}
-
-module_init(powertecscsi_init);
-module_exit(powertecscsi_exit);
+module_driver(powertecscsi_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("Powertec SCSI driver");
diff --git a/drivers/tty/serial/8250/8250_acorn.c b/drivers/tty/serial/8250/8250_acorn.c
index fb596262b9c7..f634de6e159f 100644
--- a/drivers/tty/serial/8250/8250_acorn.c
+++ b/drivers/tty/serial/8250/8250_acorn.c
@@ -120,19 +120,8 @@ static struct ecard_driver serial_card_driver = {
 	},
 };
 
-static int __init serial_card_init(void)
-{
-	return ecard_register_driver(&serial_card_driver);
-}
-
-static void __exit serial_card_exit(void)
-{
-	ecard_remove_driver(&serial_card_driver);
-}
+module_driver(serial_card_driver, ecard_register_driver, ecard_remove_driver);
 
 MODULE_AUTHOR("Russell King");
 MODULE_DESCRIPTION("Acorn 8250-compatible serial port expansion card driver");
 MODULE_LICENSE("GPL");
-
-module_init(serial_card_init);
-module_exit(serial_card_exit);
-- 
2.43.0



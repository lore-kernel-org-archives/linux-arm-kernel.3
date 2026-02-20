Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD92C55184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CGoxHfyZdvHZdaOxZRPHjFZrmxUcjr01IQroUI8SPoo=; b=BnJuUyi9pxIhwBYE+jxgm3qrfS
	np0dlsUOAKiRiXx2TF7eA7qGvKp03D2vSkmAzuUpsPUHBgR2k62YbCCBOymoRF18quj6ALRLPrv16
	tbEu8SmVcqWmzmv36FS2wYutM0ykdc9EOzif9KMY/mV+NItxliMdjEq5GwlkKFUVa+UmZMp9d575/
	lgtDmJd7/9qaGAsXURUZGGR8b9ygzWrmHDTPicf6xDuVbpL0BUjYfcUK7R6u69WsZDZ2kEfDPPEp4
	CqR20NM9QuxMqSmTU3+tBWpWeAI8EG2bCwVUTJWYo423jmQf8onw3fyH4Gyab2UYN5b3tIA4aJ6Od
	eD9uPSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNMe-0000000Dnfx-1rP9;
	Fri, 20 Feb 2026 10:04:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNMb-0000000Dncm-2jXd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 10:03:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-435f177a8f7so1792141f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771581835; x=1772186635; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGoxHfyZdvHZdaOxZRPHjFZrmxUcjr01IQroUI8SPoo=;
        b=LwLxzD3xOFiP1XE8s1N6Ybm9X0vQUBA619O/E+NdgNC/Rs8QyxfEh3AZ/VHnlSrsDU
         OUgXjFaSmdyA2ub6+xHFzP4rAwo3BTSHOXWDxArb9FaUykmqfOxQmoSokXKChMp4+cDH
         SW6Bz2Qs3k6Allj3+wdC5sMFddBNjM4T7WPFG1qiRUTlCb0E6SX7Ntac+6eZT8TNP49A
         /z+cf4xhkKg7B8MHTYRSddcWvB/fTQxWW5CIQZ0hKQm6thf+VJXK5bsb3hfxAeGu9irQ
         HHPPXV9mRndli35270ViqKtacgnou0MwJoCF9K0bmzLpW3mLWQ3aZjNJU0y2lueZ1SZk
         v+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581835; x=1772186635;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGoxHfyZdvHZdaOxZRPHjFZrmxUcjr01IQroUI8SPoo=;
        b=P30TqXbjtRgQqxZHRlb8FKvUJ1UZSS82FrwnFXRCjYlODeFkVtzZ/yNx5boukYlmZw
         cm69UwxMuiWN0fFy6Hc9P/Aoh1v4ObfPjJWn4UI+OW1yKll4lxLjndH9Gwzw15a5BNh2
         FAio1tulzepfHsaBIhsEVjiHwG5BzyviFFhtN8ukYrPzRoO71nuvK/++/t2bSerRr8XV
         Bb8ummk7S9ZRIweXEnWoBZIZjFdmDZqlapm4gV5Jl0jLiiKF6hQ1ToHKF4LHmbLBiUzG
         PXUHbMVQ43PetUxb2vf8PCZOQXFZT7XRO+mMgBe6DAS8hvUArrqoE07FIzd6W8C24htC
         vtxw==
X-Gm-Message-State: AOJu0YzjpOqS6XG2GFboytTzOoZwoChHDeuMDLrxk8GYAhHUC04gKa+M
	fSn1+o+5XNTkP/MLyOCnTsrTNDJWBJXsuUdB0NWcQSTo5tqIOB893sYG
X-Gm-Gg: AZuq6aJlCIvE3uzRVRSKFsPl+3ejy83e0PGvUTWrSXf+WYMmkVNtZUm/y1yxaxLU79J
	4du4EfmnTxughDZ6GGLxDVTi02x4iKfNE6dS64N8pinzcOzoI3Wpr3ie0wNVR2e5GdYXXbDvVxE
	Yf20gT1Bg5sWmoHsZS5bPXcr09IojOJB7lOCzv1Espq6sYqUzi8CYPxTHWXzNMnSO7X4zkBu0W7
	5BxsECpF742GaJloOlBpMZuhOGbRq8rigtwYexnQDJBQqiIeqFZG1+48XbLD6dy3gEx6X4eMs6I
	1URMWroouc/KzeqtMpdj4zAbNr8mcf7lTVAEpTznHHatghDeR25+MVL7xsnK5E5GYirlfveYIGU
	X37SQtvzYWlMssHh62xxKumpBZaOEbLIa1iiR7RFcM+sg/8WKHgskaSdOVDcA1ljUmqGOyRedj/
	lsXp660pEgD6qlQraMbLpVnJxeYSflOWrSl6IMJ8aB+q7+tIwXi4x+
X-Received: by 2002:a05:6000:186f:b0:436:1b1:6cbb with SMTP id ffacd0b85a97d-4379db30f9bmr32510635f8f.7.1771581835115;
        Fri, 20 Feb 2026 02:03:55 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43796ad0166sm55642699f8f.35.2026.02.20.02.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:03:54 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 20 Feb 2026 11:03:49 +0100
Subject: [PATCH] arm64: dts: marvell: armada-37xx: align 'phy-names' of
 EHCI node with DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-armada-37xx-fix-ehci-phy-name-v1-1-27c9907aab8e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIQxmGkC/x3MTQqEMAxA4atI1hPoj1iZq8gsYhttFnakBamId
 7e4/ODxLiichQt8uwsyH1Lknxr0pwMfKa2MEprBKDMoox1S3igQWlcrLlKRoxfc44mJNkYfFq/
 VOJveWWiPPXOL3v/0u+8Huyga6W8AAAA=
X-Change-ID: 20260217-armada-37xx-fix-ehci-phy-name-cdfc108b2473
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_020357_713450_EC7EA512 
X-CRM114-Status: GOOD (  13.95  )
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

According to the 'generic-ehci.yaml' schema, the name of the first phy
in an EHCI node must be "usb", however the 'usb@5e000' node in the
'armada-37xx.dtsi' uses "usb2-utmi-host-phy" instead.

This causes dtbs_check warnings like the following ones:

  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
      from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
  arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
      from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
  arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
      from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
  ...

Use "usb" as a name for the phy to avoid the warnings.

No functional change, the USB interface works after the change:

    [    1.472393] orion-ehci d005e000.usb: EHCI Host Controller
    [    1.477847] orion-ehci d005e000.usb: new USB bus registered, assigned bus number 1
    [    1.487127] orion-ehci d005e000.usb: irq 40, io mem 0xd005e000
    [    1.505759] orion-ehci d005e000.usb: USB 2.0 started, EHCI 1.00
    [    1.512493] hub 1-0:1.0: USB hub found
    [    1.516434] hub 1-0:1.0: 1 port detected
    ...
    [    4.175746] usb 1-1: new high-speed USB device number 2 using orion-ehci
    [    4.347643] usb-storage 1-1:1.0: USB Mass Storage device detected
    [    4.359972] scsi host0: usb-storage 1-1:1.0
    [    5.367100] scsi 0:0:0:0: Direct-Access     ADATA    USB Flash Drive  1.00 PQ: 0 ANSI: 6
    [    5.387091] sd 0:0:0:0: [sda] 30869504 512-byte logical blocks: (15.8 GB/14.7 GiB)
    [    5.398420] sd 0:0:0:0: [sda] Write Protect is off
    [    5.408108] sd 0:0:0:0: [sda] Write cache: disabled, read cache: disabled, doesn't support DPO or FUA
    [    5.477359]  sda: sda1
    [    5.480037] sd 0:0:0:0: [sda] Attached SCSI removable disk

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 87f9367aec1227c2c6de52f358d51bcff758c147..a8d10e4de81619c44ccbe0f08e69707dc28005a3 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -396,7 +396,7 @@ usb2: usb@5e000 {
 				marvell,usb-misc-reg = <&usb2_syscon>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_utmi_host_phy>;
-				phy-names = "usb2-utmi-host-phy";
+				phy-names = "usb";
 				status = "disabled";
 			};
 

---
base-commit: fcaf733ca526b69595ed1d227e2cc59ddd24eff7
change-id: 20260217-armada-37xx-fix-ehci-phy-name-cdfc108b2473

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>



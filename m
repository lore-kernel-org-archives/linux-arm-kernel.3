Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162E9EA4FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dekzOzjCcZH9VxfMLTSix7P8omyyrbtHyX+5U1//3bk=; b=wyLNTmRcolWUGN3h9TmXlwPabG
	VLknJqDyaNl8bcIOu94Sq2g2KxLO1Aod1ygm9ArRLcjpDnefi0nRmL/M+dbWlRe78/2eLBXXeeYSF
	KlAj04TGrE6HKBCtTWSPXbpmn3qNb8Rl6L7+pqeJ08jwVmbKlMuDVdHTYy40kmqRNmZeyogF4js0q
	yDEVLQOu/yG22tbPyTE671RfN8pP1JxbYZX0iF0dO+umwT6IAKtDNRpEMyzpKyOaJbRMCGDOZ0ovx
	TQITauDu+YnOnBP/cbJvGb6Bsyl5XvWh4y8dCBUYQIDsrxISRYgOcmCh5WHrDIrONBGESlSAE5Np4
	bAiJOLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwg-0000000096U-44AL;
	Mon, 23 Feb 2026 11:17:46 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwd-0000000094J-0IVW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c6e248aa446so1687590a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845462; x=1772450262; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dekzOzjCcZH9VxfMLTSix7P8omyyrbtHyX+5U1//3bk=;
        b=Uryg2zTJ2891oJlcZFyGi8RlrfgbX6NvvSeNMhDfGKqm0AqUj7Sq15xLIQX9sgpRs+
         ZO3p1VQQUInG1tFE3+rEV9A1u6z+7qtbD2TBqgz+8TT6Ufdf0TdCiiiroSPYGzB9FcUa
         lgl0ptnqSDBGlkjkzNVgaEBDYPL99l+jITFflV4ND6Pn994BTh6yTMLKjnkWWoW8kqCR
         4dHia9HiDQZGnzgQtOByAWJHzYB3xYI2sdu2qO7RDV0/AC1EFE9SttG4ytjdxRrxh8I3
         P9y+r9uACRSobEPpMzep/wAUxyRGZj+FxgRW/KE64ySdaHxTF1tTbWg745Z+06KEN4Zy
         2acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845462; x=1772450262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dekzOzjCcZH9VxfMLTSix7P8omyyrbtHyX+5U1//3bk=;
        b=QZvGoFsS3ZSj3oakyk6g74Eq64sDzzgC/POg50uaHuExaLtdL+4+HpPOHL90wZlg5Z
         Rz9RnMiCqrcUWjDQkl/N60tGzm5afDUYyAQppMOpDK+w4U28qyP6l1q+QWUTb+ggI7hJ
         +5Nv8uYJg/wkvu49juYJM5na9as5KQNI3a1KbCXOA9nylUNEye6diSYTq8HEL4LPEh/E
         AJUBg99HgDe6uMx997ZykCT/gPfCdKR616ljUny8VZD0DEcxwpxxFHWQO2B9HVdWE6Fo
         d/ikPqAwQTISDct9H1umOpS46+riECM78x4ntRlhah9i0SnJY4Ko4NcozodLnwM7DoDN
         yIiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzP7tj9xMMxo5RxZ2aXnklMCZhOr3EHX987Fn81FrR1dLt6nYHLrNJ4bOMQQZzx82atAWXDiC+xE6W58T6vpcX@lists.infradead.org
X-Gm-Message-State: AOJu0YxVi/Zu84rEPjVAp3hXqwjbAGMUExunrw2RGgrmJm0KIjdWjfal
	GX+J8uaZ7QBKrvmqv+IFJX+3wOvjEv21w6924rPweinc867MaWmK43ho
X-Gm-Gg: ATEYQzxVnjbia6Y/H1hRNQazVkCXD06g3A6O+GXpYZb5ncSiuSqSnFO6qj3/6x2UaxQ
	pKWMgvR4dAQ9Js+Js7q7wSsYbjxEi0msibJ4i+A0LtRZ5T961iBLemKZZSCG/0tCJDSRAZ4FZAM
	1fPevHgaqm//Z7dZyl2fBCFuRmuU45CzXzWJWTXHm8w7DaXL5bhE/9doH1hzGZCA3zDzapes9Pz
	wqDkWgo5efVbD5IMhSMPP+pzve2bChwUfsOass8VSihJBpq4Nh62vV+nDjWaMV2FVGUDfnkXny7
	V8fFQ1wJw0c/cr5+2AquPLED5VvBmoAQkSsQfo4yCpgTSCf7ucysXKbk+ULthpmPyJgBAXMM9D9
	pArHNjdD1Q+SY4A5K1kBWeH/fAt1sSA7M4XXaxTaRQ1b1B0CXqXvjMzhnwo7cNEhbtzYP+ERdZu
	vcZUIp5KnvN4PPTXk5QbV/hasKTwabFWJVah5j8S4aVdfBVzpp1X0xOOKV1aZ0HCGul3rWJ32Hx
	8GnASDMuJ9qEX2JY/WcSUGKbLYReO2MO7R0BtDxUI4gRg4WGnvw+3x0RTui2IBoqenC311+Ja0E
	VPjn0dEt7BQIC07Il2Dx
X-Received: by 2002:a17:902:e88f:b0:2aa:d289:2d95 with SMTP id d9443c01a7336-2ad74463f60mr80278615ad.17.1771845462066;
        Mon, 23 Feb 2026 03:17:42 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:41 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:33 +0800
Subject: [PATCH v5 1/8] ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12
 bus speed to 400 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-1-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=1020;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=Y8FxaZ3tGkhfSNOMUB9wrvZLgHj3UUmc4MXQt4g53Xs=;
 b=9PqZ9iEvttl4uBW+fcNE3uPsZFp3PxYjAx1wpMdNwgGio2/smtdbhOC9H8Xc385a4xsseqnIC
 517wY5pxrxlBN/jjCoUegTvRbKseZvnPJXc2fms7ZaE3+VSHms9SExk
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031743_144444_67BA88F5 
X-CRM114-Status: GOOD (  10.12  )
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

Configure i2c4 and i2c12 to operate at 400 kHz instead of 100 kHz.
This update aligns the bus settings with the hardware capabilities
and improves MCTP communication performance.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6bd36f3fe780b21e834b85242f8aa9..7991e9360847532cff9aad4ad4ed57d4c30668a0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -231,6 +231,7 @@ sbtsi@4c {
 &i2c4 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {
@@ -782,6 +783,7 @@ adc@4b {
 &i2c12 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {

-- 
2.53.0



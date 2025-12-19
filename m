Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC34D74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEEqxDFM2yhPiyFjlnl8LZDAP48x695zaYDrn7lQEUY=; b=kMWOZYlaFBt8GKVvL3pL9gooET
	feZDMNWkElgBTTs2reYUuAVBFxqL3ScVfHbaG8FHsc8uwNTx3TReqF4sqJ+iKoIijo3xBas4KrEs/
	I4DTVQGLlAGQOBrG0UAgDBTw/QSnAAMOq55YcTKFzRHbO7CRITd1TkvfAX41SZhqwnVbhnUh0Q2R8
	UDl1KQUl74d9iWEgtM7jR9Hs0D3jGH76nFDqz41puSgQRChWkCgd12kMnFWmsNdiPKwkvoQ87s3HJ
	BzyPQI4PTebYtnRA5SJ4m68dgxnbJd4axAdBw1ia5ANnrjeVpE6NcWKYkNcL3J6el8SC37U7cgVJn
	qFa6NtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVZ0-00000009oAp-1yJ1;
	Fri, 19 Dec 2025 08:10:14 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYv-00000009o7V-0MAl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:10:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso1223559b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766131808; x=1766736608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEEqxDFM2yhPiyFjlnl8LZDAP48x695zaYDrn7lQEUY=;
        b=MCC/ClGJ6UN1akK0OqCQL3FiZQpr3ZwrNPc1vfzYWZ4pROjSJpE30V+2GNw0hLB+WF
         0EijFvNscHl/ndy3PQyPO9xxHMusOrqyl4SLiAUR9Sy9UwXXB0FdYGgxmz22EwJRP3ug
         tumklaVc0MUl//24IuCOivFRDuVYfu9PWXkH64kIXeYaUuGh3qOnkv5JSLHjjSqgsq/1
         KfPU9m/uvL4jydHzzEgCvuFAzWC+oKBang4upW5rIiIRMJdxh5aym+Qgar3U2NwLlojx
         Xqf3wGHillFfKOd8iqDzFizHTpKdHElApszfIdq8i7BOUqGY+LnlOUCQz6h8gz7HQBpq
         Yk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131808; x=1766736608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEEqxDFM2yhPiyFjlnl8LZDAP48x695zaYDrn7lQEUY=;
        b=AmGrTHv5XR+vqTtjgPDZT9eQzyf8sPJ1tZ2DfO33bZupjVRnoQD8XOHFNYn4W7Goop
         KWCDDVb394x3js7MYUcQA76mSZFU2lHQKJSLVPJ8EcUohiATFxheSxA2CIar5IcQklYQ
         3Kz+Zb7RAHCSyBHal0ZmxpER9+UQXlHisZdW1/mgAeXO/jDzFT3hkY95ZxUnGcjQq22P
         3Kh0EJ3gQbhGevCeeGiLvF/cgaUpd9GamJb1apYol/RCLyx2m0T7LFXCyOrX/IqHb9Yg
         HFXcHVXYH+yubL2pRjgm3CYVJ1GqDRzUL1LipMNVRMr/Z6q3MZqZP3pQzyctzGe+m9nk
         o+pg==
X-Forwarded-Encrypted: i=1; AJvYcCW37EWo4wLLWQQTd25DS1Q3Kk42zSHF9cmC2yNc6HfE+rmQcW0FEC91XLl6Z1Dwc1bPq+Zz35q4sQmAcHpVAGyV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyctnvm0AAg2TcbHxl4M4YZjNCZUoDOYPBtLrKLoNyCQ4uWhKGi
	aoWB1oxmQ4VwcHzqrFDceOWW8h65WB9uC8x98AOuoHW7Ge+VUK2vNB8B
X-Gm-Gg: AY/fxX5DyleI09sARDYpFq7ut0DqGHUBLYQopbWCA4zVZzg+Xm7Yja2s7r+xhO5wB8q
	3e/rPNIJJR5VTXRmV1m4BnHHKAcUVlHdC4rZY6ussdMm5Alyd1aJc28jcnjotLvD/c/vpiQHFrr
	ZvPNCKu2Y3Gc7Mi4VemwmS2EFlehIlU3Wb+h0FQNxW3bF2iDDQm4eq/84XpSKo0hpCQGiPdaTXo
	Rln8SRVhus0Xlb18WmRA88WKjJGovq0/9Ay0o+RbOsTBb8Zbv2PdfgfdHZqcLs/7C8uijSs4gmz
	OJaceo+OaiTuCOILub3XdEoPmZXE3TtY5xdR20NzOvP46npaCJ6dK+QE706UZ8SV0LRhWlpdZoh
	udydmoMlirq6dZ9myouV10jmtbKP6iFMZwiwuX38KYnkEbS3JDy6w2q94g9sS01HmynAs5pJCA8
	JUCAh4AoVknjYtQhX930ZTkVoLPNk2TOhM8fatyZoih1J9DqbORM/WWJrbMdI5mTXftIBOUzOZe
	a2jCXvdn+wDLQt5HI4M6wZqzqvzs7JsylKz/hNeNQPLEFld6SsW32dMJm2l6H0eatYWgfjdIkWd
	HViO3i61CXc=
X-Google-Smtp-Source: AGHT+IH03b4+jSie1GtQ8+ubGota0N33xeJ3WXg3aVbp8UHxbGm9Xls37ao3K2cBu2+EzsJRbtyMVg==
X-Received: by 2002:a05:6a00:3409:b0:7e8:43f5:bd47 with SMTP id d2e1a72fcca58-7ff6725978fmr2012408b3a.51.1766131808131;
        Fri, 19 Dec 2025 00:10:08 -0800 (PST)
Received: from 2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net (2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net. [2001:b400:e3ff:afb4:41b8:b31c:89b3:a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm1597274b3a.26.2025.12.19.00.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:10:07 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:09:56 +0800
Subject: [PATCH v3 3/5] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-yv5_revise_dts-v3-3-ca1d5a382013@gmail.com>
References: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
In-Reply-To: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766131796; l=1856;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=bf8xEERmNoQu6JKiJbQyzBDcSJlpDrQjBle4TDLj5zE=;
 b=8pOWULTXthC45NBzVPT2fNC0LDr1UhXhIrPRavW4GSG7+HeWQ1n1MkgrFLQ3L4agx/PncSGEF
 D1a1C0Hpo4vD8qtIs2BisigZk1w2BTXDMGc5g2JLrjPaXrKDbyVd0Dz
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001009_130853_E91D4B9A 
X-CRM114-Status: GOOD (  11.49  )
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

Add new SGPIO line names for user space monitoring and event logging.

Also rename PADDLE_BD_IOEXP_INT to ALERT_IRQ_PMBUS_PWR2_N to match
hardware naming. The original PADDLE_BD_IOEXP_INT is unused, so this
change does not affect current system functionality.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 31 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 45b8ac2e8c65a4f672e64571631b7f6944f26213..983aebc394d9159c7e3db2e7c39e963f7b64c855 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -978,7 +978,7 @@ &sgpiom0 {
 	"E1S_0_BD_IOEXP","",
 	"E1S_1_BD_IOEXP","",
 	/*bit88-bit95*/
-	"PADDLE_BD_IOEXP_INT","",
+	"ALERT_IRQ_PMBUS_PWR2_N","",
 	"FM_BOARD_REV_ID0","",
 	"FM_BOARD_REV_ID1","",
 	"FM_BOARD_REV_ID2","",
@@ -991,16 +991,37 @@ &sgpiom0 {
 	"PRSNT_BOOT_N_FF","",
 	"PRSNT_MCIO1A_N_FF","",
 	"NIC_PRSNT_N","",
-	"","",
+	"FM_CPU_BMC_RST_N","",
 	"","",
 	"","",
 	"","",
 	/*bit104-bit111*/
-	"","","","","","","","","","","","","","","","",
+	"MASTER_PWR_EN","",
+	"MASTER_PWR2_EN","",
+	"PRSNT_MCIO0A_E1S0_N","",
+	"","",
+	"PRSNT_MCIO0A_E1S1_N","",
+	"","",
+	"","",
+	"Fault","",
 	/*bit112-bit119*/
-	"","","","","","","","","","","","","","","","",
+	"FM_CPLD_RSVD_MCIO0A_SB1","",
+	"FM_CPLD_RSVD_MCIO0A_SB2","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
 	/*bit120-bit127*/
-	"","","","","","","","","","","","","","","","";
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","";
 	status = "okay";
 };
 

-- 
2.52.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A5EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wwrI25iLIFnHM5KoM7IfI6VZoQcq26sDFnBNFy9YZM=; b=bI7hwDZwddsO9wervSL9cZHW0p
	gPvDyx+7O3i58YiW2AitgHiAW+AphXYGUJv/luJycbB5n0i/BFgQmw06je61x804ARdCHM/m1bWR0
	qGZNfB7sPiry6PFpcy2uHtfLl4/xxV3yYFa7GjleKjz4tKkLmJ4I2ZKdPtdW0UaFsjTjl+6FuYzpV
	AUWkUDuvMjyc4pF1zm6F8esFZ3OiG49iE0+bzievlnBVKN8dTLKU33pzHl0fSDE3hEGGPxkwm6VrN
	uyyfgIF/GWH0KmO6Gyn4bqshj1ZUL60p5ph0LhJ8rp+OC3zJ1/JwoUu2wU3uozdR3qNYWP5YkBZBq
	+SDLHzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwo-000000009Ba-2fPM;
	Mon, 23 Feb 2026 11:17:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwi-0000000097o-3C00
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a9296b3926so28478825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845468; x=1772450268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wwrI25iLIFnHM5KoM7IfI6VZoQcq26sDFnBNFy9YZM=;
        b=D3pCKVWk8D6o6NV7LUmDuMxnB9W6Vu8aIHGIbzE0durxViO86SO/zswW3eWWeUimfq
         gYlkrKdkUvKnLI/A4FCDZ7gwsK7J4fXb2TbAsaK9f+/iuLo/LGrF1WNulilbF/0IBu3h
         yI/8cAOynwjKXIRqBE0BK9rTahMGlFXUf+4EVvvKSVzcLpDj5RUDbVLazpMo4pu57Xyk
         +Srb26ii/oCVztyzDGnQubCHa0amAP6ZwpVLrFJD8lgptNDI5JvjILnwwFbQf00NDQWi
         9rmh0YYu29gXCKfAFO+RSIA0gF5E/Uom2nBStHSw4G7qC2EWOlSWIgvP+mEEtwrZ06sR
         WeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845468; x=1772450268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5wwrI25iLIFnHM5KoM7IfI6VZoQcq26sDFnBNFy9YZM=;
        b=guCd7lyzX4cXSc6UzZg+zLSxayPsTmHXBL3NCQ0cnXTxcCuI3wXsZ7FFF48bBdWSUF
         OF8yvAtW802yY9dW+7QtjayLt9+iNKofCYWVuNB4/yv6gLaR5MG2Q57/as/1JhTmV7F1
         NroQVE+u1ZZ3moJZlT7+zYHIgPfnQYiYH+5228QUx9ARWcjqc/Hv/ROGc+YMqTDj52im
         xwi38CV8lR4zI+kbP8i/WrntjipI9xY12QdIzPdlUwL8+gLHNmtKQ3WsDoScPIECvdnb
         C8NCyHaKbwMZzJxRPcv/5E3iPKFxhd2l0JzT577c/fdJmYtxSZffzul7/jGwyMQvSnWH
         GbaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxrGbg+6Yr9/lK5lqaLA0FiIB4DnRAuQjtIJcGMf8+kVPxlauEGjq8MtpcTqzFYX8gGJwsd/wEEXu5f+Uv4+9V@lists.infradead.org
X-Gm-Message-State: AOJu0YyTWL78VI+sfMVn9J4LNOILeE8UxmGxovqlsp4JFLRg7KeDJdrr
	8A/+lQc4LP/Y8JPyMYMkk8KGddpVpfPQaI/aEMfpAHC8TP0bOidKFyBB
X-Gm-Gg: ATEYQzzCxVC0RoFgUaduQnE9F1mrZnyalCGQ0tRT4Yl7tLSewIHapWXMnM+1fcl89w7
	r3QfeeBrTPrpfffDqONzdSRRS+4IG8UjjlppD/2puqftyq6huIKGlnmOIMJrMrR+enfwicrI2qB
	eN8UU3Oy+7WaeVqAtVpZdZGTYWZZV4d8QDd5QCJIoTSNOt7H2V1zR1uX3DhQ7ZyigUKX2/Tp0HF
	h+aM6UKnzk+KZpOwNCqKYVImfx9xcpY8Xy6lTc1dql/Tiik09ACput15i1AaX+e1vSaWKr4fAAe
	0VtzKqnZQ76d1kYYNXhzeEE139fqf110N3YVI7HROidYp5bFLzmND6VbmF0xArKTRG2EfVNRhIm
	Vmu6q0D2rChDXOkqGhRdeglRMx/YJwMC25JBGKs9WKGSP0gQVPMvcVYY9yW8xDHtUpMEaqjgYio
	dIM4i4VEfrUeuM/U0IXuM51ROozxwUn1pIMRSLToc8GwYAmFl2VXEjK+W4/EnP9HR+Rf+rNkslk
	Lzwgwk/ADjOXZb4H3rZMqwdVjq+M13ZnJ0ouvP6b/xEJUrCoNojTzG2Pqum+XT/cV/4UEu6LdVK
	w9op1BoJSx+T3ezcdLK8LUEQrS+YYpA=
X-Received: by 2002:a17:903:1a8f:b0:2aa:f2ce:5ac5 with SMTP id d9443c01a7336-2ad744e0d19mr87934095ad.32.1771845468170;
        Mon, 23 Feb 2026 03:17:48 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:47 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:35 +0800
Subject: [PATCH v5 3/8] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=1856;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=uTj4gapYUMyafJqifSahFMkj6rVicJqXTR5n6i+21+w=;
 b=HNnQYw21qw/5gIdn25f/liNOn6HycN5hMNxj1h1M8Hd4NAbVZdYM4erJQgerztGtI+WIRUPhJ
 K6MsgL/vOYgB5DYpyxQENGiO2ESFXi0de/QBlYMC+SvhKVbWQOME2qa
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031748_834735_4CD882B7 
X-CRM114-Status: GOOD (  11.06  )
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
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84B8CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8wxeZ73zfPxZDqjOffcWW0zKOqaQGOLDGU9q6V4WVw=; b=zzOlqByNfU3e7t2hvUtJe/aiiu
	zJTsbEGWRN8CnDnaGA9lYz/4SxQ4oJ8BdtcjBeR4Ln/WPBFIwrka9Ru6CIKgbCFhuYq99gwKEbwVt
	dF78LCLlxNLa+qGuqF9Ai4scezjaz2/qNhHV3YdvT2JJl81EbSW2WOYXjmT1bOzlf8vOXQwEZCCTR
	ypVsResLXw5SZRvOHTfWy4gGi6qsJKm4fVntTXtShNUVxyxwnw+5DeQmSF2FNnev+WdZvJEbdlRhL
	hQiLxl09vTZPdJYbEPlp/dnOl9J8Lm/sp9Yl2klDLMHZkqWNzCinCYYbImyoqXXrXoySR2pNSb/+g
	JvQJOh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kmm-00000007yLN-2xpE;
	Fri, 17 Oct 2025 13:46:24 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kmk-00000007yKL-1Idy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:46:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b556284db11so1639089a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760708781; x=1761313581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8wxeZ73zfPxZDqjOffcWW0zKOqaQGOLDGU9q6V4WVw=;
        b=f93EhU400W5AwZCijSgKl5GWPmVHJwsxx9CLVMCu8mrlOcPKJu3Mpq12meuCAx62tA
         m8HcLeW/tNOsEjgIjT4G0fRD44o0OB2eFVgN9OjnMoFS2nuVFKovwDx34eGabId8dQ6k
         cYwosAOxjQSS1uFKWtLbw1Y2DFibuObcqNB5ALbMSQrRoEo1td1BbRFq3Z3Z3xINSJwS
         mtvDGgeRVPq/+eWcqG4kZY2u939TiPxV9Yvr1z9N47LhdF2SWVgtB194HWYI0W2Bmq6J
         k2zWGtu74ICUEaWywSUp96uKZAJPCP41mLlwDr82nRv0Cqpj5ZzMqUpVpn5QxemDidz5
         fP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760708781; x=1761313581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8wxeZ73zfPxZDqjOffcWW0zKOqaQGOLDGU9q6V4WVw=;
        b=tQk8xrxsdKM52vU/nbBu8dv+/lmhOYHCJtdMdXWlIV9Dx1rKKr1cs8ZPu+dl5Jxrn0
         JsYKP9RXDOvpxQ12E9TGq70BTr9yk0CVSvknYmMP+8joLu1KZIWuAKmi2hFqU3jTfICz
         mvMFL3EBN2ALv0bx+jsDHiGwpSL5Ap5SQ5/xmmM704N0nEBFbmSUcA2j1qokOeOq3lES
         qdrDKNWcUaeIuRbYbxIGUkF5UjCFZPJapwClnPQjP+KPaX10i9Z2x6ytMV2vdNHaUGUt
         UCTAXTtHd9N42FbPWje0gRImHGZLpJBivorB0INKBwXdbIGfO6ugizV7ECNpRKHwACw5
         j6dA==
X-Forwarded-Encrypted: i=1; AJvYcCU110uOjLXDFpOvBMkwj+QAjR2ewhToiYO99swaD6xTXsrgzqRwO+wxHkGY8hgSbxS2gSEXBJeTqT5k3VRUuhkg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv9jUmAQyiYXlMi9+kQ1E5IGTKHAdDX0knAwMIbngqtpCyPsL8
	MDOm7EWlKKIRsmPPYRsXeU2nnqkFBkCqWIdY4tG1XfNRtHk0pq9tTb+G
X-Gm-Gg: ASbGncsAo0N73XkDbKY+yxrLVyuIlulPATmK0rtTTeouMFMnokzTBx1EGowPWfwCY0a
	mQeC56X8htjOSDsegTaRbRmImfn/nx2M4uh768kDlL6dI0wQ+jb5xLj83ubcsxlDxjOWefwfhSU
	fJuIlepQGHB5H9a69qxrSFxFEnLCIGqAVLfSlvtzhT21kUfj7g+3vQEqawGoRvCkAOTCK2bP/6k
	a0A8LFjxMpd/MRiLcWSzRlHRam5WQbF53syyLdlevXPhOefrcg66SjBIMHr2l3bvJ8wexmN8jwj
	RnO/698zrDOQ5JjHiAOvr+AvJqmZ92wzBsTdwbBJRXawCURH+fNmhWKoqQJfKjvzvJH118TKcFM
	cROfe3fekU0CfcTc0YKIxLNCADZNNxZeK0KgF0UCldJjpWV4lK4u7vG0D8ZKG71rqNgVsjHthtv
	RFSjRf4eUenaZbu2pRo+QHTH5s9d+SY3Fen3pnSL9pqH3pVcQ/h/knSDhOq7TwS9dBnR0p3jsWS
	9wsCBZWig==
X-Google-Smtp-Source: AGHT+IHEJriQOsCE072JGcgtKsQf1uKRAkkKtWjtVovvtEqRBoI600xoTijqLOXvNy4EBRqUN6GmcQ==
X-Received: by 2002:a17:903:19e5:b0:265:89c:251b with SMTP id d9443c01a7336-290caf8519dmr45137495ad.29.1760708781029;
        Fri, 17 Oct 2025 06:46:21 -0700 (PDT)
Received: from bu9-daniel.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099afda1dsm64834695ad.108.2025.10.17.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:46:20 -0700 (PDT)
From: Daniel Hsu <d486250@gmail.com>
X-Google-Original-From: Daniel Hsu <Daniel-Hsu@quantatw.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Subject: [PATCH] ARM: dts: aspeed: harma: add fanboard presence sgpio
Date: Fri, 17 Oct 2025 21:44:02 +0800
Message-ID: <20251017134402.2073042-1-Daniel-Hsu@quantatw.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_064622_367061_338932F1 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Add the SGPIO definition for detecting fanboard presence on the Harma
platform. This allows the BMC to determine whether the fanboard is
attached.

Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index b733efe31e8d..7983ae0bd3f3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -814,9 +814,13 @@ &sgpiom0 {
 	"irq-pvddcore1-ocp-alert","",
 	"","",
 	/*O4-O7 line 232-239*/
-	"","","","","","","","",
+	"","","","",
+	"presence-lower-fanboard1","",
+	"presence-lower-fanboard2","",
 	/*P0-P3 line 240-247*/
-	"","","","","","","","",
+	"presence-upper-fanboard1","",
+	"presence-upper-fanboard2","",
+	"","","","",
 	/*P4-P7 line 248-255*/
 	"","","","","","","","";
 };
-- 
2.43.0



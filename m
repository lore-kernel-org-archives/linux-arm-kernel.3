Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11B2C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/nDqiXo0oPmiwRgkXmDbqPxo4RR6UizLNSv2BWaLmE=; b=Y7uQWegjMes6hvMsb60guyIlw9
	h7F4Iz6isDE92BhJPr1rqsU770OXJ4kYFVb8bZ6aTRKhGxVNUStmPffO5KtziYqIXemmkpXuHepJM
	VgKP1bRUpXbJSuHNkHMjhzyJrl4sRbbem/oLTo9zxkmh0+RndJblubFgf1MZN7tshRa9BKVpR0P4v
	oLHt0I3FUEd3Zi4v684yFYBOiAfkdlKjkpKkn2IlnAaE3bR/fc9rZ/zoqNCRVPYc/TeKcIyPzFZGX
	AQct62RHC+XIXP0PLetISWNRTstw3D+lkPAaldoJtPC86wqNsZ79Sh7+3gx1PXuh55XXGkZ84v8je
	Aii/uJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrM-00000007r2r-3NcI;
	Thu, 24 Jul 2025 15:27:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQw-00000007elH-07nV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso10929465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365388; x=1753970188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/nDqiXo0oPmiwRgkXmDbqPxo4RR6UizLNSv2BWaLmE=;
        b=Q1i5LCaFukm9rPbeDlc8PyOvPIRiW9qtQNTGv08mZh4YGNa5hSwSIt2cZAdhn8aL18
         eEX6GtCtGWSpqEXZlS84YsyPvq1sT0Sf57+FWMMOPzxIXDVaNXtc1zNXmkmeFpnx7twV
         vHOcmDX9KW0bi6gosSQhJP64z0aMH4MpTq4tDNkK70rQgu0pQt6Vp0AYe8R2I0J9IQ+8
         y9tF9AixhmKaXDILpW1S3a+ZgB1YIeayouB0oLlNeiwpqIHu/LDQWPxvkzX3XdhDUcMf
         a3zkL0QlilPFeTyvXrPDhl4QW4lhsSY1ZPXuh8wkuKiydscPMNt8hRHuR0UstnoTKOfo
         YPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365388; x=1753970188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/nDqiXo0oPmiwRgkXmDbqPxo4RR6UizLNSv2BWaLmE=;
        b=EWIFkbf+t1QkKbFb/xrebkfWUsKxtqOtZ0IDAwXyZjD8ye2JUTEdqPSmO2H7fBKSvA
         D1Xbq70dCE41D0V49WMc2Whn8t+3X/30YzxPtlsjDnbqUpuhr0tK53TwjpxNQvp94oO+
         AeYLK+KIbG2T74O3Njvry4OdctLFAGr3slEJ/RoTYTUJyBRjxJJAdknoQd7guqByWpzf
         gVo3/XpNDgb7GIjR3GqqiXDR1XjJPAVNFOnPTmkZczgSA/dWCr8L/gtl20TAUJCBoBLQ
         MHE5hwz+/m1WZS3ZehByLPD6N908KzgDoDB7mUI9eTaMfBuqpSOJbsGom8BIHFFAFvW1
         mbtQ==
X-Gm-Message-State: AOJu0YydMjw3FDj7YMtQZmoqDciWYTAX7RI3XUKFQgwSzv47hDX3EmqN
	RkJcloAmMRbKGuMNIGABeBMQCEpnqM9326TYUiyMLgYI5P4eF0kpblTcyc7TE+zuKck=
X-Gm-Gg: ASbGncuDB8lii/xZ9HyzoUf2zvuFtIs4wdpu18Tc5siuut0ZTtn8XZM9eUS0fx8mEZm
	H1r6zTxe17yoyVNEw385jsnMRYdSG7FQfBE++LAyYzl4OAJHxwOMcs4iry6O3bngtjsN7WTfSjd
	+g42hw/zAQRaPzH6GQzxO4TJM6kTOmrbEWTqDnqMfUPuEyQJ/SuBZN0IopRSM3CHTvix/vCcaAA
	yJgffLDNMYQatyKCFZdP7Kos2ez1zZu2YP5QunyuWlbdL97pIQl3HKueTEH5spC+JBQR5KZ7f87
	wuvau7Atr4Vq+EPd5OEABtR2pUSB13aUUtGmiqCbDW93rT1QcnHAX6cOnnCgJD0Inn38ftnh1BZ
	kqozPOkHKVhe2Hb/5rCg20C29ispC4WGHAaBVpw3A/Xz91r4Bw1yrtk/yuiU1iU+b7sP6K4szbU
	KkVW6HpWamc7dH
X-Google-Smtp-Source: AGHT+IFsfIJWNObH04glJtR4VMihBKDX2X1KMe4027IfQD5dai+xqhfpETfw7nG5oExxx5Qg+IUmng==
X-Received: by 2002:a05:600c:8719:b0:456:2ce8:b341 with SMTP id 5b1f17b1804b1-45868d47860mr71077715e9.17.1753365388431;
        Thu, 24 Jul 2025 06:56:28 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:28 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 07/29] init/version: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:50 +0300
Message-ID: <20250724135512.518487-8-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065630_064542_03D15868 
X-CRM114-Status: UNSURE (   9.19  )
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

Annotate vital static information into kmemdump:
 - init_uts_ns
 - linux_banner

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 init/version.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..f5910c027948 100644
--- a/init/version.c
+++ b/init/version.c
@@ -16,6 +16,7 @@
 #include <linux/uts.h>
 #include <linux/utsname.h>
 #include <linux/proc_ns.h>
+#include <linux/kmemdump.h>
 
 static int __init early_hostname(char *arg)
 {
@@ -51,4 +52,7 @@ const char linux_banner[] __weak;
 
 #include "version-timestamp.c"
 
+KMEMDUMP_VAR_CORE(init_uts_ns, sizeof(init_uts_ns));
+KMEMDUMP_VAR_CORE(linux_banner, sizeof(linux_banner));
+
 EXPORT_SYMBOL_GPL(init_uts_ns);
-- 
2.43.0



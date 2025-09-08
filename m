Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9A3CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1m1HPXvt7ktVSLEbN3p8RtTbvarkVCnLkg7YZFQj7Rk=; b=2mgpAUDz9JpjeFUowIu8sGV63P
	wDF/LHnncNZ4h+PpWCXvSJpLo2zwYKHuNK6DzTf3nTALgPHetV7hNjS2Hyx+FY50VHHRfySxlGS97
	olln3ah3SEooK8ivp3n5g8hAQGkQi9pihsz1QvadZWxW1Tej+HaVY519X6/dIbeKA7V1nn2GW/izv
	KBfRZ59iCFMYqjOB56IUCL4XModWYzLsWHUz7qMI8Z3s/l5OvSWF3xYDc3KYcgMBDaKIWqFic6xT9
	fM4GeZxxElDqo0c0+B5GMTHsohWXzJj70UG5pXWIC26jTNDaT8xdPfZynf77sWmWj4N+/cR6lzRQy
	jtU3zFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXgV-0000000FrK1-3Dqy;
	Mon, 08 Sep 2025 08:57:11 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWpj-0000000FYEw-03l5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:02:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3421223b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757318558; x=1757923358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1m1HPXvt7ktVSLEbN3p8RtTbvarkVCnLkg7YZFQj7Rk=;
        b=k3CUN029tsHaFXMt2GniRWwVSb9cGPnlrW5bNDXhFXByasRqaa7/00OkSnkjvsoROJ
         ZnZ+nFeehT7sNV9J9etwlBHSUpRr9rfDjzE8fFh7+VELlOYDOzN1j9Icg8aS1Xx29CHL
         LKFUtNfYCkCa+i8ok0rSMjTp1213WWeNSu1Cp8jGBAJCXMo2rjU6iMA+m14jJYyencWL
         xWIrV3v4qxL9Ho5Ks4moTDcmjEotiU/DiSOF4SwEJLk0ghj0aYLi6hmbeP7GS1PBnOdI
         cJYymvH790nA+30dHu/hOwAlI8HXmuMIx2sOc9zJ7qcYbq6jBH8sUmT6PzZ1YXeHiWRK
         urNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757318558; x=1757923358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m1HPXvt7ktVSLEbN3p8RtTbvarkVCnLkg7YZFQj7Rk=;
        b=FtN26dK94QFRjIe+Vg2f33cCOz5nyq0HztT6lEZx+aZxC1cz+HQ2PZTfEc9ILgqTZR
         bjQ2oSMva3qJAA4SbYkvmedflqEiRCfdboPZHgSLT59Z4s1J2n9wewpHqXWy/P457j2H
         lQvvE2D/6czUzaG9d8/Mw6J38ad4PJAjyz8hVbKyqEKv00HRLMXK0CJjKfjpeEaH8kjv
         vm+ikoNc1GFeWGAvdDYPEn6l5o1mmlmNSUbadmDVT2mhAC1kaflVTc0fFZjj64PKnkXe
         hiPc3VoAWMUYWDAYLEuSkEIw2hcLCIr3p2ZQ9hYhZXCbMvGXJLssHsMMdQr4a9abKrMZ
         XUQg==
X-Forwarded-Encrypted: i=1; AJvYcCXObm/VkiBAgvRb7+fhcp3ohouYpgGwmq5xNfZYdb5RzZhbVJaVY5S2vRnqiAeGo85VLi3ys1j2sdf+YFrk0qhY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3CMlr70slB4kJI9N/psv62qCqB+PtX89UKC81QpvB7uq/zamy
	86zcosmjb8FBKhaSD6WEQRMM2U5nwjv2l+rPpC7Blh2kIsl2TXenMa9o5byTKg==
X-Gm-Gg: ASbGncuLS2S+m+dbRVBw5foAvEnmNFsflJYucTypDbECL6KMV5qDL6oawj063PNHqGe
	NW6orIiE5w6ovSTO1wmpo4/I1iUvwJblWKp8aN4YUlnDnXeptdVbK300POl7A4DwBTgpx0cZFlW
	eahaKLu2Fr0OGCiHTj3n7f/x5wcSBxCAk/1eDWIYUzxCR1k1F6I9Ig/c3p0Ckj5ya+z9X0aDpky
	tVVWNj3Zo2IpUJz+R+hDpUkWAayGDlko+sgtuVkGsStpc1stvtV4YrcErRd9NWXsm+msRTgrHBH
	tjMP3ULaRrKOHLRAFAPzjXBINwXal7jQKhJgrsAGv/TK5BCGJWhtPbTDBWjNRjHcEgr25URuav/
	UaABBUVpo88ruJ58edQhpVKjbSM+RHxvoIi/I9Pfm3GHVQLqus7orJN8kIueJ9xIzd7UpH1C4eU
	T3jXP7Waz+nIcM/cuVHZpAl6UYKf3iBOqf0ZohaQ5j4v+7BDpTVfubrDA2imUGm9/0vzbpVpGzH
	0AX139SE/2aWs55
X-Google-Smtp-Source: AGHT+IGGZJOWnBMUs56283wgft2cbmKqgdlDx4FfdiUkPllQ+scrxhIKHbQGrDZ1bM5Tn41ggy0nJQ==
X-Received: by 2002:a05:6a00:852:b0:772:736e:656c with SMTP id d2e1a72fcca58-7742e3b5b6bmr7614551b3a.5.1757318558156;
        Mon, 08 Sep 2025 01:02:38 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm15186600b3a.9.2025.09.08.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:02:37 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] ARM: dts: aspeed: santabarbara: add sgpio line name for leak detection
Date: Mon,  8 Sep 2025 16:02:15 +0800
Message-ID: <20250908080220.698158-5-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
References: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010239_053915_DF5C987C 
X-CRM114-Status: GOOD (  10.54  )
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

Add leak-related line names for the SGPIO inputs that report chassis
leaks, so userspace can detect and handle leak events

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index de624f4a33f3..c86471fc6314 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1766,11 +1766,17 @@ &sgpiom0 {
 	"PRSNT_LEAK_CABLE_1_R_N","",
 	"PRSNT_LEAK_CABLE_2_R_N","",
 	"PRSNT_HDT_N","",
-	"","",
+	"LEAK_SWB_COLDPLATE","",
 	/*P0-P3 line 240-247*/
-	"","","","","","","","",
+	"LEAK_R3_COLDPLATE","",
+	"LEAK_R2_COLDPLATE","",
+	"LEAK_R1_COLDPLATE","",
+	"LEAK_R0_COLDPLATE","",
 	/*P4-P7 line 248-255*/
-	"","","","","","","","";
+	"LEAK_MB_COLDPLATE","",
+	"LEAK_PDB1_RIGHT_MANIFOLD","",
+	"LEAK_PDB1_LEFT_MANIFOLD","",
+	"LEAK_MB_MANIFOLD","";
 	status = "okay";
 };
 
-- 
2.49.0



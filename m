Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA92AFC590E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrsbMfvVp2mlT8uZFPdqeEkocHGWkOVoRTFC4HeZudA=; b=tNHyBfZ9xs0laO4wQIpIfRhSPF
	quNaSyP3eN6OnX8NaRW9+WYSFv8+SnILswOxaARJXysvp7DEH4SZWZiM5VJJZDDADgO35CywS4Dus
	FjCqDNnN/nLEIorCs2DAjum5ncpRSaPIO9fOUTJnDwm3OFfeNjnw7j9eFJjPilE4kHIV/1IFxk80a
	//vVOxQT96kkDOYKPBULp9qUTtvkgaL3iqNjXLdz5S5Z80YQGlIVb2GVGekVDK+5F0dPEgEuvnQSU
	aANhavTHKNLeR83eid3Ii8l8IkmRzlQIPk3ydI7rne1gSbwcI4xwYwovpEOBL15pK8ud4HaG0gAz3
	mAv9mwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3R-00000005hCY-49iI;
	Thu, 26 Feb 2026 08:49:05 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3O-00000005hBG-2Bu9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:49:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-827336c0994so611928b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 00:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095741; x=1772700541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrsbMfvVp2mlT8uZFPdqeEkocHGWkOVoRTFC4HeZudA=;
        b=XIRhLvytw4hWVZrnob8slN42nU31bVkqCnvqD8sCUT8g4IYuNtTaR0cetuKwnPLacL
         S53EtgGvVDjVE/fxaShwb0TLDAZhPampmLReRR0PvmhepohbmKO4U92JJqT1vYOfGvfm
         kVItD/Ja64KGfgLNSH/bQ2GIv8sLOO+4Z1GahFFoZrIpyAOS2VTfmTbMNENaKlEGVDVj
         Y4aaAy19SzgtSp5O/yhJLViI+kIpKrUc6NfdC29FbLQ+hMdqPeDJJtT/Vhznfr2Agn5U
         w0cuMpi5GW9NcFLZnpJWNpCdIFyy6N9a9CM40ZPyTT8oWaslN+EYl7gOXkLkZ2sQR0r1
         BENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095741; x=1772700541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrsbMfvVp2mlT8uZFPdqeEkocHGWkOVoRTFC4HeZudA=;
        b=vr4PnFqr1FETHALsrKt6/yyksEaytLWZH7ah84Eln6ROPDHC/2nO20Qw3jaDCoQvjd
         Umt4dXs7PzxQSfcZoPFx20k+v3ltQNLTzjHnSTYTpcFMe+fw9Qvoo1zbFcTRyt1cGw1w
         fn04JwFPLa+fnc96l/fldnNf+qdY9paIiQfCpqq9n8vqgnHJ7B46WRdEZQWzzeRH3dYH
         8UwVENKgfXwMUFN57XL/dpS1gRraIrRP5XMmsPm1apcVwJH6Omh4LgIMjG02MRPtAQkg
         Q3CPWV8qm9eYs3r+95uBV1VXpjPgjJ57M5Mszt7BNqp+Yj+n4fkd2ZHFAEnm1FWsWDVE
         KYKw==
X-Forwarded-Encrypted: i=1; AJvYcCUKfE+FKNHNgJSD6kytyMhhg5jJjsKKXl4B4UYS3SmLC18mq+qccZD/Gi8I7600U97q1DayQyGy5ddhRzSqQ8zY@lists.infradead.org
X-Gm-Message-State: AOJu0YwGdrkZSSzQIQRhI4pVDWFTcAM59fZyA3pfoWg1XoUhIC67OtlL
	21bv/xxIam61xVMLZvbfAtmukFtGx2sx1/oA+Q3zzlmls0OKWh5AU9TK
X-Gm-Gg: ATEYQzz10hq6ERJIq0XbpNWG1Aa2BTgT4wW2G9u61bB2F3DB0VGnR5Iorfwp33+l6Yf
	+Vm3hHjfyLbEolro1VcfrrjHjyipYLtFkXtBfulUXuYxFlcW1xdzEIElDAGYvh8m5fCgMtWrqki
	wM+mlFQAbMi0NGYZY2rqisBiESJjTjf/BHvB/OMxhnob1WBJoBH2XlGU5T/nx2QSCiKrZ4oLUao
	s2CNCYbnrh5y3orO3sbLsUNakg8704e28cSfgyD7Ezcqu6wFH6GwcMWGrWUqZWIh2N8ga6G3t0r
	GfoAMI46OLPO1W5ceFiYF16wyo/GEiAL0Tk6z+g4oFQcSS3U3NUPSBD/fhq1w92SHVYVgoOoyT8
	P6mx+NxmAW0Y9unQ0O9+6K9zSLPKqmN6BEKJo41qxrxwBwnz4G1BCtoi9JAkbov1TTm8atUqSK9
	2RVzuOLMkReQvd8Mv58iTLklsQXy95NAIFXwMg
X-Received: by 2002:a17:90b:1e48:b0:34c:2aac:21a7 with SMTP id 98e67ed59e1d1-3593862e00bmr2064283a91.7.1772095741512;
        Thu, 26 Feb 2026 00:49:01 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:49:01 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Beijing UQ Interactive Co.,Ltd.
Date: Thu, 26 Feb 2026 16:48:45 +0800
Message-ID: <20260226084850.417731-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226084850.417731-1-jerrysteve1101@gmail.com>
References: <20260226084850.417731-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004902_562042_543272B7 
X-CRM114-Status: UNSURE (   8.88  )
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

Beijing UQ Interactive is a company focused on mobile game development,
global publishing, and blockchain-based cloud terminal services.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..2bc2ed60613f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1737,6 +1737,8 @@ patternProperties:
     description: United Western Technologies Corp (UniWest)
   "^upisemi,.*":
     description: uPI Semiconductor Corp.
+  "^uqsoft,.*":
+    description: Beijing UQ Interactive Co.,Ltd.
   "^urt,.*":
     description: United Radiant Technology Corporation
   "^usi,.*":
-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCF2FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XxIS8ycUyW3MT9JevkYgetlYvS4Wi6yo/KxzS9TIkdE=; b=Ji/lkYWPTGkI7dL4SWcO2XA/th
	4iBHmg/IQZX8oMs/P8duVq7GBGEc/mkXM3GxP0qebtJUWv3YJJLkakco2Kk26tI+BR4+FCdTpoXHa
	1MZAqO+aZYO05O4y4rdtIKuGPp1/4iCW7ZX4HVioafGrn7rmSP+MVlwR8bAXQDiJ+3hn0Igda37tw
	ITTuu9O+G8uHsvFLmFXFAFBj0ICiKiqlyeLcPDP73CpTXLCU/lPwYIM8tGJhrd+DAKNnUjfv9iDq0
	ZPbe9zxMUoJeD/ZjM3YPzRECJiZBDQNhG3hE90edCPovZBRv5lFh503BT4fT6nTD4cHql4xMMk0jw
	AFPpaviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUlA-0000000APfP-2waT;
	Sun, 01 Mar 2026 00:34:12 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUl8-0000000APeA-1z2C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:34:11 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-506a1627a09so18401071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325249; x=1772930049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XxIS8ycUyW3MT9JevkYgetlYvS4Wi6yo/KxzS9TIkdE=;
        b=kexzzd2zFgMUV1zjgIwK0YT+NScpYDwXX++UeOU60lLewAwX8wS8YfYCCtpGAI3Riw
         LoP/u4UscoFQn6ERoCrlcATQsAxyDeI4Ch6rmlqkUSmlEXvyEgCLLqz7HvlELb3nad2g
         febsbfaMYzBUsuaUgDCcm/W2gBdRExmOUeudZLlZw1N/tGq/0UvbTu8JhSFCwwb8l9UO
         5TsDFyrX0JqOUMTzKw5Syd/UQ3w298K6ej3R5VBnWOVv4FimOceaxDbBiuY0KOslTOUS
         ezA+ZZm+0QG0d4NRmE67ED9CaFiaSEHNh/OehAmWmuYkDQTUN3sCQHAzPkGLwo84N8L5
         1pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325249; x=1772930049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxIS8ycUyW3MT9JevkYgetlYvS4Wi6yo/KxzS9TIkdE=;
        b=lUrnAqRP0c9Q1N2tvhopMi0WkXLVyPu/pED+mZsiV3IgtB6NhPVdK0V0OBY1d0JAYh
         5LaJjytgFvPbzLHFNFoVCgc0/VLn5Ww5TtHgig+CvZcDKWqCpY9Xyeub8mXITt5TmKS+
         wzFm05326R74iCvP/Kle0uDM+lT547dris/DOdaEmGwFCaWwbPbrRFiwv3xEk0x+eoE2
         hM99TQAVdzO8X6hxWV3Z+8ncryRS31lFINPJ6ykT0YCQ8LO+NScWMgUzP9GNMY7OrBqC
         YkznVGUPfzVFUajZFOfcsowntSL8TfghoeqGN3XRtEf3IhPRbeq2Q/Sl5D/+q7YQCbgJ
         VGTg==
X-Gm-Message-State: AOJu0YzJP5gUCScc8794iUY0YGOUVACgWLgJvX11Gmt8yfK9nggkzDPp
	R+5Ge6qZOlWyyYHklcnTM8CJdcd9zr7d2EzQ0xvuwRBYT8SY7Odir2I2
X-Gm-Gg: ATEYQzyTQgXHVRQyk23N4k2X0Y9EhYvcPzXDc06zB2TcOUQCYpomKRvLqDg0fvSdhft
	XUSpE2jaGes0cKlLqqMcV3uXEleXDD1yzB4CxKMqelS1xOUd/HPzKD++m2nqApPvhMGLfVYPbES
	7zEDk5IiqONNEVYbi3TsrBq6qjuuDR+LRsvDIyZQztKGGLHY4bd7IpUsLzV5qZsZ+wXJbF/he6j
	/uWJJ/GzchFj0I/WzoOXDMd0Z4m6RlrChL78EK+PG6nD6eyt6xQSV4AaP9P6PKPfxH/nuoNRLeQ
	TGlhzjf0QBpkRi5ZI9L55MUxPhYHQxb1NWkzlE91QeSR/+hLQbqMPwmcYkFAf+NOMI26tqKoZhG
	PrT/EICEIz8pArpoh9m+VQLvCmqD710P8MnoWviEP91beHn76jcIBffmqvl0oECq/9Fe006LJzs
	usPILV/1OUHdlLyK+F5awGDsZZfUWLkbhDIctWZicGXgRXDjzGqR5U6Z6f2kn+4LN+yGQIql0Ky
	vhugBh93GYnXQU=
X-Received: by 2002:a05:622a:1212:b0:4ed:b47d:8f68 with SMTP id d75a77b69052e-50752840aa9mr98103971cf.15.1772325249022;
        Sat, 28 Feb 2026 16:34:09 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630a0sm73258381cf.6.2026.02.28.16.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:34:08 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 1/4] arm64: errata: Fix missing space after comma
Date: Sun,  1 Mar 2026 00:34:04 +0000
Message-ID: <20260301003407.2493781-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163410_543991_CC56E6AF 
X-CRM114-Status: GOOD (  11.04  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/kernel/cpu_errata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5c0ab6bfd44a..5f8eaaf028ef 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -884,7 +884,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.capability = ARM64_WORKAROUND_2658417,
 		/* Cortex-A510 r0p0 - r1p1 */
 		ERRATA_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
-		MIDR_FIXED(MIDR_CPU_VAR_REV(1,1), BIT(25)),
+		MIDR_FIXED(MIDR_CPU_VAR_REV(1, 1), BIT(25)),
 	},
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_3194386
-- 
2.43.0



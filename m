Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DA4CCD1B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkVtrQQNx9JXmbmmhcqWd4PIxXamm4sTBDEU32vDCe4=; b=gm/M6vTZtOE+IH4CoqHFmW7cX2
	QtE2E5M7g8Dhz4Iua61IPPf3AHcm5yGTIK8wQH9HiIY/aXzgEjLhJs6UAH+QEXpcWvdEyc9Je9IXr
	I/PNLUwDW5d4LAURjKGcbDMJRKYjzW63cHmmZjUv4kcyimFrFljwP9RHJ0xyOND7EEdSHfbYeEG5a
	zII7ZnK+viMIBcq2if134ZoXjFmRzAK50R7aIQ8zEgPaALVLG+i5UJXlo00sxc/SKWgLgv48hvn+1
	eBZcqENa99GyuxwOlhtTzU6xlCCcaIB3tc+qGsjqIHB5FkJGXnIl4yBQvz7TGoCMNJkYyg3uWpbXX
	6wnOUVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECg-0000000HU2y-1177;
	Tue, 21 Oct 2025 15:23:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECc-0000000HTyv-3KpK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:23:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b64cdbb949cso942421766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761060189; x=1761664989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkVtrQQNx9JXmbmmhcqWd4PIxXamm4sTBDEU32vDCe4=;
        b=YhXqIvIgOmBryc92AKjXNdyPiuBZKSpkoSHCh9sVpItLPBqQTMDz728Wb6fGVnzBD5
         WRPYyndByMyPgRPDNZkCgRTOShfyIOKD0bEmEojK4Da4bpoJ0PdlqTXnme5aUBeQQm+3
         225dwb/bdYSrp7j7R4AxyTldqZ7J/MyyOgEsydrm/B+Of3wIZrAjENLlfn+cNrTEtvzq
         qHmwQhrzlrSDrjGSefca48FlVe5KHxjUG0Qr3WonHM6PGTKz6Sm6JP6LaE1jkTg1wEUi
         FyYteWbA5JR4BidzfzlnWzPcXQruhcz4jSi5Vg9W3VRjnbwGXj5U17HnnWxFBq6YTFdR
         uTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060189; x=1761664989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkVtrQQNx9JXmbmmhcqWd4PIxXamm4sTBDEU32vDCe4=;
        b=nWPcvNXhzAgmy40/0XqL1Th9bNvDJ6F4CGGIT/qqMmwJ9KQdwqgK3GIbzc62LXotdt
         c7DIAAvFz+Db12tjIkOrqfomzpyTfTST/dZVeURIEii/mlo9GO5Bf4eLp4M2U1/kV4y7
         T8F/ZJltQLZRiI8SA3SBGm7kJtaQ60SuVHBQ31MxAx+xdkHO9YHVB3LQd3W5W3Ha4/Js
         WZBNldj5t1umXvm++o7w7D5TskQyK0HQiPVFiUm2EIvgkpNNzHAgvM2BEMxQk63258k6
         EcHfRG0lpnRzArnGQ6BetkrRTnMkuQ1DOIpMiOMGEDZa6eNTqfIy7yNE7eAihQNXeA+N
         kVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd01k/LDBTfFQR7hWpxEnRJNWcz00JjUrA76a7GBEWzkrkBRfNehZDKC9XCoTwTsXmDEik+bzzScfTt3sXPpTw@lists.infradead.org
X-Gm-Message-State: AOJu0YyNXx0PiCnAgvjzNgSBpdQQmIDIKBZULuRrYX/2N/9mBBk3Nuo5
	2qa+jAYFNSXrS69IXfPOq3KkQkit2k7y+v2pnnfFPmBDX8eyYR37ccS1
X-Gm-Gg: ASbGncvzq7FtDU/cL5aONJ9TfHj7NZ3BZ8lgUwkGCrEAK+mnnY22JkdmBpWlUV3I1Rj
	n4n5PQBqnU5fxhOkcgQJCUqk8ITL+OV12KFt/gVQKIEJIgc6tZwa6v3rP2cpGZHPuCybgUtOxbj
	RFemlmb1yPExLifKMPD3c86vLdFk5JiqgEmu0X6djnPoLWV++4lxKxPv4y8Xwd5f8BVAyRf3u1Q
	8nM/Uaxp1zS7a8FS1/QZM5La3OnNQS6a6RoQsw8CL8whUGjRpF1BMXY0dQsssAj0N5OPUiDOmIZ
	HwxhDKWquIFDl8x49JZwnpeCZPUml3h5RMfnGxhHi9O3KSMa4YqGeHvfLxedXhlPuYO5RItDJVb
	J/xkU8G+lcB9CygfMn3j6lNgWVnZYAgIyeI8644s1GipEDhDXGTLR6PhNrEFJH2QcxtQW7ayNzG
	mNbr6CLr2IU3GXbIDpu00OtizuiYpuIcSM6pbzhA==
X-Google-Smtp-Source: AGHT+IFBawaPITrNdYmiay8yNLixvU/sNG7B1UP8/hHhq3TLFQvwCAZYt06AP2bMcG0Yh7bzOTP88g==
X-Received: by 2002:a17:906:ee89:b0:b47:de64:df26 with SMTP id a640c23a62f3a-b6474b371a3mr1920210966b.35.1761060188643;
        Tue, 21 Oct 2025 08:23:08 -0700 (PDT)
Received: from tearch (pc142.ds2-s.us.edu.pl. [155.158.56.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm1082737866b.31.2025.10.21.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:23:07 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v3 2/5] mfd: khadas-mcu: drop unused nvmem code
Date: Tue, 21 Oct 2025 17:22:42 +0200
Message-ID: <78fab8c8b621c0ec1d7c702c028840d7f431e429.1761059314.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <cover.1761059314.git.efectn@protonmail.com>
References: <cover.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_082310_857955_91941D8B 
X-CRM114-Status: GOOD (  12.39  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Drop "khadas-mcu-user-mem" code since it is not used anywhere.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/mfd/khadas-mcu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a7886921..ca4bd6cf56994 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -80,10 +80,6 @@ static struct mfd_cell khadas_mcu_fan_cells[] = {
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
-static struct mfd_cell khadas_mcu_cells[] = {
-	{ .name = "khadas-mcu-user-mem", },
-};
-
 static int khadas_mcu_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -105,13 +101,6 @@ static int khadas_mcu_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-				   khadas_mcu_cells,
-				   ARRAY_SIZE(khadas_mcu_cells),
-				   NULL, 0, NULL);
-	if (ret)
-		return ret;
-
 	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					    khadas_mcu_fan_cells,
-- 
2.51.1.dirty



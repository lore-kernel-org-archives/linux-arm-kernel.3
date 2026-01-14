Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EA8D37E4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=; b=R5DTw5VjoFVPgx/NY4VyrWp3Ba
	Gfun0BU1k2PVoM4qZbtytQc/0FxBjOyVbxAU2DhPa3iA5aKHWdh/Me7ROrHceovdnEKTFzV1+NVKu
	AGeKHw1rbCY9FnzZDT3Yvl9opN3vZottCHciZtL0dHcLuSY1L3Xv19Z8w6NTn7wGTxMXRF0tvdJGd
	zAHhBXcAWtayX88lPekW75VH2s7IMQghwJaroBUSPR64GNqoHoZzx6paSQV3996BikoTaxCetpNnx
	085RCC0ORv/QnnLxoJu+sHJ+wSOgDb5xDoBn7vvhuHExSAeeCEvzSNJDo1HS3X9w3RlCVypoijCz0
	1rnHCq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2pP-00000009hMN-11nC;
	Wed, 14 Jan 2026 15:30:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2pI-00000009hEd-12Mq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:30:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EChUJv3925407
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=; b=m9guE2VH4qUM/cRJ
	F9CSne1yWYFXLejgSGprT79ctgmVOvU0Un8d+0E8aaesqKyWhy39p/Y5Nk+zgulz
	Nj6F97jEeXMdB7O/77IKakV+NC9vzbhiwyv0+JxNix0O24cIR3nPDmsy2ToeuooL
	eg5rtcsqs5cHJVQRQsNOMX2C29hm+J9lhkLUgwwKjku/sN51CRNUJXXhiP0Sqfoy
	ypK0q0R2Lu2+oyU+x76U7mJA9dHP9si/D0jfLUBBlngAHXOWYjQdmWkUXTJ/Cuy6
	hpIlMQ2m9ih2/r4ADu+T3z57erTicOBqKkLRdQ9hDxgyp6sNsVw+p5Or6YsQ+5tK
	PtqQ8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbrh8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c277fe676eso2600841285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404626; x=1769009426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=cElVXQsTGgCdN7Y9i6A/04thkTETfcfSO8g1mywtcPrZqqwx+5EFNnrwPxsti0N/qx
         u8shpzxBcPsVz8VosxqtxHAb6LP51PMcNYGvMu6+NYa+ykiviOz5rV+kTsA4GLPJW2PD
         f5FNNiDq1l4qfbPdCvTkW+U5bBBYW5xxnHn4XMNw1cTdEmNVeAmaqhYjFqAHYZGeIAZC
         QDAUnxqfZvwaS9/Pl2mdd75GhH80dlrV7shFOi12nbDGDoTTZkj42BRV8zAreA6lwwDl
         dXONWHZfIpdAM559crnfvDJ6QkQMnMx5EbX1e/UC02IWb4ukeLAUUcCA0ftCiTYefLOU
         IbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404626; x=1769009426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=cfMFLhlK9fyvdhSM/G16ZCWa64x4a1UUiPTluzTS7fIYlLmJgJsI5awf1qJZSZmTjW
         YaIwN3iaB/DuQH+9fm6jki5ni0qvFW8HGPxvikt4mDf2junizuuA5Nel/Vz15mx9R9t7
         jniRGxdreyXEBhCt+98vDUSpRSxzLGneq9J6pH5DJFlCoq6O80P3prGR4myKG8ysCoYo
         G0Cjc9RF1ZKAhaKlUqvq1XrRSfWXTUAC/nM5JU8v9/qTHu05ZZgN1RWy+Nxh03mOmNlG
         0+VcD0ETfwdOpiTGaW0mDoZgdx4CuO2+Mw+Q3M+T21haKkUxGQGJR6DPuwz74yhFMQqT
         kmVw==
X-Forwarded-Encrypted: i=1; AJvYcCVAtba18VclTcOOyLHiQ7qsFqFzyafcThBZFMQQekIVDtq9yi/kmL7M//cQFYAFIpZGnZl/Ic0DwKqH+avCyJh1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+TenJ4ENaRKbYfIh1OLBMqnMh9j7zCCcYD0u6XVGxjpJSaGAB
	UiZdClP9ZgJ9xTyLQRcJLushtOFTlaYE6KFDLco+6JEHurtuwvTMwRS5VYWeu/RMTfPjZQjTGGW
	7Ex4yCq1NMt9332/ZEsMSjOx2OtesGw+DDIvM82nYamHDflAmi+WHaSefl0Z4MDyYFFnOQ3+xIE
	T2eA==
X-Gm-Gg: AY/fxX4grZkAB1S90q4CX88q8gGWLJdH1JOW+7w44yzltO/6iW25es659nLQg67TLz2
	T/C3TfeC9gAjHnPU7oCqMv6etuN6WPx6G7XyQ+jaq9MnQH2xpUQCFgUdWlTcRrfNrr1IjMOKl3B
	1+QkMgv5Dlt8w1dhzVSLZDWepjkl0prFPwy/RaNwYrunCK3dyzb1TevuttxexrJaJ15bAIgBcTO
	spdlZKaTABwhsizYksHF16BGuUuRPACjFNxzvK1aWYDSbZIgF3V9VeYTLaj0EbJwrmYTEaSEi84
	SERy87xUDk6VYgu67ZUUG6klif5b5rmm41tLEczth9fjd9UH9D5hyzTP5p6I9hFzkFqXvXosdy1
	0QPaBlkDDOhdpjWub0UyDj27NImSEnLbUBg==
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270062385a.78.1768404626600;
        Wed, 14 Jan 2026 07:30:26 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270052985a.78.1768404625897;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:04 +0100
Subject: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4PObio8XO1Yv8S6gHkX3VQh/PJ6tCJixfC8ij3DGRyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aCHz5EDoUoqxZYrNILSL7sGe0v1k0RWIrht
 2xoRozKYP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2ggAKCRDBN2bmhouD
 1w/tD/4gze1JdYhn1yRw9z1Dt7upNwMEXwviunBaUWTiyScupfZYrZZ+mi8XAQ3h7sV+pqVxDTa
 PlkvxnU6zlG9dkymlIE0QgQwLo9fLEkTv385MPjlesnC9lrc/f4FDfX+4dPN/oXA39A4biQkB+c
 +amG/ZurwftY7LyIH7q30PDuDYI4vF65nRj/b1+hVgqxfAvp9gAvZSRqpQHvBejFn4Y/0jwRz9U
 a/edRO1L1nMLZLFNbB8+8W6lcAPnWlYV4bma5tTKPxGMBTZSNBHmnLG78ad7y2kuVLduxRIgZZL
 BGStla564Uwnso8MjSs87/BMaJR+GTfNwesX1/LRok3T6S4JdM6K1/KHCtI/jz/+gWrLYZokrkU
 ecfBDZj08Vkc/2LTaQ5kpQDxJdktYM9STLZFAlNercSl7aVzW8OmmGBOw+iLV3swzbnsI1tUfQf
 kFwmjYQ0S4oqnI7TBdpuzYuPOn9N71vc66VV3r2ngU9DZFiWSO1ZhGwyfvLqDUvvLW1+JElj8Db
 jdcFgyCm0Tzu8bpsTC+DfNskjK/kXhSqapyyboNwAEEnFX0NZ34wopWT0mmkUiYg36PGz5siF3w
 nIvRqmBVbenaq9nzL8bCWZLjfudHFcAUvDUbRkL6uD45begdv/TVys2yD0mRpm6Z8qUVqmIDry0
 uvlzYRfNG+QaVoQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6967b693 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XMepgddcWT0EFqeyVMQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 589znDhNaPgMdUKAAqPxeqbx-RwBpL4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX4MnTp18yw78k
 8o5Z/B3lCXGE+Wtu9CcEfYy6o0Ry5KwkNuwNH8kOOLZg+2gJo8OW109IjnVu+AK849FVQqFgauY
 3JyKWbpNBJjsW/2qx9aCogBMNM/OUfzle081xo2YlerEyA2LSeWVYtPZE8ISib+LS610L5OwmhJ
 LoIsXE2kNef+PnkWmdZFZ+ohAAprVe1eJk5pUvT0uwae3SQnygrfBqV4hki4/sWYY/LBFGf4tay
 jJ+B88Vj5VVitoa4IXbcqoVo7NU8Nrls+HhcwXRYg/oOHW3FZg7TVhTP78Q06jOyWd9hxnICSby
 u6eC3lqQJ0CPE3NcpEKOYT2gj1eWC5zYh2G/VnVqQGmPoEKgfeakqBb1ybZA2ib5Z/XuU4hdgCm
 IFVCXFuiqlkjQOtrg/P6J1rUyY3KrjhUggsjKLoiRwbI4Me3rtfNCLEsasiiPK03LjNn82RXjpy
 ibGGgoxM0zUE6seoafQ==
X-Proofpoint-GUID: 589znDhNaPgMdUKAAqPxeqbx-RwBpL4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_073028_417668_36F287C2 
X-CRM114-Status: GOOD (  12.13  )
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

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
 drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 759c0e604acf..973ab9a38fcf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -6,11 +6,7 @@
 #ifndef _PINCTRL_SOPHGO_CV18XX_H
 #define _PINCTRL_SOPHGO_CV18XX_H
 
-#include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
index d481973fcf97..1a2b00dde1fa 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -6,12 +6,6 @@
 #ifndef _PINCTRL_SOPHGO_SG2042_H
 #define _PINCTRL_SOPHGO_SG2042_H
 
-#include <linux/bits.h>
-#include <linux/bitfield.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 

-- 
2.51.0



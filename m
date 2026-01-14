Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A63D37E4E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=; b=uh2S4dSdtoofJzW6tKqFKxH9HO
	jhhTDl2FREfxaysgE2CdhVzP4S32e9sipaY7v1iZsCFAkLkPkMu0/FibfJ2Icn8vV0YBPWS5NJk/s
	t8GaVg6YFxisXJzsPOnDvxLn93I2VGGMShvAc+z9H7M4AKCdthoW3M5zSpCCM6ln3GBVuEH0Y9flZ
	pNJ0Ofd2kTRSiZjjEKMNIeCbCar4/t0TTUmoRZmcAr0osFTobC+s8N9ql7lqoNWSOY55yrgDk47q7
	JpwwjnHFkHp2TTRhNBeaatp+ioUQdy+3bKTGplisg7kd14xkr1BicV4SozjiB00x509wDIvyqJrTa
	w3R6Tn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2pI-00000009hFQ-2hlb;
	Wed, 14 Jan 2026 15:30:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2pE-00000009hCP-1dTo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:30:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEqlsc147900
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=; b=AzCSBoD9J/kAgn5b
	NYPVaY6w6+Qs5o+wVDPdmbCawKNIhRSVPAqH4gl4pai6bAKuHoVYlq7/WKsYLNjB
	KQrB6jYs0vWaY6+W+3SN1noeudRgeyidixzfP+OYATvIPWpHkiBDpg3e23JWTX1p
	4fhGq2IJnlZ5KJqbzP+NLxCB5Fc1xLFL8bw49SWoU1rGDiQ5rHou2y4mHufOcRST
	Ob3AkdvukE7IKJsynwD1ZBbOatQM6y+aklUfu6NiWhUft8INyUsny/4bx+2bR/QX
	ghWJPg8SbaF1jmdhlrH19G4Z/HY6XW41soqrc0WF1wihTWOXPxte9gbGFoCEMnSl
	JSycfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6rahpf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so2463318785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404623; x=1769009423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=;
        b=THMBcpy0V/204hG6TOrsrWaw2B5ImRUpxJ8nHxkqqo9i+/hlz3SOovSDIt9hPxaT9T
         7SdCA8jCQPF8+tydbuAupWJPa9yDTJ2FvMQ7Ar4K4cZM1zrqK74JamorMebWkXKxm0J6
         QqFexmtyKTVbJLzGTopSySrVE/4/6FQK6+F8lESMHlpHiGYKCnyuA4Yx6wXk+Sz1AjZQ
         AzJUyfv0oSpmRp8SghISnLZh7NX8b5V/k5sucyjH7Qpv1Jp7SUCD7Wtnlw7Pn8/1/KLU
         xwXpgOsW5uEpObtxiPB8MyGocqYm/0JIFLByTb/C7Vk/ITulLctShfSkNuQOMwCYXV2W
         NbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404623; x=1769009423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=;
        b=W7sm8GYhgnujMEFxC55IcpS4zCpnn+03o3ti85hItscoZvhiB8G//sHUfJ4MxKdS1Y
         /w/E2OAlbb/L9/6JnJRYKpWQD287SjajhDm9a5cRvEx59vbKtf19PGlR17tWHyhcpc3j
         hvab/W8CVFUea4KiwJ+LDeGC+KdJ3KMGDyh3z/bzTRwzvNnv63sTc+bV3eG8XVmlWE55
         6/2eeKoLiGFapNvfP/+9OhdOVVDuJ4Lb2dI4PV/MIIC+DW8XI41NkMJZA0gBtZQdJ5Tx
         sojp0EUeGE41D48SeTF21412ISH0fnJ9n03jKd6BdRDYbl2a2g7RlEGF44ZVT2Xq0Akg
         6FJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt61uUxWztS+Fa8MIXr6cv50badHvTrFblXRbZVz138z5w6O/8NJg+2OFGGZlvOprp5xJ2PZ8DkTgGlnH91m4Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz50ZrJaLF0P0mJ9OsMDg7zxTfz38NOpQj2Nnmh9QYjkqyXiez8
	Bdecy3bQXcOmXD2eY7rojBfAk64onVZhY5u1ZkGR5tJ1ggSLYDmlwiZrUe40QsLGxJNDayRDqfl
	ai1R6LCn9EPEYWVhZj2+NxC2mk7Y9uu0IyjjaQ5Q8NuaEWSssh88UWTOnsvZb5BwH49Xhm+ID2E
	zmoQ==
X-Gm-Gg: AY/fxX40iko5lNuDf4ZQaekvGMpaWpcr96hXMUhFa0yCmGkRJu9huscqM59NDjftJK5
	vzP+S1+5mDOiblbsoB10FWUPM4R/aeFzX1datNzxu5Rb1CQYzeYYNYtSzO04R9Nh7xqQlF0JsVH
	fal4D9Lz9MeIARnB3tJdcTr4P0RH7egpH2hzvm+0OM1swjphwj0I5YBhVmHhhWUVgsZmm9BOdhV
	ueOfzgeCI1G4SawLDa11NHzB0o5EO9MX0zMQ/A9bMIVWMFIlbh06a1LvxIFItaAZFSHC7m22i9h
	dll7rC9Wbff0Kgzrkpat5IpPELLmYkHLBtUTx0TpP41AVIdWpxASudAo5+Kj29ejyMVsku1lh/r
	MtYgl/mlTTpEtRXOvmWQUBEKC6y6PrrYf6A==
X-Received: by 2002:a05:620a:2556:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8c52fbdd3aamr433296385a.44.1768404622663;
        Wed, 14 Jan 2026 07:30:22 -0800 (PST)
X-Received: by 2002:a05:620a:2556:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8c52fbdd3aamr433288585a.44.1768404622116;
        Wed, 14 Jan 2026 07:30:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:02 +0100
Subject: [PATCH 01/11] pinctrl: aspeed: Cleanup header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-1-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BOg98/1JJXf+vGTTUwHW2mMQjVbfd13nI6bPXirGFB4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aA2bajX7HJFoPmqSFCGOiGBqLJt6NM8LzAd
 XAIqmeyi3uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gAAKCRDBN2bmhouD
 1zSHD/97RdnKd17RjQ4GZXnl1GK1sM4fAIbv/Er4l/nCYrCsRStOmpsNfQQNQ7KbiFIy6ka6EQQ
 RmCybnj6DI01+PJ7LKfZjIhsVOdQRCKSSRsSOzZ2sWtH7UtF7Qco6eaNduwhfUDaSknYVE8yIKS
 q89qtgMa00kGUI0EqHfiZ8qCSnSWxZL+xPFwD+VaK2PMANj3eijWok9TKqlbKkGTmMKho7c3WOD
 kkTSfcVXpAaccbQNmgEAkCUer3aTG6Z0QKWdyinivpOZRSpzni6zy3iZTvH5qnQ5okqQ8+u1yVL
 ZcUZ45bRE9Lxm2YaqTb/8FMSOpMAAXKgnB8X6QA+InLQGRJSNoaNEwmu6nNF/vR2K8ztj6axVXY
 0vmcCDYOnJbcX5YBUAIDooVFlUG0XDfrGrUzdObWOPhSE4k/LWR6KvxxHSM13yiEttuiUh5j5Wc
 uyOWQQHPn+CHVSxzd/HqrsGACkpKblq5HaElBupSYgsEcP/sLU1GEEwHHqCpdn+EPpwcITg6hft
 gzyvN7ZCzN1S8gDsA7ykKbGnB5dKBWHADzwQtqQEP8YvZiOnvQuPH0X2k8Vbd6e0GSxIUydR1xh
 u9u70zyMvvsb2RcwG5zaIi3AprWfNihRSpPswPd5WpF2M6sS9zQbZzeHDly67NBW2wG1jPitQdo
 U7H9zvpSdKlaUmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfXz57oMqJiYkrh
 Xlz7JGnK8I9PG5BBBwQ+poC2EOR23wHytdjAizEplwpJErzSdKk8ieEKYKSd/V8Ea0QYITJK3IY
 zdwLtkIBxHACu2tM+Oj00g6MDVqmv/8DmCTR887a1SdRA8c/6fl6dn1vNrWmpHQ9eJ3V0CHjhox
 vC8cNaAeQn1/0LlhiZGnnPVXZD6x7x9RBILMvCiB697etUddTtmykRU9JCfW8X236az8utm/yzX
 NRM3d0lDXnRAFehbtADFQs/DurjYlASUQtijto6mwLy2qd2Zxe+rD1E5ysgsRKeBGI1jqtdpbUC
 LgtaCdkqpmhsS2XQnQGoAhz2eAGDq02lMKrD1fTsI/LvrixGq94zpHDXUuFXsT5j21F4GRKbdGh
 qeIxUDK0Tjxx7grqitOtimmOz7DiKJkPKqXtOs7CcrLfQN3COoeC8w50yt1R3FNUZVUyUyH11jt
 2zYQ7HfZaFkUIpOla3Q==
X-Proofpoint-GUID: Uu-PVkvMrWQ2_B9ANOSUMlLod8KqYrO4
X-Proofpoint-ORIG-GUID: Uu-PVkvMrWQ2_B9ANOSUMlLod8KqYrO4
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=6967b68f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KvQaFmux51imLjMCrhIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_073024_429506_10F84CAD 
X-CRM114-Status: GOOD (  13.18  )
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

Remove unused includes (no mutexes, string functions, no OF functions)
and bring directly used mod_devicetable.h (previously pulled via of.h).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 +--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 5 +----
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index cb295856dda1..f9d8fb1ab1ec 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -6,14 +6,12 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 792089628362..9934ef6205d6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -7,14 +7,13 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b0c7e4f6df9c..8cf61aab81b1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,13 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"

-- 
2.51.0



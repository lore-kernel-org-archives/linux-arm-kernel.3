Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09198D10F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=; b=joeluHmImbK+nSlXsHGghZ0dhm
	2mSiq3VdpTrrVOdE/dmIZ1Zm8MqtawQqPUixyT6PO7lwahI7Jhem9swBwpSd+wLqqSfyoNvA0KULw
	3342vMDWnFbsMdrEGAetbEbkn/2ZGZyVruqvr+7gJhlOMKAwqLHIWYMwyECcEFcrXkRluEsLeV6E7
	9gTTKF6xZ5563uOWeOUxsYXV9t3G+Gxp5NlnIz/RuKCjuMg0QgYJ3ZOs3Ileydc3ncETh2DkhKhSo
	pZgeiVG5pVZ9TT6Q14YPW/T/OnL2B2fPNzGkJXSbAobfSEWfWoAzFEfCVQ2N2MkLM1NBFAd8Atpm4
	D8S8sPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKAc-0000000FUgZ-06JX;
	Wed, 26 Nov 2025 18:23:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKAX-0000000FUeZ-0xh7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:23:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB2s062122769
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l0+YTwJt14x
	VeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=; b=EwtoBXyIL3bBO5AhGzHoP87LeF1
	AgTsfLEU4ja/LlNrZ0vEkz0wC1aRYjqnHliVP1hp2RdkRzs+oEabu5ryiSAMsKGc
	CnoEYC+squlLbOck6iOSv59abeIo//8FsXXeryl+10as/CMJnv68G0bJHyksXR2X
	lSpTuMyXL7I/wJTpJSeRhoDcVwjsLD6Dp+Ag2GiLUPVjV2bwIe4f6UHv5PqYFr0H
	eBdPj6jKQU18b4Y1ojzWbiTt/a7m5YeqWsO/Iw4/N86wB2OE7H23rNvyQYMgFcR6
	6DKpxSnw4x+2hHKjeow7/4eH4NqvuNcvJMX1PeDyBktmvl4PL4iNqj+8vZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b317a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:23:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b245c49d0cso3829085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181388; x=1764786188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=GUkN6iuyA+zNep1t2JwY9y7xHURto05PKQPzIYfA/t2MN+d4Se8eWFiQnxNgLpP0XN
         2IDThy8v5th0lJlYMDrHtDGrgkPsHEEqHVc8mrFzKEatYCNw/hMYcnoqxorrHeTc0DKS
         lLoeSNtfhguVdRU1TCoXl/yC0ac1fp2UDp23vPakKpyTaCOWiHbOChKPdxAySP5LCYCT
         RBHT0iaNwP1cGDodyESNJaBPBM3AsvrOM2O+tG7gM0pZFcfpGf16wtjTGz33RTwjMcN2
         jYIBPSe+De+xVIqX6rreO0iEeULl03+kZod8VU+ZmjRCTkaEhelNXWkpjY127EW7J091
         ug/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181388; x=1764786188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=arD7cASY+DOOls8fIEMYIx6k5689e74SOCx4xyWjKtba3XMmN9dygukflavylvLCRE
         TNPRrsJ63W+iH+ErUcL72GhJmcZonmrtSTj19BZJ6m5XsH7EUgtabHCSUjuHz/2J1bzC
         qM9E4gCvjZ6CP1NF2R86hKvRCwUw+CZr2x8xsQJmZlBdHS9+Fh4YeBdwmZCVqrfOFdLK
         niEOtFSQBc/nR37Y/1xg8W+b2QOOysBxlmpPDXP/iGh/XRMhrKe503kwEDrbhVPH06Xx
         drKsxmXMa9KVwnNlYBwxe/Mk/9/iHtXqhJTN/xCYpJL72ajs29v4vtgRvgqW0YKrHe1X
         2qzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkuFcjpGbh32v/tjTlmo/4N49mCPFlriE4juvb3vvwKi2YZgVRHhrlWQi8akdL2cI+mEcWyFCO756/h3MV16b/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fqOhKnCZeyWJCzAb1ShTndnNo6iJXqsDo7SIk2fdCwldCvB6
	GLoF1v4fYwKhcPOAAehHSj1Yg/VLaDMCJO0Vq6UIpQf+iNKV4+4wLpTv+rXm8n9b9oC8pK/OW1U
	/A7FkZ542GKpNNMd7YARSsqwOd0vbpz+hN15p04TJgPEiJ7oz97ogcQ1aI/v+jmKdSm5PC7kCJ3
	+RbA==
X-Gm-Gg: ASbGnctxYf4qZddnxGFNWwr1qcuO83UMAEwQsw5EWW6tpZYCZ4Es0wp3i9vGybMd7cJ
	hqFTIgRZAW2kmokYE76v5SCrLQD0AKMZXZnWABvz9RrEwWkKUYgk8zcv8Z7GNFPE7smhrZacCBz
	E4hHQTaepVIMZovWm/v6ZZOnQsLEImXGT4oBEtge9w8yA+WNPdrKFYCFBICJc/41prn/a7v/zzE
	Z/merRjd0GG2qf0+Pd6FJ5J7FJ+852etyGPNQH4Om4Gk0yX7L7MBvbP2KXM2GuJOkSV/hD8JnXi
	dqJMlA1wBykwAN94rqG6Cxwb1R2jK5g/au/EfZdQs2J/SKlrLM3qMVtuoKEx3XU9bsGs9JollXY
	2JWN6Km44Mw1cWDbnYCMZ3qM3Asy0
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792629185a.42.1764181387699;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2mLxW/D2Z12EY0+agf2CZ+NW9zLRlloli4DWeMWWCw7bKngIVu3ZKUo7gwIs2SgNmvD00Wg==
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792623585a.42.1764181387148;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:23:00 +0100
Message-ID: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=6927458c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX+HyR5nZsmsYq
 lRTos8NZ1XGQv38bvMlzzc87yVHrHhg/iO9fudQzAq6zQvMuKAxYLjt1ZsGwFtASXIuZm4o8RDR
 v/nmnzspq5Spthun6uq60H2EzKWirXY3q0NoJVFYuPYZQ1xyryPtYTdAaPFHqa82CAbm65W2ags
 EWNhlsqucx6sQvAffN8j0YACwc9er2aMwlRg6ywbkKA+V/OnPnIl76AWrJv51ENbH9C+NqxjjLb
 AR5KzGUAEMJLVTAEp4WRRojzc1v0wPR+931I3m3J9Rug3KN//ukKKRnYYN8GRHEMk5LW4P12c8u
 OjgsPO+Z0GhHi1xUSrKn3C/HceO9LTAqIDIwgb4qnF23pyrI3Vzk9X2+OPk3jwd/VgcNG1Y2sJF
 QbIpUsC8F29rJ0PZtAwCvHrSBaJ5HA==
X-Proofpoint-ORIG-GUID: tcMI0146pxpSwY8zdLlUAdVYQPysXbCN
X-Proofpoint-GUID: tcMI0146pxpSwY8zdLlUAdVYQPysXbCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_102309_390974_BF16F99A 
X-CRM114-Status: GOOD (  16.18  )
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

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index d51884ab99f4..5ce8f8e4856f 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
-	priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
+	priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
 	init_waitqueue_head(&priv->wait);
 
 	adap = &priv->adap;
-- 
2.48.1



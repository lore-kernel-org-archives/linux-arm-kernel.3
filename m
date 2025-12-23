Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B6DE6F080
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=wNeUn1lICXZDyFfkKyuM3uAq5m
	85ztRqgvDL+lSZWe5dKZrRcusRlJin+jmvATz6HbX5Bmp8rOFHuNu5heehf6dwv5HEQBGgtcTU8aU
	sqdSXmw0VnXTZhuB945WX1CEyD2AQ4ee7alMDjz9OiZ/4+NlDO2QfSMVwJcG+UhpC9Y1gwkU4iXla
	iI7NjB82g/Jvi76xYPDeB6aS1dXzB7S6K8hOD1jYGgMdR2N6aI9GTqzMXlkLDqeUxW5vHqDFWkjy/
	VlnIBDVG5k0x5Uk4W+l8pT0lqJMpm/d0t5DLCira/3pZfoUg9nrcUUwszdgXQsH+T6XMpha6W8hMu
	Jdtv1tPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGw-0000000EqSF-00Tk;
	Tue, 23 Dec 2025 10:05:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGd-0000000Eq97-2QRS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA0kGC1895043
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=pNYomGU9cmrs6cHg
	fm8oG9wabrJHG8o4uIhaWjepW3V1TVEebjIg7mp08EZYtn8SdNW6Uuf89wW0V/Wh
	9icN39epcyoeCiVslOAfuMGs68qB+KRESNcQvYviRtYxqnDTEd5Uao5EIYf/P5RU
	5ebvZcYuUuUlmaT96ibknCqGpJjviSjDF0ebQADOjJYDQkTaugHW6n/DHHEcsHt+
	xM9lFsXVWB2uDMLupEFXKs1NTQqbMLM2WhSvY6WZ9IJ5lKw8C288uiEsWmtLoKMH
	cxBOvUJaOtutjOeDogB5wzkGeUlV6mYLdVIzFSEXIuyLaxU6vkQcAaB36TPnyuFH
	p7e49Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takevj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed782d4c7dso85046381cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484322; x=1767089122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=LSax0HBF7C0muBJD27qFew1aDntJlNqWSHulAlbE+QWKpaXbiObKhdLanahUseG59d
         uL+lbd9wsdKsvfBoulZYUy3rEMvLFh/ajb3s9f6cob/sRLbLHHcqjeWiCX3tQzVAma2i
         w02K+yqZUHfF2y1qSOEiMfdgXrkcjr4ANqTkvcYhEBlqKSxynUsCtqW7ZYNO5fm+RqgK
         trHHRGC6iFTxfAHDPUqqvt7yfUWi/uMjlxatv9AdddBIxwtMZZpjy6usIRcQrAsfcql9
         Mfjx6if8rJ1PkIc0/Biqjj8If94oS5f1+CqGAiHfcDQ+mqc6PmnRK/p/duYym7l6WROI
         4Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484322; x=1767089122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=U/5FsbKgbMTA4MR8l5eU3MnK9Fr9JLOeGmpXWCoVY+pA4zQqKAqAmQOMnFyfjIk9jM
         FPFa9lt5hcuzBxOiC4UhWsjVPcRobh3NUxu4io+kJURUaCyvuPjIptQw7FdlROVCWUYi
         x1ZdDKk6u976PLgDl9BZaz+QvVNCiZnh2MCaHfJYtMylO4yCV85RoAj+d5gzU7KeyUjf
         sMlrSwwZAoZdO7QYpuqP5lSOgxRnStLcpkv9udHqo7geCZL+luaRwXLsBo9vFq1EMoG7
         uICNy3Ga9Pd01Q2omdUpVhbcW2GvBWp+HflgKL1WwWtyztlOT+6HRn2z21i+xP8O7gve
         V3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzeqIqqlIooyFNqkSCcxsqJU8NH6ClNiDRiIs/aDy7kAN72ammnhnT+G+V6gHC/JCyEubxCp23wVKkk6mS7Q+F@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2x0mcxj1KCHKvydIb92LvEUcoPU1kmWViQ9PDfMlQqwhosbBs
	d/XRHl3LuPli4uSKnUzdIk8HmS0saC8alnWLFO0/Go7u8MSxbZgSG/zu8tS1tcY78TduXyb+QUz
	A3r6DH30T5rUJGRPB/KRCgrEJ1pmrDjMAKU1EGi1TOZpSqr7E9Qejsw/iI3MW1qtLiogGspc2Cq
	+oNQ==
X-Gm-Gg: AY/fxX63eU6T2wqk91b+LVOjduSt/1FFqEewbB1vGkG/sL1lGM71+2u16dkRYFaxC91
	wv3ZPKtypQXcE3Y28x3e4yfTVQk3LVPoFQoi7QrdDI6SrKt+Uw/ncDYZyGjDgqFT4kT09OcKAJD
	ibdhvwYCjM8EWYgWe+1F8Hebkst5mqcxcSAYMIhlw6mLVW/r/vvsOZAxxfOKT8o6ZPufgoDvBjZ
	bA2lJSiPwNjM0pFlwU6Fd7uQSN01XX9etSdW/rSRpb5xUD4VQfUegjpphlAh7oy7InLZPI8Oy7U
	hh7AOAOaK2eu7uzjLjQtbwohInpWJ7G3C3Dk5Loz5BDRo7eExMdZtjdfnPEgvGsXSu95e7pwakk
	o5VwhkI784zYY4WfTpGyIKUh2jBhB799pECOSoNQ=
X-Received: by 2002:ac8:5d10:0:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4f4abcf6addmr217340601cf.6.1766484321932;
        Tue, 23 Dec 2025 02:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAPQdXabO5HBaTiT6yIeqTveZgwhLdZJOCpfRWZHMPFDQdqtbIjCybotRp8NqedBYlY0yHYg==
X-Received: by 2002:ac8:5d10:0:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4f4abcf6addmr217339861cf.6.1766484321342;
        Tue, 23 Dec 2025 02:05:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:50 +0100
Subject: [PATCH 12/12] i2c: bcm2835: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-12-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlFig4OCqbxOtJvNGtfIbNE5836C9HJloutE
 T8pj9i2Pw+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRQAKCRAFnS7L/zaE
 w4IpD/4iRVCZ94Vo8mTST6iSvQjGBf2bMAdM2sdO8w4o9GMwNc2H/1vL+dj/sJmGFW3ePed0xiu
 OfQ8nOIpF7LKB1HNC6A2p1obt3zpQkIBePM2r725XHENMEfMGe4KI4hTHD2qQaeYaCNiNi7x4d+
 Ssw+DtyKoTz0V0ATqp2TYb+xhLCALnkXb2kbZCKri/E/wDTrVSkJ7iwnVd0I/hH64yhhp/bMQdf
 tyR8jgJ8IQSpOspV8wI/4LN5ZHqgJoFPQmSeYARCkVCgmV4Jjiu9aVSmx2Tf9JBhzh9HAEgs0iE
 vPUc55CRahywqI3FYD9ar9avHxuIXWTla+1k9pf9oWPPKJqkB1J5Py0js95A/YnDt14rWHqL3U3
 iQUNnnVgLUePs01mhCJzrlDLzsvp8vi8iJtLSFnbhn14cIRKCydCtuyM48EHFXuykcgBuaAp/5R
 7Ryrsdqbn7Rm1QlW1KkJG6yBUvzwvQpALIULi7KogZWXNUO7vwt3/vlD+gu6InnaPix0uk5YE5n
 5nPhxNVwesXk7baloi+fiEKV1fMwNAKpinZ8Hsp2YSkiFNtu43iqbM+QssSjicD4V/PqAsRwlUO
 WmaWgErClY91YRNy4LEpJl/v0sdVOlBDfHWqqM40YZpouviRqrDs7+RjycNbZYbLKgIS7iRw1zY
 WaaluLh5VAM/Hqw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a6962 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w6fcmXAubz_WdynIYoEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0oV3dHjMFdU8qCoLPPbbTBHnBpnHVbYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX+gjpb+5cwEbW
 W6EVJYiF8dKPRxWTuvepd7kRlyoPC2OmwBaHI09AVF3471pq7hp6qZ980b+WHvPe/BmIq/NChzl
 X5/5xP9WBrtQ1eF/404luLnMlwfXAINjB4BHM2Hz6wcuC88OmTwLrV2P1PPhHJ354JReaIme1qG
 xZUd4TVRZkxVDec3LwUw73yyU+2HWJwTCZSZbvJwc11reCPpXnfSXVZya4MPADkPXEXo6Qq5Pkq
 OrUQ8zabDIFFvkAVdo3Q4DkBXjwvl0uhXpK0P7vBVuzIalhbrj/Vr0VZrBOLm0hw9Ql/hGXHAte
 UWJ4CmTPsqo87X0FKMHiPtLGhfsXCArAbFe05XDU4YF+yAtUQ13biv2APSfuLzpe1KhfM2i0u35
 1AdH5hv8LDSzX7K3N9X8laO42jlc0fMv4TNAHAlTBdTDdYUvfSaen9DuuHT7Dr6dua2XTKpG4c3
 PFRaU7Qe+2AwCsO9M2g==
X-Proofpoint-ORIG-GUID: 0oV3dHjMFdU8qCoLPPbbTBHnBpnHVbYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020523_778129_6A606BCC 
X-CRM114-Status: GOOD (  16.06  )
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

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
 		 of_node_full_name(pdev->dev.of_node));
 	adap->algo = &bcm2835_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->quirks = of_device_get_match_data(&pdev->dev);
 
 	/*

-- 
2.47.3



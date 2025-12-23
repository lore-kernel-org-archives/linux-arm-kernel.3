Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E64E6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=; b=giIGbFIhAaZ2oV5A+zmzIaidzA
	94eLcmA+WOfJ7s5cpqdKbeq8LcieQE2qt3OwRiaN3S+gP1IBR2HUWNjP9yqoWhxYr9l0QH+9HfwWN
	etR5GuFdcOGA4Lo0WBfdmgag1CB03lDkF57alKrOs22HbhD4a1n9ath2dHJUtP2NqxBsHX4VsdfBy
	gitnhSuAIVz6u9EPPKFThs6jZ/POrkCkqhzbYjNWlbP4M0Tw7Jp6JAs3XuIPFhmG6WOjrxf7Zi0In
	3mx7I5DVUzLN2ib8vb2iVVOyMyYvkSoEHSIVAbVp1qJ98wLr/i2tZlZVX4mz8hnZfZaPWLH1XxKPi
	cJVmlzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGS-0000000Eq0E-1ZPo;
	Tue, 23 Dec 2025 10:05:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGK-0000000Ept7-1bx7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5k0rp1902176
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=; b=hlvL8scH029COHcp
	+MBV+1qog3pQXgXaGIMWNNAFXha2eZDWPkpmb0kt8+JA/oHqoDZHISR2sWq+praC
	HHxBiRQ06uUW7sy5zZFS01duUSrv97XuA2slOO0N0KaAfi8S3NfFphOFtzaO8MoP
	9hGzubKxtuH+Yj9v54rVzMPz2n92fo9xMvb/tIwZm9awgbshwoF4Ut8BRfggpk2K
	fqJWym2jYS4vHia/jtTLRQRA/SbNQ+btysGLs30mSRQ+8BxnK4l2PLpey/9YpRmU
	nDIkntfUtPWPkzK0+uiTJZ8BbmzDGeyzF4IDHlmVNeJVzVDlvQCEGL9o0xGSDTXj
	9ypubQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso45751391cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484303; x=1767089103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=VzzWRvcBUedCjwGbe1Q7Vkrz3Rb7LTzDIfi4NMNylXapB/DIuAFfmR4J/RjuQ+HONv
         42J30cDAnNuDWun9M5tyIzIrcoK4a/SoM0VTy71SFoHT6HffPh3r2pL/hcR2bhSS7fb/
         56ZTn5YldXa8RLBq77g6m8lZYNd25DAjo0Pmx+S10BlwMZqDHsjLMz/XCURxNqghRHlx
         GWWFLRBqoc1PmgtYcJWr/hFtf0aHt/bGRCp+yejZKR2J0cNu/nGP4/AavLfILWoJIw+w
         KKEOagaRtmvJxfljZsZAUNs6fjmie/Lktdh3eC2bepEq+OCFz+PZ1QsVIZBm2CFrPPRk
         DYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484303; x=1767089103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=OMfdW+hOC5Op+VJqVOxF2sMXGlXYEtzR2kfw9vateW71EQ7/bBtBnLRQ5ZxHu+zXPF
         CxV4LEM1T+EYFJEhsNmBe+3kgfJNDYuvbkGHIuEcM/CIFGObUKzANJvty9tHeYzQ/ZKF
         hxmcBxB22kCzMFnrGTe0eKyABTDN0+yEPdK7cYLwJHzyJJ2R1kAYRkvDY0mey7QjQrGW
         pX7ZB6rmm6/bMU4rVf+injurz1xmqvOY5mcHgOZMJoBXRHHnC8/wRQ5n0ZEfNaCdDW8o
         vxdRupbR1vcsSU832QzEMFlDe2WuCyEoieAonG4WL/IRjY4VsKSvBQH3hFRdH48FVr6W
         xp3w==
X-Forwarded-Encrypted: i=1; AJvYcCWTSSKTGydDlIRYFbroPyQD9ackBtQg5qiTJORm4Hc9Lsg6aRO7+rMUEywtwpLES4Q+frtTky4OARUte09ghoP/@lists.infradead.org
X-Gm-Message-State: AOJu0YxoUuAFPMPyj45RORm1V3xsQr2epvVyILoxfI0shaCW/5Z3d8ki
	Sz6Gmn/WAI/icLXwIET9+xYZhDJNChXXjCNbooA9ULdEZszGFfAnn8bps5xPn7ifQLlB1eW4z7f
	Bn/eIBOOjsvBTyqAitUGptSzTRotTrzcD5JLO1VjQL2wtrbh1iZ+IjtBtE75T8RXubrVVAT6RoF
	dupw==
X-Gm-Gg: AY/fxX4zeNM/nZQjUpgJKWe61zooOhyFuQ+bli1XQUMHBgTBta28QAmEWRk9vwuW2S0
	Wznl+5OuxsKRRwBkwhb4JUXQcJ4SWyr0MT7Vl2gb8BkvCqRCBoiyLM3gCtrdHo18yQeeRDmPdbQ
	SmqU3wR7DQTCV2u1ezhyntTuOKwARUUb+c/mfhkS2qNLEVEqgTJWAwU7pEu6e6c84+SzvWEDaxB
	TiLlDec3y+JCXb891L+sQFqmLDinCPWSPrCh9JvPaxvMcMsaqb+49jtH2ewPm6bYbWiVHcLqWC0
	V509NPSoBafutuFUVeS0xL2OvRQYoY9Ebf6CnPaBZ0h/LtaADGrSklq5jiXMSIqxZoEjunpCfBK
	gFUsUNmp6W8JdEqBzzli/554uzFB9ivAtxa7MRKQ=
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr219666511cf.19.1766484302877;
        Tue, 23 Dec 2025 02:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe5BKZC1HMpaoJ6m22Bw5JHQ2k3vKZ1lflXeYj8W+wWpZagHFrQE5aCx2Ca5x5xFVbk/k3Sg==
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr219666011cf.19.1766484302373;
        Tue, 23 Dec 2025 02:05:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:41 +0100
Subject: [PATCH 03/12] i2c: bcm-kona: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-3-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk9+7EXI/ovwZ/c+XYelh08kqOlDbOBxj2/k
 VttIDHL2WiJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPQAKCRAFnS7L/zaE
 wy4UD/dSL57NbV3RzqtwqkJOlX6sp2CYEYArQJX8tFc9k9osPA7RTFFwDYR077EsO+x6swQWmec
 m3ebsw5P/vUS5BJqv5zs99rA6OREaF/bLsFJdXSEhoAX9RP1kg2FzLORu1zVGuyD5o0+yzDj9ZT
 QNLPrQpqDGLfersmjlqVWmrhVOjOe+Y/ZOjnQEGBcZd0A8JmdhWKnflhWiMHrG8lyri3ExaG+Gn
 c+TnA/WlWcN3vfN/aZOihX9QJW1TM6GBBr2g3GB8L4GMWheCavF6WtEGIW9TqAoOplupBi+/a/3
 SJaSI1L/C6Mg0Ab/d2lh87/sFaZHTyPmVzqRO668D9AysNGfdRCBaR/WAev2AriKdwet6miHmPl
 qytLMwT0ra/pC/P0t6N1C3aDCtPir+t/VakOsLnHOFmThFS+i93ESC8BVZNh5lOl2gHotAjP9Ot
 Bjh7w2/MXmjGWbrheu1uiYIZnr4X85hsQUpBrRM/RFMWm9S58QHIe8cjqbapaXGMmNOy2Ylp/LI
 eE2nwiiyC0wrSr4X/olOtXW7J+U3edWLDgbiEbzud1360InLPOGvicfsMUZ1fsKZy+BJkXS0JRW
 AWzg1yWqYZH3x3uOVCkZZZI4ty0Ks9K9B4qWzbGQbPP5u2fSIwfnsaQwl70eaWQ4LMEnn5PJ5qx
 p8LWm/LnMJHds
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX7st3vMeL9a8e
 T59aqnWoU8t7Hrtcy0pSI3UwHnsR0bAflcp8Yj4EGLU8Br5r2spWQ2dZzrqwssyJ0qaGuMRBiVT
 Sv58jl4DCUFX7eCanh7RG0jC/CmM5K95plSO6z7eqxfnfjKz4XC01Ddh7hJcOPyBqrhA5sNN1KR
 kbIHYQOyM49e6s9DXzvFxfDIicmdIM+ZXOt10yW+g6xlFIFtgz04RE1jfg+5GHzblbt3W76oxlu
 NCecfdFpT4QCj6skOPnSYngAVJOA5DDBng7UqdYrV9lVRwWiyU5rUjFcnq0M0bh9E9V/nUDdD9E
 su3LZelqclkxdiuFbA+1W7DiZxsKY2vlVFoeGQP428ZfHIo7fORtuqhQeTnWtwkCJ8eNCOxdr7W
 5g1r8aEyDIAwdlKyafrjRgDyxSSQPdfJ5HpU5BVrFRFBsREV9FEzlIw5OPO43Y6ilv/aNC5XU47
 bgrZ276dN/ztwsN7s6g==
X-Proofpoint-GUID: JKHGOJ4CnTfA289fB77DI5G1TvW6YV03
X-Proofpoint-ORIG-GUID: JKHGOJ4CnTfA289fB77DI5G1TvW6YV03
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a694f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xxYytfOIdaUIj31isgUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020504_564108_17A11587 
X-CRM114-Status: GOOD (  16.60  )
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
 drivers/i2c/busses/i2c-bcm-kona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 9d8838bbd938bf6c43d9553d9f54acac1282f7e8..edd79689f40f451fc216455c9da5704bdc73c62f 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -840,8 +840,8 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	strscpy(adap->name, "Broadcom I2C adapter", sizeof(adap->name));
 	adap->algo = &bcm_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	rc = i2c_add_adapter(adap);
 	if (rc)

-- 
2.47.3



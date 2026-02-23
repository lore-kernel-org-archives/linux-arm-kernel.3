Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B9E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=; b=qG5fRc8JzPaVaQcn01wEyKA5jz
	fZC5DkNLWXwwdJAc9pmEGspU4/JqgeQghqM+kNGe4NPq1bLWbuzAiWUg6MtuWHeXLHW+pNvC+1Qpv
	vWZzUvxY/6wvIuPisAA9TvbENZ4rbw30jHTaFNg8tqRtIY6OTEPSfuxCUBSRdVW382dQxJtkumaiV
	yRrM/s3oeMMPiy+C/ulpjb/Kfq4zHI6DYARpr6yMK1HfDsF8EwpkDDazDlFu6btkrr4Z92dtSkXac
	CbaEoIdnq76RkJq8NB0ph9oe7My8VL9arbxv02g9tR/LnyHUKvuLOM2Z32KnVQu480UQuJKkD9WbU
	0Sidu6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRte-0000000HUGX-0eFh;
	Mon, 23 Feb 2026 09:06:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtX-0000000HU8X-2q1R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMM9Be2209592
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=; b=ItOQAL6Un+1g7sCL
	BNrPifQpEh670GxN5RSQnLf9WxHoyMpBIJo4hdA1EsRYnHs4zbpuOAy2vveAavVE
	wbx32eKhGXoYfYPKvijjonrTNyr8Vz5/vYlAy8sSG1VylpgelYVHl4ndaLxM+ndp
	b4NvKVCpz0QF1+to94yt9a1aah80tKP8VqMGZUNxJ9Fcp9oFPScqS1Ia0HFG1hZi
	x0aN9TfBBXEXDCeGUYKQLaL6R7sa7KdjDE7FeEBxlGgxYvosmDwbe/sYMlq7q0Ii
	0cTACN5B5ooA9spPbUXdoEMAQRLhQMG0mEYR3DA7Bc67X61Ft42/advBcJCo9Hhu
	2lmn4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v1tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so5358487485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837582; x=1772442382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=;
        b=WO77q9euSNxGY0B30PDc3k00ys8kW5v/vKdbNHQdAV8MZ3wXvxpejnX3rtjpsVhbW3
         u9p7L2LKatezdPepDnsRiH8y+GRZaRuNJ2HmwU9qYNWwhvWMnqimbohSagBR7xMl95Ov
         B6N7jVdJQCtWRRQl+9K0HjsWjv0Ny05eOC9yUEuPB1KjMFNLTJTVwxU/vSFc0OGJm00E
         8EYDDvsK1Z8akg9fRQqbEj9ySNPK7PobEKpaAkwb8tVALCXKYtsN/1sU5EPhT2Kr8kqB
         VLTDwMOX2InXdDQtk+tKsdYbHU7eatNZb1oexyDKL3CAEZ4jMcaZB4gY6XMRdKzsIu6S
         5OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837582; x=1772442382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=;
        b=qTZ3nQiZtf34MmxLb5FTuTnVFDRLD8bGwwOE42PzzJUUM8TSNC7jaJmmQJkUe6d30r
         i6IpD2ATsYRAzjrXjxREEzv5SXuA+xk6CiMKZWkgUzIA3R/mnEsJPEiyibn/Ct1cU3Uw
         iwuvQERXbKuV10bM5vOROUb9jHs5nZeSTtntODyggbctMhF9Vl9MbpSYyll9UGueSkY3
         mBh8EgA54oUD7iEXa5i3OCRmsJs+LAVfEBSfVB85ikrSNa89/56BIqwwxG46UfPsazUt
         oy+FQtOu4QyoEQ7HhF4EBqs1gadM8apNtSRKEd32RarzWAh7QGBb7p29E9qxUnm6cKo3
         S+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV4gI5ATHi1QOarVtFOh/AruU21YmNBQnZp81UevLIjgj6QyIup/GCBmiEdh43VyHH9SVKpTxrw0O1tpjdNXJR7@lists.infradead.org
X-Gm-Message-State: AOJu0YxJL9kC/1YY5M/lwi2CGosX5+/OinmW8bo4//ZTxjL1rXPwVycC
	bDNKwM33nQ6HB2GKxLrvhZFU5sYTlIlWTieuQZl9yuC5sFFfLGsiFXr8LRWEkOUw7Y8g+IFudeC
	3lbE55CoB2tpECwfy4c3bpdvyVXHfcOTbCmqfK7mVu+rgmM++hm8RiFhQQmpVZp4OhIyGPq8QLV
	7Zog==
X-Gm-Gg: AZuq6aIPK/s7kfj3V06U2tNxxTyM696iN0tH+CL0ccdQ6GSdDthsO1BvlkA8iTfpyS6
	YCWh3lH+7BEjq/EALYrBH6CpCsxWAqvriLFScIcfzTnF8kcjKZhsDPPLqivAJuj1kvLyrntIQnb
	SWtBCU4gbYftRw8pEVgwEuL/kG05bdAa6NmkwU+v2NmibOU39KhMLxhZ5Mtyb9Uln1lgf/hDE3W
	MNJXOd96jhGYUKNZIPQfeBcVndcEtAj3CjI7fLauui7GYr31ZvYR3V2pvWj3RAT/UbGaOGzkKxD
	FYroat1g/oA7YlcWPe3YxhpNtiEgQVd0FCkNypp/6xkdJDAvqosJeDXwokNb+WzdQ9O9pLcW+uO
	goM4fOpGzC6sqGwzz4l9tELyY4XLp4fm9BuY6ZhW4/JNE+W2yt84F
X-Received: by 2002:a05:620a:198f:b0:8c6:a587:377f with SMTP id af79cd13be357-8cb7bffe749mr1695557685a.36.1771837582003;
        Mon, 23 Feb 2026 01:06:22 -0800 (PST)
X-Received: by 2002:a05:620a:198f:b0:8c6:a587:377f with SMTP id af79cd13be357-8cb7bffe749mr1695553785a.36.1771837581510;
        Mon, 23 Feb 2026 01:06:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:51 +0100
Subject: [PATCH v2 05/12] i2c: omap: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-5-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TC55XBmh7XavSMEvFloOiPWsoDIu8+74KUdcPMB2Bs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh1cgZ8t5g6Eu+YoXhXwpQTHi3u0PDANGTOZ
 Ae0vjnO/5yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdQAKCRAFnS7L/zaE
 wwgCD/9apGwYLbKP/+X8XV0CrL2TpbVD/yQ1v+mwXTXzC2F0pORGRN35JjluieguYXFndYxaKdR
 tFZGjy50KQb/wtE7KYKXDQ2vWD6HJKH7FLizL1sVHQ7zo2GDBMUrZfw46kio+YiG6Is+Y1LYS7x
 +WX0RKZmhXLvUyNifbPFoZi2cCSTnAlzLHtIb+UJKfzgib+aVNaVB/OH+/srM5mpP4oDifAlwgx
 Ikc9+u0lITu1cL1gkDyoDKnj2lI/aWKhrc7mKp8fiSL+tBfUMKVYrKGus5GOIlEgoVa+iUhARC0
 zjrJVesZJEPf6zXrnmLcNt9AVMPczA7pz70Q2tp65CsbqZnkc/30/gYsr8AENPhTQLteN5BMo02
 086YUnhbe7k0pExpN7GQxKZosadOo7IUnEmhL90snzNzrE1Et39/xYOE2UJq6ii4a/qtmW2uegk
 52VogvSFCULCBjU1Yjr0c6FvBcFABmtCKBqsa7dawmKHWBtVF3vFskxY2lu0/bROCQFZTv+7w/k
 IxINEGTeEsbhCnd7d/eAywrwe3khM9Pf1mA72OKQwXI0ez9mYSar2yrKKTrBe4GKH/5lFWB2+/2
 Y9/ssBYQd5bBfBM8TxNtTpP/pY6suqrCVQXH8nBZw5nsL2f3q2BHphXOV1+Aha8pNOS9Vw/1Uae
 suI+G4XhCD+wAIA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c188e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=50gAi1W1AAAA:8
 a=EUspDBNiAAAA:8 a=H-w5s1-Ky7DYDkcl1QcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=bIAsa0K8HJLRn3BBPJ--:22
X-Proofpoint-ORIG-GUID: tsetF49Ybj2jyKz3itzshbq94WkSJREJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX5lzhmmvLXaXA
 LbYFgMDe0lyLb7YCATyocjmG3x/xX5LO6ahpRIBoZWTqOeK9trLFLgkM7WPI9i4HDhxLp9IiX9w
 s/i+JrMSEUo0PD2fwZigKx4xI03wgRe8KcZBYsNMM6PChchreup+RmLZEcYhqf4W+ssSWzGAKVy
 uYNsSdiOEisJbFdr+Spmfj3UmhubPJNGZMvqIDbEldStLdSjL0SH6PPJIsDGNuisT5HW0vUHkU0
 bIR8EbuObSZxKkcctVmkI5UyW6nfulwDUeCbt4KRs+ZgIqy34kC/4z74gjlGt6Ot7/amrDQTOwb
 zTVkohzRiPe0i37Gl2yGeoLZoP0IwhEAU3jMpzKn7X491EnDuKacTfgtEPgLFDPBeCKPAdQDsYV
 MP9Hf2sYuXdUmbxzYZw4A8OLv/0wbyTOzy7bTknlLEPB5jFA0i7KasAHRMOt4hDbcX1xq7YPmtD
 2mW83NoSg4xk50K8fNQ==
X-Proofpoint-GUID: tsetF49Ybj2jyKz3itzshbq94WkSJREJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010623_855084_6E3E7DE3 
X-CRM114-Status: GOOD (  15.35  )
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

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384340dd31308bdf9ed0cb1a1a2ba8b..f95f31c521314e1d67f3d5b34bb44fcef557624f 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1496,8 +1496,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
 	adap->algo = &omap_i2c_algo;
 	adap->quirks = &omap_i2c_quirks;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->bus_recovery_info = &omap_i2c_bus_recovery_info;
 
 	/* i2c device drivers may be active on return from add_adapter() */

-- 
2.47.3



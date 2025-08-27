Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC9CC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 04:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgG9jC0fRhiZdyvHtCvfrzjfO+AU/dNPrDX32M3A0k4=; b=xXOZbHaBxIhIkamQcm6UgqPsb9
	4FH6FtVNVKbr8mVlh0pS4dg1OiRjO9AFDT7rAauYfkm9qtPeDxEOKy5xsisYt3R/Mx4yg+COfv/CT
	qjfJCTkc3NKShUs/zYnn3SMeU3l/br/FGbX6KNDBGsYpyj8rjJo/PPG201msxlVAHpTLxmc7YvAV/
	3oHf5ew1erhSCkfzM4Vm6KzJGmVARjVHkchELBZIBfQkr52Ag9Nj+a4cLbtb5DW1V7gbF6AwgTJZm
	6R/tuwIyAfZm0FgvB1z7Nmz2JHpGPqJeN8BDhAFdBe1R/Q+JGcW/kiEpu4F/ziH/PySLddvtJN2ln
	6W6owTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7mR-0000000DyN0-1UNr;
	Wed, 27 Aug 2025 04:29:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7eb-0000000DxGA-3eXq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:20:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R38x9w019633
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cgG9jC0fRhi
	ZdyvHtCvfrzjfO+AU/dNPrDX32M3A0k4=; b=OWp6PEmfY8HzuLFpF7XPI6Hutvn
	383bVACz2Qb5cExMcKHEYsA4bCqcXvZo/rpaZ6kmFl15rQ+qRcYfgFSU5zeseDIN
	qr2AwTQJj5TwgXDwyxRU4i/HRWBp31nWBAJl0rBWWhBhric1WHFEPaGA0893oUa6
	C2uPPs4Rb1eDdR3dTMGYPZ4I1gg97LBbv41ZUV4aqed8AiK6izXE4Z7SF1sy0rpw
	hYaevd+vWiz8kxE4e0PNZwyjdwN4/jKkmDjOdGS9pTqfhhJ+CMaRto7Qi1UfKMkO
	DuV9RuHGKN53m/SXh3LcLnpTYMal8JN+tZNup67bpPt3CFuOD4D5lwH9SlQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5k6yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-771ed4a81beso2433391b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 21:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268455; x=1756873255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgG9jC0fRhiZdyvHtCvfrzjfO+AU/dNPrDX32M3A0k4=;
        b=Vp/ZmdRtI70QZQLVGpgMyajtRbsr+dfp4goWY65m27C57mgG1rGJXHEKvXkGaTSwQV
         YTd9d6SeQSAQw7Of4oCOFItXfSJjTksNXZhilSB3/nuMMzRR3TiRyNiYQgEV8E0Br0LV
         ToG1vJbqS0nE5BjqvCm5k8wJSeUpllIVpURDRe2lubXlzmRpMSfQMktuk7nSOOWOYazk
         PXRuSNfiCU8yv7WA7KNioBJ6AiAv3yGaPy/3/COgrD1Iv/PNjrlQ+yG8E1a85kJPDNUp
         +mkSrWnL6D4d2UQYGQsXa3fhTyINl0LpGU58tnfIhznPvNqWui8tscw3/XVCvsBXEJ2P
         Y5mA==
X-Forwarded-Encrypted: i=1; AJvYcCXkT65na3F00qnF2Or8GLyicKB51jfWk3/LAekMpHDPoD1WisDnThrptMpKH4vFhDr+hkKJ3lDc8TcprF+oSBCy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3CUePqU3RZ3VKrpizTYqX77676rR+Sc2KPth2xd4RXnNhYQ31
	6iQgPaBcGlXYRIsXIZvs5vVvDEGz7ktEj1jHaqwDD7P5mCe3MJ02mqe0ynKgfA6PddQ7law91pf
	lnVXm1gY2hDigfdWyxD9ilbDwUL+p/pmAsMGqFmT+dRlAPzNK0SRHEJ3rUJX+77/ZLUaJEoG1Wr
	T/AA==
X-Gm-Gg: ASbGnctQWsrQqCMTXBmDv8/OrOt5gFWy9WiOtDvT0Xkf2xU2orSbBuIBDLksiTTF2VE
	OyF3/o59LJGFHY8CpZZvkEvNIOwoydEh/Phr6Su3KVKQ0W7xAHnQC+K1gDQJqJFBo1vUieUPAWR
	o6A1N4/QGHSau0iKa/Skf4I6ESl7vkfRlQ5GX25EyyrQYE5TODrH/jLikcwwZzW1RYRYVJRHRZu
	QjJIKW9h+hk6CSSUkSlQFqLcYOu6r2V1Y4isF/UFHijA8qN8hXEV1CW++iLuf9PtLw9OJGjHN0D
	XIuaFesxasXGlGG0KddoGDf8bLizFqOox9G5STUTtmZG47WoN80ZYi30bCesg9UBtuuABeNe5Db
	pm2lF9g8WSXhQTjOWmR/i
X-Received: by 2002:a05:6a00:b4f:b0:771:e10d:813d with SMTP id d2e1a72fcca58-771e10d83f6mr11712097b3a.21.1756268454730;
        Tue, 26 Aug 2025 21:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbYYxd6uRKJhXpbWdWQeevt5PKMUN9Cf+ngWv6eWh3hbHw3ZL94CizAJIrwirDo4XyosfX/g==
X-Received: by 2002:a05:6a00:b4f:b0:771:e10d:813d with SMTP id d2e1a72fcca58-771e10d83f6mr11712066b3a.21.1756268454230;
        Tue, 26 Aug 2025 21:20:54 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f4072ac4sm4323076b3a.34.2025.08.26.21.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:20:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/3] coresight: tpda: add logic to configure TPDA_SYNCR register
Date: Wed, 27 Aug 2025 12:20:41 +0800
Message-Id: <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2DO9K6aLn8mp
 byQI2RZBeTgTGpIyM062lDzGG1KfeQellzPR2fzb0CZZezarjvGEOhrXLuhoV72/E5P9fNuAunF
 vuSr6T8fAoxXKQTd5Mc+bI+ygauOtGWehIwYVoQXURPwuZoksW7z+XPM+BU4Uu8LixAkmzXapwt
 ib0gXV5RwveauToemEhQ2K8HGmDp6aWHqLi/JLOEled1Ev1UALuGGiy6RLqbawnQTr1HlRs/zBf
 yWMQMeGR3TmO7ZKPmdEDsHIlu8h0CyX89PbUZfqj9lQ8uy5LjgQze4hu7UdX3jZnoncIKskG6ga
 ka/2XtRL9VUnoc8SR/ODZxkz5YtvMxfINRPKkfO1NTUDmC8xqpsLcvDCrD+8P5yP6QqKkkt2308
 4VEm6ALj
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ae87a8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6Dbyrv6SX_ztr3m6kfUA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ZZZriLIO_0dq5iOvI9DLAUsGYtA9QvDJ
X-Proofpoint-ORIG-GUID: ZZZriLIO_0dq5iOvI9DLAUsGYtA9QvDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_212058_028703_F7A1BDCC 
X-CRM114-Status: GOOD (  14.63  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNCR register defines the frequency at which TPDA generates
ASYNC packets, enabling userspace tools to accurately parse each valid
packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
 drivers/hwtracing/coresight/coresight-tpda.h | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 647ab49a98d7..430f76c559f2 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Program the counter value for TPDA_SYNCR */
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Clear the mode */
+	val &= ~TPDA_SYNCR_MODE_CTRL;
+	val |= FIELD_PREP(TPDA_SYNCR_COUNTER_MASK, TPDA_SYNCR_MAX_COUNTER_VAL);
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0be625fb52fd..8e1b66115ad1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
@@ -27,6 +28,11 @@
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL		BIT(12)
+/* TPDA_SYNCR counter mask */
+#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
+#define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)
 
 #define TPDA_MAX_INPORTS	32
 
-- 
2.34.1



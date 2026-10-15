Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1395ACC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=; b=kkmQ8foKyqKTze8x6sPyQkIk+A
	sSbVt/lCaHJ1L0WXwsPZfuEwxF/ot/7WrLypnMY95qzmMwQva4Ze2qonoQCeVcwNNtIdimtxi3Ibq
	GJfIqMP3gtuStTwJKt7gMDuQeipog2qmRpRGtG2OLkprUs5GgolSHNxcF628GqFNOFdL+pPet9+C+
	q0YBfGRuqCgYqYuSXCBHom/6L7dbEXfEegNiey3xcW28dYiOPpQxR0Lkw/sOXMWXE/toVLFNTq53s
	4IeCeef+QC1TJnZDf3QCMDprbbNUxV8cJ9O5MtgWK6Bkv2nwjb9vOeAobOCQ7CMFj2ZCUhhk5XIYS
	6NeBNeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBr-0000000HMH8-3C5X;
	Thu, 15 Oct 2026 09:55:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBo-0000000HMFJ-3zt2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:55:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9job53408870
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=; b=WGHK3e/oFJJfCbVm
	zR7C0DhEiSBbEr+Edr1kG8xyl8TcmnN2GSZiyFJkn914gZ151JRLlHkLtqdF1i2m
	tmFMoWXKH/VgoAQcNx1rFogXpLF3IOpvuoOcW6MOKbKv1pLtPq1SAcTdYQ8swfT3
	EkU0JFrrr5Fk3t4tiDXn59RkI9n/bGbIO9+6r0oXcAEzhU3GE7fO6utOqr5pRxjV
	DsELKiXj4sCktmVKAzrJ5h3uAU8C8FXGGnhbtPbXWe8hsVHZvAu5uZf8AGUQBNLR
	kyCnSQRvpBjP7bOn8WHFPdEjcGYwsZSINa5vP4JAH6kVcgeAjdm3u38OBMIhClIh
	e+oMVA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn254q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-156b5338d4bso1824371c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058155; x=1792662955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=Hm4kwWJBgEQ2cgtnq3HogAGKJffASWMcdH5PBL7VoQb/hlCxix48RRY+7BX8hCrQ2c
         cDsfhX5gKQ9coWOykm0z1coO0yKlJTi8ppGJXjOmyd9Fw5AtcMyz9uRZ1gKwkiTGnI/q
         i/sw3ONfBy/UWWiGGwJBOtDyGt0AcaIGfTnFEIWpUzcmU3UTcwQYX2Se8TxTvKxN7dhH
         qme65t3a0kpzONtjbMsi7+51vn2Z8YyDCXDgo8JDSE5w0gtZnSbd9qg+Ie7+k9hACAWx
         UNnJDexkcFSuH2AmjT5mp6EOtYHTrhlf7BcatJ3PECyFMiwHq+s74xKARmEvkfI388Dv
         N67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058155; x=1792662955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=q04zUpE01BKkyq8dltVj8v+m4l6VOES8gykUcbW/qflVrgtXsGgEuO5maNTdff/cH3
         wEuKjCNFmIoFmqHx3NRRDQ67MGyszIfCtpiHHWkdnxCXMBUMhsMH9/ljGOIxkeNhWfm3
         XB0SMgOihRpNziaXcdjJ6pStjDYYph+f1n6kFwnZoW6jNQ8rZAjclQ79nInGu0Y7ihMX
         Ms13tVgjGu+IB9y5vcq0rGkGVrCAteJxGQRXeMRP+rdWWbV2NVurW+9HhrA5OHKsWFGx
         2WaE7S5mdFQpgAixRM+h8rdK4+8av7wVIOLF6dsVeoxYhoAP37Aehe8jixweQ0/L6QWI
         qJ8w==
X-Forwarded-Encrypted: i=1; AKwUvBxKWp1GoDAVw7t5A9SrofLd0QigbyCoGQLbEYjuK0bEdlCZj1GwUsPnMlhlAVeEaAL6E1d9m8w38l0a3GkAXmA9@lists.infradead.org
X-Gm-Message-State: AFq9FYK2FVbJAKEbnrfKdSvweZ0nwZHAu+zagdKwxzRd3K8WK+ddHr/3
	kJnkcqJ6OjrMUYzdFLlAI+Gow+sN1V4lBEYyYTyaWSJjXtPNkW4IG6o4M0lwtM1Jaj+I4TPg9kg
	xBYu0OMvQVjgh0PwPLjAVsPknSapMFn8EC7tb5gX0U5+IY0QXbSbkZt91lvSteZhyZO3kSBKoXf
	oCIw==
X-Gm-Gg: AYBFou02dB9mKEObxpHnYO3nNRY6wH0ozEzzdcfJP5+E8EShqA71a9wpr0CGfYf1Uny
	4mu7gZNE68nLFoqI7cGoC+y1OsdD+MR4VLF7p6z4WDXfEcOOYuzqsk0X636jUF0yVigFv5dYIp9
	euWLRcazu6foKjc7/9K/uK5G5BroAgfrJw6S3l6ip7FcjUJ2o57PG9Zk3vC/2AOKozCEGQBNEAB
	k173d3oeMFEdPZJZy7w4RXOpQ+Wz/7CQ8Z/ort1/9IAqp3CtIB3lAt4nep7Y01tnPKTalDXmDpR
	xGbeTfnKZBqiJlx+EuwxaHb2aEGzeVyvvK0ZkwXZTlV3zygMXh72Xd6xEwj+rf/I4Nc/eEhUU2I
	IX13tkNIPKGABBAgS7QT+s+UHrCvP
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935754c88.36.1792058154509;
        Thu, 15 Oct 2026 02:55:54 -0700 (PDT)
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935703c88.36.1792058153000;
        Thu, 15 Oct 2026 02:55:53 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:52 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:20 +0530
Subject: [PATCH v2 4/9] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2879;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QqnyGyqGJI3ins848hnKP9SiU5N5LGOKRYQENWIDFSo=;
 b=kUj4K8H+/812w8y6hk9u6q85CN/ahAHrvTJngEOXl+UOJ9VSCJDKg0/Hx4noIeGANDsRbNLYs
 riFLI3fhEWVC3QMd2zS16g5/S6w7OE8Bk4tO+5zTwdrK8UW3yAsgOde
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4IK8WOpEL6aW
 mV6PJ6BDyKocZx+tmelV6OvGP4mlfqghMUMBZvD4uuVSzjM/IrIyb6LEco/+Az2W48Hq/Ll0Rti
 wIy7nfD94waDHb0ZQgowA8e//nN/5LdvoYaWJ+/oyi+zT+L5Di6c9HPIcAo0gYpSaZOBfHvZukK
 Aiwm1sjelSkg5HvRkUO40IC46wNsEbyiRqnVxRJKczPLMZVKF8raGMKmYVyqOJy27I5zp30R3rj
 Az2VJJWgD5pak+JDOMFZZpdCAYWsZHmxM1M3cBHEw412C/W9e4bQGY1ZPgsKuPg4LIjk36u2KA9
 yHckw7dSGoL+qXXnfFWWBqKBZ/6KUaxH5hE1iYve67hSAhuYJxcbg9IDasb0ekbYz7G3A+3huDj
 01gldxCo/dRSKQa2K7/ZZbyepeEff75/WwOaNh9LOPjrjGo6H+DfUbNXzwOdFd1GuYLUf+3RfBv
 BLp1F063lNVsLK5FFzw==
X-Proofpoint-GUID: oDeWrnhFtAdbXvWXQhvujZVafwoDOoIL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXxkQq/8etrwLL
 xehuPLH09tS785uIModfM26XJNczHO1ne3gquTYh/DVUaSKbRvbF13A9DhtS1/kVQGPS1hxKPgF
 CF7twapxXhNMaTg5VxjFXw80CpJAKHA=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a32b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lTbGvRf64-BgIYWFXWcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: oDeWrnhFtAdbXvWXQhvujZVafwoDOoIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025557_140252_C1565110 
X-CRM114-Status: GOOD (  17.71  )
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

The vMPM layout starts with two timer registers followed by pin register
banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
number of entries.

Use qcom_mpm_offset() as the common addressing helper for both timer and
pin register accesses based on that layout.

vMPM has MPM_REG_* values represented as contiguous register IDs,
hence replace the macros with enum qcom_mpm_reg and modify the accessor
helpers accordingly.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index a37c20a20bed34d4f55fbcc950ba39ab9799b7b5..0de6ce818a506efc07913b16c479b5d5efb15108 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -64,11 +64,16 @@
  *
  */
 
-#define MPM_REG_ENABLE		0
-#define MPM_REG_FALLING_EDGE	1
-#define MPM_REG_RISING_EDGE	2
-#define MPM_REG_POLARITY	3
-#define MPM_REG_STATUS		4
+#define MPM_TIMER_REGS	2
+
+enum qcom_mpm_reg {
+	MPM_REG_TIMER = 0,
+	MPM_REG_ENABLE,
+	MPM_REG_FALLING_EDGE,
+	MPM_REG_RISING_EDGE,
+	MPM_REG_POLARITY,
+	MPM_REG_STATUS,
+};
 
 /* MPM pin map to GIC hwirq */
 struct mpm_gic_map {
@@ -90,18 +95,30 @@ struct qcom_mpm_priv {
 	atomic_t cpus_in_pm;
 };
 
-static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
-			 unsigned int index)
+static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
+				    unsigned int index)
+{
+	unsigned int reg_offset = 0;
+
+	if (reg != MPM_REG_TIMER) {
+		reg_offset += MPM_TIMER_REGS;
+		reg_offset += (reg - MPM_REG_ENABLE) * priv->reg_stride;
+	}
+
+	return (reg_offset + index) * sizeof(u32);
+}
+
+static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg, unsigned int index)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	return readl_relaxed(priv->base + offset);
 }
 
-static void qcom_mpm_write(struct qcom_mpm_priv *priv, unsigned int reg,
+static void qcom_mpm_write(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
 			   unsigned int index, u32 val)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	writel_relaxed(val, priv->base + offset);
 
@@ -142,7 +159,7 @@ static void qcom_mpm_unmask(struct irq_data *d)
 		irq_chip_unmask_parent(d);
 }
 
-static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, enum qcom_mpm_reg reg,
 			 unsigned int index, unsigned int shift)
 {
 	unsigned long flags, val;

-- 
2.34.1



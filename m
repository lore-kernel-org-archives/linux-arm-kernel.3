Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0116ED74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ab8n6/GS6eVSf/FLptHoKCvIaCbyi4cNEJs+a9kC3Fs=; b=0SUqtdWnX3DEr30MpQtJd3GOK2
	A/i3SqABPEv3GRRyLQf69vez16EVhlARSNtxY+EkZdKBb/Lx4mE3R79/b6dGK6xSqZvuS5cHfJZ4J
	UdZ46Qz3NSr6dj57l1bS5MeBB2yjDye75ZTFgf+rbh1TPKKgkEsez71kuP61K9ZCPMQiVmsiLyT/d
	jYFiBDbGVGTp+RB6/xFufB0KLlYBSW8Bq+tBeLHDtRM2lWBoK2F5FY+2fuWMY4hslF+kxRS5q7n7h
	dRR05hB3+CjJ0DvCpNPMkJkdyyDK491Tq4bifzYBo/fim+VEJQyfCV9oNBivDsypqx8cAgNKxILSi
	tpPEmBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXMH-0000000A0cn-0u0O;
	Fri, 19 Dec 2025 10:05:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXMF-0000000A0bH-0FW6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 10:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ab8n6/GS6eVSf/FLptHoKCvIaCbyi4cNEJs+a9kC3Fs=; b=l5L4NUutMvUPx2AIH6jSJb986J
	bKGt7EsjOXZwHciGmxx8GvAUsSVEvn+f1QUXiWY16nK+IcAe/bx8LnmapcgY3SO0djsewNJGfgygF
	UfWq6CVBpRf2c2hpnvFf/8BU1Tm4RiPt1oU2dTMo6UrESdL3uvgvqsDMFzuSxM2urVeQ/YPSyiNsP
	awDNR+NhHu2095CSzWT/wLlrZeMTGpMUtsmUmq2syUvBW4EU9ec+mDKrZVM6nsjzBBhlpt6EoaOi5
	9WmHW5dNI28iPuyxrS0qAFGhac/9j5a/W1Mu5DeSFFe5GMn8b0rWm6IeDUyMI9hmu0tMOcngXIYL/
	qiEvYpLw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWUj-0000000AXcl-1EkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:09:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cOO84145756
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ab8n6/GS6eVSf/FLptHoKCvIaCbyi4cNEJs+a9kC3Fs=; b=oe4Gj1O/m/1yE1Q4
	Qd++39PWMzSJw6WXjRLXD6ETpbpHMfctu2KHUpZXXciznsO5vTUo9qh9XZ+pxxCb
	Mk9VUBOzki5uPkcT9kmhlof+MDtzjmq4vb4iFbj2qDoOmXIqFGAppHa94U+KaGix
	9CUdwRmZSloYP80c2D/a176Kda7s0bo6OtAHVqzpeDJ4HtzWS+OJDIyW2Sm+CTzN
	6G0/G0vOT3QSHgoHFCFlXS+LpKNs1LwgXUa1Y5TCykIgGUiJbhGZN+HZe3epGLzP
	2nW1cJIo7SIsk1zD+3nwnuQNOedZLJ2KllcZs2n9rS6mPJjtYCX+KpYwlIBaP0n8
	XC67ug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dt8mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:05:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d59f0198so22416105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138702; x=1766743502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab8n6/GS6eVSf/FLptHoKCvIaCbyi4cNEJs+a9kC3Fs=;
        b=eJ1vNrXvuuqUchmympz7C0ai8XOzOgKNQhGTmLJMMuMbRyjX42dO1iBiCRl1F3KtDi
         DoeOo6dDdvWeY8kA5WdR9ms4puGXyA/IA6Plxj1DuSH6bt3PF5OjfxjK/fsg6BIxxs8Q
         nbqXY6P+veYBMFioH5EcHqQkTTU8dXAMeekifgxqM+hLQ8FMWjL1sdC0G4HpaCsSELHI
         1YMhEPyv2VZG2wRPc2pCoqGHNGcqN5MoC4D9AmazH833f7nORpkOeTtnri98MG3M7TQF
         Pf0x0po97vzEQmdic2kRAe2US9E6sVfgOKU21cu3h7okkkXYzQxXxc5TqiD7EiOMYgpe
         +CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138702; x=1766743502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ab8n6/GS6eVSf/FLptHoKCvIaCbyi4cNEJs+a9kC3Fs=;
        b=phu240jHZiVtQa9YA4tGL+InZcroybPD2Cb7TKY9kBDVIAWUOnLFsvpGmucylupF9x
         E7MB3raZS4fluWcjuvEUYEeZBUiHi0iAaVKFnFTmeJFoMpQXdFLomkwU+FGm4q0cE9SE
         yiQbamlSIH9H6B61nKtW5r2Kg8v4R8PWYke/ErHQ8+FvQG6V/8vYjWpp6qSdFDw3pSzY
         abjcDYcf0N6OmO4KtGW08uuoZhgBtQOOLwHN3eFX6Rh2D/uGB5SABHNP8lzc/T7i4RA6
         I9RKfcFt8DQjcZV6jVn3bS05IWr7sIaz+RzJ5PsDXxxaRoX4v7m4w1PPPaB3ntEzQouF
         f7SA==
X-Forwarded-Encrypted: i=1; AJvYcCW5bdPCsuVFnkpzQ5TXU+u3hNGi15Gk9R9BAxG4q3qwdCYEViHSsyL3I9nE4cfLO3/p+Ot4ec8o+i0gu34GFyfI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2mf82GlsvEWggHYfHA9V1R68LZ8IFAFn0mr3Z2WvGO20fG133
	P1hC/Nwv5OE7d600kcO3UQYr1Zl0/32f/y9VXachQTNOGPW6npy7CXtrYV+3+dgpVYH13FAwu/b
	PgMbnsH2Bg0cPWEaLyPKHWPPoD5pHsXdGqQ/HT6D0KLtiyIcfuuPdOTqkKkDyQj7O8kw7S8xOSh
	hmKA==
X-Gm-Gg: AY/fxX7yNTU00adeQvgpPc28qQRqqLnub7dzu/Y3cC22i57uzgqMLrcZ6dJ706qiia6
	2JSqBftn85YqymKeYcHWAsjvTv0poTlxyDULuo/yWW+4LBXPl1lJeasonIlqSE71Q4unC7Qh+33
	IQ6hTb8gO8xJxN3HnfOFtIiqiEflaWZBhTfSW2ukA8o5rrsM5F7Q94cGsiXenWkc9y5SeueZxyr
	qV2GAVKEANQYBB17a4KsTrKNcgmg8QWHwYCTH5OIX0xOVuS14y9QhtDF3nUVCsXFEw+ofI8g5SG
	PgIDqQ3+BTOntJ1Ttrsy7R2IVJ9ckicw9bK68gheE2OnOcj9ORPq289CEHH2L+nVjPrnWxGREhH
	LWv2QIJ5SVLjO5YVx2jhKtDBwf2UFTppGl4zEbTZRvP2svLKfCepi3//r2m3X2r3ELmTMOKZd
X-Received: by 2002:a17:902:d2c5:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a2f2222cf4mr23351045ad.19.1766138701808;
        Fri, 19 Dec 2025 02:05:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYTTH/VrDxzTO+shOrmelrL1W6nim9GDoB2RRSStMvM1Z+qcEJ6C5TZ456Z+ug2Xpk3qx9nA==
X-Received: by 2002:a17:902:d2c5:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a2f2222cf4mr23350665ad.19.1766138701183;
        Fri, 19 Dec 2025 02:05:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d74bbbsm18164435ad.94.2025.12.19.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:05:00 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 18:04:20 +0800
Subject: [PATCH v5 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-add_sysfs_nodes_to_configure_tpda-v5-2-ca93ddfe9d30@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
In-Reply-To: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766138690; l=2243;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tAQqLfVJjIgiBKBUDDikpS2noZr3Yoee6JpEOmQis8M=;
 b=TtCZVkK1yJHGZweOIKUHHueHMgsJN2lVMqhkPDZJcElX7ciJpi1wTnpG7eOVL3Dbo086L8Ov1
 MNEq009IHhiBKaNbk4nlyQ3WaQfKvrLI3dG0wnRIUYDiL3GapHMcYK4
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: FY_9iYeXPABdKOrgHQAXc-TV4kHmyaWZ
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=6945234f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=6Dbyrv6SX_ztr3m6kfUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FY_9iYeXPABdKOrgHQAXc-TV4kHmyaWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX/YDKMSEdnpjO
 xO2WoUvHUz1WQ7XwY6ZblcVXAY8y7t2Wu9Xi3SgO4p/LdxlpwgB6a7nvUjg0dXDfKLHDRDmgqsH
 9vL7v6Z+jwCs1/dBZ7Rpgv9LndnWEaR2yhCgXvK5LeSjusc94ZLyfhqxIWgsByMejfCGszlRlJR
 9GovWZCX/OTD/cDA3OyXslEPbeY3uovwGc45pNX3tPjmFCVrxTom6pLH/+2Ievo4+/UubXv7U3W
 XdYb7zs2ufR4mE1Cnfb6HdBiJwayqLnDQNnCAnjqbDLQa1k3Pi2VDB8D9PjGrDM3d7MpAyRMSBk
 NGzsxojo94IzdlviF7aNmnCBKloqoa4qreq3jA1mCcCPejnStmjI2/IIemwnUk7M+qY6Pnt3e3B
 W4ipSrgfsN78vbURfBjOZMDUFGK1uVcWJL0GVRHqNw30w0cLuhLSRJxTYb7m1lBIqFEX0QKpYyN
 A+2QlHsJOYiUNFylgrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_090953_822900_3886F4D2 
X-CRM114-Status: GOOD (  15.26  )
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

The TPDA_SYNC counter tracks the number of bytes transferred from the
aggregator. When this count reaches the value programmed in the
TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
tools to accurately parse each valid packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
 drivers/hwtracing/coresight/coresight-tpda.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index d25a8bcfb3d4..d378ff8ad77d 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -163,6 +163,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Reset the mode ctrl */
+	val &= ~TPDA_SYNCR_MODE_CTRL;
+	/* Program the counter value for TPDA_SYNCR */
+	val |= TPDA_SYNCR_COUNTER_MASK;
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 8a075cfbc3cc..97e2729c15c9 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger Global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)
@@ -38,6 +39,10 @@
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL		BIT(12)
+/* TPDA_SYNCR counter mask */
+#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
 
 #define TPDA_MAX_INPORTS	32
 

-- 
2.34.1



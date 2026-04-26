Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28B9FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhUmUF4vCsrhu0gLOmS7LtwmtfLWZkig00mssiTCx3Q=; b=p7kQvuBLMpgaHH6e0WRsLdCgsD
	/rATa6FIUDG80SSC7hytR9A1yMq5fsieGHyrVSiWvYlOAXj/DQjKaG7uRuAkWvL0TTIOEA6lSqArm
	lnmC8NuXOTHNGKZIB/DxmN5xrM4rspAP5vXM5QXXSbayga0HKKoi6SCSZdIDoiSyR7YgM+w3ddT4u
	atTo7MtpkFqtiRQ7P/APw6SAGDDrqrSuAwrioAXSW1XQcy2NrLgNDl3sybsOpnB82fzxItHawJFGF
	qpqCRmaS+oPsnYsXNoEuoulrT1LZb/etlzze4BNgUP0UAhzq7ZBCJrcHEYcIaxJHWggkjfBtmiS1m
	watLzQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw38-0000000FPQi-0hfm;
	Sun, 26 Apr 2026 09:45:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw33-0000000FPNn-12mC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 09:45:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q2A3Bl160371
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhUmUF4vCsrhu0gLOmS7LtwmtfLWZkig00mssiTCx3Q=; b=AIt8Fr/8ewSYKA54
	nt5By/O9dbx7emqcGIw9DM5cok5LVPNc3hvAB5UC7RVNKlsq/FPIrn8OnC6hYl3H
	L3rNYfaiOgVw1TV+DUzboNYHcmkshzQcuHEpPNpm/ypbW5KsW/Ii+/XQvvN8iWK7
	x4h9XfaMqlCpGn90nH7vq4gYbeYOi+M6fV2I4XtS8lueFKdABnPlT3yvL+swkjSK
	jtplMPmboU+iwN4BI+84EWZm9iX41UXvP9oMfboOD3eQ8hXDEp+EqfTnfeU5OgR3
	p9wbkaf71m4gPW5OwskmDz125QFwRyWGeEcxCtAcqVeCTCWCkUkb4w2tINCc+EFP
	k2OhyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtammd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a90510a6d1so74402705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196708; x=1777801508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhUmUF4vCsrhu0gLOmS7LtwmtfLWZkig00mssiTCx3Q=;
        b=Hc6aFPp1AP2/5pLy65+WPyxXqGbIfr43SbbzPNIqHbC9bQAz7nXgBr/fsDfiPGWUZU
         iVXbsjyVSDFmIhzZtNPn5gAUn8cj/d7dAkd+7wFWKm0Ex94TmP1/1sSZ/00CD4mrhfyd
         eNG8mtaRtFkp8PtffCx0DjgzOtBahFIeXOK0UOtOifnwWWm2116mLkZcNPTfg8viykny
         LxnQAaDAC1p+4B48CQXn0uyGiSW9TU2C7Bis6IfPLZWq7nIz8ktaeRgwtXER/LAyv2uL
         zrYCcDtScE+j+XePHCx31zTKrqMHe5q3STXbbze7Cbhw0o4uYOCxFSFO86E5cjAuXWLE
         BdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196708; x=1777801508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhUmUF4vCsrhu0gLOmS7LtwmtfLWZkig00mssiTCx3Q=;
        b=TckX0xwOyZ/q5BfnsvvfGMSLojvzgpogq0bvC5I08cNeSULanBCoQC1/hwzODFGho5
         K8wMH/ACBvYmHMkTbX0TqBG2evAZsWQFB2K+Qml2nsl1rgMFa8oHIildQuus9ksSHOCF
         2ZhV430SsuuTTii3hp61+8zsd3j9YwatlqVkaaBjrIfqLCawRJV1PMBWEpz2npMtGAxx
         0WMHmDlMkVeV6I9+Jme4po1icq+pI2qEH4WNTUIp0ZFo+ZeLEe8iD3+jKTd6W9fjsFNA
         cxpo7YH80lDKvYqYh88gRhV9Rg08LH01IgpSMgpInN8C4FhVbQk+5Df8H00LIq0pnfDD
         +CYg==
X-Forwarded-Encrypted: i=1; AFNElJ8RzWiw78kzqUf2FNR2VT/qXu/a0ipHEtD0gN3rke5K9VjUxBvpfny55usAe6H0m/SjUUuwEik2mcZs+hwT6Y2Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yykdd20U6GHLK4PmMTqbq8TYfwimMGKj8RbB2SvOTOMx9GMDIGO
	mK1yXA1ceY19Tdf4hsusrMmsva8yLiEHgMkYELF9aaTrAsHtp28oD/50GaG3zPkI8vviOWsXNhZ
	G3FiCDc7jjsJvHxh/fZy2cDMFx3FAFqoEDyobH0QCI1B/3wbvM+q2IwndQHSWxwuD6HuZnQa0pI
	ywlQ==
X-Gm-Gg: AeBDieumr4V5jZZOq7SNjjXjz4BvT6+osR4Mk9Hu7/DjuvmW6TMOSGL5THsn7WbiUfu
	hs+uYV9czLVUyvWRwqpmFTn/s1W8Ef36qmuYHQoy8+Kcv3RMzJLmekOm46PHqFjSuRbB1h+JimL
	c2oPskwiKd6hO+iy/gbgD3Cx4PIbZjMHP7QP1uqO8okVyblJ36h+rzConlPEvlfRHibImKOAZ6R
	/FZYNSDouigkCm7FyAR9+hGJDalNBIXZ6ItSXDqQ8ZGBNXR7ufR4Ae+t5UFbqbdKXyk3vwmMxPP
	9AkzZHkqXv/cXzA+E+DjQ9fF8kjLngb9OW1uUtzhrEhO1HsMFVCmokKpFYmElS/tm1lIdtAF+Uk
	hDlYotVnOooq1wnreNzJfrHSIvlBjE/7yEmMtApNoaIGfD/sFF/I8d+KtFZo9Vtv35ceOv66FJa
	PqrRFHn0t5tKjpz96CFDDQKXa4
X-Received: by 2002:a17:902:7595:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b5f9ea84f9mr242443845ad.19.1777196707953;
        Sun, 26 Apr 2026 02:45:07 -0700 (PDT)
X-Received: by 2002:a17:902:7595:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b5f9ea84f9mr242443715ad.19.1777196707479;
        Sun, 26 Apr 2026 02:45:07 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:45:07 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:44:39 +0800
Subject: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=6125;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=RTsLaYVLZsWbbMOZumDU3n539t32lNjAo8QQqqvI4Zo=;
 b=pdxoK888+GzGQuMMx9eZ2XIJmH6NZuYJ19tPDe0spNNCZ2u7wlKxqg4BiVWFr//D+1IWqosX+
 fSayxSODS08Ape0rthWit7LG6odGbNnSk2tQT6QRjDFoVSP4n/eWFSI
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eddea4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JIbpoTx20AKeDh2nFAsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: BDSf_mdIkQHitNwO0YAcFE43aF0pV_sG
X-Proofpoint-GUID: BDSf_mdIkQHitNwO0YAcFE43aF0pV_sG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfX7SGlmn7RQAJN
 rz7Fv+HI172w9W8oHkis2FgLkvnZUat5WNxxs9EhBrRw2vboVwij45qpDmZb2CwYvYqivQEKmqb
 vrvnEv8ZBuFtwnOBf2Jgnz+IGKIGceogSTr/t9OxvaMFNcAbGKisCCL1LV62BVaGdXoh7U7yZ8Q
 Ge8+TpD2+HbSFKysVcE4f1liMeke6BqsweGx41kWlJhhgpb/iStbZj+bZATs4wOCcRb8/VxUEZK
 DFd7jGFmbXtmYiyePRD6e98khRbMuwqEoWRIo3dY1xriuwWB38jaCEe+9LziiKYU1m3XETNGqRo
 NkcqygXG5q62rpVDlcO9KFPdu2dbESLlR7PTvxge+gBgSXBvCXBFOtjTRlWG1DncZqtgOwfnuIE
 ChcXVogBOUVT921N+dgF5pe9skDK4Oals/3qBgTVOjVDt8TClnomW7p34LGrvCg8BzzaGOyqSO6
 UK30z4GZFDNpW9zvUHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_024509_297761_193EB1E0 
X-CRM114-Status: GOOD (  19.96  )
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

Introduce a small encoding to carry the register index together with the
base offset in a single u32, and use a common helper to compute the final
MMIO address. This refactors register access to be based on the encoded
(reg, nr) pair, reducing duplicated arithmetic and making it easier to
support variants that bank or relocate trigger-indexed registers.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
 drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 4e7d12bd2d3e..c4cbeb64365b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
 #define csdev_to_cti_drvdata(csdev)	\
 	dev_get_drvdata(csdev->dev.parent)
 
+static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
+{
+	u32 offset = CTI_REG_CLR_NR(reg);
+	u32 nr = CTI_REG_GET_NR(reg);
+
+	return drvdata->base + offset + sizeof(u32) * nr;
+}
+
 /* write set of regs to hardware - call with spinlock claimed */
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 {
@@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
+	writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
 	if (config->asicctl_impl)
-		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+		writel_relaxed(config->asicctl, cti_reg_addr(drvdata, ASICCTL));
+	writel_relaxed(config->ctiappset, cti_reg_addr(drvdata, CTIAPPSET));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -127,7 +136,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
 	int val;
 
 	CS_UNLOCK(drvdata->base);
-	val = readl_relaxed(drvdata->base + offset);
+	val = readl_relaxed(cti_reg_addr(drvdata, offset));
 	CS_LOCK(drvdata->base);
 
 	return val;
@@ -136,7 +145,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
 {
 	CS_UNLOCK(drvdata->base);
-	writel_relaxed(value, drvdata->base + offset);
+	writel_relaxed(value, cti_reg_addr(drvdata, offset));
 	CS_LOCK(drvdata->base);
 }
 
@@ -344,8 +353,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -365,8 +373,9 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
-
+		cti_write_single_reg(drvdata,
+				     CTI_REG_SET_NR(reg_offset, trigger_idx),
+				     reg_value);
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 2bbfa405cb6b..8b70e7e38ea3 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -386,7 +386,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index), val);
 
 	return size;
 }
@@ -427,7 +427,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIOUTEN, index), val);
 
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index ef079fc18b72..dd1ba44518c4 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_CORESIGHT_CTI_H
 #define _CORESIGHT_CORESIGHT_CTI_H
 
+#include <linux/bitfield.h>
 #include <linux/coresight.h>
 #include <linux/device.h>
 #include <linux/list.h>
@@ -30,8 +31,8 @@ struct fwnode_handle;
 #define CTIAPPSET		0x014
 #define CTIAPPCLEAR		0x018
 #define CTIAPPPULSE		0x01C
-#define CTIINEN(n)		(0x020 + (4 * n))
-#define CTIOUTEN(n)		(0x0A0 + (4 * n))
+#define CTIINEN			0x020
+#define CTIOUTEN		0x0A0
 #define CTITRIGINSTATUS		0x130
 #define CTITRIGOUTSTATUS	0x134
 #define CTICHINSTATUS		0x138
@@ -59,6 +60,17 @@ struct fwnode_handle;
  */
 #define CTIINOUTEN_MAX		32
 
+/*
+ * Encode CTI register offset and register index in one u32:
+ *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
+ *   - bits[24:31] : register index (nr)
+ */
+#define CTI_REG_NR_MASK			GENMASK(31, 24)
+#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
+#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
+#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
+#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))
+
 /**
  * Group of related trigger signals
  *

-- 
2.43.0



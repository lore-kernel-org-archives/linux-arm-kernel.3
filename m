Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E48CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlXrJ19cElBVoQJotftVXbsvkzmtln1OW2fGHdfpZ40=; b=ZGmpAwjh6hUB5Ooc0AgS4KQsYo
	8lZ+HfjlC1Ek3QFLOhi+DViCli9x4UrplIKi8mgLM2VFG/omT5CVIJUCq2ZCI1tpvz0ORC9zfxCPG
	D9T/XjNaRVEeic4an/0kO7KUoNxNT3q0AJ4+A3D3x4WXINdSIY8X4ARhJKyi+pUV6eSjE6OuXTrk/
	rcYjjeRZq2TDwvBKodzNpAL5W5BujbZmakEuCoxu3h6nOg4eOl0SauK0L8h3pXtRRFVzLb9uoMGi0
	hJt1hdVtotxA2bXsy36jk+hgTbufu38Z6trkgmJVmhSY9iBJ9xKxYJTGLftgvf0Zh1yMKQmUgXNBn
	0TMOci4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Kc-00000007heR-1acR;
	Thu, 21 May 2026 12:16:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2KY-00000007hct-2qRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:16:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99k5T3343457
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlXrJ19cElBVoQJotftVXbsvkzmtln1OW2fGHdfpZ40=; b=Pd63I82PIt6k3JMJ
	ovQzlSINDchjmPPGGkmTg6EF5aPF1ofBKiL2yGXJeP2kq52RheOGddWr7RFjPhUJ
	5BOdRPlLQnMkcc3nql5EjwhZWiE8JkAGs96R54bhNKonpqcKu+FOdOr7uYSj6sbI
	uXA4p/a36refdJXHa17hu6+g/qUTEsKFxT/SQOqqhCq9TmsI7hBrxC6Qk5kpheC1
	UlebLuptaR7NQB6Awcy3lcEgSdkrWdBx1MJhD23nx1nCbHLa2Z5bh74omXBROhLs
	6MDMWoFE/yo91lTnutVwxYyJx2x7w0USx1ALbqViB3bjd0YrGHTsEx4Efbl1cTM6
	NhIP6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahs7ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so65582715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365809; x=1779970609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlXrJ19cElBVoQJotftVXbsvkzmtln1OW2fGHdfpZ40=;
        b=S4eG/NyTqZ1XsQK6WpwLARr0GcS+ItpazeJfLVxLhT0A4MHOMLFbBRKwbWOp5treo1
         +7LO+YY17r01mvCWIVWqY2teyy97FMfQ7jAEFDREeKHU9MyzUtfsKEWcgk01K2Oqphaj
         1VXSv3jWrVanz/N/jSLR0rk+yS/E2HPGNho2olwWYU+AtqIG20DdAFn+xW3je12f9MwG
         94r2drEV8ZlRz7T9B1Rqrqg45hgBV0WM3DrQEiP1+0cO4dab97X9ARGiLh3yWo6VGXDr
         WI87fdWGBdOQ/Sr+4CRKVmxC4kxU9hdU8YietATP3TYeGQKLnTLhUasQNIEQGk6wUasH
         6a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365809; x=1779970609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlXrJ19cElBVoQJotftVXbsvkzmtln1OW2fGHdfpZ40=;
        b=B+gJtlFtFiOoGhTB9pDEYukXaBCuWbEgHyhYgro4kZHsvxqUIvmeo5qFiq50T5KHq6
         SzQ53vDs1bt3G0oOhdYWY/6z2L4J9+7dYL5qysGJNUYARzn8iBbX6/pA7idyLrQGdpY6
         H2lHZd0ulwt+CNqATaL45W6IfMtnJpHSQJgkIGO69pmIu+TX/s72FYeFcTImppno+su+
         CcrBDIkyAfIMUrsc512cxH2QM5pTTEQ/6m69u1/YF9LS+tb/igG3IHmnnGG1nBaIes4O
         Z+Tvl9QvrXnLbnIZMeTZgI9eWUVHYoB8CEyrvunJqqmOlvd8D88HvzC9GoHISkFaJ8kO
         LLPw==
X-Forwarded-Encrypted: i=1; AFNElJ9tuA/F3Tbu6UjnopuqDdsNMPECz6hw4S5dDrCk70FuxImNMrsEhqj2UiJ5saOLutuu+C454krKXz8NCBPPEYvX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+H/fLvRR4gJNy/apQnj4Rx4k2fypxu7GGriJSbeV8CG6Tkhlc
	bL8hlMfbXtu0h/MfTr9AYuOho02iNSaE9SU3SMzZ0z6azozJaWQ31V4G7dWbVFOvr4jGLviyw5r
	ZrwRU6mFTuWWEO79Kd13qMQmDWHrziuDdxh8vV+jcY25MgSqQAL+xlQQehzBOyLkoPAQmij/t14
	+iE8YP7IqOug==
X-Gm-Gg: Acq92OEhogeJQhBuilI6EJdwhhwNuXmNw2KhqzECLkAG5Wpu2H+WQXxaxJZlWkVbMJ6
	FRqGFNsJcOqVorM9YKlVWculWchQKaR8R22ERG5Xd5evWvK8zm38Bja13QVccUtQ83SJW7TNvk8
	tJOWWXzTMa9JX2KNjTESFq/+dpDe6sn0TpZnzWjXWuGWz0E05JuFi85Lv71igUoHC24+/pxFm1X
	QNRJtgNuxPSDX9IauvACmbRL3WSyMK/immMrXEpciYs6TXF4xGGX+CkRHA5WYPQGHYXGiEMTEzY
	FoG4gbRdDSBjMrSAxZW2ZpTb95PalTfJ2xq0pTL4vJtxfwO/0xM48nlSmdNXQHXcWFQRheaBHGr
	nhU0da+TUY3jIEIUla6hWIyspCXzsu0ZgnE8rtBqhACgrnNQkjR0qubF1ItYFaiJmvOy3Yeg4Pm
	XoYKUaEdKk7qqyUU8ZdoGJoTVU
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr26744615ad.12.1779365808506;
        Thu, 21 May 2026 05:16:48 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr26743985ad.12.1779365807798;
        Thu, 21 May 2026 05:16:47 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:47 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:28 +0800
Subject: [PATCH v9 2/4] coresight: cti: use __reg_addr() helper for
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-2-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=11278;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=uAYfnyo0Xvvg5GFBPhaeuqlaXDVeO+2ZkiWWYOhV0r4=;
 b=LPfKwaoDbg4PbiMw/qExaph2kl97CTQVkz0lCR4v+U25LOhuJAZ45nIgrh50t2K5ApDwRcUDD
 qeaTMxA+Jf+CNafTtuToR8cEWgs5jf4eUEUNvCc4TFI9DwtmZwkeWvJ
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX75epJEZFvRC+
 H9sRZa81+JZBxeND9l+z4W08laWHEziAuXKZU9LlAL08SdaROk658Xlk1Q9ZA3IlHRP9E6Jcjha
 HFSGBazf2jUCUB2+7Gz1jj88QhHPOHbPnavcZyBdd8UPeaEAsC2xFCUCRf9sEaR0vUfzpJc+pd5
 vhjNsquWNaWwsz2oRP/SzI/uLpWH6UUfY4SaaGQCGjwreo2KKrZbCAxHdmpVAW0yHlo46wZ/9gS
 8OJqCd96fIUB/bvLUABa7nM7lytjwtOAeztDOOGk2fLFlm3DocN0We9wDjhZLD1fNZMtztiXRPJ
 XVbsD3hOze1kQSObpJqXB/KJBYzSH6LvQl7z5oRI9njRUV37L3ekz8X10XE0ddQdN2KiCnzfZjw
 /6Lt1L/tPKsKmWXb3n3teCHweQE5qZRbv7pl+raTzpwg2mX5SawUOcspoDfodw97mzUiGYSDoNW
 LeLJCEvngvKtUKAiZ1Q==
X-Proofpoint-ORIG-GUID: AYn8dqyfpgXxd0Zi1NdZuZKa1mkhnmeT
X-Proofpoint-GUID: AYn8dqyfpgXxd0Zi1NdZuZKa1mkhnmeT
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ef7b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0ZnVAlcq1A6cFeWY3PwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_051650_855237_F1EE830B 
X-CRM114-Status: GOOD (  20.63  )
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

Introduce __reg_addr(drvdata, off, index) to compute MMIO addresses
from a base offset and a per-trigger index, replacing the function-like
CTIINEN(n)/CTIOUTEN(n) macros with base offsets and explicit index
arithmetic. Add reg_addr and reg_index_addr convenience macros for
zero-index and indexed access respectively.

Extend cs_off_attribute with a u32 index field and update
cti_read_single_reg() and cti_write_single_reg() to accept separate
offset and index parameters, allowing sysfs show/store handlers to
use the attribute's index field directly.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 45 ++++++++++++++---------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 25 +++++++------
 drivers/hwtracing/coresight/coresight-cti.h       |  9 +++--
 drivers/hwtracing/coresight/coresight-priv.h      |  4 +-
 4 files changed, 50 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 4e7d12bd2d3e..c5cc2706e241 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -42,6 +42,15 @@ static DEFINE_MUTEX(ect_mutex);
 #define csdev_to_cti_drvdata(csdev)	\
 	dev_get_drvdata(csdev->dev.parent)
 
+static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
+				u32 index)
+{
+	return drvdata->base + off + sizeof(u32) * index;
+}
+
+#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
+#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))
+
 /* write set of regs to hardware - call with spinlock claimed */
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 {
@@ -55,16 +64,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       reg_index_addr(drvdata, CTIINEN, i));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       reg_index_addr(drvdata, CTIOUTEN, i));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
+	writel_relaxed(config->ctigate, reg_addr(drvdata, CTIGATE));
 	if (config->asicctl_impl)
-		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+		writel_relaxed(config->asicctl, reg_addr(drvdata, ASICCTL));
+	writel_relaxed(config->ctiappset, reg_addr(drvdata, CTIAPPSET));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -122,21 +132,22 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	return 0;
 }
 
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
+u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index)
 {
-	int val;
+	u32 val;
 
 	CS_UNLOCK(drvdata->base);
-	val = readl_relaxed(drvdata->base + offset);
+	val = readl_relaxed(reg_index_addr(drvdata, off, index));
 	CS_LOCK(drvdata->base);
 
 	return val;
 }
 
-void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
+void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
+			  u32 value)
 {
 	CS_UNLOCK(drvdata->base);
-	writel_relaxed(value, drvdata->base + offset);
+	writel_relaxed(value, reg_index_addr(drvdata, off, index));
 	CS_LOCK(drvdata->base);
 }
 
@@ -149,7 +160,7 @@ void cti_write_intack(struct device *dev, u32 ackval)
 
 	/* write if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINTACK, ackval);
+		cti_write_single_reg(drvdata, CTIINTACK, 0, ackval);
 }
 
 /*
@@ -322,7 +333,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	struct cti_config *config = &drvdata->config;
 	u32 chan_bitmask;
 	u32 reg_value;
-	int reg_offset;
+	u32 reg_offset;
 
 	/* ensure indexes in range */
 	if ((channel_idx >= config->nr_ctm_channels) ||
@@ -344,8 +355,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -365,7 +375,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
+		cti_write_single_reg(drvdata, reg_offset, trigger_idx,
+				     reg_value);
 
 	return 0;
 }
@@ -403,7 +414,7 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
 	if (err == 0) {
 		config->ctigate = reg_value;
 		if (cti_is_active(config))
-			cti_write_single_reg(drvdata, CTIGATE, reg_value);
+			cti_write_single_reg(drvdata, CTIGATE, 0, reg_value);
 	}
 
 	return err;
@@ -452,7 +463,7 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	}
 
 	if ((err == 0) && cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
+		cti_write_single_reg(drvdata, reg_offset, 0, reg_value);
 
 	return err;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 2bbfa405cb6b..7191a478b2da 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -171,7 +171,7 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		val = cti_read_single_reg(drvdata, cti_attr->off);
+		val = cti_read_single_reg(drvdata, cti_attr->off, cti_attr->index);
 
 	pm_runtime_put_sync(dev->parent);
 	return sysfs_emit(buf, "0x%x\n", val);
@@ -192,7 +192,7 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
+		cti_write_single_reg(drvdata, cti_attr->off, cti_attr->index, val);
 
 	pm_runtime_put_sync(dev->parent);
 	return size;
@@ -202,7 +202,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0444, coresight_cti_reg_show, NULL),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -211,7 +212,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   {								\
 		__ATTR(name, 0644, coresight_cti_reg_show,		\
 		       coresight_cti_reg_store),			\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -219,7 +221,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0200, NULL, coresight_cti_reg_store),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -257,7 +260,7 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
 		if (cti_is_active(config)) {
-			val = cti_read_single_reg(drvdata, reg_offset);
+			val = cti_read_single_reg(drvdata, reg_offset, 0);
 			if (pcached_val)
 				*pcached_val = val;
 		} else if (pcached_val) {
@@ -293,7 +296,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 
 		/* write through if offset and enabled */
 		if (cti_is_active(config))
-			cti_write_single_reg(drvdata, reg_offset, val);
+			cti_write_single_reg(drvdata, reg_offset, 0, val);
 	}
 
 	return size;
@@ -386,7 +389,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, CTIINEN, index, val);
 
 	return size;
 }
@@ -427,7 +430,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, CTIOUTEN, index, val);
 
 	return size;
 }
@@ -469,7 +472,7 @@ static ssize_t appclear_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
+		cti_write_single_reg(drvdata, CTIAPPCLEAR, 0, val);
 
 	return size;
 }
@@ -490,7 +493,7 @@ static ssize_t apppulse_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIAPPPULSE, val);
+		cti_write_single_reg(drvdata, CTIAPPPULSE, 0, val);
 
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index ef079fc18b72..98b8de8a3687 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -30,8 +30,8 @@ struct fwnode_handle;
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
@@ -217,8 +217,9 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
 int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
-void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset);
+void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
+			  u32 value);
+u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index);
 int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 			enum cti_trig_dir direction, u32 channel_idx,
 			u32 trigger_idx);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 770a8dc881b3..4aa25dda856c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -68,6 +68,7 @@ struct cs_pair_attribute {
 struct cs_off_attribute {
 	struct device_attribute attr;
 	u32 off;
+	u32 index;
 };
 
 ssize_t coresight_simple_show32(struct device *_dev, struct device_attribute *attr, char *buf);
@@ -77,7 +78,8 @@ ssize_t coresight_simple_show_pair(struct device *_dev, struct device_attribute
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0444, coresight_simple_show32, NULL),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 

-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16BBC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hvDa8O9hGACyFWVvO4cHOr7fhxyH5sRWAFv1BUJCgSY=; b=DAs589HOFrsUUEMsEh5z5TfZg7
	46UKFffdC2LWSHB0cw8l+Y1PBEfKoZw5FoTib9ONap7sB3jAAppD47/iNxyxU19ZXvHVjBhnuDzTR
	o4W27fjMI0sPBBV8U+L4f9NOVRtG5xvVP7rZCNu3MmU4vw5gaG2OVV4uuiWqiDCswY4wmX2Zi7kl3
	oxs8i0cG3QZRB/so4ut25i39ynS3eWtXZaZK42vtq5bLvcLwdbKiU5cbrYCWuKF2OaEtW29OdQDJb
	R54sNyuKq2rSg9OdWDeC1MG8wGzwpFW5X3anVijK7lCltd3HkSlDi1ACoMAAeyhk1gADSekDviHcH
	j3UqViRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPTA-00000007HCZ-3MoZ;
	Mon, 11 Aug 2025 10:09:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPHU-00000007FXS-3uib
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:57:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dpZo021817
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 09:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hvDa8O9hGACyFWVvO4cHOr
	7fhxyH5sRWAFv1BUJCgSY=; b=o6+e0wPqLH1ag2mF08TNpUTo9oqgfVn/vZFRxm
	8pO7d74cl/OSIfqcLD2tUDAoesLM2lPMcusPUzu3MWkZeuapM6FMOtHfFA9HiDou
	L/mEGu8rwgPFq5LPYMDqaL39cLx7g57JmXPFwE3o90N+7NLBkbpSWFkQPiyKsxZy
	SJHwavhIRvIAU7mRQvkeq2SU4lGMFoKNHwYXYzdzB1imMq5Kt1Z+rg/HXPhJUvp7
	eINrdC9Gqy9Ffd5Dp3atOLQc8gtOCowZ1rt6DLnAF6pfow9xI5asurtab+UT2KRH
	9efkaYo/21LEJO4o2QlgEUkFNWEgY0AZbQxm9HgW4VE55MvQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g3w03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 09:57:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bed3183ecso4468376b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754906246; x=1755511046;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvDa8O9hGACyFWVvO4cHOr7fhxyH5sRWAFv1BUJCgSY=;
        b=otNszCLNQjmdyaJ492yBlT36RGQ0L2rKTnjZJzhvityqyWz88LU2qOOzxXcp8ktJLp
         8vGwbsFjS1e9sDOgyPeaqJ88k8VhM8/BvUKRVHEUmMZuNeAVXTzJfqYz2zj3rJVF8q81
         PbF4FfZiaST6Zcg3vmcyHyHFaf4eYh1Il+oMdhKgbygbBXX9/GcVQFPn0PR6hwEr17jg
         u6VgxVfH4h3RtBizbpdMUsMLP9A715OkFhdEuDogje2ok2Vr5qDv4iAH4gBjIf7Sm5sW
         cxYzktCJuTv1wP2riqstKE1FLC1Ml3I+2Yw1yT8m2Z/SMQOrMbWRB1C5CY+aQCTtJhQb
         aLRA==
X-Forwarded-Encrypted: i=1; AJvYcCV1ukj7mmS5yhxIXj3VhdM0Xiok6ctAL+oKmaXc64bQgdwy0LoUsbCAquzbhJHhgJJRD09+DSfKsExMvSzJXpfv@lists.infradead.org
X-Gm-Message-State: AOJu0YzHpUPK/1o4QWrl+TpCqlbIEQqBtPojqxAGujIel/RVyRUQqJah
	0tZEz/ZbQzZji/9E5rhZw1P4GZq4mHeSoM/lEzsuduBvZFgxFu6PczOGM5juDYcp2sPEhpzq6zO
	uNEMyZzaEoFBsWwo0/PwR97gt17Eh2zntoZC754X+Tyfp5Uak+GQDJ0FXihHwn1c4Guoh05Tkm0
	vs3w==
X-Gm-Gg: ASbGncujP6j/j/8sW+1gZ+MBUrFdE9LkfF4M+g4c9SjgLI7k6DgsL1BJoDadG4LFry2
	8yYQh/B3UQVfdN0k3b4Con2t/27gx1tBrrPkbrw8Sjo4y8iL51UyH/7O69u6xTiJ/NO6w9f98uu
	KKQJgYmR6EKy/LeYD0f079c/3wzzR+kA3PfV7yHRhukhxl9/2pb3eknih3jKd0MmOfF5sOsXyB4
	bVBT08K95ZgOvd5MjLifS+hwnJExc4+su3Wd172/wmmoe4o6Kgdol7r5fxfZSpQteCqY1Yn5nxg
	8BD++BM4cg2n76Y1AsSZDIX9YaXUpVGUrK7msJGmnlaUapJlR8DkU3QF1G49IGmKIrc/QPrpVhI
	9KvnYvivT1RH2rFPSn5D6wQ==
X-Received: by 2002:a05:6a00:18a7:b0:76b:8b13:e06a with SMTP id d2e1a72fcca58-76c46177ffcmr18799308b3a.14.1754906246183;
        Mon, 11 Aug 2025 02:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdghApAGzGX3YDSAAQZKY23C1RLAPvbfQ/HBZ35o92nHPYZlaSgEACPUYsZejQeE6Kx3teWg==
X-Received: by 2002:a05:6a00:18a7:b0:76b:8b13:e06a with SMTP id d2e1a72fcca58-76c46177ffcmr18799285b3a.14.1754906245775;
        Mon, 11 Aug 2025 02:57:25 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c5f493178sm5787371b3a.49.2025.08.11.02.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:57:25 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 02:57:20 -0700
Subject: [PATCH] coresight-etm4x: Conditionally access register
 TRCEXTINSELR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH++mWgC/x3MQQqEMBAF0atIrw0kgajMVWSQoD/aIBnpdkQQ7
 25w+RZVFymEofSpLhIcrPzLBa6uaFxinmF4KiZvfbCdc2aXEefOWbHKwKp/mOSbNqZoETBRCTd
 B4vOd9t/7fgDbFTGfZAAAAA==
X-Change-ID: 20250811-trcextinselr_issue-f267afa0e5ed
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899be87 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=HcK5dDk5inTH1P41ETwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX3mnEREhI9zSX
 t/R90D6hK7zYVL+hhZbCeqU1sqDKLr419cpsAd/b77EpmLe6/QVkzij/NA23BFzOBFIFdCVCc/a
 Q2NVcT/Gn9JIB8yA3/7xCtHPu8FvrJBHYtPkEjjxtwcyEpKjL7Bkt9kq5A2fjuMFdH+FboqnvqH
 I2F3aIi+EgGN5vwbxzsnVGaqxChMDa8qxmQ5t5ekJZumaeoETvE6etBIUHkcBaGIHsmO20qX7+G
 UcZO4RTmi7oH/2f3c3s5SUxR0P34407Mg88ik5onYGtMbuL55MEup487Lrgl1AElfsJ1TmHrH3n
 NId/ezzx+J2PKYi3V38E3NeTcAbqfvJ7Ojr9yFGer8bzynjQ3Mvh/4752DU2mGge266VKuo+eu1
 bEoziprz
X-Proofpoint-GUID: l0Sw133KyjQBzw2LQighIVJBUcXjKVyy
X-Proofpoint-ORIG-GUID: l0Sw133KyjQBzw2LQighIVJBUcXjKVyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_025728_980150_29C9311C 
X-CRM114-Status: GOOD (  15.94  )
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

The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
To avoid invalid accesses, introduce a check on numextinsel
(derived from TRCIDR5[11:9]) before reading or writing to this register.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++++++---
 drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403addc6ec81f2e3184522d67d1677c04..8a9c4caceff0165e4fce7ac4250f3e16ccc1d34e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -528,7 +528,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
 		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
 	}
-	etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
+	if (drvdata->numextinsel)
+		etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
 	for (i = 0; i < drvdata->nr_cntr; i++) {
 		etm4x_relaxed_write32(csa, config->cntrldvr[i], TRCCNTRLDVRn(i));
 		etm4x_relaxed_write32(csa, config->cntr_ctrl[i], TRCCNTCTLRn(i));
@@ -1423,6 +1424,7 @@ static void etm4_init_arch_data(void *info)
 	etmidr5 = etm4x_relaxed_read32(csa, TRCIDR5);
 	/* NUMEXTIN, bits[8:0] number of external inputs implemented */
 	drvdata->nr_ext_inp = FIELD_GET(TRCIDR5_NUMEXTIN_MASK, etmidr5);
+	drvdata->numextinsel = FIELD_GET(TRCIDR5_NUMEXTINSEL_MASK, etmidr5);
 	/* TRACEIDSIZE, bits[21:16] indicates the trace ID width */
 	drvdata->trcid_size = FIELD_GET(TRCIDR5_TRACEIDSIZE_MASK, etmidr5);
 	/* ATBTRIG, bit[22] implementation can support ATB triggers? */
@@ -1852,7 +1854,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
 		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
 	}
-	state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
+
+	if (drvdata->nrseqstate)
+		state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
 
 	for (i = 0; i < drvdata->nr_cntr; i++) {
 		state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
@@ -1984,7 +1988,8 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
 		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
 	}
-	etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
+	if (drvdata->numextinsel)
+		etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
 
 	for (i = 0; i < drvdata->nr_cntr; i++) {
 		etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index ac649515054d905fa365203bd35f1d839b03292f..823914fefa90a36a328b652b0dc3828b9bddd990 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -162,6 +162,7 @@
 #define TRCIDR4_NUMVMIDC_MASK			GENMASK(31, 28)
 
 #define TRCIDR5_NUMEXTIN_MASK			GENMASK(8, 0)
+#define TRCIDR5_NUMEXTINSEL_MASK               GENMASK(11, 9)
 #define TRCIDR5_TRACEIDSIZE_MASK		GENMASK(21, 16)
 #define TRCIDR5_ATBTRIG				BIT(22)
 #define TRCIDR5_LPOVERRIDE			BIT(23)
@@ -999,6 +1000,7 @@ struct etmv4_drvdata {
 	u8				nr_cntr;
 	u8				nr_ext_inp;
 	u8				numcidc;
+	u8				numextinsel;
 	u8				numvmidc;
 	u8				nrseqstate;
 	u8				nr_event;

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-trcextinselr_issue-f267afa0e5ed

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>



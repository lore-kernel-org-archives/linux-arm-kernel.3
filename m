Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DE9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CvvFVEBAadFWgjLlbo5X8OVvt+9c6CEAJCOkS71be4w=; b=Pk+j26oxeF56zK0mvIE/H1Y0uK
	UzqOjWBY3UxVSuj3A7IKLT7A2CmavF7klM3mUOJIMEsoPu9qJMV3vDl7+p1ebpW3RYAHW2MBUswTB
	WtjwE7nsZo6aCL8WNsgOxS44Y1ezhgwscBcybReAaOaFSnfLKKPnfhNiJbQKsv5gn5zzDQ7bbgmsu
	R+LMqIVFLHfLx9z9kM82GeHLFxf4c/85s/30szS4R7O49+WOOPQAJValetR/grhn9LWqd2z6AiS0x
	FkbwI1sOVPyMhpH+1mNJ3WQ0L6U6y3QSCEEYweeaXVOiyBTmZb9UReFtYI6ojrOagkJcOhvXNbs+D
	yftmGs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEu-0000000Ai1c-0adw;
	Tue, 12 Aug 2025 12:36:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkJR-0000000AEBY-0XPb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:24:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C6XLF6008382
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CvvFVEBAadFWgjLlbo5X8O
	Vvt+9c6CEAJCOkS71be4w=; b=cFFloetjzxbMfzxTJqyUzEGMbz0jrS4LFVtrhH
	QnqBbEIAk5vPf7SvgtsNQ/nmTOHZuBMp3Sdpa9OPPrbTHpoPiAoElw2IRC2ZsdLp
	dA9wKzPjBXIbLCcE2nAtGhJN3TBsOE7o5fJ4Ubpan/tA93C2UBMcDRqJsfNfuW1q
	irlm5ewCVMgpmcnIym1a15eErRzA4dvSs5c239U0qZb8O4T5ZVRJnlCd7CWtN4f+
	bkUgnS6VxYdGfgz7+tuZ7Fl9hcMIShgEwoba5ubC9CqFLTJSwaN/jL9uPGbSj8+1
	UZdiSDPVdkSR5GO6C3j1q9yupu0hHGIk02BqG+XZIsV7farA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjk73t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:24:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bc9259f63so5217705b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987091; x=1755591891;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvvFVEBAadFWgjLlbo5X8OVvt+9c6CEAJCOkS71be4w=;
        b=rPplhJcVQfiI6G48K6zPolsFBEtRaD5/U6ybjSgs4scy+OLYhhLmN6iBcmbnBLM3DN
         aRhyKQdG9+vqs3v/OEoljWgTsujLc1ieM3MPYqcBCqrq//yyWiKzeZsUYvBUJT+5paSI
         y06GnHdogdD4mF1JBKX+uNBEg4+cpFuYNqgOkI8zHazU/VlzziROGwU5OWH2x9JDCwRc
         elPiZxQxDPNHqoEY3xTKsnWKkkExkWoKFuIJRxybM+IXN+5pPioEo3H6KiKCpDshHqRP
         o9E9Xoc5lLKTYpCT5/K8UYyVEex8pAIgZAXmdHSSadrKUh9EzR/x5SBZj0TyYT33oidc
         qnaA==
X-Forwarded-Encrypted: i=1; AJvYcCWU14J0VJxAEhuJQgU7YuEObASsimy5vXM14KG8LP25uHgMK8pDybULnD7pOjdRDYHAEb+ItH/qBJhUDBx/8029@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7sfi+y8c6NKxAw0vpIoVcCsar2jw/cNkZE0/Kq0W8Kbcf1G5t
	CmwqLKdDc9yg0oJ4MXmSYM0I8ADUuIxOGJg7OdlA/1PGfbMEa/Q2MqBhs+KBVr/7o59JBYPec6Y
	1BRIBB8ebGXmr+Rn7UyqaTrt3XWkggjtAPkdfqUSFNXMJXPUeWeCM4sZxpszh/60TLaHIxQr+kq
	mk8w==
X-Gm-Gg: ASbGncsgofgryjQ6XzurrTknfk6viAOr0Ivwt+NdJjkbHyfrhyeF6tzdoH3IDU3l721
	dlyayvrLaOf1qR1R9yGG0Q+r00IPcnAj/LfuWYOLkEH/kyCHMeHldxiuXJkmmRx976+9NHpQsri
	F29uafydc/yYZF5N3w8VyUmbiioGge0dMH1thXsH3QY+9MfUDHplToXToeuD0oWp8aOHAsxj0xV
	QVI/s3g8AGWUWqI6d7FYnV1S7JoDr2ltcUNC7fHUK+uT/J+YfKC+DshBkkcwpnrMwB/lT6FeBVY
	tI4BCkYumlG6gBE13TEOtI4s/lTjpYZJHBiT2YoQwOP7+axbJTHttqHY2O4jnzA8pTt8l3yTF8U
	YAdH6xq45OH18YF3E+njVVg==
X-Received: by 2002:a05:6a00:2286:b0:76b:f16b:b186 with SMTP id d2e1a72fcca58-76c461419eemr19972766b3a.17.1754987090697;
        Tue, 12 Aug 2025 01:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwQXBR35j59DRJhzNptfgFRmw0DHELJGAGq2oy+ZJTpCDVjfDFKXkVTK8fwhHEmYG8UWf0lQ==
X-Received: by 2002:a05:6a00:2286:b0:76b:f16b:b186 with SMTP id d2e1a72fcca58-76c461419eemr19972729b3a.17.1754987090187;
        Tue, 12 Aug 2025 01:24:50 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcea9sm28877018b3a.61.2025.08.12.01.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:24:49 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 01:24:45 -0700
Subject: [PATCH v2] coresight-etm4x: Conditionally access register
 TRCEXTINSELR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEz6mmgC/32NUQqDMBBEryL73UiSkir96j2KlBA3dUGTNhvFI
 t69qQfoz8AbmDcbMCZChmu1QcKFmGIooE8VuMGGJwrqC4OW2shWKZGTwzVTYBzTg5hnFF5fGuu
 tRIM9lOEroaf1kN67wgNxjulzfCzq1/7VLUoogX3T+rNWxkh9i8z1e7aji9NUl4Bu3/cvBwyGx
 LsAAAA=
X-Change-ID: 20250811-trcextinselr_issue-f267afa0e5ed
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX7gpX8FNiqQIl
 IVBTSmEtJHSzYG2I8Vy6FkOn3NwRiursIwqDiYDwDeB0H8MF7UAajDFklawsvJntxAimIq2RxkP
 u0n33mxAshxQby8+UqkjHFMI8cqAdNt0gEu+g2Zq7ZmTsnzVRglL7EyYlN8O8hHMC64riOwaLBe
 iywqXAvGoGPjJhWmGY+uysnzqoWi3NGx3Rme51lpcqdVEc49K//DkZpt30LPN5WjfhRgyQa4aIa
 kg3b/ZBG1pPaHCguvmBeqEhW3FN+Md+3lQnmA0XLh1KC07peu5TwgiE8qbbpg6CumzQsGA8Tuew
 F1o6ZSBSRHLvPcYFRvL4qHgUUwtImU/x4wN0qeJtZvPp0BBcl+iMvUKCr8q8aco7WnsD+AH4SHh
 RpXRce4D
X-Proofpoint-GUID: z6orXxOasysSUUXfZm3K96WUPbhO1xMN
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689afa54 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=E-Az336nn5kJS1Kr1xEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: z6orXxOasysSUUXfZm3K96WUPbhO1xMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012453_286123_AD4ECCBA 
X-CRM114-Status: GOOD (  17.22  )
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

Fixes: f5bd523690d2 ("coresight: etm4x: Convert all register accesses")
Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v2:
- Add fixes tag.
- Replace "if (drvdata->nrseqstate)" with "if (drvdata->numextinsel)"
- Link to v1: https://lore.kernel.org/r/20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++++++---
 drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403addc6ec81f2e3184522d67d1677c04..4e411427303981104d11720d3c73af91030f8df3 100644
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
+	if (drvdata->numextinsel)
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



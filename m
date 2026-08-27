Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B5C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DOW3HbgGxcyvtK23icwnWTlfQLNr+HRAry9Zia2hG8=; b=xwcijjRG1Jnz4kz79V1zbPLttw
	nkZiUc2ZJjsG3vtKvpOH4p2JabHkcXH4WhbYFNL3IWeVspPS6h3eAi59H4b5dVhIoQ7Qgr8TDghdV
	Wd1AnJFhlm/Lbz5Irszhx/TG8vZhQ5A4h8aGZQqsSFbmiSRQWJEluJi+/aXhiIyFFwtO7YxOTpd+9
	mD6h9xgbSlF4V9JYm8ciZFSYt4h3/zAbU8/XSHk8Ym87O38n+w2qaP5oOiTkRI2ZUQ01xr9pEBuMp
	aaoL4X0hC6LpZHolERKYivlyrIzeTOB/Ets89ufIGHIBWUJA1DQ3u2n3xjnqGBD+vp6m/kVGfRPn9
	yIf/g80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOW-00000004XhK-0H5c;
	Thu, 27 Aug 2026 18:00:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOJ-00000004XZG-2ZRE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:59:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXb1A4178274
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DOW3HbgGxcyvtK23icwnWTlfQLNr+HRAry9Zia2hG8=; b=UAtJCKHa6Dlsrkq8
	uWFqMs46OBjwNq6g9FnkPBpJl488R5DLKm++C0kjfwVtzxuNlxpaafcQ4VoaRrlS
	mA2d9H2gUf5Nmmvii1ZPx00Q/uDTBX/7plimlKWFBSD7hRZT0RnBRARzsGxx+NeA
	3phMoH8Eo5ANlDVCTuPAFi3giUTGE1hC0mrwT/OSb2+tu8QV1ZxJWroKmhd3nKNt
	hcgpn8nvFAp7iFiPCe2Aa2+PiwVCP4iygoaE5H+a/7pmD6AQg/HaCpxWl/hG4yr+
	E1r76PtkevP0+otO/ir6wSkkN/5nTBK98XFezGZXcF/pqh+uv5uJnuBWozQgDyJw
	MzSJnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw14tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso236975a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853594; x=1788458394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DOW3HbgGxcyvtK23icwnWTlfQLNr+HRAry9Zia2hG8=;
        b=Z74aTkgsRg3+AlMOj8Gwr+DZ/u4AyoVxwYVD5YSsUVMAB75Ua/ssNdh/zhZj5EcT7h
         0oU85xCVE33512vzQSCx1BxLFlE/Hl7LyydCcBAG5RYhiZ5LYa8cFUCUd0izMZcjZJ5p
         ebiLrN+Ewe2eRWNTJIOGSzCgpDuqMxagN/c0HeuRFZNgCRNa+VLHYNOh35FOdLq+Ekjt
         PAZM+1vx37jAnm//l/mIbeh3kInqOji/yqkanqmfClBPnWX7Ixvt5/hVw+sP2ieqZxhi
         hM2GJkU6YxQFQLn9/sTEUciJuHBPl2Q5NMxFB/GRNBe2oK+JKzKuW2Hy9rZFf4biXmFb
         o3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853594; x=1788458394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DOW3HbgGxcyvtK23icwnWTlfQLNr+HRAry9Zia2hG8=;
        b=QfqhLoBX9h+4J78XvaLEYn3A0uBRlhwffB1lBdlwE3H4dXqv0q5BfAzz0v/eh2jk4U
         vOZ2r+EKMi6o6EIxBbrvU48nVe4/StPZ5HMIxsOCls0Ovpn3UQdXWduuo+2lq3ubwXmE
         d5MuJZC3IQOO3G0bIJqBmJuifmkzq0znQ/QjQJecGXeDiTs+pqU9QyLbCAtKZX0Wt6vx
         e/bSl2av36FPI4XwLuQ3Csnda7eBLbZLHQFLM/U216vnr6LETWmVUCqZiLBF5M4uyajl
         iaPT/0EaXT+7injg/UjzeNhRykbLug0+ZtyDf0ZwTLkYnaIcxjbUppa2LBeCPBFpPnNd
         Mrqw==
X-Forwarded-Encrypted: i=1; AHgh+RrQFuxtgIMy17ER+0ay3mGx7T0LdDFfH02pFH4imZgq13i2ol7xiVNf0COcM0Qr+qwAkOImKHHZpJSAphab0EUH@lists.infradead.org
X-Gm-Message-State: AFuF++kezxuVTOlj6h0CnwUsbyKsgIS+VQvplBRZ09EYiz9ASkHZF71M
	tj5rfxIF2iRhTVZMpAByLVUyDnRMf1YtHGNa8Uah3PV3DdQp70McM9g8Pq4wGeRHTGchRf5G4hM
	eObeDGUgppisGcImlCJDUWN/GepCTs4grW53by8U/FnCJtQ5N1Sc6vgtbN3cYxotFqcY22Y2LAT
	QTqA==
X-Gm-Gg: AR+sD11FvnV9lThXpAZGDMYMJGAGQsi0OI7ABiYE29IFYUbBRcimiVBLYBwNs3RJJpS
	eRiXMTRoVrXcYiqne6gL2sURtUdDE3HEfuaVcwPLfot5L4PUaB71AEsHl7kBiEI6jeO9kRF9vV1
	W0oiADg0u1oxiJ5zf6y4etmxY07+M8X/PBqMF1CYrRKNPnQcnwa8GO+N9O42wjktsqYtASTV1Og
	LYq4WT4+eY5k3kye0RkohDfisK825K9P9wV/7ZbCvLTmmg9FVB+Z6amDkL7RQDMj4XGlsOqTbUj
	MBiH6zxyh0VfH1kogVimMlXBgoccU1/+fV/vK9uoA9S60cv7muuSUZS6tuoRwWlrhPzBiGGcOI/
	tXjcdGqX33KJWDJOCESZRK66R0hDcf2FaMg==
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr1853262a91.10.1787853593467;
        Thu, 27 Aug 2026 10:59:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr1853160a91.10.1787853592820;
        Thu, 27 Aug 2026 10:59:52 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:52 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:20 +0530
Subject: [PATCH v2 3/9] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-3-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=2911;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=zHylj+HT+odz16Na0xE7+fHmSFeJfsDp+dwqk6ejkcI=;
 b=w7NHm9ePtmCqH/3jPw8yr1znOlCotzsen4mcclKd4jYwSgqnAUCwLzywWanOrvCDjLjvkCNPx
 uioUNiPLBtcBegA9YNEWcnR0C9gm3bYAbB7KKI7C4dmnOjgoYDu3r1+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: fTmhaywQeg7lwwfeeuYBI19LFJ-hSphJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX/zPwAujQNXK/
 /ydHkC9TjRRLzxQ9Rh/orvLPe+i2vj2SE5j5AvMw280xKpvscpaBqqcwy+ZD0WpLj5+YcYD4Kcc
 GYZPROH5caWcQej4L30pMxBzbfZ4NB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX/oI31bwkRn6o
 ic3cD/bc/7emTTIrNm4sn3HyQAp7YGYRe8rszXt6EOyUrgocR1Hx+9CRMeCq1CgsTa7xaZPDl0i
 tcOKKG+qMYzpyHjoa11Wj8A0pTN4xU9K2I0ZZFYP20geAN4bozIUe1B8PCsLbaQjZlLF4OS9bgc
 i+bGim61jd5rILo3edC4sZZvm1ar/45W0Q7wC42UdFO9ov64FfzinvVFCxAExH7u9FhBVpFWUGq
 1vLWLZn0hh1jRhIJ9TQ8cIzkf1lThnI/YsyqniSQJmI0EPD+aQRCEFYhScmeY2/k/adtKoK0H3n
 I9jSSxji5KrCaRNvMLCfRjg1Bbqc87an3vT5ngyjRfyEpuebOF5oKuaPppTOeTixmiXdlf2AxOq
 HC4QCauDWlU6vQPeJpQ19yVLhg2JrM5+TXhfLjimUYKj2VAOjJSpp3h7HavGx6aZuUUxB2oOaB3
 HBpGkR6wu2kPDqOXQSw==
X-Proofpoint-ORIG-GUID: fTmhaywQeg7lwwfeeuYBI19LFJ-hSphJ
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a907b1a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=590DCAjQX6RtSPayVpcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105956_830243_DFC90BD0 
X-CRM114-Status: GOOD (  17.89  )
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

GENI protocol drivers need a common way to scale the SE source clock
through the OPP framework. However, the device that owns the OPP table
differs depending on how the SE resources are managed. For Linux clock
managed platforms, the OPP table is associated with the SE device,
whereas on firmware-managed platforms it is associated with the
performance power-domain device. This requires protocol drivers to be
aware of the underlying resource management model when requesting
frequency changes.

Introduce geni_se_set_rate(), a common helper that abstracts this
difference and applies the requested frequency through the appropriate
device. The helper automatically selects the performance-domain device
when power domains are attached and falls back to the SE device
otherwise.

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 447b9cc6babf..04f58a6f26ff 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1149,6 +1149,28 @@ int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
 }
 EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
 
+/**
+ * geni_se_set_rate() - Set the SE source clock rate via the OPP framework.
+ * @se: Pointer to the struct geni_se instance.
+ * @freq: The source clock frequency to set.
+ *
+ * Applies the given frequency through dev_pm_opp_set_rate(), targeting the
+ * perf domain device when the SE has power domains attached (firmware
+ * managed path), or se->dev otherwise (Linux clock managed path).
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_rate(struct geni_se *se, unsigned long freq)
+{
+	struct device *perf_dev = se->dev;
+
+	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
+		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_set_rate);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..3b411cba9339 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -596,5 +596,7 @@ int geni_se_domain_attach(struct geni_se *se);
 int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
 
 int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
+
+int geni_se_set_rate(struct geni_se *se, unsigned long freq);
 #endif
 #endif

-- 
2.34.1



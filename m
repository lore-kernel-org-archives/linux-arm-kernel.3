Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DECCC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqEMkMS1UWG9eflld+AAF+sV+TXAn1oaplLJNUKG9zc=; b=vF8pMXbEPT9CqbJ5bPUCs9LofP
	nz2jbG0FDb1PDXhchkoaXko0JAp9tglrMOlSeZ+/UmD1hZ/a3ikXxmEj61CkK9ADhN2wLP6jtdwYj
	weV2mtnbrU3pWZ3gEGYvUSQRiyP0ijiII7ykhSI0Mt/9GNfyToHgip/l9eRobPLR0bpfBGyrgA6Bp
	m15JPD6m9yO+wmBLnHfLlPrjFkgbLp8CnlejE1Mu6UhX9BEOykHv6iBwkN4ZZuW3SL5KkqwjJvtfO
	qIDG2AipdrHKDUJpLj0fwMgCJN1Y+WCR+C+/+iPnol0UE4opJrl+F3wBa8AYoUt7VhP00IBIfn/2H
	M2aOrpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2w-00000000Bvn-3cnS;
	Thu, 15 Oct 2026 12:58:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2r-00000000Bs2-1pkT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:58:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdA84100190
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqEMkMS1UWG9eflld+AAF+sV+TXAn1oaplLJNUKG9zc=; b=nAeLzacWsclf+9uJ
	wJVuDr72fkssoG4HjAYVGgBC4CpOVOyVSNVs5KvJ5KlfYN1xTknSHqK+r3nAr7tl
	TvS3P9ekuoFTxGkeIO8XKUGvBI6rnC1Yf5PAelUkKl0FybCZCdEOHBlZq2Js6C7m
	tuzMeO6QaivnsX8r4+mKDcOBGmUFia8HU8QJRLTzDN6LK7zIfOQ7E2LofOXr1K65
	1s47mxbMITGh3HuggcLln9yIoByUQWU0GbiH2uijH59PhDLK0us0YsmtQWMUgiOV
	JpJrJp3+w4j6U5EMIyH3hlT3cr2QYyImGO/juHdNcrHkhrTnpwaM8D0DoAP5kJvd
	n/Yj2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8h55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e94f72fb9fso15150535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069132; x=1792673932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqEMkMS1UWG9eflld+AAF+sV+TXAn1oaplLJNUKG9zc=;
        b=ALIhQT7LPEjqu07A4cHoZsmbUF/uQaI+THHL10bFG/KGbTXvAA9/Lo3QrH3ZPubxsm
         VF2QZ7hA8uD1ZIOWkp5foMBXJcRUf10H9ACLMnYiI8ApZOSVnFlq5CtJe4sQD6xpx2RJ
         z+nOk/4dClANnR+rg2vaqmRHOaGnqAh5ig+zJMIV0XhU7a1txvWEwHNfvMkCWAbq7uH/
         5rPGb0Oae8pj3Mp/kHOKSCYfVk7Qzb2sNRULdNZv2gwUADeeh7TY93Fip3ca3JtgVGkA
         bhAQB+1x52RaznyzMLy9VgCe653Onf5PFHaW58ZQ5rTTHsPDps8NBobeapN0mHR9yDrF
         fBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069132; x=1792673932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqEMkMS1UWG9eflld+AAF+sV+TXAn1oaplLJNUKG9zc=;
        b=OIxP4PhAV04meMAhGlJLSwQKOAQFh80ZUPGB+Gp04INSIxF8TDg/YUZTopDhE3jq5f
         PldWRKCXCE2uJiE4PvK6e+GllC9ReywP+n34c83Lldh3799/Lqr6BVaCZaaxwATLMGig
         DW4zTCBbffxBfcIAJaVclk5SlXx7NZDf3hUVatr7EhH5C2FKwPbm9Si8oKf40PgR3Qqc
         GrmmuCI+XCgUWlBZxDmuaF4lCnvmhFgW/4WvPQVRZQVYbiDz7gXdACS48OYLDN6nHKUV
         gaZQpcPNcH011/JhSkD57H35ySdLTN0hmi/ZtteWo/4swa+cLFf6b2ffRQX4gGMKFvS5
         /P+g==
X-Forwarded-Encrypted: i=1; AKwUvBzeylM4b5b3g+cJG22WGAwtG+Sk/q2VcmKwD5EleX2J5OSAQekpLqXF3qslBUmTvrx5Vxz4AR1506gQlD3odSnj@lists.infradead.org
X-Gm-Message-State: AFq9FYIDuwDuMG/ws/+jtUXXelOS0d3T1+MNgBmDlSYSJCzOB/ElXhr7
	LgB3Idl0fmboa5r3ypLdQUb6QZink93oZK7UJWR0SP1tIedKWAOPLBWCRNonvQ8rv/qw11jr9oC
	Md5E7QrGLFt54bXZBEimd/ZeWUsPesgMPnlo5dQwD5VTmiV21+fpcFHYbSz4QGzZb/zzKx7f9mz
	ykMg==
X-Gm-Gg: AYBFou0IHv2+7Tg3LKk6BlYMYvaWrn6Qljl/3DuD/yNp8aFyyBjZWCV7ZgQzpkmZ4Eu
	43uYt8VSJMmQidynXWHq8+MTjJhhoRSjLiIJHb+8Y70Hfm5kfuhRD7uqoR3uLAznBXfzHvWknvG
	AcBo9RRPk+jVmiSlBN2uNNGT0NS765OczJerx6JCoXHsWOB8RQc/n8UbWSsXtoa3OYcJlsfA3tL
	Nz2EDsV9rh1lf40Vr9uzOrvY9OdEUU1dWqRJ2dLn0aKuAVbPP4lPevOkcAifxcviG/9ftFOKOJ/
	iwuVGqCq8bfHyUi/y4NpToKN78Qjzautx70UXzmPe5jmJzQJP58xAc/byxh2sKuDZ2I0p5s3Z4B
	ktAZJ6VZA07O9JrW+NIOH+HcmxECTjD3hjw==
X-Received: by 2002:a17:903:2449:b0:2e6:913:57ed with SMTP id d9443c01a7336-2e8429a83cdmr169905185ad.14.1792069131922;
        Thu, 15 Oct 2026 05:58:51 -0700 (PDT)
X-Received: by 2002:a17:903:2449:b0:2e6:913:57ed with SMTP id d9443c01a7336-2e8429a83cdmr169904715ad.14.1792069131268;
        Thu, 15 Oct 2026 05:58:51 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:50 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:22 +0530
Subject: [PATCH v3 2/8] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-2-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=2852;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=B5rjEQXDz77PYSnOLzLQNyCWZ4XWw0tCjLYWjtT0x8s=;
 b=U2QFjtpzZGOlYt9TZaHvmdhUmvcBoKPpx74C8L3IBU4co+eXkRokP7yEBGDCksyBHnGMVIh4g
 xchAoYT0tttD0LTVyo/JTwAd36IwQnCvFnD+TOWtDEZIQFG232sHKKr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX4KUKPNRiZ3IX
 RTNCj67Et3XkZERlNxoq3qv0BsaQ2FSr3KppXLLrLnWT21tFbBp3/sTdMyYLzjEVlQ4m/K2VDPx
 ELeEe6xMNDdFImlQO4mH7dzenutjQss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX1VgEn+8n97TM
 o3JU0S3r8SUWSnhjNbZKJ2IkUDvpsXnQXnoZ5qNlXfB3wvXrbirSV3TZCbVh6n3KaYbpU3z8Nqv
 R9WYyNw0HNN28pMWuP0EqJEOnXEkK752Ov0jbZknyL6y/BjAi/1EwR1orxEfc90bXDDrmOYB0uj
 ldaq3O1EJR930hQcPI8qbPo2egCLn4XWR4SGNZ/uxUwCP7BdribjIW24+Ml7vtHxxb7T8vhqB2u
 uPjLAkgZolqqRuq3cO1x6fFnkMcvPuqsoU3ZUDQDUqIE2Te34Ceq7L5ZSoHNbiI79fQu6IA+OEc
 23Jc67Yw8KPgZmzrBhJVEjZLTTxmEp7EEfkIwTuRS6tC/ruowPPdDnYNY/yygvuglNj8wolPDH4
 ZRHs1uSmMdkTI5EICBKsUsEpbety0w8y1+nMGJCdAa4Xv84WQVgWmHluUdg9kAYq4lEpA/EkEvt
 8fiLaZWOFJbxDwnD0Iw==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0ce0c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=590DCAjQX6RtSPayVpcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: uHETmolFbagd0MG498vkjsTSzEuZdj9X
X-Proofpoint-ORIG-GUID: uHETmolFbagd0MG498vkjsTSzEuZdj9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055853_829905_0F0F5603 
X-CRM114-Status: GOOD (  17.85  )
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
index 95eeb9438a29..97905bd6d363 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1153,6 +1153,28 @@ int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
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
+	if (se->pd_list)
+		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	return dev_pm_opp_set_rate(perf_dev, freq);
+}
+EXPORT_SYMBOL_GPL(geni_se_set_rate);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index b3372a3147a0..8c3c5b68151b 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -597,5 +597,7 @@ int geni_se_domain_attach(struct geni_se *se);
 int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
 
 int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
+
+int geni_se_set_rate(struct geni_se *se, unsigned long freq);
 #endif
 #endif

-- 
2.34.1



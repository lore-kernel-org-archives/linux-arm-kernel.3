Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0DDCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ9lcCAwA2YNgJ/aRnJ5p+xnr/IZHUqHYAEKHijPiyk=; b=q1ihb25tYpbd32EE1gctJOE6M8
	RJ2QSdtMbcGc5o4Vg+OP49WDQ0R+C/5njje0q7vPNeKzuoY9rhE1n50eMgieGbNaclOBdPM2XUkGD
	coK7SYVZmI5QBJKfgd/3Cfpo5IMBQvS7vY7yMEKZ2bEWWQif1ChIl8j7dtkFdW2/yNfRxtKV78Eze
	HPzeWVFkfURXG6jwT1FApwgXRydZWujrxMrqT+hw5Kkhee5/uEanTghxT6k/HyEJ5RpLi0vUinCnf
	BPK990MFymmKWFdxGkK6Ye88PUfjlzpH6rcDSYvmdJ9WSfz0W25p1eLd9S+PKVhEXqpZdpOvYzQR4
	ycRH9ILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3c-00000000CPh-26SL;
	Thu, 15 Oct 2026 12:59:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL3X-00000000CMI-0gNc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:59:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVCB2416910
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJ9lcCAwA2YNgJ/aRnJ5p+xnr/IZHUqHYAEKHijPiyk=; b=nfBV44gtMF2g2fhM
	4y57hF/uetPeOJ5Mbi+9+p/OJwCOn7WnpsNrRwGerVNg5tBCnmn4c67LKb7dGUbK
	rxNS7z3jtTsKIioV1uDfIzoThmsKDzgdKZG8q+0ycV6iksIpo289qhSiIkPxGkuX
	k0KT7RFdns4S3NvTEhcuXPzn6hEwEr+C3Hmtqb2K2YwesCs2QC8geVX3HZ/0GT+7
	d5bu++pWXdteN6widm0oSv2DDbQIGD5qJCEoA4MnLIVndM+mAcjv4J9+tDH793IZ
	nLarKthIfsHy1fXA7RZd/KEsLdTmzUbu2bJPp29WAlFCNavtB+8SqsCUdU9Re11s
	DPa9yA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhj5r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so89667425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069174; x=1792673974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJ9lcCAwA2YNgJ/aRnJ5p+xnr/IZHUqHYAEKHijPiyk=;
        b=c4+Z0FjMlzXyDPZRLyyk46qiOf8LkonVCKlAaeiW8ZKzd0GHYImJw7TSHgNBTgSW0c
         3z0yb5JOGnBjyFY4RfRLzyIXVfeW55DvXJjEp5KKPpxdv4aF4QU3dEWE7J/mf4TUcRjr
         q8CnWxxDqRiKFaDpEl+5cF0m+59g0AX/7fuaJFpxGKYx1DckkZAFgLmFHxwAKKyBktxP
         L0hXhOGbJhZobdCDM8jageaQZseBG0eDiPFHJP26aeCJRXy0S0klY/DcsWoRZQ/35fQ8
         ORd8Oi1h2e32rA5icBJf7tDeTY2SY5U/v2vplBhk/CjN9fIhbGZGfnRNP+K+C0/rn5kv
         w2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069174; x=1792673974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJ9lcCAwA2YNgJ/aRnJ5p+xnr/IZHUqHYAEKHijPiyk=;
        b=MpknI4WOZ0DznEGAGR5L0uDgdpZlvy+VU358P8JSrpVjIwpbaQTgg6dy8uCoJ/TGmT
         MX/b0wXCrcqsu2JXQyrJQu84ILJ1GeeJFdvIr1KiKnYQF5aHEln3292zL3NhiWOgjyuP
         LKgsEo6BXQtPAdhT/y9VqnqSMuAZyFE6tAroe8ve5/1lonlYBp8/70S8DrYftmo7Y0O5
         JPiqSAT2CU+Jv+WwX+mj7tL0uKh7px4G6NIbcuSoq0pI3h13TiNLlewWOcdHuVZMO3Dj
         D9OcxatiQ3QxFXy6p5WcvH80y8Saf3u0HjhXqjnRBw6W3JwstHBOYjX/Cwt+dyMDNtHz
         yLMQ==
X-Forwarded-Encrypted: i=1; AKwUvByTSRrOy2oYHcntUPlH2tvmbR2CH1taM2Zw7wGBy7CfW112IOQmTbVflZJi20IgA2wCM//itEWZhek6NJvJxdsT@lists.infradead.org
X-Gm-Message-State: AFq9FYLx0H0vi0tlfWV5lXSWbwVEdh/xCFDvcJ8KPW+mdRT0UzZ5EGVz
	mfiGZfb5xDY6fPUtX5UPdMBPQQ1Es+Wra2OoMSppmMybMHK+uJ6KadHAdIeZLag5jpZFjOb/anQ
	P7tA8I9CKVLCOrkFm59sw3su9uURFIjvtpOHFN4JvCWwTx5ZnDeu/7yhcBDPfPdBJq4BYyhkUMR
	Y7Fw==
X-Gm-Gg: AYBFou2ZyT2uZstsgK1hfvFG6/rhrjiNjG7dXnYvizE/ErspukDl4HXkJFfTM6OPVQP
	sU4Tl7uBn3Zes61kDDZYOZhlS/KioZJ+TWFJzY7YY+v4+P3bkIi9KnkFkXxhqaMSjJ8jncr5XxH
	2agPqxLRfb+yT9QY5g+tXjIVAtNGhVjWKept/YYSSSeYCeH1Lgf6cCRmgkOay9uRKtp4yn3hF37
	OSWzzKmin/I/CMcCuZJcCTD/HUOT3ZVQ42mfrXfVi5b5E/zGPVREvTouSHYHt8Fc1PkCuyfZoWa
	hhnG5rMJFOeHNxRR2e7AjwawKNoAjHl5tInOn5XxCxDchmcJeKlQ8fOSyzCYUednDEBe8LOAf9C
	IbpjpQyh+4i/p8LK8fe5ipYsryfb6t4V5dg==
X-Received: by 2002:a17:903:2b0d:b0:2e9:4121:2c97 with SMTP id d9443c01a7336-2e9412134d3mr44309415ad.13.1792069173894;
        Thu, 15 Oct 2026 05:59:33 -0700 (PDT)
X-Received: by 2002:a17:903:2b0d:b0:2e9:4121:2c97 with SMTP id d9443c01a7336-2e9412134d3mr44308825ad.13.1792069172776;
        Thu, 15 Oct 2026 05:59:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:32 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:28 +0530
Subject: [PATCH v3 8/8] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-8-5da1096243c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=3289;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=zxv/tOpfYpH+UfjBHNK8c2X83QK5S4h7tBRIAl14o7c=;
 b=umRGGcBDgxVtn4W1eXznIexvSccbCj15fH0VwHEEJtMhEaBMYiOjTww+FRoq2wJqe7zKEVUyo
 k2SJajw0GiSCLxiE66SbskhJ1JWW6nVQk07M+9EvDIAN8ieemIT3Tz0
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX/sqvt+yU9JaJ
 MjPAicDnif9Qfxv8Raqd1oOdIhACa9J+gEQU+u/aNFjVc2Dai7aW+ShEYiNUzlGpOup9Saa3FvG
 bYyLxv2gyypnvil2MLbtr2SxvGeSyykKdyDidwV48B2inxe9aE6zBURUCeNSjMvid2FxwyL6iqI
 Z1EhQZ/0B2CpYmGFF6jO06Y4PICvKEqqs0bXEoosaaQIwbziICuOK1XeQzqvUN1G8Nr1vcsfjiE
 s7SXouTtUsrRAIaFIn83/imF/55iN8B6kpZarudZrARu4xcMWpxauFNuOKxlHEtCAhcSCG1kgwE
 nw3EfKnBsIdNU+qNQ8h6t0AuOkWnoSZMb5HN+w5+e473JKm5ly5ywnVGMnWvPVioCHqJqcZl9C/
 HIhsIHx9XyBrrW1y8CHAILEH0RB4GThMTqNkLRiw+dllaotiZxVlpZiKrL3+Qih9OxDlLSY8zHm
 SP7VmkI3RNQT6VDuOeA==
X-Proofpoint-GUID: yulFKGufpFfFRz5mXX5Itvgnm3Cuke7P
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0ce36 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V8jFpX-JU2fdHFI84kkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX6YK9wXFe/MKq
 eT83X3+MQwmGtX3VwvKTY1xgny5nyxjazIa5vMkF3uZ+H2JHlqQqEW3xImE5UNE9sUYesNxZXeK
 Rnemmzb3q+EJCpzF4MK9OClHq2McUX0=
X-Proofpoint-ORIG-GUID: yulFKGufpFfFRz5mXX5Itvgnm3Cuke7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055935_831995_3C216B1B 
X-CRM114-Status: GOOD (  17.60  )
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

GENI resource management may be handled either through the Linux clock
framework or a firmware-managed performance domain. Source clock
programming currently depends on platform-specific callbacks.

Use geni_se_set_rate() for source clock programming and perform the
source clock configuration from qcom_geni_i2c_conf(), allowing the GENI
core to abstract the underlying resource-management mechanism from the
I2C driver. This removes the need for platform-specific rate-setting
callbacks and enables a common code path across all GENI I2C platforms.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dbe344719b86..4879170a1257 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
@@ -252,14 +251,14 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
+static int qcom_geni_i2c_conf(struct geni_se *se)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 	int ret;
 
-	ret = dev_pm_opp_set_rate(se->dev, gi2c->src_freq);
+	ret = geni_se_set_rate(&gi2c->se, gi2c->src_freq);
 	if (ret)
 		return ret;
 
@@ -1042,7 +1041,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	ret = qcom_geni_i2c_conf(&gi2c->se);
 	if (ret)
 		goto out_pm;
 
@@ -1284,7 +1283,7 @@ static int geni_i2c_runtime_suspend(struct device *dev)
 		}
 	}
 
-	return dev_pm_opp_set_rate(dev, 0);
+	return geni_se_set_rate(&gi2c->se, 0);
 }
 
 static int geni_i2c_runtime_resume(struct device *dev)
@@ -1299,7 +1298,7 @@ static int geni_i2c_runtime_resume(struct device *dev)
 	}
 
 	if (gi2c->src_freq) {
-		ret = dev_pm_opp_set_rate(dev, gi2c->src_freq);
+		ret = geni_se_set_rate(&gi2c->se, gi2c->src_freq);
 		if (ret)
 			return ret;
 	}
@@ -1345,7 +1344,6 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 
 static const struct geni_i2c_desc geni_i2c = {
 	.resources_init = geni_se_resources_init,
-	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
@@ -1354,14 +1352,12 @@ static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 	.resources_init = geni_se_resources_init,
-	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_i2c_desc sa8255p_geni_i2c = {
 	.resources_init = geni_se_domain_attach,
-	.set_rate = geni_se_set_perf_opp,
 };
 
 #ifdef CONFIG_ACPI

-- 
2.34.1



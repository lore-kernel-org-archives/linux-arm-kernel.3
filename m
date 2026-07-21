Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5464FC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=w3LDeS3AOCpYcyq0yXPnB5+a3C
	uix7X+RZoeoRBBLqvdCzdyWRwHVrcKjM2wnk3fkmRuKrBYSCqbchDP7/HanHkv1uxGwIWzQboNwDJ
	LDchzfjrvmhIO78K3p5XjukJG6eZoEVs46zikT7nLu5/qz+IHwbZs6r5fyTf4N2dYs9Ueb+/j0NRB
	QwaYtLR44qzgsIn+3sBCq4yq0TpKmvL3TvaeuPr/PToVMdd2WZihqxV+s9tTpG5Zk41K9NZzTIvBO
	PL7zi4Y94WmhUW/ZhRYNkkQj6fPNMNHhk9YvVS/EdqaAo9NYy3/xqq3zlo/pV7i6uxPQ7u5NZIH0n
	7R7Cl5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcI-00000009XmK-2tOA;
	Tue, 21 Jul 2026 13:34:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbu-00000009XNr-4B0L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMHlc1793860
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=jPc/FU+0Xwyr6zU7
	bUGyesMx57JquvsPFvaYb/49hZZ+ZcMywVRqpik+BsQxZxEz+WZwA/MosIxhuz3b
	19RJiWjFvPidQv4YpNLf7PJr0mH5WKnjDADRSPY89vxvgHHXWZVoApmjRsYUaL16
	xJkSbdRIrJKbcD5p6isfNMoYXaM3YTK1c1HPp1+22U5l8LpQ6JDw6aaQItOxI6n9
	pH/x/ED1DpbCTpMfjI2iM9nbEYuVNjAJqm6+/uhPhKsx4hhuAqxZIvBfkJiEopoT
	MEy8yS3qorgm7iXyF81GauyZrDuHykK2rZjmejKtUwFPgthgn2OqwpF1BCewRKwT
	iI7zQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2epv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so230131521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640853; x=1785245653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=RI8B8zdeH4U2ehAL2HbkFCbL32sXe9wEBXcd59OJRKmclDdMIAMa+B9yPeIdXHpwC3
         +iwyWuDLMEQXMFJCX4+PBs6GmCPk43ENQakKRmnqd/PRtpNaBWBHii7R/xRcJRaYaSGt
         GKHFp9+UJPEqZLfUWC7KutLhFagM6tbXyfK1ng+LY+/ETQ9IKjdODvGv4/AbEK7ALIpm
         4He1HqaQveFAPTUtNDNGcTK6FevY+2sWgKX6elWvRU4f3X9akSMyjjwpuruXs1LORTqA
         rwE6XZG/f74QTGsro4nHxTzzoHSK5V3a0eIHD8uuaFAKACJcJkE/vwgSEeSdzi4auVdj
         pksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640853; x=1785245653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=pNRTrS4dXOgoRH+berFgghNbX8xb/rITb9+G1YOjXyW9/LdOU6gqV2BKYFN1rNen4W
         xfZi7Jtx2hI4WDsC0iF4/MOQv3BdEKfrqocWdGP/fKRurULAUl2WuXiK6iiHnOaunC/T
         0OgHkcEsz3jHlCzOeWw0bkV7oeuuYpW24E+bBj/jFIaLrKEKnP0cU2BupzqnJGBV1bhh
         ts12kQizimXjhP2PnPTj3oHSZhCZHxv2X0UvTFLIzi97zzLp7VoWS0oeoIc/kPp1AZA3
         ec2UJnKIbUZ/TM5tBdNIFyRylngXYQm2QLe6J78kHt3PXX0z+sPz3mtniduzL3chqa9i
         PVHA==
X-Forwarded-Encrypted: i=1; AHgh+RoE5PoSPVB1BZXqMYRvC6bs6CJsPZ1R5eDgIxvOhddMJsAUpem8uhTvc9jkZ66U1F1fTxHZG1o6ugrbJ2lLgRS5@lists.infradead.org
X-Gm-Message-State: AOJu0YxrRdTKGgYKBBQrKTZbgIWr1onBA/J7F7YOeprZ0QvHp/b6dotG
	tQOWGgIayVxpLP+bU0m5jxnbRIaHd5J+yds4zhJzMO5y6eFthSyyAFNsLw0KMWKgrA4QGwc2FAa
	/CR8wfs91K3lqnYW2Ok6wotrtFVMqjMpLW354RAbURL8WQO4bmx1HYzlLmgLlulZpDltz1NPXdI
	fKVg==
X-Gm-Gg: AfdE7ckf1kvQgH3PhkWEIvoXQweoNi+9NaCsUxvoqNa/U+yfvJg4WydzR0Dv5XEm6ms
	CRr2mJh/+FLOSNGNDV9cn2HAdbNFYKE4QY/IhNOaA6z9Ec5xZCJeyXdT24JFu0YxkmJg37ZHZkm
	H3CSirrAAAnq5WwYrOhqtvMxoQKfYhC+3EreEgYitVCRraMKT/H4khSnnp4UlYVnAs8Lsl5Rxtn
	8zVzT0sIwGWGB0RKKZMov8M80L6ujyAbOE32VC6PymzCK6nfbkfhhokHdLUeUDVdtinG+s9ABqn
	x6CqqI6bMcPbQ2420JaX/N1y0m+zhUSvI6lLSBO+80on9UGrQutLmFTQ993z3VSwUprFdLXrSjL
	fI4gRDpFwa9dt4H7QVwI+J0azhKoUmg==
X-Received: by 2002:a05:622a:1b12:b0:51c:167d:b345 with SMTP id d75a77b69052e-5213b146ffemr155608611cf.24.1784640853089;
        Tue, 21 Jul 2026 06:34:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1b12:b0:51c:167d:b345 with SMTP id d75a77b69052e-5213b146ffemr155608001cf.24.1784640852362;
        Tue, 21 Jul 2026 06:34:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:17 +0200
Subject: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Un/B4sUi+B/dVJaFznHoX10XA1vghqMVsur
 E5foyX/j3aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JwAKCRAFnS7L/zaE
 w3PdD/4yYJmvx3O/tU4TNPLja9G//Czlr3VKIyZcL/gBiQ15z/nZiwZVJZE2b5cn6VQ3MFdHhLh
 F52K/+T0ic9z/uRZogZX49SeTr/lUq7JdXkDEMssyLdpfU2dNmRBaGzTUqzB2AaSFf4QWZ6guOY
 UclVrcQCrx+QeQ+BjvcvUNs3/18XjiMNCxThtSou+9yxEPGbwgVUAqMa38fM3jowTf3MztAUPh8
 VdJb6U0/Zsv1avF9LMguUVyvnwQVcTiph03Z7eOZnyzmi6ER5PHLodsNx9FSgQ1Sin+iDnAMvXC
 DQFsEyo6IpuZEp52pzHc0jdFrxEDMBn1QrRqN/5L4+mRJbdBxYBPZaGliHvrhXxGRWl4vVcrDlG
 +fcYSJ14DbVFHyEq+h0EzJHDRxu/UVevpK4zcKiP376myKw5lhkUoa/WZmQbqb3cdoC1Cd53Dgj
 zm9us7ZAKgaaecK6kXjnDHzMRqgfabcWbnaszl/M9Po7whdH6EMNYP5fQ0R8UVQbFZzFeEzDfAr
 1Hg+DVBGZvTDaN6jr3PurtcEcDwQS+RvMb3Zz+epLeQhNaViTarv2BLRdS03Bo4O3sKWUnIjvdS
 LarnQBYMmNBZQvqi+t/Wls1J7kRBflE+NdGj341EqLWcT3zwFOON0oDPpo32KFbFn0HoLUorCh4
 MwEYNV6TRQONrXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7TB319pXGIScbIduMOzC6RqIehghKmrj
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f7555 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX0rz8Axlik5AZ
 xIWsAquTzGq4vGqVwm3eVjKWuIzr5OYHTgtkulIEP6cG6By1qqbz9uPeMIhJx+dzkd44C8PGAxL
 9wexxJutFG1HgnAB3+QvpzeJ2hquphI=
X-Proofpoint-GUID: 7TB319pXGIScbIduMOzC6RqIehghKmrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX4CORLLBMCqgF
 xXN4t9UsRbN4cWh5VrSm0wvqcCMi64ab6b0Z4kOBvPtPyFvc9hOjTP/cdArZULwZNzsSKZGWzMN
 l+yUA1Tjz1bTBfPDdf39tOQEp9F7U8jnfbjzCIDaORKPs0vSi+j3NEGlzWpLG5qKpmn8MZi+30X
 b0QoKpQEsS9iJFJSnIMeTFpZfrhKp4JFbZ2xYQVvHKbP3poGJzHStPkvvfMgoCChDerkDLp3l9z
 YuyChS9czG5h3+HCvz0CEzSUVvaYdBSTRCMH57EoeT01fagE8EtdaEQ01O0kM8w/1ijoCwhExWO
 4BSsce8KD8OsyZ8JDJIQHX67yH+S4T88fLGtKSTuUUvk13Y+KyOleRnKTptO3sNZasX6L3/CxhY
 UlxJJSHfvJ0bDybbntR4k+Z1K5Vrh8ttAJ3T5Jaa+siFyMP4FDav1N/otTjg9Z+YgVaVuiyQwc+
 JaT0WNygDJ9dat7d5yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063415_171085_F756AC20 
X-CRM114-Status: GOOD (  20.04  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index aa4a0b17749081f1ad653424bc265ee81e348e15..4031b4516d6519fc5024bbbcc439500a7b3314b2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3



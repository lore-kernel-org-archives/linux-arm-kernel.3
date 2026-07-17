Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E67FC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=UwUnfvM4l1/DRlZLvvu2qmczKu
	krrZCF7xPYmX19d8K53hQI9PEegdW+BoeAvRtNeB8JT4EBkDtw4C04jsitnS6KJta4ngHtEKoH9ro
	TxdGVTlmBbFaVix2WQ75TDfzWVtRDtUhBrNBUe3w5J4R8kvwsdTg9IifF+S+inXkM7j0GL5gXQHqD
	I8gekOz+PjeFK8dTzgUe7zj6LzpLxGXhuHhMBLtXpzh30J9FqRP/hgnT5DHjhol5qGuvPYk7MaXen
	0QG05TaQ04+7UG1sWnP/0X9J3Oo7IY4tbT1iYCHWq032qSMckQTONJlpl9wYzYhEbltM+hC7FDtVN
	xYNFr7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4H-00000001fui-0rdw;
	Fri, 17 Jul 2026 08:37:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4C-00000001fqX-1xp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cWev851762
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=Gd6NqypytLZD302v
	Qkye35x7Ez4iGwBsGkaOpzVIqSM6n9IMWBmrgmNApXQzSz8zGkX+WD/mspKT5NwJ
	+kmC9KugKd6XrQ4KD3Jw4mN21uF+mgtq1JaCnqQLxHf42eaXUYOhDxzSY19xHm3z
	8eblrpFCprgqAnWlFCRrTdd7z9BplLjyM77gCPOdta7e0TwFy1PtcO04dwhRpthd
	M1tJNDQmVmraqbATsH0y0ujmmHVIRvoLxkKKgvhUFK6Y1+Qu7XjDxfq6Rx15UM/4
	acOYI/f6x/7kpXnqWYiYVvE3Jnz9xsoaGbjUuwECiWG+g+WC3Zzy7lvc2wROAzdT
	v5gdFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p8em6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso11860861cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277427; x=1784882227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=MX+p/igda7Gkh9HClBlRo9xRl0uY4zkepO4Rk6lqd/iuvEKLGicujWrCx3PXRdz86s
         0sby37kUNYhN4M9o29Pf0iOHWHfsmjdA+M73oySYpATcRomm7ph0Ufd+DZg73sb+yjqX
         CObsAC1NxbM7iBRFifT3D7ACSs/fYakVZhl/g5hqKYVp/H604LY2dqbybFO0uYAsZ02+
         uc8Ud/u9uCy8kA902HzMwj3tsdftFYBcKMONWpRV6M5owe1NKAQbem16C9e3KpQ9gDIj
         mK/OZTilJJmtGJFcUFMWme4QsU6NAJsFJjSyan+Tffb6BXHbblJe0bVPdutbaY4bEdVY
         +3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277427; x=1784882227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=JNyxgC8V/RwehQTwrqI2cW5nit9q3mEQEGWU7tIpetVGrs7km5mW8K6kH5tT/0Zzna
         9BJo6mWXLHq4LcaGpqTA0m/hqS6DkHj6Prb4tq5UqLzKfAM/Y1M3wHP2/MFc3lbFFe7U
         6QAPGlrF8pwc4zy5oSDSooDT3UZfSV+UZWr1w7+gM4jl7eCpPNKwMMUdTO5ekNsyQGZN
         iRT0OTL3cjpr1uORRGsWz6xbKeMJ3vMrbDwZhmHp1nXUfYAo8uVSKWGzVZSbYXwgiUob
         Fu8tcAKpn/pNFI2OpLzTXM227HIzOJLck51pw4eZKh2ACKYRHx48KvKYhRjd3bzJk73b
         m+Vg==
X-Forwarded-Encrypted: i=1; AHgh+RoNjUfFOFPI+YB3IXZHJTYpo6XATigmW3g+h2OohDgsrvCM+bnwTaSExeGyy6vwpt4mqfVGS5D44czwDgWKPB8O@lists.infradead.org
X-Gm-Message-State: AOJu0YwabFjtIh4D4vMV7tZgjS6IrRV3Gpk0FEzxE8xU2y/zBzV2rT7i
	HqTrgIGkJDR5XsIzQ0YvRudO17ybzxYT2dVDVkF9RYkKnUrsN+XQ8LVlDS5yDjcID9WIxQmupuh
	+ty0pJeYBBz6Pe4ILpuQ5FEDZxpyPVg77lIVIqrfT11iBl4qaab1DKFDuq/gs90WAtw2CsSRsCe
	dsrA==
X-Gm-Gg: AfdE7cl8HZvzrmbXVfjsdErqrOMB+wZ1xILSyJ4oPgoVOeApAhdY1zNsLlG4n+W6ll/
	AFSOKhgALLKF7WSpiUpTqYQHTA/ktGyZxC1CH3xGnfgUMAzKsi8EyQrR0gjPzxVp8y0xZk2ujMA
	8wXGXNoscbTmNsQPcsCZuJs2FYbvsB4Cz1PwjkxsDd9jY2yBVHaXifdocsevHiM5R5vIdpqQ/L7
	i9LGrY3i0Nmf/T2KyJeq4nOM3QAAMDfAnyqN87ZMrQg4ryOSknmgqI8qquDzp0yVzVBK3y98gcE
	iKclQi9k/FCYhJKBje1m5JOwlSOq6gBgbT2optqJVxI+xiHdmhUKDdxFP9JlPUkuCBwzPsAw6A1
	YDZH+vrbrXyMWmxN/VFp93YKVRu+NFg==
X-Received: by 2002:a05:622a:1f0d:b0:516:d612:d1c4 with SMTP id d75a77b69052e-5213c7e66a3mr12659881cf.52.1784277426924;
        Fri, 17 Jul 2026 01:37:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:516:d612:d1c4 with SMTP id d75a77b69052e-5213c7e66a3mr12659571cf.52.1784277426562;
        Fri, 17 Jul 2026 01:37:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:33 +0200
Subject: [PATCH v22 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-7-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemc0P3SnZ9wy0mPwcL77Z76UG5IdlhsK5Sjk
 xZqGVduK4aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnAAKCRAFnS7L/zaE
 wxwAD/90AXSH9lEsDxj4Nft5qs4JSqVCQo3d3zYtyaA7pli73663N0ILffraQmkUAKEuXJzIOSD
 g2CWzgFUiAKKquupkKpdoEbUz+E9JreWCzh3S8khnVUD4uwPlOBf+cXqCsYj5peNHMdhFPPcEWL
 pbV9a9/W2/XTp3fuZbY9hiiICXIQcWSoZE72j/8+ZJAbpOBOmFsYlsa3LU6+Ij0AhczKZHs3j6T
 dDpugoE9xCC1O85mpfFSNTXb29FVneI+d5W1cnolXjwxe1291mFmyfhA/B9ct37/QFd7rDZ3I8d
 Q2QR7puFiZKlbc5edThli44U/iazMeW7737oRS8H7TpOW5wx4HU5cMl066iguW4GBC9VkbTRFgL
 9YnaODiC3FgMEWPJirJufbeA3ZYvZe1kBUjT4sGWw67FoGBAuZkQWs8RWEp1CU8yUi35NbD2CDl
 Yl8pnBXco/flloL5BxbaOtoAVec0+yMzZdMjOUlfd7Kw1C1lLCmgsuFX6yODNaU0wjGx9IPe/YI
 gq1auddOs9yTTRD/9+bP7OLfY0OTdikVhqTAlGvMlgj8P2pgO6eP6Y+Pmf4Fvj2EvrqAsiEAed+
 K+hS9lc7EHhEiylciEwaUXLryhTP0WDyrOycsb8ZtnmoSxIQ2I+hvqO1sH7l+vrcfq4zacJNzQJ
 dx1R7bRGxy60Bbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: DJXdPGubfH_RGe9dk8dV3LgosNxMXXgz
X-Proofpoint-ORIG-GUID: DJXdPGubfH_RGe9dk8dV3LgosNxMXXgz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX2F1jIZsSawG9
 YiY+GY7G7iyl+kFHIpz2cHEfo1DvkuduWyMr9MiMkL0g5lGfCGFYCVLPxOM/wypYcinKRwfpWu/
 IVrCQlcxXkHCUSXKtpdj+rpC+uyaQoneOD12rycNBgmA0CveuAHNRCrVco+kdjWCagHylfkc/jj
 GRRxdVN+B6N5RApJTBc495qUmmxc3tyrjZCpqkQS11k5xml3wL6JY7F/+5YLBrGSFGnjvg0Ye9O
 L2tjTw+o1pGqu5SSRagkW36raV8N/X+IH8ZXRa4jXDr+5M9dFsYH1pBngVqxOChMfw6N08qqM7G
 ppFgsqmJpMzunGng/LcrHdbq0j1eOAlSGk8MgBQgyNefEQZEy4eUQooAcOmPllGlr9jdCCVLLJ+
 wo/Z3RHc2l2tx3EJ11HqW/fh5In7O22khr/tl5VQpE0Tkc8Zggt7XwoM5u2lHYrA+OKqBuBMEAI
 a3e1wc5U9zGCXjc7oRw==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59e9b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX82KKg9Ao6/iI
 R9RsFb7ftR9K6Z2kPR99veAx00b5agdwFOG9W9Z3tfeB2RrwhN3P/fHRuekq1/hp8brW9QGBZYs
 YS/FsdoQGWUxAfKQQEdoqxeypYP20Aw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013708_630612_4C295151 
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

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated. Make sure we do terminate all
transfers in qce_dma_release() devres action.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 drivers/crypto/qce/dma.c  |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ac74f69914d6175b39ccde43f16269570fbcf715..b52a26ffff5ee733adcf4e8cf8bef75018dfa63e 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,6 +185,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -226,6 +233,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -238,7 +250,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
 
+	dmaengine_terminate_sync(dma->txchan);
+	dmaengine_terminate_sync(dma->rxchan);
 	dma_release_channel(dma->txchan);
 	dma_release_channel(dma->rxchan);
 	kfree(dma->result_buf);

-- 
2.47.3



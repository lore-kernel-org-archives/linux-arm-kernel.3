Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D8C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=FhefPbG059SskDigZhQEpWVM1w
	YPR20zs4MmCPUdSsFY5xVXK9GhzO+TpZ38BgWiVpHrroqUs+xt5elrTsgj6NVH66otHaHjT+awwp6
	NQmNKSztYdcFRPXG86gyfaKuY/namVcEo2tUEffZvr1TjIOco2nKUP7uZPTL9Nc3e/Qm3LHMG4Tmo
	J+gFMu14y7Zbj02nH7hLZOoABUGB3WeXhthx3+DDqiU+CSxH5D3u7cosmS7PDn2Lq/m7KFkuiCT5Q
	8wUGYMXEYvRDLNXaWe2b/1esLNAx0ejFqQEuht4D5JAdPWMDbrVkYZy4kT2eDDEz1/rLnAJQIk8ok
	ganhjmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmww2-0000000EmCW-0QPB;
	Thu, 23 Jul 2026 17:10:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvu-0000000Em5j-0u06
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:10:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NG58Pu482776
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=ebnZ8Og19oSO0yyt
	MeE5Au0Qr0sgRzlfgMFfGQqrF5t3SnmYZI9HSQsDYizxdOH9jKjF5YevQGCvv/EG
	jvdNX8x9iq+NYgtmbPnQI18alH8XkJReeZL84g6cAeZYm8KybmBzAtv1CGvgl5yW
	yjASBY50WwdSdNeoJGeCQe4UKTJjkL0xdVIKYlmSy45O1sVdx6PptI3ZI8HQjVdS
	v2nx9hkLp6myeS6nF7GdFjVwBaSNFT/qrXFXckhqkiLHqyKpHMvpDCLHvKxYkFgw
	Z4wvzTB93n0HL3GF9DgqR+tnbIdr4JFBTNtYreHYSxEictWXNgxrOE07iMKaLwbD
	nfTRBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vg9w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so15436351cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826604; x=1785431404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=PTRCYpRjnakKXTFYshbkBS5QwUC7SY5WQnX7SBxU/hLBUDMvJy8tGGPZ/54QMNwp1R
         iaD9tVGgFpN6q4wYz2roqfwsBq+P8nSokMFckXbEdhIGbwSLFj8YyXdMAEzixpPXiJOM
         SafrkS60cUmnzjQVGOvBydDG+8cD30ZxW8BKihxESjE/VIg9qYLjaZxzIB8fgpHj3Ml9
         IgfHrzJ7d6aesLG7kr49RDgnpLMr/vI29an90HoRJri017iryXwppo+J7V20QV+1NzM1
         EBu5ObSEsOQvQdlWtuYU7f/GEA3PBp4+ht3FxRJs6HUOtm6a4QGBL/m6S8pCY++y+1lE
         ttBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826604; x=1785431404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=eMnskPux3aaDkhT9js4dp9YStaEWOat8MiAuIiJXG09bbmk7MJovObywZnuXaPSKkE
         elpE6mNCx+KfSmIM0EqNq/KFA4sNfiFrtnyn89gsnU6rQwAao05PIFRO+JyCPiEWht3S
         mDUS46pH9ns+X7ZlVMiu6IJWokkxpRR4ESy1birw/7787QJrGOP6Ug7jH21yV9eMWSwM
         qY+szbOc6Z05I58qY+g7bQUxDUqgVctU3bgUJ5najc3yFJssGlbWhL7+W+ixraj0xi8U
         2GrAiDnr/qitE3ZwoByhBUpBxPj7BNpihhDpdieqdxGx1m+l6HDmpgR5XYHqT1aGFfxm
         AbTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4X/UbKzG0Nw0X+l1ZD9Mmt4nGh4/qEabH4NoBdW1T7FwQFtH1HuAaDXsNALhrY3g42WWTDlnn1dhuOOGyu71Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3gpnLQcsirFYQhM3vomtproTvn1ovEYSuZS4xG+DyT2iLo4L/
	oAqm5jFZG+uVUPaIiStr/mybrZgqyf3giZnf3FDLzmhNsvhAMoex7xh+YquCF4ibI+JeovUf+fg
	YJf1NR4FJZFmEbjLNio2YK6FDEWuWrDgBw4SnL79TxX422u+SUXdTG0fOVaYLMkQjvLj/cUJSY4
	3CRQ==
X-Gm-Gg: AR+sD116SYAq562G/3qaIVFv//EHBDObGFRXDQ3dAqMD3mMpj+u8q78xVJXJ2y5u+75
	lyrdGfGXwGpmIexoBQZbC5j0EbkpBQ48smlA2r7vutPb5gXjGS1hNr4q1UnmHu5VHAT56rHz5J5
	46ybmP3pAL2DjP7326P1xxO9fEdGjNWAbzGvXW/dl0/ZkeN4mqCF2a2MuNznjax58CSVmkAtn/j
	qSrkh7q8gfHtT35ACXFe00BzLpfG4JIf4J68+B2MXGuJ9LJ80RDsVv3+iPM9sDYDOR+P388cA1O
	FcArdvSxiO8UhDYbjE8blPn1K6XlGs7vSiN3SiQRgWFkRHxoUPQVT9b6cPdeT8Xlhc3qcO3wHc8
	9icEHVOMYRb6UdLo6hk9KGApD/FZF
X-Received: by 2002:a05:622a:5cc:b0:51b:f563:f613 with SMTP id d75a77b69052e-5283de11072mr36590871cf.35.1784826604318;
        Thu, 23 Jul 2026 10:10:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5cc:b0:51b:f563:f613 with SMTP id d75a77b69052e-5283de11072mr36590161cf.35.1784826603701;
        Thu, 23 Jul 2026 10:10:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:17 +0200
Subject: [PATCH v24 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-11-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrJbewWNT9pp3Iuj5o3JRrVPX68BimOcebxp
 b1lNT8J6w+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKyQAKCRAFnS7L/zaE
 w0keEACQof/cuLvUHKye7tcsrRsQkf3ZRamIThHi+aI6BsMNPxt/AiopzRmZz4ndWpJ+USLZinb
 nDdpcY0tY10kEpyLtN9W5Mnf31qIJFShbhOg7tOrPf5Oy0q5RmoPs3C6oKLCENbLIDOFUIFcnly
 NAeDO3wOzN8MlHHYcf4P6fNgV4JyeUTeaK2ZsFeqX0CFVhQ+K9QlwOQx7qe97dkxM9oPSXRaL3X
 YzwWSqQop2j2ChJbO7+NsaA9KhBPouuHJgLz6l3NmwZxi4qZwvXHIPY4ZU1yb5KkohmMPkbjCHx
 9ajv6adWteDjG9/jLH0Aey6rLjz+Uf3wf0qgOZW7e3WNpbETEopNJ2QS/T0KdQqTyheFU7zrEep
 OlBt3D4vowcpxdZUyqv5vJiqCPdII4+fxArhqEpVRVdlnIn8luBE7WJvaY2LIbgeheC+dTCEI+a
 9NZIAq+6YVGkHPIdA5erDs87gc7cdyOO+X7HOW4hqVyw190PrWP1Xc/K2VfrJv50LyT9c93cIcM
 CVXWZlIPzxHg34xlblv5R2P3sxBtRO3InHnVKa4NSU0rVq373NtJGIaK2v20GG74zPJWLjgWqlm
 4N7P1dv8O/uVfXIavjEX2rHv6KyA7i6qarewiG2bO06plsiDJggI8CzbEGebsBkRdIR9efbLlBD
 GujAj0dlDs/plmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX/AckK07WJIwZ
 J1R7Rp7w0h4U5q7QRTh2jem1dlyeeLqxlPdt7TAeNfOfhmSJ8CnstkquO7HtSpgOz3vhHXOyArw
 2rgJf6V+Nlnd4M5ay0ThsxR3np7vX10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX+wxwa2NPVuOJ
 Il1UkspgbRF9iNX240wU0iGY1vHDB2tdIstYD5CQN7NSnNV3nG0UjbrJyllRenc/YLAe3+h0uL7
 Gnygs25PQ80cpPfL+2p2zCHmjvE5HEeWXWJKHTVgqfVotnkjfrZBNlv6fe8+O1oGp9HwgAaxfKc
 SAh/lYJvkndM9LvnwWbJgxIHpRAtDzKnE/9FQyE4Cw60NjrxUZYr/YfR4lTEf0yP40tWCtkKxDr
 MIhHwHpcEWzV620gY15TvKFbkeA+P/BHy4FfgtJQnhxN5KW30y3ZB9oN0XZ/S6utPgGEGzHnThu
 04hfHZ0jl5Fjca40EK4BYdOKrE474CZb3t+1BjQ1Z7+c5Gk7mbTFsFrGL3ylvb5oXWTUWMm2ciy
 cCnhEJ96XOnEf5jpyrYUDL/Lf1SO/TRcWljC0v8/THMnS3e090swo/xoR5onv1r96VK5i3m1nyU
 j8JievmPGNvl6xEt7+Q==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a624aed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gDyslwhGQYkjSuMDKiPWjZt-lKbbbXLu
X-Proofpoint-ORIG-GUID: gDyslwhGQYkjSuMDKiPWjZt-lKbbbXLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_101006_387665_7CDA87E3 
X-CRM114-Status: GOOD (  14.58  )
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

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3



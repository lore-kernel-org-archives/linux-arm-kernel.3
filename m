Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F6CCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fS5IBVsYa2e0KErQG1aApZysP0c6Drm/Zin4N96y3dI=; b=YKBC7RZb67cTy0mkRjXfTqbpUQ
	W7QzBQ4EILeQbmBxiCQozkKIemy77wJM2/XjwP5BlY/+lRqyqyNEr2jihetpLuIeht4+xpqjKtKh3
	InS1DVSl3t35paBTv0Pe4jdm1MEt+wCRa5zpuWXSZl684SPFz69qxqtcRKJe0RPRmvxu4EAlWfuut
	e3VGur9zgvC2Lxbc0xMj3ejdOnaJadGOhgBSI3jJvjVBMUdxnP1BRglk6NdDcBsLibYRejygWH4My
	StLFJMyrtPn9B1UQIrMSrIQremMvu0I1kItal7RSONO3VjiF/MWhv5iimZaM3lUfYsHIpLeq3AHLY
	/nrQwBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZg-000000021Ez-2YQW;
	Tue, 26 May 2026 13:12:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZP-0000000211U-1763
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsZaE1575458
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fS5IBVsYa2e0KErQG1aApZysP0c6Drm/Zin4N96y3dI=; b=DYHfIrWCRvPDgXat
	C3k7E6eCbibBxjEmfL4JRvoJ+UAqTA+ixYDz4GL7yAztI/96a6cindtr/pwiKWLc
	apTnyppsY8pIb1Z+4j12JFYE5m6dx1M/1vC3j97nSvtHDsLCxIhJOIAgnMjNmw16
	21weRK89WfQ0CLSAzTVlhlOwgHT27ZVzLYxIUO981RVxx5YHGOYQt4JVcaZOW+rJ
	7Z4PZ/A8bZRa28L6rGfqRLBdMbDyVCFc12mVI3fhUWjOBP1SxqipwXKIMNrO9d/+
	HNG+uf/jL+Qxrp/SEtl56W240JAojtTG0evb09pTrnLSvmjLtNYSiWj6CwOtBT1O
	yJTwKg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwv4mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:42 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d77a8f5caso4071961eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801102; x=1780405902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS5IBVsYa2e0KErQG1aApZysP0c6Drm/Zin4N96y3dI=;
        b=CTusqZC652UdUGRO7y9gFipMZJSmJhLEds3Xni1amGQIbKDudoBNsZefRNvI0WOMoH
         sB68A6m9ebeLG7sOAS5hhvY6D150kk90KyXrKCA4uc0LXxPfGD7Q8Q0w0Dbxh5luz9fv
         fL2nL3/FUBhHxay7lCUz8nReS88Gy9nITErGWe2ZYmcInBDgW/dwxfedBFgCqPAzY6Q0
         amrtmKDmMaOTMNNxugpW4x8isUqw+L2pmSH2UxbC6Eaz4fdM5TvixJCw6GwNddWe3Q4Y
         Vm1Ywv75ZJhq7Q571xfqDxoorI4LoaiZjxBwMKfkoxI8LM8vgEv4TcmpB6hQav4iZD+X
         yWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801102; x=1780405902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fS5IBVsYa2e0KErQG1aApZysP0c6Drm/Zin4N96y3dI=;
        b=gCN9Omoa1vfSGKuWwoUXMs0dx9o8hR14qFFlL/ThYhq6gQmqfqE6jnpw+hnUBruUAz
         HmN65GnhjLlmi/7Qv1vbcZTCNQZ7pqAQyEsFVV6WGHmf7veZOKkEbzHgw304DxMg4yiz
         ob5cWQSkg7E0lvudKmkNw+CLMI6k3oo3wlM8zQKp9TZnj3x5+e2aQE/UE1C+/ruRwyyS
         NHSB3eg6V3sx0ED/+x9CC0pKfgMF3esO66BQAtX8JYJT8yzixMbPinH7Tu9w9ITeQCR3
         g5FmpAH+RwlzblFpO3n1Alt5Hs44hxc6NNh5vzV9M8FhVPpsp2/csRi1dvcEvYzFo8dt
         L8jg==
X-Forwarded-Encrypted: i=1; AFNElJ+1/gWJk3KSl+poAq65mRnd5dgIi9jBWLEnbMyDkWvogDmiOtX9idaOgiSZmwe3bbthYhaxMTZlk9zgvr+i3/1W@lists.infradead.org
X-Gm-Message-State: AOJu0YxHTZ2fwfufAaHRPw46+JyhZhV/oreIBUfzuMhUELh5L7EEp/WG
	WoCOlin8ya1nAH0TqAt+Gyj1i/4jH/L661kyCxVBaeCx304hFy1zXCINpFR3XNiiulVa3Bblu9F
	O0l94mD708xuIBX1mmXAwKgPG+/jcrroQldeYLYZsvSsz7u5+97uD9HMPtDsU27lGb6xtyDVG5O
	tP2w==
X-Gm-Gg: Acq92OHRo27lwc8R9tbCz0iNIOqgYu7cS8G6GNn9mzEQe60tJLC6qWSXG5iXmsBYf9l
	OFZCAfmMHxSjXoyWjW2pxRoe5ZLXFxpDirB2NWejWqfMvQbIqOz2v0ozw4U5HzpuguQTtNuKYT5
	mK5CItnc/609jkhNFp9p8rQIfyLwgZb100kBSqA7R9cWErJGY9sFbKgf+j2Qzr5UG4/C7mYntgb
	icZ3u8TKG/rAyK36YmIDq3OUfQhVwhe9Jqj47FLF62Q7JBdUM1TsMx4cuWSS8JXm2RWnUHpNHAG
	6pThcIEyL7BvjFpabT8bbkircdpGHVUBAvXBnnzRIgbPFZ0eikmqYIjsqRw29N1rTPkWnP25jwW
	pK7RerAtDGyBgzE+VIyg1wpehpPuxVboaMrnSJrS6xK/6XVvkfgQ=
X-Received: by 2002:a05:6820:8748:b0:686:48b7:d822 with SMTP id 006d021491bc7-69d7ec669d5mr7214597eaf.39.1779801102042;
        Tue, 26 May 2026 06:11:42 -0700 (PDT)
X-Received: by 2002:a05:6820:8748:b0:686:48b7:d822 with SMTP id 006d021491bc7-69d7ec669d5mr7214543eaf.39.1779801100822;
        Tue, 26 May 2026 06:11:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:59 +0200
Subject: [PATCH v19 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-11-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LBuvKb1KuCRjlB/LWrhUiOm8ZPEYJ6TQ+hit1E8hQ2c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvyYUMx14CV2qOvBEHOWkAID6TiiOEjVKggi
 O/WEdIfs+WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8gAKCRAFnS7L/zaE
 wyRTD/4hg9wYGDDSy818hpIPlgz9BZ8RyHJGOAdVeinF5HhcFxqOgrqpl+6veVx4dZSB1JHkCs1
 +rYVAVniujQFZ0tODiNVro2eRwO/te/v1Y9xuoA7VqETbn72Cvml5+DMnNX4hPIp69aRDCaCcaM
 kFhBEikic9Oz/nRdSZ06OZdjAAWSegIH/Oj4Gvb1pjY73KkzkgG1b6PRmS16ml6kGhjlfXdag+/
 m18+OmiDlkKl+RjyQDh0bNbfhFLbWsS31LeVnF4s6E/l5hEIpJZ90qP2kDNNLLRjAue2v7msYOc
 7xIYWzyPgNgpXHxjlRD0CI6ZeR1MM4G2RQwjgkXOoAq8aLPhPHE48Xjw0EkvqnsAT77YshFKzPJ
 /URjf0hbUIOixGnRUaPMGkdCji2T7/Gt7JWiMK0dUdg2lZ6oqrd0buljm3vOkY78grpuBLKGvNC
 rYsxOKZips4HzMZ/WTH+NcWGIq2lwop+3kXg3XJRFAXZaFRczjoU+ni1xjW/cnfJ3Ppfx9679T8
 opHau7RhCwVUU7h7Z/Lys5VXqPY06561BwwNKvkWD4u64As+hTG+up+vlC6a/2kD3D9wQUbHlBY
 67o/pwLPywx78dKQ223mbKU2nUAHF946vO0fhHzeDNyxSGWHpDci5ELRdaet4csQ3vyL7b+8L/q
 G69dsKySRqClcEw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JLuqPTkQLmn_L1A9R5IEphkvIWc3iYR-
X-Proofpoint-GUID: JLuqPTkQLmn_L1A9R5IEphkvIWc3iYR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfXwE8zHjEaELqc
 Ktycn7L+GNdF3Uf6aN/K1E9qmX3CYOEII0lo7C1BzhXHnYb8/eqNuOQHja3DCbRKXBGFFcSWwvh
 ZVZbuaL2UnYJst8zm/3rZ2VKD/ZYYmBRC/01+8rDMNtVbNGYtlzk1TXjf2EW6sh48KpB+Rxwo9F
 iecs0pF2vylhqJZB2+E05wiCCMPfNs0zla0uPKYxYdD4v78m3kDCe/e3H1TiMAcvV5DB9j70Got
 2N/1qWJuYzSS6tslHfwSu9PbTL4b9p9WIsfi2Pj1LMpfPGAPoUdXPUxXd7y5GdUgHyholswE6Fk
 HVrjFvw1UuW4yatsgnXSsZK4auqKxMfRu4jWbUh6LAGCQUM23jZnXkvH/zFcXr9iAASfN70fe6D
 H2ToZx4B0TxeFR/0TFwgRrjf2KbmJr4uUWxtlMkNdizmcScDTzpYdRwqjPf0Co6k2IezEzzshv/
 D7Vyab2mEtlGX8aJkzg==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a159c0e cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Y9RhJx1ZIj24Qa2dK9gA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061143_354738_DB65B556 
X-CRM114-Status: GOOD (  16.01  )
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
 drivers/crypto/qce/dma.c | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..c2602d35baa6ad3ca5de734de7ff6160ff29567c 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,7 +12,7 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
@@ -27,34 +27,22 @@ int devm_qce_dma_request(struct qce_device *qce)
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



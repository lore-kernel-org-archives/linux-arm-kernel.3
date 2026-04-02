Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B5FCC6B3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=OEvgSnCeu0sGCtRCjbI9at1U12
	1UWoFVLXHQjEeURaRle8K2ERr4IcjSwctXyIkvVtV9qHdR0kc9hyWfk8Z4GWJqP0Q4kyLusRXeQgs
	SBZFHFGIG6+bo4S8ic0W+0A01KsQHHeLUposKMd8lVPhtRlIU8t+Np1BvZnqruZ0iJo5CPVCVtpMk
	sAzlIDQBO5mnwbjPMFzGjWQZ6iaP3VbyzXWG2W4V0xoDfnQg5VvSJAxrKM7wtGKVAqTpp5eeD68/Z
	DFZ3FwEYD//MLeHZ1DbKWqMAOlC9LYAfU/z1LLQ6enVlFEC7p9Jf1FMtFguRHMLC7QV2OetQYPncI
	RDZGLK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSz-00000000O8y-2GUC;
	Thu, 02 Apr 2026 14:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSy-00000000O5a-04Me
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=O3k4/gwUv+FLZ6HIfHqxBGUami
	RFs15vLtZiLu0RJN3cGMqaqJumVCvzt9U8zp63pmIq8oHG7+tdM/qSCU2otVIq0fSVIBP6AnCh7z7
	54INe+fH58QKZnS7ek63471OTCcEXHLdW5XQgRIKlMVPSb7tRcHns2MX4sqtYfwkJMWAuqMjISJkD
	Vq6QEewb1asxglvZ4XmPNDIWWQulmdPhiBk6QGGFokwmn4W3IMN+Q18Aihw/eigcX00FKAnei9NbK
	bhtDS+pdbD0jigysV47oAekj9qj6CjGfjRx0wRQKNuvs9ijfCZGId3Gzz1gOGs/SZK15gVghsTw1y
	xjQ9VXXQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSv-00000002jEw-02VZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BIFE4090887
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=h56kFTWMUlgm4OaU
	6rXGKYNDIfODFF7EZWmThTDcoVcb3kHRX8osbRqePsIdk/90JI+SQn/34ZgADqYz
	2aJcqsq79ghpcUcn6n/84o7z88GxLdiG/ULJi1XHp3O6/jvP1cUAgm9Ya5Z3qI+J
	+2Ukge4IYQPNCtBN/ZQgwBxQmY7XKllup37qKoxZDtCVIGAlPNZgGbfh1xSeeDzC
	82GaG3k4OdM4oYqjwHraTqfBY/PKVVRgAWJTotYv8EpGlpdcTXGtBZIn6k1oI5Ki
	pumzqD+6DNqsTkRxtFXWoe1LKbX6DPzF4tjdn4T2jHrWvWENyow9NyQdjvn6jvqF
	L1lw0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcua9n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509219f94b0so28139071cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141771; x=1775746571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=eOLvIakeBz9wZ1eHuEvjeIN9AqOQQao4qZ5TILOuP30GTm4jypkEalanjcFhJp6vD1
         No6uzGbX7HKYCo+CgrPq4UYYNiTmrsMoRVbE2ln/+QwaarjN2B4bmwWql5bLMGlFSt0B
         7TNc6OmIoxqcuWNrXQyaeyxmoQ3V6M0WAnBvLGGc9VfLNs+RsKnPg4yJBK7DmrfiiL7A
         IKqkJZd1HWg5p17CqX4mic8ULYJFdclobmfxvd74Mft1kHXZzpBe7dsyHQ0aAbUNnciU
         lJ41HQAFH2286Wg2ZK4jwTAEcoKplwa+KYXoLzKdZ7AppDJuEhe+sAnPeNdfNxbqJeRI
         KLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141771; x=1775746571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=ZUXjMaObiDsMMrS6PqLBKeaffdaYB/ATmHhaZyBzZw1Q+0zYIcfkagAsJwdUF1lKQr
         c7C0hZvre5nKyqPGPGBwNInfz/fWwbXEbH05iJRw1aJqSZFqvNNEPC+9NKudF4vTm3nk
         DExsmDgHFW9LSc16o7EYdHjsZgdQ4ktYI5J5vAI/1F3xY8DUDunPzT9nRRx/GwuNN07C
         1GiMr8kCy6lFnbtyBEPz7S98ALVbJDCbE6IAU7lcd/dtSN0hp9mFNyroIe780A9ZXcsp
         XP/JaJg0vVQc0Ml/JmlyAD0Ue2UsvLQHXhD8MDJupB/ykkyJmwhm7klX3F/QnAK9Hdok
         DnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW63rzxKa5LOYPNdhdzj4ay9+/lukSUQtLxtyrvUEwExZas2Pf2cgoUf8hQUuIz7vp4eaaRXAQogkpjiMDqx7Ho@lists.infradead.org
X-Gm-Message-State: AOJu0YxnzA+u4BX1hik8gfyKSFKY6d8dZ1zO5balPn5ApVtochKY/f9D
	dfk03OxOQmSmMYtq+FUGWRau4e+qxeydqbfLG9BEdpOjr5VQGoz6wfnKHK/O9+Xetp2ZVfO320U
	XXBipOCpQBvWAWwdsh0STwowg5axKGHAAWNt/6aRNlnUF9GeCKTH8gHneZ02kEmcGQDOkwhtLsV
	MGCQ==
X-Gm-Gg: ATEYQzy2zfhIN9shGw0sh5iSpWQQXM3z8IiMRv+J5LlL3zdczXx9epKuPENqpjBQn7p
	8nRH+xYEgyRcxm8NLkuiu4rf4kaNHrZnPLSwz1YZvFCFApooCSN/J0RbmJtroZAto5uf8ALO785
	HISCI1tqFBM47pKmmjROKqu8Whoro6gjpGhyevwogAEQasiXvzw5y7+o3Y6mX7Uz5nk/3MSl9MA
	h+uVc4tez5SuuDLznNUeppXr9S16H77MK/SyaVgodo2dw2OhAUlj0up3AAgxi7krE5TGRA3ds0C
	UAJipA9Yf4XSAnVw7mdy7WFY5LvMb4VZspHg9yn7/7zmfdYM+M1EWOazHgwHNUyffm+Rffnu/xi
	uhTUSFxeaS0g3+kGVf3qGDWdtDzAS38SqUM82APJcg1xirQ0RfFR4
X-Received: by 2002:a05:622a:1f17:b0:50b:55e5:ae16 with SMTP id d75a77b69052e-50d4bb2f15amr60483631cf.39.1775141770784;
        Thu, 02 Apr 2026 07:56:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1f17:b0:50b:55e5:ae16 with SMTP id d75a77b69052e-50d4bb2f15amr60483211cf.39.1775141770327;
        Thu, 02 Apr 2026 07:56:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:21 +0200
Subject: [PATCH v15 10/12] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-10-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoN0Jnvqzol//1aftLcHIaS6ZlwSZvrnLYFlU
 mZBU34nMRqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DdAAKCRAFnS7L/zaE
 w539D/9iuXTON0oYTfiow82EhJT647lh+WwVedrhINel04kbhUedgYSrGKONqAPKhsF2rniV2ez
 UYvaRuki8fe0nkKr/yRK/Cd38UxQ9eXck6xk12ZFC/lTER8tQugESXXQd+8ZpugdvNga37jGJBh
 kCOCYtWrdI1upUP3N6qPwXpuvmyKAlnfjm85BrPu/lQHAlpJpxt8sEToCLba/cbVF/NyflfsdoM
 5+Y5vn81JjOXz6yRq121TVSQWlgiD2bAvjfiroHBKLLpg7eGVux95IccKfUwh88hiOhpF3EiXkZ
 D2E4VTyOkK2VZQ3KmBq7yJ9FxOs6bkfWugYHMLictueHXev1vU5Gf/MRnGQYvljKlz4ADnRSgO9
 M8wUecv7z4KGNEBMPryMuQDgSVRVo6n+yD+GMD2IRH1pL0tdNDEh0V/DBYeU6DF++dGhnWwcay2
 LHbfESxUk6kyO/h/CvZf08SSGFd/ihuDY8sBx5zPoqpXdd4Sy95Mmt54lk3abkj/95v34RRd7nH
 rKbLn4AVfHply6+hMV9EEzeuPFN4czJCMJ0dxSQRmG/DkfS21YKDmQ4krQIQc5yz24yD9r/TZux
 D0YZQ3RIjUZYHpgkxkhA9VUyQizSn0HPaVcohkqykPgJaRUHO5FckzqgKMebNAmzZWyvekO5HLV
 58DJjEhSe+gPLEw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfXzYtJ1zUtT8Gb
 bEXimlitEBebca/fUPcS9Dz7RdgNhHCc118ZD3LL9u797pAFtwxOwM0YaD82G7Ds08HzaaiIdAx
 sq4LPOPjG7Kz0PdNo+2m7bFN+eoYJHpfpky7m9EQ4ucOewNi/vc99Bwbp0160PL/Ua7FOCCifaA
 p4M3BXRrMZKkTF/vDmP5ly4O/nxub9Lr71SWHY6820GV6BI40s7nIptCoEIVH5EiMZbBXkGphJe
 mf3husDe1hmtCzraJdbZZ3smTNsvUUb/JJJ/EN0xvFx/Xum+TpznBV92h87DZ2GjgK6aCqhB6xP
 36SleZCSMHwVuAW965ZyzC/pokADZhlY1gdGWsIo/77bqpSGR2pxXJX+RhUryAkLd1gXlSN7uOc
 XnszW5G35cDApH1fA8+k6UtLmETVq7zkkvjxl5XYWXeBABnQMC+/wBOrQLhIsKbVviv+eKf1MDo
 3grf0Nco1WuSptVsEgw==
X-Proofpoint-GUID: y69vhmMtwVLuOe6kDCh08f8tYJ-6vgOH
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce838b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y69vhmMtwVLuOe6kDCh08f8tYJ-6vgOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155613_511854_FDF739FB 
X-CRM114-Status: GOOD (  20.15  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
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
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
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



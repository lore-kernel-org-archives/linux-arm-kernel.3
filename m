Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9965CCC6B3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzcFHoFYJEGJdcVPyt4hoTK+0T/yEzF5fWKBSk8BPvQ=; b=uaCrm+gRk4HVCPv5Wfc7IpYE84
	smZWk8bFu6AJlUs/JVfbgw+INVPgN1nd5+keH6N16qh/Ahlbqibulf1WFfQNAXh2RZg0x9iKRnygC
	fwEO/ilhCYp6AVyr9yb6/7nD+qi7eh7Ni6198FAgbrDXmw/s5cP/DIHMViAoWgHudV1KA0hP6pZZO
	wI5JZ6LCuhOUn8nr5vQwrI2a7cNHEa4iI3e5CBtFnsuCxmCkD460THAoi3MICZBi/jJ/MeTldces7
	Xj5RkAzSLXTR8bVDAw3UmJ/YWgTVbmdD+GZ8FgxpLZy06aCykITTK7nsXo3LB7GbjgzV3KqMmJjzb
	EP2DseDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSl-00000000Nw6-2mkw;
	Thu, 02 Apr 2026 14:56:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSi-00000000NuI-49Lg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XzcFHoFYJEGJdcVPyt4hoTK+0T/yEzF5fWKBSk8BPvQ=; b=o2OuwuALcd8IhrVqIKl2EgoPwG
	18/o+j8qDlV2/9Bhk5QwgogSHG/ZTeOAsu8KeyqGA7sAF4/7MHiQCtOtCkC6qQ60RBVhi3VANVqXG
	S/pzo3sSZ/qctQuLs+bxuW9Q+PhyXHag7bbF5M05lU6iw+vlXUBVympdhDXsOp3U8XIyr65NbzeH0
	+ZhqEwweE7oksIY6uttIHzRPJuEK/TWx+iI51iEr8ua0KSDH1twb1r8ISidX8jo7G3ppHck0Bvm1b
	mxkty/sFs9eBrJXjtj5GjwSZUCQQgej+j2HcO8wcmN6CH3b2+uAKpSJXjofmH+8/xpKrfZlqJQ1JK
	r4GuSulQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSe-00000002jBK-2xGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:55:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632D30BM2798832
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzcFHoFYJEGJdcVPyt4hoTK+0T/yEzF5fWKBSk8BPvQ=; b=e5tPmix3FsF4gawK
	YvRx0n/e9N89XCioJsMplsZQ6zMRfS/l6bca0YXzhHws7mk/hgslE48tjc9Vn0/V
	fkacY4Q1JM8I8dkFG2usPuo/igJqp8wF0HnvZBTva5xrhG2l/4/xHrDPODW92z89
	beh5isSoGZaQHxgIHJAfNK1Vp5qj8UNb2QLxvNbaEOir4suP4I0+4FHLAMbLFJfs
	QTAu6w0+5dwD860HoAskwoh0NcgcqU9uwkjTree80E2kjwL4bco1sH9mU/zFIppo
	eaO31FQURhXPGqbedYuGDYf2gd4YeMAtOkXC9B3TvDtxyu2e5z7mohDL1aGySBu7
	Q+nh8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk4psk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:55:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so42524211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141754; x=1775746554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzcFHoFYJEGJdcVPyt4hoTK+0T/yEzF5fWKBSk8BPvQ=;
        b=iybGkcMPdfP82Tgn/7UajEMEhu1zeamFb4dL7SIn05U4WN/XmSjDKcgKIPAcQOLb1M
         JJzYKrbWzO6B/QAPWaeo5nHYt6TuQ8bF4VYxoFgliD/E7KM2dOlPTResUKpUEHOy74Ic
         I1veIeM0X24o9Kqp2LBh2XTmBQ7oswf+G38DJaKqqCoU0eJbNMlABJfoeeWSgJ/cXSGl
         SrOjryD9XCxU9xLdV24bRWs8BkhSzX1c28I7X01Os97SAOXduVy96UIlXuNY2TFLCZN0
         DiZWEzzFPubhOgYKG8P49+X13DLtDd6q2LcJ9hpMstVdNJsdupPPnOm5hvjnQsgCevij
         STTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141754; x=1775746554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XzcFHoFYJEGJdcVPyt4hoTK+0T/yEzF5fWKBSk8BPvQ=;
        b=oZYLg8Pa91y7XBjsEqCzU8mzoCZ/pzaf+I3AtQ/PTesr/l8yBinFnFqgscQFdEVEBX
         cbSelANLy5XjLFokj7sVr4siOxWoogtrAC0Rv1NWrF0MEdh8HXeJEi/3P/w8nH02atgL
         GfjT4PRdnK/7sDMSP+t2GUPwWVLbksRC1tC3RVA4w1Y+qnpsXDdzLECh+qmTmQIXhvmx
         epsg3PtCNYX6ZRLBHgWBMUpOVnCFgfd2ivL6tJyC7snj0U0WNhsP4SWuegTugGNnYvgr
         +Tb+TnyhVOIlKFdVUxUb67a0UxaCMmWifdmLQK3UTo1Z36r92v1dye0ZuKJo0zMWbt4/
         hsRg==
X-Forwarded-Encrypted: i=1; AJvYcCWjkRuno+Pd8tYcraciAdk5VS7BHc4fjZKRy7JaDunDjg2LiDSI/sbPbjybhGDSz9zq+TnsgAt5hExTJ107aoCK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx28pF2d44bY6knhc5nryCycAXGxbTz9AujMo965PAI1vZoB8Ao
	KSyv7gAVgAuLisoh2lSJs5O1XYHOg01uVxp4/ED1vX40WuwfcFXJrVcNZG3y8sxL1RPIISHmPsq
	bdS3ZKtBsSymnMT72h6TlpJIZWEVcGk6sMmgnaz/3uMNUAt8j3x+fIYkz+Lh5EvKBeJKpbEQDbv
	69hw==
X-Gm-Gg: ATEYQzyudbrsS0NRse0QcKG5nxVdIyTt1hyk3GK3p4gL8hksMy+M1IP+YWJeHQbSk2T
	x2WPftSySscGUaDeRMqKd0XQFQFVpVcD3eMBhxByuwha9daabTbKxeB6r/7WxrKuR5/65gCV+BV
	F4hMu5FJoUAnnCsiv5vjWeaYXfaU2p91AXMwtbP5KOrDO1WJS6QM395034Bxb1TR5juJpFT//v7
	TfJ/nhJRxDbh5GKnktx765eq2DsJY50+UtsUQ9sKdDHwysgW1/n4SgWvLYwyT4kIylCjw7TOymM
	u29UU0wm4+xiRpwYDLrOLua8/uMY3tnpkVQyM86Z5HsIbuA2ncwq0mxqQRpMDHpQDos+6Yyo9u4
	N+JSXmfIbFM2cEbPQOFwvYsXNB2b9W7KAOL721Z8BUHfmSV4Xe0KB
X-Received: by 2002:a05:622a:98f:b0:509:2b02:c1bd with SMTP id d75a77b69052e-50d3bb5d0a1mr126371441cf.12.1775141754281;
        Thu, 02 Apr 2026 07:55:54 -0700 (PDT)
X-Received: by 2002:a05:622a:98f:b0:509:2b02:c1bd with SMTP id d75a77b69052e-50d3bb5d0a1mr126370611cf.12.1775141753707;
        Thu, 02 Apr 2026 07:55:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:12 +0200
Subject: [PATCH v15 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-1-98b5361f7ed7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l/BZlQy4Cse/CAATeumcy5CjMrSkTNNSb0kuuSiKbFs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNreZvKxHX2ktLtp9xgKe1u0M7uAOAZb9Hmk
 dvbJnr8s8iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DawAKCRAFnS7L/zaE
 wxJCD/0TEJo3Um1xN48bpRtM/BxOfyO8dsvr/AGw51z0xocaNg+6z15D8WcFcdI/6sdKxsxAyJq
 EYh5mFKuxJmjvhqr8gBNubTk+O5d8F+KReUI6kP2q+aaHkG38IEfnhi/RZuw55nQ/6kmZPqm0bD
 Wg+uJew51CjkL8PgOgjfiddGdiByC1+IHixZrhTUcfwz9oDS55PQIzACUTPL29zxVAEKCX2LetQ
 3HMDOHEo1nu2idyv7ezsiajyNbHvT98/mF4zNFgL/nbsTOkonJPS49iy6760g9FzM0+Q8KflP7o
 pHy6AMy7foJPjum6TAPUr+j8dfp9BCckMQXNzt5loUnynLg8nlh7CQnqRpVnwhSmmbC/eG2A6RL
 3Qv+7c8Uii7DJLCuSjlo7CisoiB2CNTE44wAunf2uhN0rL+zQr0QN5D8gQoH1tlIHxGwL79BATO
 PYE0KEFbQ2VOHdRwcbd9Lg1tVMOes2UBusq5eFLpegpf7Azmu+utN7Bzzqh0TzSTe9sNWirApRT
 LE2toexWRSr+jRTKnnp3oD8YnZ7YNzof9du0S0U+d7IDOuJnVtCyQCNvVOg/j0cci4MgT8R83px
 tbdhAw5MzcDb7mpAzBV0eVl2nMZw8VAHA3a8HuWlesL6zB2hbiXP7p/xQpUawUEAs+c/pPDGMA0
 zkEpPtKl1I+Uy7A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX5XsEQTHiumB9
 IF+wtrH+gocwLkBI6SBShxGZ6CRZ9BqcqzfX+TLpNVWktUQXqNU6VH8cV5WgWEiIhwSUmI4xBA8
 uRP1vgaDOCddpcYu5zGli027rCXeglQ22huqe2yikvQHEiWZRlSRr8aCerR9/pAV68aB0bi8S20
 WiVMqe10EQe9+wvZuXseraP9ZMAJ7LOeJlLkxam5Wg0c8q0ARLo4NMdv95na10YMdfle0zUFtUw
 mk1zZrfJNKY4IV3jWmBIA+2xVOOezcsAZEbjuqSsWKFJCUEOczgK0ce1AgY3p6ntHCpg03d11cx
 scfvrZyVzLukRIb+eNJRxFGb6ITSfZrBpe37kQcFVwp8o2epYOuCRDFLs+RClQOo5ChFvhekm/N
 Q7L+6FfuqwS2/oI2OwyeGQugl/R9/v7Gt6E7Fq5mMBAHjVhOeUHCsr14pV4wwsMl6bEKjfCsHUP
 wmuZ2fndVCC77zo4Tbw==
X-Proofpoint-GUID: Pr7vuAgPacFOLMm4KJnbyS6UAOqsEx1g
X-Proofpoint-ORIG-GUID: Pr7vuAgPacFOLMm4KJnbyS6UAOqsEx1g
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69ce837a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155557_023121_4207BADA 
X-CRM114-Status: GOOD (  16.06  )
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

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index e3a18ee42aa22f4a749416307b396a6191ce4bfc..d0d55156cd42eab1ed797bd64e8272edf00e1cad 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3



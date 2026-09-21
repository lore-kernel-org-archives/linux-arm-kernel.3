Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AD1C982F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=; b=jF3+3fHKFcVDGvptlrlnGRMloB
	pFDAAnuj48FZbogec1iVv+1ii2NNgmFvf4Ysb1TNl+GKgth9OhIMMQFPKLl5zsKpGDGFHwmmXJZmh
	3NCklxi/0DX7ZANdZJC0S9abP+ARyKrrMTdCAf0ZiNjuz+TMZzocC+mIkrWsBMftvO8Jgf3A2L91/
	VPn6JozHGrSU+0cfCTm3H/B4syHX+PNz0y5xWJFy05TDIwYfONFrzkqPDb0Gs61cvRwnJ48UpAOv1
	KRBSJwYbFPXnIcEdmXmBcUhIdMPJ2/2+BUYbeyoMxk5s+ITrPuY1RjZBeWSVSleAzgIb9uIlJU62g
	p2DXqSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcM-00000002Ahq-3ZNh;
	Mon, 21 Sep 2026 12:59:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dc5-00000002AVF-20Wf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=; b=liRUFG+YEWdJtOlz1bsdHT6Ji8
	/sVy+1AeOYpIpdb1mno5XEnuQGo2cI1JhWc4y8rmA5qUMOgz+mfboMOzgdLlwNsDT/hULi+HbOOsi
	A2xoIz7vnQvDNwx5OuGr+4LkOrTpFbqN5euOPAT7vFqsHsN/9HTFlZbx3rS1awrxbEwG8BSmShyct
	/6eglX6a5X2pyeKvHrM+YAFH2jWB4iA0sNoo0KIXi5vZkK5G8kirqHzWg/c2y9S6sD5PYx0X1SMQX
	tJix20vZRCYSv2hC3BepeQGnFdF/NBHhDTaQpcPb4/cUJEMj5x2Ke1fRv3e1aE6DF9bAdWDBdwdqM
	B+fvSzVQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dbz-0000000CJCe-2NXA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdu41287308
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=; b=jT3eFuSztVi0e+i2
	SbwHg4kOwD7T7T/0jFLOyXg6lgKMRcFXDWJU7M4K9IhfSRAmDrGsI6hf8oanaUzU
	qIpVOcGntXsoNne6PFRCe8f9+AYV/HrM7xwpmFUuu4nCViqpmRz6sFdVXjp+i0lg
	0HX/IQEBvLEwzk4LsIDUySFsQJC7BHrO4nwk8jpFXs0fP8XorSZJSJy4nGZsm8Zp
	Eqp4TCzKsltTVxUDR3ZV1S2vLg2KD5iGqeunU6feczilIsHTSbNRf1ykWXoNTOBS
	Pm18mWNVj4dXUZrUs/wVNNXXhigqTMmpv6plARRUIhuDqc+32z3GNiUhFSniSsMp
	PtggVw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1545-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980989f5030so2350719241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995549; x=1790600349; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=;
        b=TPMYLYoJ785pilxMexEtIt2vtdq1re+800ggdZeV6wlVPM0qkXY9lBMxg4yuO9tuHl
         wrVD9p4wu3eJReSjBpO82V0Jkmm/hbKrWacoDEIJcR/Ql6C2pEeN1puMHyco3Hr6A/BJ
         vNimQBxEIhdOPlCLIv+7E5lfxCoL722sEUGn44SavWkvJjIhq0jVdD6Bt4mkp77tVUxw
         sBj5DyKB1PuNeIe4GLpPGgj110HVd8An7Lin6OmPjza9/qhtDx3zRu8aQ+vQbrLl2nbc
         743yBprcjueJS4Af9DnTP8xdu3hUc4J+xf7g2930x21hlMy8dVoLgeA1EqM0X9LAE5rg
         +s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995549; x=1790600349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=;
        b=Gq4obiWTu6q0CvvvShC2BiVwFAM8hPeQHPsr1kNJ3RojOfZtuUHU+/+u2vMPA+lWgT
         vR0bhnGHcdqgBJX8fJsnesLJLnH3tZ7O4ryIJH31Hm2Q/tWylgV0HuCF5NTegPP0sd4G
         l4eZ+xrAHTO+oLnucHBQtsVgXvmS/7idisy4TIDhzdfqyXzwR1ZH4uI/b4h9OprqHaxM
         ayKC9YCZ/bCX46leAVjx7+aj0aGGAB2Qlz8vrq4//ZXcmzguCXMl/OHqxZouOegtjh/q
         SnoK04O5rbdnPAXj4H8qx6FhcZEEOclhOCb4tfOWgedLjvGpky+ZFkIHvSqRyOtktFuT
         D0Wg==
X-Forwarded-Encrypted: i=1; AKwUvBxNJiEE89DPxOUXdd6soC/CoV4FxReEiczBEaXh0I3jSbGplXEfgpKFO2LHDbKqgo66jpfZomWhyau0fD/syI6Z@lists.infradead.org
X-Gm-Message-State: AFuF++lbLkq9k2Ghdn0NXyzVEeYLdaIaizA8YMPy91KAJlzEMwywmbf6
	lQNcvdYvrX8Vt68B+kDR8EjtdUKBcZs97zmtmPYNSJv3ndzEZIEtU6oa1VLmIssuD7VNFr6h267
	gZlVlCuzPNVvuRXSrckeambZ40bPS4nGQdRgjVONltwIcibis5xHsIFyz/YLXMcmi/I9niRYJa3
	0hAw==
X-Gm-Gg: AYBFou2TmhgaXcc4Zl7LBS/SciJ0IcZIDEzUTi8kpAMT0PV3rDdmmTFxj2MMhj2C3s+
	w7rwF2kESNbNl4EgSYoZhvoRP2fMGMNVpva7asj71K4ei4LUpRFLu87dKYewOyqeMys6yq7jBzH
	DedBot8dTgRRDNtYJMjHd+biOw6Bx9/ElYnfim/TzRPq5xy0D0MmxxQWE3dcKE3a21In64glR+O
	knJ0/LC/Z5XDEB8HWdEgDUtK4Kw0Je/3eDcwPinzehYv1mZ30m3IhssCtvHIo/y5kUKTjxHvlTs
	uIKOZl+VOoScnYCclAOwE3M8PDBB4jfwnIFqaaQA2PseULerREW0jb07tnNBddkCPZWCGSPNQ0l
	IfbJ6cayDJCbeXZeoU/B+KX4xgBs=
X-Received: by 2002:a05:6102:6890:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7a55c28a6ccmr4962277137.16.1789995549283;
        Mon, 21 Sep 2026 05:59:09 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7a55c28a6ccmr4962267137.16.1789995548881;
        Mon, 21 Sep 2026 05:59:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:21 +0200
Subject: [PATCH v8 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-12-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E327Pomf3JKllBCL3eKN9FPAVurkOetH3xJ+MFfA5xM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnzPkzRZxhXl7foHcU+1E5GYUoORYlNL6MAH
 auGzuiarRaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp8wAKCRAFnS7L/zaE
 w63tD/4jVpOnPxw4kGs/0iApyM/Y9G214wzm8NjO9bF+C/1ouSz9dM1BTK1oyNwrr69SLJVjd+s
 V+FaAVwA2GnO6p1UrDqig6sjJ/Fq7+CH7apb50f/we+EjUa3a5fmf7tEnGPrpI8Xh/Ann3eQ1e8
 m+SC2j8pwZyyUBzsyZQunn8IQy5QxbOpEcLpuNLgaIcc/49VraiomKLc4tajB/39lssnRPi6mc9
 5Iv21zNF7mskkNA95VL3f6QvS7lU0TRFn0jpiXDM59gQMb/qcSm3/gwmFMK66Ytm1UZfYOxdfio
 FR13JdjerZeIiZCPa7CvCS5HnYHbxELR5qwhILylAtDWOc90YQyekhX/uooZeP0k2nt8OL1vGEt
 jIL4STRAcIkxGeMod6M30yFsEPOsu1+7MzSG07gUmcoDZ0KNWDM/wc4tz4RafDGZtRL6Swx8n64
 yFBOKytBp1WAQPuLWE4jltZxhesaEIm/khO0u2gVgsGq4b8b2Oqfl+3aEEiDr4BdplFvLWqeq62
 wGZpC2M4rs8tGLVORspQgvTVPuidY1P+tu1zjGZal6Mz+Z8TtEl/IapS+W9ghtPeQmXOqmf1OgO
 Tnj2WgZWGChf9WjMALz4UKB+s59HgcAWPaLbgxuAgav3i3EiAWYsvNNOJOu5CHQuIOHdcFXx6i1
 dwen9plIPcZUxnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX57nFtAY2iizt
 sbIWqY7RGVQd+xTpvIHZfwGR/jXnP1TLG0st5XFqqBT1dxfHrnHV4ElZcxrHQiH/sK30YhkrqPS
 JeOBdbaentjVK0W8IE4ymgBEaIKVabU=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab12a1d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=EhY2VP3nYDlqWzrqXREA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: bmLdBMEAbl7shZZDNz-an8S5fCTdwuZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX1HuIYokyNALY
 otOyPMGkvAdZVz11wm0NtkQ+EIrGfOuoqWa+u9yhEPOA6LaDrc78Yz/L9iWBRLWsHU2burIBqYo
 PDRfhDUQQO2SfW32LtgbZOrYqn3zq295s3d8moPT2QtnelvxyR78/71sbBKgeExqtJsqcHscPoJ
 jI0czQy9vv/wA8JoVAqZBWXu14o29U/DHWOAtIEs6EuizSHmX2M56dqGOqo9AbZXGxlt0xjSasj
 fFWhPQAd6kPWvVdcK59taiaDpB2Nj3lXHF9+ceFvvSKvYc7K+gVlN7qOo4Ii8VvVK2f7Y0EhGjd
 e7y5JfYFswaExPXPZ0yczSFXmkmQ+rEk4NSADAd5UJi7qKDSA89vF4U+9hzFqnJUJDZTsy7m2/N
 M02A07+pC1JMQunsWcFvDP2i9PcJx6TRGS/NNEPYU8jU0G1hym8eN8meDL2aB4L77UYlxmJOe9r
 7GReg7YjWq7oF5E88dw==
X-Proofpoint-ORIG-GUID: bmLdBMEAbl7shZZDNz-an8S5fCTdwuZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_135912_365146_52E5F62A 
X-CRM114-Status: GOOD (  23.05  )
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

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9f703261d7ac6ccde861b8d29626025bcfdbda8c..81c6634e855be23698591da6d3743ef68b516006 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590cc8303854658fd483b7807d2230f..33dfef07e7db2c0488b14c78f098afebf689d013 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..8a9d070935cc87eaf20ae2db25f304cf4b2694c0
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	static const char *const *subdev;
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3



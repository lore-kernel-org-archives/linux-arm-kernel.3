Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B6CD5BB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=kVS8lULZ3EYIiqzzEXKPbnz28m
	5xo1zviINrTem/CtGh8bXRcZhvvDdmCmVnF6n81M1/Q2u1I9azVqdwSz0wY+gMfm19qtxX3HpI1Sv
	5eiqsyEQUVZ9qrnIwVaDkCPL8jMR77WHDbi9SrN7R/ew+kQl0NffIAjOI0N8S2xyjqK2JDmzTmKPg
	r0p0esjTHtBuk/N04jai/Cj46tKh9QtAJjVyNLz+lWnrOiKGrsdqjORjntOBsEY3AYKKjJ2JaaixQ
	0PBcc4UhxEIiDhdZ/7Fxl8pQgn4ZXJxQguyCPcjsWJfeZmk6Oqobv3UxZjn5JM0h8XsHwHQFIZA0s
	LLa88/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ74-0000000B0g2-3RBG;
	Fri, 22 May 2026 13:40:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ72-0000000B0e6-2KcK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=XllpSkHeABPL6KNhKoySEfJeq0
	aVyEHtu2iMPu9YlkactHAYUuasqfkCtgrYbM/6s1l/ztAxAS6+zSmkT6g5mwl3/RYk1lMl6nsVM1C
	6RkjhBnoHt8KnuyDo2v7NZvs0lNpQLYHtUm6ffU28kpFEFSAwrEOH0KFVANd6w7pzWti1zwePqfLf
	tj8/Ukog9QIXN0dwk3fjwbktvH7/s04aXBAWy29ck/yBEWN0YBfCeFkKRLDckDh3t5GcvYplt+Wqn
	0L9Ol3WtESPxNOuik/py2WUzthezzh3CCfePSy4CH/5bQcs9EU4nY96cEWogUNNaHDnpybYWSYEre
	22a4TJ1Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ6z-00000004Tnq-0Vz7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBDOsU777027
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=loxzmJ+F8dCyrSYR
	7Dg7ljkvX446yu9V2U+pR0QIsWFMM3NileByF4whwhNT1IXjGpb9WU3pwtTkb+GA
	rkKm/xIV0ciryNqrrxAngAR0wQBI4EzYvhZ1fYd1NRLSBm7IrizJT7GAiGSfaWdH
	lVGzUe7wWJJOuJNitUDaMGcSAy6cmhV81nhUnXMt4B6ZQcRKsTo+ukFIRTuJ5Bek
	YfsVqyorPD576chs/2OVAvWePmakuvCj3tdpzPtCfDbkeym++CHxLDPmTDyp3Ph/
	esGTKBRC/1kSYhHKOFW47kN2PXuCWvzLzPiNKK6ybRrfndH/wbumbKcbfhIVDW5j
	p2jsdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h3prp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3403e99so82504511cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457220; x=1780062020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=V04BQcZVABJYHNs66hsnODzUmrA068bCpTW9ZsqYrRB7aCt2xXq4frrRHtiwqqe3AJ
         7UuviqGYEvYzOHq453wX8ESVxtmlA91boDcI5HUkwaTUdX+ufa0/rk4BjQ/cWAejcS54
         dg4Un441d0kabx/1K7yGAuynuf5xKl7qYDxhsKEYIF2cC1+0nLKPnx9oNhvRtt2nRBkj
         0IpgMY5KtzMXG7HLdAd2lJ6wb3ie68vUA/GfTFP0RowgBxaAEqY86QnWcmq+qXEUHh1a
         I7wcMD9SLc/pdy3RfTUn7J0y8Y2dZ88zjxjc09fGL3lovpmm85SthrL/nZCk/4rcIf4x
         Gh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457220; x=1780062020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=G4tKGA3LpwrZlur+ir1d1MOoZN/naUEYPj2wNgbZVFA2QFnUYvImxBb4sdESQ4HW+M
         0Jt5cwMM0QWUgFfCOUUC8/V1+BbLkdUKMicNCmCpwh3rISygOvV7vWzK4qoCFeVvoq8b
         64S4P6AVKfS3kd0YxpUlzzInUMcdQe2Zw9rKYblfvEOgdj2q0qwp6qvI3f7dWDQqLGaF
         K42qffdgKx8ufas/l6w7/Ticoq1P1r4235Et0FDKZBkbiPUcLkZ1Z5wa6oFzk1BUgiPy
         S6vHDfxXQNlqBoBvde/g0El+v61Fpc4n2VDJ+P0bbSb0UMET58cGyDgGXf/AOGUImZ0O
         tbaw==
X-Forwarded-Encrypted: i=1; AFNElJ+kzvf9Y3SZ29kTK02SJPsW3NusXIcTVD/acUlgGcUm34UqbNDqZtihwUdl5lO6c13PtsyHwu2xV+5hEk5S5+0H@lists.infradead.org
X-Gm-Message-State: AOJu0YwEEuiCudhtmRx6d5u5lkdhkPZ9QIFEc9oaJ15bG05Io+8ADbud
	leSf7PTUDNDCNFeDEXv2kRHd6XvGrzTmNx0TnKonx287I9VBVPvgGt1mEQi4GxjOHtmGv76ViyN
	cuScurrfYs2iP80xtWvKyGaH+5wdDqTQB/ycZAZl2Zqc7vpiZKD5dKEXLD74k8jzhFE2jXjaSFq
	I8MQ==
X-Gm-Gg: Acq92OFqRhIYOrV8RTM9TTgPPcyDdzZEkFcAWJVXUfdqbkFh18DecoAnKkfHMWnhGXg
	yX/Xl2+q1E8nmS6WFQ7d2nVVoxy0oCkEsjq0WcHbZMlSXJ6pSTZzVRFi9eriSMtp0sh5Dex+0yP
	Lp99fl1Ik1uOUBduAYtxHH1TS8vN9ixBe2kuqn0tDp9h2ivlN/CtrfA5uomlamTPEI88YRh4cRn
	RbrGHU+LmbJnK6ktoh0beARh9VR6Jz3UMNOq4IsHXnoCxnEKaI/iGzgkua2k/g8hv/D1vcGipxY
	DLRar4wjAYx4RckdPIYvVRPuoE2r7mZuxq26dKGgkwWeg1zOwD7CK58TTB75AbMNgEFNueyyViM
	K0I2wUYfPdQBZ8tsbuLAtkhFBdeKiO+9Xv/VMgIpgKLsnSD03TqeittAn3j4p
X-Received: by 2002:ac8:5cd5:0:b0:509:2b02:c1bd with SMTP id d75a77b69052e-516d442805fmr56740591cf.12.1779457220209;
        Fri, 22 May 2026 06:40:20 -0700 (PDT)
X-Received: by 2002:ac8:5cd5:0:b0:509:2b02:c1bd with SMTP id d75a77b69052e-516d442805fmr56739721cf.12.1779457219446;
        Fri, 22 May 2026 06:40:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:54 +0200
Subject: [PATCH v18 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-1-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFyyMyvLLfOOTHigPKtrLIkfFqjpy/Vy1HESB
 YKLV/xlDEGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcsgAKCRAFnS7L/zaE
 w9XEEACBI+WYfAdsUiua0bePagUO7ktC4LRT4cbP1YIPs4CKHpbMR8GPY+M41nEEKYqHYoK2eVS
 kXUAk3LTJiWCPIoZzrtNEy2ney36HCmtBt7yuln5eTzdcrjqrf8C01YI0hCnniB4CQlu4GzkCC5
 ILveBVQ9B77lGzfz89+RS1tx5jtoBtcdVOO4pzNgG2aDmK+Efvsg84bRoEy92CYOZWDp/7eDeVU
 aYwRnFCyKeE8lIjYZt6pS/lZEPRt03Z/YELtvjDq2moubGDEb0BKU+AdoNoqm8IdwbtiCLybHz8
 13nKV+WcfefcCDjxFHa36y/xB7ikS+PTYQ1QcuDGeEywOwobW3ZvyV55XOfNXMXJrN5Gk6RwxGZ
 dimIHmQEp0/HUTc1HlnCZLhVRYZfjrx/RGcvyyYv862Uc0wT92ffexINzv3/WSbF7siR8smt/pZ
 DE7KuF/X74xOGRjs2URJep2zLHeWWbQohK70r0qD3aoQzkgIlDxr9RuAI8M8OPsY70D1PR09RhN
 sLIe38e854qqBne5Yl4k3pMiXQhaclJYTrBrMUVBxuMp09i2IOxXsifKHqeqqlbN3vsx3dA9Udh
 uvdxMg7bEOdCwssfe8gqSXTFZMestJCULF0Cse4mJ6K4+1Qt16N/FdbORA1DUWLmZhaTnYdCFFe
 5sCLfu5SfezeBPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Z6CDkEMXTo9jE8NDepTu2HEtIQGEqk2S
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a105cc5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Z6CDkEMXTo9jE8NDepTu2HEtIQGEqk2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX3z2wTwS/aqpU
 P/ooAXX94rE5z0Y4Z/pJNfAcMcap1jw4QXLXEg8tF6EPLR7wy5tJLcm0rd4wjgBMrFTUqfXcOmT
 U3FyRgM2HMoaAeAAiHUr3cOuxHAptM0/hx1we0xgGpAZYoeoY/RyObSHMVrU57ECRcMgA1PFhXs
 IPPqDmYTcyB91np+pOkN7pIYWaZ+fukVjgneVrHqrC8oeeKZoPmdB5anqQVMgr0BSIiCTrbhSmW
 7hq5czgSb7DQpHUo7tcI+bmTdRIpaswtarJbOqUa56nolCZENZmo1vp0XaJlFElQqbtRHK8nHNC
 zko5/z2i4wzDBTnF+IVWDIZXlKZhVYQUuDpcmWPdjCxojaSrJxwzhHvI1OcW/K7UDLpTVPnTEsp
 eY3KfhvmqrwJO7M0Zp4iPwZBSSfdIIMjqR2sRf7vb2eS5UADycfe1zFvEh78v71eGlRgelDx42a
 v5XcdfO5aHmgTZchMNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_144025_795667_44214EB0 
X-CRM114-Status: GOOD (  15.40  )
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
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
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
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
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



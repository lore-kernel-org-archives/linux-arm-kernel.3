Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03962C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=h26jtmzZTd5VW0n3ySgMvtCqzx
	zKfMSFmU+aG/Sfxne0raDdKqlpN+2uOMfCkv3X/CWZ420SEJW4heTO31I9qF+wF6115vMI6qCePiY
	QCKqzaV3PtpM+JZ/dyR8RTOErC0bJLL1aA1PuPGhS0ITRaKom+HZAmR1diGY9kkw0Ku33wfDmkM5c
	G3hpKBlwm6JfvPvgoRhtHrGr0PedyMWMmbbuWZ6VVgdDU36dyp5OzcN/6ENSN39OnKWfKuHmFGSmE
	QSvExhHv53SaF0FvmJ/bX5pYkgkoMloeDEyvlSAb4TPRgVqJeknaG+sF/uCz4Xp5ke8m1TKSXcqal
	Ar/yFtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvd-0000000Elwz-1K60;
	Thu, 23 Jul 2026 17:09:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvT-0000000Elud-49Ua
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvgpZ4172622
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=BRIiYJkTaFfnRKez
	9LFca34yN9Nfj3m5sF2P56gkbbN9oknSm/E0BbCk9VnxVaFm+K3wQnLChMUqlpBa
	Ow/htXbwIqbth/AzJJJhRtn3x/oQg1pJKGPHhP+JWtmsc4mT2XpO66TLkKhI1MOr
	3g/SfVK8Eals9YmUrtalyfaDqBh17pxmMi4o5QeBT1Hi6+t4L/2XR+LSRFT08ZUc
	yOOaNJBxDcKBxhgJTsVuDeHXkDoIp+i9GVceMifFMS2/rsIeCFwzB5pPluWRr1Dv
	1H50PyMV5PD+1DAhJr6lf4K2342VuUWQoAii7Q8fLCy8QSQXA8avikpjL2U43+F7
	4ojt5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qjncf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso12848791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826578; x=1785431378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=PPxeETB/fldf2fmlotZhKjrkXZy/YKlx1YZjNX2XTHojc0VhTIDodoSDklRiaQhCUJ
         4w2AiKEG+tXxFC2m3l3CHk3keY9cn6+bRwEWHkft5p4o4U637rWYtScLDNVR8nwsQ9/g
         2jcZtZBRgIFDD0vV2hI17K0sfuyGBEONwa+fh7XrGbe4cC0lTcD3gpOqwZf3gafUKC+v
         /ROP7OXCfVhitHwChynTXDGFcg7OQOvmRd+0JGUm7bssVne69aLLJCMbglJ76JWPbpIM
         z5OKtmMWeRIP1uObYKKShqPtR+FNNO7YJd6Ok9bkLnWpqAxncTh9KzG1WjPTk7Sk2oex
         74Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826578; x=1785431378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=Btu2veSphWIaCpuqW3jluezAuSocesSt3Y2uPt6SWcrWqYYHCdaC+uuXQvzLYSzDTh
         rcUixzqK2xbUskgi74PnoQdT5j5wZ85oof2ILpPHbQVB8BEQ1IRJfJPLP69r+MNmJmwd
         pJdk57HHaNK4UIDIzieCN6yXbti5IIOJwl9CfaPzskhlx8Dcc/tW5RSnLcOC+hH4yCkQ
         6alz3vhHE/kMnl0SB9wP2XsDF2x+n/qdgph3c9yhiyZIaVvSbh37406NY9I/F8LaGszx
         oKIZgXOQ3Ar1tgqnJB+36rtPcOp4Ut5WukqpUppSPR72put/ZHHuShtj8K/myBVjLBBi
         LQKA==
X-Forwarded-Encrypted: i=1; AHgh+RqaifpyiUdn553qHyx7TmmMkJRWr8qgW+rx7BxT5USeQQ+EhanxYVBkaou/EzmSmBGrf51pWl356iMjCBGH4RYr@lists.infradead.org
X-Gm-Message-State: AOJu0YzUIfpN+IaWYieAKiR/F6nH1YrOZ0xjCAi1U9YeMODdlgKXIjEz
	LgJEPzfk74ljad4PrFjPn8jIBE+vIiRFqktShEeYR25A3EbxL4sxXXtpruGPgLJJZAAa6zkLSw5
	THhdrYBBSkYLNMD2Q6h1dO5GoLy/9kjo9YB6bHa1+ewhdm1DgY3Z7ncq5J0dyb7vYFCqCeinT5d
	Vn6Q==
X-Gm-Gg: AR+sD13NABR7NTuNM8xA7r2vuRtCPq26s/BNZS4919jBa05kLogOKcmqOTwdaIaiW4b
	/Q0EYEm+9wVElrsWpzLuzj9dKXUG27mVNYTi/HbuPs3wSwwplv1FX40VcBXVxI+TfP1HNaGEKuL
	1HAm6blpCBm29T8GusIFLPSStPdWiU/w4VFeAcRC7ctYgkS1eVikYq6Wa0KPLyh1qYJAVp/T54Z
	PONDcFSUhAOW4PO+81c0GHkeIkPBVZf+VEiqza89M6SFGktf3wwZ46m0FuOnOYZLxy3Ky7dEQ8B
	dZLf1waIEn+FWtMHGpJ+H/KvAMk2RvrWMXujbLLMDZyCSrt4RPyPl8Pw9giLtBAJwlmwLNlCr+R
	hBMNYFzj2Ln0GlgO2FLTK2td6+MTu
X-Received: by 2002:a05:622a:2307:b0:517:146d:2cb5 with SMTP id d75a77b69052e-5283edcea45mr34172281cf.20.1784826578430;
        Thu, 23 Jul 2026 10:09:38 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:517:146d:2cb5 with SMTP id d75a77b69052e-5283edcea45mr34171681cf.20.1784826577854;
        Thu, 23 Jul 2026 10:09:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:07 +0200
Subject: [PATCH v24 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
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
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkq+c6LBTlXt4m7neMwOdfL7vsgLIh7+nkKfc
 DNZ04kVDdKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKvgAKCRAFnS7L/zaE
 w76vD/4mgzkaYL3ZdWpQAtPUlCh/fnXkz4jgHg7jckJ1RsVEWNsBm23V5l3kePvG4QcjSJBhzXi
 GXtJIILk97K5O2f4GQLSAm4UFpNqY7TsCxsx9W7RSb+DeuzrKtmV9me1dezD879KziHuazLJJrQ
 FNm5zBJ8CRuHQKgiXgtciq0FnbV6vTsOqZtStN3VFaTkZNFQOjHecJxdl5ZpaDFNyaff3+juM2g
 QCvAIjcFhtGBqQb7YAion5P0AUKVs3r0/NX0J7XiPjH3tNKY56z+q3zT3shmLrbfyOPLhyKeGS/
 Ecpr9wENWIYKvJK2DRDtFE3MCLV8FuZYUqvDvxIpNvOTpMbzYdmBtYhoVFSPQQBPo2OvJ5dyOIS
 K5GmTrghS0ayU3SxKmWAe23fHFpoEUrJ/8N2dSFAfA9tHGC/B/MUv7qdhcQ7EK2Gxpuumfy3Xgi
 dJ5nka/napQyt//M+9enVm4uPqgrgHpcpt4A6r0Asa0XRybzgGowPMKkgDZzKgHMKKg4TgIzKs7
 p4lt18eMBbr6BrsirF8z4vO763JZUynWVZEvfh6eMwUp4smDmZj5p4EQuQBFFntRvEkRMFtbkDM
 wYWSCTH9IW8ws3sAAL6Dd0JVz+eEdwolFK2LOktJjfWgqX2XAICL86pWHXLBIl0xtK0AZw5i41V
 5EcSVG74U6om5iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXziqrIb+pK3iF
 4bGqAbHdQBBxszmuHi02HAjNUJCP2Uz1EuNReP4QeM40ZJZqLItZvrD3QtpdtDfgmjfdwIWUvKP
 3ccRbh8MHJ1kQo/fm91H7fPTNOLE+gk=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a624ad3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: hyZTdGXxf50ax5AH-aS1sP5yYsPkJRYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX8Bj/MT7YbXh4
 7I4rYP/kMWp+B6s8NgVDhd/j66FS5YpfvNxxDEZRjD0d/JC3jGWbv0ZYClhetGDPvV49i4uLHQA
 PvlXqHFpkSVsWZ2Ic0h/OV2W7U9arXz4qD83dIeOBaJcJmG0P53HslZR+aKmG3lYLkqSNu0TUKA
 mqeRZPR7eh05d9bWNX0/xBLGGl9imd3s1alDshXfEVzaXOMWNqTG/8l9P9dG8PUaLjic7l/TbrU
 Hwxw7STaA44ZUpvM37d+amn81lA51sX697G1ghU44MALY8Z/UvHcTN0FCMXXmSVBpiRe7X1vyi8
 Fua0cQ6mXQPwfKWshdU8Vm8UHOog4MvQa7g8J5ZSzNM3+fmUP5zEnoYrQ4i/alOA1UqkRmwByzi
 dSn2l5gL08DnJk39kpWtrSTjOVf8sNHy+eMG6VreYOwVUBnenwC2mvh1waT6ZMZY8X/mqRgW0Li
 v0OPzbJUjotQlqaFqSg==
X-Proofpoint-ORIG-GUID: hyZTdGXxf50ax5AH-aS1sP5yYsPkJRYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100940_159853_95D5C779 
X-CRM114-Status: GOOD (  16.26  )
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
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
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



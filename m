Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF820C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=; b=ikWvOH/NyfeiC60ngMo8zmBtiW
	q3rPeof0ldPo+lTOFrrAGIW7w32WsXh1PTsq1IRrEo8mxVHC4V3JCKkkEzf6+oOQghupQI/1N56Cx
	89kWM9yeDCo58qz6zxkXhVd7ltucytJM/Qo+CzJUj5mPkz22rafCoWXh+QvJsCfunmC27wK6Rt2DJ
	qU1Z2zPYp/ABYKH/OeTvBNC1hoKrc2dLcjGjboX6F4IU8QaxUNmjo0Xr9ykd0WcIC7+eMvGIxNolS
	R5hVShUw7LB3MEA5zV5UMYSJINT5AzJLEgMO4jj3gGd5+ubh33YEyPYktyURhimKR+rh/1KsNqIn7
	/FOXrZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiZ-0000000FiWU-1BOt;
	Wed, 02 Sep 2026 19:33:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiS-0000000FiOd-0Q6e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0BU2104806
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cozdIoP5Yma
	6q/pF6floHEABg0dCfb++OItRBaIe7/w=; b=QgD99kG0wNh+lPLXjVw0AF8oQHC
	bbrXfNjcM36t7K13gEgas+IHgz/ipLijzu7HwowfH0fez9Uy+9ZbNZf8hmitV5ZV
	4DtmTL4/rV3Y0lsK9gitYztOl6b+6zozAqCjcA0lccusbv8QwBwdczkzFf5NPUcq
	TayVFZVN7X5UuqBkswz0f35DIUFfFjVCdyrO4pmbKxIXiZbOo2FiJZWiBaKouhUl
	Ez+Qq2/BNBOqOTxKHrRvY7IUphHTanNYkgvzfpAUJ5gzGLcv763/YiPPsmdOKCi9
	/zovSKs3FM8OymU9PjQEJsVlrZdAnYceZXH0JZcj2S523Y1xhe2wh+zJQxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsa1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:33:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so3465166a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377626; x=1788982426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=brDdw3m8J+8ovZaDVyaihBamDpufs2hz+Ju8AhLZOjCTyHPr1+h8vDGrsfDGlcFttZ
         rePIyni3RYsB5DIdbjxBY2DTD73G91SA/HFKSP4JK63uHQkPNhSYwQEMDeuM5bEGtU4r
         S+DEhqIVrvPZ1XGVh35NnE+WS4xn77SUSA0Hr4YnHdWc8a5jS32EnwjHeB3fgXE/8A1y
         xeAo/MrkmWB5/U+0wDe7ddLy02I9IajQ94ZTzaRth/zM8ZuU6T3WCeq9rdqp2Gjrp+2Q
         2Y8LqNF+lQt8/6fXvuPrW+VX11ZQdT+dWItlVZ4ADJpMcCgHf/LB7uuI2Aqtl+Gsq7gn
         ztYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377626; x=1788982426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=M9fMg05dklFtUIVr0D/LhnZ6J1SPkgYBb7M/YfIROKTCY/YLziYWRtIJH/vhhJKY00
         MWC7Ko4XMaEnx9FatQtRX4ObEPP2V6m9kzaQrWlXLdtJGAQbmOyBxTMGvcDH+NtgrJhL
         +TN6dofZJqtyEFTVeDGhpiXeWpx6sX3DQmjIJ//c4Ida4UGpqSFsHXa9KHcyYn7ibyU6
         rN1VnFZziKbUHxVTCDQJcBnDvCS6hSvxspgM4TFF5UlBoaLKHfbKIxBSK9Ou6TBh7q1z
         ArmydF4IzXzWHVYoroHkJR9ruA2RPMp+EZ/lvn3JgWp5kW+wUg6xrFS2DJhQnzELqpOC
         SVYw==
X-Forwarded-Encrypted: i=1; AKwUvBxDwW23Q/zCfb39+ROi5HcLT704hFMfxAKOqT3D8eP7p9eSox3JDB2IBbL7kmzSMrLPuQpmXpjN8MYtxuQEQ/vh@lists.infradead.org
X-Gm-Message-State: AFuF++nYzMUM3KDQ11z/MI9eEsDXAtgPZP2xkHKFrDZEbL/8Ez7MlHrH
	MqJV3Rjbhn9Xntl/eb3cbFeMK/zQ1qV1/FXRF6llXVkhaTwG129ZA2cTizi9d2LVIuNvTbZEL65
	vqi1m0x9sIBXOWFrMZFElDw4dp4LiRl42YyK8GzcvjgJN18Psx2GZTl+H8zhvwONpHwAMudHsD4
	SXNJij9M550g==
X-Gm-Gg: AYBFou3AA/bw88O3Lg2n3atRSkmOdU+vG2jbnk2mufCWNiRGBDnflKcoFcUC4ChSkVp
	FOVU79a5bjz0HDFYXH0vkR+5WzvStGB8/LIvrsgCtUe3VMnBmuT2ajm7Ggpod+5bZ29VkXTz0Gs
	My5dNS/MZ0GT5olXQM9Ctt7MteeV6XqXaHOBUphoNAbHcwn+rAG1OhNSd22kMncsiNo4AYYlsR7
	+QrvjBhnM313spGTpmHhslHGFo4/URK5h+/1TSuNAItlv6BWdlybIgZZBNLoRHmfizsbB3+onHV
	DvmYtzyQA+WLxWMrOW5KcLuydMAJG56jbMDM6B86q2mUXfhz75oX20ZyugHmlIgElGLxlOFz8gZ
	y6lydTjRR6yD+uGp1Ej1a+yRyzB8=
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809914a91.25.1788377625938;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809857a91.25.1788377625511;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/5] remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:17 +0530
Message-ID: <20260902193318.1996827-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987a1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PC9_zsTzMDnykp_yU_MA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DRgyEcK1Ixfm8s9Gmt5SE1eaR-awJ7sr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX+05d8UdBk0Y2
 D6iw+c9fa5yW0sSVXz89a2IG7I6e6qXoVPBLkGO+zknfeaWckgZtLOQXD3ZMglhgpVtCpODYOQa
 zB0H7Wq63fiW7Iyys3hl0IXilRNNtDp+0fvv7UvBTNju4vsFBfbGNllQXbaCe2TCrQeqvoLlQjC
 M5M80JBYUVDMtZSDJXQoub9BGVtZsyYDMOBuKN+1bMKKkFCmhXFBFAFYsE+5IkmhaCTevSG3GpN
 OGrprYcmGnmU9nmKpZTy/teYzjnhoJhETxbVt+Rap4m+Y3VpXYTnfeJhKvh0XpHvNx4wlsJYMfx
 DGj0zJWRvSehq9a/7h/5JjX74xIj2DMqoZQnxAFHj0LDkPy0si1Hxmf7jBi479IwRoRLTxzXr6F
 dEsoMYUbGJYQo83kE9nT4ob8CVcEsCtBMKDN+tAth/G3yyU6OHp1+jbnGm6aOtDPm3PC5QRYH7W
 ekJt/T1o3xqGym7x/rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX7vJzT8x+7HJY
 KEQBNbu4xipHEmu6wADxS5/yjsSTHQJxclc0+RjDf5Hp0BXFGL+pdKwk1hKyKnzB7xRXnGbIrwx
 vMMeafHqdMej6uHIVp4YWE2KQXyH7pQ=
X-Proofpoint-ORIG-GUID: DRgyEcK1Ixfm8s9Gmt5SE1eaR-awJ7sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123349_371181_A83C8323 
X-CRM114-Status: GOOD (  17.34  )
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

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically when the device is unbound. Remove
the explicit of_reserved_mem_device_release() call from
scp_unmap_memory_region(). The DMA coherent buffer is still freed
explicitly there before devres releases the reserved memory region,
preserving the correct teardown order.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9751acc2bf83..2a6c286b86a7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1034,7 +1034,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	ret = devm_of_reserved_mem_device_init(scp->dev);
 
 	/* reserved memory is optional. */
 	if (ret == -ENODEV) {
@@ -1067,7 +1067,6 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 
 	dma_free_coherent(scp->dev, scp_sizes->max_dram_size, scp->cpu_addr,
 			  scp->dma_addr);
-	of_reserved_mem_device_release(scp->dev);
 }
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
-- 
2.55.0



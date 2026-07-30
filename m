Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F7C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8y0lJAoP13jgR+kOYEHrpotPr79UnqM6rwBXM92zVs=; b=c5dHKM6oM8E5GC3GLfFClFZNU4
	GylD++ROjtnsntbayJoSQlrH5EVi3gAqvLYwMbylqShUMyyhSWF4de1W6zwWfz4zQBuLiP8lJGeu4
	pt5IzeQm4BMFViy2ui5vaxBP8vLBFJgPnP12GGjAqOrHU8nSGx1Tr7sfATfr/c1q15ZmM/AXbF365
	NMbrbRB82ER85+v2H0BL3iGyw7ll4fhRPWDU5+/zmvhUBSCilxyP5/wPc87gODW19+i/ihTNYTqhg
	HB3peV/QRj5g7ZRDjOn2/H0cYFD4g8K/WI/1p6ddLMgy9SCvmFMz0LU1S1WkVEfR1TXf5UthiYw3/
	nLFbiOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTG4-0000000AwGr-14SZ;
	Thu, 30 Jul 2026 16:05:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTFo-0000000Aw82-38fy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:05:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQn2E731340
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8y0lJAoP13jgR+kOYEHrpotPr79UnqM6rwBXM92zVs=; b=gD56y8s5X6fP1JXA
	/Roy+/9TPOR8JHkyPbPsYdDJq3g9F7yudy6ISFyCqMh786EsH8hGGm3qpxcsw0y1
	80vIeNs/KoL3SlZnysWWcnXMR3E9N7fKGtu+/4vu3pdPUkKEN+1N0bOw2S+7ixal
	TFjLTZbuqlPnnRmNfIV+WNT8iLQzWL2FV6/spHrt6i9tV835raFhJd3aeds1u0uo
	KVvfCSYlEfTYhXPhPZEILnpzUhcVs6JGGl8rsb/r2reyK0ar5JszBay1nLR/YDCL
	xNQDyqo/+qUWBXDhdaDj9oi8h69AemQta2kWWs5dfYXZ8JaOxzyJkwwcCf72qgsP
	Ali47g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8j7rh11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:05:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1eb52e1fso42633361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427502; x=1786032302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8y0lJAoP13jgR+kOYEHrpotPr79UnqM6rwBXM92zVs=;
        b=KBbynS8/o3ZTIBj1VGTPCxI16sVpcfCb9msheDp9BdO7d/mwzdo1/3kNmmjDpgPhua
         GgQwwayybhKaGkR3TsyKQENa1xHl3QHnqb/SBrZQ1N491IehYhrpipNplAVOEayFT8XS
         7yKaQMGr1a3lucYWt0YDHvTHvd/fi1HTnUKPPZmtmQdGRfBnsQRYAgTW8+3j38eQ5o32
         oEPfjNEemp6VjHG/RT/chlr3hjOyoeDOTrRYk0c7jqgnC+Vnrw1rdQJDEBtTsHBD8vc7
         1SskjJmO3FOBIpITwsJnl0aC3Hsio9RnqwQbcQLJAjR2owQT/zkx/P2vLo5457174/bZ
         v3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427502; x=1786032302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8y0lJAoP13jgR+kOYEHrpotPr79UnqM6rwBXM92zVs=;
        b=WDfF6Go7+itPRAXAd2RltuBu79wZ6oWOydT4Hvn1U3KrZG6RB1UszumM7SQ+6Jwyac
         cmTuOg2afe/Jnjc7QyKg8vZs5L3kxWoSLJLhW9t/5lw1fNedPLXG1jNidrDtThbECVaf
         fWFJhjf9FQJxisUEsqCUO0T38c57BnJ8ZTjbJDGdwXhAzC+g6Io4R8RZPbG83MFgqcId
         QHOijxxOPcef9EUCznlr56H/P8cv1+gopTa3mZnbruvQ9OypWjI84PCCUNAUYeV1zZtb
         fCSsjBSSxW6a14ynblu64LpkG3fUfUUvODaiJ7RNKtwtXU+vc86Tz8F0Z0FHEYgkcpkC
         Zmyw==
X-Forwarded-Encrypted: i=1; AHgh+RppXuG0HMy1FFPwym14NP7mzdohE//JpYfvwqsTn++QEio02fW1Oa8CHb9lmbLyc9zzHVPOlgNbQHh+rNtPqHyc@lists.infradead.org
X-Gm-Message-State: AOJu0YwmZ63BQDHjI5fvv8OPEgkDS4GYQChhLQ0cHbwbzU/lTs0nilWp
	J8IRqYLfvJGXPdsiueWLq/TF8aPcUVcA8ed+QjK3BRklehZebWYKv+EvlhMNe88+bSaCV9XPM49
	T6DC/9AnC54Tx1pIhdH6MDao/DpTPcmBQIlQjSFsh/afNai+U+qHV28nSXxKNl9w5vNMnE8/PNo
	hkLg==
X-Gm-Gg: AR+sD10uADZjcgSaWAyrl1HMa+ekfc8mXRbX5g2LSDd7JYsaNEioj+EsczuUkbCRiUz
	rSbfu8Rqbw2Y+a5QylSIW9c5q5QMamYZLkmHtFwU0FPLLIJF7xQOeWkcgOMJe1wONPYBeg0GrX/
	OxA51+lubpCcTwgBZt2AogfdFAkbndAnkai1vuT1lkHMELKuFUtB+A4He1irOX1gTLtWOYOvEvy
	LiBdQHqRTk3oKkY0as4CEH/3dpl4JZN8YAHKrXc41VK2e3ZqHNZ/zng6Oh75VrvjueYkyvjbIRw
	4IPtvqAWreUegPNK7LWMxzE+3gZN1hYDSVJOkVByXc/27hbC/cTJ6LNE4/ASJkHKl4TM8ILmh5/
	fiiWJ5104oUAz/1rm1yePFrIxQpSnFnb4oV6Q2CEVR6x0tH33a7mrgVJlT9csyBgJ8JwR1e0D/x
	gkpjI+8hROA6/rgQ==
X-Received: by 2002:a05:622a:410a:b0:51c:7b12:5fd4 with SMTP id d75a77b69052e-52b38701050mr31840101cf.80.1785427501632;
        Thu, 30 Jul 2026 09:05:01 -0700 (PDT)
X-Received: by 2002:a05:622a:410a:b0:51c:7b12:5fd4 with SMTP id d75a77b69052e-52b38701050mr31839361cf.80.1785427501076;
        Thu, 30 Jul 2026 09:05:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db8a3bbbsm455174e87.0.2026.07.30.09.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:04:55 +0300
Subject: [PATCH v2 2/3] iommu/msm: use the IOMMU device for page table
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v2-2-18e0daf2d836@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <jroedel@suse.de>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3976;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yylnZwZL30zYazuVfjsidUHvHDh1/ZHcvFZVH/q3EiA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa3Yn4LRMmKH2hP112MTUGn1A2CzlJEBLVqtPp
 LAeD7A4P0SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamt2JwAKCRCLPIo+Aiko
 1cx+B/98g7StpIO2hL9jj/qBiRFSU/vSn9xglHxuoBbQMs2HR9pt0gcz+IK/S1FaTLF18Ve5azl
 FsSckp8I/juT6AAQTlIAnG/GRiY3S9omseCRp6S/HQX9Tm/2NWbLGlHfFHREoOWYf2h8kH9Cpdy
 S24hPjqZzJOrpQaZ83gw2tVqAioJmv2JImnoZxeVXw8PX/Hyxf3tIvxrnzmTfgqu2bsehCyjOnI
 XXrx8xa2guRBqdlYxxViI/y16QNfxvHWE/kNTDO0eSewLl0T5BHSiWC6q+/pf2yiiTyZZPm97AK
 ugnCQ0Sk0x5Xtn0oaa7gTExl2M5GkcBVRAHjhm+S3owboOsb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX2C4rM14g46mP
 YOYvZGKyjJTT6Va/J6VKe0iTUmHfQTbEntfvWeCKqJhJnXqHZ5yG0u3NU+LWwaXf6gQZXU2LS3R
 Kotwd83pPgfvUZobCTaksxf1LTJ87R0S7G6fTpHqUL2nlWmF+cUJVbhNIpGSi7EGmNDfxNIsWUu
 VqMu+M4BajaGqiVjiR7b7PriemGqBz9HTmk4aDBo+G7vOyfadOMRXVuJIHdBBte1Mu/9pu43gWU
 YyYR24BjJB68iil1EhvxYGhJWcydnlGPtSu2AXlJdO/TN1GkGZUZxq7S/dP0yDOXdnuvotplKWe
 bqECg1tCbhNmAuWsivMlc36AIGRglZNHy+R8ImQro4b2ei557AM5Iv82Ar/KrAOk9DDis5aPgzr
 CxV4aYVspSZzAAVLLCyRq6TiaLvL9CESC34QlsBZLa4oo6TAj4ONDQxv96bX7HUje77k2TrlnpJ
 mEIZ7txyGcn10LvxXCw==
X-Proofpoint-GUID: iLsKlF3uNf6NhsIT0JwwLWrhI6azdIc4
X-Proofpoint-ORIG-GUID: iLsKlF3uNf6NhsIT0JwwLWrhI6azdIc4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfXytqRgPfFJAq7
 fZ3FkUwpJEUHi1Rp5qkrlB1P461ZTxfWafOAP8kMNt5WeaCGdS/DNzbZVp7pNv1WxOFVXxURAcG
 sj4uM/EL1BpFomlPn7v0LdE+SgiVS14=
X-Authority-Analysis: v=2.4 cv=LraiDHdc c=1 sm=1 tr=0 ts=6a6b762f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qBQ8OOdg5lpXHOzljU0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090504_790941_C452F458 
X-CRM114-Status: GOOD (  20.30  )
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

io_pgtable_cfg.iommu_dev is "the device representing the DMA
configuration for the page table walker": io-pgtable-arm-v7s hands it to
the DMA API to allocate and sync the tables on behalf of the IOMMU's
table walker. msm_iommu_attach_dev() instead stores the client device in
priv->dev and passes that, so every page table is allocated and synced
through the DMA configuration of the device being attached rather than
through the IOMMU's own.

That is wrong on its own terms, and on ARM32 with
CONFIG_ARM_DMA_USE_IOMMU it is fatal. The client device carries a
dma_iommu_mapping, so the tables are mapped and unmapped through the very
IOMMU they describe. The mapping happens while the device still has the
direct DMA ops installed, because arm_iommu_attach_device() only swaps in
the IOMMU-aware ops after iommu_attach_device() has returned, so
dma_handle ends up being the physical address. By the time the tables are
freed the IOMMU-aware ops are in place and treat that physical address as
an IOVA: iommu_unmap() warns "region not mapped" and __free_iova() clears
bits in an unallocated bitmap extension, dereferencing NULL:

  __bitmap_clear from arm_iommu_unmap_phys
  arm_iommu_unmap_phys from dma_unmap_phys
  dma_unmap_phys from __arm_v7s_free_table
  __arm_v7s_free_table from arm_v7s_free_pgtable
  arm_v7s_free_pgtable from msm_iommu_identity_attach
  msm_iommu_identity_attach from __iommu_attach_device
  __iommu_attach_device from iommu_detach_device
  iommu_detach_device from arm_iommu_detach_device
  arm_iommu_detach_device from arch_teardown_dma_ops
  arch_teardown_dma_ops from device_unbind_cleanup

This is reached on apq8064 (ifc6410) when the adreno GPU probe fails and
its DMA ops are torn down.

Locate the IOMMU instance before configuring the domain and pass its
struct device to io-pgtable. priv->dev has no other user, so drop it.

Fixes: c9220fbd7741 ("iommu/msm: use generic ARMV7S short descriptor pagetable ops")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/iommu/msm_iommu.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 109688d69e50..15220d79ece3 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -42,7 +42,6 @@ struct msm_priv {
 	struct iommu_domain domain;
 	struct io_pgtable_cfg	cfg;
 	struct io_pgtable_ops	*iop;
-	struct device		*dev;
 	spinlock_t		pgtlock; /* pagetable lock */
 };
 
@@ -336,7 +335,8 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);
 }
 
-static int msm_iommu_domain_config(struct msm_priv *priv)
+static int msm_iommu_domain_config(struct msm_priv *priv,
+				   struct msm_iommu_dev *iommu)
 {
 	spin_lock_init(&priv->pgtlock);
 
@@ -345,12 +345,12 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
 		.ias = 32,
 		.oas = 32,
 		.tlb = &msm_iommu_flush_ops,
-		.iommu_dev = priv->dev,
+		.iommu_dev = iommu->dev,
 	};
 
 	priv->iop = alloc_io_pgtable_ops(ARM_V7S, &priv->cfg, priv);
 	if (!priv->iop) {
-		dev_err(priv->dev, "Failed to allocate pgtable\n");
+		dev_err(iommu->dev, "Failed to allocate pgtable\n");
 		return -EINVAL;
 	}
 
@@ -400,8 +400,15 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev,
 	struct msm_priv *priv = to_msm_priv(domain);
 	struct msm_iommu_ctx_dev *master;
 
-	priv->dev = dev;
-	msm_iommu_domain_config(priv);
+	spin_lock_irqsave(&msm_iommu_lock, flags);
+	iommu = find_iommu_for_dev(dev);
+	spin_unlock_irqrestore(&msm_iommu_lock, flags);
+	if (!iommu)
+		return -ENODEV;
+
+	ret = msm_iommu_domain_config(priv, iommu);
+	if (ret)
+		return ret;
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
 	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {

-- 
2.47.3



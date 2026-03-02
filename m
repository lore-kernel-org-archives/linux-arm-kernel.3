Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEA6EA4E2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTF3K17Z/loG37nN0J9p8Kv0gzEEsdZss3KIPasgllI=; b=P7s34OC7ovfRDAzcz4am4x9ZCr
	88zx+SkQ+jgnu9cGgV3gshd+T0EJzJoDCRJRH+iJudbYEKO8rHeB3w7xeLeKqMI7wt0sauduW4duN
	q1ZugpVF4j6ae3MofaO71LuiAYurGPFpJgwGpnBI0TrKAjHrQRegI9gh04B531HQDQbV/mSXDpweu
	6tlTwnaJmWEkrDKJNAO93zLlHRPxMeToJVIf+k06nKORgMdbswi1ihIvB8Vg/eLXtQ/Yc3fwSg8Bj
	ZWA32kBMV5g/U3G0kSe2ZLoCk4HrXtZ8I+r/VMv8mSaBhVKMBqiSJ9511Qv/oduW0cQLaKUDZloej
	Zh9IZMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eg-0000000DQ7C-1LVq;
	Mon, 02 Mar 2026 15:57:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ef-0000000DQ5P-00SP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GTF3K17Z/loG37nN0J9p8Kv0gzEEsdZss3KIPasgllI=; b=obD/MAQ5AsbEf+eKaeVIy+jUCE
	bF/ytMsMklNquNDCypJAyQpJ4zdi7KKFk4f7DIC3Ke6efMPWwryp5fL477nje1cGFXrr4ObxLxnvj
	1+T2Ol5YGPDn7wVtxszyyqE++4OQ9mm9LNFdPylj8qKQnFL5ujPGPDv0sfDX59+Fb/e6tHJ5oNAgm
	MYQYBgD0ITQ04FCKHeTtkoizKQqoYUWjtFbQ30Fl2OwTX7Sx7whAIXEuE137gCLktsuZyEy3UZdG7
	hQqR6b9rJjyVdpkXm+f8qu3z8LTwoaxmsDA6c9M631nDb+AjMHNn+bIBh7jJmEEDdd3vZGitqhlWa
	/FjY7DoQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eb-00000000VBo-3OIt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JtWm3742612
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTF3K17Z/loG37nN0J9p8Kv0gzEEsdZss3KIPasgllI=; b=d19viBf9cUd5JOsm
	d/xhsJktuB0bZJ4LhQnmCsU3r8ut0mZSID+FgC9NiO5rJ5Yb63Uibm1a7UVvQ4z/
	AzgX45HW1fh1qgqR6mWazVyx17wIUWQ9+/LoQjZ/8uf8JOfMQChH1Q2p0u/xT18u
	jSJNpyrkS691DqtErOVy0g0iGle5FAS+DzYozD/SITDletOGn0wQlffr7snjKR6C
	BHafayLzonwo+X2pCE0EH3HPtdge4PvEWkX9Syaf9fO4Gp9+WA5BN607hO+Mi9G3
	uKHRs/H3qx11uUudgfkO3Fg6Jb1GYK4j0klNxLat9iyL512dbhyRwMLdknZiCcvg
	qu2q8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trhbbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899ef673d82so28866256d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467071; x=1773071871; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTF3K17Z/loG37nN0J9p8Kv0gzEEsdZss3KIPasgllI=;
        b=JcUy1su2ayX2gm/q/IWeyygWv89aXsHkfDHP8BLfZNC2Am7ELk0DnKnsFiKImSzJUQ
         yy9F2FR6ZdEd2d9shLaY80CUWeV5IV028vKlXGXFVos9uaxQ1kYdT1ra9FTzgbiYHSEu
         3kLu38FUcMS8EvQFwqHJyrnLMxM5Z1uDQM9OrGZt/2kXv1VzJ3tNojDpx01l7+DsfsNG
         dlVq6OpYjhb5M8nHfrs8ZBYdJI/s7VTlY4Pov7LUJBzUwLoMXFG+bCsRhfzhmXDnhHNw
         P5mGNI+NJ4ajvV/hriNih+4ZYWU2Jp7Ko2lh4YTVhD2s2ifoW9EslAr0UpHL9hwxbCfm
         vNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467071; x=1773071871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTF3K17Z/loG37nN0J9p8Kv0gzEEsdZss3KIPasgllI=;
        b=uqyfvf52E46j29PvA6IlYDnT0bUlHNWVDuug1uQhV1Fw/z1eDkWCIB9Lm8irHc6VVN
         E5eZuxSRy7/C8JutcYDgHtlmgzSasKKSmiVKUHcmBh+seqRvoYBmqM3H/LuXNWbG8OjS
         okBj7N9hUCi0JS3Dv/z5zXsoxQ3cFC1jXF5rTkKCxiBsBA8aXri25u5byrrLgBi78laa
         skIk2uOjJy15yxTf19JcMXvH94WOX5oxbkrhVvtxr5rJ6GGa1HkUnxj6s6stezlxBJGZ
         coKJK545Swrq/z+xGNm+zQBmJKD25SMvxORFnMscSJt/XDVEsHdCToeoA7nQfuHBNtCq
         EW0w==
X-Forwarded-Encrypted: i=1; AJvYcCV2+VjoHe4ME9A5gPBXbmcy8xBAJ+kjxRxTRhWDyvC4ipM8Mje8SQ+eFrFgS+9nkT/7M/tA1U35BVJPFmAEIigC@lists.infradead.org
X-Gm-Message-State: AOJu0YyBmO/mkAQwI1QiaHTW2E37yiwsJH8Y+HAst1D/fxsA9IGiNnKR
	UyBMMj6ZUFE/RK13Q6asOGh9X8o6BIP8cLY1i0jbxs3AqQSd9UkezPqQviCsO7ohS9fhg6hh3rk
	339sSqINUuodI4rbVTWDZN5dglg9UAMdHiDJYH7drK5wMCwPoeNMvdQqzylUpT1e36FppjVP4Rt
	VLPg==
X-Gm-Gg: ATEYQzwUL6JIJnSKYyUgOSvm8h9BKIkPuvpAGRXsBFCHiCJM/YeScev3LLoitHU9tDP
	HpZSaR5xVEU85uzW4X6bfi4jhkTEd0ODWyQ8GMGdS5QufoWA+jEHO696o+4X9pP9C4uNr/3Tl8W
	YVvGm3L2XHUqRu5MFvIe+xsA4fI9aLEnm9j7CvjVW5/iQL771YwTmhXYgnC18wP8cCEs9EHUNt1
	OfE4ectLHefIwg9gDuHU57pu/gcxNEaf45YuU7Lsxe/2+o6V6DfL1R7f9cqHIa77kuH0X5TB3l3
	u2wLipAmhIwqEsheMGovsSvzqn2mkJW2jrWWwr6PS+iqEoEyG072+JuOloPUN+zNclcpPz/kNmu
	UrpByOgk2j/9eJ669pcl0SVjw41u4QicRuO/QY3wQLWFykuZ8nV9G
X-Received: by 2002:a05:620a:2a16:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8cbc8f1564emr1570334385a.53.1772467071030;
        Mon, 02 Mar 2026 07:57:51 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8cbc8f1564emr1570330785a.53.1772467070508;
        Mon, 02 Mar 2026 07:57:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:20 +0100
Subject: [PATCH RFC v11 07/12] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=huNQ1yJ9Jt+LKMpc7zrStUQQmAlHoApmhoOAR8Dvs3Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNqkO+K8MdcaL+Iq6maaBsACCQxJZeE48tEz
 jQGa0foWVqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzagAKCRAFnS7L/zaE
 w1yxEACN61b2eBwGFN4Xz7RuHV8ss8EeNNW/vq2TM6zZ/jPXhTyII117kppB3b5qNpaGJz20GnK
 dWRcJ1pJfW7u6bbtUcWyWNYrLj6MsB7qIUUqsE05hJMDxoCgUgCjLudN061h7/2pSF82wKsZTh5
 vkS4PdlDZuq096UVrubrkJX7nTZTERvO0Gr+qrUIDSKTysJcO3aZego6U41L0+ENNLYsviQgSIT
 qCAb0F6j5z8VZLVIOUDslPf/fC24OaG1c2fHMlNmvRHX/Fy1JzCYIW1z+ozscoG6iBFOBZ92mB6
 y4oLivD/Uh/AnB9gjkXUKQ2yG/1kNfXyT5ypqgrYWRZ4WFqcyrySrCWMQZ1Ja5lIDzbaw9tYAXC
 Op7zvDq+Aqf2NqKG0i72xBTtdUHsA5ha9D5mcOfppMIdC2IScKvMB7MUFDtp3DKiQy1WHeIzeUX
 uCSHJ+CJw/qTH6D5yh0ij5kS4ZLEm30P6Ok933D3NY/Ba2yOEj+MxC18vhWK11z4XN/zzSJ03Ve
 cf5JH7UXZnz3dmamrVE08YCBAqLX9pKTjvZ+Y8HVz5klOWx+dZ4YVfVF5DGrmH1YxS/h2wiLBz0
 7a4hRu1ACC15yEpuj7qc7b6Npve2UzyhgUQxfXUlZ2L6RR3chm1ccSZaF1NEtNWoC1PzPz3Qjeu
 0qZ0jHqMtB27R0g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX7KAhOrxYCZjX
 f4T6PoQvCi+k0PPuCVvngj87Y6OJEDTi9gtSncRrKfybgHXyihaSjp0n7HAq49XFpVzGm8ERQQp
 D4FRsLdvIgLBomjmSd93YSDKwphae78CYwcu3c+aMXwwV3Xe4PLtmnyz/irN2ZYehxHFKpz1zB+
 RKHIcPtzaE9sEScltDAZidjHM5YBPoaBSiwmvEp7C/DAYm+308xs6VQS6BxLDpfnRl2yhpiGoR0
 tZ0CFXmZWmXlQCWaut9dTkYwTCTOyZvtc6wJaM9SvNPMgrVhUDtERsp/CtHu/cO0xpCV/tDNQ1H
 SyYbRFz/6CamgZBWP7ICECxCpS5qZW8PjyBBxmkxc2w++edzf+/x7quNHX5zIQleU5MaUQ/R5pO
 fHztAmtzRvxFQNVc5qOyn2HboASohRzgPMF+bZdvps6PRYjtj4wD39IzykqhVWc8E8nc3scqQWt
 rKelbX7lijvMDaLpmhg==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5b380 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mwBPi38BU94uBFWovtUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 4Y-1h4gaLOGooOtRuaUzbGuDUabX4otc
X-Proofpoint-GUID: 4Y-1h4gaLOGooOtRuaUzbGuDUabX4otc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155754_233340_91BC3097 
X-CRM114-Status: GOOD (  19.82  )
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

In order to let the BAM DMA engine know which address is used for
register I/O, call dmaengine_slave_config() after requesting the RX
channel and use the config structure to pass that information to the
dmaengine core. This is done ahead of extending the BAM driver with
support for pipe locking, which requires performing dummy writes when
passing the lock/unlock flags alongside the command descriptors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 3 ++-
 drivers/crypto/qce/dma.c  | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 2667fcd67fee826a44080da8f88a3e2abbb9b2cf..f6363d2a1231dcee0176824135389c42bec02153 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -211,6 +211,8 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
+	qce->base_phys = res->start;
+
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
@@ -260,7 +262,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dma_size = resource_size(res);
 	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
 					 DMA_BIDIRECTIONAL, 0);
-	qce->base_phys = res->start;
 	ret = dma_mapping_error(dev, qce->base_dma);
 	if (ret)
 		return ret;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index ba7a52fd4c6349d59c075c346f75741defeb6034..86f22c9a11f8a9e055c243dd8beaf1ded6f88bb9 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -109,7 +109,9 @@ void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
+	struct dma_slave_config cfg = { };
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
@@ -121,6 +123,12 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	cfg.dst_addr = qce->base_phys;
+	cfg.direction = DMA_MEM_TO_DEV;
+	ret = dmaengine_slave_config(dma->rxchan, &cfg);
+	if (ret)
+		return ret;
+
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
 		return -ENOMEM;

-- 
2.47.3



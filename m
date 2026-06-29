Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943A3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rdfNV8kdNyI49J/Zg3zzIifE1I7KdiUq5fr7IbYoVk=; b=fWGK0+jxS+4i/0X2DIVUNXNBU3
	2H3JjOaC+qy/PwNBLSXm2IAIR7oMJmA0vMIJVcYH4QJkCOZKB2nEP2Ch41F1/duto/hodd8CFLw/l
	iHZCeOi8qYWjwRHePzV1CC2bdnNQsQLl4hFuVCDYAcWoTwHikLQP1/C/qwuHuxlavitrSYRyVvWXm
	L4R+yd8yaF/W8xWwmIHpuiZYCSlMCMHN059ztnFA/Vbl9RImCTYQDOYzWDICrxof1eqXQxfgDvIjG
	dzWn41C2AdWx72hT4wvwGTAUzZZL45+K9Q13TWEVOrQDeuLLbHI/ar8J22siMfL1QZgY0Kel9xF/B
	vbkU6xUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oM-0000000EHUT-0um2;
	Mon, 29 Jun 2026 10:01:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oF-0000000EHOg-01v2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wYKE2391272
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rdfNV8kdNyI49J/Zg3zzIifE1I7KdiUq5fr7IbYoVk=; b=oUiVCH2VignJ5x03
	aHNFjyWSEJZvbTo8b1c+DOb/1xoyho25CDrwmKecpLWjpjuN9/7DBwSqihjnRY2K
	l8I+O/ayzlNIwjMmD37wy7lmFS4UA61vz+BxmF4rStbMmF7F7tOn8dL9OdlZcDPs
	nv0Db4Z6F83Z5bVMfSL6nG59o0XDFkWVD2a+Ht5nOsNJVtZsSNmBhX2fd88hhbhe
	PeLSWlevwzfLDy+URnBIm7nt4Pc1El3w4fPNIgEplcmeSfKa+WBBBZoYoejzVN/g
	BsiANkWjNK1mwYbDSNHolsvohhUEEbdHperMGaYaol4AvPIccPSljJ3vPH6DuIy6
	senI5w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw893t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9693c0b30cbso1548165241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727305; x=1783332105; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rdfNV8kdNyI49J/Zg3zzIifE1I7KdiUq5fr7IbYoVk=;
        b=ZrgzHdaNnEmyBkMSEiYcJx7ksEUy99UKYdmVc71iSpERb1iehOhXuMogaTvOTfV9C6
         ERqDpYckK2bYG3YTrzK8irRaeFdkbgtGIhl1JvAeuaI5yKoQ0TP5JD1gFPviOeVsbLWu
         8Vwrzqz86799+6vAk2SKSuk11olXItMnGxEoJ4JAxE6gcx5J/904WRL2mHA9f6sEZlhW
         rqAlMEsZJFF8cF6Xexx1AOYBO+hFES9xYF3K/LXJwxna/H5j39gIkCikzrZCZMdux+b2
         64wkTdG8uOgEs1BVfRgu16pSEfKXClGl2qRlWTf8pVZdJJk+iocMuq+9ceXpBxm/Crn4
         BQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727305; x=1783332105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3rdfNV8kdNyI49J/Zg3zzIifE1I7KdiUq5fr7IbYoVk=;
        b=j/x2xwxjaus6814McVlFsLFjfkG5IB+PcdE5hAEkW5c4a3W5x1e9Zzvu3dCmmGzrUc
         ct+4O/QARutds+MxixjiqWZEAxDJRawcxSpGdtFXztAkPJ4svP23D1/G5CJG2oS1HU6F
         gr6DGLq1YB3h10sGEiIqWiXPydlY73PltpqpZTqVVz7e2VRfYiJu1gycoXjniJ7HbQfb
         MhqyBHhnzkOWQlBipf2MjCii5MR9pD363KMfgCkwBwz32Lw0oKJWDKMNZ5GtZEptBXsn
         ubRZkRbLVE6WQm5swOKmGxKWb6njCeUkjAIE5wmkYwfE26HNWbJuURDPU1F1RksIDTMV
         /1sg==
X-Forwarded-Encrypted: i=1; AHgh+RrEuCFxTcMqZIRN/snrlvlzaeEYxkic3m1fSqn2UwLotjkd0atzfPbjeBQXtqAU4C/ACu0vsSbUq7V8hZFhEBss@lists.infradead.org
X-Gm-Message-State: AOJu0YyvY3gpsMWYAEeN4TF0HTeP16wm45cLpRXQysvsLq5RvDMvAHNx
	FHeNTokQLAfm9t8HOCNoRQpMG135NhHiLcUA/NsmAmVLoyAnz+AKLROKKP0co93MVhzfMCTY5tp
	1KopSIPjVmbMoMdlGkX+Fe9cYxAOXIps5c09f2T2a0H5UlGw02CRqG0nKVUFhl1J6X+/LjUkVUL
	Tr7A==
X-Gm-Gg: AfdE7cmi4yUwYvIce9bHlJqd4uUAtLtttjuTopp5pF1pCbLIs8c5TJDRf1aiIiw2/pE
	Cjsvb0SlSnhTHkNaJD0EVnfNE7zNZ06GHYQXE8K7czmGYZrwl5BMhsEXe2Gg8dcvQ1zqhAqR2bu
	hxbZLZaGjiGZPkNiyVR65jkw0yLTC/4gYeuA7eZ24xPT7FysCCxz6k7Z2FaQ9t12FW2/iYssGBV
	PJyBBu2MPjx2Zf+26et6Le354XsMgI9OsPoJ/l973Kxf/C7rXp8o2ZKCKaNdcE2or8mcjP0/MDw
	O6M2UeT/h7Y4gL2YGN7WQl7UwxJNy4YlHP9FWx00iwdzV6OmJY8Eq/4f2Mq01YXSaeolA/6Hill
	iDIIrTLyXsKc+oAK5E9FB7bPosE7wlxTvCe8xRFC6
X-Received: by 2002:a05:6102:50a0:b0:738:472f:2caa with SMTP id ada2fe7eead31-738472f54d2mr1923972137.9.1782727300244;
        Mon, 29 Jun 2026 03:01:40 -0700 (PDT)
X-Received: by 2002:a05:6102:50a0:b0:738:472f:2caa with SMTP id ada2fe7eead31-738472f54d2mr1923878137.9.1782727299604;
        Mon, 29 Jun 2026 03:01:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:08 +0200
Subject: [PATCH v20 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12080;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iGMhQdgZHzPFXIWzlLjeXFA8PmsPJCQ6+aFhjAm8b+I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJtvNFRcHmBKk3FL4gE0gnzgc7VaMva0IUr4
 gcQIKpKKuaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCbQAKCRAFnS7L/zaE
 w6c3D/0RrCr0TvE/i0o8u1ik8gQZ5QjPuSPpmJZKyAz7k9thleDVZWnHFWPKwxzGgQPD7q0rhQ4
 f6xOJsyPypR+MqCk1iv6pcEEGbB/I76r0dUplCN6iY9ft+n2qVxlAoDw/yFUQwTZd0TU4JVD0Qa
 V7djBp6lbjWysq8RMA0RYi/ptBv/9obJTrS7dxgRC5CWcU6Bg9pJyBbmFJSgnnAJ4NqNB0PbOfG
 +Zi77q91A28OZ8oN8LUrSMNS/b4evl+BiiokmNDjOvQQLSNO2HrqNwp4q3cohxZqUk23uDADYmM
 /LTwtwv3fSZtJGnL1Rd+r994o35/pb3okmzfpmX4ZypR4EfCEsZLnTlDT7WVEZCUVKICkGUmrW1
 FzKynVXUOJva+zfbfqZ2IfEPn0XhaChLWOCEtdl+O3hKxRGyVx3dd2enWSjs1bUCG5LNTa+Cl38
 FjqMlNQIPQBywMdBcBew9UQxywNpGYjCClCpGFgdVozJqiNMSHKYV9DaKE3pEpgeYjCHP8J6/vL
 g3txXPks09ke+6mNTIpAtOcOrlKrgKmcFOqYT55jG/ykw/nkOzXHDrKMkTAbFQKw8yf+Qb8ZhQP
 iUKQSSzNWsWRbKpiB32NH0HtqKE5eqx1G0AMfy813BCFEuSCv36t4pr19Oy59zSNq6VyZpcTnJ2
 REKE1hjUIULsJag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1y0PF3DqbhI+
 iARmoDNgMM3wUtSKj5zHrNpn36s/R1DOem1+4bw2OMKQaSS4iK/scD9Co13bebZu9ow0FU8/fNu
 c4ykybAkapV9p407n3e5GfjaOc9vP5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXxkgQm0fVeMay
 P98vlZxP5exKBkJ9f/WYwGCCOQXIKGw4wg96QSz0nVBCj87yG6miUos17OeI9ui4/hgzEgMjBWt
 +YzbfNJ2E1kLcHsS7OMEi6+Eh3yUl2iAlTMeeqvdRrFzbp+ZBWbrPxHtRSNSxmAkh0bXtAMDEmw
 yAqom1K6IuEmTqEB230PZEgrnFYZpLEyEEHxbMBqmBu5uI9v+ZlYkhRPg99HJMOxmMXZIoV7VLc
 0RhNz0YFTDsmnJBER6UqnieNdk6TCXIdmoesWq/8hUb/nQw+eJ80hgbIFkxx9zJaSHsj/kW/2uU
 2YVdnq8Pf4TNx6PxZ5tphXRyT7X3sPdBOpsEoHh//W4t1DEMqhqksyiuP4mtYqEJuEYfYAh3MUK
 Oo/B49z3izt1sHdnY3zVuAS7dhxFTA8kCLlNO+cfuGZxpKBKrSOlzIreOXX5zUL/94er7dz05U7
 G50BZ8XdGfG+bZ8sQ+g==
X-Proofpoint-GUID: HUwmmoX2F8Jb3D7vKKbqNpAJbzl9X3jf
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42428a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-0mtKZB-VTZit_Rp23UA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: HUwmmoX2F8Jb3D7vKKbqNpAJbzl9X3jf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030147_072699_CE6E7201 
X-CRM114-Status: GOOD (  26.21  )
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

Add support for BAM pipe locking. To that end: when starting DMA on an RX
channel - prepend the existing queue of issued descriptors with an
additional "dummy" command descriptor with the LOCK bit set. Once the
transaction is done (no more issued descriptors), issue one more dummy
descriptor with the UNLOCK bit.

We *must* wait until the transaction is signalled as done because we
must not perform any writes into config registers while the engine is
busy.

The dummy writes must be issued into a scratchpad register of the client
so provide a mechanism to communicate the right address via descriptor
metadata.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 189 +++++++++++++++++++++++++++++++++++++--
 include/linux/dma/qcom_bam_dma.h |  14 +++
 2 files changed, 196 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f3e713a5259c2c7c24cfdcec094814eb1202971a..f4f258994264a234f60debd3e66e31a6b35d1dc5 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -72,6 +76,10 @@ struct bam_async_desc {
 
 	struct bam_desc_hw *curr_desc;
 
+	/* BAM locking infrastructure */
+	struct scatterlist lock_sg;
+	struct bam_cmd_element lock_ce;
+
 	/* list node for the desc in the bam_chan list of descriptors */
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
@@ -425,6 +433,11 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
+	bool bam_locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -638,8 +651,10 @@ static void bam_free_chan(struct dma_chan *chan)
 		goto err;
 	}
 
-	scoped_guard(spinlock_irqsave, &bchan->vc.lock)
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
 		bam_reset_channel(bchan);
+		bchan->bam_locked = false;
+	}
 
 	dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt,
 		    bchan->fifo_phys);
@@ -686,6 +701,35 @@ static int bam_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
+static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
+{
+	struct bam_chan *bchan = to_bam_chan(desc->chan);
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_desc_metadata *metadata = data;
+
+	if (!data)
+		return -EINVAL;
+
+	if (!bdata->pipe_lock_supported)
+		/*
+		 * The client wants to use locking but this BAM version doesn't
+		 * support it. Don't return an error here as this will stop the
+		 * client from using DMA at all for no reason.
+		 */
+		return 0;
+
+	guard(spinlock_irqsave)(&bchan->vc.lock);
+
+	bchan->scratchpad_addr = metadata->scratchpad_addr;
+	bchan->direction = metadata->direction;
+
+	return 0;
+}
+
+static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
+	.attach = bam_metadata_attach,
+};
+
 /**
  * bam_prep_slave_sg - Prep slave sg transaction
  *
@@ -702,6 +746,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -757,7 +802,10 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
-	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc = vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc->metadata_ops = &bam_metadata_ops;
+
+	return tx_desc;
 }
 
 /**
@@ -802,6 +850,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
 		}
 
 		vchan_get_all_descriptors(&bchan->vc, &head);
+		bchan->bam_locked = false;
 	}
 
 	vchan_dma_desc_free_list(&bchan->vc, &head);
@@ -859,6 +908,15 @@ static int bam_resume(struct dma_chan *chan)
 	return 0;
 }
 
+static void bam_dma_free_lock_desc(struct virt_dma_desc *vd)
+{
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct dma_chan *chan = vd->tx.chan;
+
+	dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	kfree(async_desc);
+}
+
 /**
  * process_channel_irqs - processes the channel interrupts
  * @bdev: bam controller
@@ -919,13 +977,23 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			 * push back to front of desc_issued so that
 			 * it gets restarted by the work queue.
 			 */
+
+			list_del(&async_desc->desc_node);
 			if (!async_desc->num_desc) {
-				vchan_cookie_complete(&async_desc->vd);
+				struct bam_desc_hw *hdesc = async_desc->desc;
+				u16 flags = le16_to_cpu(hdesc->flags);
+
+				if (flags & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK)) {
+					if (flags & DESC_FLAG_UNLOCK)
+						bchan->bam_locked = false;
+					bam_dma_free_lock_desc(&async_desc->vd);
+				} else {
+					vchan_cookie_complete(&async_desc->vd);
+				}
 			} else {
 				list_add(&async_desc->vd.node,
 					 &bchan->vc.desc_issued);
 			}
-			list_del(&async_desc->desc_node);
 		}
 	}
 
@@ -1046,13 +1114,101 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
+{
+	struct dma_chan *chan = &bchan->vc.chan;
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg_init_table(&async_desc->lock_sg, 1);
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(&async_desc->lock_ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
+
+	mapped = dma_map_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	if (!mapped) {
+		kfree(async_desc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(&async_desc->lock_sg);
+	desc->size = cpu_to_le16(sizeof(struct bam_cmd_element));
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	return async_desc;
+}
+
+static int bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_async_desc *lock_desc, *unlock_desc;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
+	    bchan->direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	/*
+	 * Allocate both the LOCK and the UNLOCK descriptors up-front so the
+	 * operation is all-or-nothing: if either allocation fails we free both
+	 * and run the sequence unlocked rather than leave the pipe locked with
+	 * no matching UNLOCK.
+	 *
+	 * Both are queued in-band around the currently issued work: the LOCK is
+	 * prepended so it enters the FIFO first, the UNLOCK is appended so it is
+	 * the last descriptor of the sequence. They are loaded together with the
+	 * payload in a single operation so the engine executes LOCK, the work
+	 * and UNLOCK as one ordered batch.
+	 */
+	lock_desc = bam_make_lock_desc(bchan, DESC_FLAG_LOCK);
+	if (IS_ERR(lock_desc))
+		return PTR_ERR(lock_desc);
+
+	unlock_desc = bam_make_lock_desc(bchan, DESC_FLAG_UNLOCK);
+	if (IS_ERR(unlock_desc)) {
+		bam_dma_free_lock_desc(&lock_desc->vd);
+		return PTR_ERR(unlock_desc);
+	}
+
+	list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	list_add_tail(&unlock_desc->vd.node, &bchan->vc.desc_issued);
+	bchan->bam_locked = true;
+
+	return 0;
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
@@ -1064,9 +1220,23 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
+	/*
+	 * Wrap the issued work with a LOCK/UNLOCK pair exactly once, at the
+	 * start of a fresh sequence and only when there is real work to lock
+	 * around. On a re-entry after a full FIFO, we see the BAM is locked
+	 * and must not add another pair we simply continue loading the
+	 * remainder of the same locked sequence.
+	 */
+	if (!bchan->bam_locked) {
+		ret = bam_setup_pipe_lock(bchan);
+		if (ret == 0 && bchan->bam_locked)
+			vd = vchan_next_desc(&bchan->vc);
+	}
+
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
 		return;
@@ -1191,8 +1361,12 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct bam_desc_hw *desc = async_desc->desc;
+	struct dma_chan *chan = vd->tx.chan;
+
+	if (le16_to_cpu(desc->flags) & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK))
+		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1384,6 +1558,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..a2594264b0f58c4b2b1c85e243cad0d5669c26dc 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -6,6 +6,8 @@
 #ifndef _QCOM_BAM_DMA_H
 #define _QCOM_BAM_DMA_H
 
+#include <linux/dmaengine.h>
+
 #include <asm/byteorder.h>
 
 /*
@@ -34,6 +36,18 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+/**
+ * struct bam_desc_metadata - DMA descriptor metadata specific to the BAM driver.
+ *
+ * @scratchpad_addr: Physical address to use for dummy write operations when
+ *                   queuing command descriptors with LOCK/UNLOCK bits set.
+ * @direction: Transfer direction of this channel.
+ */
+struct bam_desc_metadata {
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


